startGame:- text('Há muito tempo atrás numa terra distante, existia uma lenda: Bravos guerreiros
em um momento específico de sua jornada eram atraídos para uma misteriosa 
caverna, esta que prometia à aqueles que superassem seus desafios um imenso 
poder...'),	
	continuar,
	chooseClass,	
	string_concat(Nome, ' cada vez mais foi sendo atraído à esta misteriosa caverna até ela estar literalmente a sua frente:', Texto1),
	text(Texto1),
	text('Selecione a dificuldade:\n0. - Para fácil\n1. - Para médio\n2. - Para difícil\nLembre do .'),
	read(Dificuldade),
	part1(Dificuldade, Nome),
	part2(Nome),
	part3.

chooseClass:- text('                 Escolha sua classe: "Guerreiro" ou "Mago"?'),
	ler(Opcao),
	chooseClass(Opcao).

chooseClass(guerreiro):- class(guerreiro),
	text('                            Digite o seu nome.'),
	lerNome(Nome),
	nome(Nome),
	%Criar ficha da classe Warrior com o Nome passado pelo jogador.
	text('                          Ficha criada com sucesso.').

chooseClass(mago):- class(mago),
	text('                            Digite o seu nome.'),
	lerNome(Nome),
	nome(Nome),
	%Criar ficha da classe Mage com o Nome passado pelo jogador.
	text('                          Ficha criada com sucesso.').

chooseClass(_):- text('Classe inválida!'), chooseClass.

checkHero2:- write('Verificar aqui a vida do personagem').
batalha1:- write('Batalha contra um esqueleto').

caminho4(Perigo, Nome):-
	text('Você se encontra em frente a saída...'),
	continuar,
	NewPerigo is Perigo + 2,
	(NewPerigo > 2) -> batalha1, checkHero2;
	string_concat(Nome, ': Estranho, achei que teria algum inimigo aqui...', Texto2),
	write(Texto2),
	continuar,
	text('Você avança para próxima área').

caminho2_2(Perigo, Nome):-
	text('O esqueleto começa a se mover'),
	continuar,
	batalha1,
	checkHero2,
	text('Você encontra uma poção de cura!'),
	text('Você bebe a poção e se sente revigorado!'),
	continuar,
	string_concat(Nome, ': Hmm, está na hora de eu ir até aquela luz!', Texto4),
	write(Texto4),
	continuar,
	caminho4(Perigo, Nome).

evento3('ler pedestal', Perigo, Nome):- 
	text('Para aqueles que buscam a verdadeira força: O fim começa agora. O fim mudará conforme o agora. Desvie sua atenção, mas nunca esqueça para onde está indo.'),
	continuar,
	caminho2_2(Perigo, Nome).
evento3('investigar esqueleto', Perigo, Nome):- caminho2_2(Perigo, Nome).
evento3(ir para luz, Perigo, Nome):- caminho4(Perigo, Nome).
evento3(_, Perigo, Nome):-
   string_concat(Nome, ': Posso *ler pedestal*, *investigar esqueleto* ou *ir para luz*', Texto2),
	text(Texto2),
	ler(Acao),
	evento3(Acao, Perigo, Nome).

caminho2(Perigo, Nome):-
	text('Você vê um esqueleto no chão com uma espada bem velha, e ao seu lado tem um pedestal antigo com alguma coisa escrita.'),
	NewPerigo is Perigo + 1,
	(NewPerigo > 2) -> batalha1, checkHero2; write(''),
   string_concat(Nome, ': Eu deveria *ler pedestal*, *investigar esqueleto* ou *ir para luz* ???', Texto2),
	write(Texto2),
	ler(Acao),
	evento3(Acao, NewPerigo, Nome).

caminho1_2(Perigo, Nome):-
	text('Você avançou mais e está bem em frente a saída dessa área'),
	continuar,
	NewPerigo is Perigo + 2,
	(NewPerigo > 2) -> batalha1, checkHero2;
	string_concat(Nome, ': Estranho, achei que teria algum inimigo aqui...', Texto2),
	write(Texto2),
	continuar,
	text('Você avança para próxima área').

eventosPart1_2(frente, Perigo, Nome):- caminho1_2(Perigo, Nome).
eventosPart1_2(direita, Perigo, Nome):-
	text('Você volta e segue para direita'),
	continuar,
	caminho2(Perigo, Nome).
eventosPart1_2(voltar, Perigo, Nome):-
	text('Você volta e segue para direita'),
	continuar,
	caminho2(Perigo, Nome).
eventosPart1_2(_, Perigo, Nome):-
   text('Posso ir para *frente*, *direita* e *voltar*'),
	continuar,
	ler(Acao),
	eventosPart1_2(Acao, Perigo, Nome).

caminho1(Perigo, Nome):-
	text('Você se aproxima da saída...'),
	continuar,
	NewPerigo is Perigo + 1,
	((NewPerigo > 2) -> batalha1, checkHero2);write(''),
	write('Ir em frente ou voltar?'),
	ler(NovaAcao),
	eventosPart1_2(NovaAcao, NewPerigo, Nome). 

eventosPart1(frente, Perigo, Nome):- caminho1(Perigo, Nome).
eventosPart1(direita, Perigo, Nome):- caminho2(Perigo, Nome).
eventosPart1(esquerda, Perigo, Nome):-
	text('Você vê um abismo sem fim, melhor seguir em frente...'),
	continuar,
	caminho1(Perigo, Nome).
eventosPart1(_, Perigo, Nome):-
	string_concat(Nome, ': Posso ir para *frente*, *direita* ou *esquerda*', Texto),
	text(Texto),
	ler(NovaAcao),
	eventosPart1(NovaAcao, Perigo, Nome).


part1(Perigo, Nome):-
	text('Ao por os pés dentro da mesma, rapidamente um clarão forte te atinge e uma paisagem é formada instantaneamente. Com o céu num puro azul, um horizonte sem fim à sua frente, uma montanha majestosa com um grande castelo à sua esquerda. Ao olhar para trás, avistando o sol a nascer, iluminando, dando um brilho as águas da cachoeira que estava próxima, era possível avistar um arco íris e ouvir o balançar das folhas das árvores fortes que continham belos frutos. Um imenso felino permanecia calmo, mas em alerta no meio desse cenário.\nFlutuando, rapidamente mas suavemente o ápice da noite simplesmente aparece na na sua frente, como se toda a natureza ali presente repousa-se para observar o mar de estrelas. E ao olhar você se depara com incontáveis brilhando como você nunca tinha visto antes.\nEntão tudo escureceu… E uma luz aparece um pouco distante.'),

	text('Ao andar pela escuridão em direção a luz, algumas tochas se ascendem, revelando o local. O cenário era como uma caverna típica, porém havia um grande abismo a esquerda um caminho pela frente e um caminho a direita. A luz que te guiou foi em direção ao caminho a sua frente.'),
	continuar,
	text('Ir em *frente*, *direita* ou *esquerda*?'),
	ler(Acao),
	eventosPart1(Acao, Perigo, Nome).

