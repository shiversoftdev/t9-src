#namespace namespace_fa941a1;

/*
	Name: function_8bf5d945
	Namespace: namespace_fa941a1
	Checksum: 0xBDE3E66E
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8bf5d945()
{
	level notify(1746686958);
}

#namespace gamestate;

/*
	Name: is_state
	Namespace: gamestate
	Checksum: 0x1AC05332
	Offset: 0x80
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
	Checksum: 0x9A6B5C35
	Offset: 0xA8
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
	Checksum: 0xBCE36C14
	Offset: 0xF0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function is_shutting_down()
{
	return game.state == #"shutdown";
}

