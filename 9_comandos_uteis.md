# Alguns comandos úteis

> **ATENÇÃO:** os comandos mostrados aqui são uma compilação sem nenhuma
> ordem específica.

## Remover e mover arquivos

Comandos similares aos do shell `rm` e `mv`, mas mantém a
rastreabilidade do git

```bash
git rm foo.R
git mv foo.R
```
Para remover arquivos do repositorio remoto, mas manter localmente

```bash
git rm --cached foo.R
```
este comando é útil se você enviou para o repositório remoto algum
arquivo que não deveria ou não precisava (como arquivos de compilação
do LaTeX, ...). Para evitar que isso aconteça é possível criar um
arquivo chamado .gitignore contendo os arquivos que não precisam ser
enviados ao servidor remoto

## Recuperando versões de arquivos

Para reverter um único arquivo para uma versão anterior (sabendo que o
arquivo é foo.R e o hash SHA do commit é, por exemplo,
`03f9c0abe911440339ecb82e08ec8ae65ca11a7b`)

```bash
git checkout 03f9c0a foo.R
```

Para reverter um unico arquivo para uma versao anterior (sendo que
esse arquivo foi DELETADO em algum commit anterior)
se voce nao lembra o nome do arquivo, execute esse comando que
identifica os modos 'delete'

```bash
git log --diff-filter=D --summary | grep delete
```
Sabendo o nome do arquivo, voce pode conferir o log para identificar o
commit que o deletou

```bash
git log -- <arquivo-deletado>
```
NOTE que se o arquivo estava em um sub-diretorio dentro do seu
projeto, ele deve ser especificado com o caminho relativo para esse
diretorio. Para ter certeza do commit que deletou o arquivo, veja

```bash
git rev-list -n 1 HEAD -- <arquivo-deletado>
```
E finalmente para recuperar o arquivo faca o checkout no commit
anterior (por isso o `^` ao final do commit)

```basg
git checkout <commit-que-deletou>^ -- <arquivo-deletado>
```
O arquivo deletado devera voltar para o diretorio (ou sub-diretorio se
ele estava em um) como um novo arquivo.

## Commits

Para corrigir uma mensagem de commit que ainda não foi enviada para um
remote. Essa será a mensagem utilizada nos logs e irá substituir
qualquer outra anterior

```bash
git commit --amend -m 'mensagem nova'
```

## Tags

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
git tag -a v0.1 -m 'Mensagem de commit'
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
