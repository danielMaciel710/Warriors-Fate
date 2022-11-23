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
    acerto:: Int,
    experiencia:: Int,
    armadura:: Int,
    arma:: (String, Int, Int, Float),
    pocao:: Int
  } deriving (Show, Read)