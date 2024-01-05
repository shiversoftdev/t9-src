#using scripts\core_common\system_shared.gsc;
#using script_32c8b5b0eb2854f3;

#namespace gamestate;

/*
	Name: __init__system__
	Namespace: gamestate
	Checksum: 0xF7F4D62C
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gamestate", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gamestate
	Checksum: 0xB635955B
	Offset: 0xB8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(game.state))
	{
		game.state = #"pregame";
	}
}

/*
	Name: set_state
	Namespace: gamestate
	Checksum: 0xFAAD457D
	Offset: 0xF0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function set_state(state)
{
	game.state = state;
	function_cab6408d(state);
	level notify(state);
	/#
		println("" + state);
	#/
}

