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
    arma:: (String, Int, Int),
    pocao:: Int
  } deriving (Show, Read)
  damage ficha dano = if (dano > (armadura ficha)) then 
      Ficha ((vida ficha) - (dano - (armadura ficha))) (forca ficha) (destreza ficha) (constituicao ficha) (inteligencia ficha) (mana ficha) (defesa ficha) (stamina ficha) (experiencia ficha) (armadura ficha) (arma ficha) (pocao ficha)
    else ficha