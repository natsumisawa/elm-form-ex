module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


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
    main_
        []
        [ section []
            [ h1 [] [ text "Elm official..." ]
            , ul []
                [ li []
                    [ a [ href "https://elm-lang.org", target "_blank" ]
                        [ text "Elm - A delightful language for reliable webapps" ]
                    ]
                , li []
                    [ a [ href "https://guide.elm-lang.org", target "_blank" ]
                        [ text "Introduction · An Introduction to Elm" ]
                    ]
                ]
            ]
        , section []
            [ h1 [] [ text "Community in Japan" ]
            , ul []
                [ li []
                    [ a [ href "https://elm-lang.jp", target "_blank" ]
                        [ text "Elm-jp" ]
                    ]
                , li []
                    [ a [ href "https://guide.elm-lang.jp", target "_blank" ]
                        [ text "はじめに · An Introduction to Elm" ]
                    ]
                , li []
                    [ a [ href "http://jinjor-labo.hatenablog.com/entry/2019/02/26/112019", target "_blank" ]
                        [ text "『基礎からわかる Elm』（Author's post）" ]
                    ]
                ]
            ]

        -- , img [ src "./assets/images/Elm_logo.png" ] []
        ]
