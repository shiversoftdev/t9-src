#using scripts\core_common\array_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_e0966e1e;

/*
	Name: function_ec91aeff
	Namespace: namespace_e0966e1e
	Checksum: 0x35C9662F
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ec91aeff()
{
	level notify(1854220894);
}

/*
	Name: __init__system__
	Namespace: namespace_e0966e1e
	Checksum: 0x515CDAF8
	Offset: 0x140
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6f7d2657f403b90d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e0966e1e
	Checksum: 0xA15A83A5
	Offset: 0x188
	Size: 0x10C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_452045cf5cb8bc4c", 16000, 2, "int", &function_830c306e, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_7833487f87cacad1", 16000, 1, "int", &function_aa0ed712, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_1e3fecb02ce56163", 16000, 1, "int", &function_6a360cde, 0, 0);
}

/*
	Name: function_6a360cde
	Namespace: namespace_e0966e1e
	Checksum: 0x452B784B
	Offset: 0x2A0
	Size: 0x11E
	Parameters: 7
	Flags: Linked
*/
function function_6a360cde(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_f70ef53c = util::playfxontag(fieldname, #"hash_76e6cbdd75a0ae46", self, "tag_origin");
		if(isdefined(self.var_83f12b7c))
		{
			self stoploopsound(self.var_83f12b7c);
			self.var_83f12b7c = undefined;
		}
		self playsound(fieldname, #"hash_671944ab50b7a130");
		self.var_a9c2bfe4 = 1;
	}
	else
	{
		if(isdefined(self.var_f70ef53c))
		{
			stopfx(fieldname, self.var_f70ef53c);
		}
		self.var_a9c2bfe4 = 0;
	}
}

/*
	Name: function_830c306e
	Namespace: namespace_e0966e1e
	Checksum: 0x8021401A
	Offset: 0x3C8
	Size: 0x5C2
	Parameters: 7
	Flags: Linked
*/
function function_830c306e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 0:
		{
			if(isdefined(self.var_3504fb78))
			{
				stopfx(fieldname, self.var_3504fb78);
			}
			if(isdefined(self.var_edd303cf))
			{
				stopfx(fieldname, self.var_edd303cf);
			}
			if(isdefined(self.var_87fd74a7))
			{
				stopfx(fieldname, self.var_87fd74a7);
			}
			if(isdefined(self.var_71937d24))
			{
				self playsound(fieldname, #"hash_6010defaf1c41ae4");
				self stoploopsound(self.var_71937d24);
				self.var_71937d24 = undefined;
			}
			if(isdefined(self.var_b8bfe17e))
			{
				self stoploopsound(self.var_b8bfe17e);
				self.var_b8bfe17e = undefined;
			}
			self notify(#"hash_52be29763bc2391e");
			break;
		}
		case 1:
		{
			if(isdefined(self.var_83f12b7c))
			{
				self stoploopsound(self.var_83f12b7c);
				self.var_83f12b7c = undefined;
			}
			self.var_3504fb78 = util::playfxontag(fieldname, #"hash_2acd20deb7d56350", self, "tag_origin");
			self playsound(fieldname, #"hash_56e074f1a171421d");
			self.var_71937d24 = self playloopsound(#"hash_760ed99900106de3");
			zombie = self getlinkedent();
			if(isdefined(zombie))
			{
				forward = self.origin - zombie.origin;
				self.var_edd303cf = playfx(fieldname, #"hash_240c7f76d259b9a3", self.origin, forward);
				self thread function_d9150e58(fieldname);
				self thread function_d99e101d(fieldname, zombie);
			}
			break;
		}
		case 2:
		{
			if(isdefined(self.var_3504fb78))
			{
				stopfx(fieldname, self.var_3504fb78);
			}
			if(isdefined(self.var_edd303cf))
			{
				stopfx(fieldname, self.var_edd303cf);
			}
			if(isdefined(self.var_83f12b7c))
			{
				self stoploopsound(self.var_83f12b7c);
				self.var_83f12b7c = undefined;
			}
			if(isdefined(self.var_71937d24))
			{
				self playsound(fieldname, #"hash_6010defaf1c41ae4");
				self stoploopsound(self.var_71937d24);
				self.var_71937d24 = undefined;
			}
			self.var_87fd74a7 = util::playfxontag(fieldname, #"hash_3354e735e33805a7", self, "tag_origin");
			self playsound(fieldname, #"hash_534278acb9340669");
			self notify(#"hash_52be29763bc2391e");
			break;
		}
		case 3:
		{
			if(isdefined(self.var_3504fb78))
			{
				stopfx(fieldname, self.var_3504fb78);
			}
			if(isdefined(self.var_edd303cf))
			{
				stopfx(fieldname, self.var_edd303cf);
			}
			if(isdefined(self.var_87fd74a7))
			{
				stopfx(fieldname, self.var_87fd74a7);
			}
			if(isdefined(self.var_71937d24))
			{
				self playsound(fieldname, #"hash_6010defaf1c41ae4");
				self stoploopsound(self.var_71937d24);
				self.var_71937d24 = undefined;
			}
			if(isdefined(self.var_b8bfe17e))
			{
				self stoploopsound(self.var_b8bfe17e);
				self.var_b8bfe17e = undefined;
			}
			self notify(#"hash_52be29763bc2391e");
			util::playfxontag(fieldname, #"hash_7e225ece0c91121", self, "tag_origin");
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_d9150e58
	Namespace: namespace_e0966e1e
	Checksum: 0xB6F407D1
	Offset: 0x998
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_d9150e58(localclientnum)
{
	level endon(#"end_game");
	self waittilltimeout(6, #"death");
	if(isdefined(self.var_edd303cf))
	{
		stopfx(localclientnum, self.var_edd303cf);
	}
}

/*
	Name: function_d99e101d
	Namespace: namespace_e0966e1e
	Checksum: 0x4C843413
	Offset: 0xA10
	Size: 0x1F8
	Parameters: 2
	Flags: Linked
*/
function function_d99e101d(localclientnum, target_zombie)
{
	level endon(#"end_game");
	self endon(#"death", #"hash_52be29763bc2391e");
	target_zombie endon(#"death");
	var_c848a436 = array("j_elbow_le", "j_elbow_ri", "j_shoulder_le", "j_shoulder_ri", "j_spine4", "j_head");
	if(target_zombie.archetype == #"zombie_dog")
	{
		var_c848a436 = array("j_spine2", "j_spine3", "j_spine4", "j_neck", "j_head");
	}
	while(true)
	{
		tag = array::random(var_c848a436);
		start_pos = target_zombie gettagorigin(tag);
		if(!isdefined(start_pos))
		{
			continue;
		}
		var_9ce372f7 = util::spawn_model(localclientnum, "tag_origin", start_pos);
		var_9ce372f7.var_29dd623b = util::playfxontag(localclientnum, #"hash_523a16f9296294f0", var_9ce372f7, "tag_origin");
		var_9ce372f7 thread function_6333cd88(self);
		var_9ce372f7 thread function_ca3614(self);
		wait(0.1);
	}
}

/*
	Name: function_6333cd88
	Namespace: namespace_e0966e1e
	Checksum: 0x6BFB0BEA
	Offset: 0xC10
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_6333cd88(var_bea4648f)
{
	level endon(#"end_game");
	self endon(#"death");
	self moveto(var_bea4648f.origin, 0.1);
	wait(0.1);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_ca3614
	Namespace: namespace_e0966e1e
	Checksum: 0x18F2D681
	Offset: 0xCA0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_ca3614(parent)
{
	level endon(#"end_game");
	self endon(#"death");
	parent waittill(#"death");
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_aa0ed712
	Namespace: namespace_e0966e1e
	Checksum: 0xF6D2C1A3
	Offset: 0xD18
	Size: 0x182
	Parameters: 7
	Flags: Linked
*/
function function_aa0ed712(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.light_fx))
	{
		killfx(fieldname, self.light_fx);
	}
	if(isdefined(self.var_83f12b7c))
	{
		self stoploopsound(self.var_83f12b7c);
		self.var_83f12b7c = undefined;
	}
	if(bwastimejump == 1)
	{
		self.light_fx = util::playfxontag(fieldname, #"hash_194a9dcd4ca41ca9", self, "tag_origin");
		if(!is_true(self.var_a9c2bfe4))
		{
			self.var_83f12b7c = self playloopsound(#"hash_c977a3c790ccd55");
		}
	}
	else
	{
		self.light_fx = util::playfxontag(fieldname, #"hash_210ef7d0a601f6d9", self, "tag_origin");
		if(!is_true(self.var_a9c2bfe4))
		{
			self.var_83f12b7c = self playloopsound(#"hash_3af833d1182396f3");
		}
	}
}

