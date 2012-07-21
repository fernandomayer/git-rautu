# Configuração inicial

## Instalando o git

A primeira coisa a fazer é ter instalado os arquivos necessários para o
git funcionar. Em sistemas Debian e suas variações (Ubuntu, LinuxMint,
...), os pacotes necessários podem ser instalados com

	~$ sudo apt-get install git git-core git-man git-gui git-doc \
		ssh openssh-server openssh-client

O `ssh` e `openssh-*` são necessários para a comunicação entre sua
máquina e o servidor do GitHub. Em outros sistemas operacionais baixe os
arquivos de instalação a partir de [git-scm.com](http://git-scm.com).

## Configurações globais

Estas configurações precisam ser feitas apenas uma vez, e servem para
determinar algumas opções globais do git, e serão úteis posteriormente.

Configurar nome de usuário e email (esse é o nome e email que aparecerá
automaticamente em todas as suas ações posteriormente)

	~$ git config --global user.name "Fernando Mayer"
	~$ git config --global user.email "fernandomayer@gmail.com"
	
>(Password caching: para usar com https. É necessário git >= 1.7.10. A
>versão atual do Ubuntu 12.04 é

>	../git-rautu$ git --version
>		git version 1.7.9.5

>por isso vou usar ssh)

## Configurando as chaves ssh

Para fazer as transferências de arquivos entre máquina e servidor por
ssh, é necessário primeiro gerar uma chave ssh local. 
