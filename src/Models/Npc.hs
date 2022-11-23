module Models.Npc where 
  import Models.Ficha

  data Npc = Npc {
    nome :: String,
    classe :: String,
    ficha :: Ficha
    
  } deriving (Show, Read)