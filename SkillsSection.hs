module SkillsSection (skillsSection) where

import Text.XML.HXT.Core (XmlTree, ArrowXml, sattr, txt, mkelem)
import Common (mk, h2, ul, strong, link, cls, section, listTable, csv)
import Links (mkLink, Link(LinkHaskell, LinkScala, LinkCpp, LinkVeriFast, LinkJavaScript, LinkPython, LinkJQuery, LinkJQueryUI, LinkApache, LinkNodeJS, LinkMVC, LinkHTML5, LinkCSS3, LinkXML, LinkJSON, LinkGit, LinkQuickCheck, LinkXUnit, LinkSQL, LinkOracleDatabase, LinkLinux, LinkWindows, LinkBigO))

skillsSection :: (ArrowXml a) => a n XmlTree
skillsSection = section [cls "skillsSection"]
  [ h2 "Skills"
  , ul [ skillBox, design, problemSolving, algorithmics ]
  ]

skillBox, design, problemSolving, algorithmics :: (ArrowXml a) => [a n XmlTree]

skillBox =
  [ txt "I have computing and I.T. experience of the following, with varying familiarity:"
  , listTable $ map csv
    [ [ mk "strong" [mkLink LinkHaskell], mkLink LinkScala ]
    , [ mk "strong" [mkLink LinkCpp]]
    , [ mk "strong" [mkLink LinkVeriFast], txt "verification" ]
    , [ mk "strong" [mkLink LinkJavaScript], mkLink LinkPython ]
    , [ mk "strong" [mkLink LinkJQuery], mkLink LinkJQueryUI ]
    , map mkLink [ LinkApache, LinkNodeJS, LinkMVC ]
    , (map mkLink [ LinkHTML5, LinkCSS3, LinkXML, LinkJSON ]) ++ [ txt "etc." ]
    , [ mk "strong" [mkLink LinkGit]]
    , [ mk "strong" [mkLink LinkQuickCheck], mkLink LinkXUnit ]
    , [ mkLink LinkSQL, mkLink LinkOracleDatabase ]
    , [ mk "strong" [mkLink LinkLinux], mkLink LinkWindows ]
    ]
  ]

design =
  [ strong "An eye for aesthetics, design, and presentation."
  , txt " I believe this is as important for code as for product design."
  ]

problemSolving =
  [ strong "Problem-solving and strategic thinking."
  , txt " I will thrive in an intellectually challenging workplace."
  , txt " I strive to eliminate routine tasks."
  ]

algorithmics =
  [ strong "An understanding of algorithmics and a comfortableness with formalism."
  , txt " I am familiar with ", mkLink LinkBigO, txt "."
  , txt " I enjoy playing with and implementing algorithms for their own sake."
  ]

{-
english =
  [ strong "An impeccable grasp of the English language."
  , txt " I write for pleasure, and enjoy communicating ideas with flair, clarity and concision."
  ]

organization =
  [ strong "Organization."
  , txt " I manage my time and tasks effectively."
  ]

officeSuites =
  [ strong "Office suites."
  , txt " ("
  , link "http://office.microsoft.com/" "MS Office"
  , txt ", "
  , link "http://www.libreoffice.org/" "OpenOffice"
  , txt ", "
  , link "http://docs.google.com/" "Google Docs"
  , txt "). "
  , txt "I am comfortable with document processing, spreadsheets, presentations, and databases."
  ]

itAdmin =
  [ strong "I.T. administration,"
  , txt " including operating systems ("
  , link "http://www.microsoft.com/uk/windows/" "Windows"
  , txt ", "
  , link "http://kernel.org/" "Linux"
  , txt "), and "
  , link "http://en.wikipedia.org/wiki/Computer_network" "networking"
  , txt "(small-scale)."
  ]

programming =
  [ strong "Programming and computer science."
  , txt " I am happy using various languages, including "
  , link "http://en.wikipedia.org/wiki/C%2B%2B" "C++"
  , txt ", "
  , link "http://en.wikipedia.org/wiki/Javascript" "Javascript"
  , txt ", and "
  , link "http://haskell.org/" "Haskell"
  , txt ". I can develop modern web sites and applications."
  ]
-}