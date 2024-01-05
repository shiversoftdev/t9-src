#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

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
function private register_status_effect(status_effect_type)
{
	if(!isdefined(level._status_effects))
	{
		level._status_effects = [];
	}
	if(!isdefined(level._status_effects[status_effect_type]))
	{
		level._status_effects[status_effect_type] = spawnstruct();
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
	if(!isdefined(var_756fda07.setype))
	{
		var_756fda07.setype = 0;
	}
	register_status_effect(var_756fda07.setype);
	level.var_233471d2[var_756fda07.setype] = var_756fda07;
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
		if(function_7d17822(self.setype))
		{
			self.owner function_89ae38c1(self.namehash);
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
		self [[level._status_effects[self.setype].var_a4c649a2]]();
		self.owner.var_121392a1[self.var_18d16a6b] = undefined;
		self notify(#"endstatuseffect");
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
function function_e2bff3ce(status_effect_type, weapon, applicant)
{
	if(isdefined(level.var_233471d2[status_effect_type]))
	{
		self status_effect_apply(level.var_233471d2[status_effect_type], weapon, applicant);
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
function private function_91a9db75(sourcetype, setype, namehash)
{
	if(!isdefined(self.var_121392a1))
	{
		self.var_121392a1 = [];
	}
	if(!isdefined(self.var_121392a1[sourcetype]))
	{
		self.var_121392a1[sourcetype] = spawnstruct();
	}
	if(!isdefined(self.var_121392a1[sourcetype].duration))
	{
		self.var_121392a1[sourcetype].duration = 0;
	}
	if(!isdefined(self.var_121392a1[sourcetype].endtime))
	{
		self.var_121392a1[sourcetype].endtime = 0;
	}
	if(!isdefined(self.var_121392a1[sourcetype].owner))
	{
		self.var_121392a1[sourcetype].owner = self;
	}
	self.var_121392a1[sourcetype].setype = setype;
	self.var_121392a1[sourcetype].namehash = namehash;
	self.var_121392a1[sourcetype].var_18d16a6b = sourcetype;
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
function status_effect_apply(var_756fda07, weapon, applicant, isadditive, var_ab5b905e, var_894859a2, location)
{
	/#
		assert(isdefined(var_756fda07.setype));
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
	register_status_effect(var_756fda07.setype);
	var_f8f8abaa = 0;
	if(isdefined(applicant) && applicant != self && !self function_4aac137f(applicant, var_756fda07.var_18d16a6b))
	{
		var_b7a9b136 = 1;
		if(isdefined(var_756fda07.var_2e4a8800))
		{
			var_8725a10d = globallogic_score::function_3cbc4c6c(var_756fda07.var_2e4a8800);
		}
		if(isdefined(var_8725a10d) && isdefined(var_8725a10d.var_3e3b11a9))
		{
			resistance = function_3c54ae98(var_756fda07.setype);
			if(var_8725a10d.var_3e3b11a9 < resistance)
			{
				var_b7a9b136 = 0;
			}
		}
		if(var_b7a9b136 && util::function_fbce7263(self.team, applicant.team))
		{
			if(isplayer(applicant))
			{
				applicant thread globallogic_score::function_969ea48d(var_756fda07, weapon);
			}
		}
		var_f8f8abaa = 1;
	}
	self function_91a9db75(var_756fda07.var_18d16a6b, var_756fda07.setype, var_756fda07.namehash);
	self function_52969ffe(var_756fda07);
	self callback::callback(#"on_status_effect", var_756fda07);
	var_275b5e13 = function_2ba2756c(var_756fda07.var_18d16a6b) > level.time;
	var_b0144580 = applicant === self;
	if(!isdefined(isadditive))
	{
		isadditive = getdvarint(#"hash_6ce4aefbba354e2d", 0);
	}
	effect = self.var_121392a1[var_756fda07.var_18d16a6b];
	effect.var_4f6b79a4 = var_756fda07;
	if(isdefined(location))
	{
		effect.location = location;
	}
	else if(isdefined(applicant))
	{
		effect.location = applicant.origin;
	}
	effect handle_sounds(var_756fda07);
	var_4df0ea83 = 1;
	if(isdefined(var_756fda07.var_4df0ea83))
	{
		var_4df0ea83 = var_756fda07.var_4df0ea83;
	}
	if(var_4df0ea83)
	{
		if(isadditive && var_756fda07.setype != 4)
		{
			effect function_57f33b96(var_756fda07, var_b0144580, var_ab5b905e, applicant, var_f8f8abaa, weapon);
		}
		else
		{
			effect update_duration(var_756fda07, var_b0144580, var_ab5b905e, applicant, var_f8f8abaa, weapon);
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
	if(isdefined(level._status_effects[var_756fda07.setype].apply))
	{
		effect.var_4b22e697 = applicant;
		effect.var_3d1ed4bd = weapon;
		effect thread [[level._status_effects[var_756fda07.setype].apply]](var_756fda07, weapon, applicant);
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
	if(function_7d17822(var_756fda07.setype))
	{
		self thread function_47cad1aa(var_756fda07, isadditive);
	}
	if(isdefined(weapon) && isdefined(applicant) && applicant != self && is_true(var_756fda07.var_3469b797))
	{
		var_594a2d34 = isdefined(weapon) && isdefined(weapon.var_965cc0b3) && weapon.var_965cc0b3;
		applicant util::show_hit_marker(0, var_594a2d34);
	}
	if(isdefined(level._status_effects[var_756fda07.setype].end))
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
	effect endon(#"endstatuseffect");
	self endon(#"death");
	while(isdefined(effect.var_b5207a36) && isalive(self))
	{
		if(isdefined(level.var_d0ad09c5))
		{
			self [[level.var_d0ad09c5]](effect);
		}
		if(self gestures::play_gesture(effect.var_b5207a36, undefined, 0))
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
function private function_47cad1aa(var_756fda07, isadditive)
{
	var_18d16a6b = var_756fda07.var_18d16a6b;
	setype = var_756fda07.setype;
	if(isdefined(self.var_121392a1[var_18d16a6b]) && isdefined(self.var_121392a1[var_18d16a6b].duration))
	{
		if(setype != 4)
		{
			if(isplayer(self))
			{
				/#
					assert(!isfloat(self.var_121392a1[var_18d16a6b].duration), "");
				#/
				self applystatuseffect(var_756fda07.namehash, self.var_121392a1[var_18d16a6b].duration, isadditive);
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
		self endstatuseffect(sename);
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
function private function_6bf7c434(status_effect_type)
{
	if(isdefined(self.var_b5207a36))
	{
		self.owner stopgestureviewmodel(self.var_b5207a36, 1, 0);
		self.var_b5207a36 = undefined;
	}
	if(isdefined(self.var_4b22e697))
	{
		self.var_4b22e697 globallogic_score::allow_old_indexs(self.var_4f6b79a4);
	}
	if(isdefined(level._status_effects) && isdefined(level._status_effects[status_effect_type]) && isdefined(level._status_effects[status_effect_type].end))
	{
		self thread [[level._status_effects[status_effect_type].end]]();
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
	self notify(#"endstatuseffect");
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
	if(0 && self.setype == 6)
	{
		return;
	}
	self notify(#"endwaiter");
	self endon(#"endwaiter", #"endstatuseffect");
	self.owner endon(#"disconnect");
	while(self.endtime > level.time)
	{
		waitframe(1);
	}
	if(isdefined(self))
	{
		self thread function_6bf7c434(self.setype);
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
function function_408158ef(setype, var_18d16a6b)
{
	if(isdefined(self.var_121392a1))
	{
		if(isdefined(level._status_effects[setype].end))
		{
			effect = self.var_121392a1[var_18d16a6b];
			if(isdefined(effect))
			{
				effect function_6bf7c434(setype);
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
			if(isdefined(level._status_effects[effect.setype].end))
			{
				effect function_6bf7c434(effect.setype);
			}
		}
	}
}

/*
	Name: handle_sounds
	Namespace: status_effect
	Checksum: 0x13981522
	Offset: 0x1508
	Size: 0x11E
	Parameters: 1
	Flags: Linked, Private
*/
function private handle_sounds(var_756fda07)
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
function function_7f14a56f(status_effect_type)
{
	if(!isdefined(self.var_121392a1))
	{
		self.var_121392a1 = [];
	}
	var_e2997f02 = 0;
	foreach(effect in self.var_121392a1)
	{
		if(effect.setype == 7)
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
function function_4617032e(status_effect_type)
{
	if(!isdefined(self.var_121392a1))
	{
		self.var_121392a1 = [];
	}
	foreach(effect in self.var_121392a1)
	{
		if(effect.setype == status_effect_type)
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
function private function_40293e80(status_effect_type, weapon)
{
	if(status_effect_type == 3)
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
	Name: update_duration
	Namespace: status_effect
	Checksum: 0xEF3F82A6
	Offset: 0x18E0
	Size: 0x2BE
	Parameters: 6
	Flags: Linked, Private
*/
function private update_duration(var_756fda07, var_b0144580, var_ab5b905e, applicant, var_f8f8abaa, weapon)
{
	setype = var_756fda07.setype;
	resistance = self function_a6613b51(var_756fda07);
	var_fb887b00 = (var_b0144580 ? self.owner function_37683813() : 1);
	if(var_b0144580 && isdefined(weapon) && is_true(weapon.var_83b1dc1))
	{
		var_fb887b00 = 1;
	}
	if(resistance > 0 && isdefined(applicant) && var_f8f8abaa && var_756fda07.var_42c00474 === 1 && !var_b0144580 && setype !== 0)
	{
		applicant damagefeedback::update(undefined, undefined, function_40293e80(setype, weapon));
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
function private function_57f33b96(var_756fda07, var_b0144580, var_ab5b905e, applicant, var_f8f8abaa, weapon)
{
	setype = var_756fda07.setype;
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
	if(resistance > 0 && setype != 0 && setype != 3 && isdefined(applicant) && var_f8f8abaa && var_756fda07.var_42c00474 === 1 && !var_b0144580)
	{
		applicant damagefeedback::update(undefined, undefined, function_40293e80(setype, weapon), weapon, self.owner);
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
	self notify(#"loadoutwatcher");
	self endon(#"loadoutwatcher", #"endstatuseffect");
	self.owner endon(#"death", #"disconnect");
	var_eff9d37f = self.owner function_3c54ae98(self.setype);
	while(true)
	{
		self.owner waittill(#"loadout_given");
		newres = self.owner function_3c54ae98(self.setype);
		currtime = level.time;
		if(newres != var_eff9d37f)
		{
			timeremaining = self.endtime - currtime;
			timeremaining = timeremaining * newres;
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
	self endon(#"deathwatcher", #"endstatuseffect");
	self.owner waittill(#"death");
	if(isdefined(self) && isdefined(level._status_effects[self.setype].death))
	{
		self [[level._status_effects[self.setype].death]]();
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
function function_3c54ae98(status_effect_type)
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
	resistance = self getplayerresistance(status_effect_type);
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
	setype = var_756fda07.setype;
	resistance = effect.owner function_3c54ae98(setype);
	if(is_true(var_756fda07.var_857e12ae))
	{
		resistance = 0;
	}
	if(setype == 7)
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
function private function_7d17822(status_effect_type)
{
	return status_effect_type < 9;
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
function private function_4aac137f(var_19201a97, sourcetype)
{
	gametime = level.time;
	endtime = function_2ba2756c(sourcetype);
	isactive = function_2ba2756c(sourcetype) > gametime;
	if(!isactive)
	{
		return 0;
	}
	if(!isdefined(self.var_121392a1[sourcetype]) || !isdefined(self.var_121392a1[sourcetype].var_4b22e697) || !isdefined(var_19201a97))
	{
		return 0;
	}
	return self.var_121392a1[sourcetype].var_4b22e697 == var_19201a97;
}

