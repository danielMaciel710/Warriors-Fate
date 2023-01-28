batalha(Perigo, Vida):- Perigo > 2, checkHero2, batalha1.
batalha(_):- text('Estranho, você teve a sensação que haveria algum inimigo aqui...').

ganharVida(Vida, NewVida):- NewVida is Vida + 10.
batalha1:- writeln('Batalha contra um esqueleto').