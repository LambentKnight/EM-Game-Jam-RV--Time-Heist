extends CharacterBody2D


const SPEED = 300.0

var last_direction: Vector2 = Vector2.RIGHT
var is_interacting: bool = false
var hitbox_offset: Vector2

@export var inventory: Inventory

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var grab_relic: AudioStreamPlayer2D = $GrabRelic
@onready var hitbox: Area2D = $Hitbox

func _ready() -> void:
	
	#Initialize Hitbox Offset
	hitbox_offset = hitbox.position


func _physics_process(_delta: float) -> void:
	#Disable Hitbox until Grab is Triggered
	hitbox.monitoring = false
	hitbox.monitorable = false
	
	if Input.is_action_just_pressed("interact") and not is_interacting:
		interact()
	
	# Skip movement if interacting
	if is_interacting:
		velocity = Vector2.ZERO
		return
	
	process_movement()
	process_animation()
	move_and_slide()

#-----------------------------------------------------------------------------
# MOVEMENT & ANIMATIONS
#-----------------------------------------------------------------------------
func process_movement() -> void: 
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("left","right","up","down")
	
	if direction != Vector2.ZERO:
		velocity = direction  * SPEED
		last_direction = direction
		update_hitbox_offset()
	else:
		velocity = Vector2.ZERO

func process_animation() -> void:
	if is_interacting:
		return
	if velocity != Vector2.ZERO:
		play_animation("run", last_direction)
	else:
		play_animation("idle", last_direction)

func play_animation(prefix: String, dir: Vector2) -> void:
	if dir.x != 0:
		animated_sprite_2d.flip_h = dir.x < 0
		animated_sprite_2d.play(prefix + "_right")
	elif dir.y < 0:
		animated_sprite_2d.play(prefix + "_right")
	elif dir.y > 0:
		animated_sprite_2d.play(prefix + "_right")


#-----------------------------------------------------------------------------
# Grab
#-----------------------------------------------------------------------------
func interact() -> void:
	is_interacting = true
	hitbox.monitoring = true
	hitbox.monitorable = true
	grab_relic.play()
	play_animation("grab", last_direction)
	print("attack")

func _on_animated_sprite_2d_animation_finished() -> void:
	if is_interacting:
		is_interacting = false

#-----------------------------------------------------------------------------
# Hitbox
#-----------------------------------------------------------------------------

func update_hitbox_offset() -> void:
	var x := hitbox_offset.x
	var y := hitbox_offset.y
	
	match last_direction:
		Vector2.LEFT:
			hitbox.position = Vector2(-x, y)
		Vector2.RIGHT:
			hitbox.position = Vector2(x, y)
		#Vector2.UP:
			#hitbox.position = Vector2(y, -x)
		#Vector2.DOWN:
			#hitbox.position = Vector2(-y, x)

func _on_hitbox_area_entered(area: Area2D) -> void:
	if is_interacting:
		print(area)
		print("Grab")
