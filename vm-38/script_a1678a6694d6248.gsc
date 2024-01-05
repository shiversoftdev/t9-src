#using script_618d6f5ff5d18933;
#using script_3d35e2ff167b3a82;
#using script_14d2d89964cae0b1;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\zm_common\zm_weapons.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_6fc19861;

/*
	Name: function_ee0d27f8
	Namespace: namespace_6fc19861
	Checksum: 0xF54B4F70
	Offset: 0x2D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ee0d27f8()
{
	level notify(1392767348);
}

/*
	Name: __init__system__
	Namespace: namespace_6fc19861
	Checksum: 0x2B3C126D
	Offset: 0x2F8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4c62174ea005e84e", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6fc19861
	Checksum: 0x4E8772F5
	Offset: 0x350
	Size: 0x55C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "" + #"hash_d1d4ed99da50a4b", 28000, 1, "int", &function_72dbb6b0, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_403f172f69819024", 28000, 1, "int", &function_c4b67b53, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_2b223a333ab436cd", 28000, 1, "int", &function_3a8acde0, 0, 0);
	clientfield::register("actor", "" + #"hash_4189b622ab06c2d5", 28000, 1, "counter", &function_6f0e3ec, 0, 0);
	clientfield::register("actor", "" + #"hash_5c2324e6d994b886", 28000, 1, "counter", &function_21f99cd2, 0, 0);
	clientfield::register("allplayers", "" + #"hash_5d6139b1ce0e7c82", 28000, 2, "int", &function_f564024f, 0, 0);
	clientfield::register("toplayer", "" + #"hash_13f32f06b0e858dd", 28000, 3, "int", &function_36ef6d02, 0, 0);
	callback::on_weapon_change(&on_weapon_change);
	if(!isdefined(level.var_5bc34f35))
	{
		level.var_5bc34f35 = [];
	}
	else if(!isarray(level.var_5bc34f35))
	{
		level.var_5bc34f35 = array(level.var_5bc34f35);
	}
	level.var_5bc34f35[0] = #"hash_6395e1f6c15c9836";
	level.var_5bc34f35[1] = #"hash_5f6d3a2792178e29";
	level.var_5bc34f35[2] = #"hash_23d733932ddd62b4";
	if(!isdefined(level.var_5d881f3a))
	{
		level.var_5d881f3a = [];
	}
	else if(!isarray(level.var_5d881f3a))
	{
		level.var_5d881f3a = array(level.var_5d881f3a);
	}
	level.var_5d881f3a[0] = #"hash_5e4a019c329ade68";
	level.var_5d881f3a[1] = #"hash_439ea8dd5a16d629";
	level.var_5d881f3a[2] = #"hash_5055722139451102";
	if(!isdefined(level.var_9a8b65b))
	{
		level.var_9a8b65b = [];
	}
	else if(!isarray(level.var_9a8b65b))
	{
		level.var_9a8b65b = array(level.var_9a8b65b);
	}
	level.var_9a8b65b[0] = #"hash_3c90d5c126974d0f";
	level.var_9a8b65b[1] = #"hash_21bb9d616abf305a";
	level.var_9a8b65b[2] = #"hash_2884c0d1a250451d";
	if(!isdefined(level.var_b421585f))
	{
		level.var_b421585f = [];
	}
	else if(!isarray(level.var_b421585f))
	{
		level.var_b421585f = array(level.var_b421585f);
	}
	level.var_b421585f[0] = #"hash_1eb0fcd268ad64f9";
	level.var_b421585f[1] = #"hash_7d68903fe1e1885a";
	level.var_b421585f[2] = #"hash_1b5cc8850bb5d913";
	level.var_6614c251 = &function_6247981b;
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_6fc19861
	Checksum: 0x5EB04511
	Offset: 0x8B8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_8ac3bea9()
{
	zm_weapons::function_8389c033(#"hash_69461751fa492ea4", #"hash_69461751fa492ea4");
}

/*
	Name: on_weapon_change
	Namespace: namespace_6fc19861
	Checksum: 0xF5F46037
	Offset: 0x8F8
	Size: 0x2AC
	Parameters: 1
	Flags: None
*/
function on_weapon_change(params)
{
	if(self == level || !isplayer(self))
	{
		return;
	}
	localclientnum = params.localclientnum;
	weapon = self function_d2c2b168();
	if(function_17a14a22(weapon))
	{
		self function_4a8e6688(localclientnum);
		self function_413411e1();
		self thread function_5167b40a(localclientnum, weapon);
		self function_1807e3d(localclientnum, function_2da7c1b7(weapon));
		self thread function_710eb784(localclientnum);
		self thread function_a9fa384(localclientnum);
		self notify(#"hash_7d6901432c3a2ec4");
	}
	else
	{
		if(isdefined(self.var_84d6a3cc))
		{
			killfx(localclientnum, self.var_84d6a3cc);
			self.var_84d6a3cc = undefined;
			self.var_13f276b7 = undefined;
		}
		self notify(#"hash_12304702f9d44271");
		if(function_cb769ba9(weapon))
		{
			self function_45a91739(localclientnum);
			self function_413411e1();
			self function_4ddede67(localclientnum, function_2da7c1b7(weapon));
			self thread function_bf8b2d3f(localclientnum);
			self thread function_299fd631(localclientnum);
			self thread function_36fddaa2(localclientnum);
			self.var_960d365a = 0;
			self thread function_d09aaf1a(localclientnum);
		}
		else
		{
			self notify(#"hash_7d6901432c3a2ec4");
			self function_4a8e6688(localclientnum);
			self function_45a91739(localclientnum);
		}
	}
}

/*
	Name: function_58d581b6
	Namespace: namespace_6fc19861
	Checksum: 0x49E429D1
	Offset: 0xBB0
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_58d581b6(weapon)
{
	if(isdefined(weapon))
	{
		switch(weapon.name)
		{
			case "hash_7eab88123b09e2c":
			case "hash_18696150427f2efb":
			case "hash_5382c3fae4273fed":
			case "hash_69461751fa492ea4":
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_17a14a22
	Namespace: namespace_6fc19861
	Checksum: 0xC4AB3577
	Offset: 0xC30
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_17a14a22(weapon)
{
	if(isdefined(weapon))
	{
		switch(weapon.name)
		{
			case "hash_5382c3fae4273fed":
			case "hash_69461751fa492ea4":
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_cb769ba9
	Namespace: namespace_6fc19861
	Checksum: 0xDAE2E348
	Offset: 0xC90
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_cb769ba9(weapon)
{
	if(isdefined(weapon))
	{
		switch(weapon.name)
		{
			case "hash_7eab88123b09e2c":
			case "hash_18696150427f2efb":
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_2da7c1b7
	Namespace: namespace_6fc19861
	Checksum: 0xC9A4F8E4
	Offset: 0xCF0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_2da7c1b7(weapon)
{
	if(isdefined(weapon))
	{
		switch(weapon.name)
		{
			case "hash_7eab88123b09e2c":
			case "hash_5382c3fae4273fed":
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_5167b40a
	Namespace: namespace_6fc19861
	Checksum: 0xF0811222
	Offset: 0xD50
	Size: 0x420
	Parameters: 2
	Flags: None
*/
function function_5167b40a(localclientnum, weapon)
{
	self endon(#"death", #"weapon_change", #"hash_20766a971f7a55b4");
	self notify("46b9e8dbcaf46fe1");
	self endon("46b9e8dbcaf46fe1");
	while(true)
	{
		var_a1796c91 = self function_cb96958d(localclientnum, weapon);
		is_upgraded = function_2da7c1b7(weapon);
		if(!isdefined(var_a1796c91) || is_true(self.var_b7a5e43f))
		{
			if(isdefined(self.var_84d6a3cc))
			{
				killfx(localclientnum, self.var_84d6a3cc);
			}
			self.var_13f276b7 = undefined;
		}
		else
		{
			if(isdefined(self.var_13f276b7))
			{
				if(self.var_13f276b7 != var_a1796c91)
				{
					if(isdefined(self.var_84d6a3cc))
					{
						killfx(localclientnum, self.var_84d6a3cc);
					}
					if(self zm_utility::function_f8796df3(localclientnum))
					{
						if(viewmodelhastag(localclientnum, "tag_base_fx"))
						{
							if(is_upgraded)
							{
								self.var_84d6a3cc = playviewmodelfx(localclientnum, level.var_9a8b65b[var_a1796c91], "tag_base_fx");
							}
							else
							{
								self.var_84d6a3cc = playviewmodelfx(localclientnum, level.var_5bc34f35[var_a1796c91], "tag_base_fx");
							}
						}
					}
					else if(isdefined(self gettagorigin("tag_base_fx")))
					{
						if(is_upgraded)
						{
							self.var_84d6a3cc = util::playfxontag(localclientnum, level.var_b421585f[var_a1796c91], self, "tag_base_fx");
						}
						else
						{
							self.var_84d6a3cc = util::playfxontag(localclientnum, level.var_5d881f3a[var_a1796c91], self, "tag_base_fx");
						}
					}
					self.var_13f276b7 = var_a1796c91;
				}
			}
			else
			{
				if(self zm_utility::function_f8796df3(localclientnum))
				{
					if(viewmodelhastag(localclientnum, "tag_base_fx"))
					{
						if(is_upgraded)
						{
							self.var_84d6a3cc = playviewmodelfx(localclientnum, level.var_9a8b65b[var_a1796c91], "tag_base_fx");
						}
						else
						{
							self.var_84d6a3cc = playviewmodelfx(localclientnum, level.var_5bc34f35[var_a1796c91], "tag_base_fx");
						}
					}
				}
				else if(isdefined(self gettagorigin("tag_base_fx")))
				{
					if(is_upgraded)
					{
						self.var_84d6a3cc = util::playfxontag(localclientnum, level.var_b421585f[var_a1796c91], self, "tag_base_fx");
					}
					else
					{
						self.var_84d6a3cc = util::playfxontag(localclientnum, level.var_5d881f3a[var_a1796c91], self, "tag_base_fx");
					}
				}
				self.var_13f276b7 = var_a1796c91;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_cb96958d
	Namespace: namespace_6fc19861
	Checksum: 0xA323C126
	Offset: 0x1178
	Size: 0xD4
	Parameters: 2
	Flags: None
*/
function function_cb96958d(localclientnum, weapon)
{
	altweapon = weapon.altweapon;
	if(isdefined(altweapon))
	{
		var_726cb2b4 = getweaponammoclip(localclientnum, altweapon);
		current_stock_ammo = self getweaponammostock(localclientnum, altweapon);
		var_84a2de70 = altweapon.maxammo;
		if(current_stock_ammo == var_84a2de70)
		{
			return 2;
		}
		if(current_stock_ammo == 0 && var_726cb2b4 == 0)
		{
			return 0;
		}
		return 1;
	}
	return undefined;
}

/*
	Name: function_6247981b
	Namespace: namespace_6fc19861
	Checksum: 0x5A6F81F0
	Offset: 0x1258
	Size: 0x236
	Parameters: 2
	Flags: None
*/
function function_6247981b(localclientnum, var_a6762160)
{
	if(!isdefined(localclientnum))
	{
		return 0;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	var_b84949d0 = undefined;
	var_cb5aea38 = [2:((((17 + 1) + 8) + 1) + 8) + 1, 1:((17 + 1) + 8) + 1, 0:17 + 1];
	foreach(slot in var_cb5aea38)
	{
		slot_item = data.inventory.items[slot];
		if(!isdefined(slot_item))
		{
			continue;
		}
		slot_weapon = self namespace_a0d533d1::function_2b83d3ff(slot_item);
		if(function_58d581b6(slot_weapon))
		{
			var_b84949d0 = slot_weapon;
			break;
		}
	}
	if(isdefined(var_b84949d0))
	{
		if(var_a6762160.name === #"hash_7ee7b21a68b25ce6")
		{
			if(isdefined(self.var_c926b4fc) && self.var_c926b4fc >= 5)
			{
				return 4194304;
			}
			return 0;
		}
		var_d354e19e = function_cb96958d(localclientnum, var_b84949d0);
		if(var_d354e19e === 2)
		{
			return 4194304;
		}
		return 0;
	}
	return 2097152;
}

/*
	Name: function_72dbb6b0
	Namespace: namespace_6fc19861
	Checksum: 0xFED185B3
	Offset: 0x1498
	Size: 0x1FC
	Parameters: 7
	Flags: None
*/
function function_72dbb6b0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self thread function_a77b707(fieldname);
		self playrenderoverridebundle(#"hash_20021a924b743e3e");
		if(!isdefined(self.var_97928c44))
		{
			self playsound(fieldname, #"hash_3376f5f8d417f9f1");
			self.var_97928c44 = self playloopsound(#"hash_42793df46bf25c17", undefined, vectorscale((0, 0, 1), 40));
		}
	}
	else
	{
		self util::playfxontag(fieldname, #"hash_7192edc12ac2b6a4", self, "J_SpineLower");
		playrumbleonposition(fieldname, #"ieu_cryo_shatter_rumble", self.origin);
		if(isdefined(self.var_97928c44))
		{
			self stoploopsound(self.var_97928c44);
			self.var_97928c44 = undefined;
		}
		playsound(fieldname, #"hash_7c352e97b08234f4", self.origin + vectorscale((0, 0, 1), 40));
		self stoprenderoverridebundle(#"hash_20021a924b743e3e");
		self thread function_82a54d90(fieldname);
		self hide();
	}
}

/*
	Name: function_a77b707
	Namespace: namespace_6fc19861
	Checksum: 0xA1A7D398
	Offset: 0x16A0
	Size: 0x20C
	Parameters: 1
	Flags: None
*/
function function_a77b707(localclientnum)
{
	if(!isdefined(self.var_6a8a5f47))
	{
		self.var_6a8a5f47 = [];
	}
	if(isdefined(self.var_6a8a5f47[localclientnum]))
	{
		return;
	}
	self.var_72dbb6b0[localclientnum] = [];
	function_8974fc4a(localclientnum, #"hash_b01b5e755fa10a", "torso", "j_spinelower");
	if(!self gibclientutils::isgibbed(localclientnum, self, 8))
	{
		function_8974fc4a(localclientnum, #"hash_4741906c90121375", "chin", "j_head");
	}
	if(!self gibclientutils::isgibbed(localclientnum, self, 16))
	{
		function_8974fc4a(localclientnum, #"hash_72dea7e99c30c2d6", "right_arm", "j_elbow_ri");
	}
	if(!self gibclientutils::isgibbed(localclientnum, self, 32))
	{
		function_8974fc4a(localclientnum, #"hash_72dea1e99c30b8a4", "left_arm", "j_elbow_le");
	}
	if(!self gibclientutils::isgibbed(localclientnum, self, 128))
	{
		function_8974fc4a(localclientnum, #"hash_611a35f466db296c", "right_leg", "j_knee_ri");
	}
	if(!self gibclientutils::isgibbed(localclientnum, self, 256))
	{
		function_8974fc4a(localclientnum, #"hash_6105b5f466c9a6e2", "left_leg", "j_knee_le");
	}
}

/*
	Name: function_8974fc4a
	Namespace: namespace_6fc19861
	Checksum: 0x6037C7AC
	Offset: 0x18B8
	Size: 0x4A
	Parameters: 4
	Flags: None
*/
function function_8974fc4a(localclientnum, fx, key, tag)
{
	self.var_6a8a5f47[localclientnum][key] = util::playfxontag(localclientnum, fx, self, tag);
}

/*
	Name: function_82a54d90
	Namespace: namespace_6fc19861
	Checksum: 0x2E2E5CA7
	Offset: 0x1910
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_82a54d90(localclientnum)
{
	self endon(#"death");
	if(isdefined(self.var_6a8a5f47) && isdefined(self.var_6a8a5f47[localclientnum]))
	{
		keys = getarraykeys(self.var_6a8a5f47[localclientnum]);
		for(i = 0; i < keys.size; i++)
		{
			function_6e2eda79(localclientnum, keys[i]);
		}
		self.var_6a8a5f47[localclientnum] = undefined;
	}
}

/*
	Name: function_6e2eda79
	Namespace: namespace_6fc19861
	Checksum: 0x39A9C85D
	Offset: 0x19D0
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function function_6e2eda79(localclientnum, key)
{
	deletefx(localclientnum, self.var_6a8a5f47[localclientnum][key]);
}

/*
	Name: function_c4b67b53
	Namespace: namespace_6fc19861
	Checksum: 0xA83826AD
	Offset: 0x1A18
	Size: 0x11E
	Parameters: 7
	Flags: None
*/
function function_c4b67b53(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_104490e2 = util::playfxontag(fieldname, #"hash_6151ad74ed1a70e6", self, "tag_origin");
		if(!isdefined(self.var_59dd8d3e))
		{
			self.var_59dd8d3e = self playloopsound(#"hash_79b4ac1c1aed9056");
		}
	}
	else
	{
		if(isdefined(self.var_104490e2))
		{
			killfx(fieldname, self.var_104490e2);
			self.var_104490e2 = undefined;
		}
		if(isdefined(self.var_59dd8d3e))
		{
			self stoploopsound(self.var_59dd8d3e);
			self.var_59dd8d3e = undefined;
		}
	}
}

/*
	Name: function_3a8acde0
	Namespace: namespace_6fc19861
	Checksum: 0xC88C9A9C
	Offset: 0x1B40
	Size: 0x11E
	Parameters: 7
	Flags: None
*/
function function_3a8acde0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_104490e2 = util::playfxontag(fieldname, #"hash_195fabff27c05c1f", self, "tag_origin");
		if(!isdefined(self.var_59dd8d3e))
		{
			self.var_59dd8d3e = self playloopsound(#"hash_79b4ac1c1aed9056");
		}
	}
	else
	{
		if(isdefined(self.var_104490e2))
		{
			killfx(fieldname, self.var_104490e2);
			self.var_104490e2 = undefined;
		}
		if(isdefined(self.var_59dd8d3e))
		{
			self stoploopsound(self.var_59dd8d3e);
			self.var_59dd8d3e = undefined;
		}
	}
}

/*
	Name: function_6f0e3ec
	Namespace: namespace_6fc19861
	Checksum: 0x64789570
	Offset: 0x1C68
	Size: 0x9C
	Parameters: 7
	Flags: None
*/
function function_6f0e3ec(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, #"hash_16217ad682d25c31", self, "J_Spine4");
	playsound(bwastimejump, #"hash_54b94d7ce3b3829a", self.origin + vectorscale((0, 0, 1), 25));
}

/*
	Name: function_21f99cd2
	Namespace: namespace_6fc19861
	Checksum: 0xCEA5C99E
	Offset: 0x1D10
	Size: 0x9C
	Parameters: 7
	Flags: None
*/
function function_21f99cd2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, #"hash_5b7fecd9069a79a2", self, "J_Spine4");
	playsound(bwastimejump, #"hash_54b94d7ce3b3829a", self.origin + vectorscale((0, 0, 1), 25));
}

/*
	Name: function_f564024f
	Namespace: namespace_6fc19861
	Checksum: 0x6BD5F83B
	Offset: 0x1DB8
	Size: 0xFA
	Parameters: 7
	Flags: None
*/
function function_f564024f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_bab1a4cb))
	{
		self stoploopsound(self.var_bab1a4cb);
		self.var_bab1a4cb = undefined;
	}
	if(bwastimejump == 1)
	{
		self.var_bab1a4cb = self playloopsound(#"hash_4166b3feb34a26ae", undefined, vectorscale((0, 0, 1), 50));
	}
	else if(bwastimejump == 2)
	{
		self.var_bab1a4cb = self playloopsound(#"hash_2204d8749b6a599b", undefined, vectorscale((0, 0, 1), 50));
	}
}

/*
	Name: function_36ef6d02
	Namespace: namespace_6fc19861
	Checksum: 0x1FA2D1CD
	Offset: 0x1EC0
	Size: 0x9C
	Parameters: 7
	Flags: None
*/
function function_36ef6d02(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_c926b4fc = bwastimejump - 1;
	weapon = self function_d2c2b168();
	if(function_58d581b6(weapon))
	{
		self function_413411e1();
	}
}

/*
	Name: function_413411e1
	Namespace: namespace_6fc19861
	Checksum: 0x3804C622
	Offset: 0x1F68
	Size: 0x54A
	Parameters: 0
	Flags: None
*/
function function_413411e1()
{
	if(!isdefined(self.var_c926b4fc))
	{
		return;
	}
	switch(self.var_c926b4fc)
	{
		case 0:
		{
			self function_60baf83(#"hash_2c13b8c4a279fcc5");
			self function_60baf83(#"hash_20f8b2c49b7e5461");
			self function_60baf83(#"hash_21149ec49b96ad1d");
			self function_60baf83(#"hash_224204b4ff32ed94");
			self function_60baf83(#"hash_7aaef7109d7bff11");
			self function_2f16cef6(#"hash_334400c4a621888e");
			break;
		}
		case 1:
		{
			self function_60baf83(#"hash_334400c4a621888e");
			self function_60baf83(#"hash_20f8b2c49b7e5461");
			self function_60baf83(#"hash_21149ec49b96ad1d");
			self function_60baf83(#"hash_224204b4ff32ed94");
			self function_60baf83(#"hash_7aaef7109d7bff11");
			self function_2f16cef6(#"hash_2c13b8c4a279fcc5");
			break;
		}
		case 2:
		{
			self function_60baf83(#"hash_334400c4a621888e");
			self function_60baf83(#"hash_2c13b8c4a279fcc5");
			self function_60baf83(#"hash_21149ec49b96ad1d");
			self function_60baf83(#"hash_224204b4ff32ed94");
			self function_60baf83(#"hash_7aaef7109d7bff11");
			self function_2f16cef6(#"hash_20f8b2c49b7e5461");
			break;
		}
		case 3:
		{
			self function_60baf83(#"hash_334400c4a621888e");
			self function_60baf83(#"hash_2c13b8c4a279fcc5");
			self function_60baf83(#"hash_20f8b2c49b7e5461");
			self function_60baf83(#"hash_224204b4ff32ed94");
			self function_60baf83(#"hash_7aaef7109d7bff11");
			self function_2f16cef6(#"hash_21149ec49b96ad1d");
			break;
		}
		case 4:
		{
			self function_60baf83(#"hash_334400c4a621888e");
			self function_60baf83(#"hash_2c13b8c4a279fcc5");
			self function_60baf83(#"hash_20f8b2c49b7e5461");
			self function_60baf83(#"hash_7aaef7109d7bff11");
			self function_2f16cef6(#"hash_21149ec49b96ad1d");
			self function_2f16cef6(#"hash_224204b4ff32ed94");
			break;
		}
		case 5:
		{
			self function_60baf83(#"hash_334400c4a621888e");
			self function_60baf83(#"hash_2c13b8c4a279fcc5");
			self function_60baf83(#"hash_20f8b2c49b7e5461");
			self function_2f16cef6(#"hash_21149ec49b96ad1d");
			self function_2f16cef6(#"hash_224204b4ff32ed94");
			self function_2f16cef6(#"hash_7aaef7109d7bff11");
			break;
		}
		default:
		{
			return;
		}
	}
}

/*
	Name: function_60baf83
	Namespace: namespace_6fc19861
	Checksum: 0x15970164
	Offset: 0x24C0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_60baf83(var_ee6bcd51)
{
	if(isplayer(self))
	{
		self zm_utility::function_f933b697(var_ee6bcd51);
	}
	self stoprenderoverridebundle(var_ee6bcd51);
}

/*
	Name: function_2f16cef6
	Namespace: namespace_6fc19861
	Checksum: 0x24F751C
	Offset: 0x2520
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_2f16cef6(var_ee6bcd51)
{
	if(isplayer(self))
	{
		if(self zm_utility::function_10df0b9c(var_ee6bcd51))
		{
			self playrenderoverridebundle(var_ee6bcd51);
		}
		self zm_utility::function_8065ace2(var_ee6bcd51);
	}
	else
	{
		self playrenderoverridebundle(var_ee6bcd51);
	}
}

/*
	Name: function_1807e3d
	Namespace: namespace_6fc19861
	Checksum: 0xF051B209
	Offset: 0x25B0
	Size: 0x4FA
	Parameters: 2
	Flags: Private
*/
function private function_1807e3d(localclientnum, is_upgraded)
{
	if(self zm_utility::function_f8796df3(localclientnum))
	{
		if(viewmodelhastag(localclientnum, "tag_front_fx"))
		{
			if(!isdefined(self.var_384a4cdc))
			{
				if(is_true(is_upgraded))
				{
					self.var_384a4cdc = playviewmodelfx(localclientnum, #"hash_6c26c1b6666191d7", "tag_front_fx");
				}
				else
				{
					self.var_384a4cdc = playviewmodelfx(localclientnum, #"hash_530fd01a386be23e", "tag_front_fx");
				}
			}
			if(!isdefined(self.var_467ce941))
			{
				if(is_true(is_upgraded))
				{
					self.var_467ce941 = playviewmodelfx(localclientnum, #"hash_70935884eb69c00f", "tag_front_fx");
				}
				else
				{
					self.var_467ce941 = playviewmodelfx(localclientnum, #"hash_27ed0f02151ab936", "tag_front_fx");
				}
			}
		}
		if(viewmodelhastag(localclientnum, "tag_clip_fx"))
		{
			if(!isdefined(self.var_3afdb5f7))
			{
				if(is_true(is_upgraded))
				{
					self.var_3afdb5f7 = playviewmodelfx(localclientnum, #"hash_70935884eb69c00f", "tag_clip_fx");
				}
				else
				{
					self.var_3afdb5f7 = playviewmodelfx(localclientnum, #"hash_27ed0f02151ab936", "tag_clip_fx");
				}
			}
		}
		if(viewmodelhastag(localclientnum, "tag_foregrip_fx"))
		{
			if(!isdefined(self.var_393f3aea))
			{
				if(is_true(is_upgraded))
				{
					self.var_393f3aea = playviewmodelfx(localclientnum, #"hash_70935884eb69c00f", "tag_foregrip_fx");
				}
				else
				{
					self.var_393f3aea = playviewmodelfx(localclientnum, #"hash_27ed0f02151ab936", "tag_foregrip_fx");
				}
			}
		}
	}
	else
	{
		if(isdefined(self gettagorigin("tag_front_fx")))
		{
			if(!isdefined(self.var_384a4cdc))
			{
				if(is_true(is_upgraded))
				{
					self.var_384a4cdc = util::playfxontag(localclientnum, #"hash_65d872a4708a2015", self, "tag_front_fx");
				}
				else
				{
					self.var_384a4cdc = util::playfxontag(localclientnum, #"hash_5308c41a3865af2c", self, "tag_front_fx");
				}
			}
			if(!isdefined(self.var_467ce941))
			{
				if(is_true(is_upgraded))
				{
					self.var_467ce941 = util::playfxontag(localclientnum, #"hash_39009cb2c0d92c8d", self, "tag_front_fx");
				}
				else
				{
					self.var_467ce941 = util::playfxontag(localclientnum, #"hash_27e623021514bc84", self, "tag_front_fx");
				}
			}
		}
		if(isdefined(self gettagorigin("tag_clip_fx")))
		{
			if(!isdefined(self.var_3afdb5f7))
			{
				if(is_true(is_upgraded))
				{
					self.var_3afdb5f7 = util::playfxontag(localclientnum, #"hash_39009cb2c0d92c8d", self, "tag_clip_fx");
				}
				else
				{
					self.var_3afdb5f7 = util::playfxontag(localclientnum, #"hash_27e623021514bc84", self, "tag_clip_fx");
				}
			}
		}
		if(isdefined(self gettagorigin("tag_foregrip_fx")))
		{
			if(!isdefined(self.var_393f3aea))
			{
				if(is_true(is_upgraded))
				{
					self.var_393f3aea = util::playfxontag(localclientnum, #"hash_39009cb2c0d92c8d", self, "tag_foregrip_fx");
				}
				else
				{
					self.var_393f3aea = util::playfxontag(localclientnum, #"hash_27e623021514bc84", self, "tag_foregrip_fx");
				}
			}
		}
	}
}

/*
	Name: function_45a91739
	Namespace: namespace_6fc19861
	Checksum: 0x21F6E6A9
	Offset: 0x2AB8
	Size: 0xE6
	Parameters: 1
	Flags: Private
*/
function private function_45a91739(localclientnum)
{
	if(isdefined(self.var_384a4cdc))
	{
		killfx(localclientnum, self.var_384a4cdc);
		self.var_384a4cdc = undefined;
	}
	if(isdefined(self.var_467ce941))
	{
		killfx(localclientnum, self.var_467ce941);
		self.var_467ce941 = undefined;
	}
	if(isdefined(self.var_3afdb5f7))
	{
		killfx(localclientnum, self.var_3afdb5f7);
		self.var_3afdb5f7 = undefined;
	}
	if(isdefined(self.var_393f3aea))
	{
		killfx(localclientnum, self.var_393f3aea);
		self.var_393f3aea = undefined;
	}
}

/*
	Name: function_710eb784
	Namespace: namespace_6fc19861
	Checksum: 0xE4B80499
	Offset: 0x2BA8
	Size: 0xF2
	Parameters: 1
	Flags: None
*/
function function_710eb784(localclientnum)
{
	self endon(#"death", #"hash_12304702f9d44271");
	self notify("731b4dfdf6a2327e");
	self endon("731b4dfdf6a2327e");
	while(true)
	{
		self waittillmatch({#notetrack:"axe_gun_melee_altdrop"}, #"notetrack");
		self function_45a91739(localclientnum);
		self notify(#"hash_20766a971f7a55b4");
		if(isdefined(self.var_84d6a3cc))
		{
			killfx(localclientnum, self.var_84d6a3cc);
			self.var_84d6a3cc = undefined;
			self.var_13f276b7 = undefined;
		}
	}
}

/*
	Name: function_4ddede67
	Namespace: namespace_6fc19861
	Checksum: 0x4842EAA7
	Offset: 0x2CA8
	Size: 0x432
	Parameters: 2
	Flags: Private
*/
function private function_4ddede67(localclientnum, is_upgraded)
{
	if(self zm_utility::function_f8796df3(localclientnum))
	{
		if(viewmodelhastag(localclientnum, "tag_flash"))
		{
			if(!isdefined(self.var_2fb11b7d))
			{
				if(is_true(is_upgraded))
				{
					self.var_2fb11b7d = playviewmodelfx(localclientnum, #"hash_9e3fb4ca8e51b67", "tag_flash");
				}
				else
				{
					self.var_2fb11b7d = playviewmodelfx(localclientnum, #"hash_12a9caea822d486e", "tag_flash");
				}
			}
		}
		if(viewmodelhastag(localclientnum, "tag_foregrip_fx"))
		{
			if(!isdefined(self.var_e0c5e0fb))
			{
				if(is_true(is_upgraded))
				{
					self.var_e0c5e0fb = playviewmodelfx(localclientnum, #"hash_58bc72cc43986b8a", "tag_foregrip_fx");
				}
				else
				{
					self.var_e0c5e0fb = playviewmodelfx(localclientnum, #"hash_5048984591ec7d39", "tag_foregrip_fx");
				}
			}
		}
		if(viewmodelhastag(localclientnum, "tag_clip_fx"))
		{
			if(!is_true(self.var_960d365a))
			{
				if(!isdefined(self.var_db9746bd))
				{
					if(is_true(is_upgraded))
					{
						self.var_db9746bd = playviewmodelfx(localclientnum, #"hash_7a41b13912db7647", "tag_clip_fx");
					}
					else
					{
						self.var_db9746bd = playviewmodelfx(localclientnum, #"hash_21ddd383c5f1da8e", "tag_clip_fx");
					}
				}
				self function_2f16cef6(#"hash_7e341bfa0d589119");
			}
		}
	}
	else
	{
		if(isdefined(self gettagorigin("tag_flash")))
		{
			if(!isdefined(self.var_2fb11b7d))
			{
				if(is_true(is_upgraded))
				{
					self.var_2fb11b7d = util::playfxontag(localclientnum, #"hash_5f5845649d3a9a5", self, "tag_flash");
				}
				else
				{
					self.var_2fb11b7d = util::playfxontag(localclientnum, #"hash_12a2beea8227155c", self, "tag_flash");
				}
			}
		}
		if(isdefined(self gettagorigin("tag_foregrip_fx")))
		{
			if(!isdefined(self.var_e0c5e0fb))
			{
				if(is_true(is_upgraded))
				{
					self.var_e0c5e0fb = util::playfxontag(localclientnum, #"hash_3e005fe29fa7615c", self, "tag_foregrip_fx");
				}
				else
				{
					self.var_e0c5e0fb = util::playfxontag(localclientnum, #"hash_504ea44591f0fd4b", self, "tag_foregrip_fx");
				}
			}
		}
		if(isdefined(self gettagorigin("tag_clip_fx")))
		{
			if(!isdefined(self.var_db9746bd))
			{
				if(is_true(is_upgraded))
				{
					self.var_db9746bd = util::playfxontag(localclientnum, #"hash_5249aab7a046b05", self, "tag_clip_fx");
				}
				else
				{
					self.var_db9746bd = util::playfxontag(localclientnum, #"hash_21d6c783c5eba77c", self, "tag_clip_fx");
				}
			}
		}
	}
}

/*
	Name: function_4a8e6688
	Namespace: namespace_6fc19861
	Checksum: 0x4762C462
	Offset: 0x30E8
	Size: 0xCC
	Parameters: 1
	Flags: Private
*/
function private function_4a8e6688(localclientnum)
{
	if(isdefined(self.var_2fb11b7d))
	{
		killfx(localclientnum, self.var_2fb11b7d);
		self.var_2fb11b7d = undefined;
	}
	if(isdefined(self.var_e0c5e0fb))
	{
		killfx(localclientnum, self.var_e0c5e0fb);
		self.var_e0c5e0fb = undefined;
	}
	if(isdefined(self.var_db9746bd))
	{
		killfx(localclientnum, self.var_db9746bd);
		self.var_db9746bd = undefined;
	}
	self function_60baf83(#"hash_7e341bfa0d589119");
}

/*
	Name: function_bf8b2d3f
	Namespace: namespace_6fc19861
	Checksum: 0x1AE5CA01
	Offset: 0x31C0
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function function_bf8b2d3f(localclientnum)
{
	self endon(#"death", #"hash_7d6901432c3a2ec4");
	self notify("335f9a95bd631670");
	self endon("335f9a95bd631670");
	while(true)
	{
		self waittillmatch({#notetrack:"axe_gun_smg_altdrop"}, #"notetrack");
		self function_4a8e6688(localclientnum);
	}
}

/*
	Name: function_299fd631
	Namespace: namespace_6fc19861
	Checksum: 0x7A060A75
	Offset: 0x3268
	Size: 0xC8
	Parameters: 1
	Flags: None
*/
function function_299fd631(localclientnum)
{
	self endon(#"death", #"weapon_change");
	self notify("16d56a3e073090e1");
	self endon("16d56a3e073090e1");
	while(true)
	{
		self waittillmatch({#notetrack:"mag_out"}, #"notetrack");
		self.var_960d365a = 1;
		weapon = self function_d2c2b168();
		self function_4a8e6688(localclientnum);
	}
}

/*
	Name: function_36fddaa2
	Namespace: namespace_6fc19861
	Checksum: 0xF3D1B9C8
	Offset: 0x3338
	Size: 0xE0
	Parameters: 1
	Flags: None
*/
function function_36fddaa2(localclientnum)
{
	self endon(#"death", #"weapon_change");
	self notify("72ad2d35c2590c50");
	self endon("72ad2d35c2590c50");
	while(true)
	{
		self waittillmatch({#notetrack:"mag_in"}, #"notetrack");
		self.var_960d365a = 0;
		weapon = self function_d2c2b168();
		self function_4ddede67(localclientnum, function_2da7c1b7(weapon));
	}
}

/*
	Name: function_a9fa384
	Namespace: namespace_6fc19861
	Checksum: 0x3C68F967
	Offset: 0x3420
	Size: 0xCE
	Parameters: 1
	Flags: None
*/
function function_a9fa384(localclientnum)
{
	self endon(#"death", #"weapon_change");
	self notify("5e1bbf2ff5970343");
	self endon("5e1bbf2ff5970343");
	while(true)
	{
		if(!isdefined(self.var_a0d6f528))
		{
			waitframe(1);
			continue;
		}
		self.var_b7a5e43f = 1;
		self function_45a91739(localclientnum);
		while(isdefined(self.var_a0d6f528))
		{
			waitframe(1);
		}
		self.var_b7a5e43f = 0;
		self function_1807e3d(localclientnum);
		waitframe(1);
	}
}

/*
	Name: function_d09aaf1a
	Namespace: namespace_6fc19861
	Checksum: 0x50E07636
	Offset: 0x34F8
	Size: 0xF6
	Parameters: 1
	Flags: None
*/
function function_d09aaf1a(localclientnum)
{
	self endon(#"death", #"weapon_change");
	self notify("4cb2cad8f37f25c9");
	self endon("4cb2cad8f37f25c9");
	while(true)
	{
		if(!self function_f69ceea9(localclientnum) && !isdefined(self.var_a0d6f528))
		{
			waitframe(1);
			continue;
		}
		self function_4a8e6688(localclientnum);
		while(self function_f69ceea9(localclientnum) || isdefined(self.var_a0d6f528))
		{
			waitframe(1);
		}
		self function_4ddede67(localclientnum);
		waitframe(1);
	}
}

/*
	Name: function_f69ceea9
	Namespace: namespace_6fc19861
	Checksum: 0xC362E8D9
	Offset: 0x35F8
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_f69ceea9(localclientnum)
{
	if(self zm_utility::function_f8796df3(localclientnum))
	{
		return ismeleeing(localclientnum);
	}
	return 0;
}

