ler(Opcao):- read_line_to_codes(user_input, R),
   string_to_atom(R, R1),
   downcase_atom(R1, Opcao).

ler().

text(Texto):- string_concat('\n-------------------------------------------------------------------------------\n', Texto, TextoFormatadoIncompleto),
   string_concat(TextoFormatadoIncompleto, '\n-------------------------------------------------------------------------------\n', TextoFormatado),
   writeln(TextoFormatado).

gameOver:- 
   text('                                   Game Over
                          Your Fate were determined').

continuar:-
   text('Aperte Enter para continuar...'),
   ler(_).
   
exit:-
   text('Encerrando...').
