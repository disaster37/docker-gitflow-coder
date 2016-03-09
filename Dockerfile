FROM ubuntu
MAINTAINER Sebastien Langoureaux <linuxworkgroup@hotmail.com>


# Install gitflow and git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install git git-flow xfce4-terminal -y && \
    update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



# Add user
RUN useradd -m dev
RUN mkdir -p /workspace
RUN chown -R dev /workspace

WORKDIR /workspace

USER dev

CMD xfce4-terminal --command '/bin/bash' --title 'Git shell'
