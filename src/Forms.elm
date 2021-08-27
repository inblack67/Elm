module Forms exposing (main)

import Browser exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- main


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- model


type alias Model =
    { name : String, password : String, password2 : String }


init : Model
init =
    Model "" "" ""



-- update


type Msg
    = MName String
    | MPassword String
    | MPassword2 String


update : Msg -> Model -> Model
update msg model =
    case msg of
        MName name ->
            { model | name = name }

        MPassword password ->
            { model | password = password }

        MPassword2 password2 ->
            { model | password2 = password2 }



-- view


view : Model -> Html Msg
view model =
    div [] [ makeInput "text" "Name" model.name MName, makeInput "text" "Password" model.password MPassword, makeInput "text" "Confirm Password" model.password2 MPassword2, inputValidator model ]


makeInput : String -> String -> String -> (String -> Msg) -> Html Msg
makeInput inputType inputPlaceholder inputValue onChange =
    input [ type_ inputType, placeholder inputPlaceholder, value inputValue, onInput onChange ] []


inputValidator : Model -> Html Msg
inputValidator model =
    if model.password == model.password2 then
        div [ style "color" "green" ] [ text "Ok" ]

    else
        div [ style "color" "red" ] [ text "Passwords do not match" ]
