module EducationSection (educationSection) where

import Text.XML.HXT.Core (XmlTree, ArrowXml, sattr, txt, mkelem)
import Common (h2, h3, ul, strong, link, cls, section, attrVal, mk, trs, q)
import Links (mkLink, Link(LinkCRGS, LinkGreyFriars))

educationSection :: (ArrowXml a) => a n XmlTree
educationSection = section [cls "educationSection"]
  [ h2 "Education"
  , mkelem "table" [cls "firstColFixedWidth"]
    [ mk "tbody" $ trs [ msc, ba, aLevels, gcses ] ]
  , h3 "Other courses"
  , mkelem "table" [cls "firstColFixedWidth"]
    [ mk "tbody" $ trs
      [ attrVal [txt "Sep.–Nov. 2012"] []
        [ q "Functional Programming Principles in Scala"
        , txt " at Coursera. In progress."
        ]
      , attrVal [txt "Nov.–Dec. 2012"] []
        [ q "Cryptography"
        , txt " at Coursera. In progress."
        ]
      ]
    ]
  ]

msc, ba, aLevels, gcses :: (ArrowXml a) => [a n XmlTree]
msc =
  attrVal [txt "2010–12"] []
  [ txt "M.Sc. with "
  , strong "distinction"
  , txt " in "
  , link "http://www3.imperial.ac.uk/pgprospectus/facultiesanddepartments/computing/postgraduatecourses/computingscience" "Computing Science"
  , txt " at "
  , mkelem "strong" [] [link "http://www3.imperial.ac.uk/" "Imperial College London"]
  , txt ". "
  , txt "Individual project covered "
  , q "verifying a balanced-tree index implementation in VeriFast" -- TODO: link
  , txt "."
  ]

ba =
  attrVal [txt "2006–9"] []
  [ txt "B.A. with "
  , strong "first-class"
  , txt " honors in "
  , link "http://www.york.ac.uk/history/undergraduate/" "History"
  , txt " at the "
  , mkelem "strong" [] [link "http://www.york.ac.uk/" "University of York"]
  , txt "."
  ]

aLevels =
  attrVal [txt "2004–6"] []
  [ txt "Achieved the following ", strong "six A-levels", txt ":"
  , mkelem "table" [cls "aLevelTable"]
    [ mk "tbody" $
      [ mk "tr" $ map (\s -> mk "th" [ txt s]) ["Grade", "Subject", "Institution"]
      ] ++ (map toRow subjects)
    ]
  ]
  where
    toRow (grade, subject, institution) =
      mk "tr"
      [ mk "td" [txt grade]
      , mk "td" [txt subject]
      , mk "td" [mkLink institution]
      ]
    subjects =
      [ ("A", "History"        , LinkCRGS      )
      , ("A", "Computing"      , LinkCRGS      )
      , ("A", "General Studies", LinkCRGS      )
      , ("B", "Physics"        , LinkCRGS      )
      , ("B", "Mathematics"    , LinkCRGS      )
      , ("B", "Art and Design" , LinkGreyFriars)
      ]

gcses =
  attrVal [txt "2002–4"] []
  [ txt "Eleven GCSEs at "
  , mk "strong" [ mkLink LinkCRGS ]
  , txt "."
  ]
