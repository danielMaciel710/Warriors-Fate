module Batalha 
    (
      batalha1
    )
where
import Lib
import qualified Models.Hero as H
import qualified Models.Esqueleto as E
import qualified Models.Ficha as F
import System.IO

batalha1 = do
  let reset = E.reset
  writeFile "src/database/Esqueleto.txt" ( show reset )
  putStrLn "aparece um esqueleto..."
  showEsqueleto
  putStrLn "Selecione uma ação:"
  turnoHero

turnoHero = do  
  acao
  checkEsqueleto

turnoEsqueleto = do
  
  arquivo_esqueleto <- readFile' "src/database/Esqueleto.txt"
  let esqueleto = read arquivo_esqueleto :: E.Esqueleto
  let vida = E.vida esqueleto
  if vida <= 20 then esqueletoEspecial
  else ataqueEsqueleto


esqueletoEspecial = do
  arquivo_esqueleto <- readFile' "src/database/Esqueleto.txt"
  let esqueleto = read arquivo_esqueleto :: E.Esqueleto
  if (E.armadura esqueleto) < 10 then enrijecer
  else ataqueEsqueleto

enrijecer = do
  arquivo_esqueleto <- readFile' "src/database/Esqueleto.txt"
  let esqueleto = read arquivo_esqueleto :: E.Esqueleto
  let updatedEsqueleto = E.enrijecer esqueleto
  writeFile "src/database/Esqueleto.txt" ( show updatedEsqueleto )
  putStrLn "Esqueleto usa habilidade *Enrijecer* (2x armadura)"
  showEsqueleto
  turnoHero


acao = do 
  putStrLn "------  ------ \n*ataque fisico* *ataque magico* *habilidade*\n------  ------ "
  option <- getLine
  if (lowerCase $ strip option) == "ataque fisico" then ataqueFisico
  else if (lowerCase $ strip option) == "ataque magico" then ataqueMagico
  --else if (lowerCase $ strip option) == "habilidade" then habilidade
  else invalidClass

ataqueFisico:: IO()
ataqueFisico = do
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  arquivo_esqueleto <- readFile' "src/database/Esqueleto.txt"
  let esqueleto = read arquivo_esqueleto :: E.Esqueleto
  let dano = H.ataqueFisico hero
  let darDano = E.damage esqueleto dano
  writeFile "src/database/Esqueleto.txt" ( show darDano )
  
  putStrLn "------ ------"
  putStrLn $ "Você ataca dando " ++ (show dano) ++ " de dano no esqueleto!"
  showEsqueleto
  putStrLn "------ ------"

ataqueMagico:: IO()
ataqueMagico = do
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  arquivo_esqueleto <- readFile' "src/database/Esqueleto.txt"
  let esqueleto = read arquivo_esqueleto :: E.Esqueleto
  let dano = H.ataqueMagico hero
  let darDano = E.damage esqueleto dano
  writeFile "src/database/Esqueleto.txt" ( show darDano )
    
  putStrLn "------ ------"
  putStrLn $ "Você ataca dando " ++ (show dano) ++ " de dano no esqueleto!"
  showEsqueleto
  putStrLn "------ ------"

ataqueEsqueleto = do
  let dano = E.darDano
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  let ficha = H.getFicha hero
  let updatedFicha = F.damage ficha dano
  let updatedHero = H.updateFicha hero updatedFicha
  writeFile "src/database/Hero.txt" ( show updatedHero )
  
  putStrLn "------ ------"
  putStrLn $ "O esqueleto te ataca dando " ++ (show dano) ++ " de dano"
  showFicha
  putStrLn "------ ------"
  checkHero
  

checkHero = do
  arquivo_hero <- readFile "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  let vida = H.getVida hero
  if vida <= 0 then gameOver
  else turnoHero

checkEsqueleto = do
  arquivo_esqueleto <- readFile "src/database/Esqueleto.txt"
  let esqueleto = read arquivo_esqueleto :: E.Esqueleto
  let vida = E.vida esqueleto
  if (vida <= 0) then fimDeBatalha
  else turnoEsqueleto

fimDeBatalha = do
  putStrLn "You won the battle!"


invalidClass = do
  putStrLn "Eu posso utilizar as seguintes habilidades..."
  acao

showEsqueleto = do
  arquivo_esqueleto <- readFile' "src/database/Esqueleto.txt"
  let esqueleto = read arquivo_esqueleto :: E.Esqueleto
  putStrLn $ "Esqueleto {Vida: " ++ (show $ E.vida esqueleto) ++ ", armadura: " ++ (show $ E.armadura esqueleto) ++ "}"