#using script_3f27a7b2232674db;
#using script_545a0bac37bda541;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace status_effect;

/*
	Name: register_status_effect
	Namespace: status_effect
	Checksum: 0x2F3740FF
	Offset: 0xD0
	Size: 0x60
	Parameters: 1
	Flags: Linked, Private
*/
function private register_status_effect(var_df1e8764)
{
	if(!isdefined(level._status_effects))
	{
		level._status_effects = [];
	}
	if(!isdefined(level._status_effects[var_df1e8764]))
	{
		level._status_effects[var_df1e8764] = spawnstruct();
	}
}

/*
	Name: function_6f4eaf88
	Namespace: status_effect
	Checksum: 0x923C8204
	Offset: 0x138
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function function_6f4eaf88(var_756fda07)
{
	if(!isdefined(var_756fda07))
	{
		/#
			println("");
		#/
		return;
	}
	if(!isdefined(var_756fda07.var_67e2281d))
	{
		var_756fda07.var_67e2281d = 0;
	}
	register_status_effect(var_756fda07.var_67e2281d);
	level.var_233471d2[var_756fda07.var_67e2281d] = var_756fda07;
}

/*
	Name: register_status_effect_callback_apply
	Namespace: status_effect
	Checksum: 0xB4E0FBE7
	Offset: 0x1C0
	Size: 0x4E
	Parameters: 2
	Flags: Linked
*/
function register_status_effect_callback_apply(status_effect, apply_func)
{
	register_status_effect(status_effect);
	if(isdefined(apply_func))
	{
		level._status_effects[status_effect].apply = apply_func;
	}
}

/*
	Name: function_b24f18a1
	Namespace: status_effect
	Checksum: 0x79E18889
	Offset: 0x218
	Size: 0x146
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b24f18a1()
{
	if(isdefined(self.owner))
	{
		if(function_7d17822(self.var_67e2281d))
		{
			self.owner function_89ae38c1(self.var_3cf2d21);
		}
		if(isdefined(self.var_36c77790))
		{
			if(isplayer(self.owner))
			{
				self.owner playlocalsound(self.var_36c77790);
			}
		}
		if(isdefined(self.var_801118b0))
		{
			if(isplayer(self.owner))
			{
				self.owner stoploopsound(0.5);
			}
		}
		self.owner function_14fdd7e2(self.var_4f6b79a4);
		self [[level._status_effects[self.var_67e2281d].var_a4c649a2]]();
		self.owner.var_121392a1[self.var_18d16a6b] = undefined;
		self notify(#"hash_13d72ca5a7cfd2bd");
	}
}

/*
	Name: function_5bae5120
	Namespace: status_effect
	Checksum: 0x7A5FF856
	Offset: 0x368
	Size: 0x9E
	Parameters: 2
	Flags: Linked
*/
function function_5bae5120(status_effect, end_func)
{
	register_status_effect(status_effect);
	if(isdefined(end_func))
	{
		level._status_effects[status_effect].end = &function_b24f18a1;
		level._status_effects[status_effect].var_a4c649a2 = end_func;
		level._status_effects[status_effect].death = level._status_effects[status_effect].end;
	}
}

/*
	Name: function_6d888241
	Namespace: status_effect
	Checksum: 0xEDE3D1CD
	Offset: 0x410
	Size: 0x4E
	Parameters: 2
	Flags: None
*/
function function_6d888241(status_effect, death_func)
{
	register_status_effect(status_effect);
	if(isdefined(death_func))
	{
		level._status_effects[status_effect].death = death_func;
	}
}

/*
	Name: function_30e7d622
	Namespace: status_effect
	Checksum: 0xABBC04B3
	Offset: 0x468
	Size: 0x24
	Parameters: 2
	Flags: Linked
*/
function function_30e7d622(weapon, var_fb3644ab)
{
	level.var_39d29200[weapon] = var_fb3644ab;
}

/*
	Name: function_e2bff3ce
	Namespace: status_effect
	Checksum: 0x6D76E246
	Offset: 0x498
	Size: 0x54
	Parameters: 3
	Flags: None
*/
function function_e2bff3ce(var_df1e8764, weapon, var_84171a6c)
{
	if(isdefined(level.var_233471d2[var_df1e8764]))
	{
		self status_effect_apply(level.var_233471d2[var_df1e8764], weapon, var_84171a6c);
	}
}

/*
	Name: function_91a9db75
	Namespace: status_effect
	Checksum: 0x45E11131
	Offset: 0x4F8
	Size: 0x14A
	Parameters: 3
	Flags: Linked, Private
*/
function private function_91a9db75(var_d9ad36fc, var_67e2281d, var_3cf2d21)
{
	if(!isdefined(self.var_121392a1))
	{
		self.var_121392a1 = [];
	}
	if(!isdefined(self.var_121392a1[var_d9ad36fc]))
	{
		self.var_121392a1[var_d9ad36fc] = spawnstruct();
	}
	if(!isdefined(self.var_121392a1[var_d9ad36fc].duration))
	{
		self.var_121392a1[var_d9ad36fc].duration = 0;
	}
	if(!isdefined(self.var_121392a1[var_d9ad36fc].endtime))
	{
		self.var_121392a1[var_d9ad36fc].endtime = 0;
	}
	if(!isdefined(self.var_121392a1[var_d9ad36fc].owner))
	{
		self.var_121392a1[var_d9ad36fc].owner = self;
	}
	self.var_121392a1[var_d9ad36fc].var_67e2281d = var_67e2281d;
	self.var_121392a1[var_d9ad36fc].var_3cf2d21 = var_3cf2d21;
	self.var_121392a1[var_d9ad36fc].var_18d16a6b = var_d9ad36fc;
}

/*
	Name: status_effect_apply
	Namespace: status_effect
	Checksum: 0x975CB089
	Offset: 0x650
	Size: 0x7EC
	Parameters: 7
	Flags: Linked
*/
function status_effect_apply(var_756fda07, weapon, var_84171a6c, var_80e47495, var_ab5b905e, var_894859a2, location)
{
	/#
		assert(isdefined(var_756fda07.var_67e2281d));
	#/
	/#
		assert(isdefined(var_756fda07.var_18d16a6b));
	#/
	if(is_true(self.registerpreparing_time_))
	{
		return;
	}
	if(isdefined(var_894859a2))
	{
		var_756fda07.var_77449e9 = var_756fda07.var_77449e9 * var_894859a2;
		if(isdefined(var_ab5b905e))
		{
			var_ab5b905e = var_ab5b905e * var_894859a2;
		}
	}
	register_status_effect(var_756fda07.var_67e2281d);
	var_f8f8abaa = 0;
	if(isdefined(var_84171a6c) && var_84171a6c != self && !self function_4aac137f(var_84171a6c, var_756fda07.var_18d16a6b))
	{
		var_b7a9b136 = 1;
		if(isdefined(var_756fda07.var_2e4a8800))
		{
			var_8725a10d = globallogic_score::function_3cbc4c6c(var_756fda07.var_2e4a8800);
		}
		if(isdefined(var_8725a10d) && isdefined(var_8725a10d.var_3e3b11a9))
		{
			resistance = function_3c54ae98(var_756fda07.var_67e2281d);
			if(var_8725a10d.var_3e3b11a9 < resistance)
			{
				var_b7a9b136 = 0;
			}
		}
		if(var_b7a9b136 && util::function_fbce7263(self.team, var_84171a6c.team))
		{
			if(isplayer(var_84171a6c))
			{
				var_84171a6c thread globallogic_score::function_969ea48d(var_756fda07, weapon);
			}
		}
		var_f8f8abaa = 1;
	}
	self function_91a9db75(var_756fda07.var_18d16a6b, var_756fda07.var_67e2281d, var_756fda07.var_3cf2d21);
	self function_52969ffe(var_756fda07);
	self callback::callback(#"hash_4acc79bbf6402a39", var_756fda07);
	var_275b5e13 = function_2ba2756c(var_756fda07.var_18d16a6b) > level.time;
	var_b0144580 = var_84171a6c === self;
	if(!isdefined(var_80e47495))
	{
		var_80e47495 = getdvarint(#"hash_6ce4aefbba354e2d", 0);
	}
	effect = self.var_121392a1[var_756fda07.var_18d16a6b];
	effect.var_4f6b79a4 = var_756fda07;
	if(isdefined(location))
	{
		effect.location = location;
	}
	else if(isdefined(var_84171a6c))
	{
		effect.location = var_84171a6c.origin;
	}
	effect function_3d6c76ee(var_756fda07);
	var_4df0ea83 = 1;
	if(isdefined(var_756fda07.var_4df0ea83))
	{
		var_4df0ea83 = var_756fda07.var_4df0ea83;
	}
	if(var_4df0ea83)
	{
		if(var_80e47495 && var_756fda07.var_67e2281d != 4)
		{
			effect function_57f33b96(var_756fda07, var_b0144580, var_ab5b905e, var_84171a6c, var_f8f8abaa, weapon);
		}
		else
		{
			effect function_cc42cac2(var_756fda07, var_b0144580, var_ab5b905e, var_84171a6c, var_f8f8abaa, weapon);
		}
	}
	maxduration = effect function_f9ca1b6a(var_756fda07);
	if(maxduration > 0 && self.var_121392a1[var_756fda07.var_18d16a6b].duration > maxduration)
	{
		self.var_121392a1[var_756fda07.var_18d16a6b].duration = maxduration;
	}
	else if(self.var_121392a1[var_756fda07.var_18d16a6b].duration > 65536 - 1)
	{
		self.var_121392a1[var_756fda07.var_18d16a6b].duration = 65536 - 1;
	}
	if(isdefined(weapon) && weapon.doesfiredamage)
	{
		if(isplayer(self))
		{
			self clientfield::set("burn", 1);
		}
	}
	if(!var_275b5e13)
	{
		effect function_5d973c5f();
	}
	if(isdefined(level._status_effects[var_756fda07.var_67e2281d].apply))
	{
		effect.var_4b22e697 = var_84171a6c;
		effect.var_3d1ed4bd = weapon;
		effect thread [[level._status_effects[var_756fda07.var_67e2281d].apply]](var_756fda07, weapon, var_84171a6c);
		thread function_86c0eb67(effect, "begin");
	}
	var_1d673e46 = !isplayer(self) || (self function_6c32d092(#"talent_resistance") && !is_true(var_756fda07.var_857e12ae));
	if(!var_1d673e46 && !isdefined(effect.var_b5207a36))
	{
		if(isdefined(var_756fda07.var_208fb7da))
		{
			effect.var_b5207a36 = self gestures::function_c77349d4(var_756fda07.var_208fb7da);
		}
		if(!isdefined(effect.var_b5207a36))
		{
			if(isdefined(var_756fda07.var_b5207a36))
			{
				effect.var_b5207a36 = var_756fda07.var_b5207a36;
			}
		}
		if(isdefined(effect.var_b5207a36))
		{
			self thread function_35d7925d(effect, is_true(var_756fda07.var_f9cf17ac));
		}
	}
	if(function_7d17822(var_756fda07.var_67e2281d))
	{
		self thread function_47cad1aa(var_756fda07, var_80e47495);
	}
	if(isdefined(weapon) && isdefined(var_84171a6c) && var_84171a6c != self && is_true(var_756fda07.var_3469b797))
	{
		var_594a2d34 = isdefined(weapon) && isdefined(weapon.var_965cc0b3) && weapon.var_965cc0b3;
		var_84171a6c util::show_hit_marker(0, var_594a2d34);
	}
	if(isdefined(level._status_effects[var_756fda07.var_67e2281d].end))
	{
		effect thread wait_for_end();
	}
}

/*
	Name: function_35d7925d
	Namespace: status_effect
	Checksum: 0x4F1799D1
	Offset: 0xE48
	Size: 0xC8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_35d7925d(effect, var_5328ec7a)
{
	effect endon(#"hash_13d72ca5a7cfd2bd");
	self endon(#"death");
	while(isdefined(effect.var_b5207a36) && isalive(self))
	{
		if(isdefined(level.var_d0ad09c5))
		{
			self [[level.var_d0ad09c5]](effect);
		}
		if(self gestures::function_b204f6e3(effect.var_b5207a36, undefined, 0))
		{
			return;
		}
		if(var_5328ec7a)
		{
			return;
		}
		wait(0.5);
	}
}

/*
	Name: function_47cad1aa
	Namespace: status_effect
	Checksum: 0xC4A767A
	Offset: 0xF18
	Size: 0x104
	Parameters: 2
	Flags: Linked, Private
*/
function private function_47cad1aa(var_756fda07, var_80e47495)
{
	var_18d16a6b = var_756fda07.var_18d16a6b;
	var_67e2281d = var_756fda07.var_67e2281d;
	if(isdefined(self.var_121392a1[var_18d16a6b]) && isdefined(self.var_121392a1[var_18d16a6b].duration))
	{
		if(var_67e2281d != 4)
		{
			if(isplayer(self))
			{
				/#
					assert(!isfloat(self.var_121392a1[var_18d16a6b].duration), "");
				#/
				self applystatuseffect(var_756fda07.var_3cf2d21, self.var_121392a1[var_18d16a6b].duration, var_80e47495);
			}
		}
	}
}

/*
	Name: function_89ae38c1
	Namespace: status_effect
	Checksum: 0xE961D121
	Offset: 0x1028
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_89ae38c1(sename)
{
	if(isplayer(self))
	{
		self function_522c570(sename);
	}
}

/*
	Name: function_52969ffe
	Namespace: status_effect
	Checksum: 0x77A04B73
	Offset: 0x1070
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_52969ffe(var_756fda07)
{
	player = self;
	if(is_true(var_756fda07.var_3edb6e25) && isplayer(player))
	{
		player disableoffhandspecial();
		player disableoffhandweapons();
	}
}

/*
	Name: function_14fdd7e2
	Namespace: status_effect
	Checksum: 0xBC7F4DB9
	Offset: 0x10F8
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_14fdd7e2(var_756fda07)
{
	player = self;
	if(is_true(var_756fda07.var_3edb6e25) && isplayer(player))
	{
		player enableoffhandspecial();
		player enableoffhandweapons();
	}
}

/*
	Name: function_6bf7c434
	Namespace: status_effect
	Checksum: 0x499A9BA4
	Offset: 0x1180
	Size: 0x17E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6bf7c434(var_df1e8764)
{
	if(isdefined(self.var_b5207a36))
	{
		self.owner stopgestureviewmodel(self.var_b5207a36, 1, 0);
		self.var_b5207a36 = undefined;
	}
	if(isdefined(self.var_4b22e697))
	{
		self.var_4b22e697 globallogic_score::function_4842d1f6(self.var_4f6b79a4);
	}
	if(isdefined(level._status_effects) && isdefined(level._status_effects[var_df1e8764]) && isdefined(level._status_effects[var_df1e8764].end))
	{
		self thread [[level._status_effects[var_df1e8764].end]]();
	}
	thread function_86c0eb67(self, "end");
	if(isdefined(self.var_3d1ed4bd) && isdefined(self.owner) && self.var_3d1ed4bd.doesfiredamage)
	{
		if(isplayer(self.owner))
		{
			self.owner clientfield::set("burn", 0);
		}
	}
	self.var_4b22e697 = undefined;
	self notify(#"hash_13d72ca5a7cfd2bd");
}

/*
	Name: wait_for_end
	Namespace: status_effect
	Checksum: 0xE14A81BF
	Offset: 0x1308
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private wait_for_end()
{
	if(0 && self.var_67e2281d == 6)
	{
		return;
	}
	self notify(#"hash_2db8ad07c2f9d764");
	self endon(#"hash_2db8ad07c2f9d764", #"hash_13d72ca5a7cfd2bd");
	self.owner endon(#"disconnect");
	while(self.endtime > level.time)
	{
		waitframe(1);
	}
	if(isdefined(self))
	{
		self thread function_6bf7c434(self.var_67e2281d);
	}
}

/*
	Name: function_408158ef
	Namespace: status_effect
	Checksum: 0x4795D84B
	Offset: 0x13C8
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_408158ef(var_67e2281d, var_18d16a6b)
{
	if(isdefined(self.var_121392a1))
	{
		if(isdefined(level._status_effects[var_67e2281d].end))
		{
			effect = self.var_121392a1[var_18d16a6b];
			if(isdefined(effect))
			{
				effect function_6bf7c434(var_67e2281d);
			}
		}
	}
}

/*
	Name: function_6519f95f
	Namespace: status_effect
	Checksum: 0xE4FEA26B
	Offset: 0x1448
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function function_6519f95f()
{
	if(isdefined(self.var_121392a1))
	{
		foreach(effect in self.var_121392a1)
		{
			if(isdefined(level._status_effects[effect.var_67e2281d].end))
			{
				effect function_6bf7c434(effect.var_67e2281d);
			}
		}
	}
}

/*
	Name: function_3d6c76ee
	Namespace: status_effect
	Checksum: 0x13981522
	Offset: 0x1508
	Size: 0x11E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3d6c76ee(var_756fda07)
{
	endtime = self.endtime;
	if(isdefined(var_756fda07.var_b86e9a5e))
	{
		if(level.time < endtime && isplayer(self.owner))
		{
			self.owner playlocalsound(var_756fda07.var_b86e9a5e);
		}
	}
	if(isdefined(var_756fda07.var_801118b0))
	{
		if(level.time < endtime && isplayer(self.owner))
		{
			self.owner playloopsound(var_756fda07.var_801118b0);
		}
		self.var_801118b0 = var_756fda07.var_801118b0;
	}
	if(isdefined(var_756fda07.var_36c77790))
	{
		self.var_36c77790 = var_756fda07.var_36c77790;
	}
}

/*
	Name: status_effect_get_duration
	Namespace: status_effect
	Checksum: 0x6786AF5F
	Offset: 0x1630
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function status_effect_get_duration(var_eeb47fb8)
{
	if(!isdefined(self.var_121392a1))
	{
		self.var_121392a1 = [];
	}
	return true;
}

/*
	Name: function_2ba2756c
	Namespace: status_effect
	Checksum: 0xEE153B55
	Offset: 0x1688
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_2ba2756c(var_eeb47fb8)
{
	if(!isdefined(self.var_121392a1))
	{
		self.var_121392a1 = [];
	}
	return true;
}

/*
	Name: function_7f14a56f
	Namespace: status_effect
	Checksum: 0x65176E31
	Offset: 0x16E0
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_7f14a56f(var_df1e8764)
{
	if(!isdefined(self.var_121392a1))
	{
		self.var_121392a1 = [];
	}
	var_e2997f02 = 0;
	foreach(effect in self.var_121392a1)
	{
		if(effect.var_67e2281d == 7)
		{
			var_e2997f02 = var_e2997f02 + ((effect.var_adb1692a * effect.var_5cf129b8) / 1000);
		}
	}
	return var_e2997f02;
}

/*
	Name: function_4617032e
	Namespace: status_effect
	Checksum: 0xEFB34F30
	Offset: 0x17C0
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_4617032e(var_df1e8764)
{
	if(!isdefined(self.var_121392a1))
	{
		self.var_121392a1 = [];
	}
	foreach(effect in self.var_121392a1)
	{
		if(effect.var_67e2281d == var_df1e8764)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_40293e80
	Namespace: status_effect
	Checksum: 0xD5FF5D46
	Offset: 0x1878
	Size: 0x5A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_40293e80(var_df1e8764, weapon)
{
	if(var_df1e8764 == 3)
	{
		return "flakjacket";
	}
	if(isdefined(level.var_39d29200[weapon]))
	{
		return level.var_39d29200[weapon];
	}
	return "resistance";
}

/*
	Name: function_cc42cac2
	Namespace: status_effect
	Checksum: 0xEF3F82A6
	Offset: 0x18E0
	Size: 0x2BE
	Parameters: 6
	Flags: Linked, Private
*/
function private function_cc42cac2(var_756fda07, var_b0144580, var_ab5b905e, var_84171a6c, var_f8f8abaa, weapon)
{
	var_67e2281d = var_756fda07.var_67e2281d;
	resistance = self function_a6613b51(var_756fda07);
	var_fb887b00 = (var_b0144580 ? self.owner function_37683813() : 1);
	if(var_b0144580 && isdefined(weapon) && is_true(weapon.var_83b1dc1))
	{
		var_fb887b00 = 1;
	}
	if(resistance > 0 && isdefined(var_84171a6c) && var_f8f8abaa && var_756fda07.var_42c00474 === 1 && !var_b0144580 && var_67e2281d !== 0)
	{
		var_84171a6c damagefeedback::update(undefined, undefined, function_40293e80(var_67e2281d, weapon));
	}
	var_7a1fa72a = 0;
	if(isdefined(var_ab5b905e))
	{
		var_7a1fa72a = var_ab5b905e;
	}
	else
	{
		var_7a1fa72a = var_756fda07.var_77449e9;
	}
	var_7a1fa72a = int((var_7a1fa72a * (1 - resistance)) * var_fb887b00);
	var_2226e3f0 = self.endtime;
	time = level.time;
	maxduration = self function_f9ca1b6a(var_756fda07);
	if(isdefined(var_2226e3f0))
	{
		var_b5051685 = var_2226e3f0 - time;
		if(var_b5051685 < var_7a1fa72a)
		{
			self.duration = var_7a1fa72a;
			if(maxduration && self.duration > maxduration)
			{
				self.duration = maxduration;
			}
			self.endtime = time + self.duration;
		}
	}
	else
	{
		self.duration = var_7a1fa72a;
		if(maxduration && self.duration > maxduration)
		{
			self.duration = maxduration;
		}
		self.endtime = time + self.duration;
	}
}

/*
	Name: function_57f33b96
	Namespace: status_effect
	Checksum: 0xAA932ED8
	Offset: 0x1BA8
	Size: 0x32E
	Parameters: 6
	Flags: Linked, Private
*/
function private function_57f33b96(var_756fda07, var_b0144580, var_ab5b905e, var_84171a6c, var_f8f8abaa, weapon)
{
	var_67e2281d = var_756fda07.var_67e2281d;
	resistance = self function_a6613b51(var_756fda07);
	if(is_true(var_756fda07.var_857e12ae))
	{
		resistance = 0;
	}
	var_fb887b00 = (var_b0144580 ? self.owner function_37683813() : 1);
	if(var_b0144580 && isdefined(weapon) && is_true(weapon.var_83b1dc1))
	{
		var_fb887b00 = 1;
	}
	if(resistance > 0 && var_67e2281d != 0 && var_67e2281d != 3 && isdefined(var_84171a6c) && var_f8f8abaa && var_756fda07.var_42c00474 === 1 && !var_b0144580)
	{
		var_84171a6c damagefeedback::update(undefined, undefined, function_40293e80(var_67e2281d, weapon), weapon, self.owner);
	}
	var_7a1fa72a = 0;
	if(isdefined(var_ab5b905e))
	{
		var_7a1fa72a = var_ab5b905e;
	}
	else
	{
		var_7a1fa72a = var_756fda07.var_77449e9;
	}
	var_7a1fa72a = int((var_7a1fa72a * (1 - resistance)) * var_fb887b00);
	time = level.time;
	maxduration = self function_f9ca1b6a(var_756fda07);
	if(isdefined(self.duration))
	{
		if(isdefined(self.endtime) && self.endtime > time)
		{
			if(maxduration && var_7a1fa72a > maxduration)
			{
				var_7a1fa72a = maxduration;
			}
			self.duration = self.duration + var_7a1fa72a;
			self.endtime = gettime() + var_7a1fa72a;
		}
		else
		{
			self.duration = var_7a1fa72a;
			if(maxduration && self.duration > maxduration)
			{
				self.duration = maxduration;
			}
			self.endtime = time + var_7a1fa72a;
		}
	}
	else
	{
		self.duration = var_7a1fa72a;
		if(maxduration && self.duration > maxduration)
		{
			self.duration = maxduration;
		}
		self.endtime = time + var_7a1fa72a;
	}
}

/*
	Name: function_5d973c5f
	Namespace: status_effect
	Checksum: 0x2F534158
	Offset: 0x1EE0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5d973c5f()
{
	self thread function_72886b31();
	self thread function_150a8541();
}

/*
	Name: function_150a8541
	Namespace: status_effect
	Checksum: 0x91F441B0
	Offset: 0x1F20
	Size: 0x156
	Parameters: 0
	Flags: Linked
*/
function function_150a8541()
{
	self notify(#"hash_5839b9fabbec3015");
	self endon(#"hash_5839b9fabbec3015", #"hash_13d72ca5a7cfd2bd");
	self.owner endon(#"death", #"disconnect");
	var_eff9d37f = self.owner function_3c54ae98(self.var_67e2281d);
	while(true)
	{
		self.owner waittill(#"loadout_given");
		var_db4f9c48 = self.owner function_3c54ae98(self.var_67e2281d);
		currtime = level.time;
		if(var_db4f9c48 != var_eff9d37f)
		{
			timeremaining = self.endtime - currtime;
			timeremaining = timeremaining * var_db4f9c48;
			self.endtime = int(currtime + timeremaining);
			self.duration = int(timeremaining);
		}
	}
}

/*
	Name: function_72886b31
	Namespace: status_effect
	Checksum: 0x4F72EDF9
	Offset: 0x2080
	Size: 0x98
	Parameters: 0
	Flags: Linked
*/
function function_72886b31()
{
	self notify(#"deathwatcher");
	self endon(#"deathwatcher", #"hash_13d72ca5a7cfd2bd");
	self.owner waittill(#"death");
	if(isdefined(self) && isdefined(level._status_effects[self.var_67e2281d].death))
	{
		self [[level._status_effects[self.var_67e2281d].death]]();
	}
}

/*
	Name: function_3c54ae98
	Namespace: status_effect
	Checksum: 0x5DC4ED91
	Offset: 0x2120
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_3c54ae98(var_df1e8764)
{
	if(!isplayer(self))
	{
		return 0;
	}
	if(sessionmodeiszombiesgame())
	{
		if(!player_role::is_valid(self player_role::get()))
		{
			return 0;
		}
	}
	resistance = self function_a8581873(var_df1e8764);
	return resistance;
}

/*
	Name: function_37683813
	Namespace: status_effect
	Checksum: 0xFCF5DCA
	Offset: 0x21C0
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_37683813()
{
	if(!isplayer(self))
	{
		return 1;
	}
	scalar = self function_9049b079();
	return scalar;
}

/*
	Name: function_a6613b51
	Namespace: status_effect
	Checksum: 0x24C4F58E
	Offset: 0x2218
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a6613b51(var_756fda07)
{
	effect = self;
	var_67e2281d = var_756fda07.var_67e2281d;
	resistance = effect.owner function_3c54ae98(var_67e2281d);
	if(is_true(var_756fda07.var_857e12ae))
	{
		resistance = 0;
	}
	if(var_67e2281d == 7)
	{
		resistance = 0;
	}
	return resistance;
}

/*
	Name: function_f9ca1b6a
	Namespace: status_effect
	Checksum: 0x50082B1E
	Offset: 0x22B8
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f9ca1b6a(var_756fda07)
{
	effect = self;
	resistance = effect function_a6613b51(var_756fda07);
	maxduration = int(var_756fda07.var_ca171ecc * (1 - resistance));
	return maxduration;
}

/*
	Name: function_7d17822
	Namespace: status_effect
	Checksum: 0x155CDF94
	Offset: 0x2338
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7d17822(var_df1e8764)
{
	return var_df1e8764 < 9;
}

/*
	Name: function_7505baeb
	Namespace: status_effect
	Checksum: 0xF49C99F8
	Offset: 0x2358
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_7505baeb(var_5c980521)
{
	level.var_90391bcc = var_5c980521;
}

/*
	Name: function_86c0eb67
	Namespace: status_effect
	Checksum: 0xE3405FAF
	Offset: 0x2380
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function function_86c0eb67(status_effect, var_3bc85d80)
{
	if(!isdefined(level.var_90391bcc))
	{
		return;
	}
	[[level.var_90391bcc]](status_effect, var_3bc85d80);
}

/*
	Name: function_4aac137f
	Namespace: status_effect
	Checksum: 0xCDC782
	Offset: 0x23C8
	Size: 0xD0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4aac137f(var_19201a97, var_d9ad36fc)
{
	gametime = level.time;
	endtime = function_2ba2756c(var_d9ad36fc);
	isactive = function_2ba2756c(var_d9ad36fc) > gametime;
	if(!isactive)
	{
		return 0;
	}
	if(!isdefined(self.var_121392a1[var_d9ad36fc]) || !isdefined(self.var_121392a1[var_d9ad36fc].var_4b22e697) || !isdefined(var_19201a97))
	{
		return 0;
	}
	return self.var_121392a1[var_d9ad36fc].var_4b22e697 == var_19201a97;
}

