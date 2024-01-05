#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace wasp;

/*
	Name: __init__system__
	Namespace: wasp
	Checksum: 0x70F34F4B
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wasp", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: wasp
	Checksum: 0x35F041CC
	Offset: 0x110
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "rocket_wasp_hijacked", 1, 1, "int", &handle_lod_display_for_driver, 0, 0);
	level.sentinelbundle = getscriptbundle("killstreak_sentinel");
	if(isdefined(level.sentinelbundle))
	{
		vehicle::add_vehicletype_callback(level.sentinelbundle.ksvehicle, &spawned);
	}
}

/*
	Name: spawned
	Namespace: wasp
	Checksum: 0xBD9990CF
	Offset: 0x1C8
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function spawned(localclientnum)
{
	self.killstreakbundle = level.sentinelbundle;
}

/*
	Name: handle_lod_display_for_driver
	Namespace: wasp
	Checksum: 0xC3E5AC0
	Offset: 0x1F0
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function handle_lod_display_for_driver(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(isdefined(self))
	{
		if(self function_4add50a7())
		{
			self sethighdetail(1);
			waitframe(1);
			self vehicle::lights_off(bwastimejump);
		}
	}
}

