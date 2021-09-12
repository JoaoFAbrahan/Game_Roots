extends KinematicBody2D

class_name Class_Actor
# Atributos da Classe
export var IS_ALIVE = true;
export var STAMINA = 0;

const GRAVITY = 9;
const UP_SIDE = Vector2(0,-1);

export var VELOCITY = Vector2.ZERO;
export var SPEED = 150;
export var JUMP_HEIGHT = 0;

# Métodos da Classe
func _physics_process(delta: float) -> void:
	# Adiciona gravidade constante
	VELOCITY.y += GRAVITY;
	
func AliveStats() -> bool:
	return IS_ALIVE;
