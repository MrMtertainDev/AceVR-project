extends Node3D

var acelerometro = Vector3()

var angulo_vertical = 0

#girar camara al igual que el movil
var angulo_horizontal = 0
var inverso_horizontal = 0

func _process(delta):
	
	acelerometro = Input.get_accelerometer()
	
	angulo_vertical = deg_to_rad(acelerometro.z * 9)
	angulo_horizontal = atan2(acelerometro.x,acelerometro.y)
	inverso_horizontal = angulo_horizontal + PI
	
	#giro vertical
	$pivote.rotation.x += (angulo_vertical - $pivote.rotation.x) * delta * Ajustes.sensibilidad

	#giro horizontal
	#region arreglar tirones horizontales
	if (angulo_horizontal - rotation.y) > PI:
		rotation.y += PI * 2
	if (angulo_horizontal - rotation.y) < -PI:
		rotation.y -= PI * 2
	#endregion
	rotation.y += (angulo_horizontal - rotation.y) * delta * Ajustes.sensibilidad
	
	#giro inverso horizontal
	#region arreglar tirones de inverso horizontal
	if (inverso_horizontal - $pivote.rotation.z) > PI:
		$pivote.rotation.z += PI * 2
	if (inverso_horizontal - $pivote.rotation.z) < -PI:
		$pivote.rotation.z -= PI * 2
	#endregion
	$pivote.rotation.z += (inverso_horizontal - $pivote.rotation.z) * delta * Ajustes.sensibilidad




