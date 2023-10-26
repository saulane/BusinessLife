extends Node2D

# Définissez une variable pour garder une trace de l'argent du joueur
var argent: int = 0
var buildings = {"store": {"price": 10, "number": 0, "gain": 10, "level": 1}, "factory": {"price": 100, "number": 0, "gain": 100, "level": 1}}

	
func update_money(incr):
	if incr > 0:
		argent += incr
	else:
		if argent > abs(incr):
			argent += incr
		else:
			return 0
	$Camera2D/GUI/Label.text = str(argent) + " €"
	return 1

func update_labels():
	for b in buildings:
		$Shop/VBoxContainer/GridContainer.find_child(b).find_child('Label').text = str(buildings[b]['number'])

func _on_button_pressed():
	# Augmentez la quantité d'argent de 1 (ou tout autre montant que vous souhaitez) chaque fois que le bouton est appuyé
	update_money(1)
	# Mettez à jour l'affichage de l'argent
	
	
func _buy_building(b: String):
	if update_money(-buildings[b]["price"]) == 1:
		buildings[b]["number"] += 1
		update_labels()


func _on_timer_timeout():
	for b in buildings:
		update_money(buildings[b]["number"] * buildings[b]["gain"] * buildings[b]["level"])


func _on_shop_pressed():
	$Camera2D.position[0] = 1080


func _on_home_pressed():
	$Camera2D.position[0] = 360


func _on_finance_pressed():
	$Camera2D.position[0] = 360 - 720# Replace with function body.
