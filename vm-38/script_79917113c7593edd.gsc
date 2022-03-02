#using script_13da4e6b98ca81a1;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_2d34cefc;

/*
	Name: function_d0c5690e
	Namespace: namespace_2d34cefc
	Checksum: 0x9EBB0347
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d0c5690e()
{
	level notify(1168169644);
}

#namespace ac130;

/*
	Name: init_shared
	Namespace: ac130
	Checksum: 0xF2EC4457
	Offset: 0x170
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	callback::on_localclient_connect(&on_localclient_connect);
	clientfield::function_a8bbc967("vehicle.selectedWeapon", #"vehicle_info", #"selectedweapon", 1, 2, "int", &function_db40057d, 0, 0);
	clientfield::function_a8bbc967("vehicle.flareCount", #"vehicle_info", #"flarecount", 1, 2, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("vehicle.inAC130", #"vehicle_info", #"inac130", 1, 1, "int", undefined, 0, 0);
	level.var_3e7d252b = getscriptbundle("killstreak_ac130");
}

/*
	Name: function_2c2bf9dc
	Namespace: ac130
	Checksum: 0x40FB1968
	Offset: 0x2C0
	Size: 0x8C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_2c2bf9dc(localclientnum, uimodel, weapon_name)
{
	weapon = getweapon(weapon_name);
	setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"hash_2bf958a355503d00"), uimodel), weapon.clipsize);
}

/*
	Name: on_localclient_connect
	Namespace: ac130
	Checksum: 0x663AC9B2
	Offset: 0x358
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function on_localclient_connect(localclientnum)
{
	function_2c2bf9dc(localclientnum, "maincannonClipSize", #"hash_17df39d53492b0bf");
	function_2c2bf9dc(localclientnum, "autocannonClipSize", #"hash_7b24d0d0d2823bca");
	function_2c2bf9dc(localclientnum, "chaingunClipSize", #"hash_721bd01efec90239");
}

/*
	Name: function_db40057d
	Namespace: ac130
	Checksum: 0x7B63AF7D
	Offset: 0x3E8
	Size: 0x16A
	Parameters: 7
	Flags: Linked
*/
function function_db40057d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname == 0)
	{
		return;
	}
	switch(bwastimejump)
	{
		case 1:
		{
			playsound(0, #"hash_731251c4b03b5b09", (0, 0, 0));
			self playrumbleonentity(binitialsnap, "ac130_weap_switch");
			break;
		}
		case 2:
		{
			playsound(0, #"hash_731251c4b03b5b09", (0, 0, 0));
			self playrumbleonentity(binitialsnap, "ac130_weap_switch");
			break;
		}
		case 3:
		{
			playsound(0, #"hash_731251c4b03b5b09", (0, 0, 0));
			self playrumbleonentity(binitialsnap, "ac130_weap_switch");
			break;
		}
	}
}

