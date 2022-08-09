extends KinematicBody2D



export var speed = 60
export var dir = Vector2.ZERO
var rng


func _ready():
	rng = RandomNumberGenerator.new()




func _physics_process(delta):
	move_and_slide(dir * speed)


func _on_Timer_timeout():
	randomize()
	rng.randomize()
	var randomX = rng.randf() * rng.randi_range(-1,1)
	var randomY = rng.randf() * rng.randi_range(-1,1)
	dir = Vector2(randomX, randomY).normalized()
	$Timer.wait_time = rng.randf() * 1
