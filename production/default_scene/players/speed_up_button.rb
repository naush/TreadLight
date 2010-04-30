module SpeedUpButton
  def mouse_clicked(event)
    scene.start_timer
    scene.speed_up
  end
end