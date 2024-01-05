#using script_7cc035282b6a585f;
#using script_44c87b4589ee1f93;
#using script_ac6a30f1991e105;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_ec0691f8;

/*
	Name: function_b938dee0
	Namespace: namespace_ec0691f8
	Checksum: 0xE6F04AE9
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b938dee0()
{
	level notify(593221791);
}

/*
	Name: __init__system__
	Namespace: namespace_ec0691f8
	Checksum: 0xFC54FBDB
	Offset: 0x138
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4863f776a30a1247", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ec0691f8
	Checksum: 0xACA864AB
	Offset: 0x180
	Size: 0x10C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "sr_dog_fx", 1, 1, "int", &dog_fx, 0, 0);
	clientfield::register("actor", "sr_dog_spawn_fx", 1, 1, "counter", &dog_spawn_fx, 0, 0);
	clientfield::register("actor", "sr_dog_pre_spawn_fx", 1, 1, "counter", &function_30933ca1, 0, 0);
	ai::add_archetype_spawn_function(#"zombie_dog", &function_3b0e8b8b);
}

/*
	Name: function_3b0e8b8b
	Namespace: namespace_ec0691f8
	Checksum: 0x9FE7A6C2
	Offset: 0x298
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_3b0e8b8b(localclientnum)
{
	util::waittill_dobj(localclientnum);
}

/*
	Name: dog_fx
	Namespace: namespace_ec0691f8
	Checksum: 0x716B543A
	Offset: 0x2C8
	Size: 0x1AC
	Parameters: 7
	Flags: Linked
*/
function dog_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		if(!isdefined(self.var_93471229))
		{
			self.var_93471229 = [];
		}
		if(isdefined(self.fxdef) && !isdefined(self._fxcharacter[self.fxdef]))
		{
			fxclientutils::playfxbundle(fieldname, self, self.fxdef);
		}
		self mapshaderconstant(fieldname, 0, "scriptVector2", 0, 1, 1);
	}
	else
	{
		if(isdefined(self.var_93471229))
		{
			foreach(fxhandle in self.var_93471229)
			{
				deletefx(fieldname, fxhandle);
			}
		}
		util::playfxontag(fieldname, #"hash_529c1a5672216926", self, "j_spine2");
	}
}

/*
	Name: function_30933ca1
	Namespace: namespace_ec0691f8
	Checksum: 0xEDBCE3B
	Offset: 0x480
	Size: 0x21C
	Parameters: 7
	Flags: Linked
*/
function function_30933ca1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(bwastimejump);
	if(!isdefined(self))
	{
		return;
	}
	if(self.var_9fde8624 === #"hash_2a5479b83161cb35")
	{
		var_d1dc644a = playfx(bwastimejump, #"hash_baef237a01b261a", self.origin + vectorscale((0, 0, 1), 36), anglestoup(self.angles));
		playsound(bwastimejump, #"hash_6b6572c7d66929d", self.origin + vectorscale((0, 0, 1), 36));
	}
	else
	{
		if(self.var_9fde8624 === #"hash_28e36e7b7d5421f")
		{
			var_d1dc644a = playfx(bwastimejump, #"hash_2de6c1300bec68cd", self.origin + vectorscale((0, 0, 1), 36), anglestoup(self.angles));
			playsound(bwastimejump, #"hash_3731f907ac5beb1", self.origin + vectorscale((0, 0, 1), 36));
		}
		else
		{
			playsound(bwastimejump, #"hash_1b702e745dd73148", self.origin + vectorscale((0, 0, 1), 36));
		}
	}
	wait(1);
	if(isdefined(var_d1dc644a))
	{
		stopfx(bwastimejump, var_d1dc644a);
	}
}

/*
	Name: dog_spawn_fx
	Namespace: namespace_ec0691f8
	Checksum: 0x3E4651C7
	Offset: 0x6A8
	Size: 0x1D4
	Parameters: 7
	Flags: Linked
*/
function dog_spawn_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(self.var_9fde8624 === #"hash_2a5479b83161cb35")
	{
		util::playfxontag(bwasdemojump, #"hash_784a8bc7b9b17876", self, "j_spine2");
		playsound(bwasdemojump, #"hash_6ba18f5ab09d3e00", self.origin + vectorscale((0, 0, 1), 36));
	}
	else
	{
		if(self.var_9fde8624 === #"hash_28e36e7b7d5421f")
		{
			util::playfxontag(bwasdemojump, #"hash_44214bf58f0e6d87", self, "j_spine2");
			playsound(bwasdemojump, #"hash_6a7f1f4ef6078e4", self.origin + vectorscale((0, 0, 1), 36));
		}
		else
		{
			util::playfxontag(bwasdemojump, level._effect[#"lightning_dog_spawn"], self, "j_spine2");
			playsound(bwasdemojump, #"hash_342202bccfe632e3", self.origin + vectorscale((0, 0, 1), 36));
		}
	}
	fxclientutils::playfxbundle(bwasdemojump, self, self.fxdef);
}

