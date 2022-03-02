#using script_18f0d22c75b141a7;
#using script_256b8879317373de;
#using script_32399001bdb550da;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\healthoverlay.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace loadout;

/*
	Name: function_f099e9
	Namespace: loadout
	Checksum: 0xE72EB50C
	Offset: 0x1E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f099e9()
{
	level notify(1827540735);
}

/*
	Name: function_89f2df9
	Namespace: loadout
	Checksum: 0x12609083
	Offset: 0x200
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"loadout", &function_70a657d8, undefined, undefined, #"load");
}

/*
	Name: function_70a657d8
	Namespace: loadout
	Checksum: 0x2E2F2033
	Offset: 0x250
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&function_6fddd9e2);
	callback::on_connect(&on_connect);
	callback::on_disconnect(&function_5890c14e);
}

/*
	Name: on_connect
	Namespace: loadout
	Checksum: 0x1FFDEF4C
	Offset: 0x2C0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function on_connect()
{
	self.pers[#"loadout"] = spawnstruct();
	self function_c67222df();
}

/*
	Name: function_6fddd9e2
	Namespace: loadout
	Checksum: 0xA9EB6ED8
	Offset: 0x310
	Size: 0x1E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6fddd9e2()
{
	init();
}

/*
	Name: init
	Namespace: loadout
	Checksum: 0x9B7BF5AA
	Offset: 0x338
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private init()
{
	level.maxkillstreaks = 4;
	level.maxspecialties = 6;
	level.maxallocation = getgametypesetting(#"maxallocation");
	level.loadoutkillstreaksenabled = getgametypesetting(#"loadoutkillstreaksenabled");
}

/*
	Name: function_5890c14e
	Namespace: loadout
	Checksum: 0x8CE59D6E
	Offset: 0x3B8
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function function_5890c14e()
{
	self savegame::set_player_data("playerClass", undefined);
	self savegame::set_player_data("altPlayerID", undefined);
	self savegame::set_player_data("saved_weapon", undefined);
	self savegame::set_player_data("saved_weapon_attachments", undefined);
	self savegame::set_player_data("saved_weapondata", undefined);
	self savegame::set_player_data("lives", undefined);
	self savegame::set_player_data("saved_rig1", undefined);
	self savegame::set_player_data("saved_rig1_upgraded", undefined);
	self savegame::set_player_data("saved_rig2", undefined);
	self savegame::set_player_data("saved_rig2_upgraded", undefined);
}

/*
	Name: isequipmentallowed
	Namespace: loadout
	Checksum: 0x5CD97D5E
	Offset: 0x508
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function isequipmentallowed(equipment_name)
{
	if(isdefined(level.weapontacticalinsertion) && equipment_name == level.weapontacticalinsertion.name && level.disabletacinsert)
	{
		return false;
	}
	return true;
}

/*
	Name: function_5536bd9e
	Namespace: loadout
	Checksum: 0x2CCEE897
	Offset: 0x560
	Size: 0x14C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5536bd9e()
{
	has_specialty_armor = self hasperk(#"specialty_armor");
	healthtoassign = self.spawnhealth;
	if(isdefined(level.maxspawnhealthboostprct))
	{
		self.bonusspawnhealth = int(level.maxspawnhealthboostprct * self.spawnhealth);
		healthtoassign = healthtoassign + self.bonusspawnhealth;
	}
	self player::function_9080887a(healthtoassign);
	self.maxhealth = healthtoassign;
	new_health = (self.var_66cb03ad > 0 ? self.var_66cb03ad : healthtoassign);
	self.health = new_health;
	self.maxarmor = (has_specialty_armor ? self.spawnarmor : 0);
	self.armor = (has_specialty_armor ? self.spawnarmor : 0);
	self.var_ed2f8b3a = self.spawnhealth;
	self healthoverlay::restart_player_health_regen();
}

/*
	Name: giveloadout
	Namespace: loadout
	Checksum: 0x17E22503
	Offset: 0x6B8
	Size: 0x22E
	Parameters: 3
	Flags: Linked
*/
function giveloadout(team, weaponclass, altplayer)
{
	pixbeginevent();
	defaultweapon = getweapon("ar_accurate_t9");
	self takeallweapons();
	self giveweapon(defaultweapon);
	self switchtoweaponimmediate(defaultweapon);
	self setspawnweapon(defaultweapon);
	self setperk("specialty_sprint");
	self setperk("specialty_slide");
	self setperk("specialty_sprintreload");
	self.lastnonkillstreakweapon = defaultweapon;
	self.specialty = [];
	self.killstreak = [];
	self notify(#"give_map");
	self.class_num = 0;
	function_5536bd9e();
	self.primaryweaponkill = 0;
	self.secondaryweaponkill = 0;
	self.grenadetypeprimary = level.weaponnone;
	self.grenadetypeprimarycount = 0;
	self.grenadetypesecondary = level.weaponnone;
	self.grenadetypesecondarycount = 0;
	if(isdefined(self.movementspeedmodifier))
	{
		self setmovespeedscale(self.movementspeedmodifier * self getmovespeedscale());
	}
	self flag::set(#"loadout_given");
	callback::callback(#"on_loadout");
	pixendevent();
}

/*
	Name: setclass
	Namespace: loadout
	Checksum: 0x939BB00B
	Offset: 0x8F0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function setclass(newclass)
{
	self.curclass = newclass;
}

/*
	Name: loadout_changed
	Namespace: loadout
	Checksum: 0x8DA4F9C1
	Offset: 0x918
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event loadout_changed(eventstruct)
{
	self callback::callback(#"hash_39bf72fd97e248a0", eventstruct);
}

/*
	Name: isexplosivedamage
	Namespace: loadout
	Checksum: 0x9369B5C1
	Offset: 0x950
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function isexplosivedamage(meansofdeath)
{
	switch(meansofdeath)
	{
		case "mod_explosive":
		case "mod_grenade":
		case "mod_grenade_splash":
		case "mod_projectile_splash":
		{
			return true;
		}
	}
	return false;
}

/*
	Name: hastacticalmask
	Namespace: loadout
	Checksum: 0xAAA75981
	Offset: 0x9C0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function hastacticalmask(player)
{
	return player hasperk(#"specialty_stunprotection") || player hasperk(#"specialty_flashprotection") || player hasperk(#"specialty_proximityprotection");
}

/*
	Name: isfiredamage
	Namespace: loadout
	Checksum: 0x7677C82F
	Offset: 0xA40
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function isfiredamage(weapon, meansofdeath)
{
	if(weapon.doesfiredamage && (meansofdeath == "MOD_BURNED" || meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH"))
	{
		return true;
	}
	return false;
}

/*
	Name: grenadestuck
	Namespace: loadout
	Checksum: 0x129C86CA
	Offset: 0xAB0
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function grenadestuck(inflictor)
{
	return isdefined(inflictor) && isdefined(inflictor.stucktoplayer) && inflictor.stucktoplayer == self;
}

