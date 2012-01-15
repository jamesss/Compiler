module CodeGen where

import Data.List
import Parser
import Data.Char

data Register
    = R0 | R1 | R2 | R3 | R4 | R5
    deriving(Eq,Show)

type VTab = [String]
type STab = [(Int,String)]

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

stringTable :: [Statement] -> [Int] -> [(Int,String)] -> [(Int,String)]
--Stringtable needs some way of having identifiers
stringTable [] n x     = x
stringTable (Print (String s):ss) (n:ns) x = stringTable ss ns ((n,s):x)
stringTable (s:ss) n x = stringTable ss n x

sLookUp :: STab -> String -> Int
sLookUp tab str = head [ i | (i,s) <- tab, s == str ]

vLookUp :: VTab -> String -> String
--all this does is verify that the var exists in the vt
vLookUp tab str = head [ i | i <- tab, i == str ]

varTable :: [Statement] -> [String] -> [String]
varTable [] x = x
varTable ((Declare t s):ss) x = varTable ss  (s:x)
varTable (s:ss) x = varTable ss x

header :: String
header = "extern printf\n"
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

vars :: [Statement] -> String
vars s = "section .bss\n" ++ "buffer\tresb\t1024\n" ++ concat [x ++ "\tresb\t4\n" | x <- var]
    where
        var = varTable s []

strings :: [Statement] -> String
strings s = "section .data\n"  ++ concat ["string" ++ (show x) ++ "\tdb\t\"" ++ (addNl y) ++ "\"\nlen" ++ (show x) ++ " equ $ - string" ++ (show x) ++ "\n" | (x,y) <- str]
  where
    str = stringTable s n []
    n = [1..100]

escapeS :: String -> String
escapeS s = "\"" ++ escapeS' s ++ "\",0"
  where
    escapeS' [] = []
    escapeS' (c:s')
      | c `elem` escaped = "\"," ++ show (ord c) ++ ",\"" ++ escapeS' s'
      | otherwise             = (c:escapeS' s')
    escaped = "\0\a\b\f\n\r\t\v\"\&\\\'"

addNl :: String -> String
addNl [] = []
addNl (s:s':s'':ss)
    | s == '\\' && s' == '\\' && s'' == 'n' = "\",0xa,\"" ++ (addNl ss)
    | s == '\\' && s' == 'n' = "\",0xa,\"" ++ (addNl (s'':ss))
    | otherwise = (s:(addNl (s':s'':ss)))
addNl s  = s

codeGen :: [Statement] -> String -> String
codeGen x y = codeGen' x x reg vt st y
  where
    codeGen' :: [Statement] -> [Statement] -> [Register] -> VTab -> STab -> String -> String
    codeGen' [] s' r v st p     = vars s' ++ header ++  p ++ footer ++ (strings s')
    codeGen' (s:ss) s' r v st p = codeGen' ss s' r v st (p ++ (codeGenS s r vt st))
    reg = registers
    vt = varTable x [] 
    st = stringTable x n []
    n = [1..100]

codeGenJustStats :: [Statement] -> [Register] -> String -> String
codeGenJustStats [] r p     = p
codeGenJustStats (s:ss) r p = codeGenJustStats ss r (p ++ (codeGenS s r [] []))

codeGenS :: Statement -> [Register] -> VTab -> STab -> String
codeGenS (Assign s e) (r:rs) vt st            = "push " ++ register r ++ "\n mov " ++ register r ++ "," ++ (codeGenE e rs) ++ "\n"
codeGenS (Declare s v) (r:rs) vt st           = "" -- vars are implicitly declared in .bss
codeGenS (Decr s) (r:rs) vt st                = "dec" ++ vLookUp vt s ++ "\n"
codeGenS (Incr s) (r:rs) vt st                = "inc" ++ vLookUp vt s ++ "\n"
codeGenS (Return s) (r:rs) vt st              = "ret \n"
codeGenS (Print (String s)) (r:r':r'':r''':rs) vt st   = "mov edx,len" ++ show (sLookUp st s) ++ "\nmov ecx,string" ++ show (sLookUp st s) ++ "\nmov ebx,1\nmov eax,4\nint 0x80\n"
codeGenS (Print s) (r:rs) vt st               = ""
codeGenS (ReadIn s) (r:rs) vt st              = "mov edx,1023\nmov ecx,buffer\nmov ebx,0\nmov eax,4\nint 0x80\n"
codeGenS (Conditional c) (r:rs) vt st         = saveRegs (r:rs) ++ codeGenCond c (r:rs) vt st
codeGenS (WhileNot b stats) (r:rs) vt st      = ""
codeGenS (Function t s p stats) (r:rs) vt st  = saveRegs (r:rs) ++ codeGenFunc (Function t s p stats) (r:rs) ++ restoreRegs (r:rs)
codeGenS (DeclareArray e t s) (r:rs) vt st    = "" -- vars are implicitly declared in .bss
codeGenS (ArraySetElem s e e') (r:rs) vt st   = ""
codeGenS (Skip) (r:rs) vt st                  = "" --Skip is a dummy instruction for comments
codeGenS (LExp e) (r:rs) vt st                = ""

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
codeGenE (Int i) (r:rs)                  = show i ++ "\n"
codeGenE (Char c) (r:rs)                 = show c ++ "\n"
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

codeGenCond :: Conditional -> [Register] -> VTab -> STab -> String
codeGenCond (If b s) (r:rs) vt st         = "push " ++ register r ++ "cond:\n"
codeGenCond (IfE b s c) (r:rs) vt st      = ""
codeGenCond (ElseIf b s) (r:rs) vt st     = ""
codeGenCond (ElseIfE b s c) (r:rs) vt st  = ""
codeGenCond (Else s) (r:rs) vt st         = ""
