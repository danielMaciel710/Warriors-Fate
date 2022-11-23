module Main (main) where
import System.IO
import System.Directory

import Lib
import qualified Models.Hero as H
import Models.Ficha
import qualified Models.Npc as N 

main :: IO ()
main = do
  arquivo_ficha <- openFile "./database/ficha.txt" ReadMode
  content_ficha <- hGetContents arquivo_ficha
  print content_ficha

  let atributos = read content_ficha :: Ficha
  
  let hero = H.Hero "Tales" "Mago" atributos
  putStrLn $ show $ forca $ H.ficha hero
  putStrLn $ show $ H.classe hero
  print hero

  let esqueleto = N.Npc "Esqueleto" "bipedes" atributos
  print esqueleto
