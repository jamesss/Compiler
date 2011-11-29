module Main (main) where
import Lexer

main = do
    s <- getContents
    print (alexScanTokens s)
