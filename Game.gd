extends Node2D

export var game_score = 10

var p1_score = 0
var p2_score = 0


func _ready():
	p1_score = 0
	p2_score = 0

func _print_score():
	$HUD/Score.text = "%02d | %02d" % [p1_score, p2_score]
	print("P1 %d | P2 %d" % [p1_score, p2_score])

func _on_Goal_1_body_entered(area):
	if area == $Ball:
		p2_score += 1
		_print_score()
		if p2_score >= game_score:
			print("P2 Wins!")
			$Ball.free()
		else:
			$Ball.reset()


func _on_Goal_2_body_entered(area):
	if area == $Ball:
		p1_score += 1
		_print_score()
		if p1_score >= game_score:
			print("P1 Wins!")
			$Ball.free()
		else:
			$Ball.reset()