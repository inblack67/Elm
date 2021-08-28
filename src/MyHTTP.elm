module MyHTTP exposing (..)

import Browser
import Html exposing (..)
import Http


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- model


type Model
    = Failure
    | Loading
    | Success String


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, Http.get { url = "https://elm-lang.org/assets/public-opinion.txt", expect = Http.expectString GotText } )



-- update


type Msg
    = GotText (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        GotText result ->
            case result of
                Ok data ->
                    ( Success data, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- view


view : Model -> Html Msg
view model =
    case model of
        Failure ->
            text "Server Error"

        Loading ->
            text "Loading..."

        Success data ->
            pre [] [ text data ]
