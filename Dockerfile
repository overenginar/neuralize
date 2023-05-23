FROM continuumio/anaconda3:latest

WORKDIR /neuralize

RUN apt-get update --yes --quiet && DEBIAN_FRONTEND=noninteractive apt-get install --yes --quiet --no-install-recommends \
    software-properties-common \
    build-essential apt-utils graphviz \
    wget curl vim git ca-certificates kmod \
    && rm -rf /var/lib/apt/lists/* 

RUN pip install sdv==1.1.0
RUN pip install tensorflow==2.12.0
RUN pip install pydot==1.4.2
RUN pip install tensorflow-hub==0.13.0
RUN pip install tensorflow-text==2.12.1
RUN pip install tf-models-official==2.12.0

COPY . .

EXPOSE 8888/tcp 6006/tcp

ENTRYPOINT jupyter-lab --notebook-dir=/neuralize --ip=* --port=8888 --no-browser --allow-root
