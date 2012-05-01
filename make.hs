#!/usr/bin/env runhaskell
{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.Process (readProcess)
import Control.Monad.IO.Class (liftIO)
import Development.Shake (shake, ShakeOptions(..), shakeOptions, (*>), system', want, need, Action, writeFile', Verbosity(Loud))
import Development.Shake.FilePath ((</>), takeDirectory1)
import Text.Regex (mkRegex, matchRegexAll)

import ToAscii (toAscii)

pdf from to = system' "wkhtmltopdf" $ opts ++ [from, to] where
  opts =
    [ "--print-media-type"
    , "--margin-top", "2cm"
    , "--margin-right", "0"
    , "--margin-bottom", "2cm"
    , "--margin-left", "0"
    ]

toText :: FilePath -> Action String
toText from = liftIO $ readProcess "lynx" ["-dump", "-width", "110", "-nolist", from] ""

doPdf name f = need [name] >> pdf name f
doTxt name f = do
  need [name]
  str <- toText name
  writeFile' f (toAscii str)

m4deps content = case matchRegexAll (mkRegex "include\\(([^\\(\\)]+)\\)") content of
  Nothing -> []
  Just (_, _, rest, subs) -> subs ++ m4deps rest

getM4deps :: FilePath -> IO [FilePath]
getM4deps path = readFile path >>= return . m4deps


doM4 from to = do
  liftIO (getM4deps from) >>= need
  need [from]
  liftIO $ do
    out <- readProcess "m4" [from] ""
    writeFile to out

main = shake shakeOptions{shakeFiles=".", shakeVerbosity=Loud, shakeThreads=4} $ do

  "index.html"    *> doM4 "src/cs.html.m4"
  "general/index.html" *> doM4 "src/general.html.m4"

  "cv.pdf"    *> doPdf "index.html"
  "cv.txt"    *> doTxt "index.html"

  "general/cv.pdf" *> doPdf "general/index.html"
  "general/cv.txt" *> doTxt "general/index.html"

--  "spellcheck" *> \f -> do
--    let pws = "./aspell_exceptions.pws"
--    let q s = "\"" ++ s ++ "\""
--    need [pws, "index.html"]
--    system' "aspell" ["--lang=en_US", "--mode=html", "--personal="++(q pws), "check", "index.html"]

  want ["cv.pdf", "general/cv.pdf", "cv.txt", "general/cv.txt"]
