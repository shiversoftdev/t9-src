#using script_7ae1d3c7bfe5070;
#using script_311c446e3df6c3fa;
#using scripts\zm_common\zm_score.csc;
#using script_5ee86fb478309acf;
#using scripts\core_common\postfx_shared.csc;
#using script_40e017336a087343;
#using script_14d2d89964cae0b1;
#using scripts\core_common\math_shared.csc;
#using script_20055f2f97341caa;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_edb23975;

/*
	Name: function_89d40f6a
	Namespace: namespace_edb23975
	Checksum: 0x706EC569
	Offset: 0x168
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_89d40f6a()
{
	level notify(1586043445);
}

/*
	Name: init
	Namespace: namespace_edb23975
	Checksum: 0x7DAA8FD9
	Offset: 0x188
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function init()
{
	clientfield::register("world", "" + #"hash_7017982268bd7369", 1, 1, "int", &function_91074d15, 0, 0);
	clientfield::register("toplayer", "" + #"hash_721d42a28d7461ea", 24000, 1, "int", &function_eebdf718, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4b1b4c1785fdd11d", 24000, 1, "counter", &function_d5faead3, 0, 0);
	clientfield::register("toplayer", "" + #"hash_63da9d5355659678", 24000, 1, "int", &function_cc885b38, 0, 0);
	clientfield::register("playercorpse", "" + #"hash_4a22451481253e54", 28000, 1, "int", &function_e7e29c4c, 0, 0);
}

/*
	Name: function_91074d15
	Namespace: namespace_edb23975
	Checksum: 0xAB222B2B
	Offset: 0x350
	Size: 0x7C
	Parameters: 7
	Flags: None
*/
function function_91074d15(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		function_12f0cc0d("xanim_pb_tablet_ult_stand_idle_clone");
	}
	else
	{
		function_4b51b406("xanim_pb_tablet_ult_stand_idle_clone");
	}
}

/*
	Name: function_eebdf718
	Namespace: namespace_edb23975
	Checksum: 0x6F96A644
	Offset: 0x3D8
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function function_eebdf718(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self setenemyglobalscrambler(1);
	}
	else
	{
		self setenemyglobalscrambler(0);
	}
}

/*
	Name: function_d5faead3
	Namespace: namespace_edb23975
	Checksum: 0xDB4BD6C5
	Offset: 0x458
	Size: 0x6C
	Parameters: 7
	Flags: None
*/
function function_d5faead3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		playfx(fieldname, #"hash_7338c45a04f946da", self.origin);
	}
}

/*
	Name: function_cc885b38
	Namespace: namespace_edb23975
	Checksum: 0x477B6E30
	Offset: 0x4D0
	Size: 0x126
	Parameters: 7
	Flags: None
*/
function function_cc885b38(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		if(!isdefined(self.fasttravel_teleport_sfx))
		{
			self playsound(fieldname, #"hash_431a69daefc0579b");
			self.fasttravel_teleport_sfx = self playloopsound(#"hash_535acfcd1e12504f");
		}
	}
	else if(isdefined(self.fasttravel_teleport_sfx))
	{
		self playsound(fieldname, #"hash_4516617ef69718ca");
		self stoploopsound(self.fasttravel_teleport_sfx);
		self.fasttravel_teleport_sfx = undefined;
	}
}

/*
	Name: function_e7e29c4c
	Namespace: namespace_edb23975
	Checksum: 0x5AD79541
	Offset: 0x600
	Size: 0x164
	Parameters: 7
	Flags: None
*/
function function_e7e29c4c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"end_game");
	self notify("386957b1936ceffc");
	self endon("386957b1936ceffc");
	if(bwastimejump)
	{
		if(isdefined(self.owner))
		{
			self setdrawname(hash(self.owner.name), 1);
			self function_1f0c7136(4);
			self.owner hide();
			self waittill(#"death");
			if(isdefined(self.owner))
			{
				self.owner show();
			}
		}
	}
	else
	{
		self setdrawname();
		if(isdefined(self.owner))
		{
			self.owner show();
		}
	}
}

