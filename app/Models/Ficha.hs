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
    acerto:: Int
  } deriving (Show, Read)