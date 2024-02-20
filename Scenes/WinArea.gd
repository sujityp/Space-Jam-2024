extends Area2D
 

signal customer_served


func _on_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("customer_served")
