FROM ubuntu:impish
ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt-add-repository -y ppa:neovim-ppa/unstable && apt update
RUN apt install -y curl git ansible build-essential tree vim
RUN apt install -y nodejs npm python2 stow fzf tldr ripgrep
EXPOSE 7002
COPY . .
CMD ["sh", "-c", "wait-for-it.sh 127.0.0.1:8000 -t 3600"]
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml --ask-vault-password"]

