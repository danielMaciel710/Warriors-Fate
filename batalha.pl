acaoJogador(0, Esqueleto, Hero, NewHero):-
	text("Devo: *Atacar* ou usar *Habilidade*?"),
	ler(Opcao),
	batalhaEsqueleto(Opcao, Esqueleto, Hero, NewHero).

batalhaEsqueleto('atacar', Esqueleto, Hero, NewHero):-
	getVariaveisHero(Hero, Atributos, Habilidades, Nome, Classe, VidaAtual, VidaTotal, Defesa),
	getVariaveisEsqueleto(Esqueleto, AtributosEs, VidaAtualEs, VidaTotalEs),
	nth0(0, Habilidades, AtaqueBasico),
	nth0(0, AtaqueBasico, Texto),
	nth0(1, AtaqueBasico, Dano),
	nth0(1, AtributosEs, Experiencia),

	%Ataque jogador
	write(Texto),
	write(" e dá "),
	write(Dano),
	write(" de dano no inimigo."),
	continuar,
	
	VidaEs is VidaAtualEs - Dano,
	mostrarVidas(VidaTotal, VidaAtual, VidaTotalEs, VidaEs),

	VidaEs =< 0 -> youWin(Experiencia);

	getVariaveisHero(Hero, Atributos, Habilidades, Nome, Classe, VidaAtual, VidaTotal, Defesa),
	getVariaveisEsqueleto(Esqueleto, AtributosEs, VidaAtualEs, VidaTotalEs),
	nth0(0, Habilidades, AtaqueBasico),
	nth0(0, AtaqueBasico, Texto),
	nth0(1, AtaqueBasico, Dano),
	nth0(1, AtributosEs, Experiencia),

	%Ataque jogador
	VidaEs is VidaAtualEs - Dano,
	write(Texto),
	write(" e dá "),
	write(Dano),
	write(" de dano no inimigo."),
	continuar,
	gerarEsqueleto(VidaEs, NewEsqueleto),
	mostrarVidas(VidaTotal, VidaAtual, VidaTotalEs, VidaEs),

	%Selecionando habilidade do Esqueleto
	random(0, 10, Resul),

	%Primeira Habilidade Esqueleto
	Resul >= 6 -> 	

	%Ataque do Esqueleto
	DanoRecebido is 33 - Defesa,
	write("O Esqueleto ataca dando "),
	write(DanoRecebido),
	write(" de dano!"),
	continuar,
	NovaVidaTotal is VidaAtual - DanoRecebido,
	mostrarVidas(VidaTotal, NovaVidaTotal, VidaTotalEs, VidaAtualEs),
	%Fim de jogo, jogador perde
	NovaVidaTotal =< 0 -> gameOver; 
	

	getVariaveisHero(Hero, Atributos, Habilidades, Nome, Classe, VidaAtual, VidaTotal, Defesa),
	getVariaveisEsqueleto(Esqueleto, AtributosEs, VidaAtualEs, VidaTotalEs),
	nth0(0, Habilidades, AtaqueBasico),
	nth0(0, AtaqueBasico, Texto),
	nth0(1, AtaqueBasico, Dano),
	nth0(1, AtributosEs, Experiencia),
	nth0(2, Atributos, Forca),
	nth0(3, Atributos, Destreza),
	nth0(4, Atributos, Constituicao),
	nth0(5, Atributos, Inteligencia),

	%Ataque jogador
	write(Texto),
	write(" e dá "),
	write(Dano),
	write(" do dano no inimigo."),
	continuar,
	
	VidaEs is VidaAtualEs - Dano,	
	mostrarVidas(VidaTotal, VidaAtual, VidaTotalEs, VidaEs),
	DanoRecebido is 33 - Defesa,
	write("O Esqueleto ataca dando "),
	write(DanoRecebido),
	write(" de dano!"),
	continuar,
	gerarEsqueleto(VidaEs, NewEsqueleto),
	NovaVidaTotal is VidaAtual - DanoRecebido,
	hero(Nome, Classe, Vida, Forca, Destreza, Constituicao, Inteligencia, NovaVidaTotal, NewHero),
	acaoJogador(0, NewEsqueleto, NewHero, NewHero2);


	getVariaveisHero(Hero, Atributos, Habilidades, Nome, Classe, VidaAtual, VidaTotal, Defesa),
	getVariaveisEsqueleto(Esqueleto, AtributosEs, VidaAtualEs, VidaTotalEs),
	nth0(0, Habilidades, AtaqueBasico),
	nth0(0, AtaqueBasico, Texto),
	nth0(1, AtaqueBasico, Dano),
	nth0(1, AtributosEs, Experiencia),

	%Ataque jogador
	VidaEs is VidaAtualEs - Dano,	
	mostrarVidas(VidaTotal, VidaAtual, VidaTotalEs, VidaAtualEs),
	write(Texto),
	write(" e dá "),
	write(Dano),
	write(" de dano no inimigo."),
	continuar,
	VidaEs is VidaAtualEs + 15,
	text("O esqueleto enrijece seus ossos, aumentando sua vida"),
	continuar,
	gerarEsqueleto(VidaEs, NewEsqueleto),
	acaoJogador(0, NewEsqueleto, Hero, NewHero).



apareceInimigo(0, Hero0, Hero1):- 
	gerarEsqueleto(100, Esqueleto),
	text("SURGE UM ESQUELETO!!!"),
	continuar,
	statusEsqueleto(StatusEsqueleto),
	write(StatusEsqueleto),
	acaoJogador(0, Esqueleto, Hero0, Hero1).
