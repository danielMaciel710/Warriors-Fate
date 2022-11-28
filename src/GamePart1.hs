module GamePart1
    (
      part1
    )
where

import Lib
import System.IO
import System.Directory
import qualified Models.Hero as H
import Models.Ficha
import Terminal
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)

-- retorna as dimensões do terminal em uma tupla
terminalSize = unsafeDupablePerformIO Terminal.getTermSize
height = fst terminalSize -- pega a altura do terminal
width = snd terminalSize -- pega a largura do terminal

part1 nome = do
  putStrLn (centerTextHeight2 "\nAo por os pés dentro da mesma, rapidamente um clarão forte te atinge e uma paisagem é formada instantaneamente. Com o céu num puro azul, um horizonte sem fim à sua frente, uma montanha majestosa com um grande castelo à sua esquerda. Ao olhar para trás, avistando o sol a nascer, iluminando, dando um brilho as águas da cachoeira que estava próxima, era possível avistar um arco íris e ouvir o balançar das folhas das árvores fortes que continham belos frutos. Um imenso felino permanecia calmo, mas em alerta no meio desse cenário.\nFlutuando, vendo todo este cenário, rapidamente mas suavemente o ápice da noite simplesmente aparece na na sua frente, como se toda a natureza ali presente repousa-se para observar o mar de estrelas. E ao olhar também você se depara com incontáveis brilhando como você nunca tinha visto antes.\nEntão tudo escureceu… E uma tocha acende um pouco distante.i" height)
  putStrLn "Digite qualquer tecla para continuar: "
  token <- getLine
  putStrLn (centerTextHeight2 "Ao andar pela escuridão em direção a luz, algumas tochas se ascendem, revelando o local. O cenário era como uma caverna típica, porém havia um grande abismo a esquerda um caminho pela frente e um caminho a direita. A luz que te guiou foi em direção ao caminho a sua frente." height)
  let contador = 0 
----------------------------------------------------------------------------------------------
  putStrLn "O que eu devo fazer agora?"
  acao <- getLine
  let contador = contador + 1 
  if contador > 2 
  then batalha 
  else print "..." -- Falta implementar batalha

  let interpretarEntrada = 1 -- Só para testar aplicação, deve ser uma função de Lib.hs que recebe o texto e mapeia para um valor em Int
  let evento = interpretarEntrada --Falta implementar interpretarEntrada:

  if evento == 1
  then caminho1 contador nome
  else if evento == 2
  then caminho2 contador nome
  else putStrLn (centerText "Nada acontece..." height width)

  ---------------------------------------------------------------------------------------------
--Transformar esse bloco de código em uma função e substituir nas partes abaixo que seguem o mesmo padrão. 
--Se tiver alguns valores diferentes, só criar uma variação da função.
--Essa função deve receber como entrada o valor desse contador. A cada duas ações ele irá iniciar uma batalha

caminho1 :: Int -> String -> IO ()
caminho1 i n = do
  putStrLn (centerText "Você se aproxima da saída..." height width)
  putStrLn "O que eu devo fazer agora?"
  acao <- getLine
  let i = i + 1
  if i > 2
  then batalha -- Falta implementar batalha 
  else print "..."

  let interpretarEntrada = 4 -- Só para testar aplicação, deve ser uma função de Lib.hs que recebe o texto e mapeia para um valor em Int  
  let evento = interpretarEntrada

  if evento == 3
  then caminho2 i n
  else if evento == 4
  then caminho1_2 i n
  else putStrLn (centerText "Nada acontece..." height width)

caminho1_2 :: Int -> String -> IO ()
caminho1_2 i n = do
  putStrLn (centerText "Você está em frente a saída..." height width)
  putStrLn "O que eu devo fazer agora?"
  acao <- getLine
  let i = i + 1
  if i > 2
  then batalha
  else print "..."

  let interpretarEntrada = 6 -- Só para testar aplicação, deve ser uma função de Lib.hs que recebe o texto e mapeia para um valor em Int  
  let evento = interpretarEntrada --Falta implementar interpretarEntrada: 

  if evento == 5
  then caminho2 i n
  else if evento == 6
  then putStrLn (centerText "Você avança para próxima área" height width)
  else putStrLn (centerText "Nada acontece..." height width)

caminho2 :: Int -> String -> IO ()
caminho2 i n = do
  putStrLn (centerTextHeight2 "Você vê um esqueleto no chão com uma espada bem velha, e ao seu lado tem um pedestal antigo com alguma coisa escrita." height)
  putStrLn "O que eu devo fazer agora?"
  acao <- getLine
  let i = i + 1
  if i > 2
  then batalha
  else print "..."

  let interpretarEntrada = 8 -- Só para testar aplicação, deve ser uma função de Lib.hs que recebe o texto e mapeia para um valor em Int 
  let evento = interpretarEntrada --Falta implementar interpretarEntrada: 

  if evento == 7
  then caminho2_1 i n
  else if evento == 8
  then caminho2_2 n
  else putStrLn (centerText "Nada acontece..." height width)

caminho2_1 :: Int -> String -> IO ()
caminho2_1 i n = do
  putStrLn (centerTextHeight2 "Para aqueles que buscam a verdadeira força: O fim começa agora. O fim mudará conforme o agora. Desvie sua atenção, mas nunca esqueça para onde está indo." height)
  caminho2 i n

caminho2_2 :: String -> IO ()
caminho2_2 n = do
  putStrLn (centerText "Você encontra uma poção de cura!" height width)
  let addPocao = "Foi adicionado uma poção ao seu inventário" -- Só para testar aplicação, esta deve ser uma função de Lib.hs 
  putStrLn addPocao

  putStrLn (centerText "O esqueleto começa a se mover" height width)
  putStrLn "Aperte qualquer tecla para continuar"
  token <- getLine
  batalha
  putStrLn (n ++ ": Hmm, está na hora de eu ir até aquela luz!")

batalha :: IO ()
batalha = putStrLn (centerText "Você está lutando" height width) -- Só para teste, função deve ser implementada em Lib.hs
