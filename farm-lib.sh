# Test how to output ANSI sequences

if test "$(echo -e x)" = "x"; then
	color_echo="echo -e"
else
	color_echo="echo"
fi

# Functions for ANSI color output
# First argument - text to show
# Second argument (optional) - switches for echo command such as "-n"

bold () {
	$color_echo $2 "\033[1m$1\033[0m"
}

red () {
	$color_echo $2 "\033[31m$1\033[0m"
}

green () {
	$color_echo $2 "\033[32m$1\033[0m"
}

yellow () {
	$color_echo $2 "\033[33m$1\033[0m"
}

blue () {
	$color_echo $2 "\033[34m$1\033[0m"
}

magenta () {
	$color_echo $2 "\033[35m$1\033[0m"
}

cyan () {
	$color_echo $2 "\033[36m$1\033[0m"
}

# Traps

set_trap () {
	trap 'red "\nUnexpected failure, terminated!"' exit
}

unset_trap () {
	trap - exit
}

# Include configuration files

. ${confdir}/farm.conf
if test -f $HOME/.farmrc; then
	. $HOME/.farmrc
fi
