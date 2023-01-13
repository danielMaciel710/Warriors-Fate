:- [lib].

iniciar:- mainMenu.

mainMenu:-
  writeln("___  __  ___ _    ____  ____  _  _____  ____   ___      _____  _  _____  _____"),
  writeln("\\  \\/  \\/  // \\  |    ||    || ||  _  ||    | /___|    |  ___|/ \\|_   _||  ___|"),
  writeln(" \\   /\\   // _ \\ |    ||    || || |_| ||    ||__  |    |  _| / _ \\ | |  |  ___|"),
  writeln("  \\_/  \\_//_/ \\_\\|_|\\_\\|_|\\_\\|_||_____||_|\\_\\|___/     |_|  /_/ \\_\\|_|  |_____|"),
  writeln("\n\nDigite *start* ou *help*.\n\n"),
  ler(Opcao),
  selecionar(Opcao).

selecionar(help):- text("Ajuda").

selecionar(start):- text("Início").

selecionar(_):- text("Entrada Inválida").
