extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "playeere":
		body.score += 1
		self.queue_free()
		get_tree().change_scene_to_file("res://scenes/level2.tscn")
