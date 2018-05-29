FROM frolvlad/alpine-glibc
# FROM alpine:3.7

RUN apk update && \
    apk upgrade && \
    apk add wget sdl2 libsamplerate gst-plugins-base0.10 libxi

RUN adduser -D -u 1000 user
USER user
WORKDIR /home/user

RUN wget https://github.com/team-phoenix/Phoenix/releases/download/v0.0.1-pre-alpha/Phoenix-v0.0.1-pre-alpha-Linux-x64-full.zip
RUN unzip ./Phoenix-v0.0.1-pre-alpha-Linux-x64-full.zip

USER root

RUN apk add libxcb xcb-util-renderutil libsm xcb-util-image xcb-util-wm xcb-util-keysyms eudev mesa-egl

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >>/etc/apk/repositories && echo http://dl-cdn.alpinelinux.org/alpine/edge/main >>/etc/apk/repositories && apk update
RUN apk add pulseaudio-libs

CMD [ "/home/user/phoenix-build/Phoenix" ]
