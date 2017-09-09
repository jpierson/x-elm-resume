module Index exposing (..)

import Html exposing (Html)
import ResumeContent exposing (resume)
import ResumeData exposing (..)


myData : ResumeData 
myData = ResumeData 
    "Your Name" 
    "You@Email.com"
    "What you do"
    "This is a short description of who you are. Keep it to about 3 sentences and make sure to highlight the key points about you. What makes you stand out as an applicant?"
    [ EducationData "University of Maryland" "Bachelor of Awesomeness" "EXPECTED SPRING 2015" 
    , EducationData "Lil 'ol College" "Associate of Degrees" "JUNE 2012"] 
    [ WorkData 
        "Thatone Corp." 
        "description"
        "Position" 
        "todo-url" 
        "AUGUST 2012" 
        "CURRENT"
        "Here's where you put a description of the position you held. Responsibilities, accomplishments - the same as you would do on a standard paper resume, but this will be online and look cooler." 
        [] 
        (Address "CITY" (Just "STATE") "USA")
    , WorkData 
        "Another Organization Ltd. ." 
        "description"
        "Previous Position" 
        "todo-url" 
        "JUNE 2010" 
        "JULY 2012" 
        "You worked at another job! Great! Describe waht you did there, include those responsibilities and accomplishments again." 
        [] 
        (Address "GOTHAM CITY" Nothing "USA")]
    


main : Html msg
main = resume myData
