#using scripts\core_common\system_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace counteruav;

/*
	Name: __init__system__
	Namespace: counteruav
	Checksum: 0x54BF99FB
	Offset: 0xF0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"counteruav", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: counteruav
	Checksum: 0xD1D2B707
	Offset: 0x140
	Size: 0xD8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "counteruav", 1, 1, "int", &enabled, 0, 0);
	clientfield::register("scriptmover", "counteruav_fx", 1, 1, "int", &function_5a528883, 0, 0);
	level.var_8c4291cb = [];
	level.var_a03cd507 = getscriptbundle(function_df836293());
	level.counteruavs = [];
}

/*
	Name: function_df836293
	Namespace: counteruav
	Checksum: 0x66657BD5
	Offset: 0x220
	Size: 0x2A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_df836293()
{
	if(sessionmodeiswarzonegame())
	{
		return "killstreak_counteruav_wz";
	}
	return "killstreak_counteruav";
}

/*
	Name: enabled
	Namespace: counteruav
	Checksum: 0xAEE27CEE
	Offset: 0x258
	Size: 0xE6
	Parameters: 7
	Flags: Linked
*/
function enabled(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self renderoverridebundle::function_f4eab437(fieldname, 1, #"rob_sonar_set_enemy");
		function_e5a9ae33(fieldname, self getentitynumber(), level.var_a03cd507.var_c23de6e6);
		self thread counteruav_think(fieldname);
		self.killstreakbundle = level.var_a03cd507;
	}
	else
	{
		self notify(#"counteruav_off");
	}
}

/*
	Name: counteruav_think
	Namespace: counteruav
	Checksum: 0x3AA10400
	Offset: 0x348
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function counteruav_think(localclientnum)
{
	arrayremovevalue(level.counteruavs, undefined, 0);
	level.counteruavs[level.counteruavs.size] = self;
	self waittill(#"death", #"counteruav_off");
	function_4236032b(localclientnum, self getentitynumber());
	arrayremovevalue(level.counteruavs, self, 0);
}

/*
	Name: function_d8f4d00d
	Namespace: counteruav
	Checksum: 0x86195E42
	Offset: 0x408
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_d8f4d00d()
{
	self endon(#"death", #"counteruav_off");
	level waittill("new_cuav_" + self.team);
	if(isdefined(self))
	{
		self function_811196d1(1);
	}
}

/*
	Name: function_5a528883
	Namespace: counteruav
	Checksum: 0x9FD2E609
	Offset: 0x478
	Size: 0x164
	Parameters: 7
	Flags: Linked
*/
function function_5a528883(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self.killstreakbundle))
	{
		self.killstreakbundle = level.var_a03cd507;
	}
	if(!self function_ca024039())
	{
		if(bwastimejump)
		{
			self.var_2695439d = self playloopsound(#"veh_uav_engine_loop", 1);
			self thread fx_think(fieldname);
		}
		else
		{
			self notify(#"hash_286d0c022220571a");
		}
	}
	if(bwastimejump)
	{
		self setcompassicon(self.killstreakbundle.var_cb98fbf7);
		self function_dce2238(1);
		self function_8e04481f();
		level notify("new_cuav_" + self.team);
		self thread function_d8f4d00d();
	}
}

/*
	Name: fx_think
	Namespace: counteruav
	Checksum: 0x70862A47
	Offset: 0x5E8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function fx_think(localclientnum)
{
	self waittill(#"death", #"hash_286d0c022220571a");
	self stoploopsound(self.var_2695439d);
}

