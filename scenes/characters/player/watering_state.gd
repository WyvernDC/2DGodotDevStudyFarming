extends NodeState

#player refers to the script file | Imongplayer refers to its class named inside script
@export var player: ImongPlayer
#animated_sprite_2d is inbuilt so you call this shi out | you call out the node it self
@export var animated_sprite_2d: AnimatedSprite2D 

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass

#checks the state
func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	#player cause calling script it self not just the class but the whole stuff
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("watering_back") #refers to the name sa animated sprite na imong gi himo
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("watering_right")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("watering_front")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("watering_left")
	else:
		animated_sprite_2d.play("watering_front")


func _on_exit() -> void:
	animated_sprite_2d.stop()
