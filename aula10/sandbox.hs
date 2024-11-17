module Main where

repeatStr str times = take (times * length str) (cycle str)

main = putStrLn (repeatStr "agua " 4)
