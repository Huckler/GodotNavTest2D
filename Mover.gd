extends KinematicBody2D


onready var nav = $NavigationAgent2D

var next_point = Vector2()
var target = Vector2()
export var speed = 80

var velocity = Vector2()

var new_velocity = Vector2()

func _ready():
	nav = $NavigationAgent2D
	nav.set_target_location($"%Target".get_global_transform().origin)

func _physics_process(delta):
	velocity = Vector2()

	next_point = nav.get_next_location()

	var dir = (next_point-global_transform.origin).normalized()

	velocity = dir * speed
	
	$NavigationAgent2D.set_velocity(velocity)
	
	move_and_slide(new_velocity)

func _on_NavigationAgent2D_velocity_computed(safe_velocity):
	new_velocity = safe_velocity
