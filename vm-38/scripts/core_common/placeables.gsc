#using script_79a7e1c31a3e8cc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace placeables;

/*
	Name: function_2a77a83
	Namespace: placeables
	Checksum: 0xDDF0FB0D
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2a77a83()
{
	level notify(301239383);
}

/*
	Name: spawnplaceable
	Namespace: placeables
	Checksum: 0x2E692009
	Offset: 0x130
	Size: 0x458
	Parameters: 20
	Flags: Linked
*/
function spawnplaceable(onplacecallback, oncancelcallback, onmovecallback, onshutdowncallback, ondeathcallback, onempcallback, ondamagecallback, var_d0dd7e76, model, validmodel, invalidmodel, spawnsvehicle, pickupstring, timeout, health, empdamage, placehintstring, invalidlocationhintstring, placeimmediately, var_c71994b5)
{
	if(!isdefined(placeimmediately))
	{
		placeimmediately = 0;
	}
	if(!isdefined(var_c71994b5))
	{
		var_c71994b5 = undefined;
	}
	player = self;
	placeable = spawn("script_model", player.origin);
	placeable.cancelable = 1;
	placeable.held = 0;
	placeable.validmodel = validmodel;
	placeable.invalidmodel = invalidmodel;
	placeable.oncancel = oncancelcallback;
	placeable.onemp = onempcallback;
	placeable.onmove = onmovecallback;
	placeable.onplace = onplacecallback;
	placeable.onshutdown = onshutdowncallback;
	placeable.ondeath = ondeathcallback;
	placeable.ondamagecallback = ondamagecallback;
	placeable.var_d0dd7e76 = var_d0dd7e76;
	placeable.owner = player;
	placeable.originalowner = player;
	placeable.ownerentnum = player.entnum;
	placeable.originalownerentnum = player.entnum;
	placeable.pickupstring = pickupstring;
	placeable.placedmodel = model;
	placeable.spawnsvehicle = spawnsvehicle;
	placeable.originalteam = player.team;
	placeable.team = player.team;
	placeable.timedout = 0;
	placeable.timeout = timeout;
	placeable.timeoutstarted = 0;
	placeable.angles = (0, player.angles[1], 0);
	placeable.placehintstring = placehintstring;
	placeable.invalidlocationhintstring = invalidlocationhintstring;
	placeable.placeimmediately = placeimmediately;
	if(!isdefined(placeable.placehintstring))
	{
		placeable.placehintstring = "";
	}
	if(!isdefined(placeable.invalidlocationhintstring))
	{
		placeable.invalidlocationhintstring = "";
	}
	placeable notsolid();
	if(isdefined(placeable.vehicle))
	{
		placeable.vehicle notsolid();
	}
	placeable.othermodel = spawn("script_model", player.origin);
	placeable.othermodel setmodel(placeable.placedmodel);
	placeable.othermodel setinvisibletoplayer(player);
	placeable.othermodel notsolid();
	if(isdefined(health) && health > 0 && isdefined(var_c71994b5))
	{
		placeable.health = health;
		placeable setcandamage(0);
		placeable thread [[var_c71994b5]](ondamagecallback, &ondeath, empdamage, &onemp);
	}
	player thread carryplaceable(placeable);
	level thread cancelongameend(placeable);
	player thread shutdownoncancelevent(placeable);
	player thread cancelonplayerdisconnect(placeable);
	placeable thread watchownergameevents();
	return placeable;
}

/*
	Name: function_e4fd9a4c
	Namespace: placeables
	Checksum: 0x8854E555
	Offset: 0x590
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_e4fd9a4c(placeable)
{
	player = self;
	if(isdefined(placeable))
	{
		if(isdefined(placeable.weapon))
		{
			if(placeable.weapon.deployable)
			{
				deployable::function_2e088f73(placeable.weapon, placeable.var_8f4513d1, undefined, placeable.placehintstring, placeable.invalidlocationhintstring);
				if(isplayer(player))
				{
					player giveweapon(placeable.weapon);
					player givestartammo(placeable.weapon);
					player switchtoweapon(placeable.weapon);
				}
			}
		}
	}
}

/*
	Name: function_df4e6283
	Namespace: placeables
	Checksum: 0x8598AF61
	Offset: 0x690
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_df4e6283(placeable)
{
	player = self;
	if(isdefined(placeable))
	{
		if(isdefined(placeable.weapon))
		{
			if(placeable.weapon.deployable)
			{
				if(isplayer(player))
				{
					player takeweapon(placeable.weapon);
				}
			}
		}
	}
}

/*
	Name: function_f872b831
	Namespace: placeables
	Checksum: 0x5BBACCD
	Offset: 0x718
	Size: 0x2C0
	Parameters: 14
	Flags: None
*/
function function_f872b831(onplacecallback, oncancelcallback, onmovecallback, onshutdowncallback, ondeathcallback, onempcallback, ondamagecallback, var_d0dd7e76, var_c6d99e09, weapon, pickupstring, placehintstring, invalidlocationhintstring, timeout)
{
	player = self;
	placeable = spawn("script_model", player.origin);
	placeable.cancelable = 1;
	placeable.held = 0;
	placeable.oncancel = oncancelcallback;
	placeable.onemp = onempcallback;
	placeable.onmove = onmovecallback;
	placeable.onplace = onplacecallback;
	placeable.onshutdown = onshutdowncallback;
	placeable.ondeath = ondeathcallback;
	placeable.ondamagecallback = ondamagecallback;
	placeable.var_d0dd7e76 = var_d0dd7e76;
	placeable.owner = player;
	placeable.originalowner = player;
	placeable.ownerentnum = player.entnum;
	placeable.originalownerentnum = player.entnum;
	placeable.pickupstring = pickupstring;
	placeable.placehintstring = placehintstring;
	placeable.invalidlocationhintstring = invalidlocationhintstring;
	placeable.originalteam = player.team;
	placeable.team = player.team;
	placeable.timedout = 0;
	placeable.timeout = timeout;
	placeable.timeoutstarted = 0;
	placeable.angles = (0, player.angles[1], 0);
	placeable.placeimmediately = 0;
	placeable.weapon = weapon;
	placeable.var_8f4513d1 = var_c6d99e09;
	if(!isdefined(placeable.placehintstring))
	{
		placeable.placehintstring = "";
	}
	if(!isdefined(placeable.invalidlocationhintstring))
	{
		placeable.invalidlocationhintstring = "";
	}
	player function_e4fd9a4c(placeable);
	player thread function_b7fcffdd(placeable);
	player thread shutdownoncancelevent(placeable);
	player thread cancelonplayerdisconnect(placeable);
	placeable thread watchownergameevents();
	return placeable;
}

/*
	Name: function_b7fcffdd
	Namespace: placeables
	Checksum: 0x9843965
	Offset: 0x9E0
	Size: 0x25A
	Parameters: 1
	Flags: Linked
*/
function function_b7fcffdd(placeable)
{
	player = self;
	player endon(#"disconnect", #"death");
	placeable endon(#"placed", #"cancelled");
	player notify(#"hash_6a6d790b6c192aee");
	player endon(#"hash_6a6d790b6c192aee");
	placeable notsolid();
	if(isdefined(placeable.vehicle))
	{
		placeable.vehicle notsolid();
	}
	player thread watchcarrycancelevents(placeable);
	player thread function_e222876f(placeable);
	while(player getcurrentweapon() != placeable.weapon)
	{
		waitframe(1);
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = player waittill(#"weapon_fired", #"weapon_switch_started");
		if(waitresult.weapon != placeable.weapon)
		{
			placeable notify(#"cancelled");
			return;
		}
		if(isdefined(level.var_69959686))
		{
			[[level.var_69959686]](placeable.weapon);
		}
		if(is_true(self.var_7a3f3edf) && isdefined(self.var_b8878ba9) && isdefined(self.var_b8878ba9))
		{
			placeable.held = 0;
			player.holding_placeable = undefined;
			placeable.cancelable = 0;
			placeable.origin = self.var_b8878ba9;
			placeable.angles = self.var_ddc03e10;
			player onplace(placeable);
			return;
		}
	}
}

/*
	Name: updateplacementmodels
	Namespace: placeables
	Checksum: 0x167938DE
	Offset: 0xC48
	Size: 0x4E
	Parameters: 3
	Flags: None
*/
function updateplacementmodels(model, validmodel, invalidmodel)
{
	placeable = self;
	placeable.placedmodel = model;
	placeable.validmodel = validmodel;
	placeable.invalidmodel = invalidmodel;
}

/*
	Name: carryplaceable
	Namespace: placeables
	Checksum: 0xB76A4569
	Offset: 0xCA0
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function carryplaceable(placeable)
{
	player = self;
	placeable show();
	placeable notsolid();
	if(isdefined(placeable.vehicle))
	{
		placeable.vehicle notsolid();
	}
	if(isdefined(placeable.othermodel))
	{
		placeable thread util::ghost_wait_show_to_player(player, 0.05, "abort_ghost_wait_show");
		placeable.othermodel thread util::ghost_wait_show_to_others(player, 0.05, "abort_ghost_wait_show");
		placeable.othermodel notsolid();
	}
	placeable.held = 1;
	player.holding_placeable = placeable;
	player carryturret(placeable, vectorscale((1, 0, 0), 40), (0, 0, 0));
	player val::set(#"placeable", "disable_weapons");
	player thread watchplacement(placeable);
}

/*
	Name: innoplacementtrigger
	Namespace: placeables
	Checksum: 0x78D09B62
	Offset: 0xE18
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function innoplacementtrigger()
{
	placeable = self;
	if(isdefined(level.noturretplacementtriggers))
	{
		for(i = 0; i < level.noturretplacementtriggers.size; i++)
		{
			if(placeable istouching(level.noturretplacementtriggers[i]))
			{
				return true;
			}
		}
	}
	if(isdefined(level.fatal_triggers))
	{
		for(i = 0; i < level.fatal_triggers.size; i++)
		{
			if(placeable istouching(level.fatal_triggers[i]))
			{
				return true;
			}
		}
	}
	if(placeable oob::istouchinganyoobtrigger())
	{
		return true;
	}
	return false;
}

/*
	Name: waitforplaceabletobebuilt
	Namespace: placeables
	Checksum: 0xCA14EB7
	Offset: 0xF18
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function waitforplaceabletobebuilt(player)
{
	placeable = self;
	buildlength = int(placeable.buildtime * 1000);
	if(isdefined(placeable.buildstartedfunc))
	{
		if(![[placeable.buildstartedfunc]](placeable, player))
		{
			return 0;
		}
	}
	starttime = gettime();
	endtime = starttime + buildlength;
	finishedbuilding = 1;
	while(gettime() < endtime)
	{
		if(!player attackbuttonpressed())
		{
			finishedbuilding = 0;
			break;
		}
		if(isdefined(placeable.buildprogressfunc))
		{
			[[placeable.buildprogressfunc]](placeable, player, (gettime() - starttime) / buildlength);
		}
		waitframe(1);
	}
	finished = player attackbuttonpressed();
	if(isdefined(placeable.buildfinishedfunc))
	{
		[[placeable.buildfinishedfunc]](placeable, player, finishedbuilding);
	}
	return finishedbuilding;
}

/*
	Name: function_238e6d1e
	Namespace: placeables
	Checksum: 0x27FE3759
	Offset: 0x1078
	Size: 0x26
	Parameters: 1
	Flags: None
*/
function function_238e6d1e(callbackfunc)
{
	placeable = self;
	placeable.var_d944a140 = callbackfunc;
}

/*
	Name: function_e679057e
	Namespace: placeables
	Checksum: 0xC46B4C85
	Offset: 0x10A8
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_e679057e()
{
	self.var_d4083518 = 1;
}

/*
	Name: watchplacement
	Namespace: placeables
	Checksum: 0x486C8E61
	Offset: 0x10C8
	Size: 0x706
	Parameters: 1
	Flags: Linked
*/
function watchplacement(placeable)
{
	player = self;
	player endon(#"disconnect", #"death");
	placeable endon(#"placed", #"cancelled");
	player thread watchcarrycancelevents(placeable);
	player thread function_e222876f(placeable);
	lastattempt = -1;
	placeable.canbeplaced = 0;
	waitingforattackbuttonrelease = 1;
	while(true)
	{
		placement = player canplayerplaceturret();
		placeable.origin = placement[#"origin"];
		placeable.angles = placement[#"angles"];
		placeable.canbeplaced = placement[#"result"] && !placeable innoplacementtrigger();
		laststand = player laststand::player_is_in_laststand();
		in_igc = player scene::is_igc_active();
		if(laststand || in_igc)
		{
			placeable.canbeplaced = 0;
		}
		if(isdefined(placeable.othermodel))
		{
			placeable.othermodel.origin = placement[#"origin"];
			placeable.othermodel.angles = placement[#"angles"];
		}
		if(placeable.canbeplaced != lastattempt)
		{
			if(placeable.canbeplaced)
			{
				placeable setmodel(placeable.validmodel);
				player sethintstring(placeable.placehintstring);
			}
			else
			{
				placeable setmodel(placeable.invalidmodel);
				player sethintstring(placeable.invalidlocationhintstring);
			}
			lastattempt = placeable.canbeplaced;
		}
		while(waitingforattackbuttonrelease && !player attackbuttonpressed())
		{
			waitingforattackbuttonrelease = 0;
		}
		if(!waitingforattackbuttonrelease && placeable.canbeplaced && player attackbuttonpressed() || placeable.placeimmediately)
		{
			buildallowed = 1;
			if(isdefined(placeable.buildtime) && placeable.buildtime > 0)
			{
				player sethintstring(placeable.buildinghintstring);
				finishedbuilding = placeable waitforplaceabletobebuilt(player);
				if(!finishedbuilding)
				{
					buildallowed = 0;
					player sethintstring(placeable.placehintstring);
				}
			}
			if(placement[#"result"] && buildallowed && isdefined(placeable.var_d944a140))
			{
				buildallowed = placeable [[placeable.var_d944a140]](placement[#"origin"], player);
			}
			if(placement[#"result"] && buildallowed)
			{
				placeable.origin = placement[#"origin"];
				placeable.angles = placement[#"angles"];
				player sethintstring("");
				player stopcarryturret(placeable);
				player val::reset(#"placeable", "disable_weapons");
				placeable.held = 0;
				player.holding_placeable = undefined;
				placeable.cancelable = 0;
				if(is_true(placeable.health))
				{
					placeable setcandamage(1);
					placeable solid();
				}
				if(isdefined(placeable.placedmodel) && !placeable.spawnsvehicle)
				{
					placeable setmodel(placeable.placedmodel);
				}
				else
				{
					placeable notify(#"abort_ghost_wait_show");
					placeable.abort_ghost_wait_show_to_player = 1;
					placeable.abort_ghost_wait_show_to_others = 1;
					placeable ghost();
					if(isdefined(placeable.othermodel))
					{
						placeable.othermodel notify(#"abort_ghost_wait_show");
						placeable.othermodel.abort_ghost_wait_show_to_player = 1;
						placeable.othermodel.abort_ghost_wait_show_to_others = 1;
						placeable.othermodel ghost();
					}
				}
				if(isdefined(placeable.timeout))
				{
					if(!placeable.timeoutstarted)
					{
						placeable.timeoutstarted = 1;
						if(isdefined(placeable.var_d0dd7e76))
						{
							placeable thread [[placeable.var_d0dd7e76]](placeable.timeout, &ontimeout, "death", "cancelled");
						}
					}
					else if(placeable.timedout)
					{
						placeable thread [[placeable.var_d0dd7e76]](5000, &ontimeout, "cancelled");
					}
				}
				player onplace(placeable);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_613a226a
	Namespace: placeables
	Checksum: 0xC4D646DD
	Offset: 0x17D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function function_613a226a(var_844f9de6)
{
	self.var_e3be448 = var_844f9de6;
}

/*
	Name: watchcarrycancelevents
	Namespace: placeables
	Checksum: 0xFA9F3FB0
	Offset: 0x1800
	Size: 0xD8
	Parameters: 1
	Flags: Linked
*/
function watchcarrycancelevents(placeable)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	placeable endon(#"cancelled", #"placed");
	player waittill(#"death", #"emp_jammed", #"emp_grenaded", #"disconnect", #"joined_team");
	placeable notify(#"cancelled");
}

/*
	Name: function_e222876f
	Namespace: placeables
	Checksum: 0x74C92C7E
	Offset: 0x18E0
	Size: 0x212
	Parameters: 1
	Flags: Linked
*/
function function_e222876f(placeable)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	player endon(#"disconnect", #"death");
	placeable endon(#"placed", #"cancelled");
	while(true)
	{
		if((isdefined(placeable.var_e3be448) ? placeable.var_e3be448 : 0) && player changeseatbuttonpressed())
		{
			placeable notify(#"cancelled");
		}
		else
		{
			if(!(isdefined(placeable.var_e3be448) ? placeable.var_e3be448 : 0) && placeable.cancelable && player actionslotfourbuttonpressed())
			{
				placeable notify(#"cancelled");
			}
			else
			{
				if(is_true(placeable.var_25404db4) && player laststand::player_is_in_laststand())
				{
					placeable notify(#"cancelled");
				}
				else
				{
					if(player scene::is_igc_active())
					{
						placeable notify(#"cancelled");
					}
					else if(player isinvehicle())
					{
						placeable notify(#"cancelled");
					}
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: ontimeout
	Namespace: placeables
	Checksum: 0x3524D383
	Offset: 0x1B00
	Size: 0x80
	Parameters: 0
	Flags: Linked
*/
function ontimeout()
{
	placeable = self;
	if(is_true(placeable.held))
	{
		placeable.timedout = 1;
		return;
	}
	placeable notify(#"delete_placeable_trigger");
	placeable thread [[placeable.var_d0dd7e76]](5000, &forceshutdown, "cancelled");
}

/*
	Name: onplace
	Namespace: placeables
	Checksum: 0x62AC7243
	Offset: 0x1B88
	Size: 0xE8
	Parameters: 1
	Flags: Linked
*/
function onplace(placeable)
{
	player = self;
	if(isdefined(placeable.vehicle))
	{
		placeable.vehicle setcandamage(1);
		placeable.vehicle solid();
	}
	player function_df4e6283(placeable);
	if(isdefined(placeable.onplace))
	{
		player [[placeable.onplace]](placeable);
		if(isdefined(placeable.onmove) && !placeable.timedout)
		{
			spawnmovetrigger(placeable, player);
		}
	}
	placeable notify(#"placed");
}

/*
	Name: onmove
	Namespace: placeables
	Checksum: 0x8FE5E31B
	Offset: 0x1C78
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function onmove(placeable)
{
	player = self;
	player function_e4fd9a4c(placeable);
	/#
		assert(isdefined(placeable.onmove));
	#/
	if(isdefined(placeable.onmove))
	{
		player [[placeable.onmove]](placeable);
	}
	if(isdefined(placeable.weapon) && placeable.weapon.deployable)
	{
		player thread function_b7fcffdd(placeable);
	}
	else
	{
		player thread carryplaceable(placeable);
	}
}

/*
	Name: oncancel
	Namespace: placeables
	Checksum: 0xBBD5136
	Offset: 0x1D60
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function oncancel(placeable)
{
	player = self;
	player function_df4e6283(placeable);
	if(isdefined(placeable.oncancel))
	{
		player [[placeable.oncancel]](placeable);
	}
}

/*
	Name: ondeath
	Namespace: placeables
	Checksum: 0x809B9D45
	Offset: 0x1DC0
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function ondeath(attacker, weapon)
{
	placeable = self;
	if(isdefined(placeable.ondeath))
	{
		[[placeable.ondeath]](attacker, weapon);
	}
	placeable notify(#"cancelled");
}

/*
	Name: onemp
	Namespace: placeables
	Checksum: 0x3A4C71F6
	Offset: 0x1E20
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function onemp(attacker)
{
	placeable = self;
	if(isdefined(placeable.onemp))
	{
		placeable [[placeable.onemp]](attacker);
	}
}

/*
	Name: cancelonplayerdisconnect
	Namespace: placeables
	Checksum: 0xCB8A3707
	Offset: 0x1E68
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function cancelonplayerdisconnect(placeable)
{
	placeable endon(#"hacked");
	player = self;
	/#
		assert(isplayer(player));
	#/
	placeable endon(#"cancelled", #"death");
	player waittill(#"disconnect", #"joined_team");
	placeable notify(#"cancelled");
}

/*
	Name: cancelongameend
	Namespace: placeables
	Checksum: 0xCD3E6938
	Offset: 0x1F30
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function cancelongameend(placeable)
{
	placeable endon(#"cancelled", #"death");
	level waittill(#"game_ended");
	placeable notify(#"cancelled");
}

/*
	Name: spawnmovetrigger
	Namespace: placeables
	Checksum: 0x3A87B100
	Offset: 0x1F98
	Size: 0x114
	Parameters: 2
	Flags: Linked
*/
function spawnmovetrigger(placeable, player)
{
	pos = placeable.origin + vectorscale((0, 0, 1), 15);
	placeable.pickuptrigger = spawn("trigger_radius_use", pos);
	placeable.pickuptrigger setcursorhint("HINT_NOICON", placeable);
	placeable.pickuptrigger sethintstring(placeable.pickupstring);
	placeable.pickuptrigger setteamfortrigger(player.team);
	player clientclaimtrigger(placeable.pickuptrigger);
	placeable thread watchpickup(player);
	placeable.pickuptrigger thread watchmovetriggershutdown(placeable);
}

/*
	Name: watchmovetriggershutdown
	Namespace: placeables
	Checksum: 0x98D0DDF1
	Offset: 0x20B8
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function watchmovetriggershutdown(placeable)
{
	trigger = self;
	placeable waittill(#"cancelled", #"picked_up", #"death", #"delete_placeable_trigger", #"hacker_delete_placeable_trigger");
	placeable.pickuptrigger delete();
}

/*
	Name: watchpickup
	Namespace: placeables
	Checksum: 0xB88B4537
	Offset: 0x2150
	Size: 0x2F2
	Parameters: 1
	Flags: Linked
*/
function watchpickup(player)
{
	placeable = self;
	placeable endon(#"death", #"cancelled");
	/#
		assert(isdefined(placeable.pickuptrigger));
	#/
	trigger = placeable.pickuptrigger;
	while(true)
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"trigger");
		player = waitresult.activator;
		if(!isalive(player))
		{
			continue;
		}
		if(player isusingoffhand())
		{
			continue;
		}
		if(!player isonground())
		{
			continue;
		}
		if(isdefined(placeable.vehicle) && placeable.vehicle.control_initiated === 1)
		{
			continue;
		}
		if(isdefined(player.carryobject) && player.carryobject.disallowplaceablepickup === 1)
		{
			continue;
		}
		if(isdefined(trigger.triggerteam) && player.team != trigger.triggerteam)
		{
			continue;
		}
		if(isdefined(trigger.claimedby) && player != trigger.claimedby)
		{
			continue;
		}
		if(player usebuttonpressed() && !player.throwinggrenade && !player meleebuttonpressed() && !player attackbuttonpressed() && !is_true(player.isplanting) && !is_true(player.isdefusing) && !player isremotecontrolling() && !isdefined(player.holding_placeable))
		{
			placeable notify(#"picked_up");
			if(isdefined(placeable.weapon_instance))
			{
				placeable.weapon_instance notify(#"picked_up");
			}
			placeable.held = 1;
			placeable setcandamage(0);
			player onmove(placeable);
			return;
		}
	}
}

/*
	Name: forceshutdown
	Namespace: placeables
	Checksum: 0xC6AF2933
	Offset: 0x2450
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function forceshutdown()
{
	placeable = self;
	placeable.cancelable = 0;
	placeable notify(#"cancelled");
}

/*
	Name: watchownergameevents
	Namespace: placeables
	Checksum: 0x6378E2FE
	Offset: 0x2488
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function watchownergameevents()
{
	self notify(#"watchownergameevents_singleton");
	self endon(#"watchownergameevents_singleton");
	placeable = self;
	placeable endon(#"cancelled");
	placeable.owner waittill(#"joined_team", #"disconnect", #"joined_spectators");
	if(isdefined(placeable))
	{
		placeable.abandoned = 1;
		placeable forceshutdown();
	}
}

/*
	Name: shutdownoncancelevent
	Namespace: placeables
	Checksum: 0xC81A4AC2
	Offset: 0x2548
	Size: 0x3D4
	Parameters: 1
	Flags: Linked
*/
function shutdownoncancelevent(placeable)
{
	placeable endon(#"hacked");
	player = self;
	/#
		assert(isplayer(player));
	#/
	vehicle = placeable.vehicle;
	othermodel = placeable.othermodel;
	var_a94c08f3 = 1;
	while(var_a94c08f3)
	{
		waitresult = undefined;
		waitresult = placeable waittill(#"cancelled", #"death");
		if((isdefined(placeable.var_d4083518) ? placeable.var_d4083518 : 0) && waitresult._notify == "death")
		{
			continue;
		}
		var_a94c08f3 = 0;
	}
	if(isdefined(placeable.weapon) && placeable.weapon.deployable)
	{
		if(isdefined(level.var_69959686))
		{
			[[level.var_69959686]](placeable.weapon);
		}
		if(is_true(self.var_7a3f3edf) && isdefined(player.var_b8878ba9) && isdefined(player.var_b8878ba9))
		{
			placeable.origin = player.var_b8878ba9;
			placeable.angles = player.var_ddc03e10;
		}
	}
	if(isdefined(player) && isdefined(placeable) && placeable.held === 1)
	{
		player sethintstring("");
		player stopcarryturret(placeable);
		player val::reset(#"placeable", "disable_weapons");
	}
	if(isdefined(placeable))
	{
		if(placeable.cancelable)
		{
			player oncancel(placeable);
		}
		else if(isdefined(placeable.onshutdown))
		{
			[[placeable.onshutdown]](placeable);
		}
		if(isdefined(placeable))
		{
			if(isdefined(placeable.vehicle))
			{
				placeable.vehicle.selfdestruct = 1;
				placeable.vehicle._no_death_state = 1;
				placeable.vehicle kill();
				vehicle = undefined;
			}
			placeable.vehicle = undefined;
			if(isdefined(placeable.othermodel))
			{
				placeable.othermodel delete();
			}
			placeable.othermodel = undefined;
			placeable delete();
		}
	}
	if(function_3132f113(placeable))
	{
		if(isdefined(vehicle))
		{
			vehicle.selfdestruct = 1;
			vehicle._no_death_state = 1;
			vehicle kill();
		}
		if(isdefined(othermodel))
		{
			othermodel delete();
		}
	}
}

/*
	Name: setbuildable
	Namespace: placeables
	Checksum: 0x3DF2DCA1
	Offset: 0x2928
	Size: 0x76
	Parameters: 5
	Flags: None
*/
function setbuildable(buildtime, buildstartfunction, buildprogressupdatedfunction, buildfinishedfunction, buildingstring)
{
	placeable = self;
	placeable.buildtime = buildtime;
	placeable.buildstartedfunc = buildstartfunction;
	placeable.buildprogressfunc = buildprogressupdatedfunction;
	placeable.buildfinishedfunc = buildfinishedfunction;
	placeable.buildinghintstring = buildingstring;
}

