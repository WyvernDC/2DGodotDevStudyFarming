extends NodeState

@export var player : ImongPlayer
@export var animated_sprite_2d: AnimatedSprite2D

#var direction: Vector2 deleted cause naa natay player

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void: 	
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	else:
		animated_sprite_2d.play("idle_front")



func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
	#note that its player named cause its the name of the script file not its class_name(ImongPlayer)
	if player.current_tool == DataTypes.Tools.Axewood && GameInputEvents.GamitonAngTools():
		transition.emit("Chopping")
	
	if player.current_tool == DataTypes.Tools.Tillground && GameInputEvents.GamitonAngTools():
		transition.emit("Tilling")
	
	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvents.GamitonAngTools():
		transition.emit("Watering")

func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
