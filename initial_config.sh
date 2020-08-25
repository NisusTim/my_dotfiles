#cmd_exist() {
#  echo ${1}
#  return hash $1 2>/dev/null
#}

pkg_exist() {
  res=$(dpkg -s ${1} >/dev/null 2>&1)
  return ${res}
}

echo $(pkg_exist sudo)

#if $(pkg_exist bison); then
#  echo "\"sudo\" is installed"
#else
#  echo "\"sudo\" is not installed"
#fi
#if $(pkg_exist "bison"); then
#  echo "\"bison\" is installed"
#else
#  echo "\"bison\" is not installed"
#fi

two_lt_six() {
  res=$((2 < 6))
  echo ${res}
}
#two_lt_six

lesser_than() {
  res=$(($1 < $2))
  echo ${res}
}
#lesser_than 6 2

#if hash python3.7 2>/dev/null; then
#if cmd_exist python3.6; then
#  echo "python3.6"
#else
#  echo "python?"
#fi

#file_exist() {
#}

# .bashrc
# 1. place ".bashrc" under user directory "~"
# 2. source it

# gnome-terminal
# 1. import "gnome-terminal-profiles.dconf"

# tmux
# 1. install if not installed
# 2. place ".tmux.conf" under user directory "~"
# 3. close all terminal and source ".tmux.conf"

# nvim
# 1. install if not installed
# 2. place "init.vim" under "~/.config/nvim/"
# 3. launch nvim to install plug-in and apply

# gcin
# 1. install if not installed
# 2. apply it, set gcin as new input method

