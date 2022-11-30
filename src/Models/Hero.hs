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

  danoConcentrado :: Hero -> Int
  danoConcentrado hero = Models.Ficha.danoConcentrado (ficha hero) (classe hero)

  danoArea :: Hero -> Int
  danoArea hero = Models.Ficha.danoArea (ficha hero) (classe hero)

  cura :: Hero -> Hero
  cura hero = Hero (nome hero) (classe hero) (Models.Ficha.cura (ficha hero) (classe hero))

  getMana :: Hero -> Int
  getMana hero = Models.Ficha.getMana (ficha hero)

  getStamina :: Hero -> Int
  getStamina hero = Models.Ficha.getStamina (ficha hero)

  usarHabilidade :: Hero -> Int -> Ficha
  usarHabilidade hero qtd = Models.Ficha.usarHabilidade (ficha hero) qtd (classe hero)