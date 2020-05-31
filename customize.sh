#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

sudo apt-get update
sudo apt-get install build-essential -y

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

brew install node

# zsh
sudo apt-get install zsh -y

sudo usermod -a -G staff nizer
npm install --global pure-prompt

brew install zsh-syntax-highlighting

git clone https://github.com/pawel-slowik/zsh-term-title ~/.zsh/plugins/zsh-term-title

cp .zshrc ~
cp .dircolors ~

chsh -s /bin/zsh

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp .tmux ~

# docker
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y

mkdir -p ~/.zsh/completion
curl -fLo ~/.zsh/completion/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker

# kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# python3
sudo apt-get install python3-pip -y

sudo apt-get install ffmpeg -y
pip3 install youtube-dl 
pip3 install tinydb

# python2
sudo apt-get install python python-pip -y

# envy code r
mkdir fonts
cd fonts
wget https://download.damieng.com/fonts/original/EnvyCodeR-PR7.zip
unzip EnvyCodeR-PR7.zip
git clone https://github.com/powerline/fontpatcher.git

sudo apt-get install fontforge -y

fontforge fontpatcher/scripts/powerline-fontpatcher Envy\ Code\ R\ PR7/*.ttf
cd ..

# awscli
pip3 install awscli

