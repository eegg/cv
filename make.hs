#!/usr/bin/env runhaskell
module Make where

import System.Process (readProcess)
import Control.Monad.IO.Class (liftIO)
import Development.Shake (shake, ShakeOptions(..), shakeOptions, (*>), system', want, need, Action)

import ToAscii (toAscii)

pdf from to = system' "wkhtmltopdf" $ opts ++ [from, to] where
  opts =
    [ "--print-media-type"
    , "--margin-top", "2cm"
    , "--margin-right", "0"
    , "--margin-bottom", "0"
    , "--margin-left", "0"
    ]

toText :: FilePath -> Action String
toText from = liftIO $ readProcess "lynx" ["-dump", "-width", "110", "-nolist", from] ""

main = shake shakeOptions{shakeFiles=".", shakeVerbosity=2, shakeParallel=1} $ do
  "cv.pdf" *> \f -> do
    need ["index.html"]
    pdf "index.html" f

  "cv.txt" *> \f -> do
    need ["index.html"]
    str <- toText "index.html"
    liftIO $ writeFile f (toAscii str)

--  "spellcheck" *> \f -> do
--    let pws = "./aspell_exceptions.pws"
--    let q s = "\"" ++ s ++ "\""
--    need [pws, "index.html"]
--    system' "aspell" ["--lang=en_US", "--mode=html", "--personal="++(q pws), "check", "index.html"]

  want ["cv.pdf", "cv.txt"]
