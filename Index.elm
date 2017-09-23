module Index exposing (..)

import Html exposing (Html)
import ElmResume.Views.ResumeContent exposing (resume)
import ElmResume.ResumeData exposing (..)


myData : JsonResume 
myData = JsonResume 
    (Just "Your Name")
    (Just "You@Email.com")
    (Just "(234) 567-8901")
    (Just "What you do")
    (Just "This is a short description of who you are. Keep it to about 3 sentences and make sure to highlight the key points about you. What makes you stand out as an applicant?")
    (Just (Location 
        (Just "123 Some St.")
        (Just "State 01234")
        (Just "City")
        (Just "US")
        (Just "State  ")))
    [ Profile (Just "Dribbble") (Just "") (Just "#")
    , Profile (Just "Twitter") (Just "") (Just "#")
    , Profile (Just "Facebook") (Just "") (Just "#")
    , Profile (Just "LinkedIn") (Just "") (Just "#") ]
    [ EducationData (Just "University of Maryland") (Just "Bachelor of Awesomeness") (Just "EXPECTED SPRING 2015")
    , EducationData (Just "Lil 'ol College") (Just "Associate of Degrees") (Just "JUNE 2012")] 
    [ WorkData 
        (Just "Thatone Corp." )
        (Just "description")
        (Just "Position" )
        (Just "todo-url" )
        (Just "AUGUST 2012" )
        (Just "CURRENT")
        (Just "Here's where you put a description of the position you held. Responsibilities, accomplishments - the same as you would do on a standard paper resume, but this will be online and look cooler." )
        [] 
        (Just (Address (Just "CITY") (Just "STATE") (Just "USA")))
    , WorkData 
        (Just "Another Organization Ltd. ." )
        (Just "description")
        (Just "Previous Position" )
        (Just "todo-url" )
        (Just "JUNE 2010" )
        (Just "JULY 2012" )
        (Just "You worked at another job! Great! Describe waht you did there, include those responsibilities and accomplishments again." )
        [] 
        (Just (Address (Just "GOTHAM CITY") Nothing (Just "USA")))]
    
main : Html msg
main = resume myData
