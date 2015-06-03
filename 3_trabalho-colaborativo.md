# Trabalho colaborativo

Existem dois modelos básicos de trabalhos em colaboração com outros autores:

* **Shared repository**: todos os autores tem permissão para alterar
  (`add`, `push`, `commit`, `pull`, criar *branches*, ...) o repositório
  principal. Mais utilizado para projetos com poucos colaboradores. 

* **Fork & Pull**: todos os colaboradores trabalham em *forks* do
  projeto original. Para incorporar o trabalho é necessário enviar um
  *pull request* para o mantenedor do projeto, e ele decide se junta
  (`merge`) ou não as modificações. Mais utilizado quando há muitos
  colaboradores. 

Abaixo segue uma descrição de como trabalhar nois dois casos.

## Shared repository

Supondo dois colaboradores trabalhando em conjunto no mesmo repositório,
um possível *workflow* de trabalho seria o seguinte: 

1. Autor A cria o repositório, adiciona arquivos e concede permissão
   para o autor B. 

2. O autor B precisa **clonar** o repositório a primeira vez para baixar
todos os arquivos 
```bash
$ git clone git@github.com:autorA/repositorio-compartilhado.git
```
Note que o `clone` não traz apenas os arquivos do repositório, mas
também toda a história (commits) que já foi feita pelo autor A. 

3. O autor A faz modificações no repositório, usando o *workflow*
tradicional 
```bash
$ git add foo.R
$ git commit -m 'modificado foo'
$ git push origin master
```
Nesse momento os arquivos modificados estão localmente para o autor A, e
no repositório. O autor B ainda está com as versões iniciais dos
arquivos. Para que o autor B possa comitar modificações futuras sem
conflitos, ele precisa "atualizar" seus arquivos com aqueles que estão
no repositório. Para isso ele faz 
```bash
$ git fetch origin master
```
O comando `fetch` não junta automaticamente as modificações, ele apenas
traz para a *staging area* do autor B, e estão no *branch* remoto apenas
(`origin/master`). Os arquivos do autor B continuam intactos (no
*branch* `master`). Para ver as modificações feitas pelo autor A, o
autor B pode fazer 
```bash
$ git diff master origin/master
```
O autor B precisa unir estas modificações para o seu *branch* `master`
local para poder continuar trabalhando e enviar commits 
```bash
$ git merge master origin/master
```

4. Nesse ponto, o autor B criou automaticamente um novo commit com o
`merge`, contendo as modificações. Portanto, agora o *branch* `master`
do autor B, contém um commit a mais do que o *branch* remoto
`origin/master`. Por isso, o autor B precisa enviar esse novo commit
para o servidor através do `push` 
```bash
$ git push origin master
```

5. Sempre antes de começar a trabalhar em um repositório compartilhado,
   execute o `git fetch` (ou analise o histórico de commits no GitHub)
   para ter certeza de que está com as últimas versões dos arquivos. 

> **NOTA**: o comando `git pull` faz o trabalho do `git fetch` e `git
> merge` ao mesmo tempo, ou seja, ele busca os arquivos modificados nos
> repositórios e faz o merge automaticamente. Só é recomendado caso você
> tenha certeza que quer incorporar as modificações (e já conhece todas
> elas). Resumindo: pode ser perigoso! 

Uma boa visualização do que acontece no repositório com os comandos
acima pode ser vista no capítulo 5 do [Progit][]. 

Para entender a diferença entre um ***branch* local** e um ***branch*
remoto** aprenda com os [GitGuys][]. 


## Fork & Pull

TODO


## Links úteis

* https://help.github.com/articles/using-pull-requests
* http://git-scm.com/book/en/Distributed-Git-Contributing-to-a-Project

[Progit]: http://git-scm.com/book/en/Distributed-Git-Contributing-to-a-Project
[GitGuys]: http://www.gitguys.com/topics/tracking-branches-and-remote-tracking-branches/


*****

Voltar: [Trabalhando com branches](2_trabalhando-com-branches.md)
