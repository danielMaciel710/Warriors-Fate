module Models.Hero where 
  import Models.Ficha

  data Hero = Hero {
    nome :: String,
    classe :: String,
    ficha :: Ficha
    
  } deriving (Show, Read)