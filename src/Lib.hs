module Lib
    ( 
        centerText,
        centerTextHeight,
        centerTextHeight2,
        centerTextNotUp,
        strip,
        lowerCase,
        continuar,
        batalha
    ) where

import Data.Char
import qualified Data.Text as T
import Terminal

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
      horizontalSpaces = replicate halfWidth ' '
      verticalSpaces = replicate halfHeight '\n'

centerTextHeight2 :: String -> Int -> String
centerTextHeight2 texto height = verticalSpaces ++ texto ++ verticalSpaces
   where
      halfHeight = height `div` 2
      verticalSpaces = replicate halfHeight '\n'

strip :: String -> String
strip  = T.unpack . T.strip . T.pack

lowerCase :: String -> String
lowerCase = map toLower

continuar :: IO ()
continuar = do
  putStrLn "Digite qualque tecla para continuar..."
  token <- getLine
  print ""

batalha :: String
batalha = "Você está lutando" -- Só para testes
