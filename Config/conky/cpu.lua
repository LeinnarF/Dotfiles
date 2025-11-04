conky.config = {
  alignment = 'top_left',
  default_color = 'white',
  max_text_width = 0,
  minimum_width = 300,
  maximum_width = 300,
  own_window_transparent = true,
  update_interval = 1.0,
  double_buffer = true,
  own_window_type = 'override',
  use_xft = true,
  font = 'JetBrains Mono Nerd Font:size=12',
  own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',

}

conky.text = [[
${font2}  CPU${font}
$hr
CPU: ${alignr}${cpu cpu0}%
Frequency: ${alignr}${freq}MHz
${cpugraph}
${execpi 60 ~/.config/conky/cpu_bars.sh}

${font3}Name ${alignr}CPU${font}
${top name 1} ${alignr}${top cpu 1}%
${top name 2} ${alignr}${top cpu 2}%
${top name 3} ${alignr}${top cpu 3}%
${top name 4} ${alignr}${top cpu 4}%
${top name 5} ${alignr}${top cpu 5}%
]]