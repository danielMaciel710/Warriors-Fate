module Lib
    ( strip
    , lowerCase
    ) where

import Data.Char
import qualified Data.Text as T

strip :: String -> String
strip  = T.unpack . T.strip . T.pack

lowerCase :: String -> String
lowerCase = map toLower