default_scene {
  background_color :gray
  horizontal_alignment :center
  vertical_alignment :center
  width "100%"
  height "100%"
}

panel {
  horizontal_alignment :center
  vertical_alignment :center
  rounded_corner_radius 5
}

top_display_panel {
  extends :panel
  background_color :silver
  transparency '15%'
  width "97%"
  height "20%"
  top_margin 5
  bottom_margin 2.5
}

display_panel {
  extends :panel
  background_color :silver
  transparency '15%'
  width "97%"
  height "50%"
  top_margin 2.5
  bottom_margin 5
}

control_panel {
  extends :panel
  background_color :black
  transparency '75%'
  width "100%"
  height "30%"
}

top_display {
  width "100%"
  height "90%"
  horizontal_alignment :left
  vertical_alignment :center
  right_margin 10
  top_margin 5
  bottom_margin 5
  left_margin 10
  rounded_corner_radius 15
}

display {
  width "50%"
  height "90%"
  background_color :silver
  horizontal_alignment :center
  vertical_alignment :center
  right_margin 10
  top_margin 5
  bottom_margin 5
  left_margin 10
  rounded_corner_radius 15
}

overlay_display {
  float :on
  x -5
  y -5
  width '410'
  height '300'
  background_color :alice_blue
  transparency '100%'
}

speed_display {
  extends :display
}

incline_display {
  extends :display
}

value {
  width "50%"
  height "100%"
  text_color :white
  font_size 28
  horizontal_alignment :center
  vertical_alignment :center
  left_margin 5
}

total_miles_value {
  height "100%"
  text_color :white
  font_size 20
  horizontal_alignment :center
  vertical_alignment :center
  left_margin 5
  right_margin 20
}

elapsed_time_value {
  height "100%"
  text_color :white
  font_size 20
  horizontal_alignment :center
  vertical_alignment :center
  left_margin 10
  right_margin 20
}

speed_value {
  extends :value
}

incline_value {
  extends :value
}

input_box{
  width 80
  height 40
  transparency '100%'
  float :on
}

incline_input_box {
  extends :input_box
  x '22%'
  y '37%'
}

speed_input_box {
  extends :input_box
  x '70%'
  y '37%'
}

label {
  horizontal_alignment :center
  right_margin 10
}

total_miles_label {
  extends :label
}

speed_label {
  extends :label
}

incline_label {
  extends :label
}

button {
  horizontal_alignment :center
  vertical_alignment :center
  rounded_corner_radius 5
  float :on
}

# small_button {
#   extends :button
#   width '14%'
#   height '80%'
#   left_margin 4
#   right_margin 4
# }
# 
# small_dummy_button {
#   extends :small_button
#   background_color :silver
#   transparency '15%'
# }

reset_time_button {
  # extends :small_button
  float :on
  x '85%'
  y '8%'
  width '10%'
  height '7%'
  rounded_corner_radius 5
  horizontal_alignment :center
  vertical_alignment :center
  background_color :blanched_almond
  hover {
    background_color :cornsilk
  }
}

large_button {
  extends :button
  width "25%"
  height "15%"
  right_margin 10
  top_margin 10
  bottom_margin 10
  left_margin 10
}

large_dummy_button {
  extends :large_button
  background_color :black
  transparency '85%'
  x '0%'
  y '85%'
}

start_button {
  extends :large_button
  background_color "66FF66"
  hover {
    background_color :green
  }
  x '75%'
  y '85%'
}

stop_button {
  extends :large_button
  background_color "FF9999"
  hover {
    background_color :red
  }
  x '50%'
  y '85%'
}

reset_incline_button {
  extends :large_button
  background_color "FFFF99"
  hover {
    background_color :yellow
  }
  x '25%'
  y '85%'
}

speed_up_button {
  extends :large_button
  background_color "87CEEB"
  hover {
    background_color :cyan
  }
  x '75%'
  y '70%'
}

speed_down_button {
  extends :large_button
  background_color "87CEEB"
  hover {
    background_color :cyan
  }
  x '50%'
  y '70%'
}

incline_up_button {
  extends :large_button
  background_color "87CEEB"
  hover {
    background_color :cyan
  }
  x '25%'
  y '70%'
}

incline_down_button {
  extends :large_button
  background_color "87CEEB"
  hover {
    background_color :cyan
  }
  x '0%'
  y '70%'
}
