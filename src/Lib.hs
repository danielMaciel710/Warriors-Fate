module Lib
    ( 
        menu,
        centerText,
        strip,
        lowerCase
    ) where

import Data.Char
import qualified Data.Text as T

menu :: Int -> Int -> IO ()
menu height width = do
    showHelp <- putStrLn (centerText "Help!" height width)
    putStrLn "------ WarriorsFate ------ \n digite \"start\" ou \"help\""
    option <- getLine
    if option == "help" then putStrLn(centerText "Help!" height width)
    else if option == "start" then putStrLn(centerText "Start!" height width)
    else putStrLn (centerText "Invalid Entry" height width)

    putStrLn "Escolha sua classe: \n Guerreiro ou Mago?"
    option <- getLine
    if option == "mago" then putStrLn(centerText "Você é um mago" height width)
    else if option == "guerreiro" then putStrLn(centerText "Você é um guerreiro" height width)
    else putStrLn(centerText "Invalid Class" height width) 

centerText :: String -> Int -> Int -> String
centerText texto height width = verticalSpaces ++ horizontalSpaces ++ texto ++ horizontalSpaces ++ verticalSpaces
   where
      halfHeight = height `div` 2
      halfWidth = width `div` 2
      verticalSpaces = replicate halfHeight '\n'
      horizontalSpaces = replicate halfWidth ' '

strip :: String -> String
strip  = T.unpack . T.strip . T.pack

lowerCase :: String -> String
lowerCase = map toLower