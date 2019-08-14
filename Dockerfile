FROM python:3.6

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && pip3 install --upgrade pip

RUN git clone --depth 1 --recursive https://github.com/ActivityWatch/aw-server.git \
 && pip install pymongo \
 && make -C /aw-server build \
 && rm -rf /aw-server /root/.cache /root/.npm


EXPOSE 5600
CMD [ "aw-server", "--host", "0.0.0.0" ]
