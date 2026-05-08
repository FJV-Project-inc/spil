extends Node2D

# Loader jeres Mountain scene
var ground_scene = preload("res://scenes/Mountain.tscn")

# Bredden på ét mountain piece
@export var piece_width := 1024

# Hvor mange pieces der skal være loaded fra start
@export var preload_count := 6

# Liste over spawned pieces
var spawned_pieces = []


func _ready():
	# Spawn start terrain
	for i in range(preload_count):
		spawn_piece(i * piece_width)


func _process(delta):
	# Finder spilleren
	var player = get_parent().get_node("Sisyphus")

	# Finder sidste terrain piece
	var last_piece = spawned_pieces[-1]

	# Spawn nyt terrain foran spilleren
	if player.global_position.x > last_piece.position.x - piece_width * 2:
		spawn_piece(last_piece.position.x + piece_width)

	# Fjern gamle pieces bag spilleren
	for piece in spawned_pieces.duplicate():
		if player.global_position.x - piece.position.x > piece_width * 3:
			piece.queue_free()
			spawned_pieces.erase(piece)


func spawn_piece(x_pos):
	var piece = ground_scene.instantiate()

	add_child(piece)

	# Fladt terrain
	piece.position = Vector2(x_pos, 0)

	spawned_pieces.append(piece)
