#!/bin/bash

# Função genérica para instalar pacotes
install_package() {
    echo "Instalando $1..."
    sudo apt install -y $1
    if [ $? -eq 0 ]; then
        echo "$1 instalado com sucesso!"
    else
        echo "Erro ao instalar $1. Verifique a conexão com a internet ou os repositórios."
    fi
}

# Função para instalar Oh My Zsh
install_oh_my_zsh() {
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    if [ $? -eq 0 ]; then
        echo "Oh My Zsh instalado com sucesso!"
    else
        echo "Erro ao instalar Oh My Zsh. Verifique a conexão com a internet ou o script de instalação."
    fi
}

# Função para clonar repositórios
clone_repository() {
    echo "Clonando $2..."
    if [ -z "$ZSH_CUSTOM" ]; then
        git clone $1 ~/.oh-my-zsh/custom/plugins/$2
    else
        git clone $1 $ZSH_CUSTOM/plugins/$2
    fi
    if [ $? -eq 0 ]; then
        echo "$2 clonado com sucesso!"
    else
        echo "Erro ao clonar $2. Verifique a conexão com a internet ou o repositório."
    fi
}

# Função para adicionar configurações ao arquivo .zshrc
add_to_zshrc() {
    echo "Adicionando configurações ao arquivo .zshrc..."
    cat >> ~/.zshrc <<EOF

# If you come from bash you might have to change your \$PATH.
# export PATH=\$HOME/bin:/usr/local/bin:\$PATH

# Path to your oh-my-zsh installation.
export ZSH="\$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo \$RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="awesomepanda"
# ZSH_THEME="refined"
# ZSH_THEME="strug"
# ZSH_THEME="agnoster"
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in \$ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than \$ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in \$ZSH/plugins/
# Custom plugins may be added to \$ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  git 
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source \$ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:\$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n \$SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run \`alias\`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Configurações para NVM
export NVM_DIR="\$([ -z "\${XDG_CONFIG_HOME-}" ] && printf %s "\${HOME}/.nvm" || printf %s "\${XDG_CONFIG_HOME}/nvm")"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh" # This loads nvm

EOF
    echo "Configurações adicionadas ao arquivo .zshrc com sucesso!"
}


# Instalação de pacotes essenciais
install_package wget
install_package gpg
install_package curl
install_package apt-transport-https
install_package software-properties-common
install_package ca-certificates

# Atualização de repositórios
echo "Atualizando repositórios..."
sudo apt update
sudo apt upgrade -y
echo "Repositórios atualizados."

# Instalação do Google Chrome
echo "Instalando Google Chrome..."
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update
install_package google-chrome-stable

# Instalação do zsh
install_package zsh
chsh -s $(which zsh)

# Instalação do Oh My Zsh
install_oh_my_zsh

# Instalação do git
install_package git

# Configuração do git
echo "Configurando Git..."
read -p "Informe seu nome: " git_name
read -p "Informe seu email: " git_email
git config --global user.name "$git_name"
git config --global user.email "$git_email"
echo "Git configurado com sucesso!"

# Clonagem do repositório zsh-autosuggestions
clone_repository https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions

# Clonagem do repositório zsh-syntax-highlighting
clone_repository https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting

# Instalação do VsCode
echo "Instalando VsCode..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt update
install_package code

# Instalação do Dbeaver
echo "Instalando Dbeaver..."
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
sudo apt update
install_package dbeaver-ce

# Instalação do Slack
echo "Instalando Slack..."
sudo snap install slack

# Instalação do Spotify
echo "Instalando Spotify..."
sudo snap install spotify

# Instalação do IntelliJ IDEA Ultimate Edition
echo "Instalando IntelliJ IDEA Ultimate Edition..."
sudo snap install intellij-idea-ultimate --classic

# Instalação do Node Version Manager (NVM)
echo "Instalando Node Version Manager (NVM)..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Adição de configurações ao arquivo .zshrc
add_to_zshrc

# Instalação do Docker
echo "Instalando Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
install_package docker-ce

# Configuração para executar o Docker sem sudo
echo "Adicionando o usuário ao grupo docker..."
sudo usermod -aG docker ${USER}
echo "Recarregando configurações do grupo..."
su - ${USER}
echo "Verificando os grupos do usuário..."
groups

echo "Instalação concluída. Reinicie o sistema para aplicar as configurações."

# Verifica se o usuário é root
if [ "$(id -u)" != "0" ]; then
    echo "Este script precisa ser executado como root."
    exit 1
fi

# Pergunta ao usuário se deseja reiniciar o sistema
read -p "Você deseja reiniciar o sistema agora? (s/n): " choice
case "$choice" in 
  s|S ) echo "Reiniciando o sistema..."; sleep 5; reboot;;
  n|N ) echo "Operação cancelada."; exit 0;;
  * ) echo "Opção inválida. Operação cancelada."; exit 1;;
esac

