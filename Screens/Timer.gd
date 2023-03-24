extends Label

var time = 21
var timer_on=true
var OutSound = preload("res://Assets/Out_Of_Time_Klaxon.mp3")

func _process(delta):
 if (timer_on==true):
  time -= delta
  var secs = fmod(time, 60)
  var time_passed="%02d" % [secs]
  text = time_passed# + var2str(time)
 if (time <= 0):
  timer_on=false
  get_tree().change_scene("res://Screens/GameOverScreen.tscn")
pass
