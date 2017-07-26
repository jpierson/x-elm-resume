module Html.Knommon exposing (..)

import Html exposing (node)

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