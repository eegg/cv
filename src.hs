module Main where

import Prelude hiding (span)
import Text.XML.HXT.Core (runX, ArrowXml, XmlTree, IOSLA, XIOState, mkelem, txt, sattr, root, writeDocument, withIndent, yes)
import Control.Arrow ((>>>))

meta name content = mkelem "meta" [sattr "name" name, sattr "content" content] []

style media url = mkelem "link"
  [ sattr "rel" "stylesheet"
  , sattr "type" "text/css"
  , sattr "media" media
  , sattr "href" url
  ] []

cls c = sattr "class" c

section = mkelem "section"
span = mkelem "span"
strong s = mkelem "strong" [] [txt s]

item url = [sattr "itemscope" "itemscope", sattr "itemtype" url]
prop = sattr "itemprop"

mk n = mkelem n []

obscure s = "mailt&#111;&#58;j&#97;&#37;6Des&#104;fi%73%6&#56;er&#64;gmail&#46;&#99;&#111;m"

email e = mkelem "a" [sattr "href" ("mailto:"++e')] [txt e']
  where e' = obscure e'

link href t = mkelem "a" [sattr "href" href] [txt t]

trs = map (mk "tr")

attrVal attr atts val =
  [ mk "th" attr
  , mkelem "td" atts val
  ]

ul lis = mkelem "ul" [] (map (mkelem "li" []) lis)

topSection = section (item "http://data-vocabulary.org/Person")
  [ span [sattr "style" "display: none;", prop "name"] [txt "James Harrison Fisher"]
  , mkelem "table" [cls "firstColFixedWidth", sattr "summary" "Quick-reference attributes and values of James Harrison Fisher"]
    [ mk "tbody" $ trs
      [ attrVal [txt "Birth date"] [] [txt "October 1987"]
      , attrVal [txt "Address"] ([prop "address"]++(item "http://data-vocabulary.org/Address"))
          [ span [prop "locality"] [txt "Hammersmith"]
          , span [prop "region"] [txt "London"]
          , span [prop "postal-code"] [txt "W12 7JN"]
          ]
      , attrVal [txt "Email"] [] [email "jameshfisher@gmail.com"]
      , attrVal [txt "Mobile"] [] [txt $ obscure "07951 498 897"]
      ]
    ]
  ]

skillsSection = section []
  [ mk "h2" [txt "Skills"]
  , ul
    [ [ strong "An impeccable grasp of the English language."
      , txt " I write for pleasure, and enjoy communicating ideas with flair, clarity and concision."
      ]
    , [ strong "Organization."
      , txt " I manage my time and tasks effectively."
      ]
    , [ strong "An eye for aesthetics, design, and presentation."
      , txt " I adore understated typography, functional communication, and interactive design. I can put this into practice on the web, in "
      , mkelem "a" [sattr "href" "http://www.adobe.com/products/photoshop.html"] [txt "Photoshop"]
      , txt " or simply in letter-writing."
      ]
    , [ strong "Problem-solving and strategic thinking."
      , txt " I strive to eliminate routine tasks."
      ]
    , [ strong "Office suites."
      , txt " ("
      , link "http://office.microsoft.com/" "MS Office"
      , txt ", "
      , link "http://www.libreoffice.org/" "OpenOffice"
      , txt ", "
      , link "http://docs.google.com/" "Google Docs"
      , txt "). "
      , txt "I am comfortable with document processing, spreadsheets, presentations, and databases."
      ]
    , [ strong "I.T. administration,"
      , txt " including operating systems ("
      , link "http://www.microsoft.com/uk/windows/" "Windows"
      , txt ","
      , link "http://kernel.org/" "Linux"
      , txt "), and "
      , link "http://en.wikipedia.org/wiki/Computer_network" "networking"
      , txt "(small-scale)."
      ]
    , [ strong "Programming and computer science."
      , txt " I am happy using various languages, including "
      , link "http://en.wikipedia.org/wiki/C%2B%2B" "C++"
      , txt ", "
      , link "http://en.wikipedia.org/wiki/Javascript" "Javascript"
      , txt ", and "
      , link "http://haskell.org/" "Haskell"
      , txt ". I can develop modern web sites and applications."
      ]
    ]
  ]

educationSection = section []
  [ mk "h2" [txt "Education"]
  , mkelem "table" [cls "firstColFixedWidth", sattr "summary" "Institutions James Fisher has studied at, listed in descending order of year (i.e., most recent first)"]
    [ mk "tbody" $ trs
      [ attrVal [txt "2006&ndash;9"] []
        [ txt "Bachelor of Arts degree, with "
        , strong "first-class"
        , txt " honors, in "
        , link "http://www.york.ac.uk/history/undergraduate/" "History"
        , txt "at the "
        , mkelem "strong" [] [link "http://www.york.ac.uk/" "University of York"]
        , txt "."
        ]
      ]
    ]
  ]

rootEl = mkelem "html" []
  [ mk "head"
    [ mkelem "meta" [sattr "charset" "utf-8"] []
    , mk "title" [txt "CV: James Fisher"]
    , meta "description" "Curriculum Vitae for James Fisher"
    , meta "keywords"    "James Fisher CV Curriculum Vitae eegg"
    , meta "author"      "James Fisher"
    , meta "language"    "en-US" --British English sucks
    , style "all" "http://eegg.github.com/style/css/common.css"
    , style "all" "http://eegg.github.com/style/css/cv.css"
    ]
  , mk "body"
    [ section [cls "content"]
      [ mk "h1" [txt "James Fisher"]
      , topSection
      , skillsSection
      , educationSection
      ]
    ]
  ]

main = runX $ (root [] [rootEl]) >>> (writeDocument [withIndent yes] "index2.html")