# ez-rtsp-server

Build and dockerize [ez-rtsp-server](https://github.com/EasyMile/ez-rtsp-server) (based on [gst-rtsp-server](https://gstreamer.freedesktop.org/modules/gst-rtsp-server.html)).

It spawns an RTSP server listening localhost on port 8554. By default, a single, dummy audio+video stream is served on URI `/example`. The URI may be overriden with the `--path` argument. The port 8554 is "exposed" by the container.

The ez-rtsp-server displays the published URI on stdout but remember that it is valid inside the
container only. You may want to forward port 8554 (e.g. with `-P` or with `-p <host_port>:8554`).

## Example usage

`docker run --init -p 554:8554 ez-rtsp-server:latest --path /my/path`
