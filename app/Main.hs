module Main (main) where
import System.IO

import StartGame
import qualified Models.Hero as H
import Models.Ficha as F
import qualified Terminal
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)
import Lib
import Batalha

main :: IO ()

main = do
  --initial
  -- arquivo_hero <- readFile "src/database/Hero.txt" 
  -- let hero = read arquivo_hero :: H.Hero
  -- let ficha = (H.getFicha hero)
  -- let darDano = F.damage ficha 21 
  -- putStrLn $ show ( darDano )
  --batalha1