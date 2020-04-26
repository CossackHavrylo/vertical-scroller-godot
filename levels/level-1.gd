extends Node2D

onready var respawn_timer := $respawn_timer
onready var respawn_hud := $hud/hud_container/respawn_hud
onready var respawn_counter := $hud/hud_container/respawn_hud/countdown
onready var player_controller := $player_controller


func _ready():
	player_controller.connect("player_killed", self, "_on_player_killed")
	respawn_hud.hide()


func _process(delta):
	if not player_controller.player:
		respawn_counter.text = str(str(round(respawn_timer.time_left)))


func _on_player_killed():
	respawn_hud.show()
	respawn_timer.start()


func _on_respawn_timer_timeout():
	respawn_hud.hide()
	player_controller.spawn_player()
