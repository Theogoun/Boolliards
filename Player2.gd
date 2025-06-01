extends CharacterBody2D

@export var spd = 100

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("Move Right2"):
		velocity.x += 10
	if Input.is_action_pressed("Move Left2"):
		velocity.x -= 10
	if Input.is_action_pressed("Move Up2"):
		velocity.y -= 10
	if Input.is_action_pressed("Move Down2"):
		velocity.y += 10
	velocity.normalized()
	position += velocity * delta *spd
	
	if velocity.x < 0:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
	pass

func _ready() -> void:
	pass	
