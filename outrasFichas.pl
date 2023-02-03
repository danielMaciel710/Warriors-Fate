gerarEsqueleto(VidaAtual, Esqueleto):-
	%Atributos
	Vida = 100,
	Experiencia = 150,
        Atributos = [Vida, Experiencia],

        %Habilidades
        AtaqueBasico = 33,
        Habilidade = 15,
	Habilidades = [AtaqueBasico, Habilidade],

        Esqueleto = [Atributos, Habilidades, VidaAtual].

gerarVampiro(Vampiro, VidaAtual):-
	%Atributos
	Vida = 200,
	Experiencia = 300,
        Atributos = [Vida, Experiencia],

        %Habilidades
        AtaqueBasico = 35,
        Habilidade = 10,
	Habilidades = [AtaqueBasico, Habilidade],

        Vampiro = [Atributos, Habilidades, VidaAtual].

gerarCavaleiroDasSombras1(Sombra, VidaAtual):-
	%Atributos
	Vida = 210,
	Experiencia = 315,
        Atributos = [Vida, Experiencia],

        %Habilidades
        AtaqueBasico = 34,
        Habilidade = ["O cavaleiro das sombras desfere um ataque atordoante.", 2],
	Habilidades = [AtaqueBasico, Habilidade],

        Sombra = [Atributos, Habilidades, VidaAtual].

gerarCavaleiroDasSombras2(Sombra, VidaAtual):-
	%Atributos
	Vida = 400,
	Experiencia = 315,
        Atributos = [Vida, Experiencia],

        %Habilidades
        AtaqueBasico = 31,
        Habilidade = ["O cavaleiro das sombras atira uma faca envenenada.", 3],
	Habilidades = [AtaqueBasico, Habilidade],

        Sombra = [Atributos, Habilidades, VidaAtual].

gerarCavaleiroDasSombras3(Sombra, VidaAtual):-
	%Atributos
	Vida = 210,
	Experiencia = 315,
		Atributos = [Vida, Experiencia],

        %Habilidades
        AtaqueBasico = 34,
        Habilidade = ["O cavaleiro das sombras adiciona dano mágico a sua arma.", 2],
	Habilidades = [AtaqueBasico, Habilidade],

        Sombra = [Atributos, Habilidades, VidaAtual].
