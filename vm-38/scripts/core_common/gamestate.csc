#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace gamestate;

/*
	Name: function_4033e06
	Namespace: gamestate
	Checksum: 0x1CBCC5CE
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4033e06()
{
	level notify(1871729413);
}

/*
	Name: function_89f2df9
	Namespace: gamestate
	Checksum: 0x58DB7158
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
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
	Name: function_69452d92
	Namespace: gamestate
	Checksum: 0x44A81CC6
	Offset: 0x110
	Size: 0x14A
	Parameters: 1
	Flags: Event
*/
event function_69452d92(eventstruct)
{
	if(eventstruct.gamestate != game.state)
	{
		game.state = eventstruct.gamestate;
		/#
			println("" + game.state);
		#/
		callback::callback(#"hash_1184c2c2ed4c24b3", eventstruct);
		switch(eventstruct.gamestate)
		{
			case "playing":
			{
				callback::callback(#"hash_361e06db4b210e", eventstruct);
				break;
			}
			case "postgame":
			{
				callback::callback(#"hash_3ca80e35288a78d0", eventstruct);
				break;
			}
			case "shutdown":
			{
				callback::callback(#"hash_1b5be9017cd4b5fa", eventstruct);
				break;
			}
		}
	}
}

