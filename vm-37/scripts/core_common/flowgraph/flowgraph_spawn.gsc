#namespace flowgraph_spawn;

/*
	Name: spawnentityfromspawner
	Namespace: flowgraph_spawn
	Checksum: 0x996EF30B
	Offset: 0x60
	Size: 0x72
	Parameters: 6
	Flags: None
*/
function spawnentityfromspawner(x, sp_spawner, str_targetname, b_force_spawn, b_make_room, b_infinite_spawn)
{
	e_spawned = sp_spawner spawnfromspawner(str_targetname, b_force_spawn, b_make_room, b_infinite_spawn);
	return array(isdefined(e_spawned), e_spawned);
}

