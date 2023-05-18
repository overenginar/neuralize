FROM continuumio/anaconda3:latest

WORKDIR /neuralize

COPY . .

EXPOSE 8888/tcp

ENTRYPOINT jupyter-lab --notebook-dir=/neuralize --ip=* --port=8888 --no-browser --allow-root
