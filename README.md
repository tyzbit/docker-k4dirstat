# Dockerized K4dirstat

K4dirstat running in a docker container with NoVNC to figure out what is taking up space on a headless server. 

## How to use
```
docker run -it -v /place/to/mount:/data -p 6080:6080 tyzbit/k4dirstat
```
Then open a web browser and goto
http://<server-ip/dns>:6080 

You can set the resolution/bit-depth using the environment variable $RESOLUTION_BIT_DEPTH. The default ix 1600x900x16.

## Credits

* [NoVNC](http://kanaka.github.io/noVNC/)
* [Original docker-novnc project](https://github.com/paimpozhil/docker-novnc)
* [docker-baobab](https://github.com/jessedusty/docker-baobab/)
