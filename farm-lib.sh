# Functions for ANSI color output
# Arguments are passes to echo
# The color is restored to normal after the output

echo_red () {
	tput setaf 1; echo "$@"; tput op
}

echo_green () {
	tput setaf 2; echo "$@"; tput op
}

echo_magenta () {
	tput setaf 5; echo "$@"; tput op
}

echo_cyan () {
	tput setaf 6; echo "$@"; tput op
}

# Traps

set_trap () {
	trap 'echo_red -e "\nUnexpected failure, terminated!"' exit
}

unset_trap () {
	trap - exit
}

# Include configuration files

. ${confdir}/farm.conf
if test -f $HOME/.farmrc; then
	. $HOME/.farmrc
fi
