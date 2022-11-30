module GamePart3
    (
      part3
    )
where

import Lib
import System.IO
import System.Directory
import qualified Models.Hero as H
import Models.Ficha
import System.IO

part3 = do
  putStrLn (formataText "Com uma quantidade de força considerável, você abre o portão e se depara com um grande receptáculo que parecia guardar uma chama intensa, três cavaleiros estavam a frente desse receptáculo, estes que não pareciam humanos, pois suas armaduras e pele eram como sombras. Atrás desse grande receptáculo que ardia em chamas, um ser estava sentado num pequeno monte. Ele olhava tranquilo e imponente enquanto permanecia sentado, sua aparência era como de um dragão num corpo de humano, era verde escuro, suas escamas brilhavam refletindo as chamas.\nEntão os 3 cavaleiros vão em sua direção, prepare-se!")
  continuar
  batalhaPart3
  putStrLn (formataText "???: Ha ha ha!"  ) 
  continuar
  putStrLn (formataText "???: Você foi bem, pequeno humano"  ) 
  continuar
  putStrLn (formataText "???: A partir daqui a jornada ficará cada vez mais difícil"  ) 
  continuar
  putStrLn (formataText "???: Seu destino irá mudar, poderá sair daqui com a benção divina ou com a maldição dos demônios"  ) 
  continuar
  putStrLn (formataText "???: No final, você escolherá seu destino, então siga em frente"  ) 
  continuar
  putStrLn (formataText "???: O verdadeiro desafio começa agora!"  ) 
  continuar
  putStrLn (formataText "Continua..."  ) 

batalhaPart3 = putStrLn (formataText "Uma grande batalha está sendo travada!"  )
