extends CharacterBody2D

@onready var animation := $Anim as AnimatedSprite2D
@onready var animation_tree := $AnimationTree as AnimationTree

var state_machine

func _ready() -> void:
	state_machine = animation_tree["parameters/playback"]
	

func _process(delta: float) -> void:
	move()
	animate()
	move_and_slide()

func move() -> void:
	var direction := Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	
	velocity = direction.normalized() * 64
	
	if direction != Vector2.ZERO:
		animation_tree["parameters/idle/blend_position"] = Vector2(direction.x, direction.y * (-1))
		print("normalized",direction.normalized())
		print(direction)

func animate() -> void:
	state_machine.travel("idle")
	pass
