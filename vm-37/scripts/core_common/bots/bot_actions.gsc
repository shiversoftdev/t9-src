#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\bots\bot.gsc;

#namespace bot_actions;

/*
	Name: function_70a657d8
	Namespace: bot_actions
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
	Namespace: bot_actions
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
	if((isdefined(getgametypesetting(#"allowlaststandforactiveclients")) ? getgametypesetting(#"allowlaststandforactiveclients") : 0) || getdvarint(#"g_allowlaststandforactiveclients", 0))
	{
		bot_action::register_action(#"revive", &function_5040c5b8, &revive);
	}
}

/*
	Name: function_bebdaa6b
	Namespace: bot_actions
	Checksum: 0x7EDEE846
	Offset: 0x388
	Size: 0x460
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bebdaa6b(actionparams)
{
	weapon = self getcurrentweapon();
	/#
		actionparams.debug[actionparams.debug.size] = function_a16a090d(weapon);
	#/
	if(weapon.clipsize <= 0)
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_6cc185a34e14aed8";
		#/
		return undefined;
	}
	if(weapon.iscliponly)
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_4e551057548eeffb";
		#/
		return undefined;
	}
	clipammo = self getweaponammoclip(weapon);
	stockammo = self getweaponammostock(weapon);
	/#
		actionparams.debug[actionparams.debug.size] = ((((#"hash_649eec90cdc06cdd" + clipammo) + "") + weapon.clipsize) + "") + stockammo;
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
			actionparams.debug[actionparams.debug.size] = #"hash_3e095e0ff2b45cd";
		#/
	}
	if(self isreloading())
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"in progress";
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
		if(self bot_action::in_combat(actionparams) || !var_7b03547c)
		{
			return undefined;
		}
	}
	if(self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::flashed(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams))
	{
		return undefined;
	}
	/#
		if(getdvarint(#"hash_1a9061866669d862", 0))
		{
			/#
				actionparams.debug[actionparams.debug.size] = #"hash_3e0a83260046323b";
			#/
			return undefined;
		}
		if(getdvarint(#"hash_7140b31f7170f18b", 0))
		{
			/#
				actionparams.debug[actionparams.debug.size] = function_9e72a96(#"hash_7140b31f7170f18b") + "";
			#/
			return undefined;
		}
		if(is_true(self.bot.var_458ddbc0[0]))
		{
			/#
				actionparams.debug[actionparams.debug.size] = #"hash_3eae9d22b23d42b0";
			#/
			return undefined;
		}
	#/
	return 95;
}

/*
	Name: reload
	Namespace: bot_actions
	Checksum: 0xE05A852C
	Offset: 0x7F0
	Size: 0x8E
	Parameters: 1
	Flags: Linked, Private
*/
function private reload(actionparams)
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
	Namespace: bot_actions
	Checksum: 0x42222A9D
	Offset: 0x888
	Size: 0x1C8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6ba9f861(actionparams)
{
	/#
		actionparams.debug[actionparams.debug.size] = #"hash_51e16bdecd933178" + self function_e8e1d88e();
	#/
	if(!isdefined(self.bot.var_538135ed))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_72064563ae580ae7";
		#/
		return undefined;
	}
	/#
		actionparams.debug[actionparams.debug.size] = #"hash_4d12c107453cb454";
	#/
	if(self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams) || self bot_action::function_ed7b2f42(actionparams))
	{
		return undefined;
	}
	object = self.bot.var_538135ed.gameobject;
	trigger = object.trigger;
	if(!isdefined(trigger) || !self touching_trigger(trigger))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_56cc687e292770eb";
		#/
		return undefined;
	}
	return 100;
}

/*
	Name: function_22e246dd
	Namespace: bot_actions
	Checksum: 0xCDD74769
	Offset: 0xA58
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_22e246dd(actionparams)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	object = self.bot.var_538135ed.gameobject;
	self.bot.var_9d03fb75 = gettime() + (int(2.5 * 1000));
	self.bot.var_fad934a1 = gettime() + (int(12 * 1000));
	self use_gameobject(self.bot.var_538135ed.gameobject);
}

/*
	Name: function_9575b14a
	Namespace: bot_actions
	Checksum: 0x70AFA5C
	Offset: 0xB60
	Size: 0x28E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9575b14a(actionparams)
{
	if(!isdefined(level.var_578f7c6d))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_7e0fd1a337ef84d4";
		#/
		return undefined;
	}
	if(self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::flashed(actionparams) || self bot_action::in_combat(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams) || self bot_action::function_ed7b2f42(actionparams))
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
			actionparams.debug[actionparams.debug.size] = #"hash_5c3f03b58ee2c60d";
		#/
		return undefined;
	}
	actionparams.jammer = jammer;
	return 100;
}

/*
	Name: function_5be2fa6e
	Namespace: bot_actions
	Checksum: 0xDFD40B8A
	Offset: 0xDF8
	Size: 0xA6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5be2fa6e(actionparams)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	while(true)
	{
		jammer = actionparams.jammer;
		if(isdefined(jammer.enemytrigger))
		{
			self use_trigger(jammer.enemytrigger);
		}
		self waittill(#"hash_77f2882ff9140e86");
	}
}

/*
	Name: function_5040c5b8
	Namespace: bot_actions
	Checksum: 0x50ADC2D8
	Offset: 0xEA8
	Size: 0x1A8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5040c5b8(actionparams)
{
	revivetarget = self bot::get_revive_target();
	if(!isdefined(revivetarget))
	{
		/#
			actionparams.debug[actionparams.debug.size] = "";
		#/
		return undefined;
	}
	if(self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams) || self bot_action::function_ed7b2f42(actionparams))
	{
		return 0;
	}
	actionparams.revivetarget = revivetarget;
	/#
		actionparams.debug[actionparams.debug.size] = #"hash_7c7cb9edd6407d3a" + revivetarget.name;
	#/
	if(!isdefined(revivetarget.revivetrigger))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_5045506c17e1ba97";
		#/
		return undefined;
	}
	if(!self istouching(revivetarget.revivetrigger))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_bd44498ec7dd434";
		#/
		return undefined;
	}
	return 100;
}

/*
	Name: revive
	Namespace: bot_actions
	Checksum: 0x3860F89B
	Offset: 0x1058
	Size: 0x130
	Parameters: 1
	Flags: Linked, Private
*/
function private revive(actionparams)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	self.bot.var_6bea1d82 = 1;
	if(!isdefined(self.bot.difficulty) || is_true(self.bot.difficulty.allowcrouch))
	{
		self.bot.var_ce28855b = 1;
	}
	revivee = actionparams.revivetarget;
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
	Namespace: bot_actions
	Checksum: 0xB18CA223
	Offset: 0x1190
	Size: 0x5AA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_97bc2873(actionparams)
{
	weapon = self getcurrentweapon();
	/#
		actionparams.debug[actionparams.debug.size] = function_a16a090d(weapon);
	#/
	if(self ismeleeing())
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"in progress";
		#/
		return 100;
	}
	if(!weapon.ismeleeweapon && weapon.type != #"melee")
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_5a434ba5ce81ed4b";
		#/
		return undefined;
	}
	if(self bot_action::flashed(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams))
	{
		return undefined;
	}
	if(self bot_action::function_ed7b2f42(actionparams) && self.bot.traversal.type != #"drop")
	{
		return undefined;
	}
	if(isdefined(self.bot.var_3edc9d4d))
	{
		point = self.bot.var_3edc9d4d;
		point = (point[0], point[1], self.origin[2] + self getplayerviewheight());
		actionparams.var_bd773dde = point;
		return 96;
	}
	actionparams.var_bd773dde = undefined;
	if(!(!isdefined(self.bot.difficulty) || is_true(self.bot.difficulty.allowmelee)))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_6b201a2b19d09fd";
		#/
		return undefined;
	}
	if(!(!isdefined(self.bot.var_9376be2e) || self.bot.var_9376be2e <= gettime()))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_499c1441b9e70c21";
		#/
		return undefined;
	}
	if(!self.bot.var_2cf887f8)
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_233e6d629b2fb642";
		#/
		return undefined;
	}
	if(isvehicle(self.enemy))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_18edaf9b6eee19a1";
		#/
		return undefined;
	}
	if(isplayer(self.enemy) && self.enemy isinvehicle() && !self.enemy isremotecontrolling())
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_28145be29cdebb73";
		#/
	}
	if(self.bot.enemydist > weapon.var_bfbec33f * 0.95)
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_1d62b754bc2de90";
		#/
		return undefined;
	}
	fwd = anglestoforward(self getplayerangles());
	enemydir = vectornormalize(self.enemy.origin - self.origin);
	var_34e02165 = vectordot(fwd, enemydir);
	if(var_34e02165 < 0.7)
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_47cdd5472dea843c";
		#/
		return undefined;
	}
	if(randomfloat(1) > 0.75)
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_202a436ac21976ce";
		#/
		self.bot.var_9376be2e = gettime() + (int(3 * 1000));
		return undefined;
	}
	return 96;
}

/*
	Name: melee
	Namespace: bot_actions
	Checksum: 0xD009AB35
	Offset: 0x1748
	Size: 0x15E
	Parameters: 1
	Flags: Linked, Private
*/
function private melee(actionparams)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	while(true)
	{
		var_bd773dde = actionparams.var_bd773dde;
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
	Namespace: bot_actions
	Checksum: 0x2B2AFE7B
	Offset: 0x18B0
	Size: 0xD0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d31a5b9a(actionparams)
{
	if(!isdefined(self.bot.var_ad331541))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_72617b03a99ed6a3";
		#/
		return undefined;
	}
	if(self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams))
	{
		return undefined;
	}
	return 100;
}

/*
	Name: function_3aab44a3
	Namespace: bot_actions
	Checksum: 0xB87AF8E
	Offset: 0x1988
	Size: 0x1B0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3aab44a3(actionparams)
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
	Namespace: bot_actions
	Checksum: 0x1EEF0D37
	Offset: 0x1B40
	Size: 0x138
	Parameters: 1
	Flags: Linked, Private
*/
function private function_96340252(actionparams)
{
	if(isdefined(self.bot.var_87a04600) && self.bot.var_87a04600 isusable())
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"capturing";
		#/
		return 100;
	}
	if(!isdefined(self.bot.var_510b1057))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_45918de363b9f172";
		#/
		return undefined;
	}
	if(self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams))
	{
		return undefined;
	}
	return 100;
}

/*
	Name: function_c49cdd53
	Namespace: bot_actions
	Checksum: 0x6B58FFB4
	Offset: 0x1C80
	Size: 0x1A8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c49cdd53(actionparams)
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
	Namespace: bot_actions
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
	Namespace: bot_actions
	Checksum: 0xEA259934
	Offset: 0x1E60
	Size: 0x1A8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9f7ee32b(actionparams)
{
	target = self.bot.objective.info.target;
	if(!isdefined(target) || !isdefined(target.triggertype) || target.triggertype != #"use" || !target gameobjects::can_interact_with(self))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_7c6d555093009c78";
		#/
		return undefined;
	}
	if(self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams))
	{
		return undefined;
	}
	if(!isdefined(target.trigger) || !self touching_trigger(target.trigger))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_56cc687e292770eb";
		#/
		return undefined;
	}
	return 100;
}

/*
	Name: function_f60b48cd
	Namespace: bot_actions
	Checksum: 0x17497548
	Offset: 0x2010
	Size: 0x90
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f60b48cd(actionparams)
{
	self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
	while(true)
	{
		object = self.bot.objective.info.target;
		self use_gameobject(object);
	}
}

/*
	Name: use_trigger
	Namespace: bot_actions
	Checksum: 0x29FAEB2
	Offset: 0x20A8
	Size: 0x118
	Parameters: 1
	Flags: Linked, Private
*/
function private use_trigger(trigger)
{
	lookat = trigger triggerrequireslookat();
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
	Namespace: bot_actions
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
	Name: use_gameobject
	Namespace: bot_actions
	Checksum: 0x3E0CFE6
	Offset: 0x2270
	Size: 0x178
	Parameters: 1
	Flags: Linked, Private
*/
function private use_gameobject(object)
{
	trigger = object.trigger;
	lookat = trigger triggerrequireslookat();
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

