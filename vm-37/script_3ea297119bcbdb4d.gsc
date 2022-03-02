#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_a376209a;

/*
	Name: main
	Namespace: namespace_a376209a
	Checksum: 0x4AF8503D
	Offset: 0xA0
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	callback::function_d46d9315(&function_d46d9315);
}

/*
	Name: function_d46d9315
	Namespace: namespace_a376209a
	Checksum: 0xB82292DC
	Offset: 0xD8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_d46d9315(localclientnum)
{
	waitframe(1);
	level thread nuked_doomsday_clock_init(localclientnum);
}

/*
	Name: nuked_doomsday_clock_init
	Namespace: namespace_a376209a
	Checksum: 0xFB792BB0
	Offset: 0x110
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function nuked_doomsday_clock_init(localclientnum)
{
	min_hand_model = getent(localclientnum, "clock_min_hand", "targetname");
	sec_hand_model = getent(localclientnum, "clock_sec_hand", "targetname");
	timelimit = getgametypesetting(#"timelimit");
	if(!getdvarint(#"hash_151d18a5663d31ce", 1) || !isdefined(min_hand_model) || !isdefined(sec_hand_model) || !isdefined(timelimit))
	{
		return;
	}
	if(timelimit > 0)
	{
		min_hand_model rotatepitch(360, timelimit * 60);
		sec_hand_model rotatepitch(360 * timelimit, timelimit * 60);
	}
	else
	{
		sec_hand_model thread nuked_doomsday_clock_seconds_think();
	}
}

/*
	Name: nuked_doomsday_clock_seconds_think
	Namespace: namespace_a376209a
	Checksum: 0xC3D849EF
	Offset: 0x270
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function nuked_doomsday_clock_seconds_think()
{
	while(isdefined(self) && getdvarint(#"hash_151d18a5663d31ce", 1))
	{
		self rotatepitch(360, 60);
		self waittill(#"rotatedone");
	}
}

