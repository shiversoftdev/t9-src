#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_game_module_utility;

/*
	Name: move_ring
	Namespace: zm_game_module_utility
	Checksum: 0x4CB05148
	Offset: 0x80
	Size: 0x122
	Parameters: 1
	Flags: None
*/
function move_ring(ring)
{
	positions = struct::get_array(ring.target, "targetname");
	positions = array::randomize(positions);
	level endon(#"end_game");
	while(true)
	{
		foreach(position in positions)
		{
			self moveto(position.origin, randomintrange(30, 45));
			self waittill(#"movedone");
		}
	}
}

/*
	Name: rotate_ring
	Namespace: zm_game_module_utility
	Checksum: 0x2650CF0A
	Offset: 0x1B0
	Size: 0x6E
	Parameters: 1
	Flags: None
*/
function rotate_ring(forward)
{
	level endon(#"end_game");
	dir = -360;
	if(forward)
	{
		dir = 360;
	}
	while(true)
	{
		self rotateyaw(dir, 9);
		wait(9);
	}
}

