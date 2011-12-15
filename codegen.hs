module CodeGen where

import Data.List
import Parser


register :: Int -> String
register 0 = "eax"
register 1 = "ebx"
register 2 = "ecx"
register 3 = "edx"
register 4 = "esi"
register 5 = "edi"
register _ = error "Register access out of bounds"

header :: String
header = "; MAlice program for Intel architecture\n"
         ++ "section .text\n"
         ++ "\n"

strings :: String
strings = "Literal strings from symbol table go here\n"

codeGen :: [Statement] -> String -> String
codeGen [] p     = header ++ p ++ strings
codeGen (s:ss) p = codeGen ss (p ++ (codeGenS s))


codeGenS :: Statement -> String
codeGenS (Assign s t)           = "mov eax, ebx\n" 
codeGenS (Declare s v)          = "test\n"
codeGenS (Decr s)               = ""
codeGenS (Incr s)               = ""
codeGenS (Return s)             = ""
codeGenS (Print s)              = ""
codeGenS (ReadIn s)             = ""
codeGenS (Conditional c)        = ""
codeGenS (WhileNot b stats)     = ""
codeGenS (Function t s p stats) = ""
codeGenS (DeclareArray e t s)   = ""
codeGenS (ArraySetElem s e e')  = ""
codeGenS (Skip)                 = ""
codeGenS (LExp e)               = ""

codeGenE :: Exp -> String
codeGenE (UnOpr c e)            = ""
codeGenE (BinOpr c e e')        = ""
codeGenE (DBinOpr s e e')       = ""
codeGenE (Int i)                = ""
codeGenE (Char c)               = ""
codeGenE (String s)             = ""
codeGenE (Var s)                = ""
codeGenE (ArrayGetElem s e)     = ""
codeGenE (Call s params)        = ""
codeGenE (SizeOfArray s)        = ""


