module Batalha 
    (
      batalha1
    )
where
import qualified Models.Hero as H
import qualified Models.Esqueleto as E
import qualified Models.Ficha as F
import System.IO
import Lib

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
  else if (lowerCase $ strip option) == "habilidade" then habilidade
  else if (lowerCase $ strip option) == "nada" then turnoEsqueleto
  else invalidClass

habilidade = do
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  if (H.getClasse hero == "Guerreiro") then habilidadeWarrior
  else habilidadeMago

habilidadeWarrior = do
  putStrLn "Você possui as seguintes habilidades:"
  putStrLn "1: Golpe Concentrado (20) 2: Golpe Giratório (30) 3: Cura (50)"
  option <- getLine
  if (lowerCase $ strip option) == "1" then habilidadeUm 
  else if (lowerCase $ strip option) == "2" then habilidadeDois
  else if (lowerCase $ strip option) == "3" then habilidadeTres
  else invalidClass

habilidadeMago = do
  putStrLn "Você possui as seguintes habilidades:"
  putStrLn "1: Raio de Gelo (20) 2: Bola de Fogo (30) 3: Cura (50)"
  option <- getLine
  if (lowerCase $ strip option) == "1" then verifySpellOne 
  else if (lowerCase $ strip option) == "2" then verifySpellTwo
  else if (lowerCase $ strip option) == "3" then verifySpellThree
  else invalidClass

verifySpellOne = do
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  if (H.getClasse hero) == "Mago" then do
    let qtdMana = H.getMana hero
    if qtdMana >= 20 then habilidadeUm
    else insuficienteMana
  else do
    let qtdStamina = H.getStamina hero
    if qtdStamina >= 20 then habilidadeUm
    else insuficienteStamina 
    
verifySpellTwo = do
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  if (H.getClasse hero) == "Mago" then do
    let qtdMana = H.getMana hero
    if qtdMana >= 30 then habilidadeDois
    else insuficienteMana
  else do
    let qtdStamina = H.getStamina hero
    if qtdStamina >= 30 then habilidadeDois
    else insuficienteStamina 

verifySpellThree = do
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  if (H.getClasse hero) == "Mago" then do
    let qtdMana = H.getMana hero
    if qtdMana >= 50 then habilidadeTres
    else insuficienteMana
  else do
    let qtdStamina = H.getStamina hero
    if qtdStamina >= 50 then habilidadeTres
    else insuficienteStamina 

habilidadeUm = do
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  arquivo_esqueleto <- readFile' "src/database/Esqueleto.txt"
  let updatedFicha = H.usarHabilidade hero 20
  let updatedHero = H.updateFicha hero updatedFicha
  writeFile "src/database/Hero.txt" ( show updatedHero )
  let esqueleto = read arquivo_esqueleto :: E.Esqueleto
  let dano = H.danoConcentrado hero
  let darDano = E.damage esqueleto dano
  writeFile "src/database/Esqueleto.txt" ( show darDano )
  
  putStrLn "------ ------"
  putStrLn $ "Você ataca dando " ++ (show dano) ++ " de dano no esqueleto!"
  showEsqueleto
  putStrLn "------ ------"

habilidadeDois = do
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  arquivo_esqueleto <- readFile' "src/database/Esqueleto.txt"
  let updatedFicha = H.usarHabilidade hero 30
  let updatedHero = H.updateFicha hero updatedFicha
  writeFile "src/database/Hero.txt" ( show updatedHero )
  let esqueleto = read arquivo_esqueleto :: E.Esqueleto
  let dano = H.danoArea hero
  let darDano = E.damage esqueleto dano
  writeFile "src/database/Esqueleto.txt" ( show darDano )
  
  putStrLn "------ ------"
  putStrLn $ "Você ataca dando " ++ (show dano) ++ " de dano no esqueleto!"
  showEsqueleto
  putStrLn "------ ------"

habilidadeTres = do
  arquivo_hero <- readFile' "src/database/Hero.txt" 
  let hero = read arquivo_hero :: H.Hero
  let updatedFicha = H.usarHabilidade hero 50
  let updatedHero = H.updateFicha hero updatedFicha
  let cura = H.cura updatedHero
  writeFile "src/database/Hero.txt" ( show cura )
  
  putStrLn "------ ------"
  putStrLn $ "Você se cura!"
  showEsqueleto
  putStrLn "------ ------"

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
  arquivo_hero <- readFile' "src/database/Hero.txt"
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

insuficienteMana = do
  putStrLn "Você não possui mana suficiente para utilizar essa habilidade!"
  acao

insuficienteStamina = do
  putStrLn "Você não possui stamina suficiente para utilizar essa habilidade!"
  acao

showEsqueleto = do
  arquivo_esqueleto <- readFile' "src/database/Esqueleto.txt"
  let esqueleto = read arquivo_esqueleto :: E.Esqueleto
  putStrLn $ "Esqueleto {Vida: " ++ (show $ E.vida esqueleto) ++ ", armadura: " ++ (show $ E.armadura esqueleto) ++ "}"
