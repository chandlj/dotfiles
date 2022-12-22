FROM ubuntu:latest

# OS updates, install necessary packages and make zsh default
RUN apt-get -qq update
RUN apt-get install git wget curl sudo zsh python3 -qq -y
RUN chsh -s $(which zsh)

RUN useradd -m -s /bin/zsh tester
RUN usermod -aG sudo tester
RUN echo "tester   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers

ADD . /home/dotfiles
RUN chown -R tester:tester /home/dotfiles

USER tester
ENV HOME /home/

WORKDIR /home/dotfiles

CMD ["/bin/bash"]