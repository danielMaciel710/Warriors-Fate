:- [lib].

eventosPart2(frente, Nome, 1):-
	text('Você continua em frente até encontrar dois caminhos'),
	write('Ir pela *esquerda* ou *direita*?'),
	ler(Acao),
	eventosPart2(Acao, Nome, 2).

voltarInicio:-
	text('Ao seguir esse caminho, de alguma forma você volta para entrada...'),
   string_concat(Nome, ': Preciso tentar um caminho diferente...', Texto2),
   text(Texto2),
   continuar,
   write(''),
   string_concat(Nome, ': Posso ir para *frente*, *direita* ou *esquerda*', Texto3),
   write(Texto3),
   ler(Acao),
   eventosPart2(Acao, Nome, 1).

eventosPart2(direita, Nome, 1):-
	text('Você continua em frente até encontrar dois caminhos'),
	write('Ir pela *esquerda* ou *direita*?'),
	ler(Acao),
	eventosPart2(Acao, Nome, 3).

eventosPart2(esquerda, Nome, 1):- voltarInicio.
eventosPart2(direita, Nome, 2):-
	text('Você continua em frente e encontra mais dois caminhos'),
	write('\nIr para *esquerda* ou *direita*?'),
	ler(Acao),
	eventosPart2(Acao, Nome, 4).

eventosPart2(esquerda, Nome, 2):- voltarInicio.
eventosPart2(direita, Nome, 3):- voltarInicio.
eventosPart2(esquerda, Nome, 3):-
	text('Você avista um grande portão adornado que se destaca completamente no cenário.'),
	continuar().

eventosPart2(direita, Nome, 4):-
	text('Você continua em frente e dessa vez encontra três caminhos'),
	string_concat(Nome, ': Hmm, tenho o pressentimento de que estou perto de sair desse labirinto.', Texto2),
	write(Texto2),
	write('\nIr em *frente*, *esquerda* ou *direita*?'),
	ler(Acao),
	eventosPart2(Acao, Nome, 5).

eventosPart2(esquerda, Nome, 4):- voltarInicio.
eventosPart2(frente, Nome, 5):- voltarInicio.

eventosPart2(direita, Nome, 5):-
	text('Você encontra uma poção de cura!'),
	write('Você toma a poção e se sente revigorado!'),
	continuar(),
	text('Você avista um grande portão adornado que se destaca completamente no cenário.'),
	continuar().

eventosPart2(esquerda, Nome, 5):- voltarInicio.

eventosPart2(_, Nome, Nivel):- 
 	string_concat(Nome, ': Posso ir para *direita* ou *esquerda*', Texto),
   write(Texto),
   ler(Acao),
   eventosPart2(Acao,Nome, Nivel).

part2(Nome):-
	text('Enquanto avança você avista 3 caminhos,  
	um a esquerda, um a direia e um a sua frente'),
	string_concat(Nome, ': Hmm, ir em *frente*, para *direita* ou *esquerda*', Texto2),
	text(Texto2),
	ler(Acao),
	eventosPart2(Acao, Nome).
