module Index exposing (..)

import Html exposing (text, body, div, h1, h3, a, p, i, span, section, h5, br, hr, node)
import ResumeContent exposing (resume)
import ResumeData exposing (..)

myData : ResumeData 
myData = ResumeData 
    "Your Name" 
    "You@Email.com"
    "What you do"
    "This is a short description of who you are. Keep it to about 3 sentences and make sure to highlight the key points about you. What makes you stand out as an applicant?"

main : Html.Html msg
main = resume myData
