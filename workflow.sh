# Cria diretório
mkdir primeiro
ls
cd primeiro
ls -a

# Inicia repositório git
git init
ls -a
# Cria um arquivo
nano README.md
# Verifica status
git status
# Adiciona arquivo (STAGE)
git add README.md
git status
# Inclui no repositório (COMMIT)
git commit -m 'Primeiro commit'
git status
# Veja o log
git log
git log --oneline
# Adiciona mais conteúdo no arquivo
nano README.md
git status
git diff
# Adiciona e comita ao mesmo tempo
git commit -am 'Edita arquivo'
git status
git log
git log --oneline

# Adiciona repositório remoto
# No GitHub crie um repositório com o mesmo nome deste diretório
# Adicione o endereço remoto como origin
git remote add origin git@github.com:fernandomayer/primeiro.git
git remote show
git status
# Envia (PUSH) o repositório local para o remoto
git push -u origin master
git status

# Trabalhando com branches
# Verifica os branches atuais
git branch
# Cria um novo branch
git branch novo
git branch
# Entra nesse novo branch
git checkout novo
git branch
ls -a
git log --oneline
git diff master...novo
# Adiciona mais uma linha no arquivo
nano README.md
git status
git diff
# Adiciona e comita essa edição
git commit -am 'Mais alterações'
git status
git log --oneline
git diff master...novo
# Para incorporar essa edição no master, volta e faz um merge
git checkout master
git branch
git log --oneline
git diff master...novo
git merge novo
git status
git log --oneline
git diff master...novo
cat README.md

# Note que tudo isso foi feito localmente. Para enviar para o servidor
# use o push
git status
git push origin master
git status

# Deleta o ramo novo
git branch
git branch -d novo
git branch

# Mais uma edição no arquivo para ver o resultado
nano README.md
git status
git commit -am 'Ultima edição'
git status
# Envia para o repositório
git push origin master
git status
