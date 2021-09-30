#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 ${RESOLUTION_BIT_DEPTH} &
sleep 5
openbox-session &
k4dirstat &
x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
cd /root/noVNC && cp vnc.html index.html && exec /root/noVNC/utils/novnc_proxy
