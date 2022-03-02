#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace gamestate;

/*
	Name: function_89f2df9
	Namespace: gamestate
	Checksum: 0xF7F4D62C
	Offset: 0x70
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
	Name: function_69452d92
	Namespace: gamestate
	Checksum: 0x8233CB5
	Offset: 0xF0
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

