FROM jupyter/notebook
MAINTAINER uochan

RUN apt-get update && \
    apt-get install -y --no-install-recommends libfreetype6-dev octave && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install pip --upgrade && \
    pip3 install --no-cache matplotlib octave_kernel && \
    python3 -m octave_kernel.install --prefix=/usr/local && \
    rm -rf /root/.cache

CMD ["jupyter", "notebook", "--no-browser"]
