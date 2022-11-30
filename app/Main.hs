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

main = initial