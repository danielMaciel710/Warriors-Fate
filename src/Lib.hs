module Lib
    ( 
        centerText,
        centerTextHeight,
        centerTextNotUp,
        strip,
        lowerCase,
        gameOver,
        showFicha
    ) where

import Data.Char
import qualified Data.Text as T
import qualified Models.Hero as H
import System.IO

centerText :: String -> Int -> Int -> String
centerText texto height width = verticalSpaces ++ horizontalSpaces ++ texto ++ horizontalSpaces ++ verticalSpaces
   where
      halfHeight = height `div` 2
      halfWidth = width `div` 2
      verticalSpaces = replicate halfHeight '\n'
      horizontalSpaces = replicate halfWidth ' '

centerTextHeight :: String -> Int -> String
centerTextHeight texto height = verticalSpaces ++  texto
   where
      halfHeight = height `div` 2
      verticalSpaces = replicate halfHeight '\n'

centerTextNotUp :: String -> Int -> Int -> String
centerTextNotUp texto height width = horizontalSpaces ++ texto ++ horizontalSpaces ++ verticalSpaces
   where
      halfHeight = height `div` 2
      halfWidth = width `div` 2
      verticalSpaces = replicate halfHeight '\n'
      horizontalSpaces = replicate halfWidth ' '


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
