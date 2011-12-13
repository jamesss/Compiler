module CodeGen where

import Parser
import TypeCheck


registerName :: Int -> String
registerName 0 = "eax"
registerName 1 = "ebx"
registerName 2 = "ecx"
registerName 3 = "edx"
registerName 4 = "esi"
registerName 5 = "edi"
registerName r = error ("Error: Register index too high ("
                        ++ show r ++ "). This really should not happen...")

codegen :: Program -> String
codegen Program p = generateForEach p

generateForEach :: [Statement] -> [Reg] -> String
generateForEach [] availableReg = ""
generateForEach x:xs availableReg =  "push ebp\n"
                     ++ "mov ebp, esp\n"
                     ++ (generatefor x)
                     ++ (generateForEach xs)
                     ++ "pop ebp"
                     ++ "ret"
