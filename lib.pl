ler(Opcao):- read_line_to_codes(user_input, R), string_to_atom(R, R1), downcase_atom(R1, Opcao).

ler().

lerNome(Nome):- read_line_to_codes(user_input, R), string_to_atom(R, Nome).

text(Texto):- string_concat('\n-------------------------------------------------------------------------------\n', Texto, TextoFormatadoIncompleto),
   string_concat(TextoFormatadoIncompleto, '\n-------------------------------------------------------------------------------\n', TextoFormatado),
   writeln(TextoFormatado).

fimJogo:- text('                                 Fim de Jogo
                          Your Fate were determined').

continuar:- writeln('                       Aperte Enter para continuar...'), ler(_).
   

sair:- text('                                Encerrando...').
