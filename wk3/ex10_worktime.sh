#!/bin/bash
# setup env var for term1
PS1='coding$'
TERM='xterm'
export TERM
export PS1
xterm &
PS1='testing&'
export PS1
xterm &
# open firefox with url https://online.uts.edu.au/webapps/login/
firefox 'https://online.uts.edu.au/webapps/login/' &