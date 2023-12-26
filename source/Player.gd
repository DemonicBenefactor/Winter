extends KinematicBody2D

var MAX_SPEED = 100
var velocity = Vector2.ZERO
var inputVector = Vector2.ZERO

func _ready():
	print("hello world!")

func _physics_process(delta):
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")	
	
	if inputVector != Vector2.ZERO:
		velocity = inputVector
	else:
		velocity = Vector2.ZERO
		
	move_and_collide(velocity * delta * MAX_SPEED)
