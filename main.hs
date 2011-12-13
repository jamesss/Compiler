module Main (main) where

import Lexer
import Parser
import Data.Maybe

main = do
    s <- getContents
--  print (maliceParser (alexScanTokens s))
    print (buildSymbolTable [] (getInstr (maliceParser (alexScanTokens s))))


------------------------------ Symbol Table ------------------------------------

type SymbolTableEntry = (String,MType)
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
--    else buildSymbolTable (updateSymbolTable currentST
--                     (name, ((fst (fromJust (lookup name currentST))))))
--                     statements
    else (
            if checkType val (fromJust (lookup name currentST))
            then buildSymbolTable currentST statements
            else error "Type error!"
         )
buildSymbolTable currentST ((Declare typ name):statements) =
    if lookup name currentST == Nothing
    then buildSymbolTable ((name, typ):currentST) statements
	else error ("Oh No! You already told me what " ++ name ++ " is!")
buildSymbolTable currentST (x:xs) = buildSymbolTable currentST xs


checkType :: Exp -> MType -> Bool
checkType (Int x) MNum       = True
checkType (Char x) MLett     = True
checkType (String x) MSent   = True
checkType _ _                = False
--------------------------------------------------------------------------------


