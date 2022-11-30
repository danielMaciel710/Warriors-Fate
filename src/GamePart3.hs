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
import Terminal
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)

-- retorna as dimensões do terminal em uma tupla
terminalSize = unsafeDupablePerformIO Terminal.getTermSize
height = fst terminalSize -- pega a altura do terminal
width = snd terminalSize -- pega a largura do terminal

part3 = do
  putStrLn (centerTextHeight2 "Com uma quantidade de força considerável, você abre o portão e se depara com um grande receptáculo que parecia guardar uma chama intensa, três cavaleiros estavam a frente desse receptáculo, estes que não pareciam humanos, pois suas armaduras e pele eram como sombras. Atrás desse grande receptáculo que ardia em chamas, um ser estava sentado num pequeno monte. Ele olhava tranquilo e imponente enquanto permanecia sentado, sua aparência era como de um dragão num corpo de humano, era verde escuro, suas escamas brilhavam refletindo as chamas.\nEntão os 3 cavaleiros vão em sua direção, prepare-se!" height2)
  continuar
  batalhaPart3

  putStrLn (centerText "???: Ha ha ha!" height width) 
  continuar
  putStrLn (centerText "???: Você foi bem, pequeno humano" height width) 
  continuar
  putStrLn (centerText "???: A partir daqui a jornada ficará cada vez mais difícil" height width) 
  continuar
  putStrLn (centerText "???: Seu destino irá mudar, poderá sair daqui com a benção divina ou com a maldição dos demônios" height width) 
  continuar
  putStrLn (centerText "???: No final, você escolherá seu destino, então siga em frente" height width) 
  continuar
  putStrLn (centerText "???: O verdadeiro desafio começa agora!" height width) 
  continuar

  putStrLn (centerText "Continua..." height width) 

batalhaPart3 = putStrLn (centerText "Uma grande batalha está sendo travada!" height width)
