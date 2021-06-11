module Msg exposing (..)

import Browser
import Router
import Url


type Msg
    = NoOp
    | RouteChanged Router.Route
    | ClickedLink Browser.UrlRequest
    | UrlChange Url.Url
