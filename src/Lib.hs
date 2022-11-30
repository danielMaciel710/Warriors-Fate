module Lib
    ( 
        formataText,
        strip,
        lowerCase,
        gameOver,
        showFicha,
        continuar,
        batalha
    ) where

import Data.Char
import qualified Data.Text as T
import qualified Models.Hero as H
import System.IO
import Terminal

formataText :: String -> String
formataText texto = "\n" ++ texto ++ "\n"

strip :: String -> String
strip  = T.unpack . T.strip . T.pack

lowerCase :: String -> String
lowerCase = map toLower

gameOver = do
  putStrLn "GAME OVER"
  putStrLn "Your fate were determined... You are dead."
  
showFicha = do 
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  putStrLn $ show $ H.ficha hero

continuar :: IO ()
continuar = do
  putStrLn "Digite qualque tecla para continuar..."
  token <- getLine
  print ""

batalha :: String
batalha = "Você está lutando" -- Só para testes
