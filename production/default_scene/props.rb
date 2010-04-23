display_panel do
  total_miles_display do
      total_miles_label :text => 'Total Miles'
      total_miles_value :text => '7.6', :id => 'total_miles_value'
  end
end

display_panel do
  incline_display do
    incline_label :text => 'Incline'
    incline_value :text => '0.0%', :id => 'incline_value'
  end
  speed_display do
    speed_label :text => 'Speed'
    speed_value :text => '0.0', :id => 'speed_value'
  end
end

controll_panel do
  incline_down_button :text => '<<', :id => 'incline_down_button'
  incline_up_button :text => '>>', :id => 'incline_up_button'
  speed_down_button :text => '<<', :id => 'speed_down_button'
  speed_up_button :text => '>>', :id => 'speed_up_button'
  stop_button :text => 'Stop', :id => 'stop_button'
  start_button :text => 'Start', :id => 'start_button'
end