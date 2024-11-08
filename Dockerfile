
FROM ubuntu:latest


RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    openssh-server \
    && apt-get clean

RUN mkdir /var/run/sshd

# SSH için parola belirleme
RUN echo 'root:password' | chpasswd

# SSH yapılandırma ayarlarını güncelleme
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH sunucusunu başlatma
CMD ["/usr/sbin/sshd", "-D"]

# 22 numaralı portu açma
EXPOSE 22
