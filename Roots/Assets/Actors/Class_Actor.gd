extends KinematicBody2D

class_name Class_Actor
# Atributos da Classe
export var isAlive = true;
export var health = 0;
export var gravity = 900;
export var velocity = Vector2.ZERO;
export var speed = 0;

# Métodos da Classe
func _ready() -> void:
	pass;

func _physics_process(delta: float) -> void:
	# Aplicando a força de gravidade nos objetos da classe "Class_Actor"
	velocity.y += gravity * delta;
	velocity = move_and_slide(velocity);

func Damage() -> void:
	pass;

func AliveStats() -> bool:
	return isAlive;
