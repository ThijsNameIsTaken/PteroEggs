FROM debian:10

# Install dependencies
RUN apt update \
    && apt upgrade -y \
    && apt -y install curl software-properties-common locales git \
    && useradd -d /home/container -m container
RUN DEBIAN_FRONTEND="noninteractive" apt -y install tzdata
RUN apt -y install git

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Language installation
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt -y install nodejs
RUN add-apt-repository -y ppa:ondrej/php \
    && apt update \
    && apt -y install php7.2 php7.2-cli php7.2-gd php7.2-mysql php7.2-pdo php7.2-mbstring php7.2-tokenizer php7.2-bcmath php7.2-xml php7.2-fpm php7.2-curl php7.2-zip
RUN apt -y install openjdk-8-jdk
RUN apt -y install python python3
RUN apt -y install mono-runtime
RUN apt -y install lua5.3
RUN apt -y install golang
RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
    && sudo dpkg -i erlang-solutions_2.0_all.deb \
    && apt update \
    && apt -y install esl-erlang \
    && apt -y install elixir

# Finalizing pterodactyl user stuff
USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
