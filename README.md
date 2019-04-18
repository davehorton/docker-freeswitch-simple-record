# docker-freeswitch-simple-record

A simple freeswitch application that answers an incoming call and records it, mainly useful for test purposes.

To run with default options:
```bash
docker run -d --rm --name record --net=host drachtio/freeswitch-simple-record freeswitch 
```
To jump in to a running container with a freeswitch console:
```bash
docker exec -ti FS1 fs_cli
```
> Note: you can also jump into the container with `/bin/bash` instead of `fs_cli` to get a shell prompt.

This container supports the ability to configure the various ports Freeswitch claims

* --sip-port the sip port to listen on (default: 5080)
* --tls-port the tls port to listen on (default: 5081)
* --event-socket-port the port that Freeswitch event socket listens on (default: 8021)
* --password the event socket password (default: ClueCon)
* --rtp-range-start the starting UDP port for RTP traffic
* --rtp-range-end the ending UDP port for RTP traffic

Additionally, it exposes the Freeswitch log, sounds, and recordings directory to the host.

An example of starting a container with advanced options:
```bash
docker run -d --rm --name FS1 --net=host \
-v /home/deploy/log:/usr/local/freeswitch/log  \
-v /home/deploy/sounds:/usr/local/freeswitch/sounds \
-v /home/deploy/recordings:/usr/local/freeswitch/recordings \
drachtio/freeswitch-simple-record freeswitch --sip-port 5038 --tls-port 5039 --rtp-range-start 20000 --rtp-range-end 21000
```
