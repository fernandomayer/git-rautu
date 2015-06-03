## Trabalhando com branches

A seguir um exemplo comentado de uma sessão utilizando os *branches* do Git. Para mais detalhes ver o capítulo 3 do [livro do Git](http://git-scm.com/book/en/Git-Branching)

```bash
# confere os branches atuais
$ git branch 
* master

# cria um novo branch chamado teste e confere
$ git branch teste
$ git branch 
* master
  teste

# altera o workspace para o branch teste
$ git checkout teste 
Switched to branch 'teste'

# confere novamente
$ git branch 
  master
* teste

# lista arquivos
$ ls
README

# modifica o README
$ emacs README &

# verifica o status
$ git status 
# On branch teste
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#	modified:   README
#
no changes added to commit (use "git add" and/or "git commit -a")

# add, commit e push
$ git add .
$ git commit -m 'adicionada uma linha no branch teste'
$ git push origin teste
Counting objects: 5, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 340 bytes, done.
Total 3 (delta 0), reused 0 (delta 0)
To git@github.com:fernandomayer/git-teste.git
 * [new branch]      teste -> teste

# cria um novo arquivo
$ emacs foo.R &
$ ls
foo.R  README
$ git status 
# On branch teste
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	foo.R
nothing added to commit but untracked files present (use "git add" to track)

# add, commit, push
$ git add .
$ git commit -m 'foo.R criado no teste'
$ git push origin teste 

# volta para o master
$ git checkout master 
Switched to branch 'master'

# lista os arquivos
$ ls
README

# para incorporar as modificações do teste, fazemos um merge
$ git merge teste
Updating 03f9c0a..fb62316
Fast-forward
 README |    4 +++-
 foo.R  |    1 +
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 foo.R

# confere
$ ls
foo.R  README

# o repo está modificado localmente
$ git status 
# On branch master
nothing to commit (working directory clean)

# mas essas modificações precisam ser enviadas ao servidor
$ git push origin master 
Total 0 (delta 0), reused 0 (delta 0)
To git@github.com:fernandomayer/git-teste.git
   03f9c0a..fb62316  master -> master
```

*****

Voltar: [Comandos básicos](1_comandos-basicos.md) | 
Continuar: [Trabalho colaborativo](3_trabalho-colaborativo.md)
