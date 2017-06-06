module ResumeContent exposing (..)

import Html exposing (text, body, div, h1, h3, a, p, i, span, section, h5, br, hr, node)
import Html.Attributes exposing (class, id, href, name)


sm : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
sm =
    node "sm"

t : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
t =
    node "t"

imp : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
imp =
    node "imp"

more : List (Html.Attribute msg) -> List (Html.Html msg) -> Html.Html msg
more =
    node "more"

type alias ResumeData =
  { name : String
  , email : String
  }


header : ResumeData -> Html.Html msg
header resumeData =
    div
        [ class "header"
        , id "headerwrap"
        ]
        [ div [ class "container" ]
            [ div [ class "row centered" ]
                [ div [ class "col-lg-12" ]
                    [ h1 [] [ text resumeData.name ]
                    , h3 []
                        [ text "What you do | "
                        , a [ href ("mailto:" ++ resumeData.email) ] [ text resumeData.email ]
                        ]
                    ]
                ]
            ]
        ]

aboutDiv : ResumeData -> Html.Html msg
aboutDiv resumeData =
    div [ class "about" ]
        [ div [ class "container" ]
            [ div [ class "row" ]
                [ div [ class "col-lg-2 col-lg-offset-1" ]
                    [ h5 []
                        [ text "ABOUT" ]
                    ]
                , div [ class "col-lg-6" ]
                    [ p []
                        [ text "This is a short description of who you are. Keep it to about 3 sentences and make sure to highlight the key points about you. What makes you stand out as an applicant?" ]
                    ]
                , div [ class "col-lg-3" ]
                    [ p []
                        [ a [ href "my-resume.pdf" ]
                            [ i [ class "icon-file" ]
                                []
                            , span []
                                [ text "DOWNLOAD PDF" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]

educationDiv : ResumeData -> Html.Html msg
educationDiv resumeData = 
    div [ class "container desc" ]
        [ div [ class "row" ]
            [ div [ class "col-lg-2 col-lg-offset-1" ]
                [ h5 []
                    [ text "EDUCATION" ]
                ]
            , div [ class "col-lg-6" ]
                [ p []
                    [ t []
                        [ text "Bachelor of Awesomeness" ]
                    , br [] []
                    , text "University of Maryland"
                    ]
                ]
            , div [ class "col-lg-3" ]
                [ p []
                    [ sm []
                        [ text "Expected SPRING 2015" ]
                    , br []
                        []
                    , imp []
                        [ sm []
                            [ text "IN PROGRESS" ]
                        ]
                    ]
                ]
            , div [ class "col-lg-6 col-lg-offset-3" ]
                [ p []
                    [ t []
                        [ text "Associate of Degrees" ]
                    , br [] []
                    , text "Lil 'ol College"
                    ]
                ]
            , div [ class "col-lg-3" ]
                [ p []
                    [ sm []
                        [ text "JUNE 2012" ]
                    ]
                ]
            ]
        , br []
            []
        , hr []
            []
        ]

workDiv : ResumeData -> Html.Html msg
workDiv resumeData =
    div [ class "container desc" ]
        [ div [ class "row" ]
            [ div [ class "col-lg-2 col-lg-offset-1" ]
                [ h5 []
                    [ text "WORK" ]
                ]
            , div [ class "col-lg-6" ]
                [ p [ class "tight" ]
                    [ t []
                        [ text "Position" ]
                    , br [] []
                    , text "Thatone Corp."
                    , br []
                        []
                    ]
                , p []
                    [ more []
                        [ text "Here's where you put a description of the position you held. Responsibilities, accomplishments - the same as you would do on a standard paper resume, but this will be online and look cooler." ]
                    ]
                ]
            , div [ class "col-lg-3" ]
                [ p []
                    [ sm []
                        [ text "AUGUST 2012 - CURRENT"
                            , br [] []
                            , text "CITY, STATE, COUNTRY"
                        ]
                    ]
                ]
            , div [ class "col-lg-6 col-lg-offset-3" ]
                [ p [ class "tight" ]
                    [ t []
                        [ text "Previous Position" ]
                    , br [] []
                    , text "Another Organization Ltd."
                    , br []
                        []
                    ]
                , p []
                    [ more []
                        [ text "You worked at another job! Great! Describe waht you did there, include those responsibilities and accomplishments again." ]
                    ]
                ]
            , div [ class "col-lg-3" ]
                [ p []
                    [ sm []
                        [ text "JUNE 2010 - JULY 2012"
                        , br [] []
                        , text "GOTHAM CITY, USA"
                        ]
                    ]
                ]
            ]
        , br []
            []
        , hr []
            []
        ]

awardsDiv : ResumeData -> Html.Html msg
awardsDiv resumeData =
    div [ class "container desc" ]
        [ div [ class "row" ]
            [ div [ class "col-lg-2 col-lg-offset-1" ]
                [ h5 []
                    [ text "AWARDS" ]
                ]
            , div [ class "col-lg-6" ]
                [ p []
                    [ t []
                        [ text "Best Smile Award" ]
                    , br [] []
                    , text "Award-giving organization"
                    , br [] []
                    ]
                ]
            , div [ class "col-lg-3" ]
                [ p []
                    [ sm []
                        [ text "NOVEMBER 2013" ]
                    ]
                ]
            , div [ class "col-lg-6 col-lg-offset-3" ]
                [ p [ class "tight" ]
                    [ t []
                        [ text "Another award" ]
                    , br [] []
                    , text "Awards Site"
                    ]
                , p []
                    [ more []
                        [ text "This award has a description. You won it eating pie. Or probably doing something more job-related. Maybe you won't even keep this section - you'll replace it with Skills or something else!" ]
                    ]
                ]
            , div [ class "col-lg-3" ]
                [ p []
                    [ sm []
                        [ text "2013" ]
                    ]
                ]
            ]
        , br []
            []
        ]

resume : ResumeData -> Html.Html msg
resume resumeData = 
    body []
        [ header resumeData
        , section [ id "about", name "about" ] []
        , aboutDiv resumeData
        , section [ id "resume", name "resume" ] []
        , educationDiv resumeData
        , workDiv resumeData
        , awardsDiv resumeData
        , section [ id "contact", name "contact" ] []
        , div [ id "footwrap", class "footer" ]
            [ div [ class "container" ]
                [ div [ class "row" ]
                    [ div [ class "col-lg-2 col-lg-offset-1" ]
                        [ h5 []
                            [ text "CONTACT" ]
                        ]
                    , div [ class "col-lg-6" ]
                        [ p []
                            [ t []
                                [ text "Email" ]
                            , br []
                                []
                            , a [ href ("mailto:" ++ resumeData.email), class "mail" ]
                                [ text resumeData.email ]
                            , br []
                                []
                            ]
                        , p []
                            [ t []
                                [ text "Address" ]
                            , br [] [] 
                            , text "123 Some St." 
                            , br [] []
                            , text "City, State 01234" 
                            , br [] []
                            , text "United States of America" 
                            , br []
                                []
                            ]
                        , p []
                            [ t []
                                [ text "Phone" ]
                            , br []
                                []
                            , a [ href "tel:2345678901", class "tel" ]
                                [ text "(234) 567-8901" ]
                            , br []
                                []
                            ]
                        ]
                    , div [ class "col-lg-3" ]
                        [ p []
                            [ sm []
                                [ text "SOCIAL LINKS" ]
                            ]
                        , p []
                            [ a [ href "#" ]
                                [ i [ class "icon-dribbble" ]
                                    []
                                ]
                            , a [ href "#" ]
                                [ i [ class "icon-twitter" ]
                                    []
                                ]
                            , a [ href "#" ]
                                [ i [ class "icon-facebook" ]
                                    []
                                ]
                            , a [ href "#" ]
                                [ i [ class "icon-linkedin" ]
                                    []
                                ]
                            ]
                        ]
                    ]
                ]
            ]
    ]
