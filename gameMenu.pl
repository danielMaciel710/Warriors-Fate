initial():- choosePath().

choosePath():-
   write("WarriorsFate\ndigite *start* ou *help*"),
   read(Option),
   ((Option =:= "help") -> showHelp()),
   ((Option =:= "start") -> startGame()); invalidPath()).

showHelp():-
   formataTexto("Help", HelpFormatado),

   formataTexto("Todas as ações do jogador serão através da entrada de palavras ou frases. O jogador poderá se mover, atacar, usar habilidades específicas e interagir com o cenário de forma bem simples.\n\nNas batalhas aparecerá os valores dos atributos do inimigo ou do jogador dependendo se ele usou uma habilidade ou o inimigo tenha usado.\n\nPara uma melhor experiência do jogo, ajuste a tela apertando (Ctrl + Shift + ) ou (Ctrl - ) até os traços que dividem o texto preencherem totalmente a tela sem passar para linha de baixo") )
  putStrLn (formataText("digite *voltar* ou *sair*", TextoFormatado),

   formataTexto("Digite *voltar* ou *sair*", TextoFormatado2),

   write(HelpFormatado),
   write(TextoFormatado),
   write(TextoFormatado2),
   read(Option),
   ((Option =:= "voltar") -> choosePath()),
   ((Option =:= "sair") -> exit()); invalidPath()).

invalidPath():-
   formataTexto("Entrada inválida!", EntradaInvalida),
   write(EntradaInvalida),
   choosePath().
