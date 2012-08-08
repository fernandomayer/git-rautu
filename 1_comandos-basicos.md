# Comandos básicos do Git

Após a configuração inicial, podemos criar um repositório e começar a trabalhar com arquivos que serão "rastreados" pelo Git.

Um repositório (ou *repo*) é um diretório local onde os arquivos de um projeto serão armazenados. O Git funciona normalmente em um repositório local, e não é necessário haver um servidor central para o armazenamento dos arquivos (como é comum em *sistemas controladores de versão centralizados* como CVS e Subversion). No entanto, o uso de um servidor central é fundamental para projetos colaborativos e de software livre.

Um servidor do Git pode ser local (um servidor privado por exemplo), ou remoto. Um servidor remoto é mais simples e fácil de ser utilizado pois já existem alguns serviços disponíveis para hospedar repositórios do Git. O GitHub é um destes servidores, mas existem [vários outros disponíveis](https://git.wiki.kernel.org/index.php/GitHosting). A escolha de um deles em particular não irá interferir no funcionamento do Git, pois os comandos são os mesmos. A diferença se dá apenas na visualização *on-line* e outras facilidades que cada servidor apresenta. Aqui vamos utilizar o GitHub.

## Criando um repositório

Para criar um repositório no GitHub, clique no botão `New repository` disponível na sua página inicial, especifique um nome e opcionalmente uma descrição. Aqui neste exemplo vou criar um repo chamado `git-teste`, que está disponível em (https://github.com/fernandomayer/git-teste). 

Até aqui o repositório foi criado no GitHub, e isso é importante pois agora temos um endereço no servidor para onde vamos enviar os arquivos criados localmente. Agora é a hora de criar um diretório local e iniciar o Git fazendo ele se comunicar com o servidor. Para isso fazemos

```bash
$ mkdir git-teste
# entra
$ cd git-teste
```



