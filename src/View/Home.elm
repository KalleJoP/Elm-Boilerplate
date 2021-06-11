module View.Home exposing (..)

import Html exposing (div, text)
import Model
import Msg


view : Model.Model -> Html.Html Msg.Msg
view model =
    div [] [ text "HEY" ]
