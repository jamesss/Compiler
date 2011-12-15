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
codeGenS (Declare s t) = "mov" 
codeGenS (Assign s v) = "test"
