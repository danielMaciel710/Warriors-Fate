module GamePart2
    (
      part2
    )
where

import Lib
import System.IO
import System.Directory
import qualified Models.Hero as H
import Models.Ficha
import Eventos
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)
import Eventos2

part2 nome = do
  putStrLn (formataText "Enquanto avança você avista 3 caminhos, um a esquerda, um a direia e um a sua frente" )
  acao <- getLine
  eventos2 acao nome
