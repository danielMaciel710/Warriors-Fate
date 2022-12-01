module Eventos2
    (
      eventos2
    )
where

import Lib
import System.IO

eventos2 :: String -> String -> IO ()
eventos2 acao nome = if (lowerCase acao) == "frente"
  then caminho1 nome
  else if (lowerCase acao) == "direita"
  then caminho2 nome
  else if (lowerCase acao) == "esquerda"
  then do
    putStrLn (formataText "Ao seguir esse caminho, de alguma forma você volta para entrada..."  )
    putStrLn (nome ++ ": Preciso tentar um caminho diferente...")
    continuar
    putStrLn ("\n" ++ nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")
    acao <- getLine
    eventos2 acao nome
  else do
    putStrLn (formataText (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")  )
    acao <- getLine
    eventos2 acao nome

caminho1 :: String -> IO ()
caminho1 nome = do
  putStrLn (formataText "Você continua em frente até encontrar dois caminhos"  )
  putStrLn "Ir pela esquerda ou direita?"
  acao <- getLine
  evento2 acao nome

evento2 :: String -> String -> IO ()
evento2 acao nome = if (lowerCase acao) == "esquerda"
   then do
    putStrLn (formataText "Ao seguir esse caminho, de alguma forma você volta para entrada..."  )
    putStrLn (nome ++ ": Hmm, preciso tentar um caminho diferente...")
    continuar
    putStrLn ("\n" ++ nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")
    acao <- getLine
    eventos2 acao nome
  else if (lowerCase acao) == "direita"
  then caminho1_2 nome
  else do
    putStrLn (formataText (nome ++ ": Posso ir para *direita* ou *esquerda*")  )
    acao <- getLine
    evento2 acao nome

caminho1_2 :: String -> IO ()
caminho1_2 nome = do
  putStrLn (formataText "Você continua em frente e dessa vez encontra três caminhos"  )
  putStrLn (nome ++ ": Hmm, tenho o pressentimento de que estou perto de sair desse labirinto")
  putStrLn "\nIr em frente, esquerda ou direita?"
  acao <- getLine
  evento3 acao nome

evento3 :: String -> String -> IO ()
evento3 acao nome = if (lowerCase acao) == "frente"
  then do
    putStrLn (formataText "Ao seguir esse caminho, de alguma forma você volta para entrada..."  )
    putStrLn (nome ++ ": Preciso tentar um caminho diferente")
    putStrLn (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")
    acao <- getLine
    eventos2 acao nome
  else if (lowerCase acao) == "direita"
    then do
      putStrLn (formataText "Ao seguir esse caminho, de alguma forma você volta para entrada..."  )
      putStrLn (nome ++ ": Com certeza esse não era o caminho")
      putStrLn (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")
      acao <- getLine
      eventos2 acao nome
  else if (lowerCase acao) == "esquerda"
  then do
    putStrLn (formataText "Você encontra uma poção de cura!")
    let addPocao = "Você toma a poção e se sente revigorado!"
    putStrLn (formataText addPocao)
    resetHeroPocao
    continuar
    putStrLn (formataText "Você avista um grande portão adornado que se destaca completamente no cenário."  )
    continuar
  else do
    putStrLn (formataText (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")  )
    acao <- getLine
    evento3 acao nome

caminho2 :: String -> IO ()
caminho2 nome = do
  putStrLn (formataText "Você continua em frente até encontrar dois caminhos"  )
  putStrLn "Ir pela *esquerda* ou *direita*?"
  acao <- getLine
  evento4 acao nome


evento4 :: String -> String -> IO ()
evento4 acao nome = if (lowerCase acao) == "direita"
   then do
    putStrLn (formataText "Ao seguir esse caminho, de alguma forma você volta para entrada..."  )
    putStrLn (nome ++ ": Hmm, preciso tentar um caminho diferente...")
    continuar
    putStrLn ("\n" ++ nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*")
    acao <- getLine
    eventos2 acao nome
  else if (lowerCase acao) == "esquerda"
  then do
    putStrLn (formataText "Você avista um grande portão adornado que se destaca completamente no cenário."  )
    continuar
  else do
    putStrLn (formataText (nome ++ ": Posso ir para *direita* ou *esquerda*")  )
    acao <- getLine
    evento2 acao nome
