-- GH Pages stupidly doesn't serve plaintext as utf-8.
-- This converts some unicode characters to roughly equivalent ASCII.

import Data.String.Utils

main = interact $ join "" . map c

c '’' = "'"
c '–' = "-"
c '…' = "..."
c a   = [a]