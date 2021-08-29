module MyJSON exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode exposing (..)



-- main


main =
    Browser.element { init = init, update = update, subscriptions = subscriptions, view = view }



-- model


type Model
    = Failure
    | Loading
    | Success String


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, getRandomGif )



-- update


type Msg
    = MorePlease
    | GotGif (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        MorePlease ->
            ( Loading, getRandomGif )

        GotGif result ->
            case result of
                Ok url ->
                    ( Success url, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- view


view : Model -> Html Msg
view model =
    div [] [ h2 [] [ text "Random Dogs" ], viewGif model ]


viewGif : Model -> Html Msg
viewGif model =
    case model of
        Failure ->
            div [] [ text "Gif could not be loaded", button [ onClick MorePlease ] [ text "Try again" ] ]

        Loading ->
            div [] [ text "Loading..." ]

        Success url ->
            div [] [ button [ onClick MorePlease, style "display" "block" ] [ text "More Please" ], img [ src url ] [] ]



-- HTTP


getRandomGif : Cmd Msg
getRandomGif =
    Http.get { url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=dog", expect = Http.expectJson GotGif gifDecoder }


gifDecoder : Decoder String
gifDecoder =
    field "data" (field "image_url" string)
