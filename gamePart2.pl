part2(Nome):-
	text('Enquanto avança você avista 3 caminhos, um a esquerda, um a direita e um a sua 
frente'),
	string_concat(Nome, ': Hmm, ir em *frente*, para *direita* ou *esquerda*', Texto),
	text(Texto),
	ler(Acao),
	eventosPart2(Acao, Nome, 1).

voltarInicio(Nome):-
	text('Ao seguir esse caminho, de alguma forma você volta para entrada...'),
	string_concat(Nome, ': Preciso tentar um caminho diferente...', Texto),
	text(Texto),
	continuar,
	string_concat(Nome, ': Posso ir para *frente*, *direita* ou *esquerda*', Texto2),
	text(Texto2),
	ler(Acao),
	eventosPart2(Acao, Nome, 1).


eventosPart2(frente, Nome, 1):-
	text('Você continua em frente até encontrar dois caminhos'),
	text('Ir pela *esquerda* ou *direita*?'),
	ler(Acao),
	eventosPart2(Acao, Nome, 2).

eventosPart2(direita, Nome, 1):-
	text('Você continua em frente até encontrar dois caminhos'),
	text('Ir pela *esquerda* ou *direita*?'),
	ler(Acao),
	eventosPart2(Acao, Nome, 3).

eventosPart2(esquerda, Nome, 1):- voltarInicio(Nome).


eventosPart2(direita, Nome, 2):-
	text('Você continua em frente e encontra mais dois caminhos
Ir para *esquerda* ou *direita*?'),
	ler(Acao),
	eventosPart2(Acao, Nome, 4).

eventosPart2(esquerda, Nome, 2):- voltarInicio(Nome).


eventosPart2(direita, Nome, 3):- voltarInicio(Nome).
eventosPart2(esquerda, _, 3):-
	text('Você avista um grande portão adornado que se destaca completamente no cenário.'),
	continuar().


eventosPart2(direita, Nome, 4):-
	text('Você continua em frente e dessa vez encontra três caminhos'),
	string_concat(Nome, ': Hmm, tenho o pressentimento de que estou perto de sair desse labirinto.',
	  Texto2),
	text(Texto2),
	text('Ir em *frente*, *esquerda* ou *direita*?'),
	ler(Acao),
	eventosPart2(Acao, Nome, 5).

eventosPart2(esquerda, Nome, 4):- voltarInicio(Nome).


eventosPart2(frente, Nome, 5):- voltarInicio(Nome).

eventosPart2(direita, _, 5):-
	text('Você encontra uma poção de cura!'),
	text('Você toma a poção e se sente revigorado!'),
	continuar(),
	text('Você avista um grande portão adornado que se destaca completamente no cenário.'),
	continuar().

eventosPart2(esquerda, Nome, 5):- voltarInicio(Nome).


eventosPart2(_, Nome, Nivel):- 
 	string_concat(Nome, ': Posso ir para *direita* ou *esquerda*', Texto),
	text(Texto),
	ler(Acao),
	eventosPart2(Acao,Nome, Nivel).
