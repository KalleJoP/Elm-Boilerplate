module Router exposing (..)

{-|

    Dieses Modul ist für das Routing von der Anwendung zuständig.

-}

import Url
import Url.Builder as Builder
import Url.Parser as Parser exposing ((</>), (<?>))


type Route
    = Home
    | NotFound


routeParser : Parser.Parser (Route -> a) a
routeParser =
    Parser.oneOf
        [ Parser.map Home Parser.top
        ]


fromUrl : Url.Url -> Route
fromUrl url =
    case Parser.parse routeParser url of
        Nothing ->
            NotFound

        Just route ->
            route


routeToString : Route -> String
routeToString route =
    case route of
        Home ->
            Builder.absolute [ "" ] []

        NotFound ->
            Builder.absolute [ "404" ] []
