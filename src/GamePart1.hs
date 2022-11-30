module GamePart1
    (
      part1
    )
where

import Lib
import System.IO
import System.Directory
import qualified Models.Hero as H
import Models.Ficha
import Eventos
import System.IO
import System.IO.Unsafe (unsafeDupablePerformIO)

part1 perigo nome = do
  putStrLn (formataText "\nAo por os pés dentro da mesma, rapidamente um clarão forte te atinge e uma paisagem é formada instantaneamente. Com o céu num puro azul, um horizonte sem fim à sua frente, uma montanha majestosa com um grande castelo à sua esquerda. Ao olhar para trás, avistando o sol a nascer, iluminando, dando um brilho as águas da cachoeira que estava próxima, era possível avistar um arco íris e ouvir o balançar das folhas das árvores fortes que continham belos frutos. Um imenso felino permanecia calmo, mas em alerta no meio desse cenário.\nFlutuando, rapidamente mas suavemente o ápice da noite simplesmente aparece na na sua frente, como se toda a natureza ali presente repousa-se para observar o mar de estrelas. E ao olhar você se depara com incontáveis brilhando como você nunca tinha visto antes.\nEntão tudo escureceu… E uma luz aparece um pouco distante." )
  continuar
  putStrLn (formataText "Ao andar pela escuridão em direção a luz, algumas tochas se ascendem, revelando o local. O cenário era como uma caverna típica, porém havia um grande abismo a esquerda um caminho pela frente e um caminho a direita. A luz que te guiou foi em direção ao caminho a sua frente." )
  putStrLn "Ir em frente, direita ou esqueda?"
  acao <- getLine
  eventos acao perigo nome
