extends Node2D

func _process(delta):
	if check_win():
		get_tree().quit()	
	
	var multi = 1
	
	for x in $VBoxContainer/GridContainer.get_children():
		x.text = str((int(x.text) + ($VBoxContainer/HSlider.value) * multi))
		multi += 1
		
	if Input.is_action_just_pressed("ui_accept"):
		$VBoxContainer/HSlider.value = 0
	elif Input.is_action_just_pressed("ui_cancel"):
		$VBoxContainer/HSlider.value = 0
		for x in $VBoxContainer/GridContainer.get_children():
			x.text = "0"
		
	elif Input.is_action_pressed("ui_right"):
		$VBoxContainer/HSlider.value += 1
	elif Input.is_action_pressed("ui_left"):
		$VBoxContainer/HSlider.value -= 1
	elif Input.is_action_just_pressed("max"):
		$VBoxContainer/HSlider.value = $VBoxContainer/HSlider.max_value
	elif Input.is_action_just_pressed("min"):
		$VBoxContainer/HSlider.value = $VBoxContainer/HSlider.min_value
		

func check_win():
	var i = 1
	var win = false
	
	for x in $VBoxContainer/GridContainer.get_children():
		if int(x.text) == i:
			win = true
		else:
			win = false
		
		i += 1
		
	return win
	
func set_win():
	var i = 1
	for x in $VBoxContainer/GridContainer.get_children():
		x.text = str(i)
		i += 1
