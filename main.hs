module Main (main) where

import Lexer
import Parser

main = do
    s <- getContents
    print (maliceParser (alexScanTokens s))
