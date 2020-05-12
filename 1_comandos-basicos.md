# Comandos básicos do Git

Após a configuração inicial, podemos criar um repositório e começar a
trabalhar com arquivos que serão "rastreados" pelo Git.

Um repositório (ou *repo*) é um diretório local onde os arquivos de um
projeto serão armazenados. O Git funciona normalmente em um repositório
local, e não é necessário haver um servidor central para o armazenamento
dos arquivos (como é comum em *sistemas controladores de versão
centralizados* como CVS e Subversion). No entanto, o uso de um servidor
central é fundamental para projetos colaborativos e de software livre.

Um servidor do Git pode ser local (um servidor privado por exemplo), ou
remoto. Um servidor remoto é mais simples e fácil de ser utilizado pois
já existem alguns serviços disponíveis para hospedar repositórios do
Git. O GitHub é um destes servidores, mas existem [vários outros
disponíveis](https://git.wiki.kernel.org/index.php/GitHosting), como o
[Gitlab](https://gitlab.com/explore/),
[Bitbucket](https://bitbucket.org), etc. A escolha de um deles em
particular não irá interferir no funcionamento do Git, pois os comandos
são os mesmos. A diferença se dá apenas na visualização *on-line* e
outras facilidades que cada servidor apresenta. Aqui vamos utilizar o
GitHub.

## Criando um repositório local

Para começar um repositório git, basta você entrar em um diretório e
executar `git init`. O importante é que esse diretório que você irá
iniciar o git pode ser tanto vazio quanto já possuir arquivos. Por
simplificação, vamos começar criando um diretório vazio e iniciar o git
neste diretório.

```bash
# Cria o diretório
mkdir git-teste
# entra
cd git-teste
# inicia o git
git init
```

O comando `git init` serve para "iniciar" o rastreamento de arquivos
pelo Git. Esse comando cria um diretório (oculto) `.git`, contendo as
configurações necessárias para o funcionamento do sistema, e onde também
serão armazenadas as versões dos arquivos. Esse comando só é necessário
uma vez. Outra coisa importante é que o diretório `.git` não deve ser
alterado de forma alguma manualmente (a não ser que você saiba
exatamente o que esteja fazendo).

Nesse ponto podemos utilizar o comando `git status` para verificar o que
está acontecendo no repositório

```bash
git status
# On branch master
#
# No commits yet
#
# nothing to commit (create/copy files and use "git add" to track)
```

Duas coisas chamam a atenção: o Git está mostrando que estamos em um
*branch* (ramo) chamado `master`, e que não há nada para ser enviado ou
adicionado ao repositório (*commit*). Um branch é como uma "linha de
desenvolvimento", sendo que sempre deve existir uma principal (que por
padrão é chamada de `master`), mas podem existir muitas outras. Por
enquanto vamos trabalhar apenas com o branch principal.

Na última mensagem vemos que ao criar e/ou copiar arquivos para o
repositório, devemos usar o comando `git add` para "rastrear" (*track*)
estes arquivos.

## Criando e rastreando arquivos

Para começar a usar o Git precisamos criar e/ou copiar arquivos para o
repositório que acabamos de criar. No GitHub, um arquivo chamdo `README`
serve para identificar um projeto e aparece automaticamente na página
principal do repositório. (Note que o arquivo não possui extensão (o que
é comum no Linux), mas poderíamos adicionar qualquer extensão de
arquivos de texto, como `*.md` (Markdown) ou `*.txt` (texto puro)). Por
isso, vamos criar esse arquivo (usando um editor de texto qualquer) e
adicionar algum texto como

```
Repositório criado para testes com o GitHub.
```

Depois de salvar o arquivo podemos ver novamente o status

```bash
git status
# On branch master
#
# No commits yet
#
# Untracked files:
# (use "git add <file>..." to include in what will be committed)
# README
#
# nothing added to commit but untracked files present (use "git add" to track)
```

Agora vemos que o Git automaticamente identificou que existe um arquivo
criado no repositório, mas ele ainda não está sendo rastreado. Se
quisermos que o Git rastreie todas as modificações de um arquivo temos
que adicioná-lo ao repositório com o comando `git add`

```bash
git add README
```

E o status irá mostrar que o arquivo foi adicionado, mas ainda não foi
enviado para o repositório local

```bash
git status
# On branch master
#
# No commits yet
#
# Changes to be committed:
# (use "git rm --cached <file>..." to unstage)
# new file:   README
#
```

Nesse momento, o arquivo está em uma *staging area*, ou um lugar pronto
para ser enviado ao repositório local. Até aqui o arquivo não faz parte
do repositório git ainda. Para isso temos que "enviá-lo", ou fazer um
*commit*

```bash
git commit -m 'Algum comentário útil'
# [master (root-commit) 09a6e25] Algum comentário útil
#  1 file changed, 1 insertion(+)
#  create mode 100644 README
```

Repare que a flag `-m` serve para adicionar um comentário sobre o commit
que você está fazendo. Adicionar um comentário é **obrigatório** para
todos os commits. Se você não usar o `-m`, o editor de texto padrão do
seu sistema (ou aquele configurado inicialmente com `core.editor`,
[ver a etapa de configuração](./0_configuracao-inicial.md)) irá abrir
para que você entre com uma mensagem.

Agora o status irá mostrar que o diretório está "limpo", ou seja,
nenhuma alteração precisa ser rastreada.

```bash
git status
# On branch master
# nothing to commit, working tree clean
```

Somente depois de fazer o *commit* é que o repositório git irá armazenar
as alterações nos arquivos adicionados. Para ver todas as alterações
realizadas em um repositório, podemos usar o `git log`

```bash
git log
# commit 09a6e25b59eb82070fee2c823810d806555d3b17 (HEAD -> master)
# Author: Fernando Mayer <fernandomayer@gmail.com>
# Date:   Mon May 11 21:11:28 2020 -0300
#
# Algum comentário útil
```

Note que várias informações são mostradas. De baixo para cima temos:

- O comentário criado com o commit (e que identifica as alterações
  realizadas)
- Autor e data do commit (note que o nome e o email são aqueles
  configurados inicialmente, como na seção
  [anterior](./0_configuracao-inicial.md), por isso a importância dessa
  configuração)
- A identificação única do commit. Cada commit possuirá uma
  identificação única, gerada aleatoriamente no momento de sua criação.
- O identificador `(HEAD -> master)` indica que este é o ponto atual do
  versionamento

Para uma apresentação mais compacta do log, podemos usar a opção
`--oneline`.

```bash
git log --oneline
# 09a6e25 (HEAD -> master) Algum comentário útil
```

Agora que o arquivo foi comitado, ele faz parte do repositório git,
mas apenas **localmente** (ou seja, somente no seu computador, por
enquanto). Você pode continuar criando arquivos e/ou fazendo alterações,
e ir adicionando e comitando conforme achar necessário.

Por exemplo, vamos adicionar mais esta linha no arquivo `README`

```
Mais alguma informação sobre este repositório.
```

Depois de salvar, vemos o status

```bash
git status
# On branch master
# Changes not staged for commit:
# (use "git add <file>..." to update what will be committed)
# (use "git restore <file>..." to discard changes in working directory)
# modified:   README
#
# no changes added to commit (use "git add" and/or "git commit -a")
```

Veja que é identificado que houve uma alteração no arquivo e algumas
dicas são apresentadas. Podemos usar `git add README` para adicionar o
arquivo à staging area e posteriormente comitar, ou podemos usar `git
restore README` para **desfazer** a última alteração.

Como queremos adicionar o arquivo ao repositório, vamos usar o `git
add`, mas ao invés de fazer a sequência `git add README` e depois `git
commit -m 'Nova alteração'`, vamos usar um "atalho", incluindo a opção
`-a` no `git commit`

```bash
git commit -am 'Nova alteração'
# [master 0f45cde] Nova alteração
#  1 file changed, 2 insertions(+)
```

Dessa forma o arquivo é indexado diretamente, sem passar pela *staging
area*. A vantagem é que elimina um comando. A desvantagem é que não
existe mais a chance de reverter um arquivo (*unstage*) antes de
comitar.

> NOTE que em arquivos **novos**, que serão adicionados e comitados pela
primeira vez, necessariamente teremos que usar `git add` e depois `git
commit`. Depois pode-se utilizar o atalho `git commit -am`.

Veja agora o status do repositório

```bash
git status
# On branch master
# nothing to commit, working tree clean
```

e o log, que agora irá mostrar a nova alteração

```bash
git log --oneline
# 0f45cde (HEAD -> master) Nova alteração
# 09a6e25 Algum comentário útil
```

Veja que o `(HEAD -> master)` "saiu" do commit anterior e está agora
apontando para a versão mais atual do arquivo.

Lembre que, até aqui, este repositório git existe (e é completa válido e
funcional) apenas **localmente**, ou seja, ele está somente no seu
computador. Caso aconteça alguma coisa no seu computador e você não
tiver um backup tudo estará perdido. Por isso, é importante você manter
uma cópia do seu repositório em algum servidor remoto, e para isso
usaremos o GitHub (mas poderia ser qualquer outro serviço como Gitlab,
BitBucket, etc). É importante perceber que um repositório git deve ser
armazenado em um serviço online próprio para isso. Isso significa que
criar um repositório git em um serviço como o Dropbox (ou similar), por
exemplo, não fornecerá os benefícios e funcionalidades desejadas.

## Configurando um servidor remoto (GitHub)

Para enviar uma cópia do repositório git local para o GitHub, entre na
sua conta e clique no botão `New repository` disponível na sua página
inicial. Você deverá dar um nome para o repositório, que não precisa
necessariamente ser igual ao nome do seu diretório local, **mas isso é
altamente recomendado**, para se evitar confusões. Portanto, se o
repositório local criado aqui se chama `git-teste`, o nome do
repositório sendo criado no GitHub também deverá se chamar `git-teste`.
As outras opções que aparecem são auto-explicativas, mas a princípio não
é necessário alterar nada. Ao criar o repositório no GitHub, algumas
informações já são apresentadas do que pode ser feito para "popular" o
repositório.

Até aqui o repositório foi criado no GitHub, e isso é importante pois
agora temos um endereço no servidor para onde vamos enviar os arquivos
criados localmente. Para informar o Git que este diretório deve se
comunicar com o servidor do GitHub criado acima fazemos

```bash
git remote add origin https://github.com/fernandomayer/git-teste.git
```

Note que o endereço https://github.com/fernandomayer será diferente, de
acordo com seu usuário do GitHub, e `git-teste.git` é o nome do
repositório. O comando `git remote add` serve para adicionar um
repositório "remoto", que por padrão o Git chama de `origin`, e que nada
mais é do que um "atalho" para o endereço do servidor. Note que neste
caso estamos usando um endereço no formato do `https`, mas poderia ser
também o endereço `SSH`, caso você tenha configurado para isto.

Agora que o endereço foi adicionado, é necessário enviar o respositório
git local para o servidor. Para isso usamos o comando `git push` com
dois argumentos. O primeiro indica o servidor remoto (`origin`), e o
segundo o branch (`master`)

```bash
git push -u origin master
# Username for 'https://github.com': fernandomayer
# Password for 'https://fernandomayer@github.com':
# Enumerating objects: 6, done.
# Counting objects: 100% (6/6), done.
# Delta compression using up to 8 threads
# Compressing objects: 100% (3/3), done.
# Writing objects: 100% (6/6), 581 bytes | 581.00 KiB/s, done.
# Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
# To https://github.com/fernandomayer/git-teste.git
# * [new branch]      master -> master
# Branch 'master' set up to track remote branch 'master' from 'origin'.
```

A opção `-u` é opcional, e só precisa ser utilizada da primeira vez que
fizer o push (isso fará com que o branch do repositório remoto seja
comparado com o branch do repositório local). Agora você pode entrar no
seu repositório no GitHub (neste caso
https://github.com/fernandomayer/git-teste) e verificar que os arquivos
e todos so commits (versões) estarão disponíveis lá também.

Uma olhada no status agora mostrará uma informação adicional, avisando
que o ramo `master` local está sincronizado com o ramo master remoto
`origin/master`

```bash
git status
# On branch master
# Your branch is up to date with 'origin/master'.
#
# nothing to commit, working tree clean
```

Após fazer alguma modificação ou adicionar mais arquivos, você sempre
precisará adicionar (`git add`) e comitar (`git commit`) as
modificações. Lembre-se que até aí tudo está rastreado, mas localmente.
Depois disso, basta enviar as modificações para o repositório remoto
(`git push origin master`) para manter uma cópia no GitHub. O `git push`
pode ser executado logo após cada commit, ou mesmo depois de vários
commits.

## Resumo: uso típico do Git

O processo mostrado em detalhes acima é o procedimento mais simples e
básico para rastrear arquivos com o Git. Esse processo se repete toda
vez que arquivos forem modificados e/ou adicionados ou removidos do
repositório.

Podemos resumir esse *workflow* do Git dessa forma:

```bash
# Arquivo foo.R adicionado/modificado
git add foo.R
git commit -m 'Mensagem'
git push origin master

# Arquivo bar.R adicionado/modificado
git add bar.R
git commit -m 'Outra mensagem'
git push origin master

# Arquivos foo.R e bar.R modificados
# O ponto (.) aqui significa 'todos', ou seja, pode-se adicionar vários
# arquivos de uma única vez
git add .
git commit -m 'Nova mensagem'
git push origin master
```

## Alguns comandos úteis

### Remover e mover arquivos

Comandos similares aos do shell `rm` e `mv`, mas mantém a
rastreabilidade do git

```bash
$ git rm foo.R
$ git mv foo.R
```
Para remover arquivos do repositorio remoto, mas manter localmente

```bash
$ git rm --cached foo.R
```
este comando é útil se você enviou para o repositório remoto algum
arquivo que não deveria ou não precisava (como arquivos de compilação
do LaTeX, ...). Para evitar que isso aconteça é possível criar um
arquivo chamado .gitignore contendo os arquivos que não precisam ser
enviados ao servidor remoto

### Logs

Mostra o log das alterações nos arquivos (mensagens de commit)

```bash
$ git log
# em uma linha
$ git log --pretty=oneline
```

### Recuperando versões de arquivos

Para reverter um único arquivo para uma versão anterior (sabendo que o
arquivo é foo.R e o hash SHA do commit é, por exemplo,
`03f9c0abe911440339ecb82e08ec8ae65ca11a7b`)

```bash
$ git checkout 03f9c0a foo.R
```

Para reverter um unico arquivo para uma versao anterior (sendo que
esse arquivo foi DELETADO em algum commit anterior)
se voce nao lembra o nome do arquivo, execute esse comando que
identifica os modos 'delete'

```bash
$ git log --diff-filter=D --summary | grep delete
```
Sabendo o nome do arquivo, voce pode conferir o log para identificar o
commit que o deletou

```bash
$ git log -- <arquivo-deletado>
```
NOTE que se o arquivo estava em um sub-diretorio dentro do seu
projeto, ele deve ser especificado com o caminho relativo para esse
diretorio. Para ter certeza do commit que deletou o arquivo, veja

```bash
$ git rev-list -n 1 HEAD -- <arquivo-deletado>
```
E finalmente para recuperar o arquivo faca o checkout no commit
anterior (por isso o `^` ao final do commit)

```basg
$ git checkout <commit-que-deletou>^ -- <arquivo-deletado>
```
O arquivo deletado devera voltar para o diretorio (ou sub-diretorio se
ele estava em um) como um novo arquivo.

### Commits

Para corrigir uma mensagem de commit que ainda não foi enviada para um
remote. Essa será a mensagem utilizada nos logs e irá substituir
qualquer outra anterior

```bash
$ git commit --amend -m 'mensagem nova'
```

### Tags

Criar tags em determinados pontos de um projeto é uma maneira eficaz de
poder voltar facilmente naquele ponto e verificar a situação dos
arquivos naquele momento. No desenvolvimento de um software por exemplo,
os tags podem marcar as versões (ex.: `v0.1`, `v0.2`, ...) do código ao
longo do tempo.

No git, as tags podem ser leves (*lightweight*) ou anotadas
(*annotated*). A diferença é que uma tag leve é só um "ponteiro" para um
commit específico, enquanto que uma tag anotada é como se fosse um novo
commit: ela armazena o nome de quem criou a tag, e-mail, data, e uma
mensagem.

Para criar uma tag leve faça

```bash
git tag v0.1
```

Para criar uma tag anotada (geralmente mais recomendado), faça:

```bash
git tag -a v0.1 -m 'mensagem de commit'
```

A mensagem de commit aqui também é obrigatória. Se você não especificar
com a opção `-m`, um editor irá abrir para você inserir uma mensagem.

Para verificar as tags existentes ou criadas, veja

```bash
git tag -l
```

Para ver todos os commits especificos associados a uma tag, use

```bash
git show v0.1
```

IMPORTANTE: se você está trabalhando com um repositório remoto (como o
GitHub), é necessário dar um push específico para que a tag também seja
enviada para o servidor. As tags criadas acima são apenas locais. Para
enviar a tag para o servidor, faça um push na tag:

```bash
git push origin v0.1
```

*****

Voltar: [Configuração inicial](0_configuracao-inicial.md) |
Continuar: [Trabalhando com branches](2_trabalhando-com-branches.md)
