FROM ubuntu:latest

ARG download_url=https://www.terraria.org/system/dedicated_servers/archives/000/000/038/original/terraria-server-1404.zip?1590253816
ARG version_number=1404

RUN apt -qy update && \
    apt -qy install wget && \ 
    apt -qy install unzip && \   
    mkdir /home/terraria && \ 
    mkdir /home/terraria/files && \
    mkdir /home/terraria/world && \
    cd /home/terraria && \
    wget ${download_url} && \
    unzip terraria-server-${version_number}.zip* && \
    mv ${version_number}/Linux/* /home/terraria/ && \
    rm -rf ${version_number} terraria-server-${version_number}.zip && \
    chmod u+x TerrariaServer.bin.x86_64
EXPOSE 7777/tcp
WORKDIR /home/terraria
CMD ["./TerrariaServer.bin.x86_64", "-config", "/home/terraria/world/server.conf"]
