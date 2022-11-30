module Lib
    ( 
        formataText,
        strip,
        lowerCase,
        continuar,
        batalha
    ) where

import Data.Char
import qualified Data.Text as T
import Terminal

formataText :: String -> String
formataText texto = "\n" ++ texto ++ "\n"

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
