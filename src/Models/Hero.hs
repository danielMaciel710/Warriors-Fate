module Models.Hero where 
  import Models.Ficha

  data Hero = Hero {
    nome :: String,
    classe :: String,
    ficha :: Ficha

  } deriving (Show, Read)

  getNome :: Hero -> String
  getNome hero = nome hero

  getClasse :: Hero -> String
  getClasse hero = classe hero

  getFicha :: Hero -> Ficha
  getFicha hero = ficha hero

  getVida :: Hero -> Int
  getVida hero = Models.Ficha.getVida (ficha hero)

  getForca :: Hero -> Int
  getForca hero = Models.Ficha.getForca (ficha hero)

  getInteligencia :: Hero -> Int
  getInteligencia hero = Models.Ficha.getInteligencia (ficha hero)
  
  updateFicha :: Hero -> Ficha -> Hero
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

  reset :: Hero -> Hero
  reset hero = Hero (nome hero) (classe hero) (Models.Ficha.reset (ficha hero) (classe hero))