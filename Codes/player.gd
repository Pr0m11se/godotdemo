extends Area2D
signal hit


@export var player_speed : int = 300;
var velocity : Vector2 = Vector2.ZERO
var screen_size = get_viewport_rect().size;
# Called when the node enters the scene tree for the first time.
func reboot(pos) :
	position = pos;
	show();
	$CollisionShape2D.set_deferred("disabled",false)
func _ready() -> void:
	screen_size = get_viewport_rect().size
	#randomize()
	reboot(Vector2(randi_range(200,800),randi_range(200,800)))
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("up") :
		velocity.y = -1
	if Input.is_action_pressed("down") :
		velocity.y = 1
	if Input.is_action_pressed("left") :
		velocity.x = -1
	if Input.is_action_pressed("right") :
		velocity.x = 1
	velocity = Input.get_vector("left","right","up","down")
	if velocity.length() > 0 :
		velocity =velocity.normalized() * player_speed
		get_node("AnimatedSprite2D").play();
		if(velocity.x!=0):
			get_node("AnimatedSprite2D").animation="walk"
			$AnimatedSprite2D.flip_v = 0
			get_node("AnimatedSprite2D").flip_h = velocity.x<0
		elif velocity.y!=0:
			get_node("AnimatedSprite2D").animation="up"
			$AnimatedSprite2D.flip_v = velocity.y>0
			
	else :
		get_node("AnimatedSprite2D").stop();
		
	position+=velocity*delta;
	#position=clamp(position,Vector2.ZERO,screen_size)
	position=position.clamp(Vector2.ZERO,screen_size)



func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()
	get_node("CollisionShape2D").set_deferred("disabled",true)
	pass # Replace with function body.
