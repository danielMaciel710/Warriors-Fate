part2(Nome):-
	formataTexto("Enquanto avança você avista 3 caminhos, um a esquerda, um a direia e um a sua frente", Texto),
	write(Texto),
	stringConcat(Nome, ": Hmm, ir em *frente*, para *direita* ou *esquerda*", Texto2),
	formataTexo(Texto2),
	read(Acao),
	eventosPart2(Acao, Nome).

eventosPart2("frente", Nome):- caminho1P2(Nome).
eventosPart2("direita", Nome):- caminho2P2(Nome).
eventosPart2("esquerda", Nome):-
	formataTexto("Ao seguir esse caminho, de alguma forma você volta para entrada...", Texto),
	write(Texto),
   stringConcat(Nome, ": Preciso tentar um caminho diferente...", Texto2),
   formataTexo(Texto2),
	write(Texto2),
	continuar(),
	write(""),
	stringConcat(Nome, ": Posso ir para *frente*, *direita*, ou *esquerda*", Texto3),
	write(Texto3),
	read(Acao),
	eventosPart2(Acao, Nome).

eventosPart2(_, Nome):-
	stringConcat(Nome, ": Posso ir para *frente*, *direita*, ou *esquerda*", Texto),
   write(Texto),
   read(Acao),
   eventosPart2(Acao, Nome).

caminho1P2(Nome):-
	formataTexto("Você continua em frente até encontrar dois caminhos", Texto),
	write(Texto),
	write("Ir pela *esquerda* ou *direita*?"),
	read(Acao),
	eventosPart2_2(Acao, Nome).

eventosPart2_2("esquerda", Nome):-
	formataTexto("Ao seguir esse caminho, de alguma forma você volta para entrada...", Texto),
   write(Texto),
   stringConcat(Nome, ": Preciso tentar um caminho diferente...", Texto2),
   formataTexo(Texto2),
   write(Texto2),
   continuar(),
   write(""),
   stringConcat(Nome, ": Posso ir para *frente*, *direita* ou *esquerda*", Texto3),
   write(Texto3),
   read(Acao),
   eventosPart2(Acao, Nome).

eventosPart2_2("direita", Nome):- caminho1_2P2(Nome).
eventosPart2_2(_, Nome):- 
   stringConcat(Nome, ": Posso ir para *direita* ou *esquerda*", Texto),
   write(Texto),
   read(Acao),
   eventosPart2_2(Acao, Nome).

caminho1_2P2(Nome):-
	formataTexto("Você continua em frente e dessa vez encontra três caminhos", Texto),
	write(Texto),
	stringConcat(Nome, ": Hmm, tenho o pressentimento de que estou perto de sair desse labirinto.", Texto2),
	write(Texto2),
	write("\nIr em *frente*, *esquerda* ou *direita*?"),
	read(Acao),
	eventosPart2_3(Acao, Nome).

eventosPart2_3("frente", Nome):-
	formataTexto("Ao seguir esse caminho, de alguma forma você volta para entrada...", Texto),
   write(Texto),
   stringConcat(Nome, ": Preciso tentar um caminho diferente...", Texto2),
   formataTexo(Texto2),
   write(Texto2),
   continuar(),
   write(""),
   stringConcat(Nome, ": Posso ir para *frente*, *direita*, ou *esquerda*", Texto3),
   write(Texto3),
   read(Acao),
   eventosPart2(Acao, Nome).


eventosPart2_3("direita", Nome):-
	formataTexto("Ao seguir esse caminho, de alguma forma você volta para entrada...", Texto),
   write(Texto),
   stringConcat(Nome, ": Com certeza aquele não era o caminho...", Texto2),
   formataTexo(Texto2),
   write(Texto2),
   continuar(),
   write(""),
   stringConcat(Nome, ": Posso ir para *frente*, *direita*, ou *esquerda*", Texto3),
   write(Texto3),
   read(Acao),
   eventosPart2(Acao, Nome).

eventosPart2_3("esquerda", Nome):-
	formataTexto("Você encontra uma poção de cura!", Texto),
	write(Texto),
	write("Você toma a poção e se sente revigorado!"),
	%Aumentar a vida do jogador,
	continuar(),
	formataTexto("Você avista um grande portão adornado que se destaca completamente no cenário.", Texto2),
	write(Texto2),
	continuar().


eventosPart2_3(_, Nome):-
	stringConcat(Nome, ": Posso ir para *frente*, *direita* ou *esquerda*", Texto),
   write(Texto),
   read(Acao),
   eventosPart2_3(Acao, Nome).

caminho2P2(Nome):-
	formataTexto("Você continua em frente até encontrar dois caminhos", Texto),
	write(Texto),
	write("Ir pela *esquerda* ou *direita*?"),
	read(Acao),
	eventosPart2_4(Acao, Nome).

eventosPart2_4("direita", Nome):-
	formataTexto("Ao seguir esse caminho, de alguma forma você volta para entrada...", Texto),
   write(Texto),
   stringConcat(Nome, ": Hmmm, preciso tentar um caminho diferente...", Texto2),
   formataTexo(Texto2),
   write(Texto2),
   continuar(),
   write(""),
   stringConcat(Nome, ": Posso ir para *frente*, *direita*, ou *esquerda*", Texto3),
   write(Texto3),
   read(Acao),
   eventosPart2(Acao, Nome).

eventosPart2_4("esquerda", Nome):-
	formataTexto("Você avista um grande portão adornado que se destaca completamente no cenário.", Texto),
	write(Texto),
	continuar().


eventosPart2_4(_, Nome):-
   stringConcat(Nome, ": *direita* ou *esquerda*", Texto),
   write(Texto),
   read(Acao),
   eventosPart2_4(Acao, Nome).
