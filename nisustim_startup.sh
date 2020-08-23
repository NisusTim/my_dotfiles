#! /bin/bash

### BEGIN INIT INFO
# Provides:          nisustim_startup.sh
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: user-customized
### END INIT INFO

TRUE=0
FALSE=1
ENABLED=${TRUE}
DISABLED=${FALSE}
DELAY_FOR_SESSION_MANAGER=5

function cmd_exist()
{
  # "hash <cmd>" for performance using Bash
  hash $1
  # "commmand -v <cmd>" for compatiblility using POSIX
}

function is_proc_running()
{
  pgrep -x $1
}

function float_cmp()
{
  local bool=$(awk "BEGIN { print ($1) }")  # 1/0 for true/false

  return $((${bool} ^ 1))  # reverse for bash true/false
}

# key binding daemon.
# launch easystroke detached, if exist but not running.
function key_binding_daemon()
{
  local cmd='easystroke'

  if ! hash ${cmd} || pgrep -x ${cmd} > /dev/null; then
    return 1
  fi

  ${cmd} &
  echo keydone
}

# key mapping <Caps> to <Esc>
function key_mapping()
{
  local cmd='setxkbmap'
  local keymap='caps:escape'

  if ! hash ${cmd} || 
    [ ${keymap} == "$(${cmd} -query | awk '/options/ { print $2 }')" ]; then
    return 1
  fi

  sleep ${DELAY_FOR_SESSION_MANAGER} && ${cmd} -option ${keymap} &
  # or "xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
  # reset key mapping to default:
  # "setxkbmap -option"
  echo keymapdone
}

# brightness adjustment.
function brightness_adjust()
{
  local cmd='xrandr'
  local tgt_val='0.8'
  local curr_val=$(xrandr --verbose | awk '/Brightness/ { print $2 }')
  local output

  if ! hash ${cmd} || float_cmp "${tgt_val}==${curr_val}"; then
    return 1
  fi

  output=$(${cmd} | awk '/connected primary/ { print $1 }')
  sleep ${DELAY_FOR_SESSION_MANAGER} && ${cmd} --output ${output} --brightness ${tgt_val} &
  echo bridone
}

function main()
{
  key_binding_daemon
  key_mapping
  brightness_adjust
}

main
#tmp="${IFS}"
#IFS=$'\n'
#$*
#IFS="${tmp}"

#vpn reconnect
#VPN_UUID=$(nmcli con | awk '/vpn/ { print $2}')
#VPN_RETRY_TIME=2 #how many seconds until you retry?
#MAX_RETRIES=30 #how many time will you try before you give up?
#nmcli con up uuid $VPN_UUID
#SUCCESS=($? = 0)
#while [[ (!$SUCCESS) && ATTEMPT_COUNT -le MAX_RETRIES ]];
#do
#   sleep $VPN_RETRY_TIME #it just keeps on trying
#   nmcli con up uuid $VPN_UUID
#   SUCCESS=($? = 0)
#   ATTEMPT_COUNT=$((ATTEMPT_COUNT+1))
#done
