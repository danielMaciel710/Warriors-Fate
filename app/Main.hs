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
import GamePart1
import GamePart2
import GamePart3

main :: IO ()

main = do
  initial
   --arquivo_hero <- readFile "src/database/Hero.txt" 
   --let hero = read arquivo_hero :: H.Hero
   --let ficha = (H.getFicha hero)
   --let darDano = F.damage ficha 21 
   --putStrLn $ show ( darDano )
  batalha1
  arquivo_hero <- readFile "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  let nome = H.getNome hero
  
  putStrLn ("Você cada vez mais foi sendo atraído à esta misteriosa caverna até ela estar literalmente a sua frente: ")
  continuar
  part1 0 nome
  part2 nome
  part3 