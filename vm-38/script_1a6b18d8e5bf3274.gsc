#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_weapons.csc;

#namespace namespace_a5ef5769;

/*
	Name: function_2d2b0cb7
	Namespace: namespace_a5ef5769
	Checksum: 0x87203D7
	Offset: 0x240
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2d2b0cb7()
{
	level notify(1065213596);
}

/*
	Name: function_89f2df9
	Namespace: namespace_a5ef5769
	Checksum: 0x622A29E5
	Offset: 0x260
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_52556758a0c8acfe", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_a5ef5769
	Checksum: 0x34267204
	Offset: 0x2B8
	Size: 0x10C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_47e7d5219a26a786", 16000, 3, "int", &function_dd46bc90, 0, 0);
	clientfield::register("actor", "" + #"hash_3a47820a21ce3170", 16000, 2, "int", &function_219213be, 0, 0);
	clientfield::register("allplayers", "" + #"hash_7508e13e17dd1e3c", 16000, 4, "int", &function_95ad29e7, 0, 0);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_a5ef5769
	Checksum: 0xC3855332
	Offset: 0x3D0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	zm_weapons::function_8389c033(#"hash_5bd48d860ebd5a41", #"hash_5bd48d860ebd5a41");
	zm_weapons::function_8389c033(#"hash_5bd48d860ebd5a41", #"ray_gun");
	zm_weapons::function_8389c033(#"ray_gun", #"hash_5bd48d860ebd5a41");
}

/*
	Name: function_dd46bc90
	Namespace: namespace_a5ef5769
	Checksum: 0x75D0E4CC
	Offset: 0x470
	Size: 0x4EC
	Parameters: 7
	Flags: Linked
*/
function function_dd46bc90(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	b_upgraded = 0;
	if(bwastimejump >= 4)
	{
		b_upgraded = 1;
		bwastimejump = bwastimejump - 4;
	}
	if(bwastimejump == 1)
	{
		if(b_upgraded)
		{
			self.var_4334046f = util::playfxontag(fieldname, #"hash_72abf2bbd4080e1f", self, "tag_origin");
		}
		else
		{
			self.var_4334046f = util::playfxontag(fieldname, #"hash_3c2b3ed125f236e6", self, "tag_origin");
		}
		self playsound(fieldname, #"hash_15c9e639d18c2ca5");
		self.var_40c9b27f = self playloopsound(#"hash_4a6b09eca7bf93b4");
	}
	else
	{
		if(bwastimejump == 2)
		{
			if(isdefined(self.var_4334046f))
			{
				killfx(fieldname, self.var_4334046f);
				self.var_4334046f = undefined;
			}
			if(isdefined(self.var_40c9b27f))
			{
				self stoploopsound(self.var_40c9b27f);
				self.var_40c9b27f = undefined;
			}
			self.var_d5ddfab5 = self playloopsound(#"hash_b13eb4ecd72cf20");
			if(b_upgraded)
			{
				self.var_3b5344ab = util::playfxontag(fieldname, #"hash_5a8d432da25c54e0", self, "tag_origin");
			}
			else
			{
				self.var_3b5344ab = util::playfxontag(fieldname, #"hash_2777321a54c631c7", self, "tag_origin");
			}
		}
		else
		{
			if(bwastimejump == 3)
			{
				if(b_upgraded)
				{
					util::playfxontag(fieldname, #"hash_6f9ddefafb791163", self, "tag_origin");
				}
				else
				{
					util::playfxontag(fieldname, #"hash_24ae623f3508b172", self, "tag_origin");
				}
				self playsound(0, "exp_vortex");
				if(isdefined(self.var_d5ddfab5))
				{
					self stoploopsound(self.var_d5ddfab5);
					self.var_d5ddfab5 = undefined;
					self playsound(0, "evt_aether_dissipate");
				}
				if(isdefined(self.var_40c9b27f))
				{
					self stoploopsound(self.var_40c9b27f);
					self.var_40c9b27f = undefined;
					self playsound(0, "evt_aether_dissipate");
				}
				if(isdefined(self.var_4334046f))
				{
					killfx(fieldname, self.var_4334046f);
					self.var_4334046f = undefined;
				}
				if(isdefined(self.var_3b5344ab))
				{
					killfx(fieldname, self.var_3b5344ab);
					self.var_3b5344ab = undefined;
				}
			}
			else
			{
				if(isdefined(self.var_4334046f))
				{
					stopfx(fieldname, self.var_4334046f);
					self.var_4334046f = undefined;
				}
				if(isdefined(self.var_3b5344ab))
				{
					stopfx(fieldname, self.var_3b5344ab);
					self.var_3b5344ab = undefined;
				}
				if(isdefined(self.var_d5ddfab5))
				{
					self stoploopsound(self.var_d5ddfab5);
					self.var_d5ddfab5 = undefined;
					self playsound(0, "evt_aether_dissipate");
				}
				if(isdefined(self.var_40c9b27f))
				{
					self stoploopsound(self.var_40c9b27f);
					self.var_40c9b27f = undefined;
					self playsound(0, "evt_aether_dissipate");
				}
			}
		}
	}
}

/*
	Name: function_219213be
	Namespace: namespace_a5ef5769
	Checksum: 0x4CB29942
	Offset: 0x968
	Size: 0x134
	Parameters: 7
	Flags: Linked
*/
function function_219213be(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
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
	var_2ddbe94 = [1:#"hash_16d59f099e418f4f", 0:#"hash_1f5f24e8240c291a"];
	if(bwastimejump && bwastimejump < (var_2ddbe94.size + 1))
	{
		self.var_b159952f = var_2ddbe94[bwastimejump - 1];
		self function_bf9d3071(self.var_b159952f);
	}
}

/*
	Name: function_95ad29e7
	Namespace: namespace_a5ef5769
	Checksum: 0xFF989900
	Offset: 0xAA8
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_95ad29e7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread function_34d50615(binitialsnap, fieldname, bwastimejump, 1);
}

/*
	Name: function_34d50615
	Namespace: namespace_a5ef5769
	Checksum: 0xE935CAC4
	Offset: 0xB10
	Size: 0xE4
	Parameters: 4
	Flags: Linked
*/
function function_34d50615(localclientnum, oldval, newval, var_efe94974)
{
	self endon(#"death");
	var_17b7891d = "1caff36fc9c05c75" + "wait_to_update_ammo_fx";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	if(newval === 1 && self flag::get(#"hash_7151daf10b79dc1"))
	{
		self flag::wait_till_clear_timeout(1, #"hash_7151daf10b79dc1");
	}
	self function_5962609c(localclientnum, oldval, newval, var_efe94974);
}

/*
	Name: function_5962609c
	Namespace: namespace_a5ef5769
	Checksum: 0x5D2DE760
	Offset: 0xC00
	Size: 0x77E
	Parameters: 4
	Flags: Linked
*/
function function_5962609c(localclientnum, oldval, newval, var_efe94974)
{
	if(oldval === newval)
	{
		return;
	}
	self.oldval = newval;
	var_ba3dd99f = 0;
	if(newval >= 8)
	{
		var_ba3dd99f = 1;
		newval = newval - 8;
	}
	b_upgraded = 0;
	if(newval >= 4)
	{
		b_upgraded = 1;
		newval = newval - 4;
	}
	a_e_players = getlocalplayers();
	foreach(e_player in a_e_players)
	{
		if(!e_player util::function_50ed1561(localclientnum))
		{
			e_player notify(#"hash_7508e13e17dd1e3c");
		}
	}
	if(newval == 2)
	{
		if(isdefined(self.var_6cb1af87))
		{
			killfx(localclientnum, self.var_6cb1af87);
			self.var_6cb1af87 = undefined;
		}
		if(isdefined(self.var_88a9ebe4))
		{
			killfx(localclientnum, self.var_88a9ebe4);
			self.var_88a9ebe4 = undefined;
		}
		if(var_efe94974)
		{
			self notify(#"hash_40fa6fe49a4e7333");
		}
	}
	else
	{
		if(newval == 1)
		{
			if(isdefined(self.var_6cb1af87))
			{
				killfx(localclientnum, self.var_6cb1af87);
				self.var_6cb1af87 = undefined;
			}
			if(isdefined(self.var_88a9ebe4))
			{
				killfx(localclientnum, self.var_88a9ebe4);
				self.var_88a9ebe4 = undefined;
			}
			if(self zm_utility::function_f8796df3(localclientnum))
			{
				if(var_ba3dd99f)
				{
					if(viewmodelhastag(localclientnum, "tag_flash_alt"))
					{
						if(b_upgraded)
						{
							self.var_6cb1af87 = playviewmodelfx(localclientnum, #"hash_1724dba4c939ce1f", "tag_flash_alt");
						}
						else
						{
							self.var_6cb1af87 = playviewmodelfx(localclientnum, #"hash_5e6ff48bf93176e6", "tag_flash_alt");
						}
					}
				}
				else if(viewmodelhastag(localclientnum, "tag_muzzle_animate"))
				{
					if(b_upgraded)
					{
						self.var_6cb1af87 = playviewmodelfx(localclientnum, #"hash_cd6b2820b219988", "tag_muzzle_animate");
					}
					else
					{
						self.var_6cb1af87 = playviewmodelfx(localclientnum, #"hash_2eb20c55a2a0a52f", "tag_muzzle_animate");
					}
				}
				if(viewmodelhastag(localclientnum, "tag_fx_core"))
				{
					if(b_upgraded)
					{
						self.var_88a9ebe4 = playviewmodelfx(localclientnum, #"hash_753de791b5ec331c", "tag_fx_core");
					}
					else
					{
						self.var_88a9ebe4 = playviewmodelfx(localclientnum, #"hash_ac1da62ac86630b", "tag_fx_core");
					}
				}
			}
			else
			{
				if(var_ba3dd99f)
				{
					if(isdefined(self gettagorigin("tag_flash_alt")))
					{
						if(b_upgraded)
						{
							self.var_6cb1af87 = util::playfxontag(localclientnum, #"hash_407f223936d34c9d", self, "tag_flash_alt");
						}
						else
						{
							self.var_6cb1af87 = util::playfxontag(localclientnum, #"hash_5e6a088bf92d2d34", self, "tag_flash_alt");
						}
					}
				}
				else if(isdefined(self gettagorigin("tag_muzzle_animate")))
				{
					if(b_upgraded)
					{
						self.var_6cb1af87 = util::playfxontag(localclientnum, #"hash_4a7a1f8b135d7b56", self, "tag_muzzle_animate");
					}
					else
					{
						self.var_6cb1af87 = util::playfxontag(localclientnum, #"hash_2eab2055a29aa87d", self, "tag_muzzle_animate");
					}
				}
				if(isdefined(self gettagorigin("tag_fx_core")))
				{
					if(b_upgraded)
					{
						self.var_88a9ebe4 = util::playfxontag(localclientnum, #"hash_6d8466757fe01e4a", self, "tag_fx_core");
					}
					else
					{
						self.var_88a9ebe4 = util::playfxontag(localclientnum, #"hash_abace62ac802ff9", self, "tag_fx_core");
					}
				}
			}
			self thread function_8175cdcb(localclientnum);
			self thread function_b63cc0c6(localclientnum);
			self thread function_acb526aa(localclientnum);
			a_e_players = getlocalplayers();
			foreach(e_player in a_e_players)
			{
				if(!e_player util::function_50ed1561(localclientnum))
				{
					e_player thread zm_utility::function_ae3780f1(localclientnum, self.var_6cb1af87, #"hash_7508e13e17dd1e3c");
					e_player thread zm_utility::function_ae3780f1(localclientnum, self.var_88a9ebe4, #"hash_7508e13e17dd1e3c");
				}
			}
		}
		else if(newval == 0)
		{
			if(isdefined(self.var_6cb1af87))
			{
				killfx(localclientnum, self.var_6cb1af87);
				self.var_6cb1af87 = undefined;
			}
			if(isdefined(self.var_88a9ebe4))
			{
				killfx(localclientnum, self.var_88a9ebe4);
				self.var_88a9ebe4 = undefined;
			}
			if(var_efe94974)
			{
				self notify(#"hash_40fa6fe49a4e7333");
			}
		}
	}
}

/*
	Name: function_8175cdcb
	Namespace: namespace_a5ef5769
	Checksum: 0xEE1D7D08
	Offset: 0x1388
	Size: 0x16E
	Parameters: 1
	Flags: Linked
*/
function function_8175cdcb(localclientnum)
{
	self endon(#"death", #"hash_40fa6fe49a4e7333");
	var_17b7891d = "5e3d1de3b7ce4390" + "ray_rifle_should_hide_vfx";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		if(!self function_f69ceea9(localclientnum) && !isdefined(self.var_a0d6f528) && !is_true(self.var_c108a678))
		{
			waitframe(1);
			continue;
		}
		var_4695f796 = self.oldval;
		self function_5962609c(localclientnum, self.oldval, 2, 0);
		while(self function_f69ceea9(localclientnum) || isdefined(self.var_a0d6f528) || is_true(self.var_c108a678))
		{
			waitframe(1);
		}
		self function_5962609c(localclientnum, 2, var_4695f796, 0);
		waitframe(1);
	}
}

/*
	Name: function_f69ceea9
	Namespace: namespace_a5ef5769
	Checksum: 0xEFADF927
	Offset: 0x1500
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_f69ceea9(localclientnum)
{
	if(self zm_utility::function_f8796df3(localclientnum))
	{
		return ismeleeing(localclientnum);
	}
	return 0;
}

/*
	Name: function_b63cc0c6
	Namespace: namespace_a5ef5769
	Checksum: 0xF20DA671
	Offset: 0x1550
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function function_b63cc0c6(localclientnum)
{
	self endon(#"death", #"hash_40fa6fe49a4e7333");
	var_17b7891d = "b45b4208f077951" + "ray_rifle_watch_inspect_clip_out_notetrack";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		self waittillmatch({#notetrack:"inspect_clip_out"}, #"notetrack");
		self.var_c108a678 = 1;
	}
}

/*
	Name: function_acb526aa
	Namespace: namespace_a5ef5769
	Checksum: 0xDEC4059C
	Offset: 0x1600
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_acb526aa(localclientnum)
{
	self endon(#"death", #"hash_40fa6fe49a4e7333");
	var_17b7891d = "61acf9b6fb63642b" + "ray_rifle_watch_inspect_done_notetrack";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	while(true)
	{
		self waittillmatch({#notetrack:"inspect_done"}, #"notetrack");
		self.var_c108a678 = 0;
	}
}

