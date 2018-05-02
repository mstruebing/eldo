module Types exposing (..)


initialModel : Model
initialModel =
    { todoLists = initialLists
    , autosave = True
    }


initialLists =
    [ { name = "Todo"
      , position = 0
      , items = []
      }
    , { name = "Doing"
      , position = 1
      , items = []
      }
    , { name = "Done"
      , position = 2
      , items = []
      }
    ]


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
    | AddTodo Int String
