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

was                         { \s -> Was }
a                           { \s -> Aa }
became                      { \s -> Became }
drank                       { \s -> Drank }
ate                         { \s -> Ate }
The\ room                   { \s -> TheRoom }
contained                   { \s -> Contained }
said\ Alice                 { \s -> SaidAlice }
perhaps                     { \s -> Perhaps }
had                         { \s -> Had }
enough\ times.              { \s -> EnoughTimes }
eventually                  { \s -> Eventually }
went                        { \s -> Went }
through                     { \s -> Through }
The\ Looking\-Glass          { \s -> LookingGlass }
changed                     { \s -> Changed }
[\(]                        { \s -> OBracket }
[\)]                        { \s -> CBracket }
what                        { \s -> What }
piece                       { \s -> Piece }
\'s                         { \s -> ICommaS }
so                          { \s -> So }
or                          { \s -> Or }
either                      { \s -> Either }
maybe                       { \s -> Maybe }
because                     { \s -> Because }

[\%\+\^\*\&\/\-\|\>\<\=]  { \s -> BinOp (head s) }
={2}|\<=|\>=|\&{2}|!=|\|{2}     { \s -> DBinOp s }
\~                          { \s -> UnOp (head s) }

[\.]                        { \s -> Separator }
[\,]                        { \s -> Separator }
then                        { \s -> Separator }
and                         { \s -> Separator }
but                         { \s -> Separator }
too.                        { \s -> Separator }
\?                          { \s -> Separator }
[A-Za-z]+[A-Za-z0-9]*       { \s -> Id s }

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
   Was              |
   Became           |
   Id String        |
   AliceFound       |
   Spoke            |
   BinOp Char       |
   DBinOp String    |
   UnOp Char        |
   ThoughtAlice     |
   TheRoom  |
   Contained    |
   Aa   |
   SaidAlice    |
   Perhaps  |
   AliceUnsureW  |
   Had  |
   EnoughTimes  |
   Eventually   |
   OBracket |
   CBracket |
   What |
   Piece    |
   QMark    |
   ICommaS  |
   AliceUnsure |
   So |
   Or |
   Maybe |
   Because |
   Went |
   Through |
   LookingGlass |
   Changed |
   Either
   deriving (Eq,Show)

}
