# Trabalhando com branches

Os *branches* ou *ramos* são o que fazem o Git ainda mais poderoso. Já
vimos que o papel fundamental do git é "rastrear" versões de arquivos,
ou seja, podemos voltar a qualquer ponto (ou versão) de um arquivo,
mesmo depois que ele tenha sido modificado várias vezes.

Agora pense na seguinte situação: está tudo funcionando perfeitamente
bem no seu ramo de desenvolvimento principal (o branch `master`), mas
você precisa testar uma nova funcionalidade ou inserir novas informações
ou qualquer outra coisa que potencialmente pode interferir no bom
funcionamento do seu projeto. Obviamente você pode continuar com esse
desenvolvimento e, caso algo dê errado (ou você não esteja satisfeito),
poderá voltar ao ponto que estava funcionando. No entanto, uma
alternativa mais "segura" e funcional seria criar uma "cópia" idêntica e
separada do projeto no estado atual, desenvolver nessa "cópia", e se não
estiver satisfeito, simplesmente deletar essa cópia. Ou, caso esteja
satisfeito com as modificações, incorporar estas alterações no ramo
principal. É exatamente este o papel dos ramos paralelos (ou *branches*)
no Git.

A ideia de um novo *branch* é exatamente a de copiar o estado atual de
um projeto para um local "separado", onde você pode fazer as
modificações necessárias, proceder da mesma forma (com `git add`, `git
commit` e `git push`), **testar** estas modificações e, se quiser,
incorporar ao ramo de desenvolvimento principal (`master`). Todas as
alterações realizadas em um novo ramo serão versionadas e funcionam
exatamente da mesma forma como se estivessem no ramo principal. A grande
vantagem é que o `master` fica preservado e somente aquilo que julgar
importante será adicionado a ele.

Os *branches* no Git são uma parte fundamental para o desenvolvimento de
projetos colaborativos. Por exemplo, diversas pessoas podem trabalhar
simultaneamente no mesmo projeto, a partir do mesmo ponto de
desenvolvimento, mas em ramos diferentes. Ao final, um ou mais ramos
podem ser incorporados ao desenvolvimento principal, depois de que seja
certificado que tudo funcionará corretamente. Esta última parte é um
**merge** (`git merge`), que serve para "unir" dois ramos.

A ideia da criação e desenvolvimento em *branches* é relativamente
simples:

1. Cria-se um ramo novo, a partir do ponto (commit) mais atual de
   desenvolvimento principal (ramo `master`)
2. Fazem-se as alterações necessárias em um ou mais arquivos neste ramo
3. Estas novas modificações podem ser incorporadas (`git merge`)
   diretamente no ramo `master` ou simplesmente descartadas
   (deletando-se o ramo de desenvolvimento)

Podem ser criados quantos ramos forem necessários, e, na verdade, os
ramos podem ser criados a partir de qualquer ponto e de outros ramos,
etc. Por simplificação, vamos considerar que estamos criando um novo
ramo sempre a partir do último commit disponível no ramo `master`, e um
ramo de cada vez. Uma dica importante é criar ramos para desenvolver
e/ou resolver alterações pontuais e logo incorporar (ou descartar) ao
ramo `master`. Quanto mais modificado um ramo é do seu `master`, maiores
as chances de haverem conflitos quando for realizado o **merge**.

A seguir um exemplo comentado de uma sessão utilizando os *branches* do
Git. Para mais detalhes ver o capítulo 3 do [livro do
Git](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell).

```bash
## Confere os branches atuais
git branch
# * master

## Cria um novo branch chamado teste e confere
git branch teste
git branch
# * master
#   teste

## Altera o workspace para o branch teste
git checkout teste
# Switched to branch 'teste'

## Confere novamente
git branch
#   master
# * teste

## Lista arquivos
ls
# README

## Modifica o README (usando o nano por exemplo)
nano README

## Verifica o status
git status
# On branch teste
# Changes not staged for commit:
# (use "git add <file>..." to update what will be committed)
# (use "git restore <file>..." to discard changes in working directory)
# modified:   README
#
# no changes added to commit (use "git add" and/or "git commit -a")

## Add, commit e push
git add .
git commit -m 'Adicionada uma linha no branch teste'
# [teste be48a64] Adicionada uma linha no branch teste
#  1 file changed, 2 insertions(+)
git push origin teste
# Enumerating objects: 5, done.
# Counting objects: 100% (5/5), done.
# Delta compression using up to 8 threads
# Compressing objects: 100% (2/2), done.
# Writing objects: 100% (3/3), 300 bytes | 300.00 KiB/s, done.
# Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
# remote: Resolving deltas: 100% (1/1), completed with 1 local object.
# remote:
# remote: Create a pull request for 'teste' on GitHub by visiting:
# remote:      https://github.com/fernandomayer/git-teste/pull/new/teste
# remote:
# To https://github.com/fernandomayer/git-teste.git
# * [new branch]      teste -> teste

## Cria um novo arquivo e salva
nano foo.R
ls
# foo.R  README
git status
# On branch teste
# Untracked files:
# (use "git add <file>..." to include in what will be committed)
# foo.R
#
# nothing added to commit but untracked files present (use "git add" to track)

## Add, commit, push
git add .
git commit -m 'foo.R criado no teste'
# [teste a7ecc64] foo.R criado no teste
#  1 file changed, 1 insertion(+)
#  create mode 100644 foo.R
git push origin teste
# Enumerating objects: 4, done.
# Counting objects: 100% (4/4), done.
# Delta compression using up to 8 threads
# Compressing objects: 100% (2/2), done.
# Writing objects: 100% (3/3), 286 bytes | 286.00 KiB/s, done.
# Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
# To https://github.com/fernandomayer/git-teste.git
# be48a64..a7ecc64  teste -> teste

## Volta para o master
git checkout master
# Switched to branch 'master'
# Your branch is up to date with 'origin/master'.

## Lista os arquivos
ls
# README

## Para incorporar as modificações do teste, fazemos um merge
git merge teste
# Updating 3fccd13..a7ecc64
# Fast-forward
#  README | 2 ++
#  foo.R  | 1 +
#  2 files changed, 3 insertions(+)
#  create mode 100644 foo.R

## Confere
ls
# foo.R  README

## O repo está modificado localmente
git status
# On branch master
# Your branch is ahead of 'origin/master' by 2 commits.
# (use "git push" to publish your local commits)
#
# nothing to commit, working tree clean

## Mas essas modificações precisam ser enviadas ao servidor
git push origin master
# Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
# To https://github.com/fernandomayer/git-teste.git
#  3fccd13..a7ecc64  master -> master

## Verifica o status
git status
# On branch master
# Your branch is up to date with 'origin/master'.
#
# nothing to commit, working tree clean
```

*****

Voltar: [Comandos básicos](1_comandos-basicos.md) |
Continuar: [Trabalho colaborativo](3_trabalho-colaborativo.md)
