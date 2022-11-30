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
--import Terminal
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)
import GamePart1
import GamePart2
import GamePart3
import Eventos
import Eventos2

initial = do
  choosePath

choosePath = do
  putStrLn ("------ WarriorsFate ------ \n digite \"start\" ou \"help\"")
  option <- getLine
  if (lowerCase $ strip option) == "help" then showHelp
  else if (lowerCase $ strip option) == "start" then startGame
    else invalidPath

showHelp = do
  putStrLn ("------ Help ------")
  putStrLn ("Todas as ações do jogador serão através da entrada de palavras ou frases. O jogador poderá se mover, atacar, usar itens, habilidades específicas e interagir com o cenário de forma bem simples.\n\nUma parte de tela sempre mostrará uma ficha com os itens e atributos do personagem, enquanto outra, descreverá os acontecimentos da história.")
  putStrLn ("------  ------ \n digite \"voltar\" ou \"sair\"")
  option <- getLine
  if (lowerCase $ strip option) == "voltar" then choosePath
  else if (lowerCase $ strip option) == "sair" then exit
    else invalidPath

startGame = do
  chooseClass
  arquivo_hero <- readFile "src/database/Hero.txt"
  let hero = read arquivo_hero :: H.Hero
  let nome = H.getNome hero

  putStrLn (" \n Você cada vez mais foi sendo atraído à esta misteriosa caverna até ela estar literalmente a sua frente: \n ")
  continuar
  part1 3 nome
  part2 nome
  part3

chooseClass = do
  putStrLn " \n Há muito tempo atrás numa terra distante, existia uma lenda: Bravos guerreiros em um momento específico de sua jornada eram atraídos para uma misteriosa caverna, esta que prometia à aqueles que superassem seus desafios um imenso poder..." 
  putStrLn " \n Aperte qualquer tecla para continuar: \n"
  token <- getLine
  putStrLn "Escolha sua classe: \n Guerreiro ou Mago? \n " 
  option <- getLine
  if (lowerCase $ strip option) == "mago" then magoPath 
  else if (lowerCase $ strip option) == "guerreiro" then warriorPath
  else invalidClass

magoPath = do
  putStrLn (" \n Digite o seu nome: \n ")
  nome <- getLine
  content_ficha <- readFile "src/database/fichaMage.txt"
  let atributos = read content_ficha :: Ficha
  let hero = H.Hero (strip nome) "Mago" atributos
  writeFile "src/database/Hero.txt" (show hero)
    

warriorPath = do
  putStrLn (" \n Digite o seu nome: \n ")
  nome <- getLine
  content_ficha <- readFile "src/database/fichaWarrior.txt"
  let atributos = read content_ficha :: Ficha
  let hero = H.Hero (strip nome) "Guerreiro" atributos
  writeFile "src/database/Hero.txt" (show hero)

invalidPath = do
  putStrLn ("Invalid entry!")
  choosePath
    
invalidClass = do
  putStrLn ("Invalid entry!")
  chooseClass

invalidNameWarrior = do
  putStrLn ("Invalid name: Null")
  warriorPath

invalidNameMago = do
  putStrLn ("Invalid name: Null")
  magoPath

exit = do
  putStrLn ("------  ------ \n Encerrando...")
  putStrLn ("------  ------ ")
