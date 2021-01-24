FROM debian:10

# Install dependencies
RUN apt update \
    && apt upgrade -y \
    && apt -y install curl wget software-properties-common locales git \
    && useradd -d /home/container -m container
RUN DEBIAN_FRONTEND="noninteractive" apt -y install tzdata

# Localisation fixes
RUN apt -y install locales
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

# Language installation
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt -y install nodejs
RUN apt -y install python python3 python3-pip
RUN apt -y install openjdk-11-jdk
RUN apt -y install golang
RUN apt -y install mono-runtime
RUN apt -y install lua5.3
RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
    && dpkg -i erlang-solutions_2.0_all.deb \
    && apt update \
    && apt -y install esl-erlang \
    && apt -y install elixir

# Additional packages
RUN apt -y install ffmpeg

# Finalizing pterodactyl user stuff
USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
