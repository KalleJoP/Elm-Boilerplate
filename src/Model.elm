module Model exposing (..)

import Browser.Navigation as Nav
import Msg
import Router
import Url


type alias Model =
    { activeRoute : Router.Route
    , key : Nav.Key
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg.Msg )
init _ url key =
    ( { activeRoute = Router.fromUrl url
      , key = key
      }
    , Cmd.none
    )
