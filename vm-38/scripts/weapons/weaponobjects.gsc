#using script_6b221588ece2c4aa;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\placeables.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\entityheadicons_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;

#namespace weaponobjects;

/*
	Name: function_1c88fe9d
	Namespace: weaponobjects
	Checksum: 0x32699256
	Offset: 0x388
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1c88fe9d()
{
	level notify(59250349);
}

/*
	Name: init_shared
	Namespace: weaponobjects
	Checksum: 0xFB01C6DE
	Offset: 0x3A8
	Size: 0x2BC
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	callback::on_start_gametype(&start_gametype);
	callback::on_detonate(&on_detonate);
	callback::on_double_tap_detonate(&on_double_tap_detonate);
	clientfield::register("toplayer", "proximity_alarm", 1, 3, "int");
	clientfield::register_clientuimodel("hudItems.proximityAlarm", 1, 3, "int");
	clientfield::register("missile", "retrievable", 1, 1, "int");
	clientfield::register("scriptmover", "retrievable", 1, 1, "int");
	clientfield::register("missile", "enemyequip", 1, 2, "int");
	clientfield::register("scriptmover", "enemyequip", 1, 2, "int");
	clientfield::register("missile", "teamequip", 1, 1, "int");
	clientfield::register("missile", "friendlyequip", 1, 1, "int");
	clientfield::register("scriptmover", "friendlyequip", 1, 1, "int");
	level.weaponobjectdebug = getdvarint(#"scr_weaponobject_debug", 0);
	level.supplementalwatcherobjects = [];
	/#
		level thread updatedvars();
	#/
	level.proximitygrenadedotdamagetime = getdvarfloat(#"scr_proximitygrenadedotdamagetime", 0.2);
	level.proximitygrenadedotdamageinstances = getdvarint(#"scr_proximitygrenadedotdamageinstances", 4);
}

/*
	Name: updatedvars
	Namespace: weaponobjects
	Checksum: 0x4ECFC5F3
	Offset: 0x670
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function updatedvars()
{
	while(true)
	{
		level.weaponobjectdebug = getdvarint(#"scr_weaponobject_debug", 0);
		wait(1);
	}
}

/*
	Name: start_gametype
	Namespace: weaponobjects
	Checksum: 0xB6A4CAF7
	Offset: 0x6B8
	Size: 0x244
	Parameters: 0
	Flags: Linked
*/
function start_gametype()
{
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	callback::on_disconnect(&function_ac7c2bf9);
	callback::on_joined_team(&function_ac7c2bf9);
	callback::on_joined_spectate(&function_ac7c2bf9);
	if(!isdefined(level.retrievableweapons))
	{
		level.retrievableweapons = [];
	}
	retrievables = getretrievableweapons();
	foreach(weapon in retrievables)
	{
		weaponstruct = spawnstruct();
		level.retrievableweapons[weapon.name] = weaponstruct;
	}
	level.weaponobjectexplodethisframe = 0;
	level._equipment_spark_fx = #"hash_28e1ed61483962d0";
	level._equipment_fizzleout_fx = #"hash_565dc21878e3cfbe";
	level._equipment_emp_destroy_fx = #"hash_4a466a3be8d20fe9";
	level._equipment_explode_fx = #"hash_4a466a3be8d20fe9";
	level._equipment_explode_fx_lg = #"hash_4a466a3be8d20fe9";
	level.weaponobjects_hacker_trigger_width = 32;
	level.weaponobjects_hacker_trigger_height = 32;
	function_db765b94();
	function_b455d5d8();
}

/*
	Name: on_player_connect
	Namespace: weaponobjects
	Checksum: 0x21497721
	Offset: 0x908
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(isdefined(level._weaponobjects_on_player_connect_override))
	{
		level thread [[level._weaponobjects_on_player_connect_override]]();
		return;
	}
	self.usedweapons = 0;
	self.hits = 0;
	self.var_2641e022 = 0;
}

/*
	Name: on_player_spawned
	Namespace: weaponobjects
	Checksum: 0xF1D62D2E
	Offset: 0x960
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self endon(#"disconnect");
	pixbeginevent();
	if(!isdefined(self.weaponobjectwatcherarray))
	{
		self.weaponobjectwatcherarray = [];
	}
	pixendevent();
}

/*
	Name: function_e6400478
	Namespace: weaponobjects
	Checksum: 0xF118DE8
	Offset: 0x9A8
	Size: 0xE4
	Parameters: 3
	Flags: Linked
*/
function function_e6400478(name, func, var_8411d55d)
{
	if(!isdefined(level.watcherregisters))
	{
		level.watcherregisters = [];
	}
	if(isdefined(name))
	{
		struct = level.watcherregisters[name];
		if(isdefined(struct))
		{
			if(isdefined(var_8411d55d) && var_8411d55d != 2)
			{
				struct.func = func;
				struct.var_8411d55d = var_8411d55d;
				level.watcherregisters[name] = struct;
			}
		}
		else
		{
			struct = spawnstruct();
			struct.func = func;
			struct.type = var_8411d55d;
			level.watcherregisters[name] = struct;
		}
	}
}

/*
	Name: loadout_changed
	Namespace: weaponobjects
	Checksum: 0x1EAA2C12
	Offset: 0xA98
	Size: 0x7A
	Parameters: 1
	Flags: Event
*/
event loadout_changed(eventstruct)
{
	switch(eventstruct.event)
	{
		case "give_weapon":
		case "give_weapon_dual":
		{
			weapon = eventstruct.weapon;
			self snipinterfaceattributes(weapon);
			break;
		}
	}
}

/*
	Name: snipinterfaceattributes
	Namespace: weaponobjects
	Checksum: 0x19965877
	Offset: 0xB20
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private snipinterfaceattributes(weapon)
{
	if(isdefined(level.watcherregisters))
	{
		struct = level.watcherregisters[weapon.name];
		if(isdefined(struct))
		{
			self createwatcher(weapon.name, struct.func, struct.type);
		}
		if(weapon.ischargeshot && weapon.nextchargelevelweapon != level.weaponnone)
		{
			self snipinterfaceattributes(weapon.nextchargelevelweapon);
		}
	}
}

/*
	Name: createwatcher
	Namespace: weaponobjects
	Checksum: 0xE4E10FE0
	Offset: 0xBE8
	Size: 0x148
	Parameters: 3
	Flags: Linked
*/
function createwatcher(weaponname, createfunc, var_7b2908f)
{
	if(!isdefined(var_7b2908f))
	{
		var_7b2908f = 2;
	}
	watcher = undefined;
	switch(var_7b2908f)
	{
		case 0:
		{
			watcher = self createproximityweaponobjectwatcher(weaponname, self.team);
			break;
		}
		case 1:
		{
			watcher = self createuseweaponobjectwatcher(weaponname, self.team);
			break;
		}
		default:
		{
			watcher = self createweaponobjectwatcher(weaponname, self.team);
			break;
		}
	}
	if(isdefined(createfunc))
	{
		self [[createfunc]](watcher);
	}
	retrievable = level.retrievableweapons[weaponname];
	if(isdefined(retrievable))
	{
		setupretrievablewatcher(watcher);
	}
	return watcher;
}

/*
	Name: function_db765b94
	Namespace: weaponobjects
	Checksum: 0x36E7EBD5
	Offset: 0xD38
	Size: 0x130
	Parameters: 0
	Flags: Linked, Private
*/
function private function_db765b94()
{
	watcherweapons = getwatcherweapons();
	foreach(weapon in watcherweapons)
	{
		function_e6400478(weapon.name);
	}
	foreach(struct in level.retrievableweapons)
	{
		function_e6400478(name);
	}
}

/*
	Name: setupretrievablewatcher
	Namespace: weaponobjects
	Checksum: 0x875DCD7B
	Offset: 0xE70
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private setupretrievablewatcher(watcher)
{
	if(!isdefined(watcher.onspawnretrievetriggers))
	{
		watcher.onspawnretrievetriggers = &function_23b0aea9;
	}
	if(!isdefined(watcher.ondestroyed))
	{
		watcher.ondestroyed = &ondestroyed;
	}
	if(!isdefined(watcher.pickup))
	{
		watcher.pickup = &function_db70257;
	}
}

/*
	Name: function_db70257
	Namespace: weaponobjects
	Checksum: 0x38A3BACF
	Offset: 0xEF0
	Size: 0x64
	Parameters: 2
	Flags: Linked
*/
function function_db70257(player, heldweapon)
{
	if(heldweapon.var_7d4c12af == "Automatic")
	{
		function_d9219ce2(player, heldweapon);
	}
	else
	{
		function_a6616b9c(player, heldweapon);
	}
}

/*
	Name: clearfxondeath
	Namespace: weaponobjects
	Checksum: 0xC8EA93B8
	Offset: 0xF60
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function clearfxondeath(fx)
{
	fx endon(#"death");
	self waittill(#"death", #"hacked");
	fx delete();
}

/*
	Name: deleteweaponobjectinstance
	Namespace: weaponobjects
	Checksum: 0x515142FC
	Offset: 0xFC8
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function deleteweaponobjectinstance()
{
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.minemover))
	{
		if(isdefined(self.minemover.killcament))
		{
			self.minemover.killcament delete();
		}
		self.minemover delete();
	}
	self deletedelay();
}

/*
	Name: deleteweaponobjectarray
	Namespace: weaponobjects
	Checksum: 0x1B81356A
	Offset: 0x1058
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function deleteweaponobjectarray()
{
	if(isdefined(self.objectarray))
	{
		keys = getarraykeys(self.objectarray);
		foreach(key in keys)
		{
			if(!isdefined(self.objectarray[key]))
			{
				continue;
			}
			self.objectarray[key] deleteweaponobjectinstance();
			self.objectarray[key] = undefined;
		}
	}
	self.objectarray = [];
}

/*
	Name: weapondetonate
	Namespace: weaponobjects
	Checksum: 0x3D04C61B
	Offset: 0x1158
	Size: 0x18C
	Parameters: 2
	Flags: Linked
*/
function weapondetonate(attacker, weapon)
{
	if(isdefined(weapon) && weapon.isemp)
	{
		self delete();
		return;
	}
	function_b4793bda(self, self.weapon);
	if(isdefined(attacker))
	{
		if(isdefined(self.owner) && attacker != self.owner)
		{
			self.playdialog = 1;
		}
		if(isplayer(attacker))
		{
			self detonate(attacker);
		}
		else
		{
			self detonate();
		}
	}
	else
	{
		if(isdefined(self.owner) && isplayer(self.owner))
		{
			self.playdialog = 0;
			self detonate(self.owner);
		}
		else
		{
			self detonate();
		}
	}
	if(isdefined(self.owner) && isplayer(self.owner))
	{
		self setstate(4);
	}
}

/*
	Name: detonatewhenstationary
	Namespace: weaponobjects
	Checksum: 0xDA24CA04
	Offset: 0x12F0
	Size: 0xC4
	Parameters: 4
	Flags: Linked
*/
function detonatewhenstationary(object, delay, attacker, weapon)
{
	level endon(#"game_ended");
	object endon(#"death", #"hacked", #"detonating");
	if(object isonground() == 0)
	{
		object waittill(#"stationary");
	}
	self thread waitanddetonate(object, delay, attacker, weapon);
}

/*
	Name: waitanddetonate
	Namespace: weaponobjects
	Checksum: 0xB1CB795A
	Offset: 0x13C0
	Size: 0x408
	Parameters: 4
	Flags: Linked
*/
function waitanddetonate(object, delay, attacker, weapon)
{
	object endon(#"death", #"hacked");
	if(!isdefined(object))
	{
		return;
	}
	if(!isdefined(attacker) && !isdefined(weapon) && object.weapon.proximityalarmactivationdelay > 0)
	{
		if(is_true(object.armed_detonation_wait))
		{
			return;
		}
		object.armed_detonation_wait = 1;
		while(!is_true(object.proximity_deployed))
		{
			waitframe(1);
		}
	}
	if(is_true(object.detonated))
	{
		return;
	}
	object.detonated = 1;
	object notify(#"detonating");
	isempdetonated = isdefined(weapon) && weapon.isemp;
	if(isempdetonated && object.weapon.doempdestroyfx)
	{
		object.stun_fx = 1;
		randangle = randomfloat(360);
		playfx(level._equipment_emp_destroy_fx, object.origin + vectorscale((0, 0, 1), 5), (cos(randangle), sin(randangle), 0), anglestoup(object.angles));
		empfxdelay = 1.1;
	}
	if(isdefined(object.var_cea6a2fb))
	{
		object.var_cea6a2fb placeables::forceshutdown();
	}
	if(!isdefined(self.ondetonatecallback))
	{
		return;
	}
	if(!isempdetonated && !isdefined(weapon))
	{
		if(isdefined(self.detonationdelay) && self.detonationdelay > 0)
		{
			if(isdefined(self.detonationsound))
			{
				object playsound(self.detonationsound);
			}
			delay = self.detonationdelay;
		}
	}
	else if(isdefined(empfxdelay))
	{
		delay = empfxdelay;
	}
	if(delay > 0)
	{
		wait(delay);
	}
	if(isdefined(attacker) && isplayer(attacker) && isdefined(attacker.pers[#"team"]) && isdefined(object.owner) && isdefined(object.owner.pers) && isdefined(object.owner.pers[#"team"]))
	{
		if(level.teambased)
		{
			if(util::function_fbce7263(attacker.pers[#"team"], object.owner.pers[#"team"]))
			{
				attacker notify(#"destroyed_explosive");
			}
		}
		else if(attacker != object.owner)
		{
			attacker notify(#"destroyed_explosive");
		}
	}
	object [[self.ondetonatecallback]](attacker, weapon, undefined);
}

/*
	Name: waitandfizzleout
	Namespace: weaponobjects
	Checksum: 0xAB659730
	Offset: 0x17D0
	Size: 0xF0
	Parameters: 2
	Flags: Linked
*/
function waitandfizzleout(object, delay)
{
	object endon(#"death", #"hacked");
	if(isdefined(object.detonated) && object.detonated == 1)
	{
		return;
	}
	object.detonated = 1;
	object notify(#"fizzleout");
	if(delay > 0)
	{
		wait(delay);
	}
	if(isdefined(object.var_cea6a2fb))
	{
		object.var_cea6a2fb placeables::forceshutdown();
	}
	if(!isdefined(self.onfizzleout))
	{
		object delete();
		return;
	}
	object [[self.onfizzleout]]();
}

/*
	Name: detonateweaponobjectarray
	Namespace: weaponobjects
	Checksum: 0x17416A52
	Offset: 0x18C8
	Size: 0x222
	Parameters: 2
	Flags: Linked
*/
function detonateweaponobjectarray(forcedetonation, weapon)
{
	undetonated = [];
	if(isdefined(self.objectarray))
	{
		for(i = 0; i < self.objectarray.size; i++)
		{
			if(isdefined(self.objectarray[i]))
			{
				if(self.objectarray[i] isstunned() && forcedetonation == 0)
				{
					undetonated[undetonated.size] = self.objectarray[i];
					continue;
				}
				if(isdefined(weapon))
				{
					if(weapon util::ishacked() && weapon.name != self.objectarray[i].weapon.name)
					{
						undetonated[undetonated.size] = self.objectarray[i];
						continue;
					}
					else if(self.objectarray[i] util::ishacked() && weapon.name != self.objectarray[i].weapon.name)
					{
						undetonated[undetonated.size] = self.objectarray[i];
						continue;
					}
				}
				if(isdefined(self.detonatestationary) && self.detonatestationary && forcedetonation == 0)
				{
					self thread detonatewhenstationary(self.objectarray[i], 0, undefined, weapon);
					continue;
				}
				self thread waitanddetonate(self.objectarray[i], 0, undefined, weapon);
			}
		}
	}
	self.objectarray = undetonated;
}

/*
	Name: addweaponobjecttowatcher
	Namespace: weaponobjects
	Checksum: 0x648C1000
	Offset: 0x1AF8
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function addweaponobjecttowatcher(watchername, weapon_instance)
{
	watcher = getweaponobjectwatcher(watchername);
	/#
		assert(isdefined(watcher), ("" + watchername) + "");
	#/
	self addweaponobject(watcher, weapon_instance);
}

/*
	Name: addweaponobject
	Namespace: weaponobjects
	Checksum: 0x136BAA34
	Offset: 0x1B80
	Size: 0x2F4
	Parameters: 3
	Flags: Linked
*/
function addweaponobject(watcher, weapon_instance, weapon)
{
	if(!isdefined(weapon_instance))
	{
		return;
	}
	if(!isdefined(watcher.storedifferentobject))
	{
		watcher.objectarray[watcher.objectarray.size] = weapon_instance;
	}
	if(!isdefined(weapon))
	{
		weapon = watcher.weapon;
	}
	weapon_instance.owner = self;
	weapon_instance.detonated = 0;
	weapon_instance.weapon = weapon;
	if(isdefined(watcher.ondamage))
	{
		weapon_instance thread [[watcher.ondamage]](watcher);
	}
	else
	{
		weapon_instance thread weaponobjectdamage(watcher);
	}
	weapon_instance.ownergetsassist = watcher.ownergetsassist;
	weapon_instance.destroyedbyemp = watcher.destroyedbyemp;
	if(isdefined(watcher.onspawn))
	{
		weapon_instance thread [[watcher.onspawn]](watcher, self);
	}
	if(isdefined(watcher.onspawnfx))
	{
		weapon_instance thread [[watcher.onspawnfx]]();
	}
	weapon_instance setupreconeffect();
	if(isdefined(watcher.onspawnretrievetriggers))
	{
		weapon_instance thread [[watcher.onspawnretrievetriggers]](watcher, self);
	}
	if(watcher.hackable)
	{
		weapon_instance thread hackerinit(watcher);
	}
	if(watcher.playdestroyeddialog)
	{
		weapon_instance thread playdialogondeath(self);
		weapon_instance thread watchobjectdamage(self);
	}
	if(watcher.deleteonkillbrush)
	{
		if(isdefined(level.deleteonkillbrushoverride))
		{
			weapon_instance thread [[level.deleteonkillbrushoverride]](self, watcher);
		}
		else
		{
			weapon_instance thread deleteonkillbrush(self);
		}
	}
	if(weapon_instance useteamequipmentclientfield(watcher))
	{
		weapon_instance clientfield::set("teamequip", 1);
	}
	if(watcher.timeout)
	{
		weapon_instance thread weapon_object_timeout(watcher, undefined);
	}
	if(isdefined(watcher.var_994b472b))
	{
		weapon_instance thread function_6d8aa6a0(self, watcher);
	}
	weapon_instance thread delete_on_notify(self);
	weapon_instance thread cleanupwatcherondeath(watcher);
	weapon_instance thread function_b9ade2b();
}

/*
	Name: function_6d8aa6a0
	Namespace: weaponobjects
	Checksum: 0x962F250B
	Offset: 0x1E80
	Size: 0x19C
	Parameters: 2
	Flags: Linked
*/
function function_6d8aa6a0(player, watcher)
{
	self endon(#"death", #"hacked", #"hash_3a9500a4f045d0f3");
	waittills = [3:"changed_specialist", 2:"disconnect", 1:"joined_spectators", 0:"joined_team"];
	if((isdefined(watcher.weapon.var_87a1c29f) ? watcher.weapon.var_87a1c29f : 0))
	{
		waittills[waittills.size] = "spawned";
	}
	if(isdefined(watcher.var_10efd558))
	{
		waittills[waittills.size] = watcher.var_10efd558;
	}
	while(isdefined(player))
	{
		result = undefined;
		result = player waittill(waittills);
		if(is_true(result.var_51246a31) && is_true(self.ishacked))
		{
			continue;
		}
		break;
	}
	if(isdefined(self) && isdefined(player) && isdefined(watcher.var_994b472b))
	{
		self [[watcher.var_994b472b]](player);
	}
}

/*
	Name: function_b9ade2b
	Namespace: weaponobjects
	Checksum: 0xC967C94C
	Offset: 0x2028
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_b9ade2b()
{
	weapon_instance = self;
	weapon_instance endon(#"death");
	weapon_instance waittill(#"picked_up");
	weapon_instance.playdialog = 0;
	weapon_instance delete();
}

/*
	Name: cleanupwatcherondeath
	Namespace: weaponobjects
	Checksum: 0x34C9694F
	Offset: 0x2098
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function cleanupwatcherondeath(watcher)
{
	weapon_instance = self;
	weapon_instance waittill(#"death");
	if(isdefined(watcher) && isdefined(watcher.objectarray))
	{
		removeweaponobject(watcher, weapon_instance);
	}
	if(isdefined(weapon_instance) && weapon_instance.delete_on_death === 1)
	{
		weapon_instance deleteweaponobjectinstance();
	}
}

/*
	Name: weapon_object_timeout
	Namespace: weaponobjects
	Checksum: 0x94614B51
	Offset: 0x2138
	Size: 0xBC
	Parameters: 2
	Flags: Linked
*/
function weapon_object_timeout(watcher, var_84e5ee08)
{
	weapon_instance = self;
	weapon_instance endon(#"death", #"cancel_timeout");
	var_754e514 = (isdefined(var_84e5ee08) ? var_84e5ee08 : watcher.timeout);
	wait(var_754e514);
	if(isdefined(watcher) && isdefined(watcher.ontimeout))
	{
		weapon_instance thread [[watcher.ontimeout]]();
	}
	else
	{
		weapon_instance delete();
	}
}

/*
	Name: delete_on_notify
	Namespace: weaponobjects
	Checksum: 0x7B660092
	Offset: 0x2200
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function delete_on_notify(e_player)
{
	weapon_instance = self;
	if(isplayer(e_player))
	{
		e_player endon(#"disconnect");
	}
	else
	{
		e_player endon(#"death");
	}
	weapon_instance endon(#"death");
	e_player waittill(#"hash_5af33713e88a6df7");
	weapon_instance delete();
}

/*
	Name: removeweaponobject
	Namespace: weaponobjects
	Checksum: 0xFD493167
	Offset: 0x22B0
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function removeweaponobject(watcher, weapon_instance)
{
	arrayremovevalue(watcher.objectarray, undefined);
	arrayremovevalue(watcher.objectarray, weapon_instance);
}

/*
	Name: cleanweaponobjectarray
	Namespace: weaponobjects
	Checksum: 0xF49CD5E5
	Offset: 0x2310
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function cleanweaponobjectarray(watcher)
{
	arrayremovevalue(watcher.objectarray, undefined);
}

/*
	Name: weapon_object_do_damagefeedback
	Namespace: weaponobjects
	Checksum: 0xAD0CF616
	Offset: 0x2348
	Size: 0x94
	Parameters: 4
	Flags: Linked
*/
function weapon_object_do_damagefeedback(weapon, attacker, mod, inflictor)
{
	if(isdefined(weapon) && isdefined(attacker))
	{
		if(damage::friendlyfirecheck(self.owner, attacker))
		{
			if(damagefeedback::dodamagefeedback(weapon, attacker))
			{
				attacker damagefeedback::update(mod, inflictor, undefined, weapon, self);
			}
		}
	}
}

/*
	Name: weaponobjectdamage
	Namespace: weaponobjects
	Checksum: 0x65A891C9
	Offset: 0x23E8
	Size: 0x4B4
	Parameters: 1
	Flags: Linked
*/
function weaponobjectdamage(watcher)
{
	self endon(#"death", #"hacked", #"detonating");
	self setcandamage(1);
	self.maxhealth = 100000;
	self.health = self.maxhealth;
	self.damagetaken = 0;
	attacker = undefined;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		attacker = waitresult.attacker;
		weapon = waitresult.weapon;
		damage = waitresult.amount;
		type = waitresult.mod;
		idflags = waitresult.flags;
		damage = weapons::function_74bbb3fa(damage, weapon, self.weapon);
		self.damagetaken = self.damagetaken + damage;
		if(!isplayer(attacker) && isdefined(attacker.owner))
		{
			attacker = attacker.owner;
		}
		if(isdefined(weapon))
		{
			self weapon_object_do_damagefeedback(weapon, attacker, type, waitresult.inflictor);
			if(watcher.stuntime > 0 && weapon.dostun)
			{
				self thread stunstart(watcher, watcher.stuntime);
				continue;
			}
		}
		if(!level.weaponobjectdebug && level.teambased && isplayer(attacker) && isdefined(self.owner))
		{
			if(!level.hardcoremode && !util::function_fbce7263(self.owner.team, attacker.pers[#"team"]) && self.owner != attacker)
			{
				continue;
			}
		}
		if(isdefined(watcher.var_34400f36) && !self [[watcher.var_34400f36]](watcher, attacker, weapon, damage))
		{
			continue;
		}
		if(!isvehicle(self) && !damage::friendlyfirecheck(self.owner, attacker))
		{
			continue;
		}
		if(util::function_fbce7263(attacker.team, self.team))
		{
			killstreaks::function_e729ccee(attacker, weapon);
		}
		break;
	}
	if(level.weaponobjectexplodethisframe)
	{
		wait(0.1 + randomfloat(0.4));
	}
	else
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	level.weaponobjectexplodethisframe = 1;
	thread resetweaponobjectexplodethisframe();
	self entityheadicons::setentityheadicon("none");
	if(isdefined(type) && (issubstr(type, "MOD_GRENADE_SPLASH") || issubstr(type, "MOD_GRENADE") || issubstr(type, "MOD_EXPLOSIVE")))
	{
		self.waschained = 1;
	}
	if(isdefined(idflags) && idflags & 8)
	{
		self.wasdamagedfrombulletpenetration = 1;
	}
	self.wasdamaged = 1;
	watcher thread waitanddetonate(self, 0, attacker, weapon);
}

/*
	Name: playdialogondeath
	Namespace: weaponobjects
	Checksum: 0xBA5BD5F9
	Offset: 0x28A8
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function playdialogondeath(owner)
{
	owner endon(#"death");
	self endon(#"hacked");
	self waittill(#"death");
	if(isdefined(self.playdialog) && self.playdialog)
	{
		if(isdefined(owner) && isdefined(level.playequipmentdestroyedonplayer))
		{
			owner [[level.playequipmentdestroyedonplayer]]();
		}
	}
}

/*
	Name: watchobjectdamage
	Namespace: weaponobjects
	Checksum: 0x6D020E58
	Offset: 0x2940
	Size: 0xD6
	Parameters: 1
	Flags: Linked
*/
function watchobjectdamage(owner)
{
	owner endon(#"death");
	self endon(#"hacked", #"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(isdefined(waitresult.attacker) && isplayer(waitresult.attacker) && waitresult.attacker != owner)
		{
			self.playdialog = 1;
		}
		else
		{
			self.playdialog = 0;
		}
	}
}

/*
	Name: stunstart
	Namespace: weaponobjects
	Checksum: 0x74011FC7
	Offset: 0x2A20
	Size: 0x134
	Parameters: 2
	Flags: Linked
*/
function stunstart(watcher, time)
{
	self endon(#"death");
	if(self isstunned())
	{
		return;
	}
	if(isdefined(watcher.onstun))
	{
		self thread [[watcher.onstun]]();
	}
	if(watcher.name == "rcbomb")
	{
		self.owner val::set(#"weaponobjects", "freezecontrols", 1);
	}
	if(isdefined(time))
	{
		wait(time);
	}
	else
	{
		return;
	}
	if(watcher.name == "rcbomb")
	{
		self.owner val::reset(#"weaponobjects", "freezecontrols");
	}
	self stunstop();
}

/*
	Name: stunstop
	Namespace: weaponobjects
	Checksum: 0xF960EA27
	Offset: 0x2B60
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function stunstop()
{
	self notify(#"not_stunned");
}

/*
	Name: weaponstun
	Namespace: weaponobjects
	Checksum: 0xBE4AE3AF
	Offset: 0x2B90
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function weaponstun()
{
	self endon(#"death", #"not_stunned");
	origin = self gettagorigin("tag_fx");
	if(!isdefined(origin))
	{
		origin = self.origin + vectorscale((0, 0, 1), 10);
	}
	self.stun_fx = spawn("script_model", origin);
	self.stun_fx setmodel(#"tag_origin");
	self thread stunfxthink(self.stun_fx);
	wait(0.1);
	playfxontag(level._equipment_spark_fx, self.stun_fx, "tag_origin");
}

/*
	Name: stunfxthink
	Namespace: weaponobjects
	Checksum: 0x25641B6F
	Offset: 0x2CA8
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function stunfxthink(fx)
{
	fx endon(#"death");
	self waittill(#"death", #"not_stunned");
	fx delete();
}

/*
	Name: isstunned
	Namespace: weaponobjects
	Checksum: 0xE38EC5ED
	Offset: 0x2D10
	Size: 0xC
	Parameters: 0
	Flags: Linked
*/
function isstunned()
{
	return isdefined(self.stun_fx);
}

/*
	Name: weaponobjectfizzleout
	Namespace: weaponobjects
	Checksum: 0x678AC7D3
	Offset: 0x2D28
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function weaponobjectfizzleout()
{
	self endon(#"death");
	function_f2a06099(self, self.weapon);
	self deletedelay();
}

/*
	Name: function_f245df1e
	Namespace: weaponobjects
	Checksum: 0x41C556C2
	Offset: 0x2D80
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_f245df1e()
{
	self endon(#"death");
	randangle = randomfloat(360);
	playfx(level._equipment_emp_destroy_fx, self.origin + vectorscale((0, 0, 1), 5), (cos(randangle), sin(randangle), 0), anglestoup(self.angles));
	wait(1.1);
	self delete();
}

/*
	Name: function_127fb8f3
	Namespace: weaponobjects
	Checksum: 0x7C3E0A97
	Offset: 0x2E58
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function function_127fb8f3(var_983dc34, attackingplayer)
{
	if(isdefined(var_983dc34) && isdefined(var_983dc34.var_2d045452))
	{
		var_983dc34.var_2d045452 thread waitanddetonate(var_983dc34, 0.05, attackingplayer, getweapon(#"eq_emp_grenade"));
	}
	else
	{
		var_983dc34 function_f245df1e();
	}
}

/*
	Name: function_b4793bda
	Namespace: weaponobjects
	Checksum: 0x7ED28098
	Offset: 0x2EF8
	Size: 0x18C
	Parameters: 2
	Flags: Linked
*/
function function_b4793bda(entity, weapon)
{
	if(!isdefined(weapon.customsettings))
	{
		return;
	}
	customsettings = weapons::function_7a677105(weapon);
	fx = customsettings.detonatefx;
	if(isdefined(fx))
	{
		tag = customsettings.var_abd3e497;
		if(isdefined(tag))
		{
			origin = entity gettagorigin(tag);
			angles = entity gettagangles(tag);
		}
		origin = (isdefined(origin) ? origin : entity.origin);
		angles = (isdefined(angles) ? angles : entity.angles);
		if(isdefined(tag))
		{
			var_bc514cf = anglestoforward(angles);
			fxup = anglestoup(angles);
		}
		else
		{
			var_bc514cf = anglestoup(angles);
			fxup = anglestoforward(angles);
		}
		playfx(fx, origin, var_bc514cf, fxup);
	}
}

/*
	Name: function_f2a06099
	Namespace: weaponobjects
	Checksum: 0x16E972BE
	Offset: 0x3090
	Size: 0x1A4
	Parameters: 2
	Flags: Linked
*/
function function_f2a06099(entity, weapon)
{
	if(isdefined(weapon.customsettings))
	{
		customsettings = weapons::function_7a677105(weapon);
		fx = customsettings.var_9fed82b8;
		tag = customsettings.var_41d39c92;
	}
	fx = (isdefined(fx) ? fx : level._equipment_fizzleout_fx);
	if(isdefined(tag))
	{
		origin = entity gettagorigin(tag);
		angles = entity gettagangles(tag);
	}
	origin = (isdefined(origin) ? origin : entity.origin);
	angles = (isdefined(angles) ? angles : entity.angles);
	if(isdefined(tag))
	{
		var_bc514cf = anglestoforward(angles);
		fxup = anglestoup(angles);
	}
	else
	{
		var_bc514cf = anglestoup(angles);
		fxup = anglestoforward(angles);
	}
	playfx(fx, origin, var_bc514cf, fxup);
}

/*
	Name: resetweaponobjectexplodethisframe
	Namespace: weaponobjects
	Checksum: 0x3BA7FFB2
	Offset: 0x3240
	Size: 0x18
	Parameters: 0
	Flags: Linked
*/
function resetweaponobjectexplodethisframe()
{
	waitframe(1);
	level.weaponobjectexplodethisframe = 0;
}

/*
	Name: getweaponobjectwatcher
	Namespace: weaponobjects
	Checksum: 0xC6F0ED3B
	Offset: 0x3260
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function getweaponobjectwatcher(name)
{
	if(!isdefined(self.weaponobjectwatcherarray) || !isdefined(name))
	{
		return undefined;
	}
	for(watcher = 0; watcher < self.weaponobjectwatcherarray.size; watcher++)
	{
		if(self.weaponobjectwatcherarray[watcher].name == name || (isdefined(self.weaponobjectwatcherarray[watcher].altname) && self.weaponobjectwatcherarray[watcher].altname == name))
		{
			return self.weaponobjectwatcherarray[watcher];
		}
	}
	return undefined;
}

/*
	Name: getweaponobjectwatcherbyweapon
	Namespace: weaponobjects
	Checksum: 0x17D9EF6E
	Offset: 0x3320
	Size: 0xF8
	Parameters: 1
	Flags: Linked
*/
function getweaponobjectwatcherbyweapon(weapon)
{
	if(!isdefined(self.weaponobjectwatcherarray))
	{
		return undefined;
	}
	for(watcher = 0; watcher < self.weaponobjectwatcherarray.size; watcher++)
	{
		if(isdefined(self.weaponobjectwatcherarray[watcher].weapon))
		{
			if(self.weaponobjectwatcherarray[watcher].weapon == weapon || self.weaponobjectwatcherarray[watcher].weapon == weapon.rootweapon)
			{
				return self.weaponobjectwatcherarray[watcher];
			}
			if(isdefined(self.weaponobjectwatcherarray[watcher].altweapon) && self.weaponobjectwatcherarray[watcher].altweapon == weapon.rootweapon)
			{
				return self.weaponobjectwatcherarray[watcher];
			}
		}
	}
	return undefined;
}

/*
	Name: resetweaponobjectwatcher
	Namespace: weaponobjects
	Checksum: 0x9EB679C
	Offset: 0x3420
	Size: 0x82
	Parameters: 2
	Flags: Linked
*/
function resetweaponobjectwatcher(watcher, ownerteam)
{
	if(watcher.deleteonplayerspawn || (isdefined(watcher.ownerteam) && watcher.ownerteam != ownerteam))
	{
		self notify(#"weapon_object_destroyed");
		watcher deleteweaponobjectarray();
	}
	watcher.ownerteam = ownerteam;
}

/*
	Name: createweaponobjectwatcher
	Namespace: weaponobjects
	Checksum: 0x39F8F8EA
	Offset: 0x34B0
	Size: 0x308
	Parameters: 2
	Flags: Linked, Private
*/
function private createweaponobjectwatcher(weaponname, ownerteam)
{
	if(!isdefined(self.weaponobjectwatcherarray))
	{
		self.weaponobjectwatcherarray = [];
	}
	weaponobjectwatcher = getweaponobjectwatcher(weaponname);
	if(!isdefined(weaponobjectwatcher))
	{
		weaponobjectwatcher = spawnstruct();
		self.weaponobjectwatcherarray[self.weaponobjectwatcherarray.size] = weaponobjectwatcher;
		weaponobjectwatcher.name = weaponname;
		weaponobjectwatcher.type = "use";
		weaponobjectwatcher.weapon = getweapon(weaponname);
		weaponobjectwatcher.watchforfire = 0;
		weaponobjectwatcher.hackable = 0;
		weaponobjectwatcher.altdetonate = 0;
		weaponobjectwatcher.detectable = 1;
		weaponobjectwatcher.stuntime = 0;
		weaponobjectwatcher.timeout = getweapon(weaponname).lifetime;
		weaponobjectwatcher.destroyedbyemp = 1;
		weaponobjectwatcher.activatesound = undefined;
		weaponobjectwatcher.ignoredirection = undefined;
		weaponobjectwatcher.immediatedetonation = undefined;
		weaponobjectwatcher.deploysound = weaponobjectwatcher.weapon.firesound;
		weaponobjectwatcher.deploysoundplayer = weaponobjectwatcher.weapon.firesoundplayer;
		weaponobjectwatcher.pickupsound = weaponobjectwatcher.weapon.pickupsound;
		weaponobjectwatcher.pickupsoundplayer = weaponobjectwatcher.weapon.pickupsoundplayer;
		weaponobjectwatcher.altweapon = weaponobjectwatcher.weapon.altweapon;
		weaponobjectwatcher.ownergetsassist = 0;
		weaponobjectwatcher.playdestroyeddialog = 1;
		weaponobjectwatcher.deleteonkillbrush = 1;
		weaponobjectwatcher.deleteondifferentobjectspawn = 1;
		weaponobjectwatcher.enemydestroy = 0;
		weaponobjectwatcher.deleteonplayerspawn = weaponobjectwatcher.weapon.var_87a1c29f;
		weaponobjectwatcher.ignorevehicles = 0;
		weaponobjectwatcher.ignoreai = 0;
		weaponobjectwatcher.activationdelay = 0;
		weaponobjectwatcher.onspawn = undefined;
		weaponobjectwatcher.onspawnfx = undefined;
		weaponobjectwatcher.onspawnretrievetriggers = undefined;
		weaponobjectwatcher.ondetonatecallback = undefined;
		weaponobjectwatcher.onstun = undefined;
		weaponobjectwatcher.onstunfinished = undefined;
		weaponobjectwatcher.ondestroyed = undefined;
		weaponobjectwatcher.onfizzleout = &weaponobjectfizzleout;
		weaponobjectwatcher.var_34400f36 = undefined;
		weaponobjectwatcher.onsupplementaldetonatecallback = undefined;
		weaponobjectwatcher.ontimeout = undefined;
		weaponobjectwatcher.var_994b472b = undefined;
		if(!isdefined(weaponobjectwatcher.objectarray))
		{
			weaponobjectwatcher.objectarray = [];
		}
	}
	resetweaponobjectwatcher(weaponobjectwatcher, ownerteam);
	return weaponobjectwatcher;
}

/*
	Name: createuseweaponobjectwatcher
	Namespace: weaponobjects
	Checksum: 0x318319CF
	Offset: 0x37C0
	Size: 0x5E
	Parameters: 2
	Flags: Linked, Private
*/
function private createuseweaponobjectwatcher(weaponname, ownerteam)
{
	weaponobjectwatcher = createweaponobjectwatcher(weaponname, ownerteam);
	weaponobjectwatcher.type = "use";
	weaponobjectwatcher.onspawn = &onspawnuseweaponobject;
	return weaponobjectwatcher;
}

/*
	Name: createproximityweaponobjectwatcher
	Namespace: weaponobjects
	Checksum: 0x4964C25B
	Offset: 0x3828
	Size: 0x126
	Parameters: 2
	Flags: Linked, Private
*/
function private createproximityweaponobjectwatcher(weaponname, ownerteam)
{
	weaponobjectwatcher = createweaponobjectwatcher(weaponname, ownerteam);
	weaponobjectwatcher.type = "proximity";
	weaponobjectwatcher.onspawn = &onspawnproximityweaponobject;
	detectionconeangle = getdvarint(#"scr_weaponobject_coneangle", 70);
	weaponobjectwatcher.detectiondot = cos(detectionconeangle);
	weaponobjectwatcher.detectionmindist = getdvarint(#"scr_weaponobject_mindist", 20);
	weaponobjectwatcher.detectiongraceperiod = getdvarfloat(#"scr_weaponobject_graceperiod", 0.6);
	weaponobjectwatcher.detonateradius = getdvarint(#"scr_weaponobject_radius", 180);
	return weaponobjectwatcher;
}

/*
	Name: wasproximityalarmactivatedbyself
	Namespace: weaponobjects
	Checksum: 0xE94CA2B7
	Offset: 0x3958
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function wasproximityalarmactivatedbyself()
{
	return isdefined(self.owner.var_4cd6885) && self.owner.var_4cd6885 == self;
}

/*
	Name: proximityalarmactivate
	Namespace: weaponobjects
	Checksum: 0x5946762B
	Offset: 0x3990
	Size: 0x1D4
	Parameters: 3
	Flags: Linked
*/
function proximityalarmactivate(active, watcher, var_af12fba0)
{
	if(!isplayer(self.owner))
	{
		return;
	}
	var_9292c6b5 = var_af12fba0.var_82aa8ec4 === 1;
	if(watcher && !isdefined(self.owner.var_4cd6885))
	{
		self.owner.var_4cd6885 = self;
		state = (var_9292c6b5 ? 3 : 2);
		self setstate(state);
	}
	else if(!isdefined(self) || self wasproximityalarmactivatedbyself() || (!var_9292c6b5 && self.owner clientfield::get_to_player("proximity_alarm") == 1))
	{
		self.owner.var_4cd6885 = undefined;
		state = 0;
		if(var_9292c6b5)
		{
			curstate = self.owner clientfield::get_to_player("proximity_alarm");
			switch(curstate)
			{
				case 4:
				case 5:
				{
					state = curstate;
					break;
				}
				default:
				{
					state = 2;
					break;
				}
			}
		}
		self setstate(state);
	}
}

/*
	Name: setstate
	Namespace: weaponobjects
	Checksum: 0x2BED626B
	Offset: 0x3B70
	Size: 0x108
	Parameters: 1
	Flags: Linked
*/
function setstate(newstate)
{
	player = self.owner;
	if(!isplayer(player))
	{
		return;
	}
	curstate = player clientfield::get_to_player("proximity_alarm");
	if(curstate != newstate)
	{
		player clientfield::set_to_player("proximity_alarm", newstate);
		player clientfield::set_player_uimodel("hudItems.proximityAlarm", newstate);
		watcher = player getweaponobjectwatcherbyweapon(self.weapon);
		if(isdefined(watcher) && isdefined(watcher.var_cfc18899))
		{
			self [[watcher.var_cfc18899]](curstate, newstate, player.var_4cd6885);
		}
	}
}

/*
	Name: proximityalarmloop
	Namespace: weaponobjects
	Checksum: 0xDE2613CD
	Offset: 0x3C80
	Size: 0x6C2
	Parameters: 2
	Flags: Linked
*/
function proximityalarmloop(watcher, owner)
{
	level endon(#"game_ended");
	self endon(#"death", #"hacked", #"detonating");
	if(self.weapon.proximityalarminnerradius <= 0)
	{
		return;
	}
	self util::waittillnotmoving();
	var_9292c6b5 = watcher.var_82aa8ec4 === 1;
	if(var_9292c6b5 && !is_true(self.owner._disable_proximity_alarms))
	{
		curstate = self.owner clientfield::get_to_player("proximity_alarm");
		if(curstate != 5)
		{
			self setstate(1);
		}
	}
	delaytimesec = float(self.weapon.proximityalarmactivationdelay) / 1000;
	if(delaytimesec > 0)
	{
		wait(delaytimesec);
		if(!isdefined(self))
		{
			return;
		}
	}
	if(!is_true(self.owner._disable_proximity_alarms))
	{
		state = (var_9292c6b5 ? 2 : 1);
		self setstate(state);
	}
	self.proximity_deployed = 1;
	alarmstatusold = "notify";
	alarmstatus = "off";
	var_af12fba0 = undefined;
	while(true)
	{
		wait(0.05);
		if(!isdefined(self.owner) || !isplayer(self.owner))
		{
			return;
		}
		if(isalive(self.owner) == 0 && self.owner util::isusingremote() == 0)
		{
			self proximityalarmactivate(0, watcher);
			return;
		}
		if(is_true(self.owner._disable_proximity_alarms))
		{
			self proximityalarmactivate(0, watcher);
		}
		else if(alarmstatus != alarmstatusold || (alarmstatus == "on" && !isdefined(self.owner.var_4cd6885)))
		{
			if(alarmstatus == "on")
			{
				self proximityalarmactivate(1, watcher, var_af12fba0);
			}
			else
			{
				self proximityalarmactivate(0, watcher);
			}
			alarmstatusold = alarmstatus;
		}
		alarmstatus = "off";
		var_af12fba0 = undefined;
		actors = getactorarray();
		players = getplayers();
		detectentities = arraycombine(players, actors, 0, 0);
		foreach(entity in detectentities)
		{
			wait(0.05);
			if(!isdefined(entity))
			{
				continue;
			}
			owner = entity;
			if(isactor(entity) && (!isdefined(entity.isaiclone) || !entity.isaiclone))
			{
				continue;
			}
			else if(isactor(entity))
			{
				owner = entity.owner;
			}
			if(entity.team == #"spectator")
			{
				continue;
			}
			if(level.weaponobjectdebug != 1)
			{
				if(owner hasperk(#"specialty_detectexplosive"))
				{
					continue;
				}
				if(isdefined(self.owner) && owner == self.owner)
				{
					continue;
				}
				if(!damage::friendlyfirecheck(self.owner, owner, 0))
				{
					continue;
				}
			}
			if(self isstunned())
			{
				continue;
			}
			if(!isalive(entity))
			{
				continue;
			}
			if(isdefined(watcher.immunespecialty) && owner hasperk(watcher.immunespecialty))
			{
				continue;
			}
			radius = self.weapon.proximityalarmouterradius;
			distancesqr = distancesquared(self.origin, entity.origin);
			if(radius * radius < distancesqr)
			{
				continue;
			}
			if(entity damageconetrace(self.origin, self) == 0)
			{
				continue;
			}
			if(alarmstatusold == "on")
			{
				alarmstatus = "on";
				break;
			}
			radius = self.weapon.proximityalarminnerradius;
			if(radius * radius < distancesqr)
			{
				continue;
			}
			alarmstatus = "on";
			var_af12fba0 = entity;
			break;
		}
	}
}

/*
	Name: commononspawnuseweaponobjectproximityalarm
	Namespace: weaponobjects
	Checksum: 0x7656C5FC
	Offset: 0x4350
	Size: 0x17C
	Parameters: 2
	Flags: Linked
*/
function commononspawnuseweaponobjectproximityalarm(watcher, owner)
{
	/#
		if(level.weaponobjectdebug == 1)
		{
			self thread proximityalarmweaponobjectdebug(watcher);
		}
	#/
	if(is_true(watcher.var_82aa8ec4))
	{
		curstate = self.owner clientfield::get_to_player("proximity_alarm");
		if(curstate != 5)
		{
			self setstate(0);
		}
	}
	self proximityalarmloop(watcher, owner);
	self proximityalarmactivate(0, watcher);
	if(is_true(watcher.var_82aa8ec4))
	{
		owner = self.owner;
		curstate = owner clientfield::get_to_player("proximity_alarm");
		if(curstate != 4 && curstate != 5)
		{
			owner clientfield::set_to_player("proximity_alarm", 0);
			owner clientfield::set_player_uimodel("hudItems.proximityAlarm", 0);
		}
	}
}

/*
	Name: onspawnuseweaponobject
	Namespace: weaponobjects
	Checksum: 0x4AC75E3A
	Offset: 0x44D8
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function onspawnuseweaponobject(watcher, owner)
{
	self thread commononspawnuseweaponobjectproximityalarm(watcher, owner);
}

/*
	Name: onspawnproximityweaponobject
	Namespace: weaponobjects
	Checksum: 0x72D8CE7
	Offset: 0x4510
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function onspawnproximityweaponobject(watcher, owner)
{
	self.protected_entities = [];
	if(isdefined(level._proximityweaponobjectdetonation_override))
	{
		self thread [[level._proximityweaponobjectdetonation_override]](owner);
	}
	else
	{
		if(isdefined(self._proximityweaponobjectdetonation_override))
		{
			self thread [[self._proximityweaponobjectdetonation_override]](owner);
		}
		else
		{
			self thread proximityweaponobjectdetonation(owner);
		}
	}
	/#
		if(level.weaponobjectdebug == 1)
		{
			self thread proximityweaponobjectdebug(owner);
		}
	#/
}

/*
	Name: watchweaponobjectusage
	Namespace: weaponobjects
	Checksum: 0x80F724D1
	Offset: 0x45C8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function watchweaponobjectusage()
{
}

/*
	Name: function_1c430dad
	Namespace: weaponobjects
	Checksum: 0x8501933B
	Offset: 0x45D8
	Size: 0x22
	Parameters: 2
	Flags: None
*/
function function_1c430dad(entity, isjammed)
{
	entity.isjammed = isjammed;
}

/*
	Name: function_9c78a35b
	Namespace: weaponobjects
	Checksum: 0xA1EA1A72
	Offset: 0x4608
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event function_9c78a35b(eventstruct)
{
	function_d5d6b91(eventstruct);
}

/*
	Name: function_523f5c2e
	Namespace: weaponobjects
	Checksum: 0x4AE95207
	Offset: 0x4638
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event function_523f5c2e(eventstruct)
{
	function_d5d6b91(eventstruct);
}

/*
	Name: function_8cd77cf6
	Namespace: weaponobjects
	Checksum: 0xE2DF051F
	Offset: 0x4668
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event function_8cd77cf6(eventstruct)
{
	function_d5d6b91(eventstruct);
}

/*
	Name: function_d5d6b91
	Namespace: weaponobjects
	Checksum: 0x17EDE721
	Offset: 0x4698
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function function_d5d6b91(params)
{
	weapon_instance = params.projectile;
	weapon = params.weapon;
	if(is_true(level.projectiles_should_ignore_world_pause) && isdefined(weapon_instance))
	{
		weapon_instance setignorepauseworld(1);
	}
	if(is_true(weapon_instance.var_da2aa27a))
	{
		weapon_instance function_619a5c20();
	}
	if(isplayer(self) && weapon.setusedstat && !self util::ishacked())
	{
		self stats::function_e24eec31(weapon, #"used", 1);
	}
	watcher = getweaponobjectwatcherbyweapon(weapon);
	if(isdefined(watcher))
	{
		cleanweaponobjectarray(watcher);
		if(weapon.maxinstancesallowed)
		{
			if(watcher.objectarray.size > weapon.maxinstancesallowed - 1)
			{
				watcher thread waitandfizzleout(watcher.objectarray[0], 0.1);
				if(is_true(watcher.var_82aa8ec4))
				{
					watcher.objectarray[0] setstate(5);
				}
				watcher.objectarray[0] = undefined;
				cleanweaponobjectarray(watcher);
			}
		}
		self addweaponobject(watcher, weapon_instance, weapon);
	}
}

/*
	Name: watchweaponobjectspawn
	Namespace: weaponobjects
	Checksum: 0x4BB5CEFE
	Offset: 0x48D0
	Size: 0x108
	Parameters: 2
	Flags: Linked
*/
function watchweaponobjectspawn(notify_type, endonnotify)
{
	if(!isdefined(endonnotify))
	{
		endonnotify = undefined;
	}
	if(isdefined(endonnotify))
	{
		self endon(endonnotify);
	}
	self endon(#"death");
	self notify(#"watchweaponobjectspawn");
	self endon(#"watchweaponobjectspawn", #"disconnect");
	while(true)
	{
		if(isdefined(notify_type))
		{
			waitresult = undefined;
			waitresult = self waittill(notify_type);
		}
		else
		{
			waitresult = undefined;
			waitresult = self waittill(#"grenade_fire", #"grenade_launcher_fire", #"missile_fire");
		}
		function_d5d6b91(waitresult);
	}
}

/*
	Name: anyobjectsinworld
	Namespace: weaponobjects
	Checksum: 0x4B0C71BB
	Offset: 0x49E0
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function anyobjectsinworld(weapon)
{
	objectsinworld = 0;
	for(i = 0; i < self.weaponobjectwatcherarray.size; i++)
	{
		if(self.weaponobjectwatcherarray[i].weapon != weapon)
		{
			continue;
		}
		if(isdefined(self.weaponobjectwatcherarray[i].ondetonatecallback) && self.weaponobjectwatcherarray[i].objectarray.size > 0)
		{
			objectsinworld = 1;
			break;
		}
	}
	return objectsinworld;
}

/*
	Name: function_8481fc06
	Namespace: weaponobjects
	Checksum: 0xF2D9627F
	Offset: 0x4A90
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_8481fc06(weapon)
{
	watcher = getweaponobjectwatcherbyweapon(weapon);
	return function_7cdcc8ba(watcher);
}

/*
	Name: function_7cdcc8ba
	Namespace: weaponobjects
	Checksum: 0x249FD23D
	Offset: 0x4AE0
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function function_7cdcc8ba(watcher)
{
	count = 0;
	if(isdefined(watcher))
	{
		foreach(var_3fa20979 in watcher.objectarray)
		{
			if(isdefined(var_3fa20979.owner) && var_3fa20979.owner == self)
			{
				count = count + 1;
			}
		}
	}
	return count;
}

/*
	Name: proximitysphere
	Namespace: weaponobjects
	Checksum: 0xBF9007F1
	Offset: 0x4BB0
	Size: 0xAE
	Parameters: 5
	Flags: None
*/
function proximitysphere(origin, innerradius, incolor, outerradius, outcolor)
{
	/#
		self endon(#"death");
		while(true)
		{
			if(isdefined(innerradius))
			{
				dev::debug_sphere(origin, innerradius, incolor, 0.25, 1);
			}
			if(isdefined(outerradius))
			{
				dev::debug_sphere(origin, outerradius, outcolor, 0.25, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: proximityalarmweaponobjectdebug
	Namespace: weaponobjects
	Checksum: 0x190D291B
	Offset: 0x4C68
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function proximityalarmweaponobjectdebug(watcher)
{
	/#
		self endon(#"death");
		self util::waittillnotmoving();
		if(!isdefined(self))
		{
			return;
		}
		self thread proximitysphere(self.origin, self.weapon.proximityalarminnerradius, vectorscale((0, 1, 0), 0.75), self.weapon.proximityalarmouterradius, vectorscale((0, 1, 0), 0.75));
	#/
}

/*
	Name: proximityweaponobjectdebug
	Namespace: weaponobjects
	Checksum: 0x6EB2EFAD
	Offset: 0x4D08
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function proximityweaponobjectdebug(watcher)
{
	/#
		self endon(#"death");
		self util::waittillnotmoving();
		if(!isdefined(self))
		{
			return;
		}
		if(isdefined(watcher.ignoredirection))
		{
			self thread proximitysphere(self.origin, watcher.detonateradius, (1, 0.85, 0), self.weapon.explosionradius, (1, 0, 0));
		}
		else
		{
			self thread showcone(acos(watcher.detectiondot), watcher.detonateradius, (1, 0.85, 0));
			self thread showcone(60, 256, (1, 0, 0));
		}
	#/
}

/*
	Name: showcone
	Namespace: weaponobjects
	Checksum: 0x2D5ABE8F
	Offset: 0x4E10
	Size: 0x1F6
	Parameters: 3
	Flags: None
*/
function showcone(angle, range, color)
{
	/#
		self endon(#"death");
		start = self.origin;
		forward = anglestoforward(self.angles);
		right = vectorcross(forward, (0, 0, 1));
		up = vectorcross(forward, right);
		fullforward = (forward * range) * cos(angle);
		sideamnt = range * sin(angle);
		while(true)
		{
			prevpoint = (0, 0, 0);
			for(i = 0; i <= 20; i++)
			{
				coneangle = (i / 20) * 360;
				point = (start + fullforward) + (sideamnt * (right * cos(coneangle)) + (up * sin(coneangle)));
				if(i > 0)
				{
					line(start, point, color);
					line(prevpoint, point, color);
				}
				prevpoint = point;
			}
			waitframe(1);
		}
	#/
}

/*
	Name: weaponobjectdetectionmovable
	Namespace: weaponobjects
	Checksum: 0xEE037D71
	Offset: 0x5010
	Size: 0x8E
	Parameters: 1
	Flags: None
*/
function weaponobjectdetectionmovable(ownerteam)
{
	self endon(#"end_detection", #"death", #"hacked");
	level endon(#"game_ended");
	if(!level.teambased)
	{
		return;
	}
	self.detectid = ("rcBomb" + gettime()) + randomint(1000000);
}

/*
	Name: seticonpos
	Namespace: weaponobjects
	Checksum: 0xCE70FED0
	Offset: 0x50A8
	Size: 0x66
	Parameters: 3
	Flags: None
*/
function seticonpos(item, icon, heightincrease)
{
	icon.x = item.origin[0];
	icon.y = item.origin[1];
	icon.z = item.origin[2] + heightincrease;
}

/*
	Name: weaponobjectdetectiontrigger_wait
	Namespace: weaponobjects
	Checksum: 0x30AD073
	Offset: 0x5118
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function weaponobjectdetectiontrigger_wait(ownerteam)
{
	self endon(#"death", #"hacked", #"detonating");
	util::waittillnotmoving();
	self thread weaponobjectdetectiontrigger(ownerteam);
}

/*
	Name: weaponobjectdetectiontrigger
	Namespace: weaponobjects
	Checksum: 0x6981C9D4
	Offset: 0x5190
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function weaponobjectdetectiontrigger(ownerteam)
{
	trigger = spawn("trigger_radius", self.origin - vectorscale((0, 0, 1), 128), 0, 512, 256);
	trigger.detectid = ("trigger" + gettime()) + randomint(1000000);
	trigger sethintlowpriority(1);
	self waittill(#"death", #"hacked", #"detonating");
	trigger notify(#"end_detection");
	/#
		if(isdefined(trigger.bombsquadicon))
		{
			trigger.bombsquadicon destroy();
		}
	#/
	trigger delete();
}

/*
	Name: hackertriggersetvisibility
	Namespace: weaponobjects
	Checksum: 0x95ACA525
	Offset: 0x52C8
	Size: 0x130
	Parameters: 1
	Flags: Linked
*/
function hackertriggersetvisibility(owner)
{
	self endon(#"death");
	/#
		assert(isplayer(owner));
	#/
	ownerteam = owner.pers[#"team"];
	for(;;)
	{
		if(level.teambased)
		{
			self setvisibletoallexceptteam(ownerteam);
			self setexcludeteamfortrigger(ownerteam);
		}
		else
		{
			self setvisibletoall();
			self setteamfortrigger(#"none");
		}
		if(isdefined(owner))
		{
			self setinvisibletoplayer(owner);
		}
		level waittill(#"player_spawned", #"joined_team");
	}
}

/*
	Name: hackernotmoving
	Namespace: weaponobjects
	Checksum: 0x1493FEB9
	Offset: 0x5400
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function hackernotmoving()
{
	self endon(#"death");
	self util::waittillnotmoving();
	self notify(#"landed");
}

/*
	Name: set_hint_string
	Namespace: weaponobjects
	Checksum: 0x4EAE71D3
	Offset: 0x5448
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private set_hint_string(hint_string, var_c1846261)
{
	if(isdefined(hint_string) && hint_string != "")
	{
		self sethintstring(hint_string);
	}
	else
	{
		self sethintstring(var_c1846261);
	}
}

/*
	Name: hackerinit
	Namespace: weaponobjects
	Checksum: 0x89666F12
	Offset: 0x54B0
	Size: 0x1F4
	Parameters: 1
	Flags: Linked
*/
function hackerinit(watcher)
{
	self thread hackernotmoving();
	event = undefined;
	event = self waittill(#"death", #"landed");
	if(event._notify == "death")
	{
		return;
	}
	if(!isdefined(self))
	{
		return;
	}
	triggerorigin = self.origin;
	if(isdefined(self.weapon.hackertriggerorigintag) && "" != self.weapon.hackertriggerorigintag)
	{
		triggerorigin = self gettagorigin(self.weapon.hackertriggerorigintag);
	}
	self.hackertrigger = function_c7cdf243(triggerorigin, level.weaponobjects_hacker_trigger_width, level.weaponobjects_hacker_trigger_height);
	self.hackertrigger set_hint_string(self.weapon.var_2f3ca476, #"hash_249ca5756f6ccd3e");
	self.hackertrigger setignoreentfortrigger(self);
	self.hackertrigger setperkfortrigger(#"specialty_disarmexplosive");
	self.hackertrigger thread hackertriggersetvisibility(self.owner);
	/#
	#/
	self thread hackerthink(self.hackertrigger, watcher);
	self thread watchshutdown(self.owner);
}

/*
	Name: hackerthink
	Namespace: weaponobjects
	Checksum: 0xF9C00C2D
	Offset: 0x56B0
	Size: 0xCA
	Parameters: 2
	Flags: Linked
*/
function hackerthink(trigger, watcher)
{
	self endon(#"death");
	trigger endon(#"death");
	for(;;)
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"trigger");
		if(!isdefined(waitresult.is_instant) && !trigger hackerresult(waitresult.activator, self.owner))
		{
			continue;
		}
		self itemhacked(watcher, waitresult.activator);
		return;
	}
}

/*
	Name: itemhacked
	Namespace: weaponobjects
	Checksum: 0x4F3164AC
	Offset: 0x5788
	Size: 0x3C4
	Parameters: 2
	Flags: Linked
*/
function itemhacked(watcher, player)
{
	self proximityalarmactivate(0, watcher);
	self.owner hackerremoveweapon(self);
	if(isdefined(level.playequipmenthackedonplayer))
	{
		self.owner [[level.playequipmenthackedonplayer]]();
	}
	if(self.weapon.ammocountequipment > 0 && isdefined(self.ammo))
	{
		ammoleftequipment = self.ammo;
	}
	self.hacked = 1;
	self setmissileowner(player);
	self setteam(player.pers[#"team"]);
	self.owner = player;
	self clientfield::set("retrievable", 0);
	if(self.weapon.dohackedstats)
	{
		scoreevents::processscoreevent(#"hacked", player, undefined, undefined);
		player stats::function_e24eec31(getweapon(#"pda_hack"), #"combatrecordstat", 1);
		player challenges::hackedordestroyedequipment();
		player contracts::increment_contract(#"hash_43530a1351ecbed6");
	}
	/#
		if(self.weapon.rootweapon == level.weaponsatchelcharge && isdefined(player.lowermessage))
		{
			player.lowermessage settext(#"hash_5723526a77b686b2");
			player.lowermessage.alpha = 1;
			player.lowermessage fadeovertime(2);
			player.lowermessage.alpha = 0;
		}
	#/
	self notify(#"hacked", {#player:player});
	level notify(#"hacked", {#player:player, #target:self});
	if(isdefined(self.camerahead))
	{
		self.camerahead notify(#"hacked", {#player:player});
	}
	/#
	#/
	waitframe(1);
	if(isdefined(player) && player.sessionstate == "playing")
	{
		player notify(#"grenade_fire", {#respawn_from_hack:1, #weapon:self.weapon, #projectile:self});
	}
	else
	{
		watcher thread waitanddetonate(self, 0, undefined, self.weapon);
	}
}

/*
	Name: hackerunfreezeplayer
	Namespace: weaponobjects
	Checksum: 0x3C959F5C
	Offset: 0x5B58
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function hackerunfreezeplayer(player)
{
	self endon(#"hack_done");
	self waittill(#"death");
	if(isdefined(player))
	{
		player val::reset(#"gameobjects", "freezecontrols");
		player val::reset(#"gameobjects", "disable_weapons");
	}
}

/*
	Name: hackerresult
	Namespace: weaponobjects
	Checksum: 0x175800F7
	Offset: 0x5BF0
	Size: 0x32A
	Parameters: 2
	Flags: Linked
*/
function hackerresult(player, owner)
{
	success = 1;
	time = gettime();
	hacktime = getdvarfloat(#"perk_disarmexplosivetime", 0);
	if(!canhack(player, owner, 1))
	{
		return 0;
	}
	self thread hackerunfreezeplayer(player);
	while(time + (int(hacktime * 1000)) > gettime())
	{
		if(!canhack(player, owner, 0))
		{
			success = 0;
			break;
		}
		if(!player usebuttonpressed())
		{
			success = 0;
			break;
		}
		if(!isdefined(self))
		{
			success = 0;
			break;
		}
		player val::set(#"gameobjects", "freezecontrols");
		player val::set(#"gameobjects", "disable_weapons");
		/#
			if(!isdefined(self.progressbar))
			{
				self.progressbar = player hud::function_5037fb7f();
				self.progressbar.lastuserate = -1;
				self.progressbar hud::showelem();
				self.progressbar hud::updatebar(0.01, 1 / hacktime);
				self.progresstext = player hud::function_48badcf4();
				self.progresstext settext(#"mp/hacking");
				self.progresstext hud::showelem();
				player playlocalsound(#"evt_hacker_hacking");
			}
		#/
		waitframe(1);
	}
	if(isdefined(player))
	{
		player val::reset(#"gameobjects", "freezecontrols");
		player val::reset(#"gameobjects", "disable_weapons");
	}
	/#
		if(isdefined(self.progressbar))
		{
			self.progressbar hud::destroyelem();
			self.progresstext hud::destroyelem();
		}
	#/
	if(isdefined(self))
	{
		self notify(#"hack_done");
	}
	return success;
}

/*
	Name: canhack
	Namespace: weaponobjects
	Checksum: 0x1A667723
	Offset: 0x5F28
	Size: 0x2CA
	Parameters: 3
	Flags: Linked
*/
function canhack(player, owner, weapon_check)
{
	if(!isdefined(player))
	{
		return false;
	}
	if(!isplayer(player))
	{
		return false;
	}
	if(!isalive(player))
	{
		return false;
	}
	if(!isdefined(owner))
	{
		return false;
	}
	if(owner == player)
	{
		return false;
	}
	if(level.teambased && !util::function_fbce7263(player.team, owner.team))
	{
		return false;
	}
	if(isdefined(player.isdefusing) && player.isdefusing)
	{
		return false;
	}
	if(isdefined(player.isplanting) && player.isplanting)
	{
		return false;
	}
	if(isdefined(player.proxbar) && !player.proxbar.hidden)
	{
		return false;
	}
	if(isdefined(player.revivingteammate) && player.revivingteammate == 1)
	{
		return false;
	}
	if(!player isonground())
	{
		return false;
	}
	if(player isinvehicle())
	{
		return false;
	}
	if(player isweaponviewonlylinked())
	{
		return false;
	}
	if(!player hasperk(#"specialty_disarmexplosive"))
	{
		return false;
	}
	if(player isempjammed())
	{
		return false;
	}
	if(isdefined(player.laststand) && player.laststand)
	{
		return false;
	}
	if(weapon_check)
	{
		if(player isthrowinggrenade())
		{
			return false;
		}
		if(player isswitchingweapons())
		{
			return false;
		}
		if(player ismeleeing())
		{
			return false;
		}
		weapon = player getcurrentweapon();
		if(!isdefined(weapon))
		{
			return false;
		}
		if(weapon == level.weaponnone)
		{
			return false;
		}
		if(weapon.isequipment && player isfiring())
		{
			return false;
		}
		if(weapon.isspecificuse)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: hackerremoveweapon
	Namespace: weaponobjects
	Checksum: 0x30941322
	Offset: 0x6200
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function hackerremoveweapon(weapon_instance)
{
	if(isdefined(self) && isdefined(self.weaponobjectwatcherarray))
	{
		for(i = 0; i < self.weaponobjectwatcherarray.size; i++)
		{
			if(self.weaponobjectwatcherarray[i].weapon != weapon_instance.weapon.rootweapon)
			{
				continue;
			}
			removeweaponobject(self.weaponobjectwatcherarray[i], weapon_instance);
			return;
		}
	}
}

/*
	Name: proximityweaponobject_createdamagearea
	Namespace: weaponobjects
	Checksum: 0x12470770
	Offset: 0x62A0
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function proximityweaponobject_createdamagearea(watcher)
{
	damagearea = spawn("trigger_radius", self.origin + (0, 0, 0 - watcher.detonateradius), ((4096 | 16384) | level.aitriggerspawnflags) | level.vehicletriggerspawnflags, watcher.detonateradius, watcher.detonateradius * 2);
	damagearea enablelinkto();
	damagearea linkto(self);
	self thread deleteondeath(damagearea);
	return damagearea;
}

/*
	Name: proximityweaponobject_validtriggerentity
	Namespace: weaponobjects
	Checksum: 0x41A356C2
	Offset: 0x6378
	Size: 0x1F8
	Parameters: 2
	Flags: Linked
*/
function proximityweaponobject_validtriggerentity(watcher, ent)
{
	if(level.weaponobjectdebug != 1)
	{
		if(isdefined(self.owner) && ent == self.owner)
		{
			return false;
		}
		if(isvehicle(ent))
		{
			if(watcher.ignorevehicles)
			{
				return false;
			}
			if(!ent getvehoccupants().size)
			{
				return false;
			}
			if(self.owner === ent.owner)
			{
				return false;
			}
		}
		if(!damage::friendlyfirecheck(self.owner, ent, 0))
		{
			return false;
		}
		if(watcher.ignorevehicles && isai(ent) && !is_true(ent.isaiclone))
		{
			return false;
		}
	}
	if(lengthsquared(ent getvelocity()) < 10 && !isdefined(watcher.immediatedetonation))
	{
		return false;
	}
	if(!ent shouldaffectweaponobject(self, watcher))
	{
		return false;
	}
	if(self isstunned())
	{
		return false;
	}
	if(isplayer(ent))
	{
		if(!isalive(ent))
		{
			return false;
		}
		if(isdefined(watcher.immunespecialty) && ent hasperk(watcher.immunespecialty))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: proximityweaponobject_removespawnprotectondeath
	Namespace: weaponobjects
	Checksum: 0x48925742
	Offset: 0x6578
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function proximityweaponobject_removespawnprotectondeath(ent)
{
	self endon(#"death");
	ent waittill(#"death", #"disconnect");
	arrayremovevalue(self.protected_entities, ent);
}

/*
	Name: proximityweaponobject_spawnprotect
	Namespace: weaponobjects
	Checksum: 0x10734406
	Offset: 0x65E0
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function proximityweaponobject_spawnprotect(watcher, ent)
{
	self endon(#"death");
	ent endon(#"death");
	self.protected_entities[self.protected_entities.size] = ent;
	self thread proximityweaponobject_removespawnprotectondeath(ent);
	radius_sqr = watcher.detonateradius * watcher.detonateradius;
	while(true)
	{
		if(distancesquared(ent.origin, self.origin) > radius_sqr)
		{
			arrayremovevalue(self.protected_entities, ent);
			return;
		}
		wait(0.5);
	}
}

/*
	Name: proximityweaponobject_isspawnprotected
	Namespace: weaponobjects
	Checksum: 0xE8079D0F
	Offset: 0x66D0
	Size: 0x134
	Parameters: 2
	Flags: Linked
*/
function proximityweaponobject_isspawnprotected(watcher, ent)
{
	if(!isplayer(ent))
	{
		return false;
	}
	if(!isdefined(self.protected_entities))
	{
		self.protected_entities = [];
	}
	foreach(protected_ent in self.protected_entities)
	{
		if(protected_ent == ent)
		{
			return true;
		}
	}
	linked_to = self getlinkedent();
	if(linked_to === ent)
	{
		return false;
	}
	if(ent player::is_spawn_protected())
	{
		self thread proximityweaponobject_spawnprotect(watcher, ent);
		return true;
	}
	return false;
}

/*
	Name: proximityweaponobject_dodetonation
	Namespace: weaponobjects
	Checksum: 0xF3352909
	Offset: 0x6810
	Size: 0x1B4
	Parameters: 3
	Flags: Linked
*/
function proximityweaponobject_dodetonation(watcher, ent, traceorigin)
{
	self endon(#"death", #"hacked");
	self notify(#"kill_target_detection");
	self.detonating = 1;
	if(isdefined(watcher.activatesound))
	{
		self playsound(watcher.activatesound);
	}
	wait(watcher.detectiongraceperiod);
	if(isplayer(ent) && ent hasperk(#"specialty_delayexplosive"))
	{
		wait(getdvarfloat(#"perk_delayexplosivetime", 0));
	}
	self entityheadicons::setentityheadicon("none");
	self.origin = traceorigin;
	if(isdefined(self.var_cea6a2fb))
	{
		self.var_cea6a2fb placeables::forceshutdown();
	}
	if(isdefined(self.owner) && isplayer(self.owner))
	{
		self [[watcher.ondetonatecallback]](self.owner, undefined, ent);
	}
	else
	{
		self [[watcher.ondetonatecallback]](undefined, undefined, ent);
	}
}

/*
	Name: proximityweaponobject_activationdelay
	Namespace: weaponobjects
	Checksum: 0x90E538B3
	Offset: 0x69D0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function proximityweaponobject_activationdelay(watcher)
{
	self util::waittillnotmoving();
	if(watcher.activationdelay)
	{
		wait(watcher.activationdelay);
	}
}

/*
	Name: proximityweaponobject_waittillframeendanddodetonation
	Namespace: weaponobjects
	Checksum: 0x9626E440
	Offset: 0x6A18
	Size: 0xD4
	Parameters: 3
	Flags: Linked
*/
function proximityweaponobject_waittillframeendanddodetonation(watcher, ent, entityorigin)
{
	self endon(#"death");
	dist = distance(ent.origin, self.origin);
	if(isdefined(self.activated_entity_distance))
	{
		if(dist < self.activated_entity_distance)
		{
			self notify(#"better_target");
		}
		else
		{
			return;
		}
	}
	self endon(#"better_target");
	self.activated_entity_distance = dist;
	waitframe(1);
	proximityweaponobject_dodetonation(watcher, ent, entityorigin);
}

/*
	Name: proximityweaponobjectdetonation
	Namespace: weaponobjects
	Checksum: 0xC2F46DA1
	Offset: 0x6AF8
	Size: 0x168
	Parameters: 1
	Flags: Linked
*/
function proximityweaponobjectdetonation(s_watcher)
{
	self endon(#"death", #"hacked", #"kill_target_detection");
	proximityweaponobject_activationdelay(s_watcher);
	var_6e4025f7 = proximityweaponobject_createdamagearea(s_watcher);
	var_20d0363e = (isdefined(s_watcher.var_20d0363e) ? s_watcher.var_20d0363e : 0);
	if(var_20d0363e)
	{
		var_20d0363e = int(var_20d0363e * 1000);
		self thread function_f5b8ea19(s_watcher, var_6e4025f7, var_20d0363e);
		return;
	}
	while(true)
	{
		waitresult = undefined;
		waitresult = var_6e4025f7 waittill(#"trigger");
		ent = waitresult.activator;
		if(function_5b0e3a9e(s_watcher, ent))
		{
			self thread proximityweaponobject_waittillframeendanddodetonation(s_watcher, ent, self.origin);
		}
	}
}

/*
	Name: function_f5b8ea19
	Namespace: weaponobjects
	Checksum: 0xF0490D64
	Offset: 0x6C68
	Size: 0x1B2
	Parameters: 3
	Flags: Linked
*/
function function_f5b8ea19(s_watcher, var_6e4025f7, var_20d0363e)
{
	self endon(#"death", #"hacked", #"kill_target_detection");
	var_bccce0e1 = undefined;
	detonating = 0;
	while(true)
	{
		if(isdefined(var_bccce0e1))
		{
			var_8dc1cd0d = gettime() - var_bccce0e1;
		}
		triggered = 0;
		foreach(ent in self getenemiesinradius(self.origin, var_6e4025f7.detonateradius))
		{
			if(function_5b0e3a9e(var_6e4025f7, ent))
			{
				triggered = 1;
				if(!isdefined(var_bccce0e1))
				{
					var_bccce0e1 = gettime();
					continue;
				}
				if(var_8dc1cd0d >= var_20d0363e)
				{
					self thread proximityweaponobject_waittillframeendanddodetonation(var_6e4025f7, ent, self.origin);
					detonating = 1;
				}
			}
		}
		if(!triggered)
		{
			var_bccce0e1 = undefined;
		}
		if(detonating)
		{
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_5b0e3a9e
	Namespace: weaponobjects
	Checksum: 0x5BA13548
	Offset: 0x6E28
	Size: 0x118
	Parameters: 2
	Flags: Linked
*/
function function_5b0e3a9e(s_watcher, ent)
{
	if(!proximityweaponobject_validtriggerentity(s_watcher, ent))
	{
		return false;
	}
	if(proximityweaponobject_isspawnprotected(s_watcher, ent))
	{
		return false;
	}
	if(self isjammed())
	{
		return false;
	}
	v_up = anglestoup(self.angles);
	var_81fd2297 = 1;
	if(isdefined(self.weapon))
	{
		if(self.weapon.var_9a2941f1 > 0)
		{
			var_81fd2297 = self.weapon.var_9a2941f1;
		}
	}
	var_f1e2d68b = self.origin + (v_up * var_81fd2297);
	if(ent damageconetrace(var_f1e2d68b, self) > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: isjammed
	Namespace: weaponobjects
	Checksum: 0xB172FFCF
	Offset: 0x6F48
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function isjammed()
{
	return is_true(self.isjammed);
}

/*
	Name: shouldaffectweaponobject
	Namespace: weaponobjects
	Checksum: 0xC1C1096B
	Offset: 0x6F70
	Size: 0x18C
	Parameters: 2
	Flags: Linked
*/
function shouldaffectweaponobject(object, watcher)
{
	radius = object.weapon.explosionradius;
	distancesqr = distancesquared(self.origin, object.origin);
	if(radius != 0 && (radius * radius) < distancesqr)
	{
		return 0;
	}
	if(isdefined(watcher.ignoredirection))
	{
		return 1;
	}
	pos = self.origin + (isdefined(watcher.var_8eda8949) ? watcher.var_8eda8949 : vectorscale((0, 0, 1), 32));
	dirtopos = pos - object.origin;
	objectforward = anglestoforward(object.angles);
	dist = vectordot(dirtopos, objectforward);
	if(dist < watcher.detectionmindist)
	{
		return 0;
	}
	dirtopos = vectornormalize(dirtopos);
	dot = vectordot(dirtopos, objectforward);
	return dot > watcher.detectiondot;
}

/*
	Name: deleteondeath
	Namespace: weaponobjects
	Checksum: 0xC8CF1463
	Offset: 0x7108
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function deleteondeath(ent)
{
	self waittill(#"death", #"hacked");
	waitframe(1);
	if(isdefined(ent))
	{
		ent delete();
	}
}

/*
	Name: testkillbrushonstationary
	Namespace: weaponobjects
	Checksum: 0x8E8CC94E
	Offset: 0x7168
	Size: 0x1C2
	Parameters: 2
	Flags: Linked
*/
function testkillbrushonstationary(a_killbrushes, player)
{
	player endon(#"disconnect");
	self endon(#"death");
	self waittill(#"stationary");
	foreach(trig in a_killbrushes)
	{
		if(isdefined(trig) && self istouching(trig))
		{
			if(!trig istriggerenabled())
			{
				continue;
			}
			if(!(isdefined(self.spawnflags) && (self.spawnflags & 8) == 8) && (!(isdefined(self.spawnflags) && (self.spawnflags & 512) == 512)) && (!(isdefined(self.spawnflags) && (self.spawnflags & 32768) == 32768)))
			{
				continue;
			}
			if(self.origin[2] > player.origin[2])
			{
				break;
			}
			if(isdefined(self))
			{
				self delete();
			}
			return;
		}
	}
}

/*
	Name: deleteonkillbrush
	Namespace: weaponobjects
	Checksum: 0x6096B847
	Offset: 0x7338
	Size: 0x1EC
	Parameters: 1
	Flags: Linked
*/
function deleteonkillbrush(player)
{
	player endon(#"disconnect");
	self endon(#"death", #"stationary");
	a_killbrushes = getentarray("trigger_hurt", "classname");
	self thread testkillbrushonstationary(a_killbrushes, player);
	while(true)
	{
		a_killbrushes = getentarray("trigger_hurt", "classname");
		for(i = 0; i < a_killbrushes.size; i++)
		{
			if(self istouching(a_killbrushes[i]))
			{
				if(!a_killbrushes[i] istriggerenabled())
				{
					continue;
				}
				if(!(isdefined(self.spawnflags) && (self.spawnflags & 8) == 8) && (!(isdefined(self.spawnflags) && (self.spawnflags & 512) == 512)) && (!(isdefined(self.spawnflags) && (self.spawnflags & 32768) == 32768)))
				{
					continue;
				}
				if(self.origin[2] > player.origin[2])
				{
					break;
				}
				if(isdefined(self))
				{
					self delete();
				}
				return;
			}
		}
		wait(0.1);
	}
}

/*
	Name: on_double_tap_detonate
	Namespace: weaponobjects
	Checksum: 0x52CC59D9
	Offset: 0x7530
	Size: 0xF8
	Parameters: 0
	Flags: Linked
*/
function on_double_tap_detonate()
{
	if(!isalive(self) && !self util::isusingremote())
	{
		return;
	}
	foreach(watcher in self.weaponobjectwatcherarray)
	{
		if(watcher.altdetonate)
		{
			if(isdefined(watcher.var_e7ebbd38))
			{
				self thread [[watcher.var_e7ebbd38]](watcher);
				continue;
			}
			watcher detonateweaponobjectarray(0);
		}
	}
}

/*
	Name: on_detonate
	Namespace: weaponobjects
	Checksum: 0x1D74765D
	Offset: 0x7630
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function on_detonate()
{
	if(self isusingoffhand())
	{
		weap = self getcurrentoffhand();
	}
	else
	{
		weap = self getcurrentweapon();
	}
	watcher = getweaponobjectwatcherbyweapon(weap);
	if(isdefined(watcher))
	{
		if(isdefined(watcher.ondetonationhandle))
		{
			self thread [[watcher.ondetonationhandle]](watcher);
		}
		watcher detonateweaponobjectarray(0);
	}
}

/*
	Name: function_ac7c2bf9
	Namespace: weaponobjects
	Checksum: 0xDEF4A261
	Offset: 0x76F8
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_ac7c2bf9(params)
{
	if(!isdefined(self.weaponobjectwatcherarray))
	{
		return;
	}
	watchers = [];
	for(watcher = 0; watcher < self.weaponobjectwatcherarray.size; watcher++)
	{
		weaponobjectwatcher = spawnstruct();
		watchers[watchers.size] = weaponobjectwatcher;
		weaponobjectwatcher.objectarray = [];
		if(isdefined(self.weaponobjectwatcherarray[watcher].objectarray))
		{
			weaponobjectwatcher.objectarray = self.weaponobjectwatcherarray[watcher].objectarray;
		}
	}
	waitframe(1);
	for(watcher = 0; watcher < watchers.size; watcher++)
	{
		watchers[watcher] deleteweaponobjectarray();
	}
}

/*
	Name: saydamaged
	Namespace: weaponobjects
	Checksum: 0x4B94848
	Offset: 0x77F8
	Size: 0x62
	Parameters: 2
	Flags: None
*/
function saydamaged(orig, amount)
{
	/#
		for(i = 0; i < 60; i++)
		{
			print3d(orig, "" + amount);
			waitframe(1);
		}
	#/
}

/*
	Name: function_c9fc5521
	Namespace: weaponobjects
	Checksum: 0xEE43FB78
	Offset: 0x7868
	Size: 0x14C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c9fc5521(player, weapon)
{
	maxammo = 0;
	loadout = player loadout::find_loadout_slot(weapon);
	if(isdefined(loadout))
	{
		if(loadout.count > 0)
		{
			maxammo = loadout.count;
		}
		else
		{
			maxammo = weapon.maxammo + weapon.clipsize;
		}
	}
	else
	{
		if(isdefined(player.grenadetypeprimary) && weapon == player.grenadetypeprimary && isdefined(player.grenadetypeprimarycount) && player.grenadetypeprimarycount > 0)
		{
			maxammo = player.grenadetypeprimarycount;
		}
		else
		{
			if(isdefined(player.grenadetypesecondary) && weapon == player.grenadetypesecondary && isdefined(player.grenadetypesecondarycount) && player.grenadetypesecondarycount > 0)
			{
				maxammo = player.grenadetypesecondarycount;
			}
			else
			{
				maxammo = weapon.maxammo + weapon.clipsize;
			}
		}
	}
	return maxammo;
}

/*
	Name: get_ammo
	Namespace: weaponobjects
	Checksum: 0xCE21AEEB
	Offset: 0x79C0
	Size: 0x64
	Parameters: 2
	Flags: Linked, Private
*/
function private get_ammo(player, weapon)
{
	ammo = player getweaponammoclip(weapon);
	if(!weapon.iscliponly)
	{
		ammo = ammo + player getweaponammostock(weapon);
	}
	return ammo;
}

/*
	Name: function_e0093db1
	Namespace: weaponobjects
	Checksum: 0x4F3CAD64
	Offset: 0x7A30
	Size: 0x78
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e0093db1(player, weapon)
{
	maxammo = function_c9fc5521(player, weapon);
	if(maxammo == 0)
	{
		return false;
	}
	ammo = get_ammo(player, weapon);
	if(ammo >= maxammo)
	{
		return false;
	}
	return true;
}

/*
	Name: function_d831baf0
	Namespace: weaponobjects
	Checksum: 0x54A59840
	Offset: 0x7AB0
	Size: 0x1F2
	Parameters: 4
	Flags: Linked
*/
function function_d831baf0(trigger, callback, playersoundonuse, npcsoundonuse)
{
	self endon(#"death", #"explode", #"hacked");
	trigger endon(#"death");
	if(1)
	{
		for(;;)
		{
			waitresult = undefined;
			waitresult = trigger waittill(#"trigger");
			player = waitresult.activator;
		}
		for(;;)
		{
		}
		for(;;)
		{
		}
		for(;;)
		{
			heldweapon = player function_672ba881(self.weapon);
		}
		for(;;)
		{
		}
		if(!isalive(player))
		{
		}
		if(!player isonground() && !player isplayerswimming())
		{
		}
		if(isdefined(trigger.claimedby) && player != trigger.claimedby)
		{
		}
		if(!isdefined(heldweapon))
		{
		}
		if(!function_e0093db1(player, heldweapon))
		{
		}
		if(isdefined(playersoundonuse))
		{
			player playlocalsound(playersoundonuse);
		}
		if(isdefined(npcsoundonuse))
		{
			player playsound(npcsoundonuse);
		}
		if(isdefined(level.var_b8e083d0))
		{
			player [[level.var_b8e083d0]](self.weapon);
		}
		self [[callback]](player, heldweapon);
		return;
	}
}

/*
	Name: function_e3030545
	Namespace: weaponobjects
	Checksum: 0x9DC787B0
	Offset: 0x7CB0
	Size: 0x92
	Parameters: 2
	Flags: Linked
*/
function function_e3030545(pweapons, weapon)
{
	foreach(pweapon in pweapons)
	{
		if(pweapon == weapon)
		{
			return pweapon;
		}
	}
	return undefined;
}

/*
	Name: function_7f47d8b8
	Namespace: weaponobjects
	Checksum: 0x41242AAD
	Offset: 0x7D50
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function function_7f47d8b8(pweapons, weapon)
{
	foreach(pweapon in pweapons)
	{
		if(pweapon.rootweapon == weapon.rootweapon)
		{
			return pweapon;
		}
	}
	return undefined;
}

/*
	Name: get_held_weapon_match_or_root_match
	Namespace: weaponobjects
	Checksum: 0x5AEF27FB
	Offset: 0x7DF8
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function get_held_weapon_match_or_root_match(weapon)
{
	pweapons = self getweaponslist(1);
	match = function_e3030545(pweapons, weapon);
	if(isdefined(match))
	{
		return match;
	}
	return function_7f47d8b8(pweapons, weapon);
}

/*
	Name: function_42e13419
	Namespace: weaponobjects
	Checksum: 0xF1D4EFC3
	Offset: 0x7E78
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function function_42e13419(pweapons, weapon)
{
	foreach(pweapon in pweapons)
	{
		if(pweapon.ammoindex == weapon.ammoindex)
		{
			return pweapon;
		}
	}
	return undefined;
}

/*
	Name: function_3eca329f
	Namespace: weaponobjects
	Checksum: 0xFF948865
	Offset: 0x7F20
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function function_3eca329f(pweapons, weapon)
{
	foreach(pweapon in pweapons)
	{
		if(pweapon.var_fc3be15e == weapon.var_fc3be15e)
		{
			return pweapon;
		}
	}
	return undefined;
}

/*
	Name: function_672ba881
	Namespace: weaponobjects
	Checksum: 0xC0B9E791
	Offset: 0x7FC8
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_672ba881(weapon)
{
	pweapons = self getweaponslist(1);
	match = function_3eca329f(pweapons, weapon);
	if(isdefined(match))
	{
		return match;
	}
	return function_42e13419(pweapons, weapon);
}

/*
	Name: spawn_interact_trigger
	Namespace: weaponobjects
	Checksum: 0x101B56C1
	Offset: 0x8048
	Size: 0x108
	Parameters: 6
	Flags: Linked, Private
*/
function private spawn_interact_trigger(type, origin, radius, height, var_c16194e2, var_32b723ba)
{
	trigger = spawn(type, origin, 0, radius, height, var_32b723ba);
	if(type === "trigger_radius_use")
	{
		trigger setignoreentfortrigger(self);
	}
	if(var_c16194e2 !== 1)
	{
		trigger sethintlowpriority(1);
		trigger setcursorhint("HINT_NOICON", self);
	}
	trigger enablelinkto();
	trigger linkto(self);
	return trigger;
}

/*
	Name: function_c7cdf243
	Namespace: weaponobjects
	Checksum: 0xD56BC055
	Offset: 0x8158
	Size: 0x4A
	Parameters: 4
	Flags: Linked, Private
*/
function private function_c7cdf243(origin, radius, height, var_32b723ba)
{
	return spawn_interact_trigger("trigger_radius_use", origin, radius, height, 0, var_32b723ba);
}

/*
	Name: function_d5e8c3d0
	Namespace: weaponobjects
	Checksum: 0xD416AD36
	Offset: 0x81B0
	Size: 0x42
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d5e8c3d0(origin, radius, height)
{
	return spawn_interact_trigger("trigger_radius", origin, radius, height, 1);
}

/*
	Name: function_23b0aea9
	Namespace: weaponobjects
	Checksum: 0xAF4C47F3
	Offset: 0x8200
	Size: 0x3BC
	Parameters: 2
	Flags: Linked
*/
function function_23b0aea9(watcher, player)
{
	self endon(#"death");
	self setowner(player);
	self setteam(player.pers[#"team"]);
	self.owner = player;
	self.oldangles = self.angles;
	self util::waittillnotmoving();
	waittillframeend();
	if(!isdefined(player) || !isdefined(player.pers))
	{
		return;
	}
	if(player.pers[#"team"] == #"spectator")
	{
		return;
	}
	triggerorigin = self.origin;
	triggerparentent = undefined;
	if(isdefined(self.stucktoplayer))
	{
		if(isalive(self.stucktoplayer) || !isdefined(self.stucktoplayer.body))
		{
			if(isalive(self.stucktoplayer))
			{
				triggerparentent = self;
				self unlink();
				self.angles = self.oldangles;
				self launch(vectorscale((1, 1, 1), 5));
				self util::waittillnotmoving();
				waittillframeend();
			}
			else
			{
				triggerparentent = self.stucktoplayer;
			}
		}
		else
		{
			triggerparentent = self.stucktoplayer.body;
		}
	}
	if(!isdefined(self) || !isdefined(player))
	{
		return;
	}
	if(isdefined(triggerparentent))
	{
		triggerorigin = triggerparentent.origin + vectorscale((0, 0, 1), 10);
	}
	else
	{
		up = anglestoup(self.angles);
		triggerorigin = self.origin + vectorscale(up, 3);
	}
	weapon = watcher.weapon;
	if(!self util::ishacked() && "None" != weapon.var_7d4c12af)
	{
		if(self.weapon.shownretrievable)
		{
			self clientfield::set("retrievable", 1);
		}
		if(weapon.var_7d4c12af == "Automatic")
		{
			function_57152a5(watcher, player, triggerorigin);
		}
		else
		{
			function_ac27aef5(watcher, player, triggerorigin);
		}
		if(isdefined(triggerparentent))
		{
			self.pickuptrigger linkto(triggerparentent);
		}
	}
	if("None" != weapon.var_38eb7f9e)
	{
		function_9dbd349e(watcher, player, triggerorigin);
	}
	/#
		thread switch_team(self, watcher, player);
	#/
	self thread watchshutdown(player);
}

/*
	Name: function_ac27aef5
	Namespace: weaponobjects
	Checksum: 0x28F1BCB9
	Offset: 0x85C8
	Size: 0x150
	Parameters: 3
	Flags: Linked
*/
function function_ac27aef5(watcher, player, origin)
{
	self.pickuptrigger = function_c7cdf243(origin, watcher.var_7ce4e9ab, watcher.var_a889e2cb, watcher.var_2fd8b883);
	self.pickuptrigger setinvisibletoall();
	self.pickuptrigger setvisibletoplayer(player);
	self.pickuptrigger setteamfortrigger(player.pers[#"team"]);
	if(watcher.var_296e14ab === 1)
	{
		self.pickuptrigger function_4bf6de9a(0);
	}
	self thread watchusetrigger(self.pickuptrigger, watcher.pickup, watcher.pickupsoundplayer, watcher.pickupsound, watcher.weapon, 1);
	if(isdefined(watcher.pickup_trigger_listener))
	{
		self thread [[watcher.pickup_trigger_listener]](self.pickuptrigger, player);
	}
}

/*
	Name: function_57152a5
	Namespace: weaponobjects
	Checksum: 0xDF8BB315
	Offset: 0x8720
	Size: 0x10C
	Parameters: 3
	Flags: Linked
*/
function function_57152a5(watcher, player, origin)
{
	height = 50;
	if(isdefined(watcher.weapon) && isdefined(watcher.weapon.var_ac36c1db) && watcher.weapon.var_ac36c1db > 0)
	{
		height = watcher.weapon.var_ac36c1db;
		origin = origin - (0, 0, height * 0.5);
	}
	self.pickuptrigger = function_d5e8c3d0(origin, 50, 50);
	self.pickuptrigger.claimedby = player;
	self thread function_d831baf0(self.pickuptrigger, watcher.pickup, watcher.pickupsoundplayer, watcher.pickupsound);
}

/*
	Name: function_386fa470
	Namespace: weaponobjects
	Checksum: 0xAB7E039
	Offset: 0x8838
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_386fa470(player)
{
	if(!isdefined(self.enemytrigger))
	{
		return;
	}
	self.enemytrigger setinvisibletoplayer(player);
	if(level.teambased)
	{
		self.enemytrigger setexcludeteamfortrigger(player.team);
		self.enemytrigger.triggerteamignore = self.team;
	}
}

/*
	Name: function_9dbd349e
	Namespace: weaponobjects
	Checksum: 0xC2AACED
	Offset: 0x88C0
	Size: 0x15C
	Parameters: 3
	Flags: Linked
*/
function function_9dbd349e(watcher, player, origin)
{
	triggerradius = (isdefined(watcher.var_ce3a3280) ? watcher.var_ce3a3280 : getdvarint(#"hash_6a5939d349795ad8", 76));
	self.enemytrigger = function_c7cdf243(origin, triggerradius);
	self.enemytrigger setinvisibletoplayer(player);
	if(level.teambased)
	{
		self.enemytrigger setexcludeteamfortrigger(player.team);
		self.enemytrigger.triggerteamignore = self.team;
	}
	self.enemytrigger set_hint_string(self.weapon.var_5c29f743, #"hash_d77107fb749d77f");
	self thread watchusetrigger(self.enemytrigger, watcher.ondestroyed);
	self thread watchshutdown(player);
}

/*
	Name: add_ammo
	Namespace: weaponobjects
	Checksum: 0x5A3E8B72
	Offset: 0x8A28
	Size: 0xFC
	Parameters: 2
	Flags: Linked, Private
*/
function private add_ammo(player, weapon)
{
	if(weapon.iscliponly || weapon.var_d98594b2 == "Clip Then Ammo")
	{
		ammo = player getweaponammoclip(weapon);
		ammo++;
		clip_size = player getweaponammoclipsize(weapon);
		if(ammo <= clip_size)
		{
			player setweaponammoclip(weapon, ammo);
			return;
		}
	}
	if(!weapon.iscliponly)
	{
		stock_ammo = player getweaponammostock(weapon);
		stock_ammo++;
		player setweaponammostock(weapon, stock_ammo);
	}
}

/*
	Name: function_a6616b9c
	Namespace: weaponobjects
	Checksum: 0x411B7A13
	Offset: 0x8B30
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function function_a6616b9c(player, heldweapon)
{
	if(!self.weapon.anyplayercanretrieve && isdefined(self.owner) && self.owner != player)
	{
		return;
	}
	pickedweapon = self.weapon;
	self notify(#"picked_up");
	heldweapon = player function_672ba881(self.weapon);
	if(!isdefined(heldweapon))
	{
		return;
	}
	if("ammo" != heldweapon.gadget_powerusetype)
	{
		slot = player gadgetgetslot(heldweapon);
		player gadgetpowerchange(slot, heldweapon.gadget_powergainonretrieve);
		return;
	}
	if(!function_e0093db1(player, heldweapon))
	{
		return;
	}
	add_ammo(player, heldweapon);
}

/*
	Name: function_d9219ce2
	Namespace: weaponobjects
	Checksum: 0xF823C587
	Offset: 0x8C60
	Size: 0x116
	Parameters: 2
	Flags: Linked
*/
function function_d9219ce2(player, weapon)
{
	if(weapon.gadget_powergainonretrieve > 0)
	{
		slot = player gadgetgetslot(weapon);
		if(slot >= 0)
		{
			clipsize = player function_b7f1fd2c(weapon);
			if(clipsize && weapon.var_ce34bb7e)
			{
				powergain = weapon.gadget_powergainonretrieve / clipsize;
			}
			else
			{
				powergain = weapon.gadget_powergainonretrieve;
			}
			player gadgetpowerchange(slot, powergain);
			self notify(#"picked_up");
			return;
		}
	}
	add_ammo(player, weapon);
	self notify(#"picked_up");
}

/*
	Name: ondestroyed
	Namespace: weaponobjects
	Checksum: 0x42FF0DBA
	Offset: 0x8D80
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function ondestroyed(attacker, data)
{
	playfx(level._effect[#"tacticalinsertionfizzle"], self.origin);
	self playsound(#"dst_tac_insert_break");
	if(isdefined(self.owner) && isdefined(level.playequipmentdestroyedonplayer))
	{
		self.owner [[level.playequipmentdestroyedonplayer]]();
	}
	self delete();
}

/*
	Name: watchshutdown
	Namespace: weaponobjects
	Checksum: 0xF65C44A1
	Offset: 0x8E38
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function watchshutdown(player)
{
	self notify("2cec169f0313925c");
	self endon("2cec169f0313925c");
	self waittill(#"death", #"hacked", #"detonating");
	pickuptrigger = self.pickuptrigger;
	hackertrigger = self.hackertrigger;
	enemytrigger = self.enemytrigger;
	if(isdefined(pickuptrigger))
	{
		pickuptrigger delete();
	}
	if(isdefined(hackertrigger))
	{
		/#
			if(isdefined(hackertrigger.progressbar))
			{
				hackertrigger.progressbar hud::destroyelem();
				hackertrigger.progresstext hud::destroyelem();
			}
		#/
		hackertrigger delete();
	}
	if(isdefined(enemytrigger))
	{
		enemytrigger delete();
	}
}

/*
	Name: watchusetrigger
	Namespace: weaponobjects
	Checksum: 0x63B9A039
	Offset: 0x8F80
	Size: 0x2B0
	Parameters: 6
	Flags: Linked
*/
function watchusetrigger(trigger, callback, playersoundonuse, npcsoundonuse, callback_data, var_acddd81e)
{
	self endon(#"death", #"delete");
	trigger endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"trigger");
		player = waitresult.activator;
		if(isdefined(self.detonated) && self.detonated == 1)
		{
			if(isdefined(trigger))
			{
				trigger delete();
			}
			return;
		}
		if(!isalive(player))
		{
			continue;
		}
		if(isdefined(trigger.triggerteam) && player.pers[#"team"] != trigger.triggerteam)
		{
			continue;
		}
		if(isdefined(trigger.triggerteamignore) && player.team == trigger.triggerteamignore)
		{
			continue;
		}
		if(isdefined(trigger.claimedby) && player != trigger.claimedby)
		{
			continue;
		}
		if(is_true(player.var_5e6eba64))
		{
			continue;
		}
		grenade = player.throwinggrenade;
		weapon = player getcurrentweapon();
		if(weapon.isequipment)
		{
			grenade = 0;
		}
		if(!is_true(grenade) && !player meleebuttonpressed())
		{
			if(isdefined(playersoundonuse))
			{
				player playlocalsound(playersoundonuse);
			}
			if(isdefined(npcsoundonuse))
			{
				player playsound(npcsoundonuse);
			}
			if(isdefined(var_acddd81e) && isdefined(level.var_b8e083d0))
			{
				player [[level.var_b8e083d0]](self.weapon);
			}
			self thread [[callback]](player, callback_data);
		}
	}
}

/*
	Name: setupreconeffect
	Namespace: weaponobjects
	Checksum: 0x1F1ABE0F
	Offset: 0x9238
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function setupreconeffect()
{
	if(!isdefined(self))
	{
		return;
	}
	if(self.weapon.shownenemyexplo === 1 || self.weapon.shownenemyequip === 1)
	{
		if(is_true(self.hacked))
		{
			self clientfield::set("enemyequip", 2);
		}
		else
		{
			self clientfield::set("enemyequip", 1);
		}
	}
}

/*
	Name: useteamequipmentclientfield
	Namespace: weaponobjects
	Checksum: 0xB8FE91C8
	Offset: 0x92E8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function useteamequipmentclientfield(watcher)
{
	if(isdefined(watcher))
	{
		if(!isdefined(watcher.notequipment))
		{
			if(isdefined(self))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: getwatcherforweapon
	Namespace: weaponobjects
	Checksum: 0xDB961004
	Offset: 0x9328
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function getwatcherforweapon(weapon)
{
	if(!isdefined(self))
	{
		return undefined;
	}
	if(!isplayer(self))
	{
		return undefined;
	}
	for(i = 0; i < self.weaponobjectwatcherarray.size; i++)
	{
		if(self.weaponobjectwatcherarray[i].weapon != weapon)
		{
			continue;
		}
		return self.weaponobjectwatcherarray[i];
	}
	return undefined;
}

/*
	Name: destroy_other_teams_supplemental_watcher_objects
	Namespace: weaponobjects
	Checksum: 0xE3D4E9DA
	Offset: 0x93B8
	Size: 0xF4
	Parameters: 3
	Flags: None
*/
function destroy_other_teams_supplemental_watcher_objects(attacker, weapon, radius)
{
	if(level.teambased)
	{
		foreach(_ in level.teams)
		{
			if(!attacker util::isenemyteam(team))
			{
				continue;
			}
			destroy_supplemental_watcher_objects(attacker, team, weapon, radius);
		}
	}
	destroy_supplemental_watcher_objects(attacker, #"none", weapon, radius);
}

/*
	Name: destroy_supplemental_watcher_objects
	Namespace: weaponobjects
	Checksum: 0x59024779
	Offset: 0x94B8
	Size: 0x1A8
	Parameters: 4
	Flags: Linked
*/
function destroy_supplemental_watcher_objects(attacker, team, weapon, radius)
{
	radiussq = radius * radius;
	foreach(item in level.supplementalwatcherobjects)
	{
		if(!isdefined(item.weapon))
		{
			continue;
		}
		if(distancesquared(item.origin, team.origin) > radiussq)
		{
			continue;
		}
		if(!isdefined(item.owner))
		{
			continue;
		}
		if(isdefined(weapon) && util::function_fbce7263(item.owner.team, weapon))
		{
			continue;
		}
		else if(item.owner == team)
		{
			continue;
		}
		watcher = item.owner getwatcherforweapon(item.weapon);
		if(!isdefined(watcher) || !isdefined(watcher.onsupplementaldetonatecallback))
		{
			continue;
		}
		item thread [[watcher.onsupplementaldetonatecallback]]();
	}
}

/*
	Name: add_supplemental_object
	Namespace: weaponobjects
	Checksum: 0xF915422F
	Offset: 0x9668
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function add_supplemental_object(object)
{
	level.supplementalwatcherobjects[level.supplementalwatcherobjects.size] = object;
	object thread watch_supplemental_object_death();
}

/*
	Name: watch_supplemental_object_death
	Namespace: weaponobjects
	Checksum: 0x28CA28D4
	Offset: 0x96B0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function watch_supplemental_object_death()
{
	self waittill(#"death");
	arrayremovevalue(level.supplementalwatcherobjects, self);
}

/*
	Name: function_d9c08e94
	Namespace: weaponobjects
	Checksum: 0xA28909E4
	Offset: 0x96F0
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_d9c08e94(var_2f190eaf, var_46f3f2d3)
{
	self endon(#"cancel_timeout");
	if(!isdefined(var_2f190eaf) || var_2f190eaf <= 0)
	{
		return;
	}
	self endon(#"death");
	wait(float(var_2f190eaf) / 1000);
	if(isdefined(var_46f3f2d3))
	{
		self [[var_46f3f2d3]]();
	}
}

/*
	Name: proximitydetonate
	Namespace: weaponobjects
	Checksum: 0x717AFB2D
	Offset: 0x9788
	Size: 0x10C
	Parameters: 3
	Flags: Linked
*/
function proximitydetonate(attacker, weapon, target)
{
	if(isdefined(target) && target.isvalid)
	{
		if(isdefined(weapon))
		{
			if(self.owner util::isenemyplayer(weapon))
			{
				if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
				{
					weapon challenges::destroyedexplosive(target);
					self.owner globallogic_score::function_5829abe3(weapon, target, self.weapon);
					self battlechatter::function_d2600afc(weapon, self.owner, self.weapon, target);
				}
			}
		}
	}
	weapondetonate(weapon, target);
}

/*
	Name: onspawnproximitygrenadeweaponobject
	Namespace: weaponobjects
	Checksum: 0xA483EB94
	Offset: 0x98A0
	Size: 0xF2
	Parameters: 2
	Flags: None
*/
function onspawnproximitygrenadeweaponobject(watcher, owner)
{
	self thread function_219766eb();
	if(isplayer(owner))
	{
		owner stats::function_e24eec31(self.weapon, #"used", 1);
	}
	if(isdefined(self.weapon) && self.weapon.proximitydetonation > 0)
	{
		watcher.detonateradius = self.weapon.proximitydetonation;
	}
	onspawnproximityweaponobject(watcher, owner);
	self function_931041f8(self.owner);
	self.originalowner = owner;
}

/*
	Name: function_219766eb
	Namespace: weaponobjects
	Checksum: 0xD8845FBC
	Offset: 0x99A0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_219766eb()
{
	self endon(#"death");
	self util::waittillnotmoving();
	self.killcament = spawn("script_model", self.origin + vectorscale((0, 0, 1), 8));
	self.killcament setweapon(self.weapon);
	self thread function_6f135b92();
}

/*
	Name: function_6f135b92
	Namespace: weaponobjects
	Checksum: 0xF074EC14
	Offset: 0x9A48
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_6f135b92()
{
	self waittill(#"death");
	var_b2ed661a = (isdefined(self.var_b2ed661a) ? self.var_b2ed661a : 4 + (level.proximitygrenadedotdamagetime * level.proximitygrenadedotdamageinstances));
	if(isdefined(self.killcament))
	{
		self.killcament util::deleteaftertime(var_b2ed661a);
	}
}

/*
	Name: function_fb7b0024
	Namespace: weaponobjects
	Checksum: 0x28F44C31
	Offset: 0x9AD0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_fb7b0024(owner)
{
	if(isdefined(owner.activeproximitygrenades) && owner.activeproximitygrenades.size > 0)
	{
		arrayremovevalue(owner.activeproximitygrenades, self);
	}
}

/*
	Name: function_931041f8
	Namespace: weaponobjects
	Checksum: 0xB147B254
	Offset: 0x9B28
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_931041f8(owner)
{
	if(level.trackproximitygrenadesonowner === 1)
	{
		if(!isdefined(owner))
		{
			return;
		}
		if(!isdefined(owner.activeproximitygrenades))
		{
			owner.activeproximitygrenades = [];
		}
		else
		{
			arrayremovevalue(owner.activeproximitygrenades, undefined);
		}
		owner.activeproximitygrenades[owner.activeproximitygrenades.size] = self;
	}
}

/*
	Name: switch_team
	Namespace: weaponobjects
	Checksum: 0x3E5CAC93
	Offset: 0x9BB0
	Size: 0x1B0
	Parameters: 3
	Flags: None
*/
function switch_team(entity, watcher, owner)
{
	/#
		self notify(#"stop_disarmthink");
		self endon(#"stop_disarmthink", #"death");
		setdvar(#"scr_switch_team", "");
		while(true)
		{
			wait(0.5);
			devgui_int = getdvarint(#"scr_switch_team", 0);
			if(devgui_int != 0)
			{
				team = "";
				if(isdefined(level.getenemyteam) && isdefined(owner) && isdefined(owner.team))
				{
					team = [[level.getenemyteam]](owner.team);
				}
				if(isdefined(level.devongetormakebot))
				{
					player = [[level.devongetormakebot]](team);
				}
				if(!isdefined(player))
				{
					println("");
					wait(1);
					continue;
				}
				entity itemhacked(watcher, player);
				setdvar(#"scr_switch_team", 0);
			}
		}
	#/
}

