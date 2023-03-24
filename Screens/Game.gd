extends Control

var Button50=true
var ButtonAsk=true
var ButtonQ=true
var score = 1
var CorrectSound = preload("res://Assets/CorrectAnswerSound.mp3")
var WrongSound = preload("res://Assets/WrongAnswerSound.mp3")
var ThemeSound = preload("res://Assets/SoundTrack2.mp3")
var dict = {}
var path="res://questions.json"
var A = "a"
var B = "b"
var C = "c"
var D = "d"
var arrayq = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]

func _ready():
 if (Button50 == true): get_node("5050Button").disabled=false
 else: get_node("5050Button").disabled=true
 if (ButtonAsk == true): get_node("AskFriendButton").disabled=false
 else: get_node("AskFriendButton").disabled=true
 if (ButtonQ == true): get_node("SwitchQuestionButton").disabled=false
 else: get_node("SwitchQuestionButton").disabled=true
 get_node("GoodBad").texture= load ("res://Assets/trasnparent.png")
 get_node("ButtonA").disabled=false
 get_node("ButtonB").disabled=false
 get_node("ButtonC").disabled=false
 get_node("ButtonD").disabled=false
 get_node("Timer").time=21
 get_node("Timer").timer_on=true
 if (score == 16):
  get_tree().change_scene("res://Screens/WinScreen.tscn")
 $AudioStreamPlayer.stream = ThemeSound
 $AudioStreamPlayer.play()
 if (score == 0):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/NoMoney.png")
 if (score == 1):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/1.png")
 if (score == 2):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/2.png")
 if (score == 3):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/3.png")
 if (score == 4):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/4.png")
 if (score == 5):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/5.png")
 if (score == 6):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/6.png")
 if (score == 7):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/7.png")
 if (score == 8):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/8.png")
 if (score == 9):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/9.png")
 if (score == 10):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/10.png")
 if (score == 11):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/11.png")
 if (score == 12):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/12.png")
 if (score == 13):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/13.png")
 if (score == 14):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/14.png")
 if (score == 15):
  get_node("MoneyTree").texture = load("res://Assets/MoneyTree/15.png")

 var file = File.new()
 file.open(path, file.READ)
 var text = file.get_as_text()
 dict = parse_json(text)
 file.close()
 var randomNumber1 = get_random_number()
 var randomNumber2 = get_random_number()
 while (randomNumber2 == randomNumber1): randomNumber2 = get_random_number()
 while (arrayq[randomNumber1] == 1):
  if (randomNumber1 + randomNumber2 > 118):
   if (randomNumber1 > randomNumber2):
	   randomNumber1 = randomNumber1 - randomNumber2
   else:
	   randomNumber1 = randomNumber2 - randomNumber1 
  else:
   randomNumber1 = randomNumber1 + randomNumber2
 _question_select(randomNumber1)
 

func _question_select(var a):
 if (a == 1):
  get_node("Question").set_text(dict["1"]["question"])
  get_node("ButtonA").set_text(dict["1"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["1"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["1"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["1"]["choices"]["d"])
  if (dict["1"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["1"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["1"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["1"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1
  
 if (a == 2):
  get_node("Question").set_text(dict["2"]["question"])
  get_node("ButtonA").set_text(dict["2"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["2"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["2"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["2"]["choices"]["d"])
  if (dict["2"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["2"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["2"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["2"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 3):
  get_node("Question").set_text(dict["3"]["question"])
  get_node("ButtonA").set_text(dict["3"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["3"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["3"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["3"]["choices"]["d"])
  if (dict["3"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["3"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["3"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["3"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 4):
  get_node("Question").set_text(dict["4"]["question"])
  get_node("ButtonA").set_text(dict["4"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["4"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["4"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["4"]["choices"]["d"])
  if (dict["4"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["4"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["4"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["4"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 5):
  get_node("Question").set_text(dict["5"]["question"])
  get_node("ButtonA").set_text(dict["5"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["5"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["5"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["5"]["choices"]["d"])
  if (dict["5"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["5"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["5"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["5"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 6):
  get_node("Question").set_text(dict["6"]["question"])
  get_node("ButtonA").set_text(dict["6"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["6"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["6"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["6"]["choices"]["d"])
  if (dict["6"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["6"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["6"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["6"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 7):
  get_node("Question").set_text(dict["7"]["question"])
  get_node("ButtonA").set_text(dict["7"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["7"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["7"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["7"]["choices"]["d"])
  if (dict["7"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["7"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["7"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["7"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 8):
  get_node("Question").set_text(dict["8"]["question"])
  get_node("ButtonA").set_text(dict["8"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["8"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["8"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["8"]["choices"]["d"])
  if (dict["8"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["8"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["8"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["8"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 9):
  get_node("Question").set_text(dict["9"]["question"])
  get_node("ButtonA").set_text(dict["9"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["9"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["9"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["9"]["choices"]["d"])
  if (dict["9"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["9"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["9"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["9"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 10):
  get_node("Question").set_text(dict["10"]["question"])
  get_node("ButtonA").set_text(dict["10"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["10"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["10"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["10"]["choices"]["d"])
  if (dict["10"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["10"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["10"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["10"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 11):
  get_node("Question").set_text(dict["11"]["question"])
  get_node("ButtonA").set_text(dict["11"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["11"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["11"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["11"]["choices"]["d"])
  if (dict["11"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["11"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["11"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["11"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 12):
  get_node("Question").set_text(dict["12"]["question"])
  get_node("ButtonA").set_text(dict["12"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["12"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["12"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["12"]["choices"]["d"])
  if (dict["12"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["12"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["12"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["12"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 13):
  get_node("Question").set_text(dict["13"]["question"])
  get_node("ButtonA").set_text(dict["13"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["13"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["13"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["13"]["choices"]["d"])
  if (dict["13"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["13"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["13"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["13"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 14):
  get_node("Question").set_text(dict["14"]["question"])
  get_node("ButtonA").set_text(dict["14"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["14"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["14"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["14"]["choices"]["d"])
  if (dict["14"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["14"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["14"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["14"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 15):
  get_node("Question").set_text(dict["15"]["question"])
  get_node("ButtonA").set_text(dict["15"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["15"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["15"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["15"]["choices"]["d"])
  if (dict["15"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["15"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["15"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["15"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 16):
  get_node("Question").set_text(dict["16"]["question"])
  get_node("ButtonA").set_text(dict["16"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["16"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["16"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["16"]["choices"]["d"])
  if (dict["16"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["16"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["16"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["16"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 17):
  get_node("Question").set_text(dict["17"]["question"])
  get_node("ButtonA").set_text(dict["17"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["17"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["17"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["17"]["choices"]["d"])
  if (dict["17"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["17"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["17"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["17"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 18):
  get_node("Question").set_text(dict["18"]["question"])
  get_node("ButtonA").set_text(dict["18"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["18"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["18"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["18"]["choices"]["d"])
  if (dict["18"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["18"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["18"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["18"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 19):
  get_node("Question").set_text(dict["19"]["question"])
  get_node("ButtonA").set_text(dict["19"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["19"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["19"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["19"]["choices"]["d"])
  if (dict["19"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["19"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["19"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["19"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 20):
  get_node("Question").set_text(dict["20"]["question"])
  get_node("ButtonA").set_text(dict["20"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["20"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["20"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["20"]["choices"]["d"])
  if (dict["20"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["20"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["20"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["20"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 21):
  get_node("Question").set_text(dict["21"]["question"])
  get_node("ButtonA").set_text(dict["21"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["21"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["21"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["21"]["choices"]["d"])
  if (dict["21"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["21"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["21"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["21"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 22):
  get_node("Question").set_text(dict["22"]["question"])
  get_node("ButtonA").set_text(dict["22"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["22"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["22"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["22"]["choices"]["d"])
  if (dict["22"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["22"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["22"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["22"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 23):
  get_node("Question").set_text(dict["23"]["question"])
  get_node("ButtonA").set_text(dict["23"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["23"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["23"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["23"]["choices"]["d"])
  if (dict["23"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["23"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["23"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["23"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 24):
  get_node("Question").set_text(dict["24"]["question"])
  get_node("ButtonA").set_text(dict["24"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["24"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["24"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["24"]["choices"]["d"])
  if (dict["24"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["24"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["24"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["24"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 25):
  get_node("Question").set_text(dict["25"]["question"])
  get_node("ButtonA").set_text(dict["25"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["25"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["25"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["25"]["choices"]["d"])
  if (dict["25"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["25"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["25"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["25"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 26):
  get_node("Question").set_text(dict["26"]["question"])
  get_node("ButtonA").set_text(dict["26"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["26"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["26"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["26"]["choices"]["d"])
  if (dict["26"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["26"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["26"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["26"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 27):
  get_node("Question").set_text(dict["27"]["question"])
  get_node("ButtonA").set_text(dict["27"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["27"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["27"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["27"]["choices"]["d"])
  if (dict["27"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["27"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["27"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["27"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 28):
  get_node("Question").set_text(dict["28"]["question"])
  get_node("ButtonA").set_text(dict["28"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["28"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["28"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["28"]["choices"]["d"])
  if (dict["28"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["28"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["28"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["28"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 29):
  get_node("Question").set_text(dict["29"]["question"])
  get_node("ButtonA").set_text(dict["29"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["29"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["29"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["29"]["choices"]["d"])
  if (dict["29"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["29"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["29"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["29"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 30):
  get_node("Question").set_text(dict["30"]["question"])
  get_node("ButtonA").set_text(dict["30"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["30"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["30"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["30"]["choices"]["d"])
  if (dict["30"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["30"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["30"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["30"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 31):
  get_node("Question").set_text(dict["31"]["question"])
  get_node("ButtonA").set_text(dict["31"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["31"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["31"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["31"]["choices"]["d"])
  if (dict["31"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["31"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["31"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["31"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 32):
  get_node("Question").set_text(dict["32"]["question"])
  get_node("ButtonA").set_text(dict["32"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["32"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["32"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["32"]["choices"]["d"])
  if (dict["32"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["32"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["32"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["32"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 33):
  get_node("Question").set_text(dict["33"]["question"])
  get_node("ButtonA").set_text(dict["33"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["33"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["33"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["33"]["choices"]["d"])
  if (dict["33"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["33"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["33"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["33"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 34):
  get_node("Question").set_text(dict["34"]["question"])
  get_node("ButtonA").set_text(dict["34"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["34"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["34"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["34"]["choices"]["d"])
  if (dict["34"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["34"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["34"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["34"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 35):
  get_node("Question").set_text(dict["35"]["question"])
  get_node("ButtonA").set_text(dict["35"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["35"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["35"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["35"]["choices"]["d"])
  if (dict["35"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["35"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["35"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["35"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 36):
  get_node("Question").set_text(dict["36"]["question"])
  get_node("ButtonA").set_text(dict["36"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["36"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["36"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["36"]["choices"]["d"])
  if (dict["36"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["36"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["36"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["36"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 37):
  get_node("Question").set_text(dict["37"]["question"])
  get_node("ButtonA").set_text(dict["37"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["37"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["37"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["37"]["choices"]["d"])
  if (dict["37"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["37"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["37"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["37"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 38):
  get_node("Question").set_text(dict["38"]["question"])
  get_node("ButtonA").set_text(dict["38"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["38"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["38"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["38"]["choices"]["d"])
  if (dict["38"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["38"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["38"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["38"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 39):
  get_node("Question").set_text(dict["39"]["question"])
  get_node("ButtonA").set_text(dict["39"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["39"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["39"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["39"]["choices"]["d"])
  if (dict["39"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["39"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["39"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["39"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 40):
  get_node("Question").set_text(dict["40"]["question"])
  get_node("ButtonA").set_text(dict["40"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["40"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["40"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["40"]["choices"]["d"])
  if (dict["40"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["40"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["40"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["40"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 41):
  get_node("Question").set_text(dict["41"]["question"])
  get_node("ButtonA").set_text(dict["41"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["41"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["41"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["41"]["choices"]["d"])
  if (dict["41"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["41"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["41"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["41"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 42):
  get_node("Question").set_text(dict["42"]["question"])
  get_node("ButtonA").set_text(dict["42"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["42"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["42"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["42"]["choices"]["d"])
  if (dict["42"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["42"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["42"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["42"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 43):
  get_node("Question").set_text(dict["43"]["question"])
  get_node("ButtonA").set_text(dict["43"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["43"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["43"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["43"]["choices"]["d"])
  if (dict["43"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["43"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["43"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["43"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 44):
  get_node("Question").set_text(dict["44"]["question"])
  get_node("ButtonA").set_text(dict["44"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["44"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["44"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["44"]["choices"]["d"])
  if (dict["44"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["44"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["44"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["44"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 45):
  get_node("Question").set_text(dict["45"]["question"])
  get_node("ButtonA").set_text(dict["45"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["45"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["45"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["45"]["choices"]["d"])
  if (dict["45"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["45"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["45"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["45"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 46):
  get_node("Question").set_text(dict["46"]["question"])
  get_node("ButtonA").set_text(dict["46"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["46"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["46"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["46"]["choices"]["d"])
  if (dict["46"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["46"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["46"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["46"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 47):
  get_node("Question").set_text(dict["47"]["question"])
  get_node("ButtonA").set_text(dict["47"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["47"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["47"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["47"]["choices"]["d"])
  if (dict["47"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["47"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["47"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["47"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 48):
  get_node("Question").set_text(dict["48"]["question"])
  get_node("ButtonA").set_text(dict["48"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["48"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["48"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["48"]["choices"]["d"])
  if (dict["48"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["48"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["48"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["48"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 49):
  get_node("Question").set_text(dict["49"]["question"])
  get_node("ButtonA").set_text(dict["49"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["49"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["49"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["49"]["choices"]["d"])
  if (dict["49"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["49"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["49"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["49"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 50):
  get_node("Question").set_text(dict["50"]["question"])
  get_node("ButtonA").set_text(dict["50"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["50"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["50"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["50"]["choices"]["d"])
  if (dict["50"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["50"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["50"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["50"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 51):
  get_node("Question").set_text(dict["51"]["question"])
  get_node("ButtonA").set_text(dict["51"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["51"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["51"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["51"]["choices"]["d"])
  if (dict["51"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["51"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["51"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["51"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 52):
  get_node("Question").set_text(dict["52"]["question"])
  get_node("ButtonA").set_text(dict["52"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["52"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["52"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["52"]["choices"]["d"])
  if (dict["52"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["52"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["52"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["52"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 53):
  get_node("Question").set_text(dict["53"]["question"])
  get_node("ButtonA").set_text(dict["53"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["53"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["53"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["53"]["choices"]["d"])
  if (dict["53"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["53"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["53"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["53"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 54):
  get_node("Question").set_text(dict["54"]["question"])
  get_node("ButtonA").set_text(dict["54"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["54"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["54"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["54"]["choices"]["d"])
  if (dict["54"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["54"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["54"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["54"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 55):
  get_node("Question").set_text(dict["55"]["question"])
  get_node("ButtonA").set_text(dict["55"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["55"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["55"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["55"]["choices"]["d"])
  if (dict["55"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["55"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["55"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["55"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 56):
  get_node("Question").set_text(dict["56"]["question"])
  get_node("ButtonA").set_text(dict["56"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["56"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["56"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["56"]["choices"]["d"])
  if (dict["56"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["56"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["56"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["56"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 57):
  get_node("Question").set_text(dict["57"]["question"])
  get_node("ButtonA").set_text(dict["57"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["57"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["57"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["57"]["choices"]["d"])
  if (dict["57"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["57"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["57"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["57"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 58):
  get_node("Question").set_text(dict["58"]["question"])
  get_node("ButtonA").set_text(dict["58"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["58"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["58"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["58"]["choices"]["d"])
  if (dict["58"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["58"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["58"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["58"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 59):
  get_node("Question").set_text(dict["59"]["question"])
  get_node("ButtonA").set_text(dict["59"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["59"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["59"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["59"]["choices"]["d"])
  if (dict["59"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["59"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["59"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["59"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 60):
  get_node("Question").set_text(dict["60"]["question"])
  get_node("ButtonA").set_text(dict["60"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["60"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["60"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["60"]["choices"]["d"])
  if (dict["60"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["60"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["60"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["60"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 61):
  get_node("Question").set_text(dict["61"]["question"])
  get_node("ButtonA").set_text(dict["61"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["61"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["61"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["61"]["choices"]["d"])
  if (dict["61"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["61"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["61"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["61"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 62):
  get_node("Question").set_text(dict["62"]["question"])
  get_node("ButtonA").set_text(dict["62"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["62"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["62"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["62"]["choices"]["d"])
  if (dict["62"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["62"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["62"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["62"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 63):
  get_node("Question").set_text(dict["63"]["question"])
  get_node("ButtonA").set_text(dict["63"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["63"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["63"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["63"]["choices"]["d"])
  if (dict["63"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["63"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["63"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["63"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 64):
  get_node("Question").set_text(dict["64"]["question"])
  get_node("ButtonA").set_text(dict["64"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["64"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["64"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["64"]["choices"]["d"])
  if (dict["64"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["64"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["64"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["64"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 65):
  get_node("Question").set_text(dict["65"]["question"])
  get_node("ButtonA").set_text(dict["65"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["65"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["65"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["65"]["choices"]["d"])
  if (dict["65"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["65"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["65"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["65"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 66):
  get_node("Question").set_text(dict["66"]["question"])
  get_node("ButtonA").set_text(dict["66"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["66"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["66"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["66"]["choices"]["d"])
  if (dict["66"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["66"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["66"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["66"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 67):
  get_node("Question").set_text(dict["67"]["question"])
  get_node("ButtonA").set_text(dict["67"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["67"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["67"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["67"]["choices"]["d"])
  if (dict["67"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["67"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["67"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["67"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 68):
  get_node("Question").set_text(dict["68"]["question"])
  get_node("ButtonA").set_text(dict["68"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["68"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["68"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["68"]["choices"]["d"])
  if (dict["68"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["68"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["68"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["68"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 69):
  get_node("Question").set_text(dict["69"]["question"])
  get_node("ButtonA").set_text(dict["69"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["69"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["69"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["69"]["choices"]["d"])
  if (dict["69"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["69"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["69"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["69"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 70):
  get_node("Question").set_text(dict["70"]["question"])
  get_node("ButtonA").set_text(dict["70"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["70"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["70"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["70"]["choices"]["d"])
  if (dict["70"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["70"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["70"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["70"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 71):
  get_node("Question").set_text(dict["71"]["question"])
  get_node("ButtonA").set_text(dict["71"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["71"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["71"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["71"]["choices"]["d"])
  if (dict["71"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["71"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["71"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["71"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 72):
  get_node("Question").set_text(dict["72"]["question"])
  get_node("ButtonA").set_text(dict["72"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["72"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["72"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["72"]["choices"]["d"])
  if (dict["72"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["72"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["72"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["72"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 73):
  get_node("Question").set_text(dict["73"]["question"])
  get_node("ButtonA").set_text(dict["73"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["73"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["73"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["73"]["choices"]["d"])
  if (dict["73"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["73"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["73"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["73"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 74):
  get_node("Question").set_text(dict["74"]["question"])
  get_node("ButtonA").set_text(dict["74"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["74"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["74"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["74"]["choices"]["d"])
  if (dict["74"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["74"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["74"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["74"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 75):
  get_node("Question").set_text(dict["75"]["question"])
  get_node("ButtonA").set_text(dict["75"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["75"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["75"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["75"]["choices"]["d"])
  if (dict["75"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["75"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["75"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["75"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 76):
  get_node("Question").set_text(dict["76"]["question"])
  get_node("ButtonA").set_text(dict["76"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["76"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["76"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["76"]["choices"]["d"])
  if (dict["76"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["76"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["76"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["76"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 77):
  get_node("Question").set_text(dict["77"]["question"])
  get_node("ButtonA").set_text(dict["77"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["77"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["77"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["77"]["choices"]["d"])
  if (dict["77"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["77"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["77"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["77"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 78):
  get_node("Question").set_text(dict["78"]["question"])
  get_node("ButtonA").set_text(dict["78"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["78"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["78"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["78"]["choices"]["d"])
  if (dict["78"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["78"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["78"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["78"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 79):
  get_node("Question").set_text(dict["79"]["question"])
  get_node("ButtonA").set_text(dict["79"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["79"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["79"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["79"]["choices"]["d"])
  if (dict["79"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["79"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["79"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["79"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 80):
  get_node("Question").set_text(dict["80"]["question"])
  get_node("ButtonA").set_text(dict["80"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["80"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["80"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["80"]["choices"]["d"])
  if (dict["80"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["80"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["80"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["80"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 81):
  get_node("Question").set_text(dict["81"]["question"])
  get_node("ButtonA").set_text(dict["81"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["81"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["81"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["81"]["choices"]["d"])
  if (dict["81"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["81"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["81"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["81"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 82):
  get_node("Question").set_text(dict["82"]["question"])
  get_node("ButtonA").set_text(dict["82"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["82"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["82"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["82"]["choices"]["d"])
  if (dict["82"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["82"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["82"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["82"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 83):
  get_node("Question").set_text(dict["83"]["question"])
  get_node("ButtonA").set_text(dict["83"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["83"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["83"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["83"]["choices"]["d"])
  if (dict["83"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["83"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["83"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["83"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 84):
  get_node("Question").set_text(dict["84"]["question"])
  get_node("ButtonA").set_text(dict["84"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["84"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["84"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["84"]["choices"]["d"])
  if (dict["84"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["84"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["84"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["84"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 85):
  get_node("Question").set_text(dict["85"]["question"])
  get_node("ButtonA").set_text(dict["85"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["85"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["85"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["85"]["choices"]["d"])
  if (dict["85"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["85"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["85"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["85"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 86):
  get_node("Question").set_text(dict["86"]["question"])
  get_node("ButtonA").set_text(dict["86"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["86"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["86"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["86"]["choices"]["d"])
  if (dict["86"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["86"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["86"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["86"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 87):
  get_node("Question").set_text(dict["87"]["question"])
  get_node("ButtonA").set_text(dict["87"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["87"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["87"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["87"]["choices"]["d"])
  if (dict["87"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["87"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["87"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["87"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 88):
  get_node("Question").set_text(dict["88"]["question"])
  get_node("ButtonA").set_text(dict["88"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["88"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["88"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["88"]["choices"]["d"])
  if (dict["88"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["88"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["88"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["88"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 89):
  get_node("Question").set_text(dict["89"]["question"])
  get_node("ButtonA").set_text(dict["89"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["89"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["89"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["89"]["choices"]["d"])
  if (dict["89"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["89"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["89"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["89"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 90):
  get_node("Question").set_text(dict["90"]["question"])
  get_node("ButtonA").set_text(dict["90"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["90"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["90"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["90"]["choices"]["d"])
  if (dict["90"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["90"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["90"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["90"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 91):
  get_node("Question").set_text(dict["91"]["question"])
  get_node("ButtonA").set_text(dict["91"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["91"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["91"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["91"]["choices"]["d"])
  if (dict["91"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["91"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["91"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["91"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 92):
  get_node("Question").set_text(dict["92"]["question"])
  get_node("ButtonA").set_text(dict["92"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["92"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["92"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["92"]["choices"]["d"])
  if (dict["92"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["92"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["92"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["92"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 93):
  get_node("Question").set_text(dict["93"]["question"])
  get_node("ButtonA").set_text(dict["93"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["93"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["93"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["93"]["choices"]["d"])
  if (dict["93"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["93"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["93"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["93"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 94):
  get_node("Question").set_text(dict["94"]["question"])
  get_node("ButtonA").set_text(dict["94"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["94"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["94"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["94"]["choices"]["d"])
  if (dict["94"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["94"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["94"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["94"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 95):
  get_node("Question").set_text(dict["95"]["question"])
  get_node("ButtonA").set_text(dict["95"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["95"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["95"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["95"]["choices"]["d"])
  if (dict["95"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["95"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["95"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["95"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 96):
  get_node("Question").set_text(dict["96"]["question"])
  get_node("ButtonA").set_text(dict["96"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["96"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["96"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["96"]["choices"]["d"])
  if (dict["96"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["96"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["96"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["96"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 97):
  get_node("Question").set_text(dict["97"]["question"])
  get_node("ButtonA").set_text(dict["97"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["97"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["97"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["97"]["choices"]["d"])
  if (dict["97"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["97"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["97"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["97"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 98):
  get_node("Question").set_text(dict["98"]["question"])
  get_node("ButtonA").set_text(dict["98"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["98"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["98"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["98"]["choices"]["d"])
  if (dict["98"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["98"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["98"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["98"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 99):
  get_node("Question").set_text(dict["99"]["question"])
  get_node("ButtonA").set_text(dict["99"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["99"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["99"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["99"]["choices"]["d"])
  if (dict["99"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["99"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["99"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["99"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 100):
  get_node("Question").set_text(dict["100"]["question"])
  get_node("ButtonA").set_text(dict["100"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["100"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["100"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["100"]["choices"]["d"])
  if (dict["100"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["100"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["100"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["100"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 101):
  get_node("Question").set_text(dict["101"]["question"])
  get_node("ButtonA").set_text(dict["101"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["101"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["101"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["101"]["choices"]["d"])
  if (dict["101"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["101"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["101"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["101"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 102):
  get_node("Question").set_text(dict["102"]["question"])
  get_node("ButtonA").set_text(dict["102"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["102"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["102"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["102"]["choices"]["d"])
  if (dict["102"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["102"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["102"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["102"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 103):
  get_node("Question").set_text(dict["103"]["question"])
  get_node("ButtonA").set_text(dict["103"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["103"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["103"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["103"]["choices"]["d"])
  if (dict["103"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["103"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["103"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["103"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 104):
  get_node("Question").set_text(dict["104"]["question"])
  get_node("ButtonA").set_text(dict["104"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["104"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["104"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["104"]["choices"]["d"])
  if (dict["104"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["104"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["104"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["104"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 105):
  get_node("Question").set_text(dict["105"]["question"])
  get_node("ButtonA").set_text(dict["105"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["105"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["105"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["105"]["choices"]["d"])
  if (dict["105"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["105"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["105"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["105"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 106):
  get_node("Question").set_text(dict["106"]["question"])
  get_node("ButtonA").set_text(dict["106"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["106"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["106"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["106"]["choices"]["d"])
  if (dict["106"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["106"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["106"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["106"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 107):
  get_node("Question").set_text(dict["107"]["question"])
  get_node("ButtonA").set_text(dict["107"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["107"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["107"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["107"]["choices"]["d"])
  if (dict["107"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["107"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["107"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["107"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 108):
  get_node("Question").set_text(dict["108"]["question"])
  get_node("ButtonA").set_text(dict["108"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["108"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["108"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["108"]["choices"]["d"])
  if (dict["108"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["108"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["108"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["108"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 109):
  get_node("Question").set_text(dict["109"]["question"])
  get_node("ButtonA").set_text(dict["109"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["109"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["109"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["109"]["choices"]["d"])
  if (dict["109"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["109"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["109"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["109"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 110):
  get_node("Question").set_text(dict["110"]["question"])
  get_node("ButtonA").set_text(dict["110"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["110"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["110"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["110"]["choices"]["d"])
  if (dict["110"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["110"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["110"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["110"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 111):
  get_node("Question").set_text(dict["111"]["question"])
  get_node("ButtonA").set_text(dict["111"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["111"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["111"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["111"]["choices"]["d"])
  if (dict["111"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["111"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["111"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["111"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 112):
  get_node("Question").set_text(dict["112"]["question"])
  get_node("ButtonA").set_text(dict["112"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["112"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["112"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["112"]["choices"]["d"])
  if (dict["112"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["112"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["112"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["112"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 113):
  get_node("Question").set_text(dict["113"]["question"])
  get_node("ButtonA").set_text(dict["113"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["113"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["113"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["113"]["choices"]["d"])
  if (dict["113"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["113"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["113"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["113"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 114):
  get_node("Question").set_text(dict["114"]["question"])
  get_node("ButtonA").set_text(dict["114"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["114"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["114"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["114"]["choices"]["d"])
  if (dict["114"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["114"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["114"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["114"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 115):
  get_node("Question").set_text(dict["115"]["question"])
  get_node("ButtonA").set_text(dict["115"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["115"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["115"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["115"]["choices"]["d"])
  if (dict["115"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["115"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["115"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["115"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 116):
  get_node("Question").set_text(dict["116"]["question"])
  get_node("ButtonA").set_text(dict["116"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["116"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["116"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["116"]["choices"]["d"])
  if (dict["116"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["116"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["116"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["116"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1

 if (a == 117):
  get_node("Question").set_text(dict["117"]["question"])
  get_node("ButtonA").set_text(dict["117"]["choices"]["a"])
  get_node("ButtonB").set_text(dict["117"]["choices"]["b"])
  get_node("ButtonC").set_text(dict["117"]["choices"]["c"])
  get_node("ButtonD").set_text(dict["117"]["choices"]["d"])
  if (dict["117"]["answer"]==A): get_node("ButtonA").get_node("Correctness").set_valuet()
  else:get_node("ButtonA").get_node("Correctness").set_valuef()
  
  if (dict["117"]["answer"]==B): get_node("ButtonB").get_node("Correctness").set_valuet()
  else:get_node("ButtonB").get_node("Correctness").set_valuef()
  
  if (dict["117"]["answer"]==C): get_node("ButtonC").get_node("Correctness").set_valuet()
  else:get_node("ButtonC").get_node("Correctness").set_valuef()
  
  if (dict["117"]["answer"]==D): get_node("ButtonD").get_node("Correctness").set_valuet()
  else:get_node("ButtonD").get_node("Correctness").set_valuef()
  arrayq[a] = 1
 pass

func get_random_number():
	randomize()
	var ran = randi()%1000000000+999999999
	seed(ran)
	return randi()%randi()%117 + 1
	pass

func _on_ButtonA_button_up():
	if (get_node("ButtonA").get_node("Correctness").correct == true):
	   get_node("GoodBad").texture= load ("res://Assets/trasnparent.png")
	   get_node("ButtonA").disabled=true
	   get_node("ButtonB").disabled=true
	   get_node("ButtonC").disabled=true
	   get_node("ButtonD").disabled=true
	   get_node("Timer").timer_on=false
	   get_node("5050Button").disabled=true
	   get_node("AskFriendButton").disabled=true
	   get_node("SwitchQuestionButton").disabled=true
	   get_node("GoodBad").texture= load ("res://Assets/CorrectAnswer.png")
	   $AudioStreamPlayer.stream = CorrectSound
	   $AudioStreamPlayer.play()
	   yield(get_tree().create_timer(3.9), "timeout")
	   score = score + 1
	   _ready()
	else:
		get_node("ButtonA").disabled=true
		get_node("ButtonB").disabled=true
		get_node("ButtonC").disabled=true
		get_node("ButtonD").disabled=true
		get_node("Timer").timer_on=false
		get_node("GoodBad").texture= load ("res://Assets/WrongAnswer.png")
		get_node("5050Button").disabled=true
		get_node("AskFriendButton").disabled=true
		get_node("SwitchQuestionButton").disabled=true
		$AudioStreamPlayer.stream = WrongSound
		$AudioStreamPlayer.play()
		yield(get_tree().create_timer(5.4), "timeout")
		get_tree().change_scene("res://Screens/GameOverScreen.tscn")

func _on_ButtonB_button_up():
	if (get_node("ButtonB").get_node("Correctness").correct == true):
	   get_node("ButtonA").disabled=true
	   get_node("ButtonB").disabled=true
	   get_node("ButtonC").disabled=true
	   get_node("ButtonD").disabled=true
	   get_node("Timer").timer_on=false
	   get_node("5050Button").disabled=true
	   get_node("AskFriendButton").disabled=true
	   get_node("SwitchQuestionButton").disabled=true
	   get_node("GoodBad").texture= load ("res://Assets/CorrectAnswer.png")
	   $AudioStreamPlayer.stream = CorrectSound
	   $AudioStreamPlayer.play()
	   yield(get_tree().create_timer(3.9), "timeout")
	   score = score + 1
	   _ready()
	else:
		get_node("ButtonA").disabled=true
		get_node("ButtonB").disabled=true
		get_node("ButtonC").disabled=true
		get_node("ButtonD").disabled=true
		get_node("Timer").timer_on=false
		get_node("GoodBad").texture= load ("res://Assets/WrongAnswer.png")
		get_node("5050Button").disabled=true
		get_node("AskFriendButton").disabled=true
		get_node("SwitchQuestionButton").disabled=true
		$AudioStreamPlayer.stream = WrongSound
		$AudioStreamPlayer.play()
		yield(get_tree().create_timer(5.4), "timeout")
		get_tree().change_scene("res://Screens/GameOverScreen.tscn")

func _on_ButtonC_button_up():
	if (get_node("ButtonC").get_node("Correctness").correct == true):
	   get_node("ButtonA").disabled=true
	   get_node("ButtonB").disabled=true
	   get_node("ButtonC").disabled=true
	   get_node("ButtonD").disabled=true
	   get_node("Timer").timer_on=false
	   get_node("5050Button").disabled=true
	   get_node("AskFriendButton").disabled=true
	   get_node("SwitchQuestionButton").disabled=true
	   get_node("GoodBad").texture= load ("res://Assets/CorrectAnswer.png")
	   $AudioStreamPlayer.stream = CorrectSound
	   $AudioStreamPlayer.play()
	   yield(get_tree().create_timer(3.9), "timeout")
	   score += 1
	   _ready()
	else:
		get_node("ButtonA").disabled=true
		get_node("ButtonB").disabled=true
		get_node("ButtonC").disabled=true
		get_node("ButtonD").disabled=true
		get_node("Timer").timer_on=false
		get_node("GoodBad").texture= load ("res://Assets/WrongAnswer.png")
		get_node("5050Button").disabled=true
		get_node("AskFriendButton").disabled=true
		get_node("SwitchQuestionButton").disabled=true
		$AudioStreamPlayer.stream = WrongSound
		$AudioStreamPlayer.play()
		yield(get_tree().create_timer(5.4), "timeout")
		get_tree().change_scene("res://Screens/GameOverScreen.tscn")

func _on_ButtonD_button_up():
	if (get_node("ButtonD").get_node("Correctness").correct == true):
	   get_node("ButtonA").disabled=true
	   get_node("ButtonB").disabled=true
	   get_node("ButtonC").disabled=true
	   get_node("ButtonD").disabled=true
	   get_node("Timer").timer_on=false
	   get_node("5050Button").disabled=true
	   get_node("AskFriendButton").disabled=true
	   get_node("SwitchQuestionButton").disabled=true
	   get_node("GoodBad").texture= load ("res://Assets/CorrectAnswer.png")
	   $AudioStreamPlayer.stream = CorrectSound
	   $AudioStreamPlayer.play()
	   yield(get_tree().create_timer(3.9), "timeout")
	   score = score + 1
	   _ready()
	else:
		get_node("ButtonA").disabled=true
		get_node("ButtonB").disabled=true
		get_node("ButtonC").disabled=true
		get_node("ButtonD").disabled=true
		get_node("Timer").timer_on=false
		get_node("GoodBad").texture= load ("res://Assets/WrongAnswer.png")
		get_node("5050Button").disabled=true
		get_node("AskFriendButton").disabled=true
		get_node("SwitchQuestionButton").disabled=true
		$AudioStreamPlayer.stream = WrongSound
		$AudioStreamPlayer.play()
		yield(get_tree().create_timer(5.4), "timeout")
		get_tree().change_scene("res://Screens/GameOverScreen.tscn")

func _on_5050Button_button_up():
	get_node("5050Button").disabled=true
	Button50 = false
	if (get_node("ButtonA").get_node("Correctness").correct == true or get_node("ButtonB").get_node("Correctness").correct == true):
		get_node("ButtonC").disabled=true
		get_node("ButtonD").disabled=true
	if (get_node("ButtonC").get_node("Correctness").correct == true or get_node("ButtonD").get_node("Correctness").correct == true):
		get_node("ButtonA").disabled=true
		get_node("ButtonB").disabled=true

func _on_AskFriendButton_button_up():
	get_node("AskFriendButton").disabled=true
	ButtonAsk = false
	if (get_node("ButtonA").get_node("Correctness").correct == true):
		get_node("ButtonB").disabled=true
		get_node("ButtonC").disabled=true
		get_node("ButtonD").disabled=true
	if (get_node("ButtonB").get_node("Correctness").correct == true):
		get_node("ButtonA").disabled=true
		get_node("ButtonC").disabled=true
		get_node("ButtonD").disabled=true
	if (get_node("ButtonC").get_node("Correctness").correct == true):
		get_node("ButtonB").disabled=true
		get_node("ButtonA").disabled=true
		get_node("ButtonD").disabled=true
	if (get_node("ButtonD").get_node("Correctness").correct == true):
		get_node("ButtonB").disabled=true
		get_node("ButtonC").disabled=true
		get_node("ButtonA").disabled=true

func _on_SwitchQuestionButton_button_up():
	get_node("SwitchQuestionButton").disabled=true
	ButtonQ = false
	_ready()


func _on_Win_pressed():
	get_tree().change_scene("res://Screens/WinScreen.tscn")
