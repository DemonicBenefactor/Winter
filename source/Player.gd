extends KinematicBody2D

const MAX_SPEED = 100
const ACCELERATION = 550
const DECELERATION = 600

var velocity = Vector2.ZERO
var inputVector = Vector2.ZERO

func _ready():
	print("hello world!")

func _physics_process(delta):
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")	
	inputVector = inputVector.normalized()
	
	if inputVector != Vector2.ZERO:
		velocity = velocity.move_toward(inputVector * MAX_SPEED, ACCELERATION * delta)

	else:
		velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)
		
	velocity = move_and_slide(velocity)
