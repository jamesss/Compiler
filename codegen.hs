module CodeGen where

import Data.List
import Parser
import Data.Char

register :: Int -> String
register 0 = "eax"
register 1 = "ebx"
register 2 = "ecx"
register 3 = "edx"
register 4 = "esi"
register 5 = "edi"
register _ = error "Register access out of bounds"

registers :: [Int]
registers = [0,1,2,3,4,5]

saveRegs :: [Int] -> String
saveRegs regsNotInUse = concat ["push " ++ (register x) ++ "\n" | x <- registers \\ regsNotInUse]

restoreRegs :: [Int] -> String
restoreRegs regsNotInUse = concat ["pop " ++ (register x) ++ "\n" | x <- reverse (registers \\ regsNotInUse)]

stringTable :: [Statement] -> [(String,String)] -> [(String,String)]
--Stringtable needs some way of having identifiers
stringTable [] x     = x
stringTable (Print (String s):ss) x = stringTable ss ((s,s):x)
stringTable (s:ss) x = stringTable ss x

header :: String
header = "; MAlice program for Intel architecture\n\n"
         ++ "section .text\n"
         ++ "\n"

strings :: [Statement] -> String
strings s = concat [".data db \"" ++ escapeS x ++ "\"\n"| (x,y) <- str]
  where
    str = stringTable s []

escapeS :: String -> String
escapeS s = "\"" ++ escapeS' s ++ "\",0"
  where
    escapeS' [] = []
    escapeS' (c : s')
      | c `elem` escapedChars = "\"," ++ show (ord c) ++ ",\"" ++ escapeS' s'
      | otherwise             = c : escapeS' s'
    escapedChars = "\0\a\b\f\n\r\t\v\"\&\'\\"


codeGen :: [Statement] -> String -> String
codeGen x y = codeGen' x x y
  where
    codeGen' :: [Statement] -> [Statement] -> String -> String
    codeGen' [] s' p     = header ++ p ++ (strings s')
    codeGen' (s:ss) s' p = codeGen' ss s' (p ++ (codeGenS s))

codeGenJustStats :: [Statement] -> String -> String
codeGenJustStats [] p     = p
codeGenJustStats (s:ss) p = codeGenJustStats ss (p ++ (codeGenS s))

codeGenS :: Statement -> String
codeGenS (Assign s e)           = "\npush a\n" ++ (codeGenE e) ++ "\npop a\n"
codeGenS (Declare s v)          = ""
codeGenS (Decr s)               = "sub $1 "
codeGenS (Incr s)               = "add $1, "
codeGenS (Return s)             = "\n   ret"
codeGenS (Print s)              = ""
codeGenS (ReadIn s)             = ""
codeGenS (Conditional c)        = ""
codeGenS (WhileNot b stats)     = ""
codeGenS (Function t s p stats) = saveRegs [0] ++ codeGenFunc (Function t s p stats) ++ restoreRegs [0]
codeGenS (DeclareArray e t s)   = ""
codeGenS (ArraySetElem s e e')  = ""
codeGenS (Skip)                 = ""
codeGenS (LExp e)               = ""

codeGenE :: Exp -> String
codeGenE (UnOpr c e)            = ""
codeGenE (BinOpr '=' e e')    = "\nmov eax," ++ codeGenE e ++ "mov ebx," ++ codeGenE e' ++ "cmp eax, ebx\njne ret" 
codeGenE (BinOpr '<' e e')      = "\nmov eax," ++ codeGenE e ++ "mov ebx," ++ codeGenE e' ++ "cmp eax, ebx\njge ret" 
codeGenE (BinOpr '>' e e')      = "\nmov eax," ++ codeGenE e ++ "mov ebx," ++ codeGenE e' ++ "cmp eax, ebx\njle ret" 
codeGenE (BinOpr '+' e e')      = "\npush ebx\nmov eax," ++ codeGenE e ++ "mov ebx," ++ codeGenE e' ++ "add eax, ebx" 
codeGenE (BinOpr '-' e e')      = "\npush ebx\nmov eax," ++ codeGenE e ++ "mov ebx," ++ codeGenE e' ++ "sub eax, ebx" 
codeGenE (BinOpr '*' e e')      = "\npush ebx\nmov eax," ++ codeGenE e ++ "mov ebx," ++ codeGenE e' ++ "mul eax, ebx" 
codeGenE (BinOpr '/' e e')      = "\npush ebx\nmov eax," ++ codeGenE e ++ "mov ebx," ++ codeGenE e' ++ "div eax, ebx" 
codeGenE (BinOpr c e e')        = ""
codeGenE (DBinOpr s e e')       = ""
codeGenE (Int i)                = " $" ++ show i ++ "\n"
codeGenE (Char c)               = " $" ++ show c ++ "\n"
codeGenE (String s)             = ""
codeGenE (Var s)                = ""
codeGenE (ArrayGetElem s e)     = ""
codeGenE (Call s params)        = saveRegs [0] ++ "call " ++ s ++ "\n"
codeGenE (SizeOfArray s)        = ""

codeGenFunc :: Statement -> String
codeGenFunc (Function t s p stats) = s ++ ":\n" ++ codeGenJustStats stats [] ++ "\n"

codeGenWhile :: Statement -> String
codeGenWhile (WhileNot b stats) = ""

codeGenB :: BoolExpr -> String
codeGenB (Bool b)               = ""
codeGenB (SBoolExpr e)          = ""
codeGenB (DBoolExpr e o e')     = ""
codeGenB (CBoolExpr b o b')     = ""


fParams :: [Exp] -> String -> String
fParams [] s     = s
fParams (p:pp) s = fParams pp ((codeGenE p) ++ s)
