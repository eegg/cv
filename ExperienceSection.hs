module ExperienceSection (experienceSection) where

import Text.XML.HXT.Core (XmlTree, ArrowXml, sattr, txt, mkelem)
import Common (mk, h2, ul, strong, link, cls, section, attrVal, trs, csvAnd, em, p, q)
import Links (mkLink, Link(LinkYUDU, LinkSoftwire, LinkJava, LinkEnterpriseJavaBeans, LinkSpring, LinkAS3, LinkGit, LinkLexdenMontessori, LinkHSK, LinkUBM, LinkHSBC))

experienceSection :: (ArrowXml a) => a n XmlTree
experienceSection = section [cls "experienceSection"]
  [ h2 "Experience"
  , mkelem "table" [cls "firstColFixedWidth"]
    [ mk "tbody" $ trs [ yudu, lm, gilgilTrust, pembrokeHouse, hsk, caringHomesDB, caringHomesVarious ]
    ]
  ]

yudu, lm, gilgilTrust, pembrokeHouse, hsk, caringHomesDB, caringHomesVarious :: (ArrowXml a) => [a n XmlTree]

yudu =
  attrVal [txt "May 2012–present"] [] $
  [ strong "Software Developer at ", mk "strong" [mkLink LinkYUDU]
  , txt ", working as part of the YUDU team at ", mkLink LinkSoftwire
  , txt ". I am working on feature requests, bug fixes, and maintenance of the code-base for client-side and server-side software. "
  , txt "Technologies used include "] ++ (csvAnd [mkLink LinkJava, mkLink LinkEnterpriseJavaBeans, mkLink LinkSpring, mkLink LinkAS3, mkLink LinkGit]) ++ 
  [ txt "."
  ]

lm =
  attrVal [txt "2006–present"] [] $
  [ txt "Director and Secretary of ", mk "strong" [mkLink LinkLexdenMontessori], txt ". "
  , txt "In these roles I have overseen, among other things,"
  , ul
    [ [ strong "Business planning."
      , txt " From the outset I have been involved in the company’s expansion and direction of growth. "
      , txt "I understand the requirements and challenges of a small business."
      ]
    , [ strong "Market research and advertising", txt " in multiple media (print, web, radio, and others). "
      , txt "I have learned, by success and failure, how to think from a customer’s perspective."
      ]
    , [ strong "Administration and secretarial duties."
      , txt " The follies of schematizing, sorting, and cross-referencing paperwork led me towards the real power of the computer."
      ]
    , [ strong "Web design and maintenance", txt " for "
      , mkelem "a" [sattr "href" "http://www.lexdenmontessori.com"] [txt "www.", strong "lexdenmontessori.com"]
      , txt "."
      ]
    ]
  ]

gilgilTrust =
  attrVal [txt "2012–present"] [] $
  [ txt "Branding, marketing consultancy, and web design for "
  , mk "strong" [link "http://gilgiltrust.org.uk/" "The Gilgil Trust"]
  , txt ", an organization providing young people around the town of Gilgil in Kenya with shelter, health-care, and help in their education and careers."
  ]

pembrokeHouse =
  attrVal [txt "2010"] [] $
  [ txt "Branding for "
  , mk "strong" [link "http://www.pembrokehouse.sc.ke/" "Pembroke House"]
  , txt " a private Kenyan prep school."
  , txt " In the words of their Commercial Director,"
  , mk "blockquote"
    [ txt "James has worked with me on new brand designs for Harambee Schools Kenya ", em "(see below)"
    , txt " a charity, and Pembroke House school, a prep school. In both cases his work was of the highest quality, and reflected a passion for design, but also for getting under the skin of the organisation he is designing for. I wouldn't hesitate to use James again for any design projects that I might have."
    ] 
  ]

hsk =
  attrVal [txt "2010"] [] $
  [ p
    [ txt "Branding and web design for ", mk "strong" [ mkLink LinkHSK ]
    , txt " a charity building schools around Gilgil in rural Kenya."
    ]
  , p
    [ mk "strong" [ link "http://onlinemarketing.gwsmedia.com/2010/11/2nd-objective-of-charity-website-design.html" "GWS Media gave the website an award" ]
    , txt ", commending its ", q "plain, clear English; striking design, and beautiful images."
    , txt " To date, the new branding and website is known to have directly brought in ", strong "£53,000 of funding"
    , txt " including from ", mkLink LinkUBM, txt " (the global media and comms giant) and ", mkLink LinkHSBC, txt " who made HSK their official corporate charity after finding the website."
    ]
  ]

caringHomesDB =
  attrVal [txt "2009"] []
  [ txt "Developing an internal database-driven system for managing care homes and ", link "http://en.wikipedia.org/wiki/CSCI" "CSCI reports"
  , txt " for ", mk "strong" [link "http://www.caringhomes.org/" "Caring Homes"]
  , txt "."
  ]

caringHomesVarious =
  attrVal [txt "2008"] []
  [ txt "Various responsibilities at ", mk "strong" [link "http://www.caringhomes.org/" "Caring Homes"]
  , txt ", including accountancy and financial planning, due diligence, insurance of plant, and remote I.T. support."
  ]

      {-<!--<tr>
        <th>2005</th>
        <td>First prize in a sixth-form art competition</td>
      </tr>
      <tr>
        <th>2004&ndash;6</th>
        <td>I.T. technician at <a href="http://www.crgs.co.uk/">Colchester Royal Grammar School</a></td>
      </tr>
      <tr>
        <th>2004&ndash;5</th>
        <td>Membership in a <strong><a href="http://www.young-enterprise.org.uk/">Young Enterprise</a></strong> company, qualifying with a <strong>distinction</strong></td>
      </tr>-->-}
