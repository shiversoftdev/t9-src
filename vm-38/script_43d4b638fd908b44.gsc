#namespace flowgraph_spawn;

/*
	Name: function_6acc1927
	Namespace: flowgraph_spawn
	Checksum: 0x75A80F48
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6acc1927()
{
	level notify(1625800429);
}

/*
	Name: spawnentityfromspawner
	Namespace: flowgraph_spawn
	Checksum: 0xE4B3E963
	Offset: 0x80
	Size: 0x72
	Parameters: 6
	Flags: None
*/
function spawnentityfromspawner(x, sp_spawner, str_targetname, b_force_spawn, b_make_room, b_infinite_spawn)
{
	e_spawned = sp_spawner spawnfromspawner(str_targetname, b_force_spawn, b_make_room, b_infinite_spawn);
	return array(isdefined(e_spawned), e_spawned);
}

