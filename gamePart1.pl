initClass(Hero):- text('                 Escolha sua classe: "Guerreiro" ou "Mago"?'),
        ler(Opcao),
        chooseClass(Opcao, Hero).

chooseClass(Opcao, Hero):- Opcao == 'guerreiro', criarFicha('guerreiro', Hero); Opcao == 'mago', criarFicha('mago', Hero); initClass(Hero).

startGame:- text('Há muito tempo atrás numa terra distante, existia uma lenda: Bravos guerreiros
em um momento específico de sua jornada eram atraídos para uma misteriosa 
caverna, esta que prometia à aqueles que superassem seus desafios um imenso 
poder...'),
	continuar,
	initClass(Hero),
	text('Cada vez mais você foi sendo atraído à esta misteriosa caverna até ela estar literalmente a sua frente:'),
	selectDif(Dificuldade),
	part1(Dificuldade, Hero),
	part2(Hero),
	part3(Hero).

selectDif(Dif):- text('Selecione a dificuldade:
0 - Para fácil
1 - Para médio
2 - Para difícil'),
	ler(Dificuldade),
	definirDif(Dificuldade, Dif).

definirDif(Dificuldade, Dif):- atom_number(Dificuldade, Dif), Dif =< 2.

%Se o jogador colocar uma dificuldade inválida, a dificuldade será médio.
definirDif(_, 1).

part1(Perigo, Hero):-
	text('
Ao por os pés dentro da mesma, rapidamente um clarão forte te atinge e uma 
paisagem é formada instantaneamente. Com o céu num puro azul, um horizonte sem
fim à sua frente, uma montanha majestosa com um grande castelo à sua esquerda.
Ao olhar para trás, avistando o sol a nascer, iluminando, dando um brilho as 
águas da cachoeira que estava próxima, era possível avistar um arco íris e 
ouvir o balançar das folhas das árvores fortes que continham belos frutos. Um
imenso felino permanecia calmo, mas em alerta no meio desse cenário.
Flutuando, rapidamente mas suavemente o ápice da noite simplesmente aparece na
sua frente, como se toda a natureza ali presente repousa-se para observar o 
mar de estrelas. E ao olhar você se depara com incontáveis brilhando como você
nunca tinha visto antes.
Então tudo escureceu… E uma luz aparece um pouco distante.

Ao andar pela escuridão em direção a luz, algumas tochas se ascendem,
revelando o local. O cenário era como uma caverna típica, porém havia um 
grande abismo a esquerda um caminho pela frente e um caminho a direita. A luz
que te guiou foi em direção ao caminho a sua frente.'),
	text('Ir em *frente*, *direita* ou *esquerda*?'),
	ler(Acao),
	eventosPart1(Acao, Perigo, Hero).

caminho1(Perigo, Hero):-
	text('Você se aproxima da saída...'),
	continuar,
	NewPerigo is Perigo + 1,
	NewPerigo >= 2 -> apareceInimigo(0, Hero, Hero0),
	text('Ir em *frente* ou *voltar*?'),
	ler(NovaAcao),
	eventosPart1_2(NovaAcao, NewPerigo, Hero0);
	text('Ir em *frente* ou *voltar*?'),
	ler(NovaAcao),
	eventosPart1_2(NovaAcao, NewPerigo, Hero0).

caminho1_2(Perigo, Hero):-
	text('Você avançou mais e está bem em frente a saída dessa área'),
	continuar,
	NewPerigo is Perigo + 2,
	%batalha(NewPerigo),
	continuar,
	text('Você avança para próxima área').

caminho2(Perigo, Hero):-
	text('Você vê um esqueleto no chão com uma espada bem velha, e ao seu lado tem um 
pedestal antigo com alguma coisa escrita.'),
	NewPerigo is Perigo + 1,
	%batalha(NewPerigo),
   	string_concat('Eu deveria *ler pedestal*, *investigar esqueleto* ou *ir para luz*?', Texto),
	text(Texto),
	ler(Acao),
	evento3(Acao, NewPerigo, Hero).

caminho2_1(Perigo, Hero):-
	text("Para aqueles que buscam a verdadeira força: O fim começa agora. O fim mudará 
conforme o agora. Desvie sua atenção, mas nunca esqueça para onde está indo."),
	continuar,
	caminho2(Perigo, Hero).

caminho2_2(Perigo, Hero):-
	text('O esqueleto começa a se mover'),
	continuar,
	%batalha(Perigo),
	text('Você encontra uma poção de cura!
Você bebe a poção e se sente revigorado!'),
	continuar,
	string_concat(Nome, ': Hmm, está na hora de eu ir até aquela luz!', Texto),
	text(Texto),
	continuar,
	caminho4(Perigo, Hero).

caminho4(Perigo, Hero):-
	text('Você se encontra em frente a saída...'),
	continuar,
	NewPerigo is Perigo + 2,
	%batalha(NewPerigo),
	continuar,
	text('Você avança para próxima área').
