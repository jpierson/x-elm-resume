module Html.Knommon exposing (..)

import Html exposing (node)

-- Not sure if these element types are valid or what they do
-- but they are used within the original example from knommon 
-- see https://github.com/knommon/resume/blob/6179c9dab05b292c4a81e157db27f6f22ad63768/index.html

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