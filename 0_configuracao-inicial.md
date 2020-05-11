# Configuração inicial

Assume-se que você já possua uma conta devidamente configurada no
GitHub. Se ainda não tiver, acesse <https://github.com> para
criar sua conta.

É importante salientar que o `git` é um programa de linha de comando.
Embora existam algumas interfaces para interagir com ele, aqui veremos
como o `git` funciona no terminal. Se você quiser ver uma introdução
(extremamente) básica (mas suficiente) sobre o Shell Linux, veja
https://github.com/fernandomayer/shell-rautu.

## Instalando o git

A primeira coisa a fazer é ter instalado os arquivos necessários para o
git funcionar. Em sistemas Linux, basta procurar pelo pacote `git` no
seu gerenciador de softwares e instalar. Certamente o git está
disponível para instalação na grande maioria das distribuições.

Para macOS veja as instruções [aqui](https://git-scm.com/download/mac).

Para Windows, recomenda-se instalar o [Git for
Windows](https://gitforwindows.org/), que fará uma instalação completa
(ou quase) das principais ferramentas disponíveis no Shell Linux,
incluindo obviamente o git.

## Configurações globais

Estas configurações precisam ser feitas apenas uma vez, e servem para
determinar algumas opções globais do git, e serão úteis posteriormente.

Configurar nome de usuário e email (esse é o nome e email que aparecerão
automaticamente em todas as suas ações posteriormente - adicionar um
email válido é importante)

```bash
git config --global user.name "Fernando Mayer"
git config --global user.email "meuemail@servidor.com"
```

Além disso podemos definir um editor de texto padrão para escrever as
mensagens de *commits*. Por padrão, esse editor é o `$EDITOR` do seu
Shell. (Essa etapa pode ser pulada a princípio, como veremos mais pra
frente). Esse editor não precisa ser necessariamente o mesmo editor que
você usa para escrever [texto, código]. Recomenda-se que seja um editor
leve e que funcione nativamente em um terminal. Um dos mais sinmples de
se usar no terminal é o `nano`, que também já vem instalado na maioria
das distribuições Linux.

```bash
git config --global core.editor nano
```

No entanto, qualquer outro editor de sua preferência pode ser
adicionado, como o `vim`, `emacs`, `gedit`, etc.

Apenas estas três configurações acima já são o suficiente para
prosseguir, mas outra configuração útil é o *password caching*, para que
você não precise digitar usuário e senha todas as vezes que se comunicar
com o servidor

```bash
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
```

Isso vai fazer com que usuário e senha fiquem em cache por uma hora
(`--timeout=3600` segundos).

> Baseado em <https://help.github.com/articles/set-up-git>

## [OPCIONAL] Configurando as chaves ssh

O GitHub recomenda usar o protocolo seguro https para comunicação entre
máquina e servidor. No entanto também é possível fazê-lo através de uma
conexão (também segura) via ssh. É necessário já ter instalado `ssh` e
`openssh-*`.

Para fazer as transferências de arquivos entre máquina e servidor por
ssh, é necessário primeiro gerar uma chave ssh local.

```bash
$ ssh-keygen -t rsa -C "meuemail@servidor.com"
Generating public/private rsa key pair.
Enter file in which to save the key (/home/mayer/.ssh/id_rsa):
```

É recomendável manter esse diretório padrão. Para isso pressione
`Enter`. Dois arquivos serão gerados no seu diretório `~/.ssh`: `id_rsa`
e `id_rsa.pub`. Outra mensagem irá aparecer:

```bash
Enter passphrase (empty for no passphrase):
```

Para você digitar uma senha adicional que será usada para a comunicação
com o servidor via ssh. Deixe em branco para não configurar essa senha.
Depois digite a mesma senha novamente (ou deixe em branco também)

```bash
Enter same passphrase again:
```

Agora é necessário copiar o conteúdo **exato** do arquivo `~/id_rsa.pub`
para poder adicionar à sua conta no GitHub. Para isso, abra este arquivo
em um editor de texto qualquer (*e.g.* `gedit`, `emacs`, `vim`, ...), e
copie.

Agora é necessário entra na sua conta no GitHub e colar esse
conteúdo. Entre em <https://github.com/settings/ssh> e clique em `New
SSH key`. Você pode dar um nome apenas de referência (**Title**). Cole o
conteúdo no quadro **Key** e adicione a chave.

Você pode testar a comunicação com o servidor do GitHub com

```bash
$ ssh -T git@github.com
The authenticity of host 'github.com (207.97.227.239)' can't be established.
RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.
Are you sure you want to continue connecting (yes/no)?
```

Essa mensagem é normal pois o servidor `github.com` ainda é desconhecido
pelo ssh. Por isso você pode responder `yes` para armazenar o servidor à
lista de servidores conhecidos. Uma mensagem como esta deverá aparecer

```bash
Warning: Permanently added 'github.com,207.97.227.239' (RSA) to the	list of known hosts.
```

Em uma nova tentativa a mensagem agora deverá ser

```bash
$ ssh -T git@github.com
Hi fernandomayer! You've successfully authenticated, but GitHub does not provide shell access.
```

> Baseado em <https://help.github.com/articles/generating-ssh-keys>

Agora o git está pronto para ser usado com o GitHub!


*****

Continuar: [Comandos básicos](1_comandos-basicos.md)
