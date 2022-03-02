#using script_2255a7ad3edc838f;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\gameobjects_shared.gsc;

#namespace namespace_eed5a117;

/*
	Name: function_70a657d8
	Namespace: namespace_eed5a117
	Checksum: 0x730733F0
	Offset: 0x98
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!isdefined(level.gametype))
	{
		return;
	}
	switch(level.gametype)
	{
		default:
		{
			function_9cefb01();
			break;
		}
	}
}

/*
	Name: function_9cefb01
	Namespace: namespace_eed5a117
	Checksum: 0xF622673F
	Offset: 0x100
	Size: 0x27C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9cefb01()
{
	bot_action::register_action(#"melee", &function_97bc2873, &melee);
	bot_action::register_action(#"reload", &function_bebdaa6b, &reload);
	bot_action::register_action(#"hash_3d30e77358b222bb", &function_6ba9f861, &function_22e246dd);
	bot_action::register_action(#"hash_7a087406b369e0b2", &function_9575b14a, &function_5be2fa6e);
	bot_action::register_action(#"hash_f2de979f0460355", &function_9f7ee32b, &function_f60b48cd);
	bot_action::register_action(#"hash_760170d9e327711f", &function_d31a5b9a, &function_3aab44a3);
	bot_action::register_action(#"hash_432f1b491c530184", &function_96340252, &function_c49cdd53);
	if((isdefined(getgametypesetting(#"hash_7ab596bf4932361d")) ? getgametypesetting(#"hash_7ab596bf4932361d") : 0) || getdvarint(#"hash_53e6eeca9f56d0bf", 0))
	{
		bot_action::register_action(#"revive", &function_5040c5b8, &revive);
	}
}

/*
	Name: function_bebdaa6b
	Namespace: namespace_eed5a117
	Checksum: 0x7EDEE846
	Offset: 0x388
	Size: 0x460
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bebdaa6b(var_b594a2cd)
{
	weapon = self getcurrentweapon();
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = function_a16a090d(weapon);
	#/
	if(weapon.clipsize <= 0)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_6cc185a34e14aed8";
		#/
		return undefined;
	}
	if(weapon.iscliponly)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_4e551057548eeffb";
		#/
		return undefined;
	}
	clipammo = self getweaponammoclip(weapon);
	stockammo = self getweaponammostock(weapon);
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = ((((#"hash_649eec90cdc06cdd" + clipammo) + "") + weapon.clipsize) + "") + stockammo;
	#/
	if(clipammo >= weapon.clipsize)
	{
		return undefined;
	}
	var_1cc50542 = clipammo / weapon.clipsize;
	var_7b03547c = clipammo < 10 && var_1cc50542 < 0.4;
	if(var_7b03547c)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_3e095e0ff2b45cd";
		#/
	}
	if(self isreloading())
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_53eccddbe5a99045";
		#/
		if(var_7b03547c)
		{
			return 95;
		}
	}
	if(stockammo <= 0)
	{
		return undefined;
	}
	if(clipammo > 0 && self.combatstate != #"hash_25a4754a6175a242")
	{
		if(self bot_action::in_combat(var_b594a2cd) || !var_7b03547c)
		{
			return undefined;
		}
	}
	if(self bot_action::function_a43bc7e2(var_b594a2cd) || self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::flashed(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd))
	{
		return undefined;
	}
	/#
		if(getdvarint(#"hash_1a9061866669d862", 0))
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_3e0a83260046323b";
			#/
			return undefined;
		}
		if(getdvarint(#"hash_7140b31f7170f18b", 0))
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = function_9e72a96(#"hash_7140b31f7170f18b") + "";
			#/
			return undefined;
		}
		if(is_true(self.bot.var_458ddbc0[0]))
		{
			/#
				var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_3eae9d22b23d42b0";
			#/
			return undefined;
		}
	#/
	return 95;
}

/*
	Name: reload
	Namespace: namespace_eed5a117
	Checksum: 0xE05A852C
	Offset: 0x7F0
	Size: 0x8E
	Parameters: 1
	Flags: Linked, Private
*/
function private reload(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	while(true)
	{
		if(!self isreloading())
		{
			self bottapbutton(4);
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_6ba9f861
	Namespace: namespace_eed5a117
	Checksum: 0x42222A9D
	Offset: 0x888
	Size: 0x1C8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6ba9f861(var_b594a2cd)
{
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_51e16bdecd933178" + self function_e8e1d88e();
	#/
	if(!isdefined(self.bot.var_538135ed))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_72064563ae580ae7";
		#/
		return undefined;
	}
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_4d12c107453cb454";
	#/
	if(self bot_action::function_a43bc7e2(var_b594a2cd) || self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd) || self bot_action::function_ed7b2f42(var_b594a2cd))
	{
		return undefined;
	}
	object = self.bot.var_538135ed.gameobject;
	trigger = object.trigger;
	if(!isdefined(trigger) || !self touching_trigger(trigger))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_56cc687e292770eb";
		#/
		return undefined;
	}
	return 100;
}

/*
	Name: function_22e246dd
	Namespace: namespace_eed5a117
	Checksum: 0xCDD74769
	Offset: 0xA58
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_22e246dd(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	object = self.bot.var_538135ed.gameobject;
	self.bot.var_9d03fb75 = gettime() + (int(2.5 * 1000));
	self.bot.var_fad934a1 = gettime() + (int(12 * 1000));
	self function_29904346(self.bot.var_538135ed.gameobject);
}

/*
	Name: function_9575b14a
	Namespace: namespace_eed5a117
	Checksum: 0x70AFA5C
	Offset: 0xB60
	Size: 0x28E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9575b14a(var_b594a2cd)
{
	if(!isdefined(level.var_578f7c6d))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_7e0fd1a337ef84d4";
		#/
		return undefined;
	}
	if(self bot_action::function_a43bc7e2(var_b594a2cd) || self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::flashed(var_b594a2cd) || self bot_action::in_combat(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd) || self bot_action::function_ed7b2f42(var_b594a2cd))
	{
		return undefined;
	}
	ents = getentitiesinradius(self.origin, 96, 4);
	weapon = level.var_578f7c6d.weapon;
	jammer = undefined;
	foreach(ent in ents)
	{
		if(ent.team == self.team || ent.item != weapon)
		{
			continue;
		}
		jammer = ent;
		break;
	}
	if(!isdefined(jammer) || !isdefined(jammer.enemytrigger) || !self istouching(jammer.enemytrigger))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_5c3f03b58ee2c60d";
		#/
		return undefined;
	}
	var_b594a2cd.jammer = jammer;
	return 100;
}

/*
	Name: function_5be2fa6e
	Namespace: namespace_eed5a117
	Checksum: 0xDFD40B8A
	Offset: 0xDF8
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5be2fa6e(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	while(true)
	{
		jammer = var_b594a2cd.jammer;
		if(isdefined(jammer.enemytrigger))
		{
			self use_trigger(jammer.enemytrigger);
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_5040c5b8
	Namespace: namespace_eed5a117
	Checksum: 0x50ADC2D8
	Offset: 0xEA8
	Size: 0x1A8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5040c5b8(var_b594a2cd)
{
	revivetarget = self bot::get_revive_target();
	if(!isdefined(revivetarget))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = "";
		#/
		return undefined;
	}
	if(self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd) || self bot_action::function_ed7b2f42(var_b594a2cd))
	{
		return 0;
	}
	var_b594a2cd.revivetarget = revivetarget;
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_7c7cb9edd6407d3a" + revivetarget.name;
	#/
	if(!isdefined(revivetarget.revivetrigger))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_5045506c17e1ba97";
		#/
		return undefined;
	}
	if(!self istouching(revivetarget.revivetrigger))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_bd44498ec7dd434";
		#/
		return undefined;
	}
	return 100;
}

/*
	Name: revive
	Namespace: namespace_eed5a117
	Checksum: 0x3860F89B
	Offset: 0x1058
	Size: 0x130
	Parameters: 1
	Flags: Linked, Private
*/
function private revive(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	self.bot.var_6bea1d82 = 1;
	if(!isdefined(self.bot.difficulty) || is_true(self.bot.difficulty.allowcrouch))
	{
		self.bot.var_ce28855b = 1;
	}
	revivee = var_b594a2cd.revivetarget;
	while(true)
	{
		self.bot.var_87751145 = revivee.origin;
		self waittill(#"hash_77f2882ff9140e86");
		if(self botgetlookdot() > 0.8)
		{
			self bottapbutton(3);
		}
	}
}

/*
	Name: function_97bc2873
	Namespace: namespace_eed5a117
	Checksum: 0xB18CA223
	Offset: 0x1190
	Size: 0x5AA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_97bc2873(var_b594a2cd)
{
	weapon = self getcurrentweapon();
	/#
		var_b594a2cd.debug[var_b594a2cd.debug.size] = function_a16a090d(weapon);
	#/
	if(self ismeleeing())
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_53eccddbe5a99045";
		#/
		return 100;
	}
	if(!weapon.ismeleeweapon && weapon.type != #"melee")
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_5a434ba5ce81ed4b";
		#/
		return undefined;
	}
	if(self bot_action::flashed(var_b594a2cd) || self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd))
	{
		return undefined;
	}
	if(self bot_action::function_ed7b2f42(var_b594a2cd) && self.bot.traversal.type != #"drop")
	{
		return undefined;
	}
	if(isdefined(self.bot.var_3edc9d4d))
	{
		point = self.bot.var_3edc9d4d;
		point = (point[0], point[1], self.origin[2] + self getplayerviewheight());
		var_b594a2cd.var_bd773dde = point;
		return 96;
	}
	var_b594a2cd.var_bd773dde = undefined;
	if(!(!isdefined(self.bot.difficulty) || is_true(self.bot.difficulty.allowmelee)))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_6b201a2b19d09fd";
		#/
		return undefined;
	}
	if(!(!isdefined(self.bot.var_9376be2e) || self.bot.var_9376be2e <= gettime()))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_499c1441b9e70c21";
		#/
		return undefined;
	}
	if(!self.bot.var_2cf887f8)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	if(isvehicle(self.enemy))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_18edaf9b6eee19a1";
		#/
		return undefined;
	}
	if(isplayer(self.enemy) && self.enemy isinvehicle() && !self.enemy isremotecontrolling())
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_28145be29cdebb73";
		#/
	}
	if(self.bot.enemydist > weapon.var_bfbec33f * 0.95)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_1d62b754bc2de90";
		#/
		return undefined;
	}
	fwd = anglestoforward(self getplayerangles());
	enemydir = vectornormalize(self.enemy.origin - self.origin);
	var_34e02165 = vectordot(fwd, enemydir);
	if(var_34e02165 < 0.7)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_47cdd5472dea843c";
		#/
		return undefined;
	}
	if(randomfloat(1) > 0.75)
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_202a436ac21976ce";
		#/
		self.bot.var_9376be2e = gettime() + (int(3 * 1000));
		return undefined;
	}
	return 96;
}

/*
	Name: melee
	Namespace: namespace_eed5a117
	Checksum: 0xD009AB35
	Offset: 0x1748
	Size: 0x15E
	Parameters: 1
	Flags: Linked, Private
*/
function private melee(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	while(true)
	{
		var_bd773dde = var_b594a2cd.var_bd773dde;
		self.bot.var_87751145 = var_bd773dde;
		if(!self ismeleeing())
		{
			self bottapbutton(2);
			self waittill(#"hash_77f2882ff9140e86");
		}
		while(self ismeleeing())
		{
			self bottapbutton(2);
			if(isdefined(var_bd773dde) && distance2dsquared(self.origin, var_bd773dde < 15))
			{
				self.bot.var_87751145 = undefined;
			}
			self waittill(#"hash_77f2882ff9140e86");
		}
		self.bot.var_9376be2e = gettime() + (int(3 * 1000));
	}
}

/*
	Name: function_d31a5b9a
	Namespace: namespace_eed5a117
	Checksum: 0x2B2AFE7B
	Offset: 0x18B0
	Size: 0xD0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d31a5b9a(var_b594a2cd)
{
	if(!isdefined(self.bot.var_ad331541))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_72617b03a99ed6a3";
		#/
		return undefined;
	}
	if(self bot_action::function_a43bc7e2(var_b594a2cd) || self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd))
	{
		return undefined;
	}
	return 100;
}

/*
	Name: function_3aab44a3
	Namespace: namespace_eed5a117
	Checksum: 0xB87AF8E
	Offset: 0x1988
	Size: 0x1B0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3aab44a3(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	center = self.bot.var_ad331541 getcentroid();
	weapon = self getcurrentweapon();
	meleeweapon = weapon.ismeleeweapon || weapon.type == #"melee";
	if(!meleeweapon || isdefined(self.bot.traversal))
	{
		self.bot.var_ad331541 dodamage(10000, center, self, undefined, "MOD_MELEE_WEAPON_BUTT");
		return;
	}
	while(true)
	{
		self.bot.var_87751145 = center;
		self waittill(#"hash_77f2882ff9140e86");
		if(!self ismeleeing() && self botgetlookdot() >= 0.7)
		{
			self bottapbutton(2);
		}
	}
}

/*
	Name: function_96340252
	Namespace: namespace_eed5a117
	Checksum: 0x1EEF0D37
	Offset: 0x1B40
	Size: 0x138
	Parameters: 1
	Flags: Linked, Private
*/
function private function_96340252(var_b594a2cd)
{
	if(isdefined(self.bot.var_87a04600) && self.bot.var_87a04600 isusable())
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"capturing";
		#/
		return 100;
	}
	if(!isdefined(self.bot.var_510b1057))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_45918de363b9f172";
		#/
		return undefined;
	}
	if(self bot_action::function_a43bc7e2(var_b594a2cd) || self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd))
	{
		return undefined;
	}
	return 100;
}

/*
	Name: function_c49cdd53
	Namespace: namespace_eed5a117
	Checksum: 0x6B58FFB4
	Offset: 0x1C80
	Size: 0x1A8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c49cdd53(var_b594a2cd)
{
	self endoncallback(&function_84f889a2, #"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	crate = undefined;
	while(true)
	{
		var_7485904b = self.bot.var_510b1057;
		if(isdefined(var_7485904b) && var_7485904b !== crate)
		{
			crate = var_7485904b;
			self.bot.var_87a04600 = crate;
			self.bot.var_87751145 = crate getcentroid();
		}
		self waittill(#"hash_77f2882ff9140e86");
		if(!isdefined(crate) || !crate isusable())
		{
			continue;
		}
		if(!self botgetlookdot() >= 0.5)
		{
			continue;
		}
		self bottapbutton(3);
		if(self usebuttonpressed() && !isdefined(crate.useent.var_c56ec411))
		{
			crate useby(self);
		}
	}
}

/*
	Name: function_84f889a2
	Namespace: namespace_eed5a117
	Checksum: 0xF3E5D33A
	Offset: 0x1E30
	Size: 0x26
	Parameters: 1
	Flags: Linked, Private
*/
function private function_84f889a2(notifyhash)
{
	if(isdefined(self.bot))
	{
		self.bot.var_87a04600 = undefined;
	}
}

/*
	Name: function_9f7ee32b
	Namespace: namespace_eed5a117
	Checksum: 0xEA259934
	Offset: 0x1E60
	Size: 0x1A8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9f7ee32b(var_b594a2cd)
{
	target = self.bot.objective.info.target;
	if(!isdefined(target) || !isdefined(target.triggertype) || target.triggertype != #"use" || !target gameobjects::can_interact_with(self))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_7c6d555093009c78";
		#/
		return undefined;
	}
	if(self bot_action::function_a43bc7e2(var_b594a2cd) || self bot_action::function_ebb8205b(var_b594a2cd) || self bot_action::function_a0b0f487(var_b594a2cd) || self bot_action::function_2c3ea0c6(var_b594a2cd) || self bot_action::in_vehicle(var_b594a2cd))
	{
		return undefined;
	}
	if(!isdefined(target.trigger) || !self touching_trigger(target.trigger))
	{
		/#
			var_b594a2cd.debug[var_b594a2cd.debug.size] = #"hash_56cc687e292770eb";
		#/
		return undefined;
	}
	return 100;
}

/*
	Name: function_f60b48cd
	Namespace: namespace_eed5a117
	Checksum: 0x17497548
	Offset: 0x2010
	Size: 0x90
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f60b48cd(var_b594a2cd)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	while(true)
	{
		object = self.bot.objective.info.target;
		self function_29904346(object);
	}
}

/*
	Name: use_trigger
	Namespace: namespace_eed5a117
	Checksum: 0x29FAEB2
	Offset: 0x20A8
	Size: 0x118
	Parameters: 1
	Flags: Linked, Private
*/
function private use_trigger(trigger)
{
	lookat = trigger function_fb4cc224();
	while(true)
	{
		if(lookat)
		{
			center = trigger getcentroid();
			self.bot.var_87751145 = center;
		}
		self waittill(#"hash_77f2882ff9140e86");
		if(!isdefined(trigger))
		{
			return;
		}
		if(lookat && !!self botgetlookdot() >= 0.5)
		{
			continue;
		}
		self bottapbutton(3);
		if(self usebuttonpressed())
		{
			trigger useby(self);
		}
	}
}

/*
	Name: touching_trigger
	Namespace: namespace_eed5a117
	Checksum: 0x376E1E0D
	Offset: 0x21C8
	Size: 0x9A
	Parameters: 1
	Flags: Linked, Private
*/
function private touching_trigger(trigger)
{
	if(!self istouching(trigger))
	{
		return 0;
	}
	if(trigger.classname != #"trigger_radius_use")
	{
		return 1;
	}
	radius = trigger getmaxs()[0] + -32;
	return distance2dsquared(trigger.origin, self.origin) < (radius * radius);
}

/*
	Name: function_29904346
	Namespace: namespace_eed5a117
	Checksum: 0x3E0CFE6
	Offset: 0x2270
	Size: 0x178
	Parameters: 1
	Flags: Linked, Private
*/
function private function_29904346(object)
{
	trigger = object.trigger;
	lookat = trigger function_fb4cc224();
	while(true)
	{
		if(lookat)
		{
			center = trigger getcentroid();
			self.bot.var_87751145 = center;
		}
		self waittill(#"hash_77f2882ff9140e86");
		if(!isdefined(object) || !isdefined(trigger))
		{
			return;
		}
		if(lookat && !!self botgetlookdot() >= 0.5)
		{
			continue;
		}
		self bottapbutton(3);
		if(self usebuttonpressed() && !is_true(object.inuse))
		{
			if(!isdefined(self.claimtrigger) || self.claimtrigger != trigger)
			{
				trigger useby(self);
			}
		}
	}
}

