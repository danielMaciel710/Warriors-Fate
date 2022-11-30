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
import Terminal
import Eventos
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)
import Eventos2

-- retorna as dimensões do terminal em uma tupla
terminalSize = unsafeDupablePerformIO Terminal.getTermSize
height = fst terminalSize -- pega a altura do terminal
width = snd terminalSize -- pega a largura do terminal

part2 nome = do
  putStrLn (centerText "Enquanto avança você avista 3 caminhos, um a esquerda, um a direia e um a sua frente" height width)
  acao <- getLine
  eventos2 acao nome
