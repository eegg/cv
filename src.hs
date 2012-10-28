#!/usr/bin/env runhaskell
module Main where

import Prelude hiding (span, div)
import Text.XML.HXT.Core (runX, ArrowXml, XmlTree, mkelem, txt, sattr, root, writeDocument, withIndent, yes)
import Control.Arrow ((>>>))

import Common (mk, meta, style, section, cls, division, p, link)

import TopSection (topSection)
import AboutSection (aboutSection)
import EducationSection (educationSection)
import ExperienceSection (experienceSection)
import SkillsSection (skillsSection)

rootEl = mkelem "html" []
  [ mk "head"
    [ mkelem "meta" [sattr "charset" "utf-8"] []
    , mk "title" [txt "CV: James Fisher"]
    , meta "description" "Curriculum Vitae for James Fisher"
    , meta "keywords"    "James Fisher, James Harrison Fisher, CV, Curriculum Vitae, resume, eegg"
    , meta "author"      "James Fisher"
    , meta "language"    "en-US" -- British English sucks
    , style "all" "http://eegg.github.com/style/css/common.css"
    , style "all" "cv.css"
    ]
  , mk "body"
    [ section [cls "content"]
      [ mkelem "div" [cls "photo"] [txt ""]
      ,  mk "h1" [txt "James Fisher"]
      , topSection
      , aboutSection
      , educationSection
      , skillsSection
      , experienceSection
      , division [cls "endNote print"]
        [ p
          [ txt "This document is available at "
          , link "http://eegg.github.com/cv" "http://eegg.github.com/cv/"
          , txt "."
          ]
        ]
      , section [cls "screen", sattr "id" "formats"]
        [ mkelem "a" [sattr "href" "cv.txt"] [ mkelem "img" [sattr "src" "images/txt.png", sattr "alt" "Get the plaintext"] []]
        , mkelem "a" [sattr "href" "cv.pdf"] [ mkelem "img" [sattr "src" "images/acrobat.png", sattr "alt" "Get the PDF"] []]
        ]
      ]
    ]
  ]

main = runX $ (root [] [rootEl]) >>> writeDocument [] "index.html"