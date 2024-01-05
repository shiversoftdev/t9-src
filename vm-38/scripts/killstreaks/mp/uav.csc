#using scripts\core_common\system_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace uav;

/*
	Name: function_44b01c56
	Namespace: uav
	Checksum: 0x9F16A0F1
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_44b01c56()
{
	level notify(1424619032);
}

/*
	Name: __init__system__
	Namespace: uav
	Checksum: 0x698F904A
	Offset: 0xE8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"uav", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: uav
	Checksum: 0x82347B30
	Offset: 0x138
	Size: 0xD0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "uav", 1, 1, "int", &spawned, 0, 0);
	clientfield::register("scriptmover", "uav_fx", 1, 1, "int", &function_5a528883, 0, 0);
	level.var_da44d61b = getscriptbundle(function_6fe2ffad());
	level.uavs = [];
}

/*
	Name: spawned
	Namespace: uav
	Checksum: 0x38251C35
	Offset: 0x210
	Size: 0xE6
	Parameters: 7
	Flags: Linked
*/
function spawned(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		function_1877b7a1(fieldname, self getentitynumber(), level.var_da44d61b.var_dd0e1146, level.var_da44d61b.var_dd0e1146);
		self thread function_86392832(fieldname);
		self renderoverridebundle::function_f4eab437(fieldname, 1, #"rob_sonar_set_enemy");
	}
	else
	{
		self notify(#"hash_6ff151958b7d1075");
	}
}

/*
	Name: function_6fe2ffad
	Namespace: uav
	Checksum: 0xA63788A
	Offset: 0x300
	Size: 0x2A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6fe2ffad()
{
	if(sessionmodeiswarzonegame())
	{
		return "killstreak_uav_wz";
	}
	return "killstreak_uav";
}

/*
	Name: function_86392832
	Namespace: uav
	Checksum: 0xF8976EB9
	Offset: 0x338
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_86392832(localclientnum)
{
	arrayremovevalue(level.uavs, undefined, 0);
	level.uavs[level.uavs.size] = self;
	self waittill(#"death", #"hash_6ff151958b7d1075");
	function_74ef482c(localclientnum, self getentitynumber());
	arrayremovevalue(level.uavs, self, 0);
}

/*
	Name: function_9784b3bf
	Namespace: uav
	Checksum: 0xF3A8AB25
	Offset: 0x3F8
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_9784b3bf()
{
	self endon(#"death", #"hash_6ff151958b7d1075");
	level waittill(#"hash_1b7241563645e156");
	if(isdefined(self))
	{
		self function_811196d1(1);
	}
}

/*
	Name: function_5a528883
	Namespace: uav
	Checksum: 0xB7565B9D
	Offset: 0x460
	Size: 0x17E
	Parameters: 7
	Flags: Linked
*/
function function_5a528883(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.killstreakbundle))
	{
		self.killstreakbundle = level.var_da44d61b;
	}
	if(!self function_ca024039())
	{
		if(bwastimejump)
		{
			self.var_2695439d = self playloopsound(#"veh_uav_engine_loop", 1);
			self thread fx_think(fieldname);
			self.killstreakbundle = level.var_da44d61b;
			self setcompassicon(self.killstreakbundle.var_cb98fbf7);
			self function_dce2238(1);
			self function_8e04481f();
			self function_27351ff6();
			level notify(#"hash_1b7241563645e156");
			self thread function_9784b3bf();
		}
		else
		{
			self notify(#"hash_780b1fb5c050cdc0");
		}
	}
}

/*
	Name: fx_think
	Namespace: uav
	Checksum: 0xC32E4C6C
	Offset: 0x5E8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function fx_think(localclientnum)
{
	self waittill(#"death", #"hash_780b1fb5c050cdc0");
	self stoploopsound(self.var_2695439d);
}

