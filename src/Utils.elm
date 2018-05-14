module Utils exposing (maybeHelper)


maybeHelper : (a -> b) -> Maybe a -> a -> b
maybeHelper func maybeThingy neutral =
    case maybeThingy of
        Just thingy ->
            func thingy

        Nothing ->
            func neutral
