#using scripts\core_common\array_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_14ee8104;

/*
	Name: function_7ad484f
	Namespace: namespace_14ee8104
	Checksum: 0x53852FE
	Offset: 0x210
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7ad484f()
{
	level notify(250508674);
}

/*
	Name: function_54d0d2d1
	Namespace: namespace_14ee8104
	Checksum: 0xC017A4D
	Offset: 0x230
	Size: 0x2D4
	Parameters: 1
	Flags: None
*/
function function_54d0d2d1(localclientnum)
{
	if(isdefined(self.var_553a42c))
	{
		return;
	}
	if(!isdefined(self) || !isentity(self))
	{
		return;
	}
	self.var_553a42c = [];
	zombie = self function_b439ef43(localclientnum, #"hash_5615713147132e0a", "tag_zom1_LE", "ai_t9_zm_hulkingsum_attached_zombie_01");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_5615703147132c57", "tag_zom2_LE", "ai_t9_zm_hulkingsum_attached_zombie_02");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_56156f3147132aa4", "tag_zom3_LE", "ai_t9_zm_hulkingsum_attached_zombie_03");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_5615713147132e0a", "tag_zom1_RI", "ai_t9_zm_hulkingsum_attached_zombie_04");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_5615703147132c57", "tag_zom2_RI", "ai_t9_zm_hulkingsum_attached_zombie_05");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_56156f3147132aa4", "tag_zom3_RI", "ai_t9_zm_hulkingsum_attached_zombie_06");
	array::add(self.var_553a42c, zombie);
	zombie = self function_b439ef43(localclientnum, #"hash_56156e31471328f1", "tag_zom4_RI", "ai_t9_zm_hulkingsum_attached_zombie_07");
	array::add(self.var_553a42c, zombie);
	self thread function_65300f49();
}

/*
	Name: function_b439ef43
	Namespace: namespace_14ee8104
	Checksum: 0xAC51966F
	Offset: 0x510
	Size: 0xF8
	Parameters: 4
	Flags: Private
*/
function private function_b439ef43(localclientnum, model, tag, animname)
{
	tag_origin = self gettagorigin(tag);
	tag_angles = self gettagangles(tag);
	zombie = util::spawn_model(localclientnum, model, tag_origin, tag_angles);
	zombie linkto(self, tag);
	zombie useanimtree("zm_ai_hulk");
	zombie setanim(animname, 1, 0, 1);
	return zombie;
}

/*
	Name: function_65300f49
	Namespace: namespace_14ee8104
	Checksum: 0xD3A6267C
	Offset: 0x610
	Size: 0xE2
	Parameters: 0
	Flags: Private
*/
function private function_65300f49()
{
	level endon(#"end_game");
	self waittill(#"death");
	var_553a42c = self.var_553a42c;
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

