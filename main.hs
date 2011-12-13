module Main (main) where

import Lexer
import Parser
import Data.Maybe
import TypeCheck
import CodeGen

main = do
    s <- getContents
    --print (maliceParser (alexScanTokens s))
    print (buildSymbolTable [] (getInstr (maliceParser (alexScanTokens s))))
