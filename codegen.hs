module CodeGen where

import Data.List
import Parser
import Data.Char

data Register
    = R0 | R1 | R2 | R3 | R4 | R5
    deriving(Eq,Show)

register :: Register -> String
register R0 = "eax"
register R1 = "ebx"
register R2 = "ecx"
register R3 = "edx"
register R4 = "esi"
register R5 = "edi"
register _  = error "Register access out of bounds"

registers :: [Register]
registers = [R0,R1,R2,R3,R4,R5]

saveRegs :: [Register] -> String
saveRegs regsNotInUse = concat ["push " ++ (register x) ++ "\n" | x <- registers \\ regsNotInUse]

restoreRegs :: [Register] -> String
restoreRegs regsNotInUse = concat ["pop " ++ (register x) ++ "\n" | x <- reverse (registers \\ regsNotInUse)]

stringTable :: [Statement] -> [(String,String)] -> [(String,String)]
--Stringtable needs some way of having identifiers
stringTable [] x     = x
stringTable (Print (String s):ss) x = stringTable ss ((s,s):x)
stringTable (s:ss) x = stringTable ss x

header :: String
header = "; MAlice program for NASM on i386 Linux\n"
         ++ "extern printf\n"
         ++ "section .text\n"
         ++ "global _start\n"   --Entry point
         ++ "_start:\n"
         ++ "push ebp\n"        --Push stack frame
         ++ "mov ebp,esp\n"

footer :: String
footer = "mov esp,ebp\n"        --Pop stack frame
         ++ "pop ebp\n"
         ++ "mov ebx,0\n"
         ++ "mov eax,1\n"       --Exit status and linux system call
         ++ "int 0x80\n"

strings :: [Statement] -> String
strings s = "section .data\n"  ++ concat ["msg\tdb\t\"" ++ x ++ "\"\n"| (x,y) <- str] ++ "\nlen equ $ - msg"
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
codeGen x y = codeGen' x x reg y
  where
    codeGen' :: [Statement] -> [Statement] -> [Register] -> String -> String
    codeGen' [] s' r p     = header ++ p ++ footer ++ (strings s')
    codeGen' (s:ss) s' r p = codeGen' ss s' r (p ++ (codeGenS s r))
    reg = registers

codeGenJustStats :: [Statement] -> [Register] -> String -> String
codeGenJustStats [] r p     = p
codeGenJustStats (s:ss) r p = codeGenJustStats ss r (p ++ (codeGenS s r))

codeGenS :: Statement -> [Register] -> String
codeGenS (Assign s e) (r:rs)             = "\npush a\n" ++ (codeGenE e rs) ++ "\npop a\n"
codeGenS (Declare s v) (r:rs)            = ""
codeGenS (Decr s) (r:rs)                 = "dec r\n"
codeGenS (Incr s) (r:rs)                 = "inc r\n"
codeGenS (Return s) (r:rs)               = "\n   ret"
codeGenS (Print s) (r:r':r'':r''':rs)    = "mov edx,len\nmov ecx,msg\nmov ebx,1\nmov eax,4\nint 0x80\n"
codeGenS (ReadIn s) (r:rs)               = ""
codeGenS (Conditional c) (r:rs)          = ""
codeGenS (WhileNot b stats) (r:rs)       = ""
codeGenS (Function t s p stats) (r:rs)   = saveRegs [] ++ codeGenFunc (Function t s p stats) (r:rs) ++ restoreRegs []
codeGenS (DeclareArray e t s) (r:rs)     = ""
codeGenS (ArraySetElem s e e') (r:rs)    = ""
codeGenS (Skip) (r:rs)                   = ""
codeGenS (LExp e) (r:rs)                 = ""

codeGenE :: Exp -> [Register] -> String
codeGenE (UnOpr c e) (r:rs)              = ""
codeGenE (BinOpr '=' e e') (r:r':rs)     = "mov " ++ register r ++ "," ++ codeGenE e rs ++ "mov ebx," ++ codeGenE e' rs ++ "cmp eax, ebx\njne ret\n" 
codeGenE (BinOpr '<' e e') (r:r':rs)     = "mov eax," ++ codeGenE e rs ++ "mov ebx," ++ codeGenE e' rs ++ "cmp eax, ebx\njge ret\n" 
codeGenE (BinOpr '>' e e') (r:r':rs)     = "mov eax," ++ codeGenE e rs ++ "mov ebx," ++ codeGenE e' rs ++ "cmp eax, ebx\njle ret\n" 
codeGenE (BinOpr '+' e e') (r:r':rs)     = "mov eax," ++ codeGenE e rs ++ "mov ebx," ++ codeGenE e' rs ++ "add eax, ebx\n" 
codeGenE (BinOpr '-' e e') (r:r':rs)     = "mov eax," ++ codeGenE e rs ++ "mov ebx," ++ codeGenE e' rs ++ "sub eax, ebx\n" 
codeGenE (BinOpr '*' e e') (r:r':rs)     = "mov eax," ++ codeGenE e rs ++ "mov ebx," ++ codeGenE e' rs ++ "mul eax, ebx\n" 
codeGenE (BinOpr '/' e e') (r:r':rs)     = "mov eax," ++ codeGenE e rs ++ "mov ebx," ++ codeGenE e' rs ++ "div eax, ebx\n" 
codeGenE (BinOpr c e e') (r:rs)          = ""
codeGenE (DBinOpr s e e') (r:rs)         = ""
codeGenE (Int i) (r:rs)                  = " $" ++ show i ++ "\n"
codeGenE (Char c) (r:rs)                 = " $" ++ show c ++ "\n"
codeGenE (String s) (r:rs)               = ""
codeGenE (Var s) (r:rs)                  = ""
codeGenE (ArrayGetElem s e) (r:rs)       = ""
codeGenE (Call s params) (r:rs)          = saveRegs [] ++ "call " ++ s ++ "\n"
codeGenE (SizeOfArray s) (r:rs)          = ""

codeGenFunc :: Statement -> [Register] -> String
codeGenFunc (Function t s p stats) (r:rs) = s ++ ":\n" ++ codeGenJustStats stats (r:rs) [] ++ "\n"

codeGenWhile :: Statement -> [Register] -> String
codeGenWhile (WhileNot b stats) (r:rs)  = ""

codeGenB :: BoolExpr -> [Register] -> String
codeGenB (Bool b) (r:rs)                = ""
codeGenB (SBoolExpr e) (r:rs)           = ""
codeGenB (DBoolExpr e o e') (r:rs)      = ""
codeGenB (CBoolExpr b o b') (r:rs)      = ""


fParams :: [Exp] -> [Register] -> String -> String
fParams [] r s     = s
fParams (p:pp) r s = fParams pp r ((codeGenE p r) ++ s)
