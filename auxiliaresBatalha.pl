statusEsqueleto(Status):-
        Status =
"
 ---------------------
|      Esqueleto      |
|---------------------|
|  Vida = 100         |
|  Força = 33         |
|  Experiencia = 150  |
|  Habilidade:        |
|  Enrijecer Ossos -> |
|  Mais 15 de vida!   |
 --------------------- ".


statusVampiro(Status):-
        Status =
"
 ---------------------
|      Vampiro        |
|---------------------|
|  Vida = 200         |
|  Força = 35         |
|  Experiencia = 300  |
|  Habilidade:        |
|  Drenar Vida ->     |
|  Rouba 10 de vida!  |
 --------------------- ".



statusSombras(Status):-
        Status =
"
 ---------------------
|  Guerreiro Sombrio  |
|---------------------|
|  Vida = ???         |
|  Força = ???        |
|  Experiencia = ???  |
|  Habilidade: ???    |
 --------------------- ".

mostrarVidas(SuaVidaTotal, SuaVidaAtual, VidaInimigoTotal, VidaInimigoAtual):-
	write("Sua vida: ("),
        write(SuaVidaAtual),
       	write("/"),
        write(SuaVidaTotal),
        write(")"),

        write("          "),
        write("Vida Inimigo: ("),
        write(VidaInimigoAtual),
	write("/"),
        write(VidaInimigoTotal),
        write(")\n\n").

getVariaveisHero(Hero, Atributos, Habilidades, Nome, Classe, VidaAtual, VidaTotal, Defesa):-
        nth0(0, Hero, Atributos),
        nth0(1, Hero, Habilidades),
        nth0(2, Hero, Equipamentos),
        nth0(3, Hero, Nome),
        nth0(4, Hero, Classe),
        nth0(5, Hero, VidaAtual),
        nth0(0, Atributos, VidaTotal),
        nth0(6, Atributos, Defesa).

getVariaveisEsqueleto(Esqueleto, Atributos, VidaAtual, VidaTotal):-
        nth0(0, Esqueleto, Atributos),
        nth0(2, Esqueleto, VidaAtual),
        nth0(0, Atributos, VidaTotal).

youWin(Experiencia):- 
	string_concat("PARABÉNS, VOCÊ GANHOU A BATALHA! TOTAL DE EXPERIÊNCIA ADQUIRIDA: ", Experiencia, Texto),
	text(Texto).

gameOver(sair):- text("Encerrando...")!
gameOver(continuar):- 
	selectDif(Dificuldade),
        part1(Dificuldade, Nome),
        part2(Nome),
        part3.	
gameOver(_):-
	text("Opção inválida!\n Tente de novo: "),
	ler(Opcao),
	gameOver(Opcao).
		
gameOver:-
	text("YOUR FATE WERE DETERMINED!!!"),
	continuar,
	write("*Continuar* jogando ou *Sair*"),
	ler(Opcao),
	gameOver(Opcao).

