#!/bin/bash
export DISPLAY=:1
PIDS=()
Xvfb :1 -screen 0 ${RESOLUTION_BIT_DEPTH} &
PIDS+=($!)
sleep 5
openbox-session &
PIDS+=($!)
k4dirstat &
PIDS+=($!)
x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
PIDS+=($!)
cd /root/noVNC && cp vnc.html index.html && /root/noVNC/utils/novnc_proxy &
PIDS+=($!)

while :; do
  for PID in "${PIDS[@]}"; do
    if ! ps -p "${PID}" > /dev/null; then
      echo "An essential process exited, restarting container"
      exit 1
    fi
  done
  sleep 1
done