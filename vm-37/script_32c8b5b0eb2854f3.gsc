#namespace gamestate;

/*
	Name: is_state
	Namespace: gamestate
	Checksum: 0x8E80915A
	Offset: 0x60
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function is_state(state)
{
	return game.state == state;
}

/*
	Name: is_game_over
	Namespace: gamestate
	Checksum: 0x90A89F7B
	Offset: 0x88
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function is_game_over()
{
	return game.state == #"postgame" || game.state == #"shutdown";
}

/*
	Name: is_shutting_down
	Namespace: gamestate
	Checksum: 0xC029590A
	Offset: 0xD0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function is_shutting_down()
{
	return game.state == #"shutdown";
}

