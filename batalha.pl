batalha(Perigo, Vida):- Perigo > 2, 
    text('Um inimigo aparece e a batalha começa!'),
    write('Sua vida:'),
    writeln(Vida),
    write('Vida do Esqueleto:'),
    writeln(50),
    batalhaEsqueleto(0, Vida, 50).
batalha(_, _):- text('Estranho, você teve a sensação que haveria algum inimigo aqui...').

batalhaEsqueleto(_, VidaHeroi, _):- VidaHeroi < 0, fimJogo.
batalhaEsqueleto(_, _, VidaEsqueleto):- VidaEsqueleto < 0, text('Você venceu!').

batalhaEsqueleto(0, VidaHeroi, VidaEsqueleto):-
    text('Opções: 1 = socar'),
    ler(Opcao),
    NewVidaEsqueleto is VidaEsqueleto - 30,
    write('Sua vida:'),
    writeln(VidaHeroi),
    write('Vida do Esqueleto:'),
    writeln(NewVidaEsqueleto),
    batalhaEsqueleto(1, VidaHeroi, NewVidaEsqueleto).

batalhaEsqueleto(1, VidaHeroi, VidaEsqueleto):- NewVidaHeroi is VidaHeroi - 25,
    text('Esqueleto te soca.'),
    write('Sua vida:'),
    writeln(NewVidaHeroi),
    write('Vida do Esqueleto:'),
    writeln(VidaEsqueleto),
    batalhaEsqueleto(0, NewVidaHeroi, VidaEsqueleto).