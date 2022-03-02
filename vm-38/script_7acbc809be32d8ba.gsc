#using script_3d35e2ff167b3a82;
#using script_618d6f5ff5d18933;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_weapons.csc;

#namespace namespace_1e7573ec;

/*
	Name: function_1357070e
	Namespace: namespace_1e7573ec
	Checksum: 0x9476B9D5
	Offset: 0x308
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1357070e()
{
	level notify(552847203);
}

/*
	Name: function_89f2df9
	Namespace: namespace_1e7573ec
	Checksum: 0x2D608472
	Offset: 0x328
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_538411714a272c00", &function_70a657d8, &function_8ac3bea9, undefined, "zm_weapons");
}

/*
	Name: function_70a657d8
	Namespace: namespace_1e7573ec
	Checksum: 0xDD6DA868
	Offset: 0x380
	Size: 0x24C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_4bd7cbe3f7fd44dd", 24000, 2, "int", &function_a1e57b34, 0, 0);
	clientfield::register("missile", "" + #"hash_3ec6598e8ba9406a", 24000, 1, "int", &function_2fa08804, 0, 0);
	clientfield::register("toplayer", "" + #"hash_74134fadeeb8b692", 24000, 1, "counter", &function_61987d28, 0, 0);
	clientfield::register("toplayer", "" + #"hash_713a0ba5968a3bde", 24000, 1, "int", &function_53bb1917, 0, 0);
	clientfield::register("toplayer", "" + #"hash_4aec08923edd6a40", 24000, 2, "int", &function_778e494b, 0, 0);
	clientfield::register("actor", "" + #"hash_5366f39f1aca2e65", 24000, 3, "int", &function_e688ee7c, 0, 0);
	callback::function_f77ced93(&function_f77ced93);
	level.var_282dc0af = &function_af4c580b;
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_1e7573ec
	Checksum: 0xE76B84BB
	Offset: 0x5D8
	Size: 0x304
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	zm_weapons::function_8389c033(#"hash_386308ed987052a4", #"hash_386308ed987052a4");
	zm_weapons::function_8389c033(#"hash_386308ed987052a4", #"hash_131a672d67787b26");
	zm_weapons::function_8389c033(#"hash_386308ed987052a4", #"hash_226d0ad69d9efa1");
	zm_weapons::function_8389c033(#"hash_386308ed987052a4", #"hash_7bf7797b85b0089c");
	zm_weapons::function_8389c033(#"hash_131a672d67787b26", #"hash_386308ed987052a4");
	zm_weapons::function_8389c033(#"hash_131a672d67787b26", #"hash_131a672d67787b26");
	zm_weapons::function_8389c033(#"hash_131a672d67787b26", #"hash_226d0ad69d9efa1");
	zm_weapons::function_8389c033(#"hash_131a672d67787b26", #"hash_7bf7797b85b0089c");
	zm_weapons::function_8389c033(#"hash_226d0ad69d9efa1", #"hash_386308ed987052a4");
	zm_weapons::function_8389c033(#"hash_226d0ad69d9efa1", #"hash_131a672d67787b26");
	zm_weapons::function_8389c033(#"hash_226d0ad69d9efa1", #"hash_226d0ad69d9efa1");
	zm_weapons::function_8389c033(#"hash_226d0ad69d9efa1", #"hash_7bf7797b85b0089c");
	zm_weapons::function_8389c033(#"hash_7bf7797b85b0089c", #"hash_386308ed987052a4");
	zm_weapons::function_8389c033(#"hash_7bf7797b85b0089c", #"hash_131a672d67787b26");
	zm_weapons::function_8389c033(#"hash_7bf7797b85b0089c", #"hash_226d0ad69d9efa1");
	zm_weapons::function_8389c033(#"hash_7bf7797b85b0089c", #"hash_7bf7797b85b0089c");
}

/*
	Name: function_6b945d59
	Namespace: namespace_1e7573ec
	Checksum: 0x51ACB874
	Offset: 0x8E8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_6b945d59(var_ee6bcd51)
{
	if(isplayer(self))
	{
		self zm_utility::function_f933b697(var_ee6bcd51);
	}
	self function_5d482e78(var_ee6bcd51);
}

/*
	Name: function_4e818189
	Namespace: namespace_1e7573ec
	Checksum: 0x5D7A80F9
	Offset: 0x948
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_4e818189(var_ee6bcd51)
{
	if(isplayer(self))
	{
		if(self zm_utility::function_10df0b9c(var_ee6bcd51))
		{
			self function_bf9d3071(var_ee6bcd51);
		}
		self zm_utility::function_8065ace2(var_ee6bcd51);
	}
	else
	{
		self function_bf9d3071(var_ee6bcd51);
	}
}

/*
	Name: function_af4c580b
	Namespace: namespace_1e7573ec
	Checksum: 0xD782772A
	Offset: 0x9D8
	Size: 0x152
	Parameters: 2
	Flags: Linked
*/
function function_af4c580b(localclientnum, var_a6762160)
{
	if(!isdefined(var_a6762160))
	{
		return false;
	}
	data = item_world::function_a7e98a1a(var_a6762160);
	if(function_3efc58e4(self namespace_a0d533d1::function_2b83d3ff(data.inventory.items[17 + 1])))
	{
		return true;
	}
	if(function_3efc58e4(self namespace_a0d533d1::function_2b83d3ff(data.inventory.items[((17 + 1) + 8) + 1])))
	{
		return true;
	}
	if(function_3efc58e4(self namespace_a0d533d1::function_2b83d3ff(data.inventory.items[((((17 + 1) + 8) + 1) + 8) + 1])))
	{
		return true;
	}
	return false;
}

/*
	Name: function_f77ced93
	Namespace: namespace_1e7573ec
	Checksum: 0x4F419085
	Offset: 0xB38
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_f77ced93(params)
{
	if(self == level || !isplayer(self))
	{
		return;
	}
	localclientnum = params.localclientnum;
	weapon = self function_d2c2b168();
	if(function_3efc58e4(weapon))
	{
		self.var_960d365a = 0;
		self thread function_71c63cef(localclientnum, weapon);
		self thread function_2262d0b6(localclientnum, weapon);
		self thread function_d89c7385(localclientnum, weapon);
		self thread function_2f3ad676(localclientnum, weapon);
	}
	else if(isdefined(self.var_49d95be6))
	{
		self function_6b945d59(#"hash_8c1c803276508fe" + self.var_49d95be6);
		self.var_49d95be6 = undefined;
		self function_88a55cb8(localclientnum);
	}
}

/*
	Name: function_2262d0b6
	Namespace: namespace_1e7573ec
	Checksum: 0x3FB90890
	Offset: 0xC88
	Size: 0x1F0
	Parameters: 2
	Flags: Linked
*/
function function_2262d0b6(localclientnum, weapon)
{
	self endon(#"death", #"weapon_change");
	var_17b7891d = "51273cd61d1e6f07" + "watch_mega_barrel_mag_out_notetrack";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		self waittillmatch({#notetrack:"mag_out"}, #"notetrack");
		self.var_960d365a = 1;
		if(isdefined(self.var_49d95be6))
		{
			self function_6b945d59(#"hash_8c1c803276508fe" + self.var_49d95be6);
			self.var_49d95be6 = 0;
			self function_4e818189(#"hash_8c1c803276508fe" + self.var_49d95be6);
		}
		var_a1796c91 = self function_6fff5014(localclientnum, weapon);
		if(isdefined(self.var_5f39ac11))
		{
			if(self.var_5f39ac11 != var_a1796c91)
			{
				self function_6b945d59(#"hash_20afad7abab6c3cd" + self.var_5f39ac11);
				self.var_5f39ac11 = var_a1796c91;
				self function_4e818189(#"hash_20afad7abab6c3cd" + self.var_5f39ac11);
			}
		}
		else
		{
			self.var_5f39ac11 = var_a1796c91;
			self function_4e818189(#"hash_20afad7abab6c3cd" + self.var_5f39ac11);
		}
	}
}

/*
	Name: function_2f3ad676
	Namespace: namespace_1e7573ec
	Checksum: 0x2768B1B2
	Offset: 0xE80
	Size: 0x230
	Parameters: 2
	Flags: Linked
*/
function function_2f3ad676(localclientnum, weapon)
{
	self endon(#"death", #"weapon_change");
	var_17b7891d = "bb81bf554d144e6" + "watch_mega_barrel_mag_throw_notetrack";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		self waittillmatch({#notetrack:"mag_thrown"}, #"notetrack");
		currentammostock = self getweaponammostock(localclientnum, weapon);
		currentclipammo = getweaponammoclip(localclientnum, weapon);
		totalammo = currentammostock + currentclipammo;
		clip_size = weapon.clipsize;
		var_a1796c91 = int(ceil((float(totalammo) / float(clip_size)) * 5));
		if(var_a1796c91 > 5)
		{
			var_a1796c91 = 5;
		}
		if(isdefined(self.var_5f39ac11))
		{
			if(self.var_5f39ac11 != var_a1796c91)
			{
				self function_6b945d59(#"hash_20afad7abab6c3cd" + self.var_5f39ac11);
				self.var_5f39ac11 = var_a1796c91;
				self function_4e818189(#"hash_20afad7abab6c3cd" + self.var_5f39ac11);
			}
		}
		else
		{
			self.var_5f39ac11 = var_a1796c91;
			self function_4e818189(#"hash_20afad7abab6c3cd" + self.var_5f39ac11);
		}
	}
}

/*
	Name: function_d89c7385
	Namespace: namespace_1e7573ec
	Checksum: 0x7704BA67
	Offset: 0x10B8
	Size: 0xAA
	Parameters: 2
	Flags: Linked
*/
function function_d89c7385(localclientnum, weapon)
{
	self endon(#"death", #"weapon_change");
	var_17b7891d = "72c40ea1ad927740" + "watch_mega_barrel_mag_in_notetrack";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		self waittillmatch({#notetrack:"mag_in"}, #"notetrack");
		self.var_960d365a = 0;
	}
}

/*
	Name: function_71c63cef
	Namespace: namespace_1e7573ec
	Checksum: 0x1FBADA94
	Offset: 0x1170
	Size: 0x286
	Parameters: 2
	Flags: Linked
*/
function function_71c63cef(localclientnum, weapon)
{
	self endon(#"death", #"weapon_change");
	var_17b7891d = "54ae0da6d02ad59f" + "watch_mega_barrel_ammo_change";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		if(!is_true(self.var_960d365a))
		{
			var_a1796c91 = self function_6fff5014(localclientnum, weapon);
			if(isdefined(self.var_49d95be6))
			{
				if(self.var_49d95be6 != var_a1796c91)
				{
					self function_6b945d59(#"hash_8c1c803276508fe" + self.var_49d95be6);
					self.var_49d95be6 = var_a1796c91;
					self function_4e818189(#"hash_8c1c803276508fe" + self.var_49d95be6);
				}
			}
			else
			{
				self.var_49d95be6 = var_a1796c91;
				self function_4e818189(#"hash_8c1c803276508fe" + self.var_49d95be6);
			}
			if(isdefined(self.var_5f39ac11))
			{
				if(self.var_5f39ac11 != var_a1796c91)
				{
					self function_6b945d59(#"hash_20afad7abab6c3cd" + self.var_5f39ac11);
					self.var_5f39ac11 = var_a1796c91;
					self function_4e818189(#"hash_20afad7abab6c3cd" + self.var_5f39ac11);
				}
			}
			else
			{
				self.var_5f39ac11 = var_a1796c91;
				self function_4e818189(#"hash_20afad7abab6c3cd" + self.var_5f39ac11);
			}
		}
		if(!is_true(self.var_960d365a) && !isdefined(self.var_a0d6f528))
		{
			self function_88a55cb8(localclientnum, weapon, var_a1796c91);
		}
		else
		{
			self function_88a55cb8(localclientnum);
		}
		waitframe(1);
	}
}

/*
	Name: function_6fff5014
	Namespace: namespace_1e7573ec
	Checksum: 0xA2C9DB22
	Offset: 0x1400
	Size: 0xAA
	Parameters: 2
	Flags: Linked
*/
function function_6fff5014(localclientnum, weapon)
{
	ammo_clip = getweaponammoclip(localclientnum, weapon);
	clip_size = weapon.clipsize;
	var_bb894354 = int(ceil((float(ammo_clip) / float(clip_size)) * 5));
	return var_bb894354;
}

/*
	Name: function_88a55cb8
	Namespace: namespace_1e7573ec
	Checksum: 0x4FF90BF7
	Offset: 0x14B8
	Size: 0x16A
	Parameters: 3
	Flags: Linked
*/
function function_88a55cb8(localclientnum, weapon, var_bb894354)
{
	if(!isdefined(var_bb894354))
	{
		var_bb894354 = 0;
	}
	if(self.var_42662764 !== weapon.name)
	{
		if(isdefined(self.var_42662764))
		{
			switch(self.var_42662764)
			{
				case "hash_209d5c516bfdf9e5":
				case "hash_7bf7797b85b0089c":
				{
					self function_d64a2c25(localclientnum);
					break;
				}
				default:
				{
					break;
				}
			}
		}
		self.var_42662764 = weapon.name;
	}
	if(!isdefined(weapon.name))
	{
		return;
	}
	switch(weapon.name)
	{
		case "hash_7bf7797b85b0089c":
		{
			self function_d64a2c25(localclientnum, var_bb894354 > 0, 0);
			break;
		}
		case "hash_209d5c516bfdf9e5":
		{
			self function_d64a2c25(localclientnum, var_bb894354 > 0, 1);
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_d64a2c25
	Namespace: namespace_1e7573ec
	Checksum: 0xD4C642EA
	Offset: 0x1630
	Size: 0x1B6
	Parameters: 3
	Flags: Linked
*/
function function_d64a2c25(localclientnum, enable, is_upgraded)
{
	if(!isdefined(enable))
	{
		enable = 0;
	}
	if(!isdefined(is_upgraded))
	{
		is_upgraded = 0;
	}
	if(enable && self zm_utility::function_f8796df3(localclientnum) && viewmodelhastag(localclientnum, "tag_missile_ri_fx1") && viewmodelhastag(localclientnum, "tag_missile_le_fx1"))
	{
		if(!isdefined(self.var_6ccae77f))
		{
			self.var_6ccae77f = playviewmodelfx(localclientnum, (is_upgraded ? #"hash_58dea3d4f20164fe" : #"hash_4c9c7c4f5b319ca5"), "tag_missile_ri_fx1");
		}
		if(!isdefined(self.var_86290a61))
		{
			self.var_86290a61 = playviewmodelfx(localclientnum, (is_upgraded ? #"hash_7b19173c4cd204c2" : #"hash_5d4a11460d001591"), "tag_missile_le_fx1");
		}
	}
	else
	{
		if(isdefined(self.var_6ccae77f))
		{
			killfx(localclientnum, self.var_6ccae77f);
			self.var_6ccae77f = undefined;
		}
		if(isdefined(self.var_86290a61))
		{
			killfx(localclientnum, self.var_86290a61);
			self.var_86290a61 = undefined;
		}
	}
}

/*
	Name: function_3efc58e4
	Namespace: namespace_1e7573ec
	Checksum: 0x4EF193BD
	Offset: 0x17F0
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_3efc58e4(weapon)
{
	if(isdefined(weapon))
	{
		switch(weapon.name)
		{
			case "hash_226d0ad69d9efa1":
			case "hash_c5ecf0ae6501e5f":
			case "hash_131a672d67787b26":
			case "hash_13c5628d2e8de172":
			case "hash_209d5c516bfdf9e5":
			case "hash_2d0c14dce5a6ebed":
			case "hash_386308ed987052a4":
			case "hash_7bf7797b85b0089c":
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_a1e57b34
	Namespace: namespace_1e7573ec
	Checksum: 0x9258E0F1
	Offset: 0x18B0
	Size: 0x52E
	Parameters: 7
	Flags: Linked
*/
function function_a1e57b34(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(!isdefined(self.owner))
		{
			return;
		}
		if(!isdefined(self.var_31574a7))
		{
			self.var_31574a7 = util::spawn_model(fieldname, "tag_origin");
			self.var_31574a7 thread function_2ed768c7(self);
		}
		if(!isdefined(self.var_de6c5ff9))
		{
			self.var_de6c5ff9 = util::spawn_model(fieldname, "tag_origin");
			self.var_de6c5ff9 thread function_2ed768c7(self);
		}
		if(isdefined(self.var_6152b139))
		{
			beam::function_47deed80(fieldname, self.var_6152b139);
		}
		weapon = self.owner function_d2c2b168().rootweapon;
		if(weapon.name === #"hash_13c5628d2e8de172")
		{
			self.var_d34c8bb = (self.owner zm_utility::function_f8796df3(fieldname) ? "beam9_zm_mega_barrel_blazer_upgraded" : "beam9_zm_mega_barrel_blazer_3p_upgraded");
		}
		else
		{
			self.var_d34c8bb = (self.owner zm_utility::function_f8796df3(fieldname) ? "beam9_zm_mega_barrel_blazer" : "beam9_zm_mega_barrel_blazer_3p");
		}
		self.var_31574a7 unlink();
		self.var_de6c5ff9 unlink();
		self.var_6152b139 = level beam::function_cfb2f62a(fieldname, self.owner, "tag_flash", self.var_de6c5ff9, "tag_origin", self.var_d34c8bb);
		self thread function_c57b04f7(fieldname);
	}
	else
	{
		if(bwastimejump == 2)
		{
			if(isdefined(self.var_31574a7) && isdefined(self.var_de6c5ff9))
			{
				beam::function_47deed80(fieldname, self.var_6152b139);
				self.var_6152b139 = level beam::function_cfb2f62a(fieldname, self.var_31574a7, "tag_origin", self.var_de6c5ff9, "tag_origin", self.var_d34c8bb);
				self.var_31574a7 linkto(self);
				self.var_de6c5ff9 linkto(self);
				self notify(#"hash_2196551ad754e921");
			}
		}
		else
		{
			if(bwastimejump == 3)
			{
				if(isdefined(self.var_31574a7) && (isdefined(self.var_de6c5ff9) && isdefined(self.move_dir)))
				{
					self notify(#"hash_2196551ad754e921");
					self.var_31574a7 unlink();
					self.var_de6c5ff9 unlink();
					v_target_pos = self.var_31574a7.origin + (self.move_dir * (500 + self.var_843dba81));
					trace = beamtrace(self.var_31574a7.origin, v_target_pos, 0, self.owner);
					if(trace[#"fraction"] < 1)
					{
						v_target_pos = trace[#"position"] - trace[#"normal"];
						self.var_de6c5ff9 moveto(v_target_pos, 0.1);
					}
					time = distance(self.var_31574a7.origin, v_target_pos) / 1200;
					if(time > 0)
					{
						self.var_31574a7 moveto(v_target_pos, time);
					}
				}
			}
			else
			{
				if(isdefined(self.var_31574a7))
				{
					self.var_31574a7 delete();
				}
				if(isdefined(self.var_de6c5ff9))
				{
					self.var_de6c5ff9 delete();
				}
				self.var_6152b139 = undefined;
			}
		}
	}
}

/*
	Name: function_c57b04f7
	Namespace: namespace_1e7573ec
	Checksum: 0x6AFE224F
	Offset: 0x1DE8
	Size: 0x304
	Parameters: 1
	Flags: Linked
*/
function function_c57b04f7(localclientnum)
{
	level endon(#"end_game");
	self endon(#"death", #"hash_2196551ad754e921");
	self.var_31574a7 endon(#"death");
	self.var_de6c5ff9 endon(#"death");
	self notify("db1d1a3509841a7");
	self endon("db1d1a3509841a7");
	self.var_843dba81 = 20;
	while(isalive(self.owner))
	{
		if(self.owner zm_utility::function_f8796df3(localclientnum))
		{
			tag_pos = function_8cb7ea7(localclientnum, "tag_flash");
		}
		else
		{
			tag_pos = self.owner gettagorigin("tag_flash");
		}
		if(!isdefined(tag_pos))
		{
			/#
				println("");
			#/
			waitframe(1);
			continue;
		}
		self.var_31574a7.origin = tag_pos;
		var_1e65372b = (isdefined(self.owner getcampos()) ? self.owner getcampos() : tag_pos);
		if(self.var_843dba81 < 800)
		{
			self.var_843dba81 = self.var_843dba81 + 19.2;
		}
		self.move_dir = anglestoforward(self.owner getplayerangles());
		v_target_pos = var_1e65372b + (self.move_dir * self.var_843dba81);
		trace = beamtrace(var_1e65372b, v_target_pos, 0, self.owner);
		if(trace[#"fraction"] < 1)
		{
			v_target_pos = trace[#"position"] - trace[#"normal"];
			self.var_843dba81 = distance(v_target_pos, var_1e65372b);
		}
		self.var_de6c5ff9.origin = v_target_pos;
		self.var_de6c5ff9.angles = vectortoangles(tag_pos - v_target_pos);
		waitframe(1);
	}
}

/*
	Name: function_2ed768c7
	Namespace: namespace_1e7573ec
	Checksum: 0x14B1E50A
	Offset: 0x20F8
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function function_2ed768c7(parent, var_543c7862)
{
	self endon(#"death");
	parent waittill(#"death");
	if(isdefined(self) && isdefined(var_543c7862))
	{
		self scene::stop(var_543c7862, undefined, undefined, undefined, undefined, 1);
	}
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_2fa08804
	Namespace: namespace_1e7573ec
	Checksum: 0x32BF6E37
	Offset: 0x2198
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_2fa08804(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_d4d3f6c4 = util::playfxontag(fieldname, #"hash_6eeaf3e3b5a7477a", self, "tag_origin");
	}
	else if(isdefined(self.var_d4d3f6c4))
	{
		killfx(fieldname, self.var_d4d3f6c4);
		self.var_d4d3f6c4 = undefined;
	}
}

/*
	Name: function_61987d28
	Namespace: namespace_1e7573ec
	Checksum: 0xAB907371
	Offset: 0x2250
	Size: 0x9C
	Parameters: 7
	Flags: Linked
*/
function function_61987d28(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.copycat))
	{
		util::playfxontag(bwastimejump, (self.copycat.var_515e20e6 ? #"hash_77e7d9c6c1c5cb2b" : #"hash_52f32fbd7a1126ba"), self.copycat, "tag_flash");
	}
}

/*
	Name: function_53bb1917
	Namespace: namespace_1e7573ec
	Checksum: 0xFD03B344
	Offset: 0x22F8
	Size: 0x21C
	Parameters: 7
	Flags: Linked
*/
function function_53bb1917(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.copycat))
		{
			weapon = self function_d2c2b168().rootweapon;
			copycat = util::spawn_model(fieldname, #"hash_62460e2f377db8bc");
			copycat.var_515e20e6 = weapon.name === #"hash_2d0c14dce5a6ebed";
			copycat linktocamera();
			copycat setforcenocull();
			copycat thread scene::play(#"hash_658647939375d560", copycat);
			copycat thread function_2ed768c7(self, #"hash_658647939375d560");
			copycat function_bf9d3071(#"hash_225a66106179e9bb");
			util::playfxontag(fieldname, (copycat.var_515e20e6 ? #"hash_2eabcf6f328bb46b" : #"hash_2ac49f49b148a4fa"), copycat, "tag_flash");
			self.copycat = copycat;
		}
	}
	else if(isdefined(self.copycat))
	{
		self.copycat scene::stop(#"hash_658647939375d560", undefined, undefined, undefined, undefined, 1);
		if(isdefined(self.copycat))
		{
			self.copycat delete();
		}
	}
}

/*
	Name: function_778e494b
	Namespace: namespace_1e7573ec
	Checksum: 0x4442CA22
	Offset: 0x2520
	Size: 0x244
	Parameters: 7
	Flags: Linked
*/
function function_778e494b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 2)
	{
		self function_4e818189(#"hash_23e50ec84718e9aa");
		self function_6b945d59(#"hash_225a66106179e9bb");
		if(isdefined(self.copycat))
		{
			self.copycat function_bf9d3071(#"hash_23e50ec84718e9aa");
			self.copycat function_5d482e78(#"hash_225a66106179e9bb");
		}
	}
	else
	{
		if(bwastimejump == 1)
		{
			self function_4e818189(#"hash_225a66106179e9bb");
			self function_6b945d59(#"hash_23e50ec84718e9aa");
			if(isdefined(self.copycat))
			{
				self.copycat function_bf9d3071(#"hash_225a66106179e9bb");
				self.copycat function_5d482e78(#"hash_23e50ec84718e9aa");
			}
		}
		else
		{
			self function_6b945d59(#"hash_225a66106179e9bb");
			self function_6b945d59(#"hash_23e50ec84718e9aa");
			if(isdefined(self.copycat))
			{
				self.copycat function_bf9d3071(#"hash_225a66106179e9bb");
				self.copycat function_5d482e78(#"hash_23e50ec84718e9aa");
			}
		}
	}
}

/*
	Name: function_e688ee7c
	Namespace: namespace_1e7573ec
	Checksum: 0x4A829CF
	Offset: 0x2770
	Size: 0x17C
	Parameters: 7
	Flags: Linked
*/
function function_e688ee7c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_b159952f))
	{
		self function_f6e99a8d(self.var_b159952f);
		self.var_b159952f = undefined;
	}
	if(isdefined(self.var_12b59dee))
	{
		self function_f6e99a8d(self.var_12b59dee, "j_head");
		self.var_12b59dee = undefined;
	}
	var_2ddbe94 = [4:#"hash_16d59f099e418f4f", 3:#"hash_16d59f099e418f4f", 2:#"hash_726534103985846c", 1:#"hash_7417f2cd52314463", 0:#"hash_16d59f099e418f4f"];
	if(bwastimejump && bwastimejump < (var_2ddbe94.size + 1))
	{
		self.var_b159952f = var_2ddbe94[bwastimejump - 1];
		self function_bf9d3071(self.var_b159952f);
	}
}

