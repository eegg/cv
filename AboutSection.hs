module AboutSection (aboutSection) where

import Text.XML.HXT.Core (XmlTree, ArrowXml, sattr, txt, mkelem)
import Common (h2, ul, strong, link, cls, section, interspace, p, division)

aboutSection :: (ArrowXml a) => a n XmlTree
aboutSection = section [cls "aboutSection"]
  [ division []
    [ p $ interspace
      [ strong "About me:"
      , txt "I am a developer and designer with an M.Sc. in Computing Science."
      , txt "I like problems and will attack them until solved."
      , txt "I like to communicate in paint, print, and programming."
      ]
    , p $ interspace
      [ strong "About you:"
      , txt "You have a clear, simple vision that you will not compromise."
      , txt "You value quality over quantity."
      , txt "You want more than a mere programmer."
      , txt "You like strong static typing and functional programming."
      ]
    ]
  ]
