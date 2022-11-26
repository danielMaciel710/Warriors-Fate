module Lib
    ( 
        centerText,
        centerTextHeight,
        centerTextNotUp,
        strip,
        lowerCase
    ) where

import Data.Char
import qualified Data.Text as T

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
