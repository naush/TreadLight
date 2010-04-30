overlay_display :players => 'button', :id => 'overlay_display'

top_display_panel do
  top_display do
      total_miles_label :text => "Total\nMiles", :id => 'total_miles_label'
      total_miles_value :text => '00.00', :id => 'total_miles_value'
      elapsed_time_label :text => "Elapsed\nTime", :id => 'elapsed_time_label'
      elapsed_time_value :text => '00:00:00', :id => 'elapsed_time_value'
      # small_dummy_button :id => 'small_dummy_button'
  end
end

display_panel do
  incline_display do
    incline_label :text => 'Incline'
    incline_value :text => '1.5%', :id => 'incline_value'
  end
  speed_display do
    speed_label :text => 'Speed'
    speed_value :text => '0.0', :id => 'speed_value'
  end
end

control_panel do
end

incline_input_box :players => 'text_box', :text => '0.0%', :id => 'incline_input_box'
speed_input_box :players => 'text_box', :text => '0.0', :id => 'speed_input_box'
reset_time_button :text => 'Reset', :id => 'reset_time_button'

incline_down_button :text => '<<', :id => 'incline_down_button'
incline_up_button :text => '>>', :id => 'incline_up_button'
speed_down_button :text => '<<', :id => 'speed_down_button'
speed_up_button :text => '>>', :id => 'speed_up_button'
large_dummy_button :id => 'large_dummy_button'
reset_incline_button :text => 'Reset', :id => 'reset_incline_button'
stop_button :text => 'Stop', :id => 'stop_button'
start_button :text => 'Start', :id => 'start_button'
