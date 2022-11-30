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
  getVida hero = Models.Ficha.getVida (ficha hero)
  getForca hero = Models.Ficha.getForca (ficha hero)
  getInteligencia hero = Models.Ficha.getInteligencia (ficha hero)
  
  updateFicha hero ficha = Hero (nome hero) (classe hero) ficha
  
  ataqueFisico :: Hero -> Int
  ataqueFisico hero = Models.Hero.getForca hero + Models.Ficha.getArmaDanoFisico (ficha hero)

  ataqueMagico :: Hero -> Int
  ataqueMagico hero = Models.Hero.getInteligencia hero + Models.Ficha.getArmaDanoMagico (ficha hero)