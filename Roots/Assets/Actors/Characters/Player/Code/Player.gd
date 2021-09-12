extends Class_Actor

var direction = Vector2.ZERO;

var health = 100;
var hungryBarr = 100;
var thirstBarr = 100;
const runSpeed = 200;

# Essa função roda sempre na primeira vez que o objeto é chamado (similar a um método construtor)
func _ready() -> void:
	STAMINA = 100;	
	JUMP_HEIGHT = -300;
	SPEED = 300;

func _physics_process(delta: float) -> void:
	# Recebe inputs de direção
	direction = PlayerMoviment(VELOCITY);
	
	
	
	# Altera a velocidade baseada nos inputs de direção
	VELOCITY = move_and_slide(direction, UP_SIDE);

func PlayerMoviment(velocity: Vector2) -> Vector2:
	# Movimenta o jogador
	if Input.is_action_pressed("Player_MoveRight"):
		if Input.is_action_pressed("Player_Running"):
			VELOCITY.x = SPEED + runSpeed;
		else:
			VELOCITY.x = SPEED;
	elif Input.is_action_pressed("Player_MoveLeft"):
		if Input.is_action_pressed("Player_Running"):
			VELOCITY.x = -SPEED - runSpeed;
		else:
			VELOCITY.x = -SPEED;
	else:
		VELOCITY.x = 0;
	
	# verifica se o jogador esta em uma superfície para dar o salto
	if is_on_floor():
		if Input.is_action_just_pressed("Player_Jump"):
			VELOCITY.y = JUMP_HEIGHT;
	
	return VELOCITY;
