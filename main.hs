module Main (main) where

import Lexer
import Parser
import Data.Maybe
import TypeCheck
import CodeGen

main = do
    s <- getContents ;
    let st = (buildSymbolTable [] (getInstr (maliceParser (alexScanTokens s))))
--    putStr (show (getInstr (maliceParser (alexScanTokens s))))
    putStr  (codeGen (getInstr (maliceParser (alexScanTokens s))) [] )
--    putStr (addNl "Hello World\\n")
