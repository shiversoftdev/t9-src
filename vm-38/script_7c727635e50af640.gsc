#using scripts\zm_common\zm_utility.csc;
#using script_4e53735256f112ac;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_1fd59e39;

/*
	Name: function_42a64e5a
	Namespace: namespace_1fd59e39
	Checksum: 0xA8A94B4D
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_42a64e5a()
{
	level notify(-1540090234);
}

/*
	Name: __init__system__
	Namespace: namespace_1fd59e39
	Checksum: 0x431FA130
	Offset: 0x100
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7fd3c8de50685459", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_1fd59e39
	Checksum: 0x5D0B5494
	Offset: 0x150
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "" + #"hash_59400ab6cbfaec5d", 1, 1, "int", &function_3d1947be, 0, 0);
	callback::on_spawned(&on_spawned);
}

/*
	Name: function_3d1947be
	Namespace: namespace_1fd59e39
	Checksum: 0x958E5204
	Offset: 0x1D8
	Size: 0x394
	Parameters: 7
	Flags: Linked
*/
function function_3d1947be(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(!isdefined(level.var_119220bf))
	{
		level.var_119220bf = [];
	}
	n_entity = self getentitynumber();
	if(!isdefined(level.var_119220bf[n_entity]))
	{
		level.var_119220bf[n_entity] = spawnstruct();
	}
	if(bwastimejump)
	{
		if(zm_utility::function_f8796df3(fieldname))
		{
			self playrenderoverridebundle(#"hash_6ec5fcc31672bb85");
			if(self postfx::function_556665f2(#"hash_5bcfd80691463dec"))
			{
				self postfx::stoppostfxbundle(#"hash_5bcfd80691463dec");
			}
			self postfx::playpostfxbundle(#"hash_5bcfd80691463dec");
			if(!isdefined(level.var_119220bf[n_entity].var_6ebc510f) && self function_da43934d())
			{
				level.var_119220bf[n_entity].var_6ebc510f = playfxoncamera(fieldname, #"hash_7fcde6a254a7228", (0, 0, 0), (1, 0, 0), (0, 0, 1));
			}
			self thread function_222efb26(fieldname);
		}
		else
		{
			self playrenderoverridebundle(#"hash_733f9eb274c33ff8");
			if(!isdefined(level.var_119220bf[n_entity].var_afd98b5))
			{
				level.var_119220bf[n_entity].var_afd98b5 = util::playfxontag(fieldname, #"hash_803ea6a2550a53a", self, "j_head");
			}
			if(!isdefined(level.var_119220bf[n_entity].var_895c513a))
			{
				level.var_119220bf[n_entity].var_895c513a = util::playfxontag(fieldname, #"hash_ee42b8ead6d79d1", self, "j_spine4");
			}
		}
		if(!isdefined(level.var_119220bf[n_entity].var_631ff0ad))
		{
			self playsound(fieldname, #"hash_6f1e98cba03ff12a", self.origin + vectorscale((0, 0, 1), 75));
			level.var_119220bf[n_entity].var_631ff0ad = self playloopsound(#"hash_493bcaf7ad0973e", undefined, vectorscale((0, 0, 1), 75));
		}
	}
	else
	{
		self function_c8e90b89(fieldname);
	}
}

/*
	Name: function_222efb26
	Namespace: namespace_1fd59e39
	Checksum: 0x85CF65C4
	Offset: 0x578
	Size: 0x11E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_222efb26(localclientnum)
{
	self notify("7ea2bf50c9563158");
	self endon("7ea2bf50c9563158");
	self endon(#"death", #"hash_69b6a912d9991761");
	while(true)
	{
		var_b1b72524 = self isplayerads();
		if(self function_d2503806(#"hash_6ec5fcc31672bb85") && var_b1b72524)
		{
			self stoprenderoverridebundle(#"hash_6ec5fcc31672bb85");
		}
		else if(!self function_d2503806(#"hash_6ec5fcc31672bb85") && !var_b1b72524)
		{
			self playrenderoverridebundle(#"hash_6ec5fcc31672bb85");
		}
		waitframe(1);
	}
}

/*
	Name: on_spawned
	Namespace: namespace_1fd59e39
	Checksum: 0xDA012B28
	Offset: 0x6A0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_spawned(localclientnum)
{
	self function_c8e90b89(localclientnum);
}

/*
	Name: function_c8e90b89
	Namespace: namespace_1fd59e39
	Checksum: 0x8B638479
	Offset: 0x6D0
	Size: 0x2FE
	Parameters: 1
	Flags: Linked
*/
function function_c8e90b89(localclientnum)
{
	n_entity = self getentitynumber();
	self notify(#"hash_69b6a912d9991761");
	if(self function_d2503806(#"hash_6ec5fcc31672bb85") && self function_21c0fa55())
	{
		self stoprenderoverridebundle(#"hash_6ec5fcc31672bb85");
	}
	if(self function_d2503806(#"hash_733f9eb274c33ff8"))
	{
		self stoprenderoverridebundle(#"hash_733f9eb274c33ff8");
	}
	if(self postfx::function_556665f2(#"hash_5bcfd80691463dec") && self function_21c0fa55())
	{
		self postfx::exitpostfxbundle(#"hash_5bcfd80691463dec");
	}
	if(isdefined(level.var_119220bf[n_entity].var_6ebc510f))
	{
		stopfx(localclientnum, level.var_119220bf[n_entity].var_6ebc510f);
		level.var_119220bf[n_entity].var_6ebc510f = undefined;
	}
	if(isdefined(level.var_119220bf[n_entity].var_afd98b5))
	{
		stopfx(localclientnum, level.var_119220bf[n_entity].var_afd98b5);
		level.var_119220bf[n_entity].var_afd98b5 = undefined;
	}
	if(isdefined(level.var_119220bf[n_entity].var_895c513a))
	{
		stopfx(localclientnum, level.var_119220bf[n_entity].var_895c513a);
		level.var_119220bf[n_entity].var_895c513a = undefined;
	}
	if(isdefined(level.var_119220bf[n_entity].var_631ff0ad))
	{
		self playsound(localclientnum, #"hash_5a6fa72d8d9f935f", self.origin + vectorscale((0, 0, 1), 75));
		self stoploopsound(level.var_119220bf[n_entity].var_631ff0ad);
		level.var_119220bf[n_entity].var_631ff0ad = undefined;
	}
}

