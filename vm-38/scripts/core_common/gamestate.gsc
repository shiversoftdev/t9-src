#using scripts\core_common\system_shared.gsc;
#using script_32c8b5b0eb2854f3;

#namespace gamestate;

/*
	Name: function_b11c396
	Namespace: gamestate
	Checksum: 0x7678AEBA
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b11c396()
{
	level notify(792096399);
}

/*
	Name: __init__system__
	Namespace: gamestate
	Checksum: 0x58DB7158
	Offset: 0x90
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
	Checksum: 0x49A92143
	Offset: 0xD8
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
	Checksum: 0x5324827A
	Offset: 0x110
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

