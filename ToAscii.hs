-- GH Pages stupidly doesn't serve plaintext as utf-8.
-- This converts some unicode characters to roughly equivalent ASCII.
module ToAscii where

import qualified Data.Map as Map

toAscii :: String -> String
toAscii = concat . (map $ \c -> case (Map.lookup c m) of { Nothing -> [c]; Just s -> s })

m = Map.fromList [
  ('’', "'"),
  ('–', "-"),
  ('…', "..."),
  ('‑', "-") -- non-breaking hyphen
  ]