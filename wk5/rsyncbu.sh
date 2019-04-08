#!/bin/bash
# Simple backup with rsync

# SOURCES and TARGET must end with slash

SOURCES="/root/ /etc/ /home/ /boot/"
TARGET="/usr/local/backup/"
LOGFILE="/root/backup.log"
EXPIREDAYS=100
RSYNC="--delete"

#SSHUSER="user"
#SSHHOST="hostname"

### do not edit ###

`/bin/date > $LOGFILE`

if [ -e $TARGET ]; then
 LASTBACKUP=`/bin/ls -d $TARGET[[:digit:]]* 2>> $LOGFILE | /usr/bin/sort -r | /usr/bin/head -1  ` 
fi

TODAY=$(/bin/date +%y%m%d)

EXPIRED=`/usr/bin/find $TARGET[[:digit:]]* -maxdepth 0 -ctime +$EXPIREDAYS  2>> $LOGFILE`
for EX in `/bin/echo $EXPIRED`
do
  /bin/echo  "rm -rf $EX " >> $LOGFILE
  `/bin/rm -rf $EX`
done

for SOURCE in `/bin/echo $SOURCES`
do
  if [ "$LASTBACKUP" ]; then
    INC="--link-dest=$LASTBACKUP$SOURCE"
  fi
  if [ "$SSHUSER" ] && [ "$SSHHOST" ]; then
    SOURCEDIR="$SSHUSER@$SSHHOST:$SOURCE"
  else
    SOURCEDIR=$SOURCE
  fi
  `/bin/mkdir -p $TARGET$TODAY$SOURCE` >> $LOGFILE
  echo "/usr/bin/rsync -av $RSYNC $INC $SOURCEDIR $TARGET$TODAY$SOURCE"  >> $LOGFILE
  `/usr/bin/rsync -av $RSYNC $INC $SOURCEDIR $TARGET$TODAY$SOURCE >> $LOGFILE 2>> $LOGFILE`
done
