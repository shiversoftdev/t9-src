#using scripts\killstreaks\killstreak_vehicle.csc;
#using scripts\killstreaks\killstreak_detect.csc;
#using script_18b9d0e77614c97;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace recon_car;

/*
	Name: __init__system__
	Namespace: recon_car
	Checksum: 0xE89EE2FA
	Offset: 0xA0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"recon_car", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: recon_car
	Checksum: 0xA317D1B
	Offset: 0xF0
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	killstreak_detect::init_shared();
	bundle = getscriptbundle("killstreak_recon_car");
	level.var_af161ca6 = bundle;
	killstreak_vehicle::init_killstreak(bundle);
	vehicle::add_vehicletype_callback(bundle.ksvehicle, &spawned);
}

/*
	Name: spawned
	Namespace: recon_car
	Checksum: 0xD0E920D4
	Offset: 0x180
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function spawned(localclientnum)
{
	self.killstreakbundle = level.var_af161ca6;
}

/*
	Name: function_3665db4d
	Namespace: recon_car
	Checksum: 0x15D043CA
	Offset: 0x1A8
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_3665db4d()
{
	function_334b8df9(level.var_af161ca6.var_1c30ba81, -1);
}

/*
	Name: function_b8d95025
	Namespace: recon_car
	Checksum: 0xA278A9F0
	Offset: 0x1E0
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_b8d95025()
{
	function_58250a30(level.var_af161ca6.var_1c30ba81);
}

