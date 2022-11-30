module Eventos
    (
      eventos
    )
where

import Lib
import Terminal
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)

-- retorna as dimensões do terminal em uma tupla
terminalSize = unsafeDupablePerformIO Terminal.getTermSize
height = fst terminalSize -- pega a altura do terminal
width = snd terminalSize -- pega a largura do terminal

eventos :: String -> Int -> String -> IO ()
eventos acao perigo nome = if (lowerCase acao) == "frente"
  then caminho1 perigo nome
  else if (lowerCase acao) == "direita"
  then caminho2 perigo nome
  else if (lowerCase acao) == "esquerda"
  then do 
    putStrLn (centerText "Você vê um abismo sem fim, melhor seguir em frente..." height width)
    continuar -- Função que printa uma mensagem e espera uma entrada qualquer, só para o jogador ler o que tá na tela.
    caminho1 perigo nome
  else do
    putStrLn (centerText (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*") height width)
    acao <- getLine
    eventos acao perigo nome

caminho1 :: Int -> String -> IO ()
caminho1 perigo nome = do
  putStrLn (centerText "Você se aproxima da saída..." height width)
  putStrLn "Ir em frente ou voltar?"
  acao <- getLine
  if perigo > 2
  then putStrLn (centerText batalha height width) -- Falta implementar batalha 
  else print "Nenhum inimigo a vista"
  continuar
  evento2 acao perigo nome

evento2 :: String -> Int -> String -> IO ()
evento2 acao perigo nome = if (lowerCase acao) == "frente"
  then caminho1_2 perigo
  else if (lowerCase acao) == "direita"
  then caminho2 perigo nome
  else if (lowerCase acao) == "voltar"
  then do
    putStrLn (centerText "Você volta e segue para direita" height width)
    continuar
    caminho2 perigo nome
  else do
    putStrLn (centerText (nome ++ ": Posso ir para *frente*, *direita*, *voltar*") height width)
    acao <- getLine
    evento2 acao perigo nome

caminho1_2 :: Int -> IO ()
caminho1_2 perigo = do
  putStrLn (centerText "Você está em frente a saída..." height width)
  putStrLn "Aperte qualquer tecla para continuar"
  acao <- getLine
  if perigo + 2 > 2
  then putStrLn (centerText batalha height width)
  else print "Nenhum inimigo a vista"
  continuar
  putStrLn (centerText "Você avança para próxima área" height width)

caminho2 :: Int -> String -> IO ()
caminho2 perigo nome = do
  putStrLn (centerTextHeight2 "Você vê um esqueleto no chão com uma espada bem velha, e ao seu lado tem um pedestal antigo com alguma coisa escrita." height)
  putStrLn "O que eu devo fazer agora?"
  acao <- getLine
  if perigo > 2
  then putStrLn (centerText batalha height width)
  else print "Nenhum inimigo a vista"
  continuar
  evento3 acao perigo nome

evento3 :: String -> Int -> String -> IO ()
evento3 acao perigo nome = if (lowerCase acao) == "ler pedestal"
  then caminho2_1 nome
  else if (lowerCase acao) == "investigar esqueleto"
  then caminho2_2 nome
  else if (lowerCase acao) == "olhar esqueleto"
  then caminho2_2 nome
  else do
    putStrLn (centerText (nome ++ ": Posso *ler pedestal*, ou *investigar esqueleto*") height width)
    acao <- getLine
    evento3 acao perigo nome

caminho2_1 :: String -> IO ()
caminho2_1 nome = do
  putStrLn (centerTextHeight2 "Para aqueles que buscam a verdadeira força: O fim começa agora. O fim mudará conforme o agora. Desvie sua atenção, mas nunca esqueça para onde está indo." height)
  caminho2_2 nome

caminho2_2 :: String -> IO ()
caminho2_2 nome = do
  putStrLn (centerText "Você encontra uma poção de cura!" height width)
  let addPocao = "Foi adicionado uma poção ao seu inventário" -- Só para testar aplicação, esta deve ser uma função de Lib.hs 
  putStrLn addPocao
  continuar

  putStrLn (centerText "O esqueleto começa a se mover" height width)
  continuar
  putStrLn (centerText batalha height width)
  putStrLn (nome ++ ": Hmm, está na hora de eu ir até aquela luz!")
