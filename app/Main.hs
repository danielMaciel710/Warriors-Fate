module Main (main) where
import System.IO

import qualified Models.Hero as H
import Models.Ficha
import qualified Models.Npc as N 
import qualified Terminal
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)
import Lib

main :: IO ()
main = do 
   let terminalSize = unsafeDupablePerformIO Terminal.getTermSize
   let height = fst terminalSize -- pega a altura do terminal
   let width = snd terminalSize -- pega a largura do terminal
   menu height width
