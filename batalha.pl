batalha(Perigo):- Perigo == 3, 
    text('Um Esqueleto aparece e a batalha começa!'),
    write('Sua vida:'),
    writeln(100),
    write('Vida do Esqueleto:'),
    writeln(50),
    batalhaEsqueleto(0, 100, 50).

batalha(Perigo):- Perigo == 4, 
    text('Um Morto Vivo aparece e a batalha começa!'),
    write('Sua vida:'),
    writeln(100),
    write('Vida do Morto Vivo:'),
    writeln(50),
    batalhaEsqueleto(0, 100, 50).

batalha(Perigo):- Perigo == 5, 
    text('Uma Bruxa aparece e a batalha começa!'),
    write('Sua vida:'),
    writeln(100),
    write('Vida da Bruxa:'),
    writeln(50),
    batalhaEsqueleto(0, 100, 50).

batalha(Perigo):- Perigo == 6, 
    text('Um Demonio aparece e a batalha começa!'),
    write('Sua vida:'),
    writeln(100),
    write('Vida do Demonio:'),
    writeln(50),
    batalhaEsqueleto(0, 100, 50).

batalha(Perigo):- Perigo > 6, 
    text('Um Ogro aparece e a batalha começa!'),
    write('Sua vida:'),
    writeln(100),
    write('Vida do Ogro:'),
    writeln(50),
    batalhaEsqueleto(0, 100, 50).

batalha(_):- text('Estranho, você teve a sensação que haveria algum inimigo aqui...').

batalha(_, pocao):- text('Um Esqueleto Dourado aparece e a batalha começa!'),
    write('Sua vida:'),
    writeln(150),
    write('Vida do Esqueleto Dourado:'),
    writeln(50),
    batalhaEsqueleto(0, 150, 50).

batalhaEsqueleto(_, VidaHeroi, _):- VidaHeroi < 0, fimJogo.
batalhaEsqueleto(_, _, VidaEsqueleto):- VidaEsqueleto < 0, text('Você venceu!').

batalhaEsqueleto(0, VidaHeroi, VidaEsqueleto):-
    text('Opções: 1 = Socar  2 = Usar Magia  3 = Atacar com Arma'),
    ler(Opcao),
    atom_number(Opcao, OpcaoR),
    perdeVida(OpcaoR, VidaEsqueleto, NewVidaEsqueleto),
    write('Sua vida:'),
    writeln(VidaHeroi),
    write('Vida do Inimigo:'),
    writeln(NewVidaEsqueleto),
    batalhaEsqueleto(1, VidaHeroi, NewVidaEsqueleto).

batalhaEsqueleto(1, VidaHeroi, VidaEsqueleto):- perdeVida(1, VidaHeroi, NewVidaHeroi),
    text('Inimigo te soca.'),
    write('Sua vida:'),
    writeln(NewVidaHeroi),
    write('Vida do Inimigo:'),
    writeln(VidaEsqueleto),
    batalhaEsqueleto(0, NewVidaHeroi, VidaEsqueleto).

batalhaFinal:-  
    text('O grande chefe cavaleiro aparece e a batalha começa!'),
    write('Sua vida:'),
    writeln(100),
    write('Vida do Cavaleiro:'),
    writeln(100),
    batalhaCavaleiro(0, 100, 100).

batalhaCavaleiro(0, VidaHeroi, VidaCavaleiro):-
    text('Opções: 1 = Socar  2 = Usar Magia  3 = Atacar com Arma'),
    ler(Opcao),
    atom_number(Opcao, OpcaoR),
    perdeVida(OpcaoR, VidaCavaleiro, NewVidaCavaleiro),
    write('Sua vida:'),
    writeln(VidaHeroi),
    write('Vida do Cavaleiro:'),
    writeln(NewVidaCavaleiro),
    batalhaEsqueleto(1, VidaHeroi, NewVidaCavaleiro).

batalhaCavaleiro(1, VidaHeroi, VidaCavaleiro):- perdeVida(1, VidaHeroi, NewVidaHeroi),
    text('Cavaleiro te soca.'),
    write('Sua vida:'),
    writeln(NewVidaHeroi),
    write('Vida do Cavaleiro:'),
    writeln(VidaCavaleiro),
    batalhaEsqueleto(0, NewVidaHeroi, VidaCavaleiro).

perdeVida(1, Vida, NewVida):- NewVida is Vida - 30.
perdeVida(2, Vida, NewVida):- NewVida is Vida - 35.
perdeVida(3, Vida, NewVida):- NewVida is Vida - 40.
