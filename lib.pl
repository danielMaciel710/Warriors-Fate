ler(Opcao):- read_line_to_codes(user_input, R),
   string_to_atom(R, R1),
   downcase_atom(R1, Opcao).

ler().

text(Texto):- string_length(Texto, Tamanho),
   quebraTexto(Texto, Tamanho, R),
   string_concat('\n-------------------------------------------------------------------------------\n', R, TextoFormatadoIncompleto),
   string_concat(TextoFormatadoIncompleto, '\n-------------------------------------------------------------------------------\n', TextoFormatado),
   writeln(TextoFormatado).


quebraTexto(Texto, Tamanho, Texto):- Tamanho < 80.

quebraTexto(Texto, Tamanho, TextoQuebrado):- Tamanho >= 80,
   string_chars(Texto, R),
   addParagrafo(' ', R, ListaR, 0),
   atomics_to_string(ListaR, TextoQuebrado).

addParagrafo(_, [], [], _).
addParagrafo(' ', [' '|Lista], ['\n'|ListaR], N):- N > 63, addParagrafo(' ', Lista, ListaR, 0).
addParagrafo(' ', [X|Lista],  [X|ListaR], N):- N1 is N + 1, addParagrafo(' ', Lista, ListaR, N1).

gameOver:- 
   text('Game Over\nYour Fate were determined').

continuar:-
   text('Aperte Enter para continuar...'),
   ler(_).
   
exit:-
   text('Encerrando...').
