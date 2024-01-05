#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace remote_weapons;

/*
	Name: init_shared
	Namespace: remote_weapons
	Checksum: 0x18A2F035
	Offset: 0x140
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	if(!isdefined(level.var_4249c222))
	{
		level.var_4249c222 = {};
		level.remoteweapons = [];
		level.remoteexithint = #"hash_17ed51b55d2d46e4";
		callback::on_spawned(&on_player_spawned);
	}
}

/*
	Name: on_player_spawned
	Namespace: remote_weapons
	Checksum: 0x1B2E3904
	Offset: 0x1B0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self endon(#"disconnect");
	self assignremotecontroltrigger();
}

/*
	Name: removeandassignnewremotecontroltrigger
	Namespace: remote_weapons
	Checksum: 0x8D4AC570
	Offset: 0x1E8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function removeandassignnewremotecontroltrigger(remotecontroltrigger)
{
	arrayremovevalue(self.activeremotecontroltriggers, remotecontroltrigger);
	self assignremotecontroltrigger(1);
}

/*
	Name: assignremotecontroltrigger
	Namespace: remote_weapons
	Checksum: 0x7EB98683
	Offset: 0x230
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function assignremotecontroltrigger(force_new_assignment)
{
	if(!isdefined(force_new_assignment))
	{
		force_new_assignment = 0;
	}
	if(!isdefined(self.activeremotecontroltriggers))
	{
		self.activeremotecontroltriggers = [];
	}
	arrayremovevalue(self.activeremotecontroltriggers, undefined);
	if(!isdefined(self.remotecontroltrigger) || force_new_assignment && self.activeremotecontroltriggers.size > 0)
	{
		self.remotecontroltrigger = self.activeremotecontroltriggers[self.activeremotecontroltriggers.size - 1];
	}
	if(isdefined(self.remotecontroltrigger))
	{
		self.remotecontroltrigger.origin = self.origin;
		self.remotecontroltrigger linkto(self);
	}
}

/*
	Name: registerremoteweapon
	Namespace: remote_weapons
	Checksum: 0x9CE5F693
	Offset: 0x318
	Size: 0xDA
	Parameters: 5
	Flags: Linked
*/
function registerremoteweapon(weaponname, hintstring, usecallback, endusecallback, hidecompassonuse)
{
	if(!isdefined(hidecompassonuse))
	{
		hidecompassonuse = 1;
	}
	/#
		assert(isdefined(level.remoteweapons));
	#/
	level.remoteweapons[weaponname] = spawnstruct();
	level.remoteweapons[weaponname].hintstring = hintstring;
	level.remoteweapons[weaponname].usecallback = usecallback;
	level.remoteweapons[weaponname].endusecallback = endusecallback;
	level.remoteweapons[weaponname].hidecompassonuse = hidecompassonuse;
}

/*
	Name: useremoteweapon
	Namespace: remote_weapons
	Checksum: 0xF681A137
	Offset: 0x400
	Size: 0x11C
	Parameters: 5
	Flags: Linked
*/
function useremoteweapon(weapon, weaponname, immediate, allowmanualdeactivation, always_allow_ride)
{
	if(!isdefined(allowmanualdeactivation))
	{
		allowmanualdeactivation = 1;
	}
	if(!isdefined(always_allow_ride))
	{
		always_allow_ride = 0;
	}
	player = self;
	/#
		assert(isplayer(player));
	#/
	weapon.remoteowner = player;
	weapon.inittime = gettime();
	weapon.remotename = weaponname;
	weapon.remoteweaponallowmanualdeactivation = allowmanualdeactivation;
	weapon thread watchremoveremotecontrolledweapon();
	if(!immediate)
	{
		weapon createremoteweapontrigger();
	}
	else
	{
		weapon thread watchownerdisconnect();
		weapon useremotecontrolweapon(allowmanualdeactivation, always_allow_ride);
	}
}

/*
	Name: watchforhack
	Namespace: remote_weapons
	Checksum: 0x8ABC9825
	Offset: 0x528
	Size: 0x96
	Parameters: 0
	Flags: None
*/
function watchforhack()
{
	weapon = self;
	weapon endon(#"death");
	waitresult = undefined;
	waitresult = weapon waittill(#"killstreak_hacked");
	if(is_true(weapon.remoteweaponallowmanualdeactivation))
	{
		weapon thread watchremotecontroldeactivate();
	}
	weapon.remoteowner = waitresult.hacker;
}

/*
	Name: on_game_ended
	Namespace: remote_weapons
	Checksum: 0x7ACE50C3
	Offset: 0x5C8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_game_ended()
{
	weapon = self;
	weapon endremotecontrolweaponuse(0, 1);
}

/*
	Name: watchremoveremotecontrolledweapon
	Namespace: remote_weapons
	Checksum: 0x5A6E28A4
	Offset: 0x600
	Size: 0xDE
	Parameters: 0
	Flags: Linked
*/
function watchremoveremotecontrolledweapon()
{
	weapon = self;
	weapon endon(#"remote_weapon_end");
	waitresult = undefined;
	waitresult = weapon waittill(#"death", #"remote_weapon_shutdown");
	if(weapon.watch_remote_weapon_death === 1 && isdefined(waitresult._notify) && waitresult._notify == "remote_weapon_shutdown")
	{
		weapon notify(#"hash_59b25025ce93a142");
	}
	weapon endremotecontrolweaponuse(0);
	while(isdefined(weapon))
	{
		waitframe(1);
	}
}

/*
	Name: createremoteweapontrigger
	Namespace: remote_weapons
	Checksum: 0xBCE25D37
	Offset: 0x6E8
	Size: 0x244
	Parameters: 0
	Flags: Linked
*/
function createremoteweapontrigger()
{
	weapon = self;
	player = weapon.remoteowner;
	if(isdefined(weapon.usetrigger))
	{
		weapon.usetrigger delete();
	}
	weapon.usetrigger = spawn("trigger_radius_use", player.origin, 0, 32, 32);
	weapon.usetrigger enablelinkto();
	weapon.usetrigger linkto(player);
	weapon.usetrigger sethintlowpriority(1);
	weapon.usetrigger setcursorhint("HINT_NOICON");
	if(isdefined(level.remoteweapons[weapon.remotename]))
	{
		weapon.usetrigger sethintstring(level.remoteweapons[weapon.remotename].hintstring);
	}
	weapon.usetrigger setteamfortrigger(player.team);
	weapon.usetrigger.team = player.team;
	player clientclaimtrigger(weapon.usetrigger);
	player.remotecontroltrigger = weapon.usetrigger;
	player.activeremotecontroltriggers[player.activeremotecontroltriggers.size] = weapon.usetrigger;
	weapon.usetrigger.claimedby = player;
	weapon thread watchweapondeath();
	weapon thread watchownerdisconnect();
	weapon thread watchremotetriggeruse();
	weapon thread watchremotetriggerdisable();
}

/*
	Name: watchweapondeath
	Namespace: remote_weapons
	Checksum: 0xE485643D
	Offset: 0x938
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function watchweapondeath()
{
	weapon = self;
	weapon.usetrigger endon(#"death");
	weapon waittill(#"death", #"remote_weapon_end");
	if(isdefined(weapon.remoteowner))
	{
		weapon.remoteowner removeandassignnewremotecontroltrigger(weapon.usetrigger);
	}
	weapon.usetrigger delete();
}

/*
	Name: watchownerdisconnect
	Namespace: remote_weapons
	Checksum: 0x7030BD70
	Offset: 0x9E0
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function watchownerdisconnect()
{
	weapon = self;
	weapon endon(#"remote_weapon_end", #"remote_weapon_shutdown");
	if(isdefined(weapon.usetrigger))
	{
		weapon.usetrigger endon(#"death");
	}
	weapon.remoteowner waittill(#"joined_team", #"disconnect", #"joined_spectators");
	endremotecontrolweaponuse(0);
	if(isdefined(weapon) && isdefined(weapon.usetrigger))
	{
		weapon.usetrigger delete();
	}
}

/*
	Name: watchremotetriggerdisable
	Namespace: remote_weapons
	Checksum: 0x87CE8F49
	Offset: 0xAD0
	Size: 0xB8
	Parameters: 0
	Flags: Linked
*/
function watchremotetriggerdisable()
{
	weapon = self;
	weapon endon(#"remote_weapon_end", #"remote_weapon_shutdown");
	weapon.usetrigger endon(#"death");
	weapon.remoteowner endon(#"disconnect");
	while(true)
	{
		weapon.usetrigger triggerenable(!weapon.remoteowner iswallrunning());
		wait(0.1);
	}
}

/*
	Name: allowremotestart
	Namespace: remote_weapons
	Checksum: 0xBF73E940
	Offset: 0xB90
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function allowremotestart(var_59d2c24b)
{
	player = self;
	if(is_true(var_59d2c24b) || player usebuttonpressed() && !player.throwinggrenade && !player meleebuttonpressed() && !player util::isusingremote() && (!(isdefined(player.carryobject) && is_true(player.carryobject.disallowremotecontrol))))
	{
		return true;
	}
	return false;
}

/*
	Name: watchremotetriggeruse
	Namespace: remote_weapons
	Checksum: 0x72F1415E
	Offset: 0xC70
	Size: 0x210
	Parameters: 0
	Flags: Linked
*/
function watchremotetriggeruse()
{
	weapon = self;
	weapon endon(#"death", #"remote_weapon_end");
	if(isbot(weapon.remoteowner))
	{
		return;
	}
	while(true)
	{
		res = undefined;
		res = weapon.usetrigger waittill(#"trigger", #"death");
		if(res._notify == "death")
		{
			return;
		}
		if(weapon.remoteowner isusingoffhand() || weapon.remoteowner iswallrunning() || (weapon.remoteowner util::isusingremote() && weapon.remoteowner.usingremote !== weapon.remotename))
		{
			continue;
		}
		if(isdefined(weapon.hackertrigger) && isdefined(weapon.hackertrigger.progressbar))
		{
			if(weapon.remotename == "killstreak_remote_turret")
			{
				weapon.remoteowner iprintlnbold(#"hash_7b4c84d5307fea60");
			}
			continue;
		}
		if(weapon.remoteowner allowremotestart())
		{
			var_48096e05 = gettime() - (isdefined(weapon.lastusetime) ? weapon.lastusetime : 0);
			if(var_48096e05 > 700)
			{
				useremotecontrolweapon();
			}
		}
	}
}

/*
	Name: useremotecontrolweapon
	Namespace: remote_weapons
	Checksum: 0xDC54AA1C
	Offset: 0xE88
	Size: 0x450
	Parameters: 2
	Flags: Linked
*/
function useremotecontrolweapon(allowmanualdeactivation, always_allow_ride)
{
	if(!isdefined(allowmanualdeactivation))
	{
		allowmanualdeactivation = 1;
	}
	if(!isdefined(always_allow_ride))
	{
		always_allow_ride = 0;
	}
	self endon(#"death");
	weapon = self;
	/#
		assert(isdefined(weapon.remoteowner));
	#/
	weapon.control_initiated = 1;
	weapon.endremotecontrolweapon = 0;
	weapon.remoteowner endon(#"disconnect", #"joined_team");
	weapon.remoteowner disableoffhandweapons();
	weapon.remoteowner disableweaponcycling();
	weapon.remoteowner.dofutz = 0;
	if(!isdefined(weapon.disableremoteweaponswitch))
	{
		remoteweapon = getweapon(#"killstreak_remote");
		weapon.remoteowner giveweapon(remoteweapon);
		weapon.remoteowner switchtoweapon(remoteweapon);
		if(always_allow_ride)
		{
			weapon.remoteowner waittill(#"weapon_change", #"death");
		}
		else
		{
			waitresult = undefined;
			waitresult = weapon.remoteowner waittill(#"weapon_change");
			newweapon = waitresult.weapon;
		}
	}
	if(isdefined(newweapon))
	{
		if(newweapon != remoteweapon || (weapon.remoteowner util::isusingremote() && weapon.remoteowner.usingremote !== weapon.remotename))
		{
			weapon.remoteowner killstreaks::clear_using_remote(1, 1);
			return;
		}
	}
	weapon callback::function_d8abfc3d(#"on_end_game", &on_game_ended);
	weapon.var_57446df7 = 1;
	weapon.remoteowner thread killstreaks::watch_for_remove_remote_weapon();
	weapon.remoteowner util::setusingremote(weapon.remotename);
	weapon.remoteowner val::set(#"useremotecontrolweapon", "freezecontrols");
	weapon.remoteowner thread resetcontrols(weapon);
	result = weapon.remoteowner killstreaks::init_ride_killstreak(weapon.remotename, always_allow_ride);
	if(result != "success")
	{
		if(result != "disconnect")
		{
			weapon.remoteowner killstreaks::clear_using_remote();
			weapon thread resetcontrolinitiateduponownerrespawn();
		}
	}
	else
	{
		weapon.controlled = 1;
		weapon.killcament = self;
		weapon notify(#"remote_start");
		if(allowmanualdeactivation)
		{
			weapon thread watchremotecontroldeactivate();
		}
		weapon.remoteowner thread [[level.remoteweapons[weapon.remotename].usecallback]](weapon);
	}
	weapon notify(#"reset_controls");
}

/*
	Name: resetcontrols
	Namespace: remote_weapons
	Checksum: 0x12166885
	Offset: 0x12E0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function resetcontrols(weapon)
{
	weapon waittill(#"death", #"reset_controls");
	if(isdefined(self))
	{
		self val::reset(#"useremotecontrolweapon", "freezecontrols");
	}
}

/*
	Name: resetcontrolinitiateduponownerrespawn
	Namespace: remote_weapons
	Checksum: 0x25C4B3DD
	Offset: 0x1350
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function resetcontrolinitiateduponownerrespawn()
{
	self endon(#"death");
	self.remoteowner waittill(#"spawned");
	self.control_initiated = 0;
}

/*
	Name: watchremotecontroldeactivate
	Namespace: remote_weapons
	Checksum: 0xADFA4B2B
	Offset: 0x1398
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function watchremotecontroldeactivate()
{
	self notify(#"watchremotecontroldeactivate_remoteweapons");
	self endon(#"watchremotecontroldeactivate_remoteweapons");
	weapon = self;
	weapon endon(#"remote_weapon_end", #"death");
	weapon.remoteowner endon(#"disconnect");
	var_f6263fe2 = getdvarfloat(#"hash_2ed1b7031dae0df7", 0.5);
	while(weapon.remoteowner usebuttonpressed())
	{
		waitframe(1);
	}
	while(true)
	{
		timeused = 0;
		weapon.remoteowner function_7deaa2a4(timeused);
		weapon.remoteowner function_9d62ff6c();
		while(weapon.remoteowner usebuttonpressed())
		{
			timeused = timeused + 0.05;
			weapon.remoteowner function_7deaa2a4(timeused / var_f6263fe2);
			if(timeused > var_f6263fe2)
			{
				weapon thread endremotecontrolweaponuse(1);
				weapon.lastusetime = gettime();
				return;
			}
			waitframe(1);
		}
		waitframe(1);
	}
}

/*
	Name: endremotecontrolweaponuse
	Namespace: remote_weapons
	Checksum: 0x607F988
	Offset: 0x1550
	Size: 0x4F0
	Parameters: 2
	Flags: Linked
*/
function endremotecontrolweaponuse(exitrequestedbyowner, gameended)
{
	weapon = self;
	if(!isdefined(weapon) || is_true(weapon.endremotecontrolweapon))
	{
		return;
	}
	weapon.endremotecontrolweapon = 1;
	remote_controlled = is_true(weapon.control_initiated) || is_true(weapon.controlled);
	while(isdefined(weapon) && weapon.forcewaitremotecontrol === 1 && remote_controlled == 0)
	{
		remote_controlled = is_true(weapon.control_initiated) || is_true(weapon.controlled);
		waitframe(1);
	}
	if(!isdefined(weapon))
	{
		return;
	}
	if(isdefined(weapon.remoteowner) && remote_controlled)
	{
		if(isdefined(weapon.remoteweaponshutdowndelay))
		{
			wait(weapon.remoteweaponshutdowndelay);
		}
		player = weapon.remoteowner;
		if(player.dofutz === 1)
		{
			player clientfield::set_to_player("static_postfx", 1);
			wait(1);
			if(isdefined(player))
			{
				player clientfield::set_to_player("static_postfx", 0);
				player.dofutz = 0;
			}
		}
		else if(!exitrequestedbyowner && weapon.watch_remote_weapon_death === 1 && !isalive(weapon))
		{
			weapon.dontfreeme = 1;
			wait((isdefined(weapon.watch_remote_weapon_death_duration) ? weapon.watch_remote_weapon_death_duration : 1));
			if(isdefined(weapon))
			{
				weapon.dontfreeme = undefined;
			}
		}
		if(isdefined(player) && !is_true(player.player_disconnected))
		{
			player thread fadetoblackandbackin();
			player waittill(#"fade2black");
			if(remote_controlled)
			{
				player unlink();
			}
			player killstreaks::clear_using_remote(0, undefined, gameended);
			cleared_killstreak_delay = 1;
			player enableusability();
		}
	}
	if(isdefined(weapon) && isdefined(weapon.remotename))
	{
		self [[level.remoteweapons[weapon.remotename].endusecallback]](weapon, exitrequestedbyowner);
	}
	if(isdefined(weapon))
	{
		weapon.killcament = weapon;
		if(isdefined(weapon.remoteowner))
		{
			if(remote_controlled)
			{
				weapon.remoteowner unlink();
				if(!is_true(cleared_killstreak_delay))
				{
					weapon.remoteowner killstreaks::reset_killstreak_delay_killcam();
				}
				weapon.remoteowner util::clientnotify("nofutz");
			}
			if(isdefined(level.gameended) && level.gameended)
			{
				weapon.remoteowner val::set(#"game_end", "freezecontrols");
			}
		}
	}
	if(isdefined(weapon))
	{
		if(is_true(weapon.var_57446df7))
		{
			weapon callback::function_52ac9652(#"on_end_game", &on_game_ended);
		}
		weapon.control_initiated = 0;
		weapon.controlled = 0;
		if(!exitrequestedbyowner || is_true(weapon.one_remote_use))
		{
			weapon.remote_weapon_end = 1;
			weapon notify(#"remote_weapon_end");
		}
	}
}

/*
	Name: fadetoblackandbackin
	Namespace: remote_weapons
	Checksum: 0xA68F6308
	Offset: 0x1A48
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function fadetoblackandbackin()
{
	self endon(#"disconnect");
	lui::screen_fade_out(0.1);
	self destroyhud();
	if(!isdefined(self))
	{
		return;
	}
	waitframe(1);
	if(!isdefined(self))
	{
		return;
	}
	self notify(#"fade2black");
	if(!isdefined(self))
	{
		return;
	}
	lui::screen_fade_in(0.2);
}

/*
	Name: stunstaticfx
	Namespace: remote_weapons
	Checksum: 0xEF1857F
	Offset: 0x1AF0
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function stunstaticfx(duration)
{
	self endon(#"remove_remote_weapon");
	wait(duration - 0.5);
	time = duration - 0.5;
	while(time < duration)
	{
		waitframe(1);
		time = time + 0.05;
	}
}

/*
	Name: destroyhud
	Namespace: remote_weapons
	Checksum: 0xCD9E0089
	Offset: 0x1B68
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function destroyhud()
{
	if(isdefined(self))
	{
		self notify(#"stop_signal_failure");
		self.flashingsignalfailure = 0;
		self clientfield::set_to_player("static_postfx", 0);
		self destroyremotehud();
		self util::clientnotify("nofutz");
	}
}

/*
	Name: destroyremotehud
	Namespace: remote_weapons
	Checksum: 0x21A77023
	Offset: 0x1BF8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function destroyremotehud()
{
	self useservervisionset(0);
	self setinfraredvision(0);
}

/*
	Name: set_static
	Namespace: remote_weapons
	Checksum: 0x19E78567
	Offset: 0x1C38
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function set_static(val)
{
	owner = self.owner;
	if(val)
	{
		if(isdefined(owner) && owner.usingvehicle && isdefined(owner.viewlockedentity) && owner.viewlockedentity == self)
		{
			owner clientfield::set_to_player("static_postfx", 1);
		}
	}
	else if(isdefined(owner))
	{
		owner function_3c9e877a();
	}
}

/*
	Name: function_3c9e877a
	Namespace: remote_weapons
	Checksum: 0x909B1602
	Offset: 0x1CE8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_3c9e877a()
{
	self clientfield::set_to_player("static_postfx", 0);
}

/*
	Name: do_static_fx
	Namespace: remote_weapons
	Checksum: 0xCDB0A1EA
	Offset: 0x1D18
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function do_static_fx()
{
	self set_static(1);
	owner = self.owner;
	wait(2);
	if(isdefined(owner))
	{
		owner function_3c9e877a();
	}
	if(isdefined(self))
	{
		self notify(#"static_fx_done");
	}
}

