extends CharacterBody2D

@export var speed = 200.0
@export var push_force = 80.0

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()

	# Tjek collisioner efter bevægelse
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		if collision.get_collider() is RigidBody2D:
			var body = collision.get_collider()
			
			# Skub stenen
			body.apply_central_force(direction * push_force)
