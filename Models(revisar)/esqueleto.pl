vidaEsqueleto(50). %?
armaduraEsqueleto(5).

/*
module Models.Esqueleto where 

  data Esqueleto = Esqueleto {
    vida :: Int,  
    armadura:: Int
  } deriving (Show, Read)
  darDano :: Int
  darDano = 25

  enrijecer esqueleto = if armadura esqueleto < 10 then Esqueleto (vida esqueleto) ((armadura esqueleto) * 2)
    else esqueleto

  damage esqueleto dano = if (dano > (armadura esqueleto)) then 
      Esqueleto ((vida esqueleto) - (dano - (armadura esqueleto))) (armadura esqueleto)
    else esqueleto

  reset = Esqueleto 50 5