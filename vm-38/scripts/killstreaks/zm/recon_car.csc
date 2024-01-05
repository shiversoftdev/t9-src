#using scripts\killstreaks\killstreak_vehicle.csc;
#using scripts\killstreaks\killstreak_detect.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace recon_car;

/*
	Name: function_7a31d0de
	Namespace: recon_car
	Checksum: 0x42E2D0FE
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7a31d0de()
{
	level notify(2008670475);
}

/*
	Name: __init__system__
	Namespace: recon_car
	Checksum: 0x3360A88B
	Offset: 0x108
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
	Checksum: 0x8F550722
	Offset: 0x158
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_45aec06707484fef")))
	{
		return false;
	}
	clientfield::register("vehicle", "" + #"hash_5b4b44738e08c9b9", 28000, 1, "counter", &function_86e8d9af, 0, 0);
	killstreak_detect::init_shared();
	level.var_af161ca6 = getscriptbundle("killstreak_recon_car_zm");
	killstreak_vehicle::init_killstreak(level.var_af161ca6);
	vehicle::add_vehicletype_callback(level.var_af161ca6.ksvehicle, &spawned);
}

/*
	Name: spawned
	Namespace: recon_car
	Checksum: 0x5BAB9760
	Offset: 0x268
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function spawned(localclientnum)
{
	self.killstreakbundle = level.var_af161ca6;
}

/*
	Name: function_86e8d9af
	Namespace: recon_car
	Checksum: 0x8A50B6B9
	Offset: 0x290
	Size: 0xE4
	Parameters: 7
	Flags: Linked
*/
function function_86e8d9af(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	str_fx = #"hash_5627dee1716af1be";
	if(self.model === #"hash_7dde995ef49216f")
	{
		str_fx = #"hash_1fd4c0687c9801d2";
	}
	util::playfxontag(bwastimejump, str_fx, self, "tag_origin");
	self playsound(bwastimejump, #"hash_3b04ee47d31da098");
	self playrumbleonentity(bwastimejump, "damage_heavy");
}

