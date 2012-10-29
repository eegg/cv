module Links where

import Common (link, linkAbbr)

data Link
  = LinkYUDU
  | LinkSoftwire
  | LinkJava
  | LinkEnterpriseJavaBeans
  | LinkSpring
  | LinkAS3
  | LinkGit
  | LinkLexdenMontessori
  | LinkCRGS
  | LinkGreyFriars
  | LinkHSK
  | LinkUBM
  | LinkHSBC
  | LinkBigO
  | LinkHaskell
  | LinkScala
  | LinkCpp
  | LinkVeriFast
  | LinkPython              
  | LinkJavaScript          
  | LinkJQuery              
  | LinkJQueryUI            
  | LinkApache              
  | LinkNodeJS              
  | LinkMVC                 
  | LinkHTML5               
  | LinkCSS3                
  | LinkXML                 
  | LinkJSON                
  | LinkXUnit               
  | LinkQuickCheck          
  | LinkSQL                 
  | LinkOracleDatabase      
  | LinkLinux               
  | LinkWindows
  | LinkMScIndividualProjectPresentation
  | LinkCSCI             
  | LinkCaringHomes
  | LinkGilgilTrust
  | LinkPembrokeHouse
  | LinkCoursera
  | LinkCourseraScala
  | LinkCourseraCrypto
  | LinkMeLinkedIn
  | LinkMeGitHub
  | LinkMeReddit

mkLink l = case l of
  LinkYUDU                -> link "http://www.yudu.com/"                                     "YUDU Media"
  LinkSoftwire            -> link "http://softwire.com/"                                     "Softwire"
  LinkJava                -> link "http://en.wikipedia.org/wiki/Java_(programming_language)" "Java"
  LinkEnterpriseJavaBeans -> link "http://en.wikipedia.org/wiki/Enterprise_JavaBeans"        "Enterprise JavaBeans"
  LinkSpring              -> link "http://en.wikipedia.org/wiki/Spring_Framework"            "Spring Framework"
  LinkAS3                 -> link "http://en.wikipedia.org/wiki/ActionScript_3"              "ActionScript 3"
  LinkGit                 -> link "http://git-scm.com/"                                      "git"
  LinkLexdenMontessori    -> link "http://lexdenmontessori.com/"                             "Lexden Montessori"
  LinkCRGS                -> link "http://www.crgs.co.uk/"                                   "Colchester Royal Grammar School"
  LinkGreyFriars          -> link "http://www.grey-friars-college.co.uk/"                    "Grey Friars"
  LinkHSK                 -> link "http://www.hsk.org.uk/"                                   "Harambee Schools Kenya"
  LinkUBM                 -> link "http://www.ubm.com/"                                      "UBM"
  LinkHSBC                -> link "http://www.hsbc.co.uk/"                                   "HSBC"
  LinkBigO                -> link "http://en.wikipedia.org/wiki/Big_O_notation"              "Big-O notation" -- TODO: nbsp
  LinkHaskell             -> link "http://haskell.org/"                                      "Haskell"
  LinkScala               -> link "http://www.scala-lang.org/"                               "Scala"
  LinkCpp                 -> link "http://en.wikipedia.org/wiki/C%2B%2B"                     "C++"
  LinkVeriFast            -> link "http://people.cs.kuleuven.be/~bart.jacobs/verifast/"      "VeriFast"
  LinkPython              -> link "http://python.org/"                                       "Python"
  LinkJavaScript          -> link "http://en.wikipedia.org/wiki/Javascript"                  "JavaScript"
  LinkJQuery              -> link "http://jquery.com/"                                       "jQuery"
  LinkJQueryUI            -> link "http://jqueryui.com/"                                     "jQuery UI"
  LinkApache              -> link "http://httpd.apache.org/"                                 "Apache"
  LinkNodeJS              -> link "http://nodejs.org/"                                       "NodeJS"
  LinkMVC                 -> linkAbbr "http://en.wikipedia.org/wiki/Model_View_Controller"   "Model-View-Controller" "MVC"
  LinkHTML5               -> linkAbbr "http://en.wikipedia.org/wiki/HTML5"                   "HyperText Markup Language 5" "HTML5"
  LinkCSS3                -> linkAbbr "http://en.wikipedia.org/wiki/CSS3#CSS_3"              "Cascading Style Sheets 3" "CSS3"
  LinkXML                 -> linkAbbr "http://en.wikipedia.org/wiki/XML"                     "eXtensible Markup Language" "XML"
  LinkJSON                -> linkAbbr "http://json.org/"                                     "JavaScript Object Notation" "JSON"
  LinkXUnit               -> link "http://en.wikipedia.org/wiki/XUnit"                       "xUnit"
  LinkQuickCheck          -> link "http://en.wikipedia.org/wiki/QuickCheck"                  "QuickCheck"
  LinkSQL                 -> linkAbbr "http://en.wikipedia.org/wiki/SQL"                     "Structured Query Language" "SQL"
  LinkOracleDatabase      -> link "http://www.oracle.com/uk/products/database"               "Oracle Database"
  LinkLinux               -> link "http://kernel.org/"                                       "Linux"
  LinkWindows             -> link "http://www.microsoft.com/uk/windows/"                     "Windows"
  LinkMScIndividualProjectPresentation -> link "http://eegg.github.com/presentation/pres.html" "Verifying a balanced-tree index implementation in VeriFast"
  LinkCSCI                -> link "http://en.wikipedia.org/wiki/CSCI"                        "CSCI reports"
  LinkCaringHomes         -> link "http://www.caringhomes.org/"                              "Caring Homes"
  LinkGilgilTrust         -> link "http://gilgiltrust.org.uk/"                               "The Gilgil Trust"
  LinkPembrokeHouse       -> link "http://www.pembrokehouse.sc.ke/"                          "Pembroke House"
  LinkCoursera            -> link "https://www.coursera.org/"                                "Coursera"
  LinkCourseraScala       -> link "https://www.coursera.org/course/progfun"                  "Functional Programming Principles in Scala"
  LinkCourseraCrypto      -> link "https://www.coursera.org/course/crypto"                   "Cryptography"
  LinkMeLinkedIn          -> link "http://www.linkedin.com/profile/view?id=34422393"         "LinkedIn"
  LinkMeGitHub            -> link "http://github.com/eegg"                                   "GitHub"
  LinkMeReddit            -> link "http://www.reddit.com/user/Jameshfisher/"                 "Reddit"