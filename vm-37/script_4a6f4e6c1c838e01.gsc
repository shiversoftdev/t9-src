#using script_1883fa4e60abbf9f;
#using script_912160eeb6a2d51;
#using script_21cbc79d1d70402;
#using script_6c5ee33879e077f8;

#namespace stealth_init;

/*
	Name: main
	Namespace: stealth_init
	Checksum: 0xB21984B0
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function main()
{
	namespace_393f6012::function_f9682fd();
}

/*
	Name: set_stealth_mode
	Namespace: stealth_init
	Checksum: 0x6E6E5281
	Offset: 0xA0
	Size: 0x1B0
	Parameters: 3
	Flags: Linked
*/
function set_stealth_mode(enabled, var_901d9fb2, var_4a9f6f96)
{
	if(enabled)
	{
		if(isdefined(var_901d9fb2) && isdefined(var_4a9f6f96))
		{
			level thread namespace_979752dc::stealth_music(var_901d9fb2, var_4a9f6f96);
		}
		level thread namespace_6c0cd084::threat_sight_set_enabled(1);
		foreach(player in getplayers())
		{
			player thread stealth_player::main();
		}
		setsaveddvar(#"hash_3e8c4724c1db5fe7", 0);
	}
	else
	{
		level thread namespace_979752dc::stealth_music_stop();
		level thread namespace_6c0cd084::threat_sight_set_enabled(0);
		setsaveddvar(#"hash_3e8c4724c1db5fe7", 1);
	}
	if(isdefined(level.stealth.fnsetstealthmode))
	{
		level thread [[level.stealth.fnsetstealthmode]](enabled, var_901d9fb2, var_4a9f6f96);
	}
}

