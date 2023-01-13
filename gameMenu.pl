:- [lib],
   [gamePart1].

iniciar:- mainMenu.

mainMenu:-
   writeln('___  __  ___ _    ____  ____  _  _____  ____   ___      _____  _  _____  _____'),
   writeln('\\  \\/  \\/  // \\  |    ||    || ||  _  ||    | /___|    |  ___|/ \\|_   _||  ___|'),
   writeln(' \\   /\\   // _ \\ |    ||    || || |_| ||    ||__  |    |  _| / _ \\ | |  |  ___|'),
   writeln('  \\_/  \\_//_/ \\_\\|_|\\_\\|_|\\_\\|_||_____||_|\\_\\|___/     |_|  /_/ \\_\\|_|  |_____|'),
   writeln('\n\nDigite *start* ou *help*.\n\n'),
   ler(Opcao),
   selecionar(Opcao).

selecionar(start):- startGame.

selecionar(help):- text('Help'),
   text('Todas as ações do jogador serão através da entrada de palavras ou frases. O jogador poderá se mover, atacar, usar habilidades específicas e interagir com o cenário de forma bem simples.\n\nNas batalhas aparecerá os valores dos atributos do inimigo ou do jogador dependendo se ele usou uma habilidade ou o inimigo tenha usado.\n\nPara uma melhor experiência do jogo, ajuste a tela apertando (Ctrl + Shift + ) ou (Ctrl - ) até os traços que dividem o texto preencherem totalmente a tela sem passar para linha de baixo'),
   text('Digite *voltar* ou *sair*'),
   ler(Opcao),
   selecionar(Opcao).

selecionar(voltar):- mainMenu.

selecionar(sair):- exit.

selecionar(_):- text('Entrada Inválida'),
   mainMenu.