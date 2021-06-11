module Update exposing (..)

import Browser
import Browser.Navigation as Nav
import Model
import Msg
import Router
import Url


update : Msg.Msg -> Model.Model -> ( Model.Model, Cmd Msg.Msg )
update msg model =
    case msg of
        Msg.NoOp ->
            ( model, Cmd.none )

        Msg.ClickedLink req ->
            case req of
                Browser.Internal url ->
                    --(Url.toString url)
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External url ->
                    ( model, Nav.load url )

        Msg.UrlChange url ->
            ( { model | activeRoute = Router.fromUrl url }, Cmd.none )

        Msg.RouteChanged route ->
            ( { model | activeRoute = route }, Cmd.none )
