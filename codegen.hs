module CodeGen where

import Data.List
import Parser

-------------------------------------------Codegen-----------------------------

transStatement :: Statement -> [Instr]

transStatement (Assign name exp)
    = (transExp exp (allRegs \\ [paramReg]))


saveRegs :: [Register] -> [Instr]
saveRegs regsNotInUse
    = [Mov (Reg r) Push | r <- allRegs \\ regsNotInUse] 


restoreRegs :: [Register] -> [Instr]
restoreRegs regsNotInUse
    = [Mov Pop (Reg r) | r <- reverse (allRegs \\ regsNotInUse)]


transExp :: Exp -> [Register] -> [Instr]
transExp (Int x)       (dst:rest) = [Mov (ImmNum x)(Reg dst)]
transExp (Var paramname) (dst:rest) = [Mov (Reg paramReg)(Reg dst)]
--transExp (Minus e1 e2)   (dst:next:rest)
--    = if weight e1 > weight e2
--      then
--          transExp e1 (dst:next:rest)
--          ++ transExp e2 (next:rest)
--          ++ [Sub (Reg next) (Reg dst)]
--      else
--          transExp e2 (dst:next:rest)
--          ++ transExp e1 (next:rest)
--          ++ [Sub (Reg dst) (Reg next)]
--transExp (Apply name exp) (dst:rest)
--    = saveRegs (dst:rest)
--      ++ transExp exp (dst:rest)
--      ++ [Mov (Reg dst) (Reg paramReg)]
--      ++ [Jsr name]
--      ++ (if dst /= resultReg then [Mov (Reg resultReg) (Reg dst)] else [])
--      ++ restoreRegs (dst:rest)


weight :: Exp -> Int
weight (Int x) = 1
weight (Var x)   = 1
--weight (Minus e1 e2) = min cost1 cost2
--    where
--        cost1 = max (weight e1) ((weight e2) + 1)
--        cost2 = max ((weight e1) + 1) (weight e2)
--weight (Apply name exp) = 1 + weight exp

-------------------------------------------Emulator-----------------------------

--            registers, a7, mem, symbols, compare
type State = ([Int], Int, [Int], [Symbol], Int)

--             name, size, address
type Symbol = (String, Int, Int)

initialState :: Int -> State
initialState argValue 
  = (initialRegs, memSize-1, allocMem [] memSize, [], 0)
    where
    initialRegs = setVal zeroRegs (regToRegNumber paramReg) argValue
    zeroRegs = [0 | r <- allRegs]
    memSize = 128



interpret instrs argValue = exec instrs instrs (initialState argValue)

exec :: [Instr] -> [Instr] -> State -> State

exec prog [] state = state
exec prog (Halt:is) state = state

exec prog (Comm name size:is) state = 
  let
    (dn, a7, mem, syms, cmp) = state
    syms' = ((name, size `div` 4, length mem):syms)
    mem' = allocMem mem (size `div` 4)
    state' = (dn, a7, mem', syms', cmp)
  in
    exec prog is state'


exec prog (Cmp op1 op2:is) state = 
  let
    (op1v, state') = getOpVal op1 state
    (op2v, state'') = getOpVal op2 state'
    (dn, a7, mem, syms, cmp) = state''
    cmp' = op1v-op2v
    state''' = (dn, a7, mem, syms, cmp')
  in
    exec prog is state'''

exec prog (Mov op1 op2:is) state = 
  let
    (op1v, state') = getOpVal op1 state
    state'' = setOpVal op2 op1v state'
  in
    exec prog is state''

exec prog (Add op1 op2:is) state = 
  let
    (op1v, state') = getOpVal op1 state
    (op2v, state'') = getOpVal op2 state'
    state''' = setOpVal op2 (op2v+op1v) state''
  in
    exec prog is state'''

exec prog (Mul op1 op2:is) state = 
  let
    (op1v, state') = getOpVal op1 state
    (op2v, state'') = getOpVal op2 state'
    state''' = setOpVal op2 (op2v*op1v) state''
  in
    exec prog is state'''

exec prog (Sub op1 op2:is) state = 
  let
    (op1v, state') = getOpVal op1 state
    (op2v, state'') = getOpVal op2 state'
    state''' = setOpVal op2 (op2v-op1v) state''
  in
    exec prog is state'''

exec prog (Div op1 op2:is) state = 
  let
    (op1v, state') = getOpVal op1 state
    (op2v, state'') = getOpVal op2 state'
    state''' = setOpVal op2 (op2v `div` op1v) state''
  in
    exec prog is state'''

exec prog (Bra name:is) state = jmp prog name state

exec prog (Blt name:is) state =
  let
    (dn, a7, mem, syms, cmp) = state
  in
    if cmp < 0 then
      jmp prog name state
    else
      exec prog is state

exec prog (Ble name:is) state =
  let
    (dn, a7, mem, syms, cmp) = state
  in
    if cmp <= 0 then
      jmp prog name state
    else
      exec prog is state


exec prog (Bgt name:is) state =
  let
    (dn, a7, mem, syms, cmp) = state
  in
    if cmp > 0 then
      jmp prog name state
    else
      exec prog is state

exec prog (Bge name:is) state =
  let
    (dn, a7, mem, syms, cmp) = state
  in
    if cmp >= 0 then
      jmp prog name state
    else
      exec prog is state

exec prog (Jsr name:is) state =
  let
    (dn, a7, mem, syms, cmp) = state
    state' = push pc state
  in
    jmp prog name state'
  where
    pc = getCurrentPC prog is
    push pc (dn, a7, mem, syms, cmp) = 
      let mem' = setVal mem a7 pc
      in 
        if a7-4 >= 0 then 
          (dn, a7-4, mem', syms, cmp)
        else
          error "Stack Overflow in jsr"
    getCurrentPC prog is = (length prog) - (length is)

exec prog (Ret:is) state =
  let
    (dn, a7, mem, syms, cmp) = state
    (newPC, state') = pop state
  in
    jmpToAddress prog newPC state'
  where
    pop (dn, a7, mem, syms, cmp)
      = (mem !! (a7+4),
         (dn, a7+4, mem, syms, cmp))
    jmpToAddress prog newPC state = 
      exec prog is state
      where
        (skipped, is) = splitAt newPC prog

exec prog (i:is) state = exec prog is state


jmp prog name state = ijmp prog prog name state
  where
    ijmp prog (Define x:is) name state
      | x == name = exec prog is state
      | otherwise = ijmp prog is name state
    
    ijmp prog (i:is) name state = ijmp prog is name state


getOpVal :: Operand -> State -> (Int, State)
getOpVal (ImmNum x) state = (x, state)

getOpVal (ImmName x) state = (getSymAdd x syms, state)
  where
    (dn, a7, mem, syms, cmp) = state

getOpVal (Reg r) state = (getReg r state, state)
  where
    (dn, a7, mem, syms, cmp) = state
getOpVal (Reg A7) state = (a7, state)
  where
    (dn, a7, mem, syms, cmp) = state
getOpVal (Abs name) state = (val, state)
  where
    (dn, a7, mem, syms, cmp) = state
    add = getSymAdd name syms
    val = mem !! (add `div` 4)

getOpVal (Ind r) state = (val, state)
  where
    (dn, a7, mem, syms, cmp) = state
    add = getReg r state
    val = mem !! (add `div` 4)

getOpVal (Ind A7) state = (val, state)
  where
    (dn, a7, mem, syms, cmp) = state
    add = a7
    val = mem !! (add `div` 4)

getOpVal Pop state = (val, (dn, a7', mem, syms, cmp))
  where
    (dn, a7, mem, syms, cmp) = state
    a7' = a7+4
    add = a7
    val = mem !! (add `div` 4)


getReg A7 (dn, a7, mem, syms, cmp) 
 = a7
getReg r  (dn, a7, mem, syms, cmp)
 = dn !! (regToRegNumber r)

regToRegNumber D0 = 0 
regToRegNumber D1 = 1 
regToRegNumber D2 = 2 
regToRegNumber D3 = 3 
regToRegNumber D4 = 4 
regToRegNumber D5 = 5 
regToRegNumber D6 = 6 
regToRegNumber D7 = 7 
regToRegNumber A7 = error "bad register"


getSymAdd x ((sym, size, add):syms)
  | x == sym  = add*4
  | otherwise = getSymAdd x syms


setOpVal (Reg r) val (dn, a7, mem, syms, cmp) = (dn', a7, mem, syms, cmp)
  where
    dn' = setVal dn (regToRegNumber r) val
setOpVal (Reg A7) val (dn, a7, mem, syms, cmp) = (dn, val, mem, syms, cmp)
setOpVal (Abs name) val (dn, a7, mem, syms, cmp) = (dn, a7, mem', syms, cmp)
  where
    add = getSymAdd name syms
    mem' = setVal mem (add `div` 4) val

setOpVal (Ind A7) val (dn, a7, mem, syms, cmp) = (dn, a7, mem', syms, cmp)
  where
    add = a7
    mem' = setVal mem (add `div` 4) val

setOpVal (Ind r) val (dn, a7, mem, syms, cmp) = (dn, a7, mem', syms, cmp)
  where
    add = getReg r (dn, a7, mem, syms, cmp)
    mem' = setVal mem (add `div` 4) val


setOpVal Push val state = (dn, a7', mem', syms, cmp)
  where
    (dn, a7, mem, syms, cmp) = state
    add = a7-4
    a7' = if a7-4 >= 0 then a7-4 else error "Stack Overflow!"
    mem' = setVal mem (add `div` 4) val


allocMem :: [Int] -> Int -> [Int]
allocMem mem 0 = mem
allocMem mem size = mem ++ allocMem [0] (size-1)

setVal :: [Int] -> Int -> Int -> [Int]
setVal (x:xs) ind new
  | ind == 0    = (new:xs)
  | otherwise   = (x:(setVal xs (ind-1) new))

printState :: State -> IO ()
printState (dn, a7, mem, syms, cmp) = 
  let
    out = "Registers D0-7: " ++ (show dn) ++ "\n" ++
          "Register  A7  : " ++ (show a7) ++ "\n" ++
          "--------------------------\n" ++
          " Variables                \n" ++
          "--------------------------\n" ++
          printSyms syms mem
  in
    putStr out

printSyms [] mem = []
printSyms ((name, size, add):syms) mem = 
  name ++ ": " ++ (show (memSection mem add size)) ++ "\n" ++
  printSyms syms mem
memSection [] add 0 = []
memSection (m:ms) add size
  | size == 0 = []
  | add == 0  = (m:memSection ms 0 (size-1))
  | otherwise = memSection ms (add-1) size




code1 = [Jsr "L", Halt, Define "L", Mov (ImmNum 123) (Reg D2), Ret]

code2 = [Mov (ImmNum 100)(Reg D0),
         Jsr "L", 
         Mov (ImmNum 200)(Reg D1),
         Halt, 
         Define "L", 
         Mov (ImmNum 123)(Reg D2), 
         Ret,
         Mov (ImmNum 234)(Reg D3)]


---------------------------------------------Functions--------------------------

test program input = 
  let 
    (dn, a7, mem, syms, cmp)
      = interpret (compile program) input
    [d0,d1,d2,d3,d4,d5,d6,d7] = dn

    out = "Result returned from main: "++(show d0)++"\n"++
          "Registers D0-7: " ++ (show dn) ++ "\n" ++
          "Register  A7  : " ++ (show a7) ++ "\n" ++
          -- in Exercise 3 you don't need .comm so you don't need this
          (if syms /= [] then 
            "--------------------------\n" ++
            " Variables                \n" ++
            "--------------------------\n" ++
            printSyms syms mem
          else "")
  in 
    putStr out   

compile program =
  [Jsr "main",
   Halt] ++
  transProgram program

transProgram [] = []
transProgram (def:defs) = [Mov (Reg Ebp) Push]
                        ++[Mov (Reg Ebp) (Reg Esp)]
                        ++(transStatement def)
                        ++(transProgram defs)
                        ++[Mov Pop (Reg Ebp)]
                        ++[Ret]

putCode [] = putStr "\n"
putCode (i:is) = do putStr (show i ++"\n") ; (putCode is)

-------------------------------------------Types--------------------------------

--instance Show Exp where
--  show (Const i) = show i
--  show (Var s)   = s
--  show (Plus e1 e2) = show e1 ++ " + " ++ show e2
--  show (Minus e1 e2) = show e1 ++ " - " ++ show e2
--  show (Apply s e) = s ++ "(" ++ show e ++ ")"
data Instr = Define String       -- "label:"
           | Jsr String          -- jump to subroutine, push PC
           | Ret                 -- return from subroutine, pop PC from stack
           | Mov Operand Operand -- "mov.l xxx yyy" (yyy:=xxx)
           | Sub Operand Operand -- "sub.l xxx yyy" (yyy:=yyy-xxx)

           -- additional instructions and directives not actually
           -- needed for exercise 3:
           | Add Operand Operand -- "add.l xxx yyy" (yyy:=yyy+xxx)
           | Cmp Operand Operand 
           | Mul Operand Operand
           | Div Operand Operand
           | Bra [Char] 
           | Blt [Char] 
           | Bgt [Char] 
           | Ble [Char] 
           | Bge [Char] 
           | Halt
           | Comm String Int     -- ".comm name size"

instance Show Instr where
  show (Define s) = s ++ ": "
  show (Jsr s) = "\tjsr  " ++ s
  show (Ret) = "\tret"
  show (Mov o Push) = "\tpush " ++ show o
  show (Mov Pop o) = "\tpop  " ++ show o
  show (Mov o1 o2) = "\tmov  " ++ show o1 ++ ", " ++ show o2
  show (Sub o1 o2) = "\tsub  " ++ show o1 ++ ", " ++ show o2
  show (Add o1 o2) = "\tadd  " ++ show o1 ++ ", " ++ show o2
  show (Mul o1 o2) = "\tmul  " ++ show o1 ++ ", " ++ show o2
  show (Div o1 o2) = "\tdiv  " ++ show o1 ++ ", " ++ show o2
  show (Cmp o1 o2) = "\tcmp  " ++ show o1 ++ ", " ++ show o2
  show (Bra s) = "\tbra  " ++ s
  show (Blt s) = "\tblt  " ++ s
  show (Bgt s) = "\tbgt  " ++ s
  show (Bge s) = "\tbge  " ++ s
  show (Halt)  = "\thalt "
  show (Comm name size) = ".comm\t" ++ show name ++ ", " ++ show size
data Operand = Reg Register -- specifies data or address register
             | Push         -- "-(a7)" (as in "mov.w d0,-(a7)" to push d0)
             | Pop          -- "(a7)+" (so "Mov Pop (Reg D0)" = mov.w (a7)+,d0)
             | ImmNum Int   -- "#n"
             -- not needed for Exercise 3:
             | ImmName String -- to access value of symbolic address defined using .comm
             | Abs String    -- to access location addressed by symbolic address
             | Ind Register  -- register indirect
--     deriving Show
instance Show Operand where
  show (Reg r) = show r
  show (ImmNum i) = "$" ++ show i
data Register = Ebp | Esp | D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | A7
     deriving (Eq, Show)
paramReg = D1
resultReg = D0
allRegs = [D0, D1,D2,D3,D4,D5,D6,D7]
