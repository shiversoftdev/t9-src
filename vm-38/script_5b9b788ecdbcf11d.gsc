#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace nightingale;

/*
	Name: function_d1f4eaf2
	Namespace: nightingale
	Checksum: 0x940D4EC8
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d1f4eaf2()
{
	level notify(408856554);
}

/*
	Name: __init__system__
	Namespace: nightingale
	Checksum: 0x271B4096
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"nightingale", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: nightingale
	Checksum: 0x1151853B
	Offset: 0x110
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
	level.nightingale_custom_settings = getscriptbundle(level.var_4977c64a.customsettings);
}

/*
	Name: function_85f37224
	Namespace: nightingale
	Checksum: 0xAB468955
	Offset: 0x270
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
	Checksum: 0x80AFF95C
	Offset: 0x2C8
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
	Checksum: 0x3BAECD99
	Offset: 0x3B8
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

