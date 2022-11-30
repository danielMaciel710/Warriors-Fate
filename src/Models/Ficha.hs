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
  getVida ficha = vida ficha

  getForca :: Ficha -> Int
  getForca ficha = forca ficha
  
  getInteligencia :: Ficha -> Int
  getInteligencia ficha = inteligencia ficha

  getArmaDanoFisico :: Ficha -> Int
  getArmaDanoFisico ficha = read ((arma ficha) !!1) :: Int

  getArmaDanoMagico :: Ficha -> Int
  getArmaDanoMagico ficha = read ((arma ficha) !!2) :: Int

  damage ficha dano = if (dano > (armadura ficha)) then 
      Ficha ((vida ficha) - (dano - (armadura ficha))) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) (mana ficha) (defesa ficha) (stamina ficha) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)
    else ficha