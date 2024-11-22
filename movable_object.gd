extends CharacterBody2D

func _process(delta: float) -> void:
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * 350
	move_and_slide()
