FROM ubuntu:16.04

RUN apt-get update && apt-get install -y pptpd iptables

RUN rm -rf /var/lib/apt/lists/*

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

EXPOSE 1723

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]
