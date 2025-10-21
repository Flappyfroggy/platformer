extends Area2D
						
func _on_body_entered(body: Node2D) -> void:
	if body.name == "playeere":
		e.score += 1
		self.queue_free()
		if e.score == 2:
			get_tree().change_scene_to_file("res://scenes/level2.tscn")
			print (e.score)
		if e.score == 3:
			get_tree().change_scene_to_file("res://scenes/level3.tscn")
			print (e.score)
		if e.score == 4:
			get_tree().change_scene_to_file("res://scenes/level4.tscn")
			print (e.score)
		if e.score == 5:
			get_tree().change_scene_to_file("res://scenes/level5.tscn")
			print (e.score)
