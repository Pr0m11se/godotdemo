extends Node
@export var mob_scene : PackedScene
@export var score : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func gameover() -> void:
	$Scoretimer.stop()
	$Mobtimer.stop()
	pass # Replace with function body.

func newgame() -> void :
	score = 0;
	$Player.start(Vector2(randi_range(200,800),randi_range(200,800)))
	$Starttimer.start()
	pass


func _on_mobtimer_timeout() -> void:
	pass # Replace with function body.


func _on_scoretimer_timeout() -> void:
	pass # Replace with function body.


func _on_starttimer_timeout() -> void:
	pass # Replace with function body.
