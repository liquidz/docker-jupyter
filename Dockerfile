FROM jupyter/notebook:4.x
MAINTAINER uochan

RUN apt-get update && \
    apt-get install -y libfreetype6-dev gnuplot octave

RUN pip3 install pip --upgrade && \
    pip3 install --no-cache matplotlib octave_kernel && \
    python3 -m octave_kernel.install --prefix=/usr/local && \
    pip3 install protobuf>=3.0.0 chainer

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /root/.cache

CMD ["jupyter", "notebook", "--no-browser"]
