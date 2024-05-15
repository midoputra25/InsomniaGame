extends Area2D

func _on_body_entered(body):
	# Check if the body entered is the player
	if body.name == "CharacterBody2D":  # Replace "Player" with the actual name of your player node
		# Remove the blue key from the scene
		queue_free()

		# Change the scene
		# Replace "res://path_to_your_scene.tscn" with the actual path to your scene
		get_tree().change_scene_to_file("res://scenes/level1.tscn")
