extends KinematicBody2D

var speed = 200
var velocity = Vector2()
var gravity = 10;
var g_velocity  = 0
var jump_height = -300

func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
		velocity.x -= speed
	else:
		if is_on_floor():
			g_velocity = 0
			$AnimatedSprite.play("Idle")
			if Input.is_action_pressed("ui_up"):
				g_velocity  = jump_height
				$AnimatedSprite.play("Jump")
		
	g_velocity += gravity;
	velocity.y += g_velocity;
	velocity = move_and_slide(velocity,Vector2(0,-1))
