module TopSection (topSection) where

import Text.XML.HXT.Core (XmlTree, ArrowXml, sattr, txt, mkelem)
import Common (h2, ul, strong, link, cls, section, attrVal, email, obscure, csv, item, mk, trs, prop, htmlSpan)
import Links (mkLink, Link(LinkMeLinkedIn, LinkMeBitbucket, LinkMeGitHub, LinkMeReddit))

topSection :: (ArrowXml a) => a n XmlTree
topSection = section (item "http://data-vocabulary.org/Person")
  [ htmlSpan [sattr "style" "display: none;", prop "name"] [txt "James Harrison Fisher"]
  , mkelem "table" [cls "firstColFixedWidth"]
    [ mk "tbody" $ trs
      [ attrVal [txt "Birth date"] [] [txt "October 1987"]
      , attrVal [txt "Address"] ([prop "address"]++(item "http://data-vocabulary.org/Address")) $ csv
          [ htmlSpan [prop "locality"] [txt "Highgate"]
          , htmlSpan [prop "region"] [txt "London"]
          , htmlSpan [prop "postal-code"] [txt "N6 4AG"]
          ]
      , attrVal [txt "Email"] [] [email "jameshfisher@gmail.com"]
      , attrVal [txt "Mobile"] [] [txt $ obscure "07951 498 897"]
      , attrVal [txt "Find me on"] [] $ csv $ map mkLink [ LinkMeLinkedIn, LinkMeBitbucket, LinkMeGitHub, LinkMeReddit ]
      ]
    ]
  ]
