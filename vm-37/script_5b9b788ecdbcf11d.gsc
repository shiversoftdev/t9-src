#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace nightingale;

/*
	Name: function_89f2df9
	Namespace: nightingale
	Checksum: 0x8834E7E2
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"nightingale", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: nightingale
	Checksum: 0x81AAEC5F
	Offset: 0xF0
	Size: 0x154
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_7cc71113338444c4", 1, 1, "int", &function_17982c67, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_7c2ee5bfa7cad803", 1, 1, "int", &function_52240d18, 0, 0);
	if(!isdefined(level.var_17d9f80))
	{
		level.var_17d9f80 = [];
	}
	callback::add_weapon_type(#"nightingale", &function_85f37224);
	level.var_4977c64a = getweapon(#"nightingale");
	level.nightingale_custom_settings = getscriptbundle(level.var_4977c64a.var_4dd46f8a);
}

/*
	Name: function_85f37224
	Namespace: nightingale
	Checksum: 0x3DF79D8C
	Offset: 0x250
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_85f37224(localclientnum)
{
	arrayremovevalue(level.var_17d9f80, undefined, 1);
	level.var_17d9f80[self getentitynumber()] = self;
}

/*
	Name: function_17982c67
	Namespace: nightingale
	Checksum: 0xCE2DC13C
	Offset: 0x2A8
	Size: 0xE4
	Parameters: 7
	Flags: Linked
*/
function function_17982c67(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		team = function_73f4b33(fieldname);
		self.identifier_weapon = level.var_4977c64a;
		if(team === self.team)
		{
			self function_1f0c7136(1);
		}
		else
		{
			self function_525db0b1(1);
		}
		level.var_17d9f80[self getentitynumber()] = self;
	}
}

/*
	Name: function_52240d18
	Namespace: nightingale
	Checksum: 0x5A2F3D3A
	Offset: 0x398
	Size: 0x106
	Parameters: 7
	Flags: Linked
*/
function function_52240d18(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		fx = level.nightingale_custom_settings.activefx;
		if(isdefined(fx))
		{
			tag = (isdefined(level.nightingale_custom_settings.var_8751c5bd) ? level.nightingale_custom_settings.var_8751c5bd : "tag_origin");
			self.activefx = util::playfxontag(fieldname, fx, self, tag);
		}
	}
	else if(isdefined(self.activefx))
	{
		stopfx(fieldname, self.activefx);
		self.activefx = undefined;
	}
}

