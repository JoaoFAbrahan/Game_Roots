extends Class_Actor

var direction = Vector2.ZERO;

var health = 100;
var barrHungry = 100;
var barrThirst = 100;

func _ready() -> void:
	STAMINA = 100;	
	JUMP_HEIGHT = -300;
	SPEED = 300;

func _physics_process(delta: float) -> void:
	# Recebe input de direção
	direction = MovementPlayer(VELOCITY);
	
	# Altera a velocidade baseada nos inputs de direção
	VELOCITY = move_and_slide(direction, UP_SIDE);

func MovementPlayer(velocity: Vector2) -> Vector2:
	# Movimenta o jogador
	if Input.is_action_pressed("Player_MoveRight"):
		VELOCITY.x = SPEED;
	elif Input.is_action_pressed("Player_MoveLeft"):
		VELOCITY.x = -SPEED;
	else:
		VELOCITY.x = 0;
	
	# verifica se o jogador esta em uma superfície para dar o salto
	if is_on_floor():
		if Input.is_action_just_pressed("Player_Jump"):
			VELOCITY.y = JUMP_HEIGHT;
	
	return VELOCITY;
