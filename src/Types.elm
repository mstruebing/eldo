module Types exposing (..)

---- ELM ----
---- OWN ----

import Lib.Board exposing (Board, empty)


initialModel : Model
initialModel =
    { board = empty
    , autosave = True
    }


type alias Model =
    { board : Board
    , autosave : Bool
    }


type Msg
    = NoOp
