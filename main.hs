module Main (main) where

import Lexer
import Parser
import Data.Maybe

main = do
    s <- getContents
--  print (maliceParser (alexScanTokens s))
    print (buildSymbolTable [] (getInstr (maliceParser (alexScanTokens s))))


------------------------------ Symbol Table ------------------------------------

type SymbolTableEntry = (String, (MType, Exp))
type SymbolTable = [SymbolTableEntry]

getInstr :: AST -> [Statement]
getInstr (Program p) = p

updateSymbolTable :: SymbolTable -> SymbolTableEntry -> SymbolTable
updateSymbolTable []     newEntry  = error "Should never be the case"
updateSymbolTable (x:xs) newEntry  =
    if fst x == fst newEntry
    then newEntry:xs
    else updateSymbolTable xs newEntry

buildSymbolTable :: SymbolTable -> [Statement] -> SymbolTable
buildSymbolTable currentST []                             = currentST
buildSymbolTable currentST ((Assign name val):statements) =
    if lookup name currentST == Nothing
	then error ("Oh No! You can't go using " ++ name ++ 
                " without telling me what it is first!")
    else buildSymbolTable (updateSymbolTable currentST
                     (name, ((fst (fromJust (lookup name currentST))), val)))
                     statements
buildSymbolTable currentST ((Declare typ name):statements) =
    if lookup name currentST == Nothing
    then buildSymbolTable ((name, (typ, Int 0)):currentST) statements
	else error ("Oh No! You already told me what " ++ name ++ " is!")
buildSymbolTable currentST x = currentST

--------------------------------------------------------------------------------


