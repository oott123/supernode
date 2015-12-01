FROM  debian:latest
RUN apt-get update && apt-get install libssl-dev subversion make gcc  -y --no-install-recommends 
WORKDIR /opt/
RUN svn co --non-interactive --trust-server-cert https://svn.ntop.org/svn/ntop/trunk/n2n
WORKDIR /opt/n2n/n2n_v2/
RUN make && make install 
RUN apt-get remove --purge -y subversion make gcc  && rm -rf /var/lib/apt/lists/*
RUN rm -rf /opt/n2n/
EXPOSE 12345
CMD ["/usr/sbin/supernode", "-l", "12345", "-f"]
