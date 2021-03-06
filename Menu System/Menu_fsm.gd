extends Control

enum Screen {NULL, Splash, Main, Connect, Server, Connected, Servered}

var Menu = {
	Screen.NULL: null,
	Screen.Splash: preload("res://Menu System/Splash.tscn"),
	Screen.Main: preload("res://Menu System/Main Menu.tscn"),
	Screen.Connect: preload("res://Menu System/Connect.tscn"),
	Screen.Server: preload("res://Menu System/Create Server.tscn"),
	Screen.Connected: preload("res://Menu System/Connected Splash.tscn"),
	Screen.Servered: preload("res://Menu System/Server Splash.tscn")
}

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func _ready():
	change_screen_to("Splash")

func change_screen_to(screen_name):
	match screen_name:
		"Splash", "Main", "Connect", "Server", "Connected", "Servered":
			_load_screen(screen_name)
		_:
			pass

func _load_screen(screen_name):
	var nodes = get_children()
	for node in nodes:
		node.queue_free()
	var node = Menu[Screen[screen_name]].instance()
	add_child(node)