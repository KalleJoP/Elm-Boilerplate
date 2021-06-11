module Main exposing (main)

{-| Hallo Welt
-}

import Browser
import Html exposing (div, text)
import Model
import Msg exposing (Msg(..))
import Router
import Update
import Url
import View.Home


onUrlRequest : Browser.UrlRequest -> Msg.Msg
onUrlRequest req =
    Msg.ClickedLink req


onUrlChange : Url.Url -> Msg.Msg
onUrlChange url =
    Msg.UrlChange url



---- UPDATE ----
---- VIEW ----


view : Model.Model -> Browser.Document Msg.Msg
view model =
    { title = "Your Title"
    , body =
        [ div []
            [ case model.activeRoute of
                Router.Home ->
                    View.Home.view model

                Router.NotFound ->
                    text "Notfound"
            ]
        ]
    }



---- PROGRAM ----


{-| Main Function
-}
main : Program () Model.Model Msg.Msg
main =
    Browser.application
        { view = view
        , init = Model.init
        , update = Update.update
        , subscriptions = subscriptions
        , onUrlChange = onUrlChange
        , onUrlRequest = onUrlRequest
        }



---- SUBSCRIPTIONS ----


subscriptions : Model.Model -> Sub Msg.Msg
subscriptions _ =
    Sub.none
