extends Node2D


func _ready():
	$Menu.visible = true
	$About.visible = false


func _on_Help_pressed():
	$Menu.visible = false
	$About.visible = true


func _on_Play_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Back_pressed():
	$About.visible = false
	$Menu.visible = true
