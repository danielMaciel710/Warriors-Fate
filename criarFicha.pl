hero(Nome, 'guerreiro', Vida, Forca, Destreza, Constituicao, Inteligencia, VidaAtual, Hero):-
	%Equipamentos
	Armadura = ["Armadura antiga de cavaleiro", 20],
	nth0(0, Armadura, NomeArmadura),
	nth0(1, Armadura, DefesaArmadura),
	Arma = ["Greatsword", 15],
	nth0(0, Arma, NomeArma),
	nth0(1, Arma, DanoArma),
	Equipamentos = [Armadura, Arma],
	
	%Atributos
	Experiencia = 1000,
	Mana is 5 * Inteligencia,
	Stamina is 5 * Constituicao,
	Defesa is DefesaArmadura + Constituicao/2,
	Atributos = 
	[Vida, Stamina, Forca, Destreza, Constituicao, Inteligencia, Defesa, Mana, Experiencia],
	
	%Habilidades
	DanoAtaqueBasico is DanoArma + Forca,
	string_concat("Você ataca com ", NomeArma, Texto),
	AtaqueBasico = [Texto, DanoAtaqueBasico],
	DanoAtaqueConcentrado is DanoArma + Forca + Destreza,
	AtaqueConcentrado = ["Você se concentra e desfere um ataque devastador!", DanoAtaqueConcentrado, 15],

	DanoAtaqueGiratorio is DanoArma + Forca/2 + Destreza,
	AtaqueGiratorio = ["Você gira e ataca rapidamente, acertando os inimigos ao seu redor!", DanoAtaqueGiratorio, 20],

	ContraAtaque = ["Você se concentra e aguarda o movimento do inimigo...", 20],

	Habilidades =
  	[AtaqueBasico, AtaqueConcentrado, AtaqueGiratorio, ContraAtaque],
	
	Hero = [Atributos, Habilidades, Equipamentos, Nome, 'guerreiro', VidaAtual].

hero(Nome, 'mago', Vida, Forca, Destreza, Constituicao, Inteligencia, VidaAtual, Hero):-
	%Equipamentos
	Armadura = ["Robe Mágico antigo", 10],
	nth0(0, Armadura, NomeArmadura),
        nth0(1, Armadura, DefesaArmadura),
	Arma = ["Cajado Mágico", 5],
	nth0(0, Arma, NomeArma),
	nth0(1, Arma, DanoArma),
	Equipamentos = [Armadura, Arma],
	
	%Atributos
	Experiencia = 1000,
	Mana is 5 * Inteligencia,
	Stamina is 5 * Constituicao,
	Defesa is Armadura + Constituicao/2,
	Atributos = 
	[Vida, Stamina, Forca, Destreza, Constituicao, Inteligencia, Defesa, Mana, Experiencia],
	
	%Habilidades
	string_concat("Você ataca com ", NomeArma, Texto),
	DanoAtaqueBasico is DanoArma + Forca,
	AtaqueBasico = [Texto, DanoAtaqueBasico],

	DanoRaio is DanoArma + Inteligencia + Destreza,
	string_concat("Você se concentra e solta um raio com ", NomeArma, Texto2),
	Raio = [Texto2, DanoRaio, 15],

	DanoBolaDeFogo is DanoArma + 2 * Inteligencia,
	string_concat("Você se concentra e solta uma Bola de fogo com ", NomeArma, Texto3),
	BolaDeFogo = [Texto3, DanoBolaDeFogo, 20],

	AuraMisteriosa = ["Você gera uma aura roxa com espinhos ao seu redor", 20],

	Habilidades =
	[AtaqueBasico, Raio, BolaDeFogo, AuraMisteriosa],

	Hero = [Atributos, Habilidades, Equipamentos, Nome, 'mago', VidaAtual].
	
validarPontos(TotalPontos, PontosUsados, NovosPontos):-
	(PontosUsados =< TotalPontos -> NovosPontos = PontosUsados;
	text("Pontos insuficientes, escolha um valor válido:"),
	read(Pontos),
  	validarPontos(TotalPontos, Pontos, NovosPontos)).
	
definir('vida', Pontos, TotalPontos):-
	text("Vida = "),
	read(Vida),
	validarPontos(Pontos, Vida, NovosPontos),
	TotalPontos is Pontos - NovosPontos,
	write("Pontos disponíveis para distribuir: "),
	write(TotalPontos).

definir('forca', Pontos, TotalPontos):-
	text("Força = "),
	read(Forca),
	validarPontos(Pontos, Forca, NovosPontos),
	TotalPontos is Pontos - NovosPontos,
	write("Pontos disponíveis para distribuir: "),
	write(TotalPontos).

definir('destreza', Pontos, TotalPontos):-
	text("Destreza = "),
	read(Destreza),
   	validarPontos(Pontos, Destreza, NovosPontos),
	TotalPontos is Pontos - NovosPontos,
	write("Pontos disponíveis para distribuir: "),
        write(TotalPontos).

definir('constituicao', Pontos, TotalPontos):-
	text("Constituição = "),
	read(Constituicao),
   	validarPontos(Pontos, Constituicao, NovosPontos),
	TotalPontos is Pontos - NovosPontos,
	write("Pontos disponíveis para distribuir: "),
        write(TotalPontos).

definir('inteligencia', Pontos, TotalPontos):-
	text("Inteligência = "),
	read(Inteligencia),
   	validarPontos(Pontos, Inteligencia, NovosPontos),
	TotalPontos is Pontos - NovosPontos,
	write("Pontos disponíveis para distribuir: "),
        write(TotalPontos).

definir('nome', Nome, Classe, Hero):-
	string_concat(Nome, ", este é mesmo seu nome? digite *n* para alterar ou *s* para continuar: ", Texto),
	text(Texto),
	ler(R),
	validarNome(R, Nome, Classe, Hero).
	

validarNome(n, Nome, Classe, Hero):- criarFicha(Classe, Hero).
validarNome(s, Nome, Classe, Hero):-
	text("Usar configuração *padrão* para personagem, ou *personalizado*?"),
	ler(Opcao),
	ficha(Opcao, Nome, Classe, Hero).

validarNome(_, _, Classe, Hero):- text("Entrada inválida"), criarFicha(Classe, Hero).

sobraramPontos(Classe):-
	text("Sobraram pontos, criar ficha de novo? *n* para continuar e *qualquer tecla* para redistribuir os pontos."),
	ler(Opcao),
	(Opcao =\= n -> criarFicha(Classe, _)).

ficha('padrao', Nome, Classe, Hero):- hero(Nome, Classe, 25, 25, 25, 25, 25, 25, Hero).
ficha('personalizado', Nome, Classe, Hero):-
	text("Defina a quantidade de pontos de cada atributo. Você tem 100 pontos para distribuir em:\nVida,\nForça,\nDestreza,\nConstituição e\nInteligência."),
	definir(vida, 100, TotalPontos),
	Vida is 100 + 5  - TotalPontos,
	definir(forca, TotalPontos, TotalPontos2),
	Forca is TotalPontos + 5 - TotalPontos2,
	definir(destreza, TotalPontos2, TotalPontos3),
	Destreza is TotalPontos2 + 5 - TotalPontos3,
	definir(constituicao, TotalPontos3, TotalPontos4),
	Constituicao is TotalPontos3 + 5 - TotalPontos4,
	definir(inteligencia, TotalPontos4, TotalPontos5),
	Inteligencia is TotalPontos4 + 5 - TotalPontos5,

	(TotalPontos5 =:= 0 -> hero(Nome, Classe, Vida, Forca, Destreza, Constituicao, Inteligencia, Vida, Hero); sobraramPontos(Classe).

ficha(_, Nome, Classe, Hero):-
	text("Entrada inválida, escolha *Padrao* ou *Personalizado*",
	ler(Opcao),
	ficha(Opcao, Nome, Classe, Hero).

criarFicha(Classe, Hero):-
	text("Digite seu Nome:"),
	ler(Nome),
	definir(nome, Nome, Classe, Hero).
