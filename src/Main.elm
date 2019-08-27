module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Regex as Regex


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }


init : Model
init =
    Model "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain password ->
            { model | passwordAgain = password }



-- VIEW


view : Model -> Html Msg
view model =
    let
        { name, password, passwordAgain } =
            model
    in
    div []
        [ viewInput "text" "Name" name Name
        , viewInput "text" "Password" password Password
        , viewInput "text" "PasswordAgain" passwordAgain PasswordAgain
        , viewValidation model
        ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
    if model.password == model.passwordAgain then
        div [ style "color" "green" ] [ text "OK" ]

    else if String.length model.password < 8 then
        div [ style "color" "red" ] [ text "Password min length is eight!" ]

    else if not (Regex.contains regexNumber model.password) then
        div [ style "color" "red" ] [ text "Password must contain number" ]

    else
        div [ style "color" "red" ] [ text "Password do not match!" ]


regexNumber : Regex.Regex
regexNumber =
    Maybe.withDefault Regex.never <|
        Regex.fromString "[0-9]"



-- regexNumber : Regex.Regex
-- regexNumber =
--   Maybe.withDefault Regex.never <|
--     Regex.fromString "[0-9]"
