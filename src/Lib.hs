module Lib
    ( 
        formataText,
        strip,
        lowerCase,
        gameOver,
        showFicha,
        continuar
    ) where

import Data.Char
import qualified Data.Text as T
import qualified Models.Hero as H
import System.IO

formataText :: String -> String
formataText texto  = "\n-------------------------------------------------------------------------------\n" ++ texto ++ "\n-------------------------------------------------------------------------------\n"

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
  putStrLn $ (formataText (show $ H.ficha hero))

continuar :: IO ()
continuar = do
  putStrLn "Aperte qualquer tecla para continuar..."
  token <- getLine
  putStrLn ""
