FROM ubuntu:18.04

ENV LANG en_US.UTF-8

RUN apt-get update --fix-missing
RUN apt-get install -y wget sudo less vim tzdata wait-for-it
# rust/cargo-profilerインストールのために必要なものを入れる
RUN apt-get install -y valgrind curl gcc pkg-config libssl-dev linux-tools-common linux-tools-generic-hwe-18.04 nginx

# isucon ユーザ作成
RUN groupadd -g 1001 isucon && \
    useradd  -g isucon -G sudo -m -s /bin/bash isucon && \
    echo 'isucon:isucon' | chpasswd
RUN echo 'isucon ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# MySQL のインストール
# RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server mysql-server/root_password password isucon'"]
# RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-service mysql-server/mysql-apt-config string 4'"]
RUN apt-get install -y mysql-client

RUN rm /usr/bin/perf
RUN ln -s /usr/lib/linux-tools/5.4.0-45-generic/perf /usr/bin/perf

USER isucon

# rust, cargo-profiler入れる
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
SHELL ["/bin/bash", "-c"]
ENV PATH $PATH:/home/isucon/.cargo/bin
COPY webapp/rust/rust-toolchain .
WORKDIR webapp/rust/
RUN cargo install cargo-profiler
RUN cargo install flamegraph
RUN cargo install cargo-watch

# Nginx 周りの設定
# COPY admin/ssl/ /etc/nginx/ssl/
# COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /home/isucon/webapp
COPY config/bashrc /home/isucon/.bashrc

COPY docker/start_app.sh /docker/start_app.sh

WORKDIR /home/isucon
EXPOSE 443

