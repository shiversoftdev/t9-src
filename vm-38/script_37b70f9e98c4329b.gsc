#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_3b3d42f;

/*
	Name: function_c4a48809
	Namespace: namespace_3b3d42f
	Checksum: 0xFED0A909
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c4a48809()
{
	level notify(1512619873);
}

/*
	Name: function_89f2df9
	Namespace: namespace_3b3d42f
	Checksum: 0x794AC9D
	Offset: 0x188
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4e5aab38f14a7d66", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3b3d42f
	Checksum: 0xB8699C9B
	Offset: 0x1D0
	Size: 0x154
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "hs_hound_toss_damage_cf", 1, 1, "counter", &function_1b07848c, 0, 0);
	clientfield::register("scriptmover", "hs_hound_toss_miss_cf", 1, 1, "counter", &function_dc0e2c48, 0, 0);
	clientfield::register("scriptmover", "hs_swarm_state", 1, 1, "counter", &function_440e968, 0, 0);
	clientfield::register("allplayers", "hs_swarm_damage", 1, 1, "counter", &function_64d1f09b, 1, 0);
	ai::add_archetype_spawn_function(#"hulk", &function_2a4100e7);
}

/*
	Name: function_1b07848c
	Namespace: namespace_3b3d42f
	Checksum: 0x659455A9
	Offset: 0x330
	Size: 0xCC
	Parameters: 7
	Flags: Linked, Private
*/
function private function_1b07848c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isalive(self) || self !== function_5c10bd79(bwastimejump))
	{
		return;
	}
	earthquake(bwastimejump, 0.5, 0.1, self.origin, 40);
	function_36e4ebd4(bwastimejump, "damage_heavy");
}

/*
	Name: function_dc0e2c48
	Namespace: namespace_3b3d42f
	Checksum: 0xA94BCD5D
	Offset: 0x408
	Size: 0x1D4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_dc0e2c48(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	e_player = function_5c10bd79(bwastimejump);
	n_dist = distancesquared(self.origin, e_player.origin);
	var_a34b4731 = 1000000;
	if(var_a34b4731 > 0)
	{
		n_scale = (var_a34b4731 - n_dist) / var_a34b4731;
	}
	else
	{
		return;
	}
	if(n_scale > 1 || n_scale < 0)
	{
		return;
	}
	n_scale = n_scale * 0.25;
	if(n_scale <= 0.01)
	{
		return;
	}
	earthquake(bwastimejump, n_scale, 0.1, self.origin, n_dist);
	if(n_scale <= 0.25 && n_scale > 0.2)
	{
		function_36e4ebd4(bwastimejump, "anim_med");
	}
	else
	{
		if(n_scale <= 0.2 && n_scale > 0.1)
		{
			function_36e4ebd4(bwastimejump, "damage_light");
		}
		else
		{
			function_36e4ebd4(bwastimejump, "damage_light");
		}
	}
}

/*
	Name: function_440e968
	Namespace: namespace_3b3d42f
	Checksum: 0x1D6EC42B
	Offset: 0x5E8
	Size: 0x122
	Parameters: 7
	Flags: Linked, Private
*/
function private function_440e968(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(isdefined(self.swarm_fx))
	{
		stopfx(fieldname, self.swarm_fx);
	}
	fx = undefined;
	if(bwastimejump)
	{
		fx = #"hash_78ae17d0e989e328";
	}
	if(!isdefined(fx))
	{
		return;
	}
	if(!isdefined(self.var_af4484a7))
	{
		self.var_af4484a7 = 1;
		self callback::on_shutdown(&function_95dc19b0);
	}
	self.swarm_fx = util::playfxontag(fieldname, fx, self, "tag_origin");
}

/*
	Name: function_95dc19b0
	Namespace: namespace_3b3d42f
	Checksum: 0xAC04E148
	Offset: 0x718
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_95dc19b0(localclientnum)
{
	fx = #"hash_69eb668e9f7736bd";
	playfx(localclientnum, fx, self gettagorigin("tag_origin"));
}

/*
	Name: function_64d1f09b
	Namespace: namespace_3b3d42f
	Checksum: 0xCBC687B2
	Offset: 0x778
	Size: 0xF4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_64d1f09b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isalive(self) || self !== function_5c10bd79(fieldname))
	{
		return;
	}
	fx = undefined;
	if(bwastimejump)
	{
		fx = #"hash_26265474bcb72a8a";
	}
	if(!isdefined(fx))
	{
		return;
	}
	viewmodelfx = playfxoncamera(fieldname, fx, (0, 0, 0), (1, 0, 0), (0, 0, 1));
	wait(2);
	stopfx(fieldname, viewmodelfx);
}

/*
	Name: function_2a4100e7
	Namespace: namespace_3b3d42f
	Checksum: 0xAC42F089
	Offset: 0x878
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2a4100e7(localclientnum)
{
	self function_bf9d3071("rob_orda_dissolve");
}

