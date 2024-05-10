#!/bin/bash

# Função para instalar pacotes via apt
install_package_apt() {
    echo "Instalando $1..."
    sudo apt install -y $1
    echo "$1 instalado com sucesso!"
}

# Função para instalar pacotes via apt-get
install_package_apt_get() {
    echo "Instalando $1..."
    sudo apt-get install -y $1
    echo "$1 instalado com sucesso!"
}

# Função para instalar pacotes via Snap
install_snap_package() {
    echo "Instalando $1 via Snap..."
    sudo snap install -y $1
    echo "$1 instalado com sucesso!"
}

# Função para instalar Oh My Zsh
install_oh_my_zsh() {
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "Oh My Zsh instalado com sucesso!"
}

# Função para clonar o repositório zsh-autosuggestions
clone_zsh_autosuggestions() {
    echo "Clonando zsh-autosuggestions..."
    if [ -z "$ZSH_CUSTOM" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    else
        git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    fi
    echo "zsh-autosuggestions clonado com sucesso!"
}

# Função para clonar o repositório zsh-syntax-highlighting
clone_zsh_syntax_highlighting() {
    echo "Clonando zsh-syntax-highlighting..."
    if [ -z "$ZSH_CUSTOM" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    else
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    fi
    echo "zsh-syntax-highlighting clonado com sucesso!"
}

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

# Função para configurar as variáveis de ambiente no arquivo .zshrc
configure_java_environment() {
    echo "Configurando variáveis de ambiente para o Java..."

    # Define o JAVA_HOME
    JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
    echo "export JAVA_HOME=$JAVA_HOME" >> ~/.zshrc

    # Adiciona o diretório bin do Java ao PATH
    echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.zshrc

    echo "Variáveis de ambiente configuradas com sucesso no arquivo .zshrc!"
}

## Instalando pacotes essenciais ##
install_package_apt_get wget
install_package_apt_get gpg
install_package_apt_get curl
install_package_apt_get apt-transport-https
install_package_apt software-properties-common
install_package_apt ca-certificates

## Atualizando repositorios ##

echo "Atualizando repositorios"
sudo apt update
echo "Repositorios atualizados"
sudo apt upgrade -y

## Instalando zsh ##
install_package_apt zsh
chsh -s $(which zsh)

## Instalando Oh My Zsh ##
install_oh_my_zsh

## Instalando o git ##
install_package git
git --version

## Configurando o git ##
echo "Configurando Git..."
read -p "Informe seu nome: " git_name
read -p "Informe seu email: " git_email
git config --global user.name "$git_name"
git config --global user.email "$git_email"
echo "Git configurado com sucesso!"

## Clonando o repositório zsh-autosuggestions ##
clone_zsh_autosuggestions

## Clonando o repositório zsh-syntax-highlighting ##
clone_zsh_syntax_highlighting

## Adicionando configurações ao arquivo .zshrc ##
add_to_zshrc


## Istalando google chrome ##
echo "Baixando a chave"
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
echo "Chave baixada"
echo "Atualizando repositorios"
sudo apt-get update
install_package google-chrome-stable

## Instalar VsCode ##
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt update
install_package_apt code

## Instalando Dbeaver ##
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
sudo apt-get update
install_package_apt dbeaver-ce

## Instalando o Slack ##
install_snap_package slack

## Instalando o Spotify ##
install_snap_package spotify

## Instalar IntelliJ IDEA Ultimate Edition ##
install_snap_package intellij-idea-ultimate --classic

## Instalar o Node Version Manager (NVM) ##
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

## Instalação do Docker ##
echo "Adicionando chave GPG do Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Adicionando repositório do Docker ao sistema..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Atualizando o sistema..."
sudo apt update

echo "Verificando as versões disponíveis do Docker..."
apt-cache policy docker-ce

echo "Instalando Docker..."
install_package_apt docker-ce

echo "Verificando o status do serviço Docker..."
sudo systemctl status docker

## Configuração para executar o Docker sem sudo ##

echo "Adicionando o usuário ao grupo docker..."
sudo usermod -aG docker ${USER}

echo "Recarregando configurações do grupo..."
su - ${USER}

echo "Verificando os grupos do usuário..."
groups

## Instalação do Java ##
install_package_apt_get openjdk-11-jdk

# Configura as variáveis de ambiente
configure_java_environment

# Recarrega o arquivo .zshrc
echo "Recarregando o arquivo .zshrc..."
source ~/.zshrc

# Verifica as variáveis de ambiente JAVA_HOME e PATH
echo "JAVA_HOME:"
echo $JAVA_HOME

echo "PATH:"
echo $PATH
