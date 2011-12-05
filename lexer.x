{

module Lexer where

}

%wrapper "basic"

tokens :-

$white+                     ;
[\n]                        ;

[0-9]+                      { \s -> LInt (read s) }
[\'][^\t\n][\']             { \s -> LChar (s!!1) }
[\"][^\t\n]*[\"]            { \s -> LString (drop 1 (take ((length s)-1) s)) }

Alice\ found                { \s -> AliceFound }
Alice\ was\ unsure\ which.  { \s -> AliceUnsureW }
Alice\ was\ unsure.         { \s -> AliceUnsure }
thought\ Alice.             { \s -> ThoughtAlice }
spoke                       { \s -> Spoke }

number                      { \s -> Number }
letter                      { \s -> Letter }
sentence                    { \s -> Sentence }

was\ a                      { \s -> WasA }
became                      { \s -> Became }
drank                       { \s -> Drank }
ate                         { \s -> Ate }
The\ room                   { \s -> TheRoom }
contained\ a                { \s -> ContainedA }
said\ Alice                 { \s -> SaidAlice }
perhaps                     { \s -> Perhaps }
had                         { \s -> Had }
enough\ times.              { \s -> EnoughTimes }
eventually                  { \s -> Eventually }
[\(]                        { \s -> OBracket }
[\)]                        { \s -> CBracket }
what                        { \s -> What }
was                         { \s -> Was }
piece                       { \s -> Piece }
\?                          { \s -> QMark }
\'s                         { \s -> ICommaS }
so                          { \s -> So }
or                          { \s -> Or }
maybe                       { \s -> Maybe }
because                     { \s -> Because }

[\%\+\^\*\&\/\-\|\>\<]|={2}|\<=|\>=    { \s -> BinOp (head s) }
\~                           { \s -> UnOp (head s) }

[\.]                        { \s -> Separator }
[\,]                        { \s -> Separator }
then                        { \s -> Separator }
and                         { \s -> Separator }
but                         { \s -> Separator }
too.                        { \s -> Separator }
[A-Za-z]+	                { \s -> Id s }

.                           { \s -> error s }

{

data Token =
   Number           |
   Letter           |
   Sentence         |
   LInt Int         |
   LChar Char       |
   LString String   |
   Separator        |
   Drank            |
   Ate              |
   WasA             |
   Became           |
   Id String        |
   AliceFound       |
   Spoke            |
   BinOp Char       |
   UnOp Char        |
   ThoughtAlice     |
   TheRoom  |
   ContainedA   |
   SaidAlice    |
   Perhaps  |
   AliceUnsureW  |
   Had  |
   EnoughTimes  |
   Eventually   |
   OBracket |
   CBracket |
   What |
   Was  |
   Piece    |
   QMark    |
   ICommaS  |
   AliceUnsure |
   So |
   Or |
   Maybe |
   Because
   deriving (Eq,Show)

}
