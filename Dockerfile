FROM ubuntu:18.04

RUN apt-get update && apt-get install -y vim ssh ansible sudo

RUN echo 'root:medeiros' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication/PubkeyAuthentication/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN mkdir -p /run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
