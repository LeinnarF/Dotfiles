local background_   = '#282a36'
local background2_  = '#44475a'
local foreground_   = '#f8f8f2'
local foreground2_  = '#6272a4'
local red_          = '#ff5555'
local pink_         = '#ff79c6'
local purple_       = '#bd93f9'
local cyan_         = '#8be9fd'
local green_        = '#50fa7b'
local yellow_       = '#f1fa8c'
local orange_       = '#ffb86c'


conky.config = {
    background = false,
    double_buffer = true,
    own_window = true,
    own_window_type = 'override',   
    own_window_transparent = true, 
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    alignment = 'top_middle',

    gap_y = 250,

    use_xft = true,
    font = 'JetBrainsMono :size=10',
    update_interval = 1.0,

    xftalpha = 0,
    uppercase = false,

    default_color = foreground,
    color1 = '#00FF00',

    draw_shades = false,
    draw_outline = false,

}

conky.text = [[
${font JetBrains Mono Nerd Font:size=80}${alignc}${time %H:%M}
${voffset -100}${font JetBrains Mono Nerd Font:size=18}${alignc}${time %A, %b %d %Y}
]]

