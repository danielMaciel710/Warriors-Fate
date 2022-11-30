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
import GamePart1
import GamePart2
import GamePart3
import Eventos
import Eventos2

initial = do
  choosePath

choosePath = do
  putStrLn (formataText ("      WarriorsFate\ndigite *start* ou *help*"))

  option <- getLine
  if (lowerCase $ strip option) == "help" then showHelp
  else if (lowerCase $ strip option) == "start" then startGame
    else invalidPath

showHelp = do
  putStrLn (formataText ("Help")  )
  putStrLn (formataText("Todas as ações do jogador serão através da entrada de palavras ou frases. O jogador poderá se mover, atacar, usar habilidades específicas e interagir com o cenário de forma bem simples.\n\nNas batalhas aparecerá os valores dos atributos do inimigo ou do jogador dependendo se ele usou uma habilidade ou o inimigo tenha usado.\n\nPara uma melhor experiência do jogo, ajuste a tela apertando (Ctrl + Shift + ) ou (Ctrl - ) até os traços que dividem o texto preencherem totalmente a tela sem passar para linha de baixo") )
  putStrLn (formataText("digite *voltar* ou *sair*"))

  option <- getLine
  if (lowerCase $ strip option) == "voltar" then choosePath
  else if (lowerCase $ strip option) == "sair" then exit
    else invalidPath

startGame = do
  chooseClass
  arquivo_hero <- readFile' "src/database/Hero.txt"
  let hero = read arquivo_hero :: H.Hero
  let nome = H.getNome hero

  putStrLn (formataText (nome ++ " cada vez mais foi sendo atraído à esta misteriosa caverna até ela estar literalmente a sua frente:"))
  continuar
  part1 3 nome
  part2 nome
  part3

chooseClass = do
  putStrLn (formataText("Há muito tempo atrás numa terra distante, existia uma lenda: Bravos guerreiros em um momento específico de sua jornada eram atraídos para uma misteriosa caverna, esta que prometia à aqueles que superassem seus desafios um imenso poder..."))
  putStrLn "Aperte qualquer tecla para continuar: "
  token <- getLine
  putStrLn (formataText ("Escolha sua classe: \nGuerreiro ou Mago?"))

  option <- getLine
  if (lowerCase $ strip option) == "mago" then magoPath 
  else if (lowerCase $ strip option) == "guerreiro" then warriorPath
  else invalidClass

magoPath = do
  putStrLn (formataText ("Digite o seu nome: "))

  nome <- getLine
  content_ficha <- readFile' "src/database/fichaMage.txt"
  let atributos = read content_ficha :: Ficha
  let hero = H.Hero (strip nome) "Mago" atributos
  writeFile "src/database/Hero.txt" (show hero)
    

warriorPath = do
  putStrLn (formataText ("Digite o seu nome: "))

  nome <- getLine
  content_ficha <- readFile' "src/database/fichaWarrior.txt"
  let atributos = read content_ficha :: Ficha
  let hero = H.Hero (strip nome) "Guerreiro" atributos
  writeFile "src/database/Hero.txt" (show hero)

invalidPath = do
  putStrLn (formataText ("Invalid entry!")  )
  choosePath
    
invalidClass = do
  putStrLn (formataText ("Invalid entry!")  )
  chooseClass

invalidNameWarrior = do
  putStrLn (formataText ("Invalid name: Null")  )
  warriorPath

invalidNameMago = do
  putStrLn (formataText ("Invalid name: Null")  )
  magoPath

exit = do
  putStrLn (formataText "Encerrando...")
