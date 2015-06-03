# Configuração inicial

Assume-se que você já possua uma conta devidamente configurada no
GitHub. Se ainda não tiver, acesse <https://github.com/signup/free> para
criar sua conta.

## Instalando o git

A primeira coisa a fazer é ter instalado os arquivos necessários para o
git funcionar. Em sistemas Debian e suas variações (Ubuntu, LinuxMint,
...), os pacotes necessários podem ser instalados com

```bash
$ sudo apt-get install git git-core git-man git-gui git-doc \
	ssh openssh-server openssh-client
```

O `ssh` e `openssh-*` são necessários para a comunicação entre sua
máquina e o servidor do GitHub. Em outros sistemas operacionais baixe os
arquivos de instalação a partir de <http://git-scm.com>.

## Configurações globais

Estas configurações precisam ser feitas apenas uma vez, e servem para
determinar algumas opções globais do git, e serão úteis posteriormente.

Configurar nome de usuário e email (esse é o nome e email que aparecerão
automaticamente em todas as suas ações posteriormente)

```bash
$ git config --global user.name "Fernando Mayer"
$ git config --global user.email "meuemail@servidor.com"
```

Além disso podemos definir um editor de texto padrão para escrever as
mensagens de *commits*. Por padrão, esse editor é o `$EDITOR` do seu
shell. (Essa etapa pode ser pulada a princípio, como veremos mais pra
frente). Esse editor não precisa ser necessariamente o mesmo editor que
você usa para escrever [texto, código]. No meu caso uso o Emacs, mas
para essa tarefa prefiro o vim por ser um editor embutido (e mais leve),
e que não vai carregar uma interface gráfica
desnecessariamente. Portanto 

```bash
$ git config --global core.editor vim
```

> Comentário: o emacs também pode ser carregado embutido no terminal
> (sem usar o X), usando a opção `-nw` na sua inicialização.

Outra configuração útil é configurar o *password caching*, para que você
não precise digitar usuário e senha todas as vezes que se comunicar com
o servidor

```bash
$ git config --global credential.helper cache
$ git config --global credential.helper 'cache --timeout=3600'
```

Isso vai fazer com que usuário e senha fiquem em cache por uma hora
(`--timeout=3600` segundos).

> Baseado em <https://help.github.com/articles/set-up-git>

## Configurando as chaves ssh

O GitHub recomenda usar o protocolo seguro https para comunicação entre
máquina e servidor. No entanto também é possível fazê-lo através de uma
conexão (também segura) via ssh.

Para fazer as transferências de arquivos entre máquina e servidor por
ssh, é necessário primeiro gerar uma chave ssh local.

```bash
$ ssh-keygen -t rsa -C "meuemail@servidor.com"
Generating public/private rsa key pair.
Enter file in which to save the key (/home/fernando/.ssh/id_rsa):
```

É recomendável manter esse diretório padrão. Para isso pressione
`Enter`. Dois arquivos serão gerados no seu diretório `~/.ssh`: `id_rsa`
e `id_rsa.pub`. Outra mensagem irá aparecer:

```bash
Enter passphrase (empty for no passphrase):
```

Para você digitar uma senha que será usada para a comunicação com o
servidor via ssh. Depois digite a mesma senha novamente

```bash
Enter same passphrase again:
```

Agora é necessário copiar o conteúdo **exato** do arquivo `id_rsa.pub`
para poder adicionar à sua conta no GitHub. Para isso, abra este arquivo
em um editor de texto qualquer (*e.g.* gedit, emacs, vim, ...), e
copie. Alternativemente podemos usar o xclip, um programa em linha de
comando que facilita essa tarefa sem sair do terminal.

```bash
$ sudo apt-get install xclip
# usa o xclip para copiar o conteúdo do arquivo
$ xclip -sel clip < ~/.ssh/id_rsa.pub
```

Agora é necessário entra na sua conta no GitHub e colar esse
conteúdo. Entre em <https://github.com/settings/ssh> e clique em `Add
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
pelo ssh. Po isso você pode responder `yes` para armazenar o servidor à
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
