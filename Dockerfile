FROM  debian:latest
RUN apt-get update && apt-get install libssl-dev git make gcc ca-certificates -y --no-install-recommends 
WORKDIR /opt/
RUN git clone https://github.com/tlbdk/n2n_v2.git
WORKDIR /opt/n2n_v2/
RUN make && make install 
EXPOSE 12345
CMD ["/usr/sbin/supernode", "-l", "12345", "-f"]
