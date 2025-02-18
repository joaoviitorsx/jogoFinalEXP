extends CanvasLayer

@onready var direcional: CanvasLayer = $"../Direcional"

# Called when the node enters the scene tree for the first time.
func _ready():
	direcional.visible = false 
	print(self.get_path())
	
func on_dialog_finished():
	print("Mostrando direcional...")
	direcional.visible = true
	start_direcional_timer()

func start_direcional_timer():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 5 
	timer.one_shot = true
	timer.connect("timeout", Callable(self, "_on_direcional_timer_timeout"))
	timer.start()

func _on_direcional_timer_timeout():
	print("Ocultando Direcional.")
	direcional.visible = false
