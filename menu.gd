class_name Menu
extends Control


var sens:float = 0.3
@onready var pause_menu: Panel = $pause_menu
@onready var settings: Panel = $Settings
@onready var h_slider: HSlider = $Settings/VBoxContainer/HSlider



func display_settings() -> void:
	if pause_menu.visible and !settings.visible:
		settings.visible = true
		pause_menu.visible = false
	elif !pause_menu.visible and settings.visible:
		settings.visible = false
		pause_menu.visible = true

func pause() -> void:
	get_tree().paused = true
	visible = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func resume() -> void:
	get_tree().paused = false
	visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func testESC() -> void:
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

func _process(_delta: float) -> void:
	testESC()
	sens = h_slider.value

func _on_resume_pressed() -> void:
	resume()

func _on_settings_button_down() -> void:
	display_settings()

func _on_quit_button_down() -> void:
	get_tree().quit()

func _on_back_pressed() -> void:
	display_settings()
