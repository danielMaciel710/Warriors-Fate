formataTexto(Texto, TextoFormatado):- 
   string_concat("\n-------------------------------------------------------------------------------\n", Texto, TextoFormatadoIncompleto),
   string_concat(TextoFormatadoIncompleto, "\n-------------------------------------------------------------------------------\n", TextoFormatado).

gameOver():- 
   write("Game Over"),
   write("Your Fate were determined").

continuar():-
   write("Aperte qualquer tecla para continuar..."),
   read(_),
   write("").

exit():-
   formataTexto("Encerrando...", Encerrando),
   write(Encerrando).
