extends CharacterBody2D

@export var spd = 100

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	var flip_H = false # This will act as a flag to see if the player is facing left
	var direction = 0 # This will keep the last direction the player is looking
	
	# Each input for the movement
	if Input.is_action_pressed("Move Right1"):
		velocity.x += 10
	if Input.is_action_pressed("Move Left1"):
		velocity.x -= 10
	if Input.is_action_pressed("Move Up1"):
		velocity.y -= 10
	if Input.is_action_pressed("Move Down1"):
		velocity.y += 10
	
	
	if velocity != Vector2.ZERO:
		# Moving
		position += velocity.normalized() * delta * spd

		# Get angle in degrees
		var angle = velocity.angle() * 180 / PI

		# Snap angle to nearest 45 degrees
		var snapped_angle = round(angle / 45) * 45

		# Check for flip
		var flip_h = (snapped_angle == 135 or snapped_angle == 180 or snapped_angle == -135)

		# Determine final rotation
		if snapped_angle == 135:
			flip_H = true
			direction = 45
		elif snapped_angle == 180:
			direction = 0
		elif snapped_angle == -135:
			direction = -45

		
		var last_direction = snapped_angle

		# Apply rotation and flip
		$Sprite2D.flip_h = flip_H
		$Sprite2D.rotation = last_direction

		# Save last direction
		last_direction = direction
		var last_flip_H = flip_H

		# No movement — keep last direction
		$Sprite2D.flip_h = last_flip_H
		rotation_degrees = last_direction
func _ready() -> void:
	pass	
