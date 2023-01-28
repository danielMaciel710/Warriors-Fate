eventosPart1(frente, Perigo, Nome):- caminho1(Perigo, Nome).
eventosPart1(direita, Perigo, Nome):- caminho2(Perigo, Nome).

eventosPart1(esquerda, Perigo, Nome):- 
   text('Você vê um abismo sem fim e decide que é melhor voltar...'),
	continuar,
	eventosPart1(voltar, Perigo, Nome).

eventosPart1(_, Perigo, Nome):-
   string_concat(Nome, ': Posso ir para *frente*, *direita* ou *esquerda*', Texto),
   text(Texto),
   ler(Acao),
   eventosPart1(Acao, Perigo, Nome).

eventosPart1_2('frente', Perigo, Nome):- caminho1_2(Perigo, Nome).

eventosPart1_2(Acao, Perigo, Nome):- (Acao == 'direita'; Acao == 'voltar'),
   text('Você volta e segue para direita'),
   continuar,
   caminho2(Perigo, Nome).

eventosPart1_2(_, Perigo, Nome):-
   text('Posso ir para *frente*, *direita* e *voltar*'),
   ler(Acao),
   eventosPart1_2(Acao, Perigo, Nome).

evento3('ler pedestal', Perigo, Nome):- caminho2_1(Perigo, Nome).
evento3('investigar esqueleto', Perigo, Nome):- caminho2_2(Perigo, Nome).
evento3('ir para luz', Perigo, Nome):- caminho1(Perigo, Nome).

evento3(_, Perigo, Nome):-
   string_concat(Nome, ': Posso *ler pedestal* ou *investigar esqueleto* ou *ir para luz*', Texto),
	text(Texto),
   ler(Acao),
   evento3(Acao, Perigo, Nome).
