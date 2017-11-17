# ez-rtsp-server

Build and dockerize [ez-rtsp-server](https://github.com/EasyMile/ez-rtsp-server) (based on [gst-rtsp-server](https://gstreamer.freedesktop.org/modules/gst-rtsp-server.html)).

It spawns an RTSP server listening localhost on port 8554. By default, a single, dummy audio+video media is served on URI `/example`. The URI may be overriden with the `--path` argument. The port 8554 is "exposed" by the container.

The ez-rtsp-server displays the published URI on stdout but remember that the port is valid inside the
container only. You may want to forward port 8554 (e.g. with `-P` or with `-p <host_port>:8554`).

## Examples

The simplest:
```
docker run --init --rm -p 554:8554 ez-rtsp-server:latest
```

Set the media path:
```
docker run --init --rm -p 554:8554 ez-rtsp-server:latest --path /my/path
```

Stream your webcam (assuming v4l2) and your microphone (assuming pulseaudio):
```
docker run --init --volume=/run/user/${UID}/pulse/native:/run/.pulse -e PULSE_SERVER=/run/.pulse --volume=$HOME/.config/pulse/cookie:/run/.pulse-cookie -e PULSE_COOKIE=/run/.pulse-cookie --device=/dev/video0 -p 554:8554 --rm ez-rtsp-server:latest --video v4l --audio pulse
```

Log errors and warnings:
```
docker run --init --rm -p 554:8554 -e GST_DEBUG=*:2 ez-rtsp-server:latest
```
