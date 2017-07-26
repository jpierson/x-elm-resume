module Index exposing (..)

import Html exposing (text, body, div, h1, h3, a, p, i, span, section, h5, br, hr, node)
import ResumeContent exposing (resume)
import ResumeData exposing (..)

myData : ResumeData 
myData = ResumeData "Jeff Pierson" "jeff@beyondfold.com"

main : Html.Html msg
main = resume myData
   