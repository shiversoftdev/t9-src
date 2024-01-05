#using script_7a8059ca02b7b09e;
#using scripts\core_common\system_shared.gsc;

#namespace telemetry;

/*
	Name: function_a0d929
	Namespace: telemetry
	Checksum: 0xD5FB6764
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a0d929()
{
	level notify(-1007144893);
}

/*
	Name: __init__system__
	Namespace: telemetry
	Checksum: 0x1423DDAE
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_53528dbbf6cd15c4", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: telemetry
	Checksum: 0x5988303C
	Offset: 0xD8
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(isdefined(game))
	{
		if(!isdefined(game.telemetry))
		{
			game.telemetry = {};
		}
		if(!isdefined(game.telemetry.player_count))
		{
			game.telemetry.player_count = 0;
		}
		if(!isdefined(game.telemetry.life_count))
		{
			game.telemetry.life_count = 0;
		}
	}
	else
	{
		/#
			println("");
		#/
	}
}

