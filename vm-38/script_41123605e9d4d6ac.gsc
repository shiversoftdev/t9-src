#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_cc727a3b;

/*
	Name: function_230a851e
	Namespace: namespace_cc727a3b
	Checksum: 0x4DC30273
	Offset: 0x2C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_230a851e()
{
	level notify(1739802247);
}

/*
	Name: __init__system__
	Namespace: namespace_cc727a3b
	Checksum: 0x50A46FD
	Offset: 0x2E0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_507ba1ac0432a7e6", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_cc727a3b
	Checksum: 0x7BEC5D7A
	Offset: 0x328
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_405a03ca855745df", 16000, 1, "int", &function_9666c7b1, 0, 0);
	clientfield::register("scriptmover", "hs_swarm_state", 1, 1, "counter", &function_440e968, 0, 0);
	clientfield::register("allplayers", "hs_swarm_damage", 1, 1, "counter", &function_64d1f09b, 1, 0);
	clientfield::register("allplayers", "" + #"hash_2201faa112c8313", 16000, 1, "counter", &function_ea257a5f, 1, 0);
	clientfield::register("scriptmover", "" + #"hash_2201faa112c8313", 16000, 1, "counter", &function_ea257a5f, 1, 0);
	clientfield::register("scriptmover", "" + #"hash_1765de695fca8bdc", 16000, 1, "int", &function_48a507d9, 0, 0);
}

/*
	Name: function_9666c7b1
	Namespace: namespace_cc727a3b
	Checksum: 0x1EBA3219
	Offset: 0x528
	Size: 0x106
	Parameters: 7
	Flags: Linked
*/
function function_9666c7b1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.fx = playfx(fieldname, #"hash_1a93b9b31b5d1d3b", self.origin + vectorscale((0, 0, 1), 18), anglestoup(self.angles));
		self playsound(fieldname, #"hash_6a76932cce379c66");
	}
	else if(isdefined(self.fx))
	{
		stopfx(fieldname, self.fx);
		self.fx = undefined;
	}
}

/*
	Name: function_440e968
	Namespace: namespace_cc727a3b
	Checksum: 0x5BC08D50
	Offset: 0x638
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
	Namespace: namespace_cc727a3b
	Checksum: 0xA67E68F5
	Offset: 0x768
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_95dc19b0(localclientnum)
{
	if(isdefined(self))
	{
		fx = #"hash_69eb668e9f7736bd";
		playfx(localclientnum, fx, self.origin);
	}
}

/*
	Name: function_64d1f09b
	Namespace: namespace_cc727a3b
	Checksum: 0x1B15071E
	Offset: 0x7C0
	Size: 0x114
	Parameters: 7
	Flags: Linked, Private
*/
function private function_64d1f09b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"end_game");
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
	self waittilltimeout(2, #"death");
	stopfx(fieldname, viewmodelfx);
}

/*
	Name: function_ea257a5f
	Namespace: namespace_cc727a3b
	Checksum: 0x343C8515
	Offset: 0x8E0
	Size: 0xBC
	Parameters: 7
	Flags: Linked, Private
*/
function private function_ea257a5f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"end_game");
	fx = playfx(bwastimejump, #"hash_840483659ea54c4", self.origin + vectorscale((0, 0, 1), 10));
	wait(7);
	if(isdefined(fx))
	{
		stopfx(bwastimejump, fx);
	}
}

/*
	Name: function_48a507d9
	Namespace: namespace_cc727a3b
	Checksum: 0x550F7636
	Offset: 0x9A8
	Size: 0xB6
	Parameters: 7
	Flags: Linked
*/
function function_48a507d9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_e65311fc = util::playfxontag(fieldname, #"hash_901b71115b1cd3f", self, "j_spine4");
	}
	else if(isdefined(self.var_e65311fc))
	{
		stopfx(fieldname, self.var_e65311fc);
		self.var_e65311fc = undefined;
	}
}

/*
	Name: function_5565725d
	Namespace: namespace_cc727a3b
	Checksum: 0x304F9880
	Offset: 0xA68
	Size: 0x178
	Parameters: 3
	Flags: Linked
*/
function function_5565725d(localclientnum, dissolve, rob)
{
	if(dissolve === 1)
	{
		self function_54d0d2d1(localclientnum);
	}
	if(!isdefined(self.var_553a42c))
	{
		return;
	}
	if(dissolve === 1)
	{
		foreach(zombie in self.var_553a42c)
		{
			if(isdefined(zombie))
			{
				zombie playrenderoverridebundle(rob);
			}
		}
	}
	else
	{
		foreach(zombie in self.var_553a42c)
		{
			if(isdefined(zombie))
			{
				zombie stoprenderoverridebundle(rob);
			}
		}
	}
}

/*
	Name: function_54d0d2d1
	Namespace: namespace_cc727a3b
	Checksum: 0x2B9EEBF5
	Offset: 0xBE8
	Size: 0x2AC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_54d0d2d1(localclientnum)
{
	if(isdefined(self.var_553a42c))
	{
		return;
	}
	self.var_553a42c = [];
	zombie = self function_b439ef43(localclientnum, #"hash_5615713147132e0a", "tag_zombie1_LE", "ai_t9_zm_hulkingsum_attached_zombie_01");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_5615703147132c57", "tag_zombie2_LE", "ai_t9_zm_hulkingsum_attached_zombie_02");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_56156f3147132aa4", "tag_zombie3_LE", "ai_t9_zm_hulkingsum_attached_zombie_03");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_5615713147132e0a", "tag_zombie1_RI", "ai_t9_zm_hulkingsum_attached_zombie_04");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_5615703147132c57", "tag_zombie2_RI", "ai_t9_zm_hulkingsum_attached_zombie_05");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_56156f3147132aa4", "tag_zombie3_RI", "ai_t9_zm_hulkingsum_attached_zombie_06");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_56156e31471328f1", "tag_zombie4_RI", "ai_t9_zm_hulkingsum_attached_zombie_07");
	array::add(self.var_553a42c, zombie);
	self thread function_65300f49();
}

/*
	Name: function_b439ef43
	Namespace: namespace_cc727a3b
	Checksum: 0xFA1A5019
	Offset: 0xEA0
	Size: 0xE8
	Parameters: 4
	Flags: Linked, Private
*/
function private function_b439ef43(localclientnum, model, tag, animname)
{
	tag_origin = self gettagorigin(tag);
	tag_angles = self gettagangles(tag);
	zombie = util::spawn_model(localclientnum, model, tag_origin, tag_angles);
	zombie linkto(self, tag);
	zombie useanimtree("zm_ai_hulk");
	zombie thread function_9175afae(animname);
	return zombie;
}

/*
	Name: function_9175afae
	Namespace: namespace_cc727a3b
	Checksum: 0xC1C9D8BF
	Offset: 0xF90
	Size: 0x7E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9175afae(animname)
{
	self endon(#"death");
	while(true)
	{
		anim_length = getanimlength(animname);
		self animscripted("zombie_torso", self.origin, self.angles, animname);
		wait(anim_length);
	}
}

/*
	Name: function_65300f49
	Namespace: namespace_cc727a3b
	Checksum: 0xDE72843D
	Offset: 0x1018
	Size: 0xFA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_65300f49()
{
	level endon(#"end_game");
	self waittill(#"death");
	var_553a42c = self.var_553a42c;
	level waittilltimeout(6, #"hash_a88cb65d3952bc4");
	foreach(zombie in var_553a42c)
	{
		if(isdefined(zombie))
		{
			zombie delete();
		}
	}
	if(isdefined(self))
	{
		self.var_553a42c = undefined;
	}
}

