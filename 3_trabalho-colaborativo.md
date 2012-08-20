# Trabalho colaborativo

Existem dois modelos básicos de trabalhos em colaboração com outros autores:

* **Shared repository**: todos os autores tem permissão para alterar (`add`, `push`, `commit`, `pull`, criar *branches*, ...) o repositório principal. Mais utilizado para projetos com poucos colaboradores.

* **Fork & Pull**: todos os colaboradores trabalham em *forks* do projeto original. Para incorporar o trabalho é necessário enviar um *pull request* para o mantenedor do projeto, e ele decide se junta (`merge`) ou não as modificações. Mais utilizado quando há muitos colaboradores.

Abaixo segue uma descrição de como trabalhar nois dois casos

## Shared repository

Supondo dois colaboradores trabalhando em conjunto no mesmo repositório, um possível *workflow* de trabalho seria o seguinte:

1. Autor A cria o repositório, adiciona arquivos e concede permissão para o autor B.

2. O autor B precisa **clonar** o repositório a primeira vez para baixar todos os arquivos
```bash
$ git clone git@github.com:autorA/repositorio-compartilhado.git
```
Note que o `clone` não traz apenas os arquivos do repositório, mas também toda a história (commits) que já foi feita pelo autor A.

## Fork & Pull

TODO


## Links úteis

https://help.github.com/articles/using-pull-requests
http://git-scm.com/book/en/Distributed-Git-Contributing-to-a-Project

