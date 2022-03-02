#using scripts\core_common\array_shared.csc;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace zm_grappler;

/*
	Name: function_fc43ffde
	Namespace: zm_grappler
	Checksum: 0x20681521
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fc43ffde()
{
	level notify(520074535);
}

/*
	Name: function_89f2df9
	Namespace: zm_grappler
	Checksum: 0x3C67EC7
	Offset: 0x138
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_grappler", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_grappler
	Checksum: 0x80E017D5
	Offset: 0x180
	Size: 0xD4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "grappler_beam_source", 1, getminbitcountfornum(5), "int", &function_3adb9228, 1, 0);
	clientfield::register("scriptmover", "grappler_beam_target", 1, getminbitcountfornum(5), "int", &function_7e79839e, 1, 0);
	if(!isdefined(level.var_7e79839e))
	{
		level.var_7e79839e = "zod_beast_grapple_beam";
	}
}

/*
	Name: function_3adb9228
	Namespace: zm_grappler
	Checksum: 0x4C4D36E
	Offset: 0x260
	Size: 0xAA
	Parameters: 7
	Flags: None
*/
function function_3adb9228(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_da8e7aa4))
	{
		level.var_da8e7aa4 = [];
	}
	/#
		assert(!isdefined(level.var_da8e7aa4[bwastimejump]));
	#/
	level.var_da8e7aa4[bwastimejump] = self;
	level notify("grapple_id_" + bwastimejump);
}

/*
	Name: function_7e79839e
	Namespace: zm_grappler
	Checksum: 0x6B667E58
	Offset: 0x318
	Size: 0x136
	Parameters: 7
	Flags: None
*/
function function_7e79839e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(!isdefined(level.var_da8e7aa4))
	{
		level.var_da8e7aa4 = [];
	}
	if(!isdefined(level.var_da8e7aa4[bwastimejump]))
	{
		level waittilltimeout(1, "grapple_id_" + bwastimejump);
	}
	/#
		assert(isdefined(level.var_da8e7aa4[bwastimejump]));
	#/
	pivot = level.var_da8e7aa4[bwastimejump];
	if(!isdefined(pivot))
	{
		return;
	}
	if(bwastimejump)
	{
		thread function_34e3f163(self, "tag_origin", pivot, 0.05);
	}
	else
	{
		self notify(#"hash_1550b3a3e9b816f3");
	}
}

/*
	Name: function_34e3f163
	Namespace: zm_grappler
	Checksum: 0xE3C894D5
	Offset: 0x458
	Size: 0x84
	Parameters: 4
	Flags: None
*/
function function_34e3f163(player, tag, pivot, delay)
{
	player endon(#"hash_1550b3a3e9b816f3", #"death");
	pivot endon(#"death");
	wait(delay);
	thread grapple_beam(player, tag, pivot);
}

/*
	Name: function_f4b9c325
	Namespace: zm_grappler
	Checksum: 0x12D1F66D
	Offset: 0x4E8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_f4b9c325(notifyhash)
{
	level beam::kill(self.player, self.tag, self.pivot, "tag_origin", level.var_7e79839e);
}

/*
	Name: grapple_beam
	Namespace: zm_grappler
	Checksum: 0xF9AF47C1
	Offset: 0x540
	Size: 0xE4
	Parameters: 3
	Flags: None
*/
function grapple_beam(player, tag, pivot)
{
	self endoncallback(&function_f4b9c325, #"death");
	self.player = player;
	self.tag = tag;
	self.pivot = pivot;
	level beam::launch(player, tag, pivot, "tag_origin", level.var_7e79839e, 1);
	player waittill(#"hash_1550b3a3e9b816f3");
	level beam::kill(player, tag, pivot, "tag_origin", level.var_7e79839e);
}

