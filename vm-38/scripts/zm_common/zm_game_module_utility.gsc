#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_game_module_utility;

/*
	Name: function_dfdc9ed4
	Namespace: zm_game_module_utility
	Checksum: 0x424375E4
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dfdc9ed4()
{
	level notify(1141902933);
}

/*
	Name: move_ring
	Namespace: zm_game_module_utility
	Checksum: 0x11D517D7
	Offset: 0xA0
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
	Checksum: 0x75C4125
	Offset: 0x1D0
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

