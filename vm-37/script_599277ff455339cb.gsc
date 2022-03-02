#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\system_shared.csc;

#namespace uav;

/*
	Name: function_89f2df9
	Namespace: uav
	Checksum: 0x7839189D
	Offset: 0xC8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"uav", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: uav
	Checksum: 0x84F36F26
	Offset: 0x118
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
	Checksum: 0xE87C04D5
	Offset: 0x1F0
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
	Checksum: 0x88B84212
	Offset: 0x2E0
	Size: 0x2A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6fe2ffad()
{
	if(function_f99d2668())
	{
		return "killstreak_uav_wz";
	}
	return "killstreak_uav";
}

/*
	Name: function_86392832
	Namespace: uav
	Checksum: 0xE88BEFE8
	Offset: 0x318
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
	Checksum: 0x59B5CACB
	Offset: 0x3D8
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
	Checksum: 0xF66ECE37
	Offset: 0x440
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
	Checksum: 0xF5FEEF32
	Offset: 0x5C8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function fx_think(localclientnum)
{
	self waittill(#"death", #"hash_780b1fb5c050cdc0");
	self stoploopsound(self.var_2695439d);
}

