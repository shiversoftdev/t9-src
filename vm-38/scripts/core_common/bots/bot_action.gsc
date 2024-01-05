#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\bots\bot_weapons.gsc;
#using scripts\core_common\bots\bot_actions.gsc;
#using scripts\core_common\bots\bot.gsc;

#namespace bot_action;

/*
	Name: function_10b376de
	Namespace: bot_action
	Checksum: 0xC2D3D551
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_10b376de()
{
	level notify(-25858069);
}

/*
	Name: function_70a657d8
	Namespace: bot_action
	Checksum: 0x4A301477
	Offset: 0x148
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.botactions = [];
	level.botweapons = [];
	bot_actions::function_70a657d8();
	bot_weapons::function_70a657d8();
}

/*
	Name: shutdown
	Namespace: bot_action
	Checksum: 0x38259B45
	Offset: 0x190
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function shutdown()
{
	self clear();
	self.bot.var_c040e7e2 = undefined;
	self.bot.var_e6a1f475 = undefined;
	self.bot.var_ceffa180 = undefined;
}

/*
	Name: think
	Namespace: bot_action
	Checksum: 0xD2E62DE1
	Offset: 0x1E8
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function think()
{
	pixbeginevent();
	var_41fcf220 = self.bot.actionparams;
	actionparams = self function_9e181b0f();
	if(isdefined(actionparams) && isdefined(var_41fcf220) && actionparams == var_41fcf220)
	{
		self notify(#"hash_77f2882ff9140e86");
		pixendevent();
		return;
	}
	self notify(#"hash_1ae115949cd752c8");
	self.bot.actionparams = undefined;
	clear();
	if(isdefined(actionparams))
	{
		self.bot.actionparams = actionparams;
		self thread [[actionparams.action.executefunc]](actionparams);
	}
	pixendevent();
}

/*
	Name: clear
	Namespace: bot_action
	Checksum: 0xE99BDD65
	Offset: 0x2E8
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function clear()
{
	self.bot.var_87751145 = undefined;
	self.bot.var_2d563ebf = undefined;
	self.bot.var_f50fa466 = undefined;
	self.bot.var_32d8dabe = undefined;
	self.bot.var_d70788cb = undefined;
	self.bot.shoottime = undefined;
	self.bot.var_6bea1d82 = undefined;
	self.bot.var_9cf66413 = undefined;
	self.bot.var_ce28855b = undefined;
	/#
		self.bot.var_9e5aaf8d = undefined;
	#/
}

/*
	Name: function_a0b0f487
	Namespace: bot_action
	Checksum: 0xCA1C3405
	Offset: 0x398
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_a0b0f487(actionparams)
{
	if(self arecontrolsfrozen() || self function_5972c3cf())
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_329792b380cfd409";
		#/
		return true;
	}
	return false;
}

/*
	Name: function_2c3ea0c6
	Namespace: bot_action
	Checksum: 0x9A78973C
	Offset: 0x410
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function function_2c3ea0c6(actionparams)
{
	if(self isplayinganimscripted())
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_5cbefc6b234455fc";
		#/
		return true;
	}
	return false;
}

/*
	Name: in_vehicle
	Namespace: bot_action
	Checksum: 0x11FCFE92
	Offset: 0x470
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function in_vehicle(actionparams)
{
	if(self isinvehicle())
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_74dd6cdecdd53e96";
		#/
		return true;
	}
	return false;
}

/*
	Name: function_ed7b2f42
	Namespace: bot_action
	Checksum: 0xEA70DA7A
	Offset: 0x4D0
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_ed7b2f42(actionparams)
{
	if(isdefined(self.bot.traversal))
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_17222d5087946703";
		#/
		return true;
	}
	return false;
}

/*
	Name: function_a43bc7e2
	Namespace: bot_action
	Checksum: 0x2364EAC5
	Offset: 0x528
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function function_a43bc7e2(actionparams)
{
	if(self.ignoreall)
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_5a308775df684ba1";
		#/
		return true;
	}
	return false;
}

/*
	Name: in_combat
	Namespace: bot_action
	Checksum: 0x5FF6385F
	Offset: 0x578
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function in_combat(actionparams)
{
	if(self.combatstate == #"combat_state_in_combat" || self.combatstate == #"combat_state_has_visible_enemy")
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_6c8a68a6b0ba3e46";
		#/
		return true;
	}
	return false;
}

/*
	Name: just_spawned
	Namespace: bot_action
	Checksum: 0xD5CBFC0D
	Offset: 0x5F0
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function just_spawned(actionparams)
{
	if(self.spawntime >= gettime())
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_5080fb7f9d457021";
		#/
		return true;
	}
	return false;
}

/*
	Name: flashed
	Namespace: bot_action
	Checksum: 0x22D07DD2
	Offset: 0x640
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function flashed(actionparams)
{
	if(self.bot.flashed)
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"flashed";
		#/
		return true;
	}
	return false;
}

/*
	Name: function_ebb8205b
	Namespace: bot_action
	Checksum: 0x17F8E0D
	Offset: 0x698
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function function_ebb8205b(actionparams)
{
	if(self isinexecutionvictim())
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_6ad5723518a9aa59";
		#/
		return true;
	}
	if(self isinexecutionattack())
	{
		/#
			actionparams.debug[actionparams.debug.size] = #"hash_21cc6a6be1e0b67";
		#/
		return true;
	}
	return false;
}

/*
	Name: register_action
	Namespace: bot_action
	Checksum: 0xF7E535F5
	Offset: 0x740
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function register_action(name, weightfunc, executefunc)
{
	level.botactions[name] = {#executefunc:executefunc, #weightfunc:weightfunc};
}

/*
	Name: register_weapon
	Namespace: bot_action
	Checksum: 0xEA998C62
	Offset: 0x7A0
	Size: 0x90
	Parameters: 3
	Flags: Linked
*/
function register_weapon(weaponname, weightfunc, executefunc)
{
	weapon = getweapon(weaponname);
	if(weapon.name == #"none")
	{
		return;
	}
	level.botweapons[weapon.name] = {#executefunc:executefunc, #weightfunc:weightfunc};
}

/*
	Name: function_daafd48c
	Namespace: bot_action
	Checksum: 0xB707A2FC
	Offset: 0x838
	Size: 0x1F0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_daafd48c(&paramslist)
{
	pixbeginevent();
	var_6577f082 = self.bot.actionparams;
	weapons = self getweaponslist();
	foreach(weapon in weapons)
	{
		action = level.botweapons[weapon.name];
		if(!isstruct(action) || (!isfunctionptr(action.weightfunc) && !isfunctionptr(action.executefunc)))
		{
			continue;
		}
		actionparams = undefined;
		if(isdefined(var_6577f082) && var_6577f082.action == action && var_6577f082.weapon == weapon)
		{
			actionparams = var_6577f082;
		}
		else
		{
			actionparams = {#weapon:weapon, #action:action};
		}
		/#
			actionparams.name = function_a16a090d(weapon);
			actionparams.debug = [];
		#/
		paramslist[paramslist.size] = actionparams;
	}
	pixendevent();
}

/*
	Name: function_f692725c
	Namespace: bot_action
	Checksum: 0xF4CAFDFA
	Offset: 0xA30
	Size: 0x120
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f692725c(&paramslist)
{
	pixbeginevent();
	var_6577f082 = self.bot.actionparams;
	foreach(action in level.botactions)
	{
		actionparams = undefined;
		if(isdefined(var_6577f082) && var_6577f082.action == action)
		{
			actionparams = var_6577f082;
		}
		else
		{
			actionparams = {#action:action};
		}
		/#
			actionparams.name = name;
			actionparams.debug = [];
		#/
		paramslist[paramslist.size] = actionparams;
	}
	pixendevent();
}

/*
	Name: function_9e181b0f
	Namespace: bot_action
	Checksum: 0x5D86FED1
	Offset: 0xB58
	Size: 0x224
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9e181b0f()
{
	pixbeginevent();
	if(isdefined(self.bot.var_e6a1f475))
	{
		endtime = self.bot.var_ceffa180;
		if(!isdefined(endtime) || endtime > gettime())
		{
			params = self.bot.var_e6a1f475;
			/#
				record3dtext(("" + function_9e72a96(params.name)) + "", self.origin, (1, 0, 1), "", self, 0.5);
				if(isdefined(params.weapon))
				{
					clipammo = self getweaponammoclip(params.weapon);
					stockammo = self getweaponammostock(params.weapon);
					record3dtext((((("" + clipammo) + "") + params.weapon.clipsize) + "") + stockammo, self.origin, (1, 0, 1), "", self, 0.5);
				}
			#/
			pixendevent();
			return params;
		}
		self.bot.var_e6a1f475 = undefined;
		self.bot.var_ceffa180 = undefined;
	}
	paramslist = [];
	self function_daafd48c(paramslist);
	self function_f692725c(paramslist);
	var_3a4035f3 = self weight_actions(paramslist);
	pixendevent();
	return var_3a4035f3;
}

/*
	Name: weight_actions
	Namespace: bot_action
	Checksum: 0x26BBB90C
	Offset: 0xD88
	Size: 0x4BA
	Parameters: 1
	Flags: Linked, Private
*/
function private weight_actions(&paramslist)
{
	pixbeginevent();
	var_3a4035f3 = undefined;
	bestweight = undefined;
	foreach(actionparams in paramslist)
	{
		pixbeginevent();
		actionparams.weight = self [[actionparams.action.weightfunc]](actionparams);
		pixendevent();
		if(!isdefined(actionparams.weight))
		{
			continue;
		}
		if(!isdefined(var_3a4035f3) || actionparams.weight > bestweight)
		{
			var_3a4035f3 = actionparams;
			bestweight = actionparams.weight;
		}
	}
	/#
		if(self bot::should_record(""))
		{
			if(!isdefined(var_3a4035f3))
			{
				record3dtext("", self.origin, (1, 0, 1), "", self, 0.5);
			}
			var_37c2490e = [];
			foreach(actionparams in paramslist)
			{
				if(!isdefined(actionparams.weight))
				{
					var_37c2490e[var_37c2490e.size] = actionparams;
					continue;
				}
				for(i = 0; i < var_37c2490e.size; i++)
				{
					var_fd5e06c8 = var_37c2490e[i].weight;
					if(!isdefined(var_fd5e06c8) || var_fd5e06c8 < actionparams.weight)
					{
						break;
					}
				}
				arrayinsert(var_37c2490e, actionparams, i);
			}
			foreach(actionparams in var_37c2490e)
			{
				color = vectorscale((1, 1, 1), 0.75);
				headerstr = "";
				recordweight = "";
				if(isdefined(actionparams.weight))
				{
					color = bot::function_f86de15e(actionparams.weight, 100, (1, 0, 0), (1, 0.5, 0), (1, 1, 0), (0, 1, 0));
					recordweight = actionparams.weight;
					if(actionparams === var_3a4035f3)
					{
						headerstr = "";
					}
					else
					{
						headerstr = "";
					}
				}
				record3dtext(((headerstr + function_9e72a96(actionparams.name)) + "") + recordweight, self.origin, color, "", self, 0.5);
				foreach(entry in actionparams.debug)
				{
					record3dtext("" + function_9e72a96(entry), self.origin, color, "", self, 0.5);
				}
			}
		}
	#/
	pixendevent();
	return var_3a4035f3;
}

/*
	Name: function_d6318084
	Namespace: bot_action
	Checksum: 0x6AAF02D5
	Offset: 0x1250
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_d6318084(weapon)
{
	action = level.botweapons[weapon.name];
	if(!isdefined(action) || !isfunctionptr(action.executefunc))
	{
		return;
	}
	/#
		name = function_a16a090d(weapon);
	#/
	self function_2a2a2cd2(name, action, weapon);
	self.bot.var_ceffa180 = undefined;
}

/*
	Name: function_32020adf
	Namespace: bot_action
	Checksum: 0x90733C74
	Offset: 0x1308
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_32020adf(delaysec)
{
	if(!isdefined(delaysec))
	{
		delaysec = undefined;
	}
	self.bot.var_ceffa180 = gettime() + (int(delaysec * 1000));
}

/*
	Name: function_2a2a2cd2
	Namespace: bot_action
	Checksum: 0xF394CC87
	Offset: 0x1360
	Size: 0xE2
	Parameters: 3
	Flags: Linked, Private
*/
function private function_2a2a2cd2(name, action, weapon)
{
	if(!isdefined(weapon))
	{
		weapon = undefined;
	}
	actionparams = {#weapon:weapon, #action:action};
	eye = self.origin + (0, 0, self getplayerviewheight());
	actionparams.aimorigin = eye + (128 * anglestoforward(self.angles));
	/#
		actionparams.name = name;
		actionparams.weight = "";
	#/
	self.bot.var_e6a1f475 = actionparams;
}

/*
	Name: function_2a24a928
	Namespace: bot_action
	Checksum: 0x52BDF966
	Offset: 0x1450
	Size: 0x594
	Parameters: 0
	Flags: None
*/
function function_2a24a928()
{
	potentialtargets = [];
	if(isdefined(level.spawneduavs))
	{
		foreach(uav in level.spawneduavs)
		{
			if(isdefined(uav) && util::function_fbce7263(uav.team, self.team))
			{
				potentialtargets[potentialtargets.size] = uav;
			}
		}
	}
	if(isdefined(level.counter_uav_entities))
	{
		foreach(cuav in level.counter_uav_entities)
		{
			if(isdefined(cuav) && util::function_fbce7263(cuav.team, self.team))
			{
				potentialtargets[potentialtargets.size] = cuav;
			}
		}
	}
	choppers = getentarray("chopper", "targetName");
	if(isdefined(choppers))
	{
		foreach(chopper in choppers)
		{
			if(isdefined(chopper) && util::function_fbce7263(chopper.team, self.team))
			{
				potentialtargets[potentialtargets.size] = chopper;
			}
		}
	}
	planes = getentarray("strafePlane", "targetName");
	if(isdefined(planes))
	{
		foreach(plane in planes)
		{
			if(isdefined(plane) && util::function_fbce7263(plane.team, self.team))
			{
				potentialtargets[potentialtargets.size] = plane;
			}
		}
	}
	if(isdefined(level.ac130) && util::function_fbce7263(level.ac130.team, self.team))
	{
		potentialtargets[potentialtargets.size] = level.ac130;
	}
	if(potentialtargets.size == 0)
	{
		return undefined;
	}
	var_137299d = [];
	var_7607a546 = getclosesttacpoint(self.origin);
	if(isdefined(var_7607a546))
	{
		foreach(target in potentialtargets)
		{
			if(issentient(target))
			{
				if(!isdefined(target.var_e38e137f) || !isdefined(target.var_e38e137f[self getentitynumber()]))
				{
					target.var_e38e137f[self getentitynumber()] = randomfloat(1) < (isdefined(self.bot.tacbundle.var_d1fb2f1a) ? self.bot.tacbundle.var_d1fb2f1a : 0);
				}
				if(!target.var_e38e137f[self getentitynumber()])
				{
					continue;
				}
				if(function_96c81b85(var_7607a546, target.origin))
				{
					var_137299d[var_137299d.size] = target;
				}
			}
		}
	}
	if(var_137299d.size == 0)
	{
		return undefined;
	}
	var_1f5c2eac = util::get_array_of_closest(self.origin, var_137299d);
	return var_1f5c2eac[0];
}

