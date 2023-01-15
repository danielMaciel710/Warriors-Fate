/* Vou entender pra que server cada coisa abaixo

  getArmaDanoFisico :: Ficha -> Int
  getArmaDanoFisico ficha = read ((arma ficha) !!1) :: Int

  getArmaDanoMagico :: Ficha -> Int
  getArmaDanoMagico ficha = read ((arma ficha) !!2) :: Int

  danoConcentrado :: Ficha -> String -> Int
  danoConcentrado ficha classe = if classe == "Guerreiro" then (forca ficha) + (destreza ficha)
    else (inteligencia ficha) + (destreza ficha)

  danoArea :: Ficha -> String -> Int
  danoArea ficha classe = if classe == "Guerreiro" then (forca ficha)
    else (inteligencia ficha) 
  
  usarHabilidade :: Ficha -> Int -> String -> Ficha
  usarHabilidade ficha qtd classe =  if(classe == "Mago") then Ficha (vida ficha) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) ((mana ficha) - qtd) (defesa ficha) (stamina ficha) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)
    else Ficha (vida ficha) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) (mana ficha)  (defesa ficha) ((stamina ficha) - qtd) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)

  damage ficha dano = if (dano > (armadura ficha)) then 
      Ficha ((vida ficha) - (dano - (armadura ficha))) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) (mana ficha) (defesa ficha) (stamina ficha) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)
    else ficha
