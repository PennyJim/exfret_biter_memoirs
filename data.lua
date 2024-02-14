data.raw["flying-text"]["biter-name"] = {
    name = "biter-name",
    type = "flying-text",
    flags = {
        "not-on-map",
        "placeable-off-grid"
    },
    speed = 0,
    time_to_live = 2
}

data:extend({
    {
        type = "custom-input",
        name = "show-biter-info",
        key_sequence = "I",
        action = "lua",
        include_selected_prototype = true
    }
})