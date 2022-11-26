module Main (main) where
import System.IO

import StartGame
import qualified Models.Hero as H
import Models.Ficha
import qualified Models.Npc as N 

main :: IO ()
main = do
  initial
  arquivo_hero <- readFile "src/database/Hero.txt" 

  let hero = read arquivo_hero :: H.Hero
  print $ H.getNome hero
