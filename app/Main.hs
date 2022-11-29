module Main (main) where
import System.IO

import StartGame
import qualified Models.Hero as H
import Models.Ficha
import qualified Models.Npc as N 
import qualified Terminal
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)
import Lib
import GamePart1

main :: IO ()

main = do
  initial
  arquivo_hero <- readFile "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  let nome = H.getNome hero
  
  putStrLn ("Você cada vez mais foi sendo atraído à esta misteriosa caverna até ela estar literalmente a sua frente: ")
  continuar
  part1 0 nome
