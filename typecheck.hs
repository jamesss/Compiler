module TypeCheck where
import Lexer
import Parser
import Data.Maybe

type SymbolTableEntry = (String, MType)
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
    if invar == Nothing
    then error ("Oh No! You can't go using " ++ name ++ 
                " without telling me what it is first!")
    else if checkType val (fromJust invar)
         then buildSymbolTable currentST statements
         else error "Type error!"
    where
        invar = lookup name currentST
buildSymbolTable currentST ((Declare typ name):statements) =
    if lookup name currentST == Nothing
    then buildSymbolTable ((name, typ):currentST) statements
    else error ("Oh No! You already told me what " ++ name ++ " is!")
buildSymbolTable currentST ((Function typ name params body):statements) =
    if lookup name currentST /= Nothing
    then error "Duplicate method declaration"
    else if goodReturnType body params typ
         then buildSymbolTable ((name, typ):currentST) statements
         else error ("Return type mismatch in function " ++ name)
buildSymbolTable currentST (x:xs) = buildSymbolTable currentST xs

goodReturnType :: [Statement] -> SymbolTable -> MType -> Bool
goodReturnType [] params typ = error "The function is missing a return statement"
goodReturnType [Return (Var name)] params typ = fromJust (lookup name params) == typ
goodReturnType [Return exp] params typ = checkType exp typ
goodReturnType (x:xs) params typ = goodReturnType xs params typ

checkType :: Exp -> MType -> Bool
checkType (Int x) MNum     = True
checkType (Char x) MLett   = True
checkType (String x) MSent = True
checkType _ _              = False
