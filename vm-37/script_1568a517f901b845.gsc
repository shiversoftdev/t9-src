#using script_6ad3fda349f49bf9;
#using script_7922dc472341c85c;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\util_shared.csc;

#namespace napalm_strike;

/*
	Name: init_shared
	Namespace: napalm_strike
	Checksum: 0x33B22E00
	Offset: 0x100
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function init_shared(bundlename)
{
	killstreak_detect::init_shared();
	level.var_30e551f4 = getscriptbundle(bundlename);
	clientfield::register("scriptmover", "" + #"hash_72f92383f772d276", 1, 1, "int", &function_e0221c63, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_3d8e05debfa62f2d", 1, 1, "int", &function_818e69da, 0, 0);
	clientfield::register("missile", "" + #"hash_77346335cbe9ecde", 1, 1, "int", &function_344bba9b, 0, 0);
	level.var_a25fd5e1 = [];
}

/*
	Name: function_e0221c63
	Namespace: napalm_strike
	Checksum: 0xCD3954D0
	Offset: 0x258
	Size: 0x28C
	Parameters: 7
	Flags: Linked
*/
function function_e0221c63(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	util::waittill_dobj(fieldname);
	arrayremovevalue(level.var_a25fd5e1, undefined, 0);
	level.var_a25fd5e1[level.var_a25fd5e1.size] = self;
	if(bwastimejump)
	{
		util::playfxontag(fieldname, level.var_30e551f4.var_2375a152, self, level.var_30e551f4.var_e5082065);
		util::playfxontag(fieldname, level.var_30e551f4.var_a6f96498, self, "tag_body");
		util::playfxontag(fieldname, level.var_30e551f4.var_ee8aabc3, self, "tag_fx_engine_l");
		util::playfxontag(fieldname, level.var_30e551f4.var_ee8aabc3, self, "tag_fx_engine_r");
		self renderoverridebundle::function_f4eab437(fieldname, 1, #"rob_sonar_set_enemy");
		localplayer = function_5c10bd79(fieldname);
		self function_1f0c7136(2);
		if(localplayer hasperk(fieldname, #"specialty_showscorestreakicons") || self.team == localplayer.team)
		{
			self setcompassicon(level.var_30e551f4.var_cb98fbf7);
			self function_5e00861(level.var_30e551f4.var_c3e4af00);
			var_b13727dd = getgametypesetting("compassAnchorScorestreakIcons");
			self function_dce2238(var_b13727dd);
		}
	}
}

/*
	Name: function_818e69da
	Namespace: napalm_strike
	Checksum: 0x37283C38
	Offset: 0x4F0
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function function_818e69da(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		self playrumbleonentity(fieldname, level.var_30e551f4.var_12c482a2);
	}
	else
	{
		self stoprumble(fieldname, level.var_30e551f4.var_12c482a2);
	}
}

/*
	Name: function_344bba9b
	Namespace: napalm_strike
	Checksum: 0x78981B0
	Offset: 0x5C0
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_344bba9b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	forward = anglestoforward(self.angles);
	playfx(bwastimejump, level.var_30e551f4.var_f6580c0b, self.origin, (0, 0, 1), (forward[0], forward[1], 0));
}

/*
	Name: codecallback_entityspawned
	Namespace: napalm_strike
	Checksum: 0xDF025B04
	Offset: 0x670
	Size: 0x32
	Parameters: 1
	Flags: Event
*/
event codecallback_entityspawned(eventstruct)
{
	if(self.weapon.name !== #"napalm_strike")
	{
		return;
	}
}

/*
	Name: function_69d7c128
	Namespace: napalm_strike
	Checksum: 0xA599D3C2
	Offset: 0x6B0
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_69d7c128()
{
	function_3385d776(level.var_30e551f4.var_f6580c0b);
}

/*
	Name: function_a998da59
	Namespace: napalm_strike
	Checksum: 0x552F9C43
	Offset: 0x6E0
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_a998da59()
{
	function_c22a1ca2(level.var_30e551f4.var_f6580c0b);
}

