data:extend({
    {
        type = "selection-tool",
        name = "ore-unlimited",
        icon = "__ore-unlimited__/graphics/ore-unlimited.png",
        icon_size = 32,
        subgroup = "tool",
        order = "c[automated-construction]-b[deconstruction-planner]-e",
        stack_size = 1,
        toggleable = false,
        show_in_library = false,
        select =
        {
            border_color = { r = 0, g = 1, b = 0 },
            mode = { "any-entity" },
            cursor_box_type = "pair"
        },
        alt_select =
        {
            border_color = { r = 0, g = 0, b = 1 },
            mode = { "any-entity" },
            cursor_box_type = "pair"
        },
        hidden = true,
        flags = {'only-in-cursor', 'not-stackable', 'spawnable'}
    },
    {
        type = 'shortcut',
        name = 'ore-unlimited',
        action = 'spawn-item',
        item_to_spawn = 'ore-unlimited',
        icon_size = 32,
        icon = "__ore-unlimited__/graphics/ore-unlimited.png",
        small_icon_size = 24,
        small_icon = "__ore-unlimited__/graphics/ore-unlimited.png",
        disabled_small_icon = "__ore-unlimited__/graphics/ore-unlimited.png"
    }
})