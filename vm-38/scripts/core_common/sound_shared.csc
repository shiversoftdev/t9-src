#using script_71463f7d72636705;

#namespace sound_shared;

/*
	Name: function_2b898297
	Namespace: sound_shared
	Checksum: 0xC30C2638
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2b898297()
{
	level notify(-295196481);
}

#namespace sound;

/*
	Name: loop_fx_sound
	Namespace: sound
	Checksum: 0x18A531F4
	Offset: 0xA0
	Size: 0x8C
	Parameters: 4
	Flags: Linked
*/
function loop_fx_sound(clientnum, alias, origin, ender)
{
	sound_entity = spawn(clientnum, origin, "script_origin");
	if(isdefined(ender))
	{
		thread loop_delete(ender, sound_entity);
		self endon(ender);
	}
	sound_entity playloopsound(alias);
}

/*
	Name: play_in_space
	Namespace: sound
	Checksum: 0x35259931
	Offset: 0x138
	Size: 0x34
	Parameters: 3
	Flags: Linked
*/
function play_in_space(localclientnum, alias, origin)
{
	playsound(localclientnum, alias, origin);
}

/*
	Name: loop_delete
	Namespace: sound
	Checksum: 0x943ED535
	Offset: 0x178
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function loop_delete(ender, sound_entity)
{
	self waittill(ender);
	sound_entity delete();
}

/*
	Name: play_on_client
	Namespace: sound
	Checksum: 0xCF2DFBB5
	Offset: 0x1B8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function play_on_client(sound_alias)
{
	players = level.localplayers;
	playsound(0, sound_alias, players[0].origin);
}

/*
	Name: loop_on_client
	Namespace: sound
	Checksum: 0xACDDD3D7
	Offset: 0x210
	Size: 0x82
	Parameters: 4
	Flags: None
*/
function loop_on_client(sound_alias, min_delay, max_delay, end_on)
{
	players = level.localplayers;
	if(isdefined(end_on))
	{
		level endon(end_on);
	}
	for(;;)
	{
		play_on_client(sound_alias);
		wait(min_delay + randomfloat(max_delay));
	}
}

