eventosPart1(frente, Perigo, Hero):- caminho1(Perigo, Hero).
eventosPart1(direita, Perigo, Hero):- caminho2(Perigo, Hero).

eventosPart1(esquerda, Perigo, Hero):- 
   text('Você vê um abismo sem fim e decide que é melhor voltar...'),
	continuar,
	eventosPart1(voltar, Perigo, Hero).

eventosPart1(_, Perigo, Hero):-
   text('Posso ir para *frente*, *direita* ou *esquerda*'),
   ler(Acao),
   eventosPart1(Acao, Perigo, Hero).

eventosPart1_2('frente', Perigo, Hero):- caminho1_2(Perigo, Hero).

eventosPart1_2(Acao, Perigo, Hero):- (Acao == 'direita'; Acao == 'voltar'),
   text('Você volta e segue para direita'),
   continuar,
   caminho2(Perigo, Hero).

eventosPart1_2(_, Perigo, Hero):-
   text('Posso ir para *frente*, *direita* e *voltar*'),
   ler(Acao),
   eventosPart1_2(Acao, Perigo, Hero).

evento3('ler pedestal', Perigo, Hero):- caminho2_1(Perigo, Hero).
evento3('investigar esqueleto', Perigo, Hero):- caminho2_2(Perigo, Hero).
evento3('ir para luz', Perigo, Hero):- caminho1(Perigo, Hero).

evento3(_, Perigo, Hero):-
   text('Posso *ler pedestal* ou *investigar esqueleto* ou *ir para luz*'),
   ler(Acao),
   evento3(Acao, Perigo, Hero).
