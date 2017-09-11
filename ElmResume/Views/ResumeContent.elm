module ElmResume.Views.ResumeContent exposing (resume)

import ElmResume.ResumeData exposing (..)
import Html exposing (text, body, div, h1, h3, a, p, i, span, section, h5, br, hr, node)
import Html.Attributes exposing (class, id, href, name)
import ElmResume.Views.Html.Knommon exposing (..)
import Char exposing (..)
import Countries exposing (fromCode)

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
                        [ text <| resumeData.label ++ " | "
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
                        [ text resumeData.summary ]
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

educationRow : EducationData -> Bool -> List (Html.Html msg)
educationRow educationData isFirstRow =
    [
        div [ class "col-lg-2 col-lg-offset-1" ]
            [ h5 []
                -- HACK: I use a conditional here so that it is easier to treat
                -- the fist row different than subsequent ones but preserving
                -- the original class based layout differently altogether for
                -- the first row would be more desireable to stay true to the
                -- original author's example.
                (if isFirstRow  then 
                    [ text "EDUCATION" ] 
                else 
                    [ text "" ])
            ]
        , div [ class "col-lg-6" ]
            [ p []
                [ t []
                    [ text educationData.achievement ]
                , br [] []
                , text educationData.institution
                ]
            ]
        , div [ class "col-lg-3" ]
            [ p []
                [ sm []
                    [ text educationData.endDate ]
                , br []
                    []
                , imp []
                    [ sm []
                        [ text "IN PROGRESS" ]
                    ]
                ]
            ]
    ]

educationDiv : ResumeData -> Html.Html msg
educationDiv resumeData = 
    div [ class "container desc" ]
        [ div [ class "row" ]
            (List.concat (List.indexedMap (\i data -> educationRow data (i == 0)) resumeData.education))
        , br []
            []
        , hr []
            []
        ]

workRow : WorkData -> Bool -> List (Html.Html msg)
workRow workData isFirstRow =
    [ 
    div [ class "col-lg-2 col-lg-offset-1" ]
        [ h5 []
            [ text "WORK" ] 
        ]
    , div [ class (if isFirstRow then "col-lg-6" else "col-lg-6 col-lg-offset-3") ]
        [ p [ class "tight" ]
            [ t []
                [ text workData.position ]
            , br [] []
            , text workData.name
            , br []
                []
            ]
        , p []
            [ more []
                [ text workData.summary ]
            ]
        ]
    , div [ class "col-lg-3" ]
        [ p []
            [ sm []
                [ text <| workData.startDate ++ " - " ++ workData.endDate
                    , br [] []
                    , text (String.join ", " (List.filterMap identity [ Just workData.location.city, workData.location.state, Just workData.location.country ]))
                ]
            ]
        ]
    ]
    |> (if not isFirstRow then List.drop 1 else identity)

workDiv : ResumeData -> Html.Html msg
workDiv resumeData =
    div [ class "container desc" ]
        [ div [ class "row" ]
            (List.concat (List.indexedMap (\i data -> workRow data (i == 0)) resumeData.work))
        , br [] []
        , hr [] []
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

socialNetworkIconClass : String -> String
socialNetworkIconClass networkName =
    case String.toLower networkName of
    "twitter" -> "icon-twitter"
    s -> "icon-" ++ s

socialNetworkItem : Profile -> Html.Html msg
socialNetworkItem profile =
    a [ href profile.url ]
        [ i [ class <| socialNetworkIconClass <| profile.network ]
            []
        ]

footer : ResumeData -> Html.Html msg
footer resumeData =
    div [ id "footwrap", class "footer" ]
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
                        , text resumeData.location.address
                        , br [] []
                        , text (resumeData.location.city ++ ", " ++ resumeData.location.postalCode)
                        , br [] []
                        , text <|
                            case Countries.fromCode resumeData.location.countryCode of 
                                Just country -> country.name
                                Nothing -> resumeData.location.countryCode
                        , br []
                            []
                        ]
                    , p []
                        [ t []
                            [ text "Phone" ]
                        , br []
                            []
                        , a [ href ("tel:" ++ (toString (String.filter (\c -> Char.isDigit c) resumeData.phone))), class "tel" ]
                            [ text resumeData.phone ]
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
                        (List.map (\p -> socialNetworkItem p) resumeData.profiles)
                    ]
                ]
            ]
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
        , footer resumeData
        ]
