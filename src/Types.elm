module Types exposing (..)


initialModel : Model
initialModel =
    { todoLists = []
    , autosave = True
    }


type alias Model =
    { todoLists : List TodoList
    , autosave : Bool
    }


type alias TodoList =
    { name : String
    , position : Int
    , items : List Todo
    }


type alias Todo =
    String


type Msg
    = NoOp
