module MyTextFields exposing (main)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- model


type alias Model =
    { content : String }


init : Model
init =
    { content = "" }



-- update


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change value ->
            { model | content = value }



-- view


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Start typing...", value model.content, onInput Change ] []
        , div [] [ text model.content ]
        ]



-- main


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }
