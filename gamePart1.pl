startGame().
	%Vou começar a trabalhar nessa classe depois de amanhã.
   %chooseClass(),
   %Ler arquivo com os dados do personagem e pegar o nome
   /*formataTexto(Nome ++ " cada vez mais foi sendo atraído à esta misteriosa caverna até ela estar literalmente a sua frente:", Texto1),
   formataTexto("Selecione a dificuldade:\n0 - Para fácil\n1 - Para médio\n2 - Para difícil", Texto2),
   read(Dificuldade),
   part1(Dificuldade, Nome),
   part2(Nome),
   part3().

chooseClass():-
   formataTexto("Há muito tempo atrás numa terra distante, existia uma lenda: Bravos guerreiros em um momento específico de sua jornada eram atraídos para uma misteriosa caverna, esta que prometia à aqueles que superassem seus desafios um imenso poder...", Texto1),
   continuar(),
   formataTexto("Escolha sua classe: \nGuerreiro ou Mago?", Texto2),
   read(Option),
   ((Option =:= "guerreiro") -> warriorPath()),
   ((Option =:= "mago") -> magePath()); invalidClass()).

invalidClass():-
   formataTexto("Classe inválida!", EntradaInvalida),
   write(ClasseInvalida),
   chooseClass().

warriorPath():-
   formataTexto("Digite o seu nome: ", Texto),
   read(Nome),
   %Criar ficha da classe Warrior com o Nome passado pelo jogador.
   write("Ficha criada com sucesso"). %Só para testar.

magePath():-
   formataTexto("Digite o seu nome: ", Texto),
   read(Nome),
   %Criar ficha da classe Mage com o Nome passado pelo jogador.
   write("Ficha criada com sucesso"). %Só para testar.

part1(Perigo, Nome):-
   formataTexto("Ao por os pés dentro da mesma, rapidamente um clarão forte te atinge e uma paisagem é formada instantaneamente. Com o céu num puro azul, um horizonte sem fim à sua frente, uma montanha majestosa com um grande castelo à sua esquerda. Ao olhar para trás, avistando o sol a nascer, iluminando, dando um brilho as águas da cachoeira que estava próxima, era possível avistar um arco íris e ouvir o balançar das folhas das árvores fortes que continham belos frutos. Um imenso felino permanecia calmo, mas em alerta no meio desse cenário.\nFlutuando, rapidamente mas suavemente o ápice da noite simplesmente aparece na na sua frente, como se toda a natureza ali presente repousa-se para observar o mar de estrelas. E ao olhar você se depara com incontáveis brilhando como você nunca tinha visto antes.\nEntão tudo escureceu… E uma luz aparece um pouco distante.", Texto1),

   formataTexto2("Ao andar pela escuridão em direção a luz, algumas tochas se ascendem, revelando o local. O cenário era como uma caverna típica, porém havia um grande abismo a esquerda um caminho pela frente e um caminho a direita. A luz que te guiou foi em direção ao caminho a sua frente.", Texto2),

   write(Texto1),
   continuar(),
   write(Texto2),
   write("Ir em *frente*, *direita* ou *esquerda*?"),
   read(Acao),
   eventosPart1(Acao, Perigo, Nome).

%Eventos.............................................:
eventosPart1(Acao, Perigo, Nome):- caminho1(Perigo, Nome)).
eventosPart1("direita", Perigo, Nome):- caminho2(Perigo, Nome).
eventosPart1("esquerda", Perigo, Nome):- caminho3(Perigo, NOme).
eventosPart1(_, Perigo, Nome):- 
	formataTexto(Nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*", Texto),
   read(NovaAcao),
   eventosPart1(NovaAcao, Perigo, Nome).

caminho1(Perigo, Nome):-
	formataTexto("Você se aproxima da saída...", Texto),
	write(Texto),
	continuar(),
	NewPerigo is Perigo + 1,
	((NewPerigo > 2) -> batalha1(), checkHero2);write(""), %Não sei se está certo.
	write("Ir em frente ou voltar?"),
	read(NovaAcao),
	eventosPart1_2(NovaAcao, NewPerigo, Nome). 

eventosPart1_2("frente", Perigo, Nome):- caminho1_2(Perigo, Nome).
eventosPart1_2("direita", Perigo, Nome):-
	formataTexto("Você volta e segue para direita", Texto),
	write(Texto),
   continuar(),
	caminho2(Perigo, Nome).
eventosPart1_2("voltar", Perigo, Nome):-
	formataTexto("Você volta e segue para direita", Texto),
	write(Texto),
   continuar(),
	caminho2(Perigo, Nome).
eventosPart1_2(_, Perigo, Nome):-
	formataTexto("Posso ir para *frente*, *direita* e *voltar*", Texto),
	write(Texto),
	continuar(),
	read(Acao),
	eventosPart1_2(Acao, Perigo, Nome).
	
caminho1_2(Perigo, Nome):-
	formataTexto("Você avançou mais e está bem em frente a saída dessa área", Texto),
	write(Texto),
	continuar(),
	NewPerigo is Perigo + 2,
	(NewPerigo > 2) -> batalha1(), checkHero2();
	stringConcat(Nome, ": Estranho, achei que teria algum inimigo aqui...", Texto2),
	write(Texto2),
	continuar(),
	formataTexto("Você avança para próxima área").

caminho2(Perigo, Nome):-
	formataTexto("Você vê um esqueleto no chão com uma espada bem velha, e ao seu lado tem um pedestal antigo com alguma coisa escrita.", Texto),
	write(Texto),
	NewPerigo is Perigo + 1,
   (NewPerigo > 2) -> batalha1(), checkHero2(); write(""),
   stringConcat(Nome, ": Eu deveria *ler pedestal*, *investigar esqueleto* ou *ir para luz* ???", Texto2),
   write(Texto2),
   read(Acao),
	evento3(Acao, NewPerigo, Nome).

evento3("ler pedestal", Perigo, Nome):- caminho2_1(Perigo, Nome).
evento3("investigar esqueleto", Perigo, Nome):- caminho2_2(Perigo, Nome).
evento3("ir para luz", Perigo, Nome):- caminho1(Perigo, Nome).
evento3(_, Perigo, Nome):-
   stringConcat(Nome, ": Posso *ler pedestal*, ou *investigar esqueleto* ou *ir para luz*", Texto2),
	formataTexto(Texto2),
	write(Texto2),
	read(Acao),
	evento3(Acao, Perigo, Nome).

caminho2_1(Perigo, Nome):-
	formataTexto("Para aqueles que buscam a verdadeira força: O fim começa agora. O fim mudará conforme o agora. Desvie sua atenção, mas nunca esqueça para onde está indo.", Texto),
	write(Texto),
	continuar(),
	caminho2(Perigo, Nome).

caminho2_2(Perigo, Nome):-
	formataTexto("O esqueleto começa a se mover", Texto),
	write(Texto),
	continuar(),
	batalha1(),
	checkHero2(),
	formataTexto("Você encontra uma poção de cura!", Texto2),
	write(Texto2),
	%Aumentar vida do jogador
	formataTexto("Você bebe a poção e se sente revigorado!", Texto3),
	write(Texto3),
	continuar(),
   stringConcat(Nome, ": Hmm, está na hora de eu ir até aquela luz!", Texto4),
	write(Texto4),
	continuar(),
	caminho1(Perigo, Nome).

checkHero2():- write("Verificar aqui a vida do personagem").%Está nesse formata só para teste.

caminho3(Perigo, Nome):-
	formataTexto("Você vê um abismo sem fim, melhor seguir em frente...", Texto),
	write(Texto),
	continuar(),
	caminho1(Perigo, Nome).*/
