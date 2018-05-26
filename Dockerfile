FROM fedora:28

RUN dnf install -y git cmake gcc-c++ make \
        quazip quazip-devel \
        libsamplerate libsamplerate-devel \
        SDL2 SDL2-devel \
        qt5-qtgraphicaleffects \
        qt5-qtquickcontrols \
        qt5-devel &&\
        dnf clean all

RUN adduser user
USER user
WORKDIR /home/user

RUN git clone --recursive https://github.com/team-phoenix/Phoenix.git phoenix
RUN mkdir /home/user/phoenix-build
WORKDIR /home/user/phoenix-build

RUN cmake ../phoenix
RUN cat Makefile
RUN make -j12

LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

CMD [ "/home/user/phoenix-build/Phoenix" ]
