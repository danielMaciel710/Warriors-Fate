module Eventos
    (
      eventos
    )
where

import Lib
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)

eventos :: String -> Int -> String -> IO ()
eventos acao perigo nome = if (lowerCase acao) == "frente"
  then caminho1 perigo nome
  else if (lowerCase acao) == "direita"
  then caminho2 perigo nome
  else if (lowerCase acao) == "esquerda"
  then do 
    putStrLn (formataText "Você vê um abismo sem fim, melhor seguir em frente..."  )
    continuar -- Função que printa uma mensagem e espera uma entrada qualquer, só para o jogador ler o que tá na tela.
    caminho1 perigo nome
  else do
    putStrLn (formataText (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")  )
    acao <- getLine
    eventos acao perigo nome

caminho1 :: Int -> String -> IO ()
caminho1 perigo nome = do
  putStrLn (formataText "Você se aproxima da saída..."  )
  putStrLn "Ir em frente ou voltar?"
  acao <- getLine
  if perigo > 2
  then putStrLn (formataText batalha  ) -- Falta implementar batalha 
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
    putStrLn (formataText "Você volta e segue para direita"  )
    continuar
    caminho2 perigo nome
  else do
    putStrLn (formataText (nome ++ ": Posso ir para *frente*, *direita*, *voltar*")  )
    acao <- getLine
    evento2 acao perigo nome

caminho1_2 :: Int -> IO ()
caminho1_2 perigo = do
  putStrLn (formataText "Você está em frente a saída..."  )
  putStrLn "Aperte qualquer tecla para continuar"
  acao <- getLine
  if perigo + 2 > 2
  then putStrLn (formataText batalha  )
  else print "Nenhum inimigo a vista"
  continuar
  putStrLn (formataText "Você avança para próxima área"  )

caminho2 :: Int -> String -> IO ()
caminho2 perigo nome = do
  putStrLn (formataText "Você vê um esqueleto no chão com uma espada bem velha, e ao seu lado tem um pedestal antigo com alguma coisa escrita." )
  putStrLn "O que eu devo fazer agora?"
  acao <- getLine
  if perigo > 2
  then putStrLn (formataText batalha  )
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
    putStrLn (formataText (nome ++ ": Posso *ler pedestal*, ou *investigar esqueleto*")  )
    acao <- getLine
    evento3 acao perigo nome

caminho2_1 :: String -> IO ()
caminho2_1 nome = do
  putStrLn (formataText "Para aqueles que buscam a verdadeira força: O fim começa agora. O fim mudará conforme o agora. Desvie sua atenção, mas nunca esqueça para onde está indo." )
  caminho2_2 nome

caminho2_2 :: String -> IO ()
caminho2_2 nome = do
  putStrLn (formataText "Você encontra uma poção de cura!"  )
  let addPocao = "Foi adicionado uma poção ao seu inventário" -- Só para testar aplicação, esta deve ser uma função de Lib.hs 
  putStrLn addPocao
  continuar

  putStrLn (formataText "O esqueleto começa a se mover"  )
  continuar
  putStrLn (formataText batalha  )
  putStrLn (nome ++ ": Hmm, está na hora de eu ir até aquela luz!")
