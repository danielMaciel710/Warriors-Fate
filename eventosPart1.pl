eventosPart1(frente, Perigo, Nome):- caminho1(Perigo, Nome).
eventosPart1(direita, Perigo, Nome):- caminho2(Perigo, Nome).
eventosPart1(esquerda, Perigo, Nome):- caminho3(Perigo, NOme).
eventosPart1(_, Perigo, Nome):-
   stringConcat(Nome, ': Posso ir para *frente*, *direita* ou *esquerda*', Texto),
   text(Texto),
   read(NovaAcao),
   eventosPart1(NovaAcao, Perigo, Nome).

eventosPart1_2('frente', Perigo, Nome):- caminho1_2(Perigo, Nome).
eventosPart1_2('direita', Perigo, Nome):-
   text('Você volta e segue para direita'),
   continuar,
   caminho2(Perigo, Nome).
eventosPart1_2('voltar', Perigo, Nome):-
   text('Você volta e segue para direita'),
   continuar,
   caminho2(Perigo, Nome).
eventosPart1_2(_, Perigo, Nome):-
   text('Posso ir para *frente*, *direita* e *voltar*'),
   continuar,
   read(Acao),
   eventosPart1_2(Acao, Perigo, Nome).

evento3('ler pedestal', Perigo, Nome):- caminho2_1(Perigo, Nome).
evento3('investigar esqueleto', Perigo, Nome):- caminho2_2(Perigo, Nome).
evento3('ir para luz', Perigo, Nome):- caminho1(Perigo, Nome).
evento3(_, Perigo, Nome):-
   stringConcat(Nome, ': Posso *ler pedestal*, ou *investigar esqueleto* ou *ir para luz*', Texto2),
	text(Texto2),
   read(Acao),
   evento3(Acao, Perigo, Nome).
