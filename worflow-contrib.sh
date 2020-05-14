#=======================================================================
# Worflow para trabalho colaborativo
#=======================================================================

#-----------------------------------------------------------------------
# Pessoas colaborando sem criar branches

# Cria novo repositório no PET
# Verifica os acessos de todos
# Clona para o Mayer
# Clona para o Zissou

# MAYER
# Modifica arquivo
git status
git commit -am
git push origin master
cat README
git log --oneline

# ZISSOU
git fetch origin master
git diff master origin/master
git merge origin/master
cat README
git log --oneline
# Modifica arquivo
git commit -am
git push origin master
cat README
git log --oneline

# MAYER
git pull origin master
git status
cat README
git log --oneline
# Modifica arquivo
git commit -am
git push origin master
cat README
git log --oneline

# ZISSOU
# Nao faz o pull
# Altera o arquivo
git commit -am
cat README
git log --oneline
git push origin master
# CONFLITO
git pull origin master
# Aruma conflito
git commit -am
git push origin master

# MAYER
# Faz o pull
git pull origin master

#-----------------------------------------------------------------------
# Criando branches

# ZISSOU
git branch teste
git checkout teste
# Modifica README
git commit -am
# Cria script.R
git add .
git commit -m
git push origin teste

# Vai para o github e cria pull request

# MAYER
# Faz o merge, comenta, etc
git pull origin master
