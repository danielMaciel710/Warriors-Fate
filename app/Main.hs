module Main (main) where
import System.IO

import StartGame
import qualified Models.Hero as H
import Models.Ficha as F
import qualified Models.Npc as N 
import qualified Terminal
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)
import Lib

main :: IO ()

main = do
  initial
  arquivo_hero <- readFile "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  let ficha = (H.getFicha hero)
  let darDano = F.damage ficha 15
  putStrLn $ show ( darDano )