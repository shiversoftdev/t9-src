#using script_383a3b1bb18ba876;
#using script_4e44ad88a2b0f559;
#using scripts\core_common\bots\bot_action.gsc;

#namespace namespace_d9f3dd47;

/*
	Name: function_994c6186
	Namespace: namespace_d9f3dd47
	Checksum: 0xC39853EC
	Offset: 0x1F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_994c6186()
{
	level notify(530105916);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d9f3dd47
	Checksum: 0x50BB43A7
	Offset: 0x218
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	function_ce850bf4();
	function_c50262c4();
	function_ece9035a();
	function_c7dfc94();
	function_1f3281d9();
	function_d4db3361();
	function_a79f6dfb();
}

/*
	Name: function_ce850bf4
	Namespace: namespace_d9f3dd47
	Checksum: 0x2538B615
	Offset: 0x298
	Size: 0x784
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ce850bf4()
{
	bot_action::register_weapon(#"ar_accurate_t9", &function_319dfab4, &function_8147e165);
	bot_action::register_weapon(#"ar_damage_t9", &function_319dfab4, &function_8147e165);
	bot_action::register_weapon(#"ar_fastfire_t9", &function_319dfab4, &function_8147e165);
	bot_action::register_weapon(#"ar_fasthandling_t9", &function_319dfab4, &function_8147e165);
	bot_action::register_weapon(#"ar_mobility_t9", &function_319dfab4, &function_8147e165);
	bot_action::register_weapon(#"hash_578fab7f7b2db478", &function_319dfab4, &function_8147e165);
	bot_action::register_weapon(#"ar_slowhandling_t9", &function_319dfab4, &function_8147e165);
	bot_action::register_weapon(#"ar_standard_t9", &function_319dfab4, &function_8147e165);
	bot_action::register_weapon(#"lmg_accurate_t9", &function_aadbe8c, &function_82ebbce);
	bot_action::register_weapon(#"hash_70cb1c2da27e0190", &function_aadbe8c, &function_82ebbce);
	bot_action::register_weapon(#"lmg_light_t9", &function_aadbe8c, &function_82ebbce);
	bot_action::register_weapon(#"lmg_slowfire_t9", &function_aadbe8c, &function_82ebbce);
	bot_action::register_weapon(#"smg_accurate_t9", &function_b9557a8a, &function_b3992b0);
	bot_action::register_weapon(#"smg_burst_t9", &function_b9557a8a, &function_b3992b0);
	bot_action::register_weapon(#"smg_capacity_t9", &function_b9557a8a, &function_b3992b0);
	bot_action::register_weapon(#"smg_fastfire_t9", &function_b9557a8a, &function_b3992b0);
	bot_action::register_weapon(#"smg_handling_t9", &function_b9557a8a, &function_b3992b0);
	bot_action::register_weapon(#"smg_heavy_t9", &function_b9557a8a, &function_b3992b0);
	bot_action::register_weapon(#"smg_spray_t9", &function_b9557a8a, &function_b3992b0);
	bot_action::register_weapon(#"smg_standard_t9", &function_b9557a8a, &function_b3992b0);
	bot_action::register_weapon(#"sniper_accurate_t9", &function_c75d81ab, &function_d6921803);
	bot_action::register_weapon(#"sniper_cannon_t9", &function_c75d81ab, &function_d6921803);
	bot_action::register_weapon(#"sniper_powersemi_t9", &function_c75d81ab, &function_d6921803);
	bot_action::register_weapon(#"sniper_quickscope_t9", &function_c75d81ab, &function_d6921803);
	bot_action::register_weapon(#"sniper_standard_t9", &function_c75d81ab, &function_d6921803);
	bot_action::register_weapon(#"tr_damagesemi_t9", &function_183e848d, &function_5754d7dc);
	bot_action::register_weapon(#"tr_fastburst_t9", &function_183e848d, &function_5754d7dc);
	bot_action::register_weapon(#"tr_longburst_t9", &function_183e848d, &function_5754d7dc);
	bot_action::register_weapon(#"tr_powerburst_t9", &function_183e848d, &function_5754d7dc);
	bot_action::register_weapon(#"tr_precisionsemi_t9", &function_183e848d, &function_5754d7dc);
}

/*
	Name: function_c50262c4
	Namespace: namespace_d9f3dd47
	Checksum: 0x1E2666D2
	Offset: 0xA28
	Size: 0x31C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c50262c4()
{
	bot_action::register_weapon(#"knife_loadout", &function_97bc2873, &function_5f7cac29);
	bot_action::register_weapon(#"launcher_freefire_t9", &function_3929fa65, &function_acfd770e);
	bot_action::register_weapon(#"launcher_standard_t9", &function_3929fa65, &function_acfd770e);
	bot_action::register_weapon(#"pistol_burst_t9", &function_6aa40bb4, &function_3f4d56d1);
	bot_action::register_weapon(#"pistol_burst_t9" + "_dw", &function_6aa40bb4, &function_3f4d56d1);
	bot_action::register_weapon(#"pistol_revolver_t9", &function_6aa40bb4, &function_3f4d56d1);
	bot_action::register_weapon(#"pistol_revolver_t9" + "_dw", &function_6aa40bb4, &function_3f4d56d1);
	bot_action::register_weapon(#"pistol_semiauto_t9", &function_6aa40bb4, &function_3f4d56d1);
	bot_action::register_weapon(#"pistol_semiauto_t9" + "_dw", &function_6aa40bb4, &function_3f4d56d1);
	bot_action::register_weapon(#"shotgun_fullauto_t9", &function_408f0f07, &function_78135f4c);
	bot_action::register_weapon(#"shotgun_pump_t9", &function_408f0f07, &function_78135f4c);
	bot_action::register_weapon(#"shotgun_semiauto_t9", &function_408f0f07, &function_78135f4c);
}

/*
	Name: function_ece9035a
	Namespace: namespace_d9f3dd47
	Checksum: 0xCA19AB1D
	Offset: 0xD50
	Size: 0x144
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ece9035a()
{
	bot_action::register_weapon(#"eq_molotov", &function_16906804, &function_84092214);
	bot_action::register_weapon(#"eq_sticky_grenade", &function_d3c685b8, &function_84092214);
	bot_action::register_weapon(#"frag_grenade", &function_22630da6, &function_84092214);
	bot_action::register_weapon(#"hatchet", &function_643065f9, &function_84092214);
	bot_action::register_weapon(#"satchel_charge", &function_66e1fe37, &function_84092214);
}

/*
	Name: function_c7dfc94
	Namespace: namespace_d9f3dd47
	Checksum: 0xDE823E19
	Offset: 0xEA0
	Size: 0x144
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c7dfc94()
{
	bot_action::register_weapon(#"eq_flash_grenade", &function_e105d8c8, &function_6bc8e929);
	bot_action::register_weapon(#"eq_slow_grenade", &function_8640f24, &function_6bc8e929);
	bot_action::register_weapon(#"eq_stimshot", &function_bd46948a, &function_6bc8e929);
	bot_action::register_weapon(#"nightingale", &function_66e1fe37, &function_6bc8e929);
	bot_action::register_weapon(#"willy_pete", &function_66e1fe37, &function_6bc8e929);
}

/*
	Name: function_1f3281d9
	Namespace: namespace_d9f3dd47
	Checksum: 0xD3E35387
	Offset: 0xFF0
	Size: 0x204
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1f3281d9()
{
	bot_action::register_weapon(#"ability_smart_cover", &function_66e1fe37, &function_de73a533);
	bot_action::register_weapon(#"gadget_jammer", &function_c329e7cf, &function_de73a533);
	bot_action::register_weapon(#"gadget_supplypod", &function_86ce2c, &function_de73a533);
	bot_action::register_weapon(#"land_mine", &function_66e1fe37, &function_de73a533);
	bot_action::register_weapon(#"listening_device", &function_d6e71e28, &function_de73a533);
	bot_action::register_weapon(#"missile_turret", &function_5c276034, &function_de73a533);
	bot_action::register_weapon(#"tear_gas", &function_126a6787, &function_de73a533);
	bot_action::register_weapon(#"trophy_system", &function_69624ba2, &function_de73a533);
}

/*
	Name: function_d4db3361
	Namespace: namespace_d9f3dd47
	Checksum: 0xF83166BA
	Offset: 0x1200
	Size: 0xBB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d4db3361()
{
	bot_action::register_weapon(#"ac130", &function_66e1fe37, &function_778e2491);
	bot_action::register_weapon(#"inventory_" + "ac130", &function_66e1fe37, &function_778e2491);
	bot_action::register_weapon(#"counteruav", &function_f023f6f9, &counteruav);
	bot_action::register_weapon(#"inventory_" + "counteruav", &function_f023f6f9, &counteruav);
	bot_action::register_weapon(#"chopper_gunner", &function_66e1fe37, &function_10b07ab6);
	bot_action::register_weapon(#"inventory_" + "chopper_gunner", &function_66e1fe37, &function_10b07ab6);
	bot_action::register_weapon(#"helicopter_comlink", &function_5f352eb0, &function_7943cde5);
	bot_action::register_weapon(#"inventory_" + "helicopter_comlink", &function_5f352eb0, &function_7943cde5);
	bot_action::register_weapon(#"helicopter_guard", &function_5f352eb0, &function_7943cde5);
	bot_action::register_weapon(#"inventory_" + "helicopter_guard", &function_5f352eb0, &function_7943cde5);
	bot_action::register_weapon(#"hero_annihilator", &function_43848868, &function_f54e11c8);
	bot_action::register_weapon(#"inventory_" + "hero_annihilator", &function_43848868, &function_f54e11c8);
	bot_action::register_weapon(#"hero_flamethrower", &function_66e1fe37, &function_2bbdd2b4);
	bot_action::register_weapon(#"inventory_" + "hero_flamethrower", &function_66e1fe37, &function_2bbdd2b4);
	bot_action::register_weapon(#"hero_pineapplegun", &function_43395ff9, &function_27ae97ef);
	bot_action::register_weapon(#"inventory_" + "hero_pineapplegun", &function_43395ff9, &function_27ae97ef);
	bot_action::register_weapon(#"hoverjet", &function_66e1fe37, &function_d0cdb00e);
	bot_action::register_weapon(#"inventory_" + "hoverjet", &function_66e1fe37, &function_d0cdb00e);
	bot_action::register_weapon(#"jetfighter", &function_8d7445b8, &function_9839161a);
	bot_action::register_weapon(#"inventory_" + "jetfighter", &function_8d7445b8, &function_9839161a);
	bot_action::register_weapon(#"napalm_strike", &function_f70eb03b, &napalm_strike);
	bot_action::register_weapon(#"inventory_" + "napalm_strike", &function_f70eb03b, &napalm_strike);
	bot_action::register_weapon(#"planemortar", &function_eb23222e, &planemortar);
	bot_action::register_weapon(#"inventory_" + "planemortar", &function_eb23222e, &planemortar);
	bot_action::register_weapon(#"recon_car", &function_66e1fe37, &function_84a16b0);
	bot_action::register_weapon(#"inventory_" + "recon_car", &function_66e1fe37, &function_84a16b0);
	bot_action::register_weapon(#"recon_plane", &function_14ccb855, &function_bdf61e8f);
	bot_action::register_weapon(#"inventory_" + "recon_plane", &function_14ccb855, &function_bdf61e8f);
	bot_action::register_weapon(#"remote_missile", &function_f1fb9968, &remote_missile);
	bot_action::register_weapon(#"inventory_" + "remote_missile", &function_f1fb9968, &remote_missile);
	bot_action::register_weapon(#"sig_bow_flame", &function_184e01c, &function_5d035c24);
	bot_action::register_weapon(#"inventory_" + "sig_bow_flame", &function_184e01c, &function_5d035c24);
	bot_action::register_weapon(#"sig_lmg", &function_fee832f, &function_397a1c0a);
	bot_action::register_weapon(#"inventory_" + "sig_lmg", &function_fee832f, &function_397a1c0a);
	bot_action::register_weapon(#"straferun", &function_25933177, &straferun);
	bot_action::register_weapon(#"inventory_" + "straferun", &function_25933177, &straferun);
	bot_action::register_weapon(#"supplydrop_marker", &function_66e1fe37, &function_69658e9b);
	bot_action::register_weapon(#"inventory_" + "supplydrop_marker", &function_66e1fe37, &function_69658e9b);
	bot_action::register_weapon(#"uav", &function_c5a0aa09, &uav);
	bot_action::register_weapon(#"inventory_" + "uav", &function_c5a0aa09, &uav);
	bot_action::register_weapon(#"ultimate_turret", &function_66e1fe37, &function_12b05f25);
	bot_action::register_weapon(#"inventory_" + "ultimate_turret", &function_66e1fe37, &function_12b05f25);
	bot_action::register_weapon(#"weapon_armor", &function_784440a3, &weapon_armor);
	bot_action::register_weapon(#"inventory_" + "weapon_armor", &function_784440a3, &weapon_armor);
}

/*
	Name: function_a79f6dfb
	Namespace: namespace_d9f3dd47
	Checksum: 0x6C8F29A9
	Offset: 0x1DC0
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a79f6dfb()
{
	if(level.gametype == #"dropkick")
	{
		bot_action::register_weapon(#"hash_29ab150f9f8964f", &function_6aa40bb4, &function_3f4d56d1);
	}
}

/*
	Name: function_66e1fe37
	Namespace: namespace_d9f3dd47
	Checksum: 0xE970A6C7
	Offset: 0x1E30
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private function_66e1fe37(var_b594a2cd)
{
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_52b84380df2c798e";
	#/
	return undefined;
}

/*
	Name: function_319dfab4
	Namespace: namespace_d9f3dd47
	Checksum: 0xB69B92C8
	Offset: 0x1E70
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_319dfab4(var_b594a2cd)
{
	if(!self function_d55b60f8(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 80, 90, 80);
}

/*
	Name: function_8147e165
	Namespace: namespace_d9f3dd47
	Checksum: 0x6CFD006A
	Offset: 0x1F10
	Size: 0x1AE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8147e165(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(!(self.bot.enemydist <= 200) && self botgetlookdot() >= 0.766)
			{
				self bottapbutton(11);
			}
			if(self.bot.var_2cf887f8 && self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)))
			{
				if(self function_d8b388a6())
				{
					self fire_weapon(weapon);
				}
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_aadbe8c
	Namespace: namespace_d9f3dd47
	Checksum: 0x840CEB8
	Offset: 0x20C8
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_aadbe8c(var_b594a2cd)
{
	if(!self function_d55b60f8(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 80, 90, 80);
}

/*
	Name: function_82ebbce
	Namespace: namespace_d9f3dd47
	Checksum: 0x486C0F37
	Offset: 0x2168
	Size: 0x1AE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_82ebbce(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(!(self.bot.enemydist <= 200) && self botgetlookdot() >= 0.766)
			{
				self bottapbutton(11);
			}
			if(self.bot.var_2cf887f8 && self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)))
			{
				if(self function_d8b388a6())
				{
					self fire_weapon(weapon);
				}
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_183e848d
	Namespace: namespace_d9f3dd47
	Checksum: 0xAA0854D3
	Offset: 0x2320
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_183e848d(var_b594a2cd)
{
	if(!self function_d55b60f8(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 80, 80, 80);
}

/*
	Name: function_5754d7dc
	Namespace: namespace_d9f3dd47
	Checksum: 0xB5D5B09E
	Offset: 0x23C0
	Size: 0x196
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5754d7dc(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(self botgetlookdot() >= 0.766)
			{
				self bottapbutton(11);
			}
			if(self.bot.var_2cf887f8 && self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)))
			{
				if(self function_d8b388a6())
				{
					self fire_weapon(weapon);
				}
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_c75d81ab
	Namespace: namespace_d9f3dd47
	Checksum: 0xAFE185E4
	Offset: 0x2560
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c75d81ab(var_b594a2cd)
{
	if(!self function_d55b60f8(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 60, 80, 90);
}

/*
	Name: function_d6921803
	Namespace: namespace_d9f3dd47
	Checksum: 0x51DDE667
	Offset: 0x2600
	Size: 0x1B6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d6921803(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(self botgetlookdot() >= 0.766)
			{
				self bottapbutton(11);
			}
			if(self.bot.var_2cf887f8 && self playerads() >= 1 && self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)))
			{
				if(self function_d8b388a6())
				{
					self fire_weapon(weapon);
				}
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_b9557a8a
	Namespace: namespace_d9f3dd47
	Checksum: 0xCC5DFEC0
	Offset: 0x27C0
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b9557a8a(var_b594a2cd)
{
	if(!self function_d55b60f8(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 80, 70, 60);
}

/*
	Name: function_b3992b0
	Namespace: namespace_d9f3dd47
	Checksum: 0xB12C9EC0
	Offset: 0x2860
	Size: 0x1AE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b3992b0(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(!(self.bot.enemydist <= 200) && self botgetlookdot() >= 0.766)
			{
				self bottapbutton(11);
			}
			if(self.bot.var_2cf887f8 && self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)))
			{
				if(self function_d8b388a6())
				{
					self fire_weapon(weapon);
				}
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_6aa40bb4
	Namespace: namespace_d9f3dd47
	Checksum: 0x9CD359A
	Offset: 0x2A18
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6aa40bb4(var_b594a2cd)
{
	if(!self function_d55b60f8(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 70, 70, 70);
}

/*
	Name: function_3f4d56d1
	Namespace: namespace_d9f3dd47
	Checksum: 0xDE386B8E
	Offset: 0x2AB8
	Size: 0x1AE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3f4d56d1(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(!(self.bot.enemydist <= 200) && self botgetlookdot() >= 0.766)
			{
				self bottapbutton(11);
			}
			if(self.bot.var_2cf887f8 && self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)))
			{
				if(self function_d8b388a6())
				{
					self fire_weapon(weapon);
				}
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_408f0f07
	Namespace: namespace_d9f3dd47
	Checksum: 0x7D4892C7
	Offset: 0x2C70
	Size: 0x102
	Parameters: 1
	Flags: Linked, Private
*/
function private function_408f0f07(var_b594a2cd)
{
	if(!self function_d55b60f8(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	weapon = var_b594a2cd.weapon;
	damage = self function_6b54ab21(weapon);
	if(damage <= 0)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_6100adb01aed83f8";
		#/
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 90, 70, 60);
}

/*
	Name: function_78135f4c
	Namespace: namespace_d9f3dd47
	Checksum: 0xE67A398C
	Offset: 0x2D80
	Size: 0x1AE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_78135f4c(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(!(self.bot.enemydist <= 200) && self botgetlookdot() >= 0.766)
			{
				self bottapbutton(11);
			}
			if(self.bot.var_2cf887f8 && self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)))
			{
				if(self function_d8b388a6())
				{
					self fire_weapon(weapon);
				}
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_3929fa65
	Namespace: namespace_d9f3dd47
	Checksum: 0x827D2881
	Offset: 0x2F38
	Size: 0x1F4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3929fa65(var_b594a2cd)
{
	if(!self function_d55b60f8(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	weapon = var_b594a2cd.weapon;
	target = self.enemy;
	if(isplayer(self.enemy) && self.enemy isinvehicle() && !self.enemy isremotecontrolling())
	{
		target = self.enemy getvehicleoccupied();
	}
	if(weapon.lockontype == #"hash_a6a8bcce6c1a902")
	{
		if(target_istarget(target))
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_1c1fadf51fa38d5f";
			#/
			return 91;
		}
	}
	if(isvehicle(target))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_2ca9c8c378ef1b03";
		#/
		return self function_4b1db2f8(var_b594a2cd, 80, 90, 90);
	}
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_18db4acb1408239d";
	#/
	return 60;
}

/*
	Name: function_acfd770e
	Namespace: namespace_d9f3dd47
	Checksum: 0xA92C4671
	Offset: 0x3138
	Size: 0x366
	Parameters: 1
	Flags: Linked, Private
*/
function private function_acfd770e(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	var_677906a4 = weapon.explosionradius * 0.6;
	lockedflag = 1 << self getentitynumber();
	self function_185a3c39(weapon);
	while(true)
	{
		target = self.enemy;
		if(isplayer(self.enemy) && self.enemy isinvehicle() && !self.enemy isremotecontrolling())
		{
			target = self.enemy getvehicleoccupied();
		}
		lockon = target_istarget(target) && weapon.lockontype != #"none";
		self function_bbef6e21();
		if(lockon)
		{
			self.bot.var_32d8dabe = undefined;
		}
		else
		{
			self function_411e397e();
		}
		if(self.bot.var_9931c7dc && self botgetlookdot() >= 0.766)
		{
			self bottapbutton(11);
			if(self.bot.var_2cf887f8 && self playerads() >= 1 && self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)) && !self isfiring())
			{
				if(lockon)
				{
					if(isdefined(self.stingertarget) && isdefined(self.stingertarget.locked_on) && self.stingertarget.locked_on & lockedflag)
					{
						self bottapbutton(0);
					}
				}
				else if(!self.bot.enemydist <= var_677906a4)
				{
					if(self function_d8b388a6())
					{
						self fire_weapon(weapon);
					}
				}
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_97bc2873
	Namespace: namespace_d9f3dd47
	Checksum: 0x2DE881A6
	Offset: 0x34A8
	Size: 0x68
	Parameters: 1
	Flags: Linked, Private
*/
function private function_97bc2873(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	return 50;
}

/*
	Name: function_5f7cac29
	Namespace: namespace_d9f3dd47
	Checksum: 0xD8220317
	Offset: 0x3518
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5f7cac29(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
}

/*
	Name: function_e105d8c8
	Namespace: namespace_d9f3dd47
	Checksum: 0x9E70024C
	Offset: 0x3590
	Size: 0x1D2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e105d8c8(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	if(self function_64f2e29(var_b594a2cd) || self function_a469c9cd(var_b594a2cd))
	{
		return undefined;
	}
	if(self.bot.enemydist <= 600)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_71800c4878bd026d";
		#/
		return undefined;
	}
	if(self.bot.var_2cf887f8)
	{
		if(!self function_754cc239(var_b594a2cd))
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_7ff8e322102305fd";
			#/
			return undefined;
		}
		var_b594a2cd.aimpoint = self.enemy.origin;
	}
	else
	{
		var_b594a2cd.aimpoint = self.enemylastseenpos;
	}
	if(!isdefined(var_b594a2cd.aimpoint))
	{
		var_b594a2cd.aimpoint = self.enemylastseenpos;
	}
	if(!self function_4e17fb37(var_b594a2cd, 40) || !self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_16906804
	Namespace: namespace_d9f3dd47
	Checksum: 0xED8B30C3
	Offset: 0x3770
	Size: 0x1E2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_16906804(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	if(self function_64f2e29(var_b594a2cd) || self function_a469c9cd(var_b594a2cd))
	{
		return undefined;
	}
	weapon = var_b594a2cd.weapon;
	if(self.bot.enemydist <= (weapon.explosionradius * 1.2))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_71800c4878bd026d";
		#/
		return undefined;
	}
	if(self.bot.var_2cf887f8)
	{
		if(!self function_754cc239(var_b594a2cd))
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_7ff8e322102305fd";
			#/
			return undefined;
		}
		var_b594a2cd.aimpoint = self.enemy.origin;
	}
	else
	{
		var_b594a2cd.aimpoint = self.enemylastseenpos;
	}
	if(!self function_4e17fb37(var_b594a2cd, 40) || !self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_8640f24
	Namespace: namespace_d9f3dd47
	Checksum: 0x8DA751C2
	Offset: 0x3960
	Size: 0x1BA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8640f24(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	if(self function_64f2e29(var_b594a2cd) || self function_a469c9cd(var_b594a2cd))
	{
		return undefined;
	}
	if(self.bot.enemydist <= 600)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_71800c4878bd026d";
		#/
		return undefined;
	}
	if(self.bot.var_2cf887f8)
	{
		if(!self function_754cc239(var_b594a2cd))
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_7ff8e322102305fd";
			#/
			return undefined;
		}
		var_b594a2cd.aimpoint = self.enemy.origin;
	}
	else
	{
		var_b594a2cd.aimpoint = self.enemylastseenpos;
	}
	if(!self function_4e17fb37(var_b594a2cd, 40) || !self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_d3c685b8
	Namespace: namespace_d9f3dd47
	Checksum: 0xFBB8A086
	Offset: 0x3B28
	Size: 0x1BA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d3c685b8(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	if(self function_a469c9cd(var_b594a2cd))
	{
		return undefined;
	}
	weapon = var_b594a2cd.weapon;
	if(self.bot.enemydist <= (weapon.explosionradius * 0.6))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_71800c4878bd026d";
		#/
		return undefined;
	}
	if(self.bot.var_2cf887f8)
	{
		if(!self function_754cc239(var_b594a2cd))
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_7ff8e322102305fd";
			#/
			return undefined;
		}
		var_b594a2cd.aimpoint = undefined;
	}
	else
	{
		var_b594a2cd.aimpoint = self.enemylastseenpos;
	}
	if(!self function_4e17fb37(var_b594a2cd, 40) || !self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_bd46948a
	Namespace: namespace_d9f3dd47
	Checksum: 0x69EE3285
	Offset: 0x3CF0
	Size: 0x196
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bd46948a(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	healthratio = self.health / self.maxhealth;
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = ((((#"hash_c90c30ea9fcad9d" + self.health) + "") + self.maxhealth) + "") + string(healthratio);
	#/
	if(is_true(self.heal.enabled))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_79840b33c01531d9";
		#/
		return undefined;
	}
	if(healthratio > 0.7)
	{
		return undefined;
	}
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_203858dc9db13ce9";
	#/
	if(self.bot.var_2cf887f8)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_7ff8e322102305fd";
		#/
		return undefined;
	}
	if(!self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: eq_stimshot
	Namespace: namespace_d9f3dd47
	Checksum: 0x513B0C02
	Offset: 0x3E90
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private eq_stimshot(var_b594a2cd)
{
	self.bot.var_e636e51e = gettime() + (int(5 * 1000));
	self bottapbutton(15);
}

/*
	Name: function_22630da6
	Namespace: namespace_d9f3dd47
	Checksum: 0xE986AE54
	Offset: 0x3EF0
	Size: 0x1AA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_22630da6(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	if(self function_64f2e29(var_b594a2cd) || self function_a469c9cd(var_b594a2cd))
	{
		return undefined;
	}
	if(self.bot.var_2cf887f8)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_7ff8e322102305fd";
		#/
		return undefined;
	}
	weapon = var_b594a2cd.weapon;
	if(self.bot.enemydist <= (weapon.explosionradius * 0.6))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_71800c4878bd026d";
		#/
		return undefined;
	}
	var_b594a2cd.aimpoint = self.enemylastseenpos;
	if(!self function_4e17fb37(var_b594a2cd, 40) || !self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_643065f9
	Namespace: namespace_d9f3dd47
	Checksum: 0x834CDE4E
	Offset: 0x40A8
	Size: 0x152
	Parameters: 1
	Flags: Linked, Private
*/
function private function_643065f9(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_2cf887f8)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_53aa4f678b9a027c";
		#/
		return undefined;
	}
	if(self function_64f2e29(var_b594a2cd) || self function_a469c9cd(var_b594a2cd))
	{
		return undefined;
	}
	if(self.bot.enemydist <= 200)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_71800c4878bd026d";
		#/
		return undefined;
	}
	if(!self function_754cc239(var_b594a2cd))
	{
		return undefined;
	}
	if(!self function_4e17fb37(var_b594a2cd, 20) || !self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_778e2491
	Namespace: namespace_d9f3dd47
	Checksum: 0x5FDC27A
	Offset: 0x4208
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_778e2491(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
}

/*
	Name: function_f023f6f9
	Namespace: namespace_d9f3dd47
	Checksum: 0xE9EC4E78
	Offset: 0x4280
	Size: 0xD6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f023f6f9(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd) || self bot_action::in_combat(var_b594a2cd))
	{
		return undefined;
	}
	if(isdefined(level.activecounteruavs) && isdefined(level.activecounteruavs[self.team]) && level.activecounteruavs[self.team] > 0)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_2edecc464042406a";
		#/
		return undefined;
	}
	if(!self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return 99;
}

/*
	Name: counteruav
	Namespace: namespace_d9f3dd47
	Checksum: 0x7542B5F9
	Offset: 0x4360
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private counteruav(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	self function_c1515256(weapon);
}

/*
	Name: function_10b07ab6
	Namespace: namespace_d9f3dd47
	Checksum: 0xD98DABC3
	Offset: 0x43A8
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_10b07ab6(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
}

/*
	Name: function_5f352eb0
	Namespace: namespace_d9f3dd47
	Checksum: 0xD4FFDC37
	Offset: 0x4420
	Size: 0x62
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5f352eb0(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd) || self bot_action::in_combat(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return 99;
}

/*
	Name: function_7943cde5
	Namespace: namespace_d9f3dd47
	Checksum: 0xCB62ABF5
	Offset: 0x4490
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7943cde5(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	self function_c1515256(weapon);
}

/*
	Name: function_43848868
	Namespace: namespace_d9f3dd47
	Checksum: 0x7F7D2643
	Offset: 0x44D8
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43848868(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 90, 80, 70) + 1;
}

/*
	Name: function_f54e11c8
	Namespace: namespace_d9f3dd47
	Checksum: 0xF50290D2
	Offset: 0x4550
	Size: 0x1CE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f54e11c8(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_6b01cd20();
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(self botgetlookdot() >= 0.766)
			{
				self bottapbutton(11);
			}
			if(self.bot.var_2cf887f8 && self playerads() >= 1 && self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)) && self function_d8b388a6())
			{
				self fire_weapon(weapon);
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_2bbdd2b4
	Namespace: namespace_d9f3dd47
	Checksum: 0x109DE645
	Offset: 0x4728
	Size: 0xEE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2bbdd2b4(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		if(self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)))
		{
			self fire_weapon(weapon);
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_43395ff9
	Namespace: namespace_d9f3dd47
	Checksum: 0x9F3CE98E
	Offset: 0x4820
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43395ff9(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 90, 90, 80) + 1;
}

/*
	Name: function_27ae97ef
	Namespace: namespace_d9f3dd47
	Checksum: 0x220558B6
	Offset: 0x4898
	Size: 0x276
	Parameters: 1
	Flags: Linked, Private
*/
function private function_27ae97ef(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	var_677906a4 = weapon.explosionradius * 0.6;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_6b01cd20();
		self.bot.var_f50fa466 = weapon;
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(!(self.bot.enemydist <= 200) && self botgetlookdot() >= 0.766)
			{
				self bottapbutton(11);
			}
			if(!(self.bot.enemydist <= var_677906a4) && self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)) && self function_d8b388a6())
			{
				trace = self function_6e8a2d86(weapon, self getplayerangles());
				if(function_e63ee3e8(trace, self.bot.enemydist - 40))
				{
					self fire_weapon(weapon);
				}
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_d0cdb00e
	Namespace: namespace_d9f3dd47
	Checksum: 0xAFE81D43
	Offset: 0x4B18
	Size: 0x2C6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d0cdb00e(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(!self function_a39f313c())
	{
		self waittill(#"hash_77f2882ff9140e86");
	}
	enemies = function_f6f34851(self.team);
	var_4e2b3e3a = [];
	foreach(enemy in enemies)
	{
		tpoint = function_ad6356f5(enemy.origin);
		if(!isdefined(tpoint) || !isdefined(tpoint.var_eadc2c7d) || tpoint.var_eadc2c7d < 65534)
		{
			continue;
		}
		var_4e2b3e3a[var_4e2b3e3a.size] = tpoint.origin;
	}
	if(var_4e2b3e3a.size <= 0)
	{
		var_4e2b3e3a[0] = (0, 0, 0);
	}
	location = var_4e2b3e3a[randomint(var_4e2b3e3a.size)];
	location = location + (randomfloatrange(500 * -1, 500), randomfloatrange(500 * -1, 500), 0);
	self notify(#"confirm_location", {#yaw:0, #position:location});
	while(!self function_a39f313c() || self getcurrentweapon() == level.weaponnone)
	{
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_8d7445b8
	Namespace: namespace_d9f3dd47
	Checksum: 0x2EB9F363
	Offset: 0x4DE8
	Size: 0x28E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8d7445b8(var_b594a2cd)
{
	if(!isarray(level.var_500867a0))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_511cde69ac409b1b";
		#/
		return undefined;
	}
	if(!self function_303bbccf(var_b594a2cd) || self bot_action::in_combat(var_b594a2cd))
	{
		return undefined;
	}
	var_cde710d9 = 0;
	time = gettime();
	foreach(streaks in level.var_500867a0)
	{
		if(!isarray(streaks))
		{
			continue;
		}
		foreach(streak in streaks)
		{
			if(!isdefined(streak) || self.team == streak.team)
			{
				continue;
			}
			if(!isdefined(streak.killstreakendtime) || !isdefined(streak.birthtime) || (time - streak.birthtime) < 1500 || (streak.killstreakendtime - time) < 3000)
			{
				continue;
			}
			var_cde710d9 = 1;
			break;
		}
	}
	if(!var_cde710d9)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_66f0e93a3c9b4252";
		#/
		return undefined;
	}
	if(!self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return 99;
}

/*
	Name: function_9839161a
	Namespace: namespace_d9f3dd47
	Checksum: 0x9ABFFF62
	Offset: 0x5080
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9839161a(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	self function_c1515256(weapon);
}

/*
	Name: function_f70eb03b
	Namespace: namespace_d9f3dd47
	Checksum: 0x67697002
	Offset: 0x50C8
	Size: 0xBA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f70eb03b(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	if(self getcurrentweapon() == weapon)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_351eb9fe2e4cbe5d";
		#/
		return 100;
	}
	if(!self function_303bbccf(var_b594a2cd) || self bot_action::in_combat(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return 99;
}

/*
	Name: napalm_strike
	Namespace: namespace_d9f3dd47
	Checksum: 0x52C9905E
	Offset: 0x5190
	Size: 0x1BE
	Parameters: 1
	Flags: Linked, Private
*/
function private napalm_strike(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	self.bot.var_6bea1d82 = 1;
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(!self function_a39f313c())
	{
		self waittill(#"hash_77f2882ff9140e86");
	}
	wait(0.9);
	target = undefined;
	enemies = self function_67ca228b();
	if(enemies.size > 0)
	{
		target = enemies[randomint(enemies.size)].origin + (randomfloatrange(-250, 250), randomfloatrange(-250, 250), 0);
	}
	else
	{
		target = self function_d19a634f();
	}
	self notify(#"confirm_location", {#yaw:randomint(360), #position:target});
}

/*
	Name: function_eb23222e
	Namespace: namespace_d9f3dd47
	Checksum: 0x44E37A18
	Offset: 0x5358
	Size: 0xBA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_eb23222e(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	if(self getcurrentweapon() == weapon)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_351eb9fe2e4cbe5d";
		#/
		return 100;
	}
	if(!self function_303bbccf(var_b594a2cd) || self bot_action::in_combat(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return 99;
}

/*
	Name: planemortar
	Namespace: namespace_d9f3dd47
	Checksum: 0x1B5CA203
	Offset: 0x5420
	Size: 0x1F0
	Parameters: 1
	Flags: Linked, Private
*/
function private planemortar(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	self.bot.var_6bea1d82 = 1;
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(!self function_a39f313c())
	{
		self waittill(#"hash_77f2882ff9140e86");
	}
	wait(0.9);
	target = undefined;
	enemies = self function_67ca228b();
	if(enemies.size > 0)
	{
		target = enemies[randomint(enemies.size)].origin;
	}
	else
	{
		target = self function_d19a634f();
	}
	for(i = 0; i < 3; i++)
	{
		position = target + (randomfloatrange(-250, 250), randomfloatrange(-250, 250), 0);
		self notify(#"confirm_location", {#yaw:0, #position:position});
		wait(0.5);
	}
}

/*
	Name: function_84a16b0
	Namespace: namespace_d9f3dd47
	Checksum: 0x3622CB22
	Offset: 0x5618
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_84a16b0(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
}

/*
	Name: function_14ccb855
	Namespace: namespace_d9f3dd47
	Checksum: 0xC8BA8A97
	Offset: 0x5690
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_14ccb855(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd) || self bot_action::in_combat(var_b594a2cd) || self function_f338aefb(var_b594a2cd) || self function_82350d4c(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return 99;
}

/*
	Name: function_bdf61e8f
	Namespace: namespace_d9f3dd47
	Checksum: 0xB3294A94
	Offset: 0x5730
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bdf61e8f(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	self function_c1515256(weapon);
}

/*
	Name: function_f1fb9968
	Namespace: namespace_d9f3dd47
	Checksum: 0x79F14795
	Offset: 0x5778
	Size: 0xBA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f1fb9968(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	if(self getcurrentweapon() == weapon)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_53eccddbe5a99045";
		#/
		return 100;
	}
	if(!self function_303bbccf(var_b594a2cd) || self bot_action::in_combat(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return 99;
}

/*
	Name: remote_missile
	Namespace: namespace_d9f3dd47
	Checksum: 0xDE1AAB4C
	Offset: 0x5840
	Size: 0x2B6
	Parameters: 1
	Flags: Linked, Private
*/
function private remote_missile(var_b594a2cd)
{
	self endoncallback(&function_17d6fe21, #"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	self.bot.var_6bea1d82 = 1;
	weapon = var_b594a2cd.weapon;
	function_185a3c39(weapon);
	while(!isdefined(self.rocket))
	{
		self waittill(#"hash_77f2882ff9140e86");
	}
	target = undefined;
	while(isdefined(self.rocket) && self.rocket.targetname == #"remote_missile")
	{
		if(!isdefined(target) || !isalive(target))
		{
			targets = [];
			players = function_f6f34851(self.team);
			foreach(player in players)
			{
				if(player hasperk(#"specialty_nokillstreakreticle") || is_true(player.ignoreme) || !bullettracepassed(player.origin + vectorscale((0, 0, 1), 60), player.origin + vectorscale((0, 0, 1), 1000), 0, player))
				{
					continue;
				}
				targets[targets.size] = player;
			}
			if(targets.size > 0)
			{
				target = targets[randomint(targets.size)];
			}
			else
			{
				target = undefined;
			}
			self.rocket missile_settarget(target);
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_17d6fe21
	Namespace: namespace_d9f3dd47
	Checksum: 0x30727B83
	Offset: 0x5B00
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_17d6fe21(notifyhash)
{
	if(isdefined(self.rocket) && self.rocket.targetname == #"remote_missile")
	{
		self.rocket missile_settarget(undefined);
	}
}

/*
	Name: function_184e01c
	Namespace: namespace_d9f3dd47
	Checksum: 0xAF23F72F
	Offset: 0x5B60
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_184e01c(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 90, 90, 80) + 1;
}

/*
	Name: function_5d035c24
	Namespace: namespace_d9f3dd47
	Checksum: 0xB772B694
	Offset: 0x5BD8
	Size: 0x2E6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5d035c24(var_b594a2cd)
{
	self endoncallback(&function_5e217f4d, #"hash_1ae115949cd752c8");
	self endon(#"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_6b01cd20();
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(!(self.bot.enemydist <= 200) && self botgetlookdot() >= 0.766)
			{
				self bottapbutton(11);
			}
			if(self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500)))
			{
				if(self function_a39f313c())
				{
					if(!self attackbuttonpressed())
					{
						self.bot.var_519dbc7d = gettime() + (int(0.25 * 1000));
					}
					self bottapbutton(0);
				}
				if(self.bot.var_2cf887f8 && self attackbuttonpressed() && (!isdefined(self.bot.var_519dbc7d) || self.bot.var_519dbc7d <= gettime()) && self function_d8b388a6())
				{
					self botreleasebutton(0);
				}
			}
			else if(self attackbuttonpressed())
			{
				self.bot.var_519dbc7d = undefined;
				self bottapbutton(49);
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_5e217f4d
	Namespace: namespace_d9f3dd47
	Checksum: 0x67CD642
	Offset: 0x5EC8
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5e217f4d(notifyhash)
{
	self.bot.var_519dbc7d = undefined;
	if(self attackbuttonpressed())
	{
		self bottapbutton(49);
	}
}

/*
	Name: function_fee832f
	Namespace: namespace_d9f3dd47
	Checksum: 0xB3E573E8
	Offset: 0x5F18
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fee832f(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return self function_4b1db2f8(var_b594a2cd, 80, 90, 80) + 1;
}

/*
	Name: function_397a1c0a
	Namespace: namespace_d9f3dd47
	Checksum: 0xF2DE186C
	Offset: 0x5F90
	Size: 0x19E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_397a1c0a(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(true)
	{
		self function_6b01cd20();
		self function_bbef6e21();
		self function_411e397e();
		if(self.bot.var_9931c7dc)
		{
			if(!(self.bot.enemydist <= 200) && self botgetlookdot() >= 0.866)
			{
				self bottapbutton(11);
			}
			if(self.bot.var_2cf887f8 && self botgetlookdot() >= 0.965)
			{
				self fire_weapon(weapon);
			}
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_25933177
	Namespace: namespace_d9f3dd47
	Checksum: 0x5156272B
	Offset: 0x6138
	Size: 0xBA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_25933177(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	if(self getcurrentweapon() == weapon)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_351eb9fe2e4cbe5d";
		#/
		return 100;
	}
	if(!self function_303bbccf(var_b594a2cd) || self bot_action::in_combat(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return 99;
}

/*
	Name: straferun
	Namespace: namespace_d9f3dd47
	Checksum: 0x31B74698
	Offset: 0x6200
	Size: 0x1BE
	Parameters: 1
	Flags: Linked, Private
*/
function private straferun(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	self.bot.var_6bea1d82 = 1;
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	while(!self function_a39f313c())
	{
		self waittill(#"hash_77f2882ff9140e86");
	}
	wait(0.9);
	target = undefined;
	enemies = self function_67ca228b();
	if(enemies.size > 0)
	{
		target = enemies[randomint(enemies.size)].origin + (randomfloatrange(-250, 250), randomfloatrange(-250, 250), 0);
	}
	else
	{
		target = self function_d19a634f();
	}
	self notify(#"confirm_location", {#yaw:randomint(360), #position:target});
}

/*
	Name: function_69658e9b
	Namespace: namespace_d9f3dd47
	Checksum: 0x1770A932
	Offset: 0x63C8
	Size: 0x18E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_69658e9b(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	point = (isdefined(var_b594a2cd.point) ? var_b594a2cd.point : self function_1c8f36a4());
	while(true)
	{
		self botsetlookpoint(point);
		self bottapbutton(0);
		if(self function_a39f313c() && self botgetlookdot() > 0.99)
		{
			break;
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
	self waittill(#"hash_77f2882ff9140e86");
	while(self isfiring())
	{
		self botsetlookpoint(point);
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_1c8f36a4
	Namespace: namespace_d9f3dd47
	Checksum: 0x6BA440A1
	Offset: 0x6560
	Size: 0x42
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1c8f36a4()
{
	fwd = anglestoforward(self.angles);
	return self.origin + (fwd * 200);
}

/*
	Name: function_c5a0aa09
	Namespace: namespace_d9f3dd47
	Checksum: 0x92EEEDF7
	Offset: 0x65B0
	Size: 0x92
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c5a0aa09(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd) || self bot_action::in_combat(var_b594a2cd) || self function_f338aefb(var_b594a2cd) || self function_82350d4c(var_b594a2cd) || !self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return 99;
}

/*
	Name: uav
	Namespace: namespace_d9f3dd47
	Checksum: 0x7DBE30D1
	Offset: 0x6650
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private uav(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	self function_c1515256(weapon);
}

/*
	Name: function_12b05f25
	Namespace: namespace_d9f3dd47
	Checksum: 0x174DEA1E
	Offset: 0x6698
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_12b05f25(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	self bottapbutton(0);
}

/*
	Name: function_784440a3
	Namespace: namespace_d9f3dd47
	Checksum: 0x9A3966CF
	Offset: 0x6728
	Size: 0xEE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_784440a3(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	if(self getcurrentweapon() == weapon)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_53eccddbe5a99045";
		#/
		return 100;
	}
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(self.combatstate != #"hash_25a4754a6175a242")
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_5ff27b6b0a6d2c08";
		#/
		return undefined;
	}
	if(!self function_808ca6bb(var_b594a2cd))
	{
		return undefined;
	}
	return 99;
}

/*
	Name: weapon_armor
	Namespace: namespace_d9f3dd47
	Checksum: 0x2A371812
	Offset: 0x6820
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private weapon_armor(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	weapon = var_b594a2cd.weapon;
	self function_185a3c39(weapon);
	self bottapbutton(0);
}

/*
	Name: function_c329e7cf
	Namespace: namespace_d9f3dd47
	Checksum: 0xE868F970
	Offset: 0x68B0
	Size: 0x216
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c329e7cf(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(self.bot.order !== #"capture" && self.bot.order !== #"defend")
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_6ef3b55c5d05427a";
		#/
		return undefined;
	}
	if(self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_b0e78729bd8dfce";
		#/
		return undefined;
	}
	ents = getentitiesinradius(self.origin, 1000, 4);
	weapon = var_b594a2cd.weapon;
	foreach(ent in ents)
	{
		if(ent.team == self.team && ent.item == weapon)
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_4ba65c4749a07103" + function_a16a090d(weapon);
			#/
			return undefined;
		}
	}
	if(!self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_86ce2c
	Namespace: namespace_d9f3dd47
	Checksum: 0xD545F468
	Offset: 0x6AD0
	Size: 0x102
	Parameters: 1
	Flags: Linked, Private
*/
function private function_86ce2c(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	var_4bfc0588 = self function_e8e1d88e();
	if(var_4bfc0588 > 0)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_51e16bdecd933178" + var_4bfc0588;
		#/
		return undefined;
	}
	if(isdefined(self.bot.var_538135ed))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_1dff7a8b83fc563c";
		#/
		return undefined;
	}
	if(self bot_action::in_combat(var_b594a2cd) || !self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_d6e71e28
	Namespace: namespace_d9f3dd47
	Checksum: 0xD36F88EE
	Offset: 0x6BE0
	Size: 0x216
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d6e71e28(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(self.bot.order !== #"capture" && self.bot.order !== #"defend")
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_6ef3b55c5d05427a";
		#/
		return undefined;
	}
	if(self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_b0e78729bd8dfce";
		#/
		return undefined;
	}
	ents = getentitiesinradius(self.origin, 1000, 4);
	weapon = var_b594a2cd.weapon;
	foreach(ent in ents)
	{
		if(ent.team == self.team && ent.item == weapon)
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_4ba65c4749a07103" + function_a16a090d(weapon);
			#/
			return undefined;
		}
	}
	if(!self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_5c276034
	Namespace: namespace_d9f3dd47
	Checksum: 0x6774087B
	Offset: 0x6E00
	Size: 0x18A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5c276034(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(!self.bot.var_2cf887f8 && !self function_6faf985b())
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	target = self.enemy;
	if(isplayer(self.enemy) && self.enemy isinvehicle() && !self.enemy isremotecontrolling())
	{
		target = self.enemy getvehicleoccupied();
	}
	if(!target_istarget(target))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_bdb94cf566c2704";
		#/
		return undefined;
	}
	if(self function_82350d4c(var_b594a2cd) || !self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_6faf985b
	Namespace: namespace_d9f3dd47
	Checksum: 0x4858E895
	Offset: 0x6F98
	Size: 0x112
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6faf985b()
{
	if(!isdefined(self.enemy) || !isdefined(self.enemy.targetname) || is_true(self.enemy.leaving))
	{
		return 0;
	}
	if(self.enemy.targetname != "uav" && self.enemy.targetname != "counteruav" && self.enemy.targetname != "chopper_gunner" && self.enemy.targetname != "ac130" && self.enemy.targetname != "hoverjet")
	{
		return 0;
	}
	return self cansee(self.enemy, 250);
}

/*
	Name: function_126a6787
	Namespace: namespace_d9f3dd47
	Checksum: 0xA0E73057
	Offset: 0x70B8
	Size: 0x216
	Parameters: 1
	Flags: Linked, Private
*/
function private function_126a6787(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(self.bot.order !== #"capture" && self.bot.order !== #"defend")
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_6ef3b55c5d05427a";
		#/
		return undefined;
	}
	if(self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_b0e78729bd8dfce";
		#/
		return undefined;
	}
	ents = getentitiesinradius(self.origin, 1000, 4);
	weapon = var_b594a2cd.weapon;
	foreach(ent in ents)
	{
		if(ent.team == self.team && ent.item == weapon)
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_4ba65c4749a07103" + function_a16a090d(weapon);
			#/
			return undefined;
		}
	}
	if(!self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_69624ba2
	Namespace: namespace_d9f3dd47
	Checksum: 0xAEE3ECA8
	Offset: 0x72D8
	Size: 0x216
	Parameters: 1
	Flags: Linked, Private
*/
function private function_69624ba2(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd))
	{
		return undefined;
	}
	if(self.bot.order !== #"capture" && self.bot.order !== #"defend")
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_6ef3b55c5d05427a";
		#/
		return undefined;
	}
	if(self.bot.var_e8c84f98)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_b0e78729bd8dfce";
		#/
		return undefined;
	}
	ents = getentitiesinradius(self.origin, 1000, 4);
	weapon = var_b594a2cd.weapon;
	foreach(ent in ents)
	{
		if(ent.team == self.team && ent.item == weapon)
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_4ba65c4749a07103" + function_a16a090d(weapon);
			#/
			return undefined;
		}
	}
	if(!self function_98a9dad4(var_b594a2cd))
	{
		return undefined;
	}
	return 94;
}

/*
	Name: function_303bbccf
	Namespace: namespace_d9f3dd47
	Checksum: 0xEE736A6C
	Offset: 0x74F8
	Size: 0x110
	Parameters: 1
	Flags: Linked, Private
*/
function private function_303bbccf(var_b594a2cd)
{
	weapon = var_b594a2cd.weapon;
	clipammo = self getweaponammoclip(weapon);
	if(weapon.iscliponly)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = ((#"hash_649eec90cdc06cdd" + clipammo) + "") + weapon.clipsize;
		#/
	}
	else
	{
		stockammo = self getweaponammostock(weapon);
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = ((((#"hash_649eec90cdc06cdd" + clipammo) + "") + weapon.clipsize) + "") + stockammo;
		#/
	}
	return clipammo > 0;
}

/*
	Name: function_d55b60f8
	Namespace: namespace_d9f3dd47
	Checksum: 0x1F71DB94
	Offset: 0x7610
	Size: 0x108
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d55b60f8(var_b594a2cd)
{
	if(!self function_303bbccf(var_b594a2cd) || self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd))
	{
		return false;
	}
	if(!self weaponcyclingenabled())
	{
		weapon = var_b594a2cd.weapon;
		if(weapon != self getcurrentweapon())
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_4655fb464b842dfc";
			#/
			return false;
		}
	}
	return true;
}

/*
	Name: function_98a9dad4
	Namespace: namespace_d9f3dd47
	Checksum: 0xF4D284F0
	Offset: 0x7720
	Size: 0x178
	Parameters: 1
	Flags: Linked, Private
*/
function private function_98a9dad4(var_b594a2cd)
{
	if(!(!isdefined(self.bot.var_e636e51e) || self.bot.var_e636e51e <= gettime()))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_499c1441b9e70c21";
		#/
		return false;
	}
	if(self bot_action::function_a43bc7e2(var_b594a2cd) || self bot_action::just_spawned(var_b594a2cd) || self bot_action::flashed(var_b594a2cd) || self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd) || self bot_action::function_ed7b2f42(var_b594a2cd))
	{
		return false;
	}
	if(!self offhandweaponsenabled())
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_6ac9b1d785eef92";
		#/
		return false;
	}
	return true;
}

/*
	Name: function_808ca6bb
	Namespace: namespace_d9f3dd47
	Checksum: 0x19091398
	Offset: 0x78A0
	Size: 0x218
	Parameters: 1
	Flags: Linked, Private
*/
function private function_808ca6bb(var_b594a2cd)
{
	if(self bot_action::function_a43bc7e2(var_b594a2cd) || self bot_action::just_spawned(var_b594a2cd) || self bot_action::flashed(var_b594a2cd) || self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd) || self bot_action::function_ed7b2f42(var_b594a2cd))
	{
		return false;
	}
	weapon = var_b594a2cd.weapon;
	registered = 0;
	foreach(killstreak in level.killstreaks)
	{
		if(killstreak.weapon == weapon)
		{
			registered = 1;
			break;
		}
	}
	if(!registered)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_40fce486e054dde0";
		#/
		return false;
	}
	if(!self killstreakrules::iskillstreakallowed(type, self.team, 1))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_15c89d85f9320bf6";
		#/
		return false;
	}
	return true;
}

/*
	Name: function_f338aefb
	Namespace: namespace_d9f3dd47
	Checksum: 0x760F3C27
	Offset: 0x7AC0
	Size: 0x1E4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f338aefb(var_b594a2cd)
{
	if(isdefined(level.activeuavs) && isdefined(level.activeuavs[self.team]) && level.activeuavs[self.team] > 0)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_36676f11c5573c1e";
		#/
		return true;
	}
	if(isdefined(level.var_eb10c6a7) && isdefined(level.var_eb10c6a7[self.team]) && level.var_eb10c6a7[self.team] > 0)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_3839215d605aaf2f";
		#/
		return true;
	}
	if(isdefined(level.activecounteruavs))
	{
		foreach(team in level.teams)
		{
			if(team == self.team)
			{
				continue;
			}
			if(isdefined(level.activecounteruavs[team]) && level.activecounteruavs[team] > 0)
			{
				/#
					var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_669d47e05d0f549f";
				#/
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_82350d4c
	Namespace: namespace_d9f3dd47
	Checksum: 0xC13277C2
	Offset: 0x7CB0
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private function_82350d4c(var_b594a2cd)
{
	if(isdefined(level.activecounteruavs))
	{
		foreach(team in level.teams)
		{
			if(team == self.team)
			{
				continue;
			}
			if(isdefined(level.activecounteruavs[team]) && level.activecounteruavs[team] > 0)
			{
				/#
					var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_669d47e05d0f549f";
				#/
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_4e17fb37
	Namespace: namespace_d9f3dd47
	Checksum: 0x2165F041
	Offset: 0x7DC0
	Size: 0x178
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4e17fb37(var_b594a2cd, var_b7fbe51b)
{
	weapon = var_b594a2cd.weapon;
	aimpoint = var_b594a2cd.aimpoint;
	if(!isdefined(aimpoint))
	{
		if(!isdefined(self.enemy))
		{
			return false;
		}
		aimpoint = self.enemy getcentroid();
	}
	aimangles = self botgetprojectileaimangles(weapon, aimpoint);
	if(!isdefined(aimangles))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_4861201ac3ea229e";
		#/
		return false;
	}
	trace = self function_6e8a2d86(weapon, aimangles.var_478aeacd);
	dist = distance2d(self.origin, aimpoint) - var_b7fbe51b;
	if(!function_e63ee3e8(trace, dist))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_50c1f0722206aaa8";
		#/
		return false;
	}
	return true;
}

/*
	Name: function_754cc239
	Namespace: namespace_d9f3dd47
	Checksum: 0xD6ED3615
	Offset: 0x7F40
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_754cc239(var_b594a2cd)
{
	if(self.bot.var_faa25d47 || !self.bot.var_e9ff4b76)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_74827205c9eaaffe";
		#/
		return false;
	}
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_3e4e2bab6555c31b";
	#/
	return true;
}

/*
	Name: function_64f2e29
	Namespace: namespace_d9f3dd47
	Checksum: 0x726D51AC
	Offset: 0x7FD8
	Size: 0xE8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_64f2e29(var_b594a2cd)
{
	if(!isdefined(self.enemy))
	{
		return false;
	}
	if(isvehicle(self.enemy))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_18edaf9b6eee19a1";
		#/
		return true;
	}
	if(isplayer(self.enemy) && self.enemy isinvehicle() && !self.enemy isremotecontrolling())
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_28145be29cdebb73";
		#/
		return true;
	}
	return false;
}

/*
	Name: function_a469c9cd
	Namespace: namespace_d9f3dd47
	Checksum: 0xF3F1B48D
	Offset: 0x80C8
	Size: 0x70
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a469c9cd(var_b594a2cd)
{
	if(isdefined(self.enemy) && self.enemy.classname == #"grenade")
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_495e9766dfcb4aa3";
		#/
		return true;
	}
	return false;
}

/*
	Name: function_6b54ab21
	Namespace: namespace_d9f3dd47
	Checksum: 0x84365AA2
	Offset: 0x8140
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6b54ab21(weapon)
{
	dist = self.bot.enemydist;
	if(weapon.weapclass == "spread" && dist > weapon.mindamagerange)
	{
		return 0;
	}
	damage = function_2cf16636(weapon, dist);
	var_adf57279 = function_bfb63695(weapon, dist);
	return var_adf57279 + (damage * weapon.shotcount);
}

/*
	Name: min_damage
	Namespace: namespace_d9f3dd47
	Checksum: 0x91A80DE7
	Offset: 0x81F0
	Size: 0x74
	Parameters: 1
	Flags: Private
*/
function private min_damage(weapon)
{
	var_2d276877 = weapon.var_2d276877;
	var_89a5bdab = weapon.var_72960e43;
	damage = var_2d276877[var_2d276877.size - 1];
	var_adf57279 = var_89a5bdab[var_89a5bdab.size - 1];
	return var_adf57279 + damage;
}

/*
	Name: max_damage
	Namespace: namespace_d9f3dd47
	Checksum: 0xEE5DF3
	Offset: 0x8270
	Size: 0x4E
	Parameters: 1
	Flags: Private
*/
function private max_damage(weapon)
{
	damage = weapon.var_2d276877[0];
	var_adf57279 = weapon.var_72960e43[0];
	return var_adf57279 + (damage * weapon.shotcount);
}

/*
	Name: function_4b1db2f8
	Namespace: namespace_d9f3dd47
	Checksum: 0x1EBD3C6C
	Offset: 0x82C8
	Size: 0xDC
	Parameters: 4
	Flags: Linked, Private
*/
function private function_4b1db2f8(var_b594a2cd, var_f97fefd9, var_f7b379b8, var_edd1b764)
{
	if(self.bot.enemydist <= 500)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_22d191cc118ae2f5";
		#/
		return var_f97fefd9;
	}
	if(self.bot.enemydist <= 1500)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_29c69b288d5c7dbc";
		#/
		return var_f7b379b8;
	}
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_4b3f063cd1f54255";
	#/
	return var_edd1b764;
}

/*
	Name: function_67ca228b
	Namespace: namespace_d9f3dd47
	Checksum: 0xD5EC3A45
	Offset: 0x83B0
	Size: 0x132
	Parameters: 0
	Flags: Linked, Private
*/
function private function_67ca228b()
{
	var_8f5e3947 = function_f6f34851(self.team);
	enemies = [];
	foreach(enemy in var_8f5e3947)
	{
		if(enemy hasperk(#"hash_59dc70c4ee13d1b6"))
		{
			continue;
		}
		tpoint = function_ad6356f5(enemy.origin);
		if(!isdefined(tpoint) || !isdefined(tpoint.var_eadc2c7d) || tpoint.var_eadc2c7d < 65534)
		{
			continue;
		}
		enemies[enemies.size] = enemy;
	}
	return enemies;
}

/*
	Name: function_d19a634f
	Namespace: namespace_d9f3dd47
	Checksum: 0x1C613901
	Offset: 0x84F0
	Size: 0x1CE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d19a634f()
{
	var_ded51cc0 = function_548ca110();
	if(var_ded51cc0 > 1)
	{
		tries = 0;
		if(tries < 10)
		{
			for(;;)
			{
				tries++;
				id = randomintrange(1, var_ded51cc0);
				info = function_b507a336(id);
			}
			for(;;)
			{
				tacpoint = info.tacpoints[randomint(info.tacpoints.size)];
			}
			for(;;)
			{
			}
			if(info.tacpoints.size <= 0)
			{
			}
			if(distance2dsquared(self.origin, tacpoint.origin) < 500 * 500)
			{
			}
			if(tacpoint.var_eadc2c7d < 65534)
			{
			}
			return tacpoint.origin;
		}
	}
	radius = randomintrange(500, 1500);
	yaw = randomint(320);
	return (radius * cos(yaw), radius * sin(yaw), self.origin[2]);
}

/*
	Name: function_9dfd5e88
	Namespace: namespace_d9f3dd47
	Checksum: 0xBD9BC2B9
	Offset: 0x86C8
	Size: 0x62
	Parameters: 1
	Flags: Private
*/
function private function_9dfd5e88(trace)
{
	if(!isdefined(self.enemy) || !isdefined(trace))
	{
		return 0;
	}
	var_d6e7a23f = trace[#"entity"];
	return isdefined(var_d6e7a23f) && var_d6e7a23f == self.enemy;
}

/*
	Name: function_e5a76b54
	Namespace: namespace_d9f3dd47
	Checksum: 0xFC627FAE
	Offset: 0x8738
	Size: 0x58
	Parameters: 2
	Flags: Private
*/
function private function_e5a76b54(trace, origin)
{
	if(!isdefined(trace))
	{
		return 0;
	}
	distsq = distancesquared(trace[#"position"], origin);
	return distsq <= 100;
}

/*
	Name: function_e63ee3e8
	Namespace: namespace_d9f3dd47
	Checksum: 0xD1054623
	Offset: 0x8798
	Size: 0x50
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e63ee3e8(trace, distance)
{
	if(!isdefined(trace))
	{
		return 0;
	}
	return distance2d(self.origin, trace[#"position"]) >= distance;
}

/*
	Name: function_185a3c39
	Namespace: namespace_d9f3dd47
	Checksum: 0x80ABE038
	Offset: 0x87F0
	Size: 0x76
	Parameters: 1
	Flags: Linked, Private
*/
function private function_185a3c39(weapon)
{
	while(self getcurrentweapon() != weapon)
	{
		if(!self isswitchingweapons())
		{
			self botswitchtoweapon(weapon);
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_c1515256
	Namespace: namespace_d9f3dd47
	Checksum: 0xBD2754CB
	Offset: 0x8870
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c1515256(weapon)
{
	self function_88128d60(weapon);
	self bottapbutton(84);
}

/*
	Name: fire_weapon
	Namespace: namespace_d9f3dd47
	Checksum: 0x92EC71A2
	Offset: 0x88B8
	Size: 0x1DC
	Parameters: 1
	Flags: Linked, Private
*/
function private fire_weapon(weapon)
{
	if(weapon.firetype == #"hash_74e162e14a20482b" || weapon.firetype == #"burst")
	{
		if(self isfiring() || (!(!isdefined(self.bot.var_51cee2ad) || self.bot.var_51cee2ad <= gettime())))
		{
			return;
		}
		if(weapon.firetype == #"hash_74e162e14a20482b")
		{
			self.bot.var_51cee2ad = gettime() + (int((isdefined(self.bot.difficulty.var_b489efb7) ? self.bot.difficulty.var_b489efb7 : 0) * 1000));
		}
		else if(weapon.firetype == #"burst")
		{
			self.bot.var_51cee2ad = gettime() + (int((isdefined(self.bot.difficulty.burstdelay) ? self.bot.difficulty.burstdelay : 0) * 1000));
		}
	}
	self bottapbutton(0);
	if(weapon.dualwieldweapon != level.weaponnone)
	{
		self bottapbutton(24);
	}
}

/*
	Name: function_6b01cd20
	Namespace: namespace_d9f3dd47
	Checksum: 0xB2D7BB94
	Offset: 0x8AA0
	Size: 0x58
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6b01cd20()
{
	if(self.bot.var_e8c84f98)
	{
		return;
	}
	self bot_action::clear();
	do
	{
		self waittill(#"hash_77f2882ff9140e86");
	}
	while(!self.bot.var_e8c84f98);
}

/*
	Name: function_84092214
	Namespace: namespace_d9f3dd47
	Checksum: 0x484024BB
	Offset: 0x8B00
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_84092214(var_b594a2cd)
{
	self function_90c011d5(var_b594a2cd, 14);
}

/*
	Name: function_6bc8e929
	Namespace: namespace_d9f3dd47
	Checksum: 0xC8CCB368
	Offset: 0x8B38
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6bc8e929(var_b594a2cd)
{
	self function_90c011d5(var_b594a2cd, 15);
}

/*
	Name: function_90c011d5
	Namespace: namespace_d9f3dd47
	Checksum: 0x9C663F22
	Offset: 0x8B70
	Size: 0x246
	Parameters: 2
	Flags: Linked, Private
*/
function private function_90c011d5(var_b594a2cd, var_dd95d559)
{
	self endoncallback(&function_39cec272, #"hash_1ae115949cd752c8");
	self endon(#"death", #"hash_3525e39d3694d0a9");
	self.bot.var_6bea1d82 = 1;
	weapon = var_b594a2cd.weapon;
	self.bot.var_f50fa466 = weapon;
	while(true)
	{
		self.bot.var_87751145 = var_b594a2cd.aimpoint;
		self function_e1e3b64c(0);
		while(!self function_d911b948() || !(self botgetlookdot() >= (lerpfloat(0.996195, 0.999962, self.bot.enemydist / 500))))
		{
			if(self botgetlookdot() >= 0.866)
			{
				self bottapbutton(var_dd95d559);
			}
			else if(self isthrowinggrenade())
			{
				self bottapbutton(49);
			}
			self waittill(#"hash_77f2882ff9140e86");
		}
		while(self function_d911b948() || self isthrowinggrenade())
		{
			self waittill(#"hash_77f2882ff9140e86");
		}
		self.bot.var_e636e51e = gettime() + (int(5 * 1000));
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_39cec272
	Namespace: namespace_d9f3dd47
	Checksum: 0xE4F1B794
	Offset: 0x8DC0
	Size: 0x6E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_39cec272(notifyhash)
{
	self.bot.var_e636e51e = gettime() + (int(5 * 1000));
	if(self function_d911b948())
	{
		self bottapbutton(49);
	}
	self.throwinggrenade = 0;
}

/*
	Name: function_de73a533
	Namespace: namespace_d9f3dd47
	Checksum: 0x5523C06C
	Offset: 0x8E38
	Size: 0xE2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_de73a533(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	while(!self function_d911b948())
	{
		self bottapbutton(70);
		self waittill(#"hash_77f2882ff9140e86");
	}
	while(self function_d911b948())
	{
		self waittill(#"hash_77f2882ff9140e86");
	}
	self.bot.var_e636e51e = gettime() + (int(5 * 1000));
}

/*
	Name: function_bbef6e21
	Namespace: namespace_d9f3dd47
	Checksum: 0x9E2DFC6
	Offset: 0x8F28
	Size: 0x8E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bbef6e21()
{
	if(!isdefined(self.bot.difficulty) || is_true(self.bot.difficulty.var_33be320f))
	{
		return;
	}
	stop = self.bot.var_9931c7dc && self.bot.var_2cf887f8;
	self.bot.var_6bea1d82 = stop;
}

/*
	Name: function_411e397e
	Namespace: namespace_d9f3dd47
	Checksum: 0x75B3ED96
	Offset: 0x8FC0
	Size: 0x2AA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_411e397e()
{
	shoottime = (isdefined(self.bot.difficulty.shoottime) ? self.bot.difficulty.shoottime : 0);
	if(shoottime <= 0)
	{
		return;
	}
	if(isdefined(self.enemy) && self.bot.lastenemy !== self.enemy)
	{
		self.bot.var_d70788cb = undefined;
		self.bot.shoottime = undefined;
		self.bot.var_32d8dabe = undefined;
	}
	if(!self.bot.var_9931c7dc || !self.bot.var_2cf887f8)
	{
		return;
	}
	if(!isdefined(self.bot.var_32d8dabe))
	{
		self function_e1e3b64c(1);
	}
	if(!(!isdefined(self.bot.shoottime) || self.bot.shoottime <= gettime()) || !(self botgetlookdot() >= 0.766))
	{
		return;
	}
	if(isdefined(self.bot.shoottime))
	{
		self function_e1e3b64c(1);
	}
	delaytime = (isdefined(self.bot.difficulty.var_d70788cb) ? self.bot.difficulty.var_d70788cb : 0);
	var_8a2cf681 = self function_7067eabd();
	if(var_8a2cf681 >= 2.5 || !(self.bot.enemydist <= (var_8a2cf681 * 500)))
	{
		delaytime = delaytime + self function_957aa281();
	}
	totaltime = delaytime + shoottime;
	self.bot.var_d70788cb = gettime() + (int(delaytime * 1000));
	self.bot.shoottime = gettime() + (int(totaltime * 1000));
}

/*
	Name: function_d8b388a6
	Namespace: namespace_d9f3dd47
	Checksum: 0x2889B119
	Offset: 0x9278
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d8b388a6()
{
	if((isdefined(self.bot.difficulty.shoottime) ? self.bot.difficulty.shoottime : 0) <= 0)
	{
		return 1;
	}
	return !isdefined(self.bot.var_d70788cb) || self.bot.var_d70788cb <= gettime() && (!(!isdefined(self.bot.shoottime) || self.bot.shoottime <= gettime()));
}

/*
	Name: function_e1e3b64c
	Namespace: namespace_d9f3dd47
	Checksum: 0x692B6143
	Offset: 0x9330
	Size: 0x19C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e1e3b64c(currentweapon)
{
	var_6fdbcf34 = -10;
	var_8a5f8d43 = 10;
	zmin = -10;
	var_a31f48b8 = 10;
	if(self function_9160a207(currentweapon))
	{
		if(self.bot.var_2cf887f8 && self function_e3b275f0(self.enemy, "j_head"))
		{
			self.bot.var_2d563ebf = "j_head";
		}
		else
		{
			self.bot.var_2d563ebf = undefined;
		}
	}
	else
	{
		self.bot.var_2d563ebf = undefined;
		if(randomint(2) > 0)
		{
			var_6fdbcf34 = 18;
			var_8a5f8d43 = 30;
		}
		else
		{
			var_6fdbcf34 = -30;
			var_8a5f8d43 = -18;
		}
		zmin = 10;
		var_a31f48b8 = 20;
	}
	y = randomfloatrange(var_6fdbcf34, var_8a5f8d43);
	z = randomfloatrange(zmin, var_a31f48b8);
	self.bot.var_32d8dabe = (0, y, z);
	self namespace_87549638::think();
}

/*
	Name: function_9160a207
	Namespace: namespace_d9f3dd47
	Checksum: 0xA306DB1A
	Offset: 0x94D8
	Size: 0x290
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9160a207(currentweapon)
{
	if(!isdefined(self.bot.difficulty))
	{
		return 1;
	}
	var_f519fbc6 = (isdefined(self.bot.difficulty.var_d20ff29c) ? self.bot.difficulty.var_d20ff29c : 0);
	if(currentweapon && !(self.bot.enemydist <= 200))
	{
		if(!self.bot.enemydist <= 500)
		{
			var_8a2cf681 = self function_7067eabd();
			mindist = var_8a2cf681 * 500;
			var_e99f12e5 = self.bot.enemydist - mindist;
			var_f4b40c21 = (var_8a2cf681 * 2500) - mindist;
			var_66a04f11 = (isdefined(self.bot.difficulty.var_65a25108) ? self.bot.difficulty.var_65a25108 : 0);
			var_7e2f0732 = (isdefined(self.bot.difficulty.var_e0e4be1b) ? self.bot.difficulty.var_e0e4be1b : 0);
			falloff = lerpfloat(var_66a04f11, var_7e2f0732, var_e99f12e5 / var_f4b40c21);
			var_f519fbc6 = var_f519fbc6 * falloff;
		}
		if(self playerads() < 1)
		{
			var_f519fbc6 = var_f519fbc6 * (isdefined(self.bot.difficulty.var_363a4bcd) ? self.bot.difficulty.var_363a4bcd : 0);
		}
	}
	/#
		self.bot.var_9e5aaf8d = var_f519fbc6;
	#/
	if(var_f519fbc6 <= 0)
	{
		return 0;
	}
	return randomfloat(100) < var_f519fbc6;
}

/*
	Name: function_e3b275f0
	Namespace: namespace_d9f3dd47
	Checksum: 0x213C6EA1
	Offset: 0x9770
	Size: 0xC8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e3b275f0(enemy, headtag)
{
	if(!isdefined(enemy gettagorigin(headtag)))
	{
		return 0;
	}
	var_6e53ed46 = (isdefined(self.bot.difficulty.var_fa680c5e) ? self.bot.difficulty.var_fa680c5e : 0);
	if(var_6e53ed46 <= 0)
	{
		return 0;
	}
	if(var_6e53ed46 >= 100)
	{
		return 1;
	}
	return randomfloat(100) < var_6e53ed46;
}

