module StartGame 
    (
      initial
    )
where

import Lib
import System.IO
import System.Directory
import qualified Models.Hero as H
import Models.Ficha
import Terminal
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)

-- retorna as dimensões do terminal em uma tupla
terminalSize = unsafeDupablePerformIO Terminal.getTermSize
height = fst terminalSize -- pega a altura do terminal
width = snd terminalSize -- pega a largura do terminal

initial = do
  choosePath

choosePath = do
  putStrLn (centerText ("------ WarriorsFate ------ \n digite \"start\" ou \"help\"") height width)
  option <- getLine
  if (lowerCase $ strip option) == "help" then showHelp
  else if (lowerCase $ strip option) == "start" then startGame
    else invalidPath

showHelp = do
  putStrLn (centerText ("------ Help ------") height width)
  putStrLn (centerTextHeight ("Todas as ações do jogador serão através da entrada de palavras ou frases. O jogador poderá se mover, atacar, usar itens, habilidades específicas e interagir com o cenário de forma bem simples.\n\nUma parte de tela sempre mostrará uma ficha com os itens e atributos do personagem, enquanto outra, descreverá os acontecimentos da história.") height)
  putStrLn (centerTextNotUp ("------  ------ \n digite \"voltar\" ou \"sair\"") height width)
  option <- getLine
  if (lowerCase $ strip option) == "voltar" then choosePath
  else if (lowerCase $ strip option) == "sair" then exit
    else invalidPath

startGame = do
  chooseClass

chooseClass = do
  putStrLn (centerText ("Escolha sua classe: \n Guerreiro ou Mago?") height width)
  option <- getLine
  if (lowerCase $ strip option) == "mago" then magoPath 
  else if (lowerCase $ strip option) == "guerreiro" then warriorPath
    else invalidClass

magoPath = do
  putStrLn (centerText ("Digite o seu nome: ") height width)
  nome <- getLine
  content_ficha <- readFile "src/database/fichaMage.txt"
  let atributos = read content_ficha :: Ficha
  let hero = H.Hero (strip nome) "Mago" atributos
  writeFile "src/database/Hero.txt" (show hero)

warriorPath = do
  putStrLn (centerText ("Digite o seu nome: ") height width)
  nome <- getLine
  content_ficha <- readFile "src/database/fichaWarrior.txt"
  let atributos = read content_ficha :: Ficha
  let hero = H.Hero (strip nome) "Guerreiro" atributos
  writeFile "src/database/Hero.txt" (show hero)

invalidPath = do
  putStrLn (centerText ("Invalid entry!") height width)
  choosePath
    
invalidClass = do
  putStrLn (centerText ("Invalid entry!") height width)
  chooseClass

invalidNameWarrior = do
  putStrLn (centerText ("Invalid name: Null") height width)
  warriorPath

invalidNameMago = do
  putStrLn (centerText ("Invalid name: Null") height width)
  magoPath

exit = do
  putStrLn (centerText ("------  ------ \n Encerrando...") height width)
  putStrLn (centerText ("------  ------ ") height width)
