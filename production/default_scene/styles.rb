default_scene {
  background_color :gray
  horizontal_alignment :center
  vertical_alignment :center
  width "100%"
  height "100%"
}

display_panel {
  background_color :silver
  transparency '15%'
  horizontal_alignment :center
  vertical_alignment :center
  width "95%"
  height "60%"
  rounded_corner_radius 5
  top_margin 5
  bottom_margin 5
}

controll_panel {
  background_color :black
  transparency '75%'
  horizontal_alignment :center
  vertical_alignment :center
  width "100%"
  height "40%"
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

total_miles_display {
  extends :display
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
}

total_miles_value {
  extends :value
}

speed_value {
  extends :value
}

incline_value {
  extends :value
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

# devtool {
#   width "10%"
#   height "100%"
#   background_color :yellow
#   rounded_corner_radius 5
#   horizontal_alignment :center
#   vertical_alignment :center
# }

button {
  width "25%"
  height "50%"
  right_margin 10
  top_margin 10
  bottom_margin 10
  left_margin 10
  horizontal_alignment :center
  vertical_alignment :center
  rounded_corner_radius 5
}

start_button {
  extends :button
  background_color '#00FF7F'
}

stop_button {
  extends :button
  background_color :red
}

speed_up_button {
  extends :button
  background_color "#87CEEB"
  hover {
    background_color :cyan
  }
}

speed_down_button {
  extends :button
  background_color "#87CEEB"
  hover {
    background_color :cyan
  }
}

incline_up_button {
  extends :button
  background_color "#87CEEB"
  hover {
    background_color :cyan
  }
}

incline_down_button {
  extends :button
  background_color "#87CEEB"
  hover {
    background_color :cyan
  }
}
