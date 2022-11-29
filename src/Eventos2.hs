module Eventos2
    (
      eventos2
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

eventos2 :: String -> String -> IO ()
eventos2 acao nome = if (lowerCase acao) == "frente"
  then caminho1 nome
  else if (lowerCase acao) == "direita"
  then caminho2 nome
  else if (lowerCase acao) == "esquerda"
  then do
    putStrLn (centerText "Ao seguir esse caminho, de alguma forma você volta para entrada..." height width)
    putStrLn (nome ++ ": Falta testar esquerda e a direita...")
    acao <- getLine
    eventos2 acao nome
  else do
    putStrLn (centerText (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*") height width)
    acao <- getLine
    eventos2 acao nome

caminho1 :: String -> IO ()
caminho1 nome = do
  putStrLn (centerText "Você continua em frente até encontrar dois caminhos" height width)
  putStrLn "Ir pela esquerda ou direita?"
  acao <- getLine
  evento2 acao nome

evento2 :: String -> String -> IO ()
evento2 acao nome = if (lowerCase acao) == "esquerda"
   then do
    putStrLn (centerText "Ao seguir esse caminho, de alguma forma você volta para entrada..." height width)
    putStrLn (nome ++ ": Hmm, preciso tentar um caminho diferente...")
    putStrLn ("\n" ++ nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")
    acao <- getLine
    eventos2 acao nome
  else if (lowerCase acao) == "direita"
  then caminho1_2 nome
  else do
    putStrLn (centerText (nome ++ ": Posso ir para *direita* ou *esquerda*") height width)
    acao <- getLine
    evento2 acao nome

caminho1_2 :: String -> IO ()
caminho1_2 nome = do
  putStrLn (centerText "Você continua em frente e dessa vez encontra três caminhos" height width)
  putStrLn (nome ++ ": Hmm, tenho o pressentimento de que estou perto de sair desse labirinto")
  putStrLn "\nIr em frente, esquerda ou direita?"
  acao <- getLine
  evento3 acao nome

evento3 :: String -> String -> IO ()
evento3 acao nome = if (lowerCase acao) == "frente"
  then do
    putStrLn (centerText "Ao seguir esse caminho, de alguma forma você volta para entrada..." height width)
    putStrLn (nome ++ ": Preciso tentar um caminho diferente")
    putStrLn (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")
    acao <- getLine
    eventos2 acao nome
  else if (lowerCase acao) == "direita"
    then do
      putStrLn (centerText "Ao seguir esse caminho, de alguma forma você volta para entrada..." height width)
      putStrLn (nome ++ ": Com certeza esse não era o caminho")
      putStrLn (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")
      acao <- getLine
      eventos2 acao nome
  else if (lowerCase acao) == "esquerda"
  then do
    putStrLn (centerText "Você encontra uma poção de cura!" height width)
    let addPocao = "Foi adicionado uma poção ao seu inventário" -- Só para testar aplicação, esta deve ser uma função de Lib.hs 
    putStrLn addPocao
    continuar
    putStrLn (centerText "Você avista um grande portão adornado que se destaca completamente no cenário." height width)
  else do
    putStrLn (centerText (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*") height width)
    acao <- getLine
    evento3 acao nome

caminho2 :: String -> IO ()
caminho2 nome = do
  putStrLn (centerText "Você continua em frente até encontrar dois caminhos" height width)
  putStrLn "Ir pela esquerda ou direita?"
  acao <- getLine
  evento4 acao nome


evento4 :: String -> String -> IO ()
evento4 acao nome = if (lowerCase acao) == "direita"
   then do
    putStrLn (centerText "Ao seguir esse caminho, de alguma forma você volta para entrada..." height width)
    putStrLn (nome ++ ": Hmm, preciso tentar um caminho diferente...")
    putStrLn ("\n" ++ nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")
    acao <- getLine
    eventos2 acao nome
  else if (lowerCase acao) == "esquerda"
  then putStrLn (centerText "Você avista um grande portão adornado que se destaca completamente no cenário." height width)
  else do
    putStrLn (centerText (nome ++ ": Posso ir para *direita* ou *esquerda*") height width)
    acao <- getLine
    evento2 acao nome


