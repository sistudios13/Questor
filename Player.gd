extends KinematicBody2D
class_name Player

enum { MOVE, CLIMB }

# Variables ------------
var JUMP_FORCE = -160
var GRAVITY_FORCE = 4
var throwing = false
var JUMP_RELEASE = -50
var MAX_SPEED = 95
var FRICTION = 10 # The Same
var ACCELERATION = 10 # The Same
var DOWNWARDS_ADDITIONAL_GRAVITY_FORCE = 4
var CLIMB_SPEED = 67
var DOUBLE_JUMP_COUNT = 1
var allow_thr0w = true
var player_pos = self.position
var velocity = Vector2.ZERO
var state = MOVE
var double_jump = 1
var buffered_jump = false
var coyote_jump = false
var popun_on = false
var LowGravityOn = false
var TripleJumpOn = false
var SpeedBoostOn = false
onready var animatedSprite = $BlueSprite
onready var ladderCheck = $LadderCheck
onready var jumpBufferTimer = $JumpBufferTimer
onready var coyoteJumpTimer = $CoyoteJumpTimer
onready var BULLET = preload("Bullet.tscn")
# -------------------------
func _ready():
	EmblemHideFunctions()
	SetSpawn()

func _physics_process(delta):
	if Global.player_sprite == "blue":
		$BlueSprite.show()
		$OwletSprite.hide()
		animatedSprite = $BlueSprite
		
		
	if Global.player_sprite == "owlet":
		$BlueSprite.hide()
		$OwletSprite.show()
		animatedSprite = $OwletSprite
	
	var input = Vector2.ZERO
	input.x = Input.get_axis("ui_left", "ui_right")
	input.y = Input.get_axis("ui_up", "ui_down")
	if state == MOVE: move_state(input)
	elif state == CLIMB: climb_state(input)
	EmblemFunctions()
	ESC_Menu()
	if throwing:
		animatedSprite.animation = "Throw"
	if Input.is_action_just_pressed("ui_accept") and allow_thr0w and Global.rock_count > 0:
		Rock_Throw(input)

	
	
	
	
#	 PauseStuff ------------------------------------------------------
#	if Input.is_action_just_pressed("ui_select"):
#		$Popup.show()
#		get_tree().paused = true
#		$AnimatedSprite.hide()
#		popun_on = true
	#-------------------------------------------------------------------

func move_state(input):
	if is_on_ladder() and Input.is_action_just_pressed("ui_up"):
		state = CLIMB
	
	apply_gravity()
	if not horisontal_move(input):
		apply_friction()
		animatedSprite.animation = "idle"
		
	else:
		apply_acceleration(input.x)
		animatedSprite.flip_h = input.x < 0
		animatedSprite.flip_h = input.x < 0
		
	if is_on_floor():
		reset_double_jump()
	else:
		animatedSprite.animation = "Jump"

	if can_jump():
		input_jump()
		
	else:
		input_jump_release()
		input_double_jump()
		buffer_jump()
		fast_fall()
		
	var was_in_air = not is_on_floor()
	var was_on_floor = is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)
	var just_landed = is_on_floor() and was_in_air
	if just_landed:
		animatedSprite.animation = "Run"
		animatedSprite.frame = 1
	
	var just_left_ground = not is_on_floor() and was_on_floor
	if just_left_ground and velocity.y >= 0:
		coyote_jump = true
		coyoteJumpTimer.start()
	
func climb_state(input):
	if not is_on_ladder():
		state = MOVE
	if input.length() != 0:
		animatedSprite.animation = "Climb" #LAdder Anim
		
	else:
		animatedSprite.animation = "ClimbIdle" #LAdder idle
	velocity = input * CLIMB_SPEED
	velocity = move_and_slide(velocity, Vector2.UP)

func player_died():
	self.position = Global.spawn_point
 
func is_on_ladder():
	if not ladderCheck.is_colliding(): return false
	var collider = ladderCheck.get_collider()
	if not collider is Ladder : return false
	else:
		return true

func input_jump_release():
	if Input.is_action_just_released("ui_up") and velocity.y < JUMP_RELEASE: 
		velocity.y = JUMP_RELEASE

func input_double_jump():
	if Input.is_action_just_pressed("ui_up") and double_jump > 0:
			velocity.y = JUMP_FORCE
			double_jump -= 1
			$JumpSound.play()
			$JumpParticle.emitting = true
	
func buffer_jump():
	if Input.is_action_just_pressed("ui_up"):
			buffered_jump = true
			jumpBufferTimer.start()
	
func fast_fall():
	if velocity.y > 0:
		animatedSprite.animation = "Falling"
		velocity.y += DOWNWARDS_ADDITIONAL_GRAVITY_FORCE

func horisontal_move(input):
	return input.x != 0
	
func can_jump(): 
	return is_on_floor() or coyote_jump

func reset_double_jump():
	double_jump = DOUBLE_JUMP_COUNT
	
func input_jump():
	if Input.is_action_just_pressed("ui_up") or buffered_jump: #jump
		velocity.y = JUMP_FORCE
		buffered_jump = false
		$JumpSound.play()
		
func apply_gravity():
		velocity.y += GRAVITY_FORCE
		velocity.y = min(velocity.y, 300)
		
func apply_friction():
	velocity.x = move_toward(velocity.x, 0, FRICTION) 
	
func apply_acceleration(amount):
	animatedSprite.animation = "Run"
	velocity.x = move_toward(velocity.x, MAX_SPEED * amount, ACCELERATION) 
	
func _on_JumpBufferTimer_timeout():
	buffered_jump = false

func _on_CoyoteJumpTimer_timeout():
	coyote_jump = false

func _on_Hitbox_body_entered(body):
	player_died()

func _on_Transport_Portal_body_entered(body): # 1
	self.position = Vector2(10269, -1332)

func TripleJumpTimer():
	TripleJumpOn = true
	DOUBLE_JUMP_COUNT = 2
	yield(get_tree().create_timer(10), "timeout")
	DOUBLE_JUMP_COUNT = 1
	TripleJumpOn = false

func LowGravityTimer():
	LowGravityOn = true
	GRAVITY_FORCE = 2
	yield(get_tree().create_timer(10), "timeout")
	GRAVITY_FORCE = 4
	LowGravityOn = false
	
func SpeedBoostTimer():
	SpeedBoostOn = true
	ACCELERATION = 15
	FRICTION = 15
	MAX_SPEED = 120
	yield(get_tree().create_timer(10), "timeout")
	MAX_SPEED = 95
	ACCELERATION = 10
	FRICTION = 10
	SpeedBoostOn = false

func _on_LowGravity_LowGravityPower():
	$POwerupAudio.play()
	reset_double_jump()
	LowGravityTimer()

func _on_TripleJumpPowerup_TripleJumpPower():
	$POwerupAudio.play()
	TripleJumpTimer()
	
func _on_SpeedBoostPowerup_SpeedBoostPower():
	$POwerupAudio.play()
	SpeedBoostTimer()

func _on_Key_KeyCollected():
	$KeySound.play()

func EmblemFunctions():
	if TripleJumpOn:
		$UI/RedEmblem.show()
	if not TripleJumpOn:
		$UI/RedEmblem.hide()
	if LowGravityOn:
		$UI/GreenEmblem.show()
	if not LowGravityOn:
		$UI/GreenEmblem.hide()
	if Global.key_collected:
		$KeyCollectedEmblem.show()
	if not Global.key_collected:
		$KeyCollectedEmblem.hide()
	if SpeedBoostOn:
		$UI/BlueEmblem.show()
	if not SpeedBoostOn:
		$UI/BlueEmblem.hide()

func EmblemHideFunctions():
	$UI/GreenEmblem.hide()
	$UI/RedEmblem.hide()
	$KeyCollectedEmblem.hide()
	$UI/BlueEmblem.hide()

func SetSpawn():
	self.position = Global.spawn_point


func ESC_Menu():
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Menu.tscn")
		
func Rock_Throw(input):
	$ThrowSound.play()
	Global.rock_count -= 1
	allow_thr0w = false 
	throwing = true
	animatedSprite.animation = "Throw"
	if input.x < 0 or animatedSprite.flip_h: #Left
		Global.shoot_direction = -5
	if input.x > 0 or not animatedSprite.flip_h: #Right
		Global.shoot_direction = 5
	var bullet =  BULLET.instance()
	get_node("..").add_child(bullet)
	bullet.global_position = $Position2D.global_position
	yield(get_tree().create_timer(0.25), "timeout")
	throwing = false
	yield(get_tree().create_timer(0.55), "timeout")
	allow_thr0w = true
