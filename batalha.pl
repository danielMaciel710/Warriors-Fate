batalha(Perigo):- Perigo > 2, checkHero2, batalha1.
batalha(_):- text('Estranho, você teve a sensação que haveria algum inimigo aqui...').

checkHero2:- writeln('Verificar aqui a vida do personagem').
batalha1:- writeln('Batalha contra um esqueleto').