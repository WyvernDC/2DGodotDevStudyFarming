
extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: ImongMaInteract = $InteractableComponent


func _ready() -> void:
	interactable_component.ImongMaInteract_activated.connect(on_ImongMaInteract_activated)
	interactable_component.ImongMaInteract_deactivated.connect(on_ImongMaInteract_deactivated)
	collision_layer == 1

func on_ImongMaInteract_activated() -> void:
	animated_sprite_2d.play("open_na_nyor")
	collision_layer = 2
	print("activated")

func on_ImongMaInteract_deactivated() -> void:
	animated_sprite_2d.play("close_door")
	collision_layer = 1
	print("deactivated")
