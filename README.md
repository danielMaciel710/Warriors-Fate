# Warriors-Fate
Acompanhe a jornada de um grande guerreiro que em algum momento de sua jornada foi atraído para uma misteriosa caverna, esta que promete à aqueles que superarem seus desafios um imenso poder.
## Jogo baseado em texto
* Projeto feito em Haskell com Stack e em Prolog
* Todo o jogo acontecerá no terminal
## Jogabilidade
Todas as ações do jogador serão através da entrada de palavras ou frases. O decorrer da história aparecerá na tela do terminal em forma de texto. O jogador poderá se mover, atacar, usar itens, habilidades específicas e interagir com o cenário de forma bem simples, tudo isso escrevendo quando solicitado a ação que quiser realizar. O jogador poderá escolher entre duas classes: Guerreiro ou Mago. Ambos tem 3 habilidades mais o ataque básico.
## Como jogar (Versão em Haskell)
* Será preciso ter instalado o GHC, Cabal e o Stack;
* Baixe o arquivo do projeto compactado ou clone o projeto pelo git;
* Caso tenho baixado compactado, extraia os arquivos e entre no diretório;
* Depois no terminal, dentro da pasta do jogo, execute os seguintes comandos:
* stack build
* stack run
## Como jogar (Versão em Prolog)
* Será preciso instalar SWI-Prolog e o git, verificar no tutorial de instalação abaixo.
* Após ter instalado, clone o repositório:
* git clone https://github.com/danielMaciel710/Warriors-Fate.git
* Caso esteja no windows, abra o Prompt de comando e entre na pasta do jogo, depois escreva:
* git checkout prologMain
* Agora para iniciar o jogo:
* swipl warriorsFate.pl
* iniciar. 
* Obs: É necessário escrever o '.' do iniciar
* No linux basta fazer o mesmo processo no Terminal.
## Ajustes para melhorar a experiência do jogo
* De preferência coloque o terminal em tela cheia apertando F11, depois ajuste a tela do terminal apertando (Ctrl Shift + ) ou (Ctrl - ) até os traços que dividem o texto preencherem totalmente a tela sem passar para linha de baixo"
## Tutorial para instalação das dependências (Versão em Haskell)
* Rode esse código no terminal e siga os passos que aparecerão. Basta que instale o ghc, cabal e o stack:
* curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
## Tutorial para instalação das dependências (Versão em Prolog)
### No Linux siga os passos dados nesse site para instalar as dependências:
* https://www.swi-prolog.org/build/unix.html
* Depois instale o git com esse comando no terminal:
* sudo apt-get update sudo apt-get install git
### No Windows siga os passos dados nesses sites para instalar as dependências:
* https://www.swi-prolog.org/download/stable/bin/swipl-9.0.4-1.x64.exe.envelope
* https://git-scm.com/downloads
