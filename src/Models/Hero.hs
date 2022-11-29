module Models.Hero where 
  import Models.Ficha

  data Hero = Hero {
    nome :: String,
    classe :: String,
    ficha :: Ficha
    
  } deriving (Show, Read)
  getNome hero = nome hero
  getClasse hero = classe hero
  getFicha hero = ficha hero