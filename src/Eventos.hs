module Eventos
    (
      eventos
    )
where

import Lib
import System.IO
import qualified Models.Hero as H
import qualified Models.Esqueleto as E
import qualified Models.Ficha as F
import Batalha
import Lib

eventos :: String -> Int -> String -> IO ()
eventos acao perigo nome = if (lowerCase acao) == "frente"
  then caminho1 perigo nome
  else if (lowerCase acao) == "direita"
  then caminho2 perigo nome
  else if (lowerCase acao) == "esquerda"
  then do 
    putStrLn (formataText "Você vê um abismo sem fim, melhor seguir em frente...")
    continuar
    caminho1 perigo nome
  else do
    putStrLn (formataText (nome ++ ": Posso ir para *frente*, *direita* ou *esquerda*"))
    acao <- getLine
    eventos acao perigo nome

caminho1 :: Int -> String -> IO ()
caminho1 perigo nome = do
  putStrLn (formataText "Você se aproxima da saída...")
  continuar
  if perigo + 1 > 2
  then do 
    batalha1
    checkHero2     
  else putStrLn ""
  putStrLn "Ir em frente ou voltar?"
  acao <- getLine
  evento2 acao perigo nome

evento2 :: String -> Int -> String -> IO ()
evento2 acao perigo nome = if (lowerCase acao) == "frente"
  then caminho1_2 perigo nome
  else if (lowerCase acao) == "direita"
  then do
    putStrLn (formataText "Você volta e segue para direita")
    continuar
    caminho2 perigo nome
  else if (lowerCase acao) == "voltar"
  then do
    putStrLn (formataText "Você volta e segue para direita")
    continuar
    caminho2 perigo nome
  else do
    putStrLn (formataText (nome ++ ": Posso ir para *frente*, *direita*, *voltar*"))
    acao <- getLine
    evento2 acao perigo nome

caminho1_2 :: Int -> String -> IO ()
caminho1_2 perigo nome = do
  putStrLn (formataText "Você avançou mais e está bem em frente a saída dessa área")
  continuar
  if perigo + 2 > 2
  then do 
    batalha1
    checkHero2
  else putStrLn (nome ++ ": Estranho, achei que teria algum inimigo aqui...")

  continuar
  putStrLn (formataText "Você avança para próxima área")

caminho2 :: Int -> String -> IO ()
caminho2 perigo nome = do
  putStrLn (formataText "Você vê um esqueleto no chão com uma espada bem velha, e ao seu lado tem um pedestal antigo com alguma coisa escrita.")
  continuar
  if perigo + 1 > 2
  then do
    batalha1
    checkHero2 
  else putStrLn "" 

  putStrLn (nome ++ ": Eu deveria *ler pedestal*, *investigar esqueleto* ou *ir para luz* ???")
  acao <- getLine
  evento3 acao perigo nome

evento3 :: String -> Int -> String -> IO ()
evento3 acao perigo nome = if (lowerCase acao) == "ler pedestal"
  then caminho2_1 perigo nome
  else if (lowerCase acao) == "investigar esqueleto"
  then caminho2_2 perigo nome
  else if (lowerCase acao) == "ir para luz"
  then caminho1 perigo nome
  else do
    putStrLn (formataText (nome ++ ": Posso *ler pedestal*, ou *investigar esqueleto* ou *ir para luz*"))
    acao <- getLine
    evento3 acao perigo nome

caminho2_1 :: Int -> String -> IO ()
caminho2_1 perigo nome = do
  putStrLn (formataText "Para aqueles que buscam a verdadeira força: O fim começa agora. O fim mudará conforme o agora. Desvie sua atenção, mas nunca esqueça para onde está indo.")
  continuar
  caminho2 perigo nome

caminho2_2 :: Int -> String -> IO ()
caminho2_2 perigo nome = do
  putStrLn (formataText "O esqueleto começa a se mover")
  continuar
  batalha1
  checkHero2 
  putStrLn (formataText "Você encontra uma poção de cura!"  )
  let addPocao = (formataText "Você bebe a poção e se sente revigorado!")
  resetHeroPocao
  putStrLn addPocao
  continuar
  putStrLn (nome ++ ": Hmm, está na hora de eu ir até aquela luz!")
  continuar
  caminho1 perigo nome


checkHero2 = do
  arquivo_hero <- readFile' "src/database/Hero.txt"
  let hero = read arquivo_hero :: H.Hero
  let vida = H.getVida hero
  if vida <= 0 
  then do
    putStrLn (formataText "Selecione a dificuldade:\n0 - Para fácil\n1 - Para médio\n2 - Para difícil")
    dificuldade <- getLine
    putStrLn (formataText "Ao andar pela escuridão em direção a luz, algumas tochas se ascendem, revelando o local. O cenário era como uma caverna típica, porém havia um grande abismo a esquerda um caminho pela frente e um caminho a direita. A luz que te guiou foi em direção ao caminho a sua frente.")
    putStrLn "Ir em *frente*, *direita* ou *esquerda*?"
    acao <- getLine
    resetHeroPocao
    eventos acao (read dificuldade) (H.getNome hero)
  else putStrLn ""
