module Models.Ficha where
  data Ficha = Ficha {
    vida :: Int,  
    forca:: Int,
    destreza:: Int,
    constituicao:: Int,
    inteligencia:: Int,
    mana:: Int,
    defesa:: Int,
    stamina:: Int,
    experiencia:: Int,
    armadura:: Int,
    arma:: [String],
    pocao:: Int
  } deriving (Show, Read)
  
  getVida :: Ficha -> Int
  getVida ficha = vida ficha

  getForca :: Ficha -> Int
  getForca ficha = forca ficha
  
  getInteligencia :: Ficha -> Int
  getInteligencia ficha = inteligencia ficha

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
  
  cura :: Ficha -> String -> Ficha
  cura ficha classe = if classe == "Guerreiro" then Ficha ((vida ficha) + (forca ficha)) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) (mana ficha) (defesa ficha) (stamina ficha) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)
    else Ficha ((vida ficha) + (inteligencia ficha)) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) (mana ficha) (defesa ficha) (stamina ficha) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)  

  getMana :: Ficha -> Int
  getMana ficha = mana ficha

  getStamina :: Ficha -> Int
  getStamina ficha = stamina ficha
  
  usarHabilidade :: Ficha -> Int -> String -> Ficha
  usarHabilidade ficha qtd classe =  if(classe == "Mago") then Ficha (vida ficha) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) ((mana ficha) - qtd) (defesa ficha) (stamina ficha) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)
    else Ficha (vida ficha) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) (mana ficha)  (defesa ficha) ((stamina ficha) - qtd) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)

  damage ficha dano = if (dano > (armadura ficha)) then 
      Ficha ((vida ficha) - (dano - (armadura ficha))) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) (mana ficha) (defesa ficha) (stamina ficha) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)
    else ficha

  reset :: Ficha -> String -> Ficha
  reset ficha classe = if classe == "Guerreiro" then Ficha (30) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) (mana ficha) (defesa ficha) (100) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)
    else Ficha (30) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) (100) (defesa ficha) (stamina ficha) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)