#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;

#namespace satchel_charge;

/*
	Name: init_shared
	Namespace: satchel_charge
	Checksum: 0xC3B737E0
	Offset: 0x128
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_ac78d00e))
	{
		level.var_ac78d00e = {};
	}
	weaponobjects::function_e6400478(#"satchel_charge", &createsatchelwatcher, 1);
	callback::on_player_killed(&onplayerkilled);
	clientfield::register("missile", "satchelChargeWarning", 1, 1, "int");
}

/*
	Name: createsatchelwatcher
	Namespace: satchel_charge
	Checksum: 0x66C2A741
	Offset: 0x1D8
	Size: 0x1C2
	Parameters: 1
	Flags: Linked
*/
function createsatchelwatcher(watcher)
{
	if(sessionmodeiszombiesgame())
	{
		watcher.onspawnretrievetriggers = &function_4ba658e5;
		watcher.deleteonplayerspawn = 0;
	}
	if(isdefined(watcher.weapon.customsettings))
	{
		var_6f1c6122 = getscriptbundle(watcher.weapon.customsettings);
		/#
			assert(isdefined(var_6f1c6122));
		#/
		level.var_ac78d00e.var_a74161cc = var_6f1c6122;
	}
	watcher.altdetonate = 1;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.ondetonatecallback = &function_b96af076;
	watcher.onspawn = &satchelspawn;
	watcher.onstun = &weaponobjects::weaponstun;
	watcher.stuntime = 1;
	watcher.ownergetsassist = 1;
	watcher.detonatestationary = 1;
	watcher.detonationdelay = getdvarfloat(#"scr_satchel_detonation_delay", 0);
	watcher.immunespecialty = "specialty_immunetriggerc4";
	watcher.var_296e14ab = 1;
	watcher.var_2fd8b883 = 1;
	if(function_a2f3d962())
	{
		watcher.var_e7ebbd38 = &function_a39c62de;
	}
}

/*
	Name: satchelspawn
	Namespace: satchel_charge
	Checksum: 0x35C62CBD
	Offset: 0x3A8
	Size: 0x214
	Parameters: 2
	Flags: Linked
*/
function satchelspawn(watcher, owner)
{
	self endon(#"death", #"hacked", #"detonating");
	self thread weaponobjects::onspawnuseweaponobject(watcher, owner);
	self function_619a5c20();
	if(isdefined(owner))
	{
		owner stats::function_e24eec31(self.weapon, #"used", 1);
		if(isdefined(level.var_1f5cc2b4))
		{
			owner thread [[level.var_1f5cc2b4]]();
		}
		if(!isdefined(owner.var_1e593689))
		{
			owner.var_1e593689 = [];
		}
		if(!isdefined(owner.var_1e593689))
		{
			owner.var_1e593689 = [];
		}
		else if(!isarray(owner.var_1e593689))
		{
			owner.var_1e593689 = array(owner.var_1e593689);
		}
		owner.var_1e593689[owner.var_1e593689.size] = self;
	}
	self.var_3f9bd15 = &onvehiclekilled;
	if(function_a2f3d962())
	{
		self thread function_939d8a36(watcher);
	}
	else
	{
		/#
			self thread function_87e9f461();
		#/
		self thread function_acc500c4(watcher);
	}
	if(isdefined(self.killcament))
	{
		self.killcament setweapon(self.weapon);
	}
}

/*
	Name: function_a0778d59
	Namespace: satchel_charge
	Checksum: 0xF5A356E0
	Offset: 0x5C8
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_a0778d59()
{
	self waittilltimeout(10, #"stationary", #"death");
}

/*
	Name: function_a2f3d962
	Namespace: satchel_charge
	Checksum: 0xD23C3676
	Offset: 0x600
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_a2f3d962()
{
	return level.var_ac78d00e.var_a74161cc.var_c66e4eb1 === 1;
}

/*
	Name: function_b96af076
	Namespace: satchel_charge
	Checksum: 0x4433EB1
	Offset: 0x630
	Size: 0x94
	Parameters: 3
	Flags: Linked
*/
function function_b96af076(attacker, weapon, target)
{
	if(isdefined(self.owner.var_1e593689))
	{
		arrayremovevalue(self.owner.var_1e593689, self);
		if(self.owner.var_1e593689.size <= 0)
		{
			self.owner.var_1e593689 = undefined;
		}
	}
	weaponobjects::proximitydetonate(attacker, weapon, target);
}

/*
	Name: function_939d8a36
	Namespace: satchel_charge
	Checksum: 0x95C6103B
	Offset: 0x6D0
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_939d8a36(watcher)
{
	self endon(#"death", #"detonating");
	if(level.var_ac78d00e.var_a74161cc.var_3a06462 !== 1)
	{
		util::waittillnotmoving();
	}
	var_c4725fe8 = (isdefined(level.var_ac78d00e.var_a74161cc.var_342ad32c) ? level.var_ac78d00e.var_a74161cc.var_342ad32c : 0);
	if(var_c4725fe8 > 0)
	{
		self playsound((isdefined(level.var_ac78d00e.var_a74161cc.var_f1c52016) ? level.var_ac78d00e.var_a74161cc.var_f1c52016 : ""));
		wait(var_c4725fe8);
	}
	flag::set("satchelIsArmed");
}

/*
	Name: function_a0a96965
	Namespace: satchel_charge
	Checksum: 0x405422AF
	Offset: 0x810
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_a0a96965()
{
	if(isdefined(self.var_1e593689) && isdefined(level.var_ac78d00e.var_a74161cc.var_90724e7f) && self.isjammed !== 1)
	{
		arrayremovevalue(self.var_1e593689, undefined);
		foreach(var_77a228b3 in self.var_1e593689)
		{
			if(var_77a228b3.isjammed !== 1)
			{
				var_77a228b3 clientfield::set("satchelChargeWarning", 1);
				var_77a228b3 playsound(level.var_ac78d00e.var_a74161cc.var_90724e7f);
			}
		}
	}
}

/*
	Name: function_acc500c4
	Namespace: satchel_charge
	Checksum: 0x1CFF7821
	Offset: 0x948
	Size: 0x284
	Parameters: 1
	Flags: Linked
*/
function function_acc500c4(watcher)
{
	self endon(#"death", #"hacked", #"detonating");
	if(isdefined(watcher.weapon.customsettings))
	{
		function_a0778d59();
		if(isdefined(level.var_ac78d00e.var_a74161cc.var_28f86309))
		{
			self playloopsound(level.var_ac78d00e.var_a74161cc.var_28f86309);
		}
		var_1911997c = level.var_ac78d00e.var_a74161cc.var_e26881f;
		if(isdefined(var_1911997c))
		{
			var_5d0f385a = (isdefined(level.var_ac78d00e.var_a74161cc.var_c932e2b0) ? level.var_ac78d00e.var_a74161cc.var_c932e2b0 : 0);
			/#
				assert(var_5d0f385a <= self.weapon.fusetime);
			#/
			var_d3839360 = (float(self.weapon.fusetime) / 1000) - var_5d0f385a;
			wait(var_d3839360);
			if(isdefined(level.var_ac78d00e.var_a74161cc.var_28f86309))
			{
				self stoploopsound(0.1);
			}
			self clientfield::set("satchelChargeWarning", 1);
			self playsound(var_1911997c);
		}
		else
		{
			wait(float(self.weapon.fusetime) / 1000);
			if(isdefined(level.var_ac78d00e.var_a74161cc.var_28f86309))
			{
				self stoploopsound(0.1);
			}
		}
	}
}

/*
	Name: function_6db0705
	Namespace: satchel_charge
	Checksum: 0xC47E5865
	Offset: 0xBD8
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_6db0705()
{
	for(;;)
	{
		if(isdefined(self.var_1e593689))
		{
			foreach(var_77a228b3 in self.var_1e593689)
			{
				if(var_77a228b3 flag::get("satchelIsArmed"))
				{
					return true;
				}
			}
		}
		else
		{
			return false;
		}
		waitframe(1);
	}
	return false;
}

/*
	Name: function_51108722
	Namespace: satchel_charge
	Checksum: 0x47522BB8
	Offset: 0xC98
	Size: 0xD2
	Parameters: 0
	Flags: Linked
*/
function function_51108722()
{
	for(;;)
	{
		if(isdefined(self.var_1e593689))
		{
			var_263fb98 = 1;
			foreach(var_77a228b3 in self.var_1e593689)
			{
				if(!var_77a228b3 flag::get("satchelIsArmed"))
				{
					var_263fb98 = 0;
				}
			}
			if(var_263fb98)
			{
				return true;
			}
		}
		else
		{
			return false;
		}
		waitframe(1);
	}
	return false;
}

/*
	Name: function_542663a0
	Namespace: satchel_charge
	Checksum: 0x48021FFC
	Offset: 0xD78
	Size: 0x14A
	Parameters: 0
	Flags: Linked
*/
function function_542663a0()
{
	var_5d175791 = level.weaponsatchelcharge;
	self.var_bd5b6650 = 1;
	var_e8b7635c = self getcurrentoffhand();
	if(var_e8b7635c !== var_5d175791)
	{
		if(!self hasweapon(var_5d175791))
		{
			var_6e2c7396 = 1;
			self giveweapon(var_5d175791);
		}
		self switchtooffhand(var_5d175791);
	}
	waitframe(1);
	if(!self gestures::function_56e00fbf(#"hash_7e249c3769936b51", undefined, 1))
	{
		if(isdefined(var_6e2c7396))
		{
			self takeweapon(var_5d175791);
		}
		self.var_bd5b6650 = undefined;
		return false;
	}
	function_a0a96965();
	wait(0.5);
	if(isdefined(var_6e2c7396))
	{
		self takeweapon(var_5d175791);
	}
	self.var_bd5b6650 = undefined;
	return true;
}

/*
	Name: function_adee7bee
	Namespace: satchel_charge
	Checksum: 0x1FB9394B
	Offset: 0xED0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_adee7bee()
{
	if(level.var_ac78d00e.var_a74161cc.var_7ab8e1cb === 1)
	{
		function_542663a0();
	}
}

/*
	Name: function_521f546a
	Namespace: satchel_charge
	Checksum: 0x1C5C1732
	Offset: 0xF18
	Size: 0x29E
	Parameters: 1
	Flags: Linked
*/
function function_521f546a(watcher)
{
	self endon(#"death");
	if(self.var_bf73db8c === 1 || self inlaststand() || self function_55acff10(1) || self function_b4813488())
	{
		return;
	}
	self.var_bf73db8c = 1;
	if(isdefined(self.var_1e593689))
	{
		arrayremovevalue(self.var_1e593689, undefined);
		if(self.var_1e593689.size > 0)
		{
			var_4ca85007 = (level.var_ac78d00e.var_a74161cc.var_f258f7d4 === 1 ? &function_51108722 : &function_6db0705);
			if(!self [[var_4ca85007]]())
			{
				function_adee7bee();
				self.var_bf73db8c = undefined;
				return;
			}
			var_c970f338 = function_542663a0();
			if(var_c970f338 === 1 && isdefined(self.var_1e593689))
			{
				foreach(var_77a228b3 in self.var_1e593689)
				{
					if(var_77a228b3 flag::get("satchelIsArmed") && self.isjammed !== 1 && var_77a228b3.isjammed !== 1)
					{
						watcher thread weaponobjects::waitanddetonate(var_77a228b3, 0, self, var_77a228b3.weapon);
					}
				}
			}
		}
		else
		{
			self.var_1e593689 = undefined;
			function_adee7bee();
		}
	}
	else
	{
		function_adee7bee();
	}
	self.var_bf73db8c = undefined;
}

/*
	Name: function_a39c62de
	Namespace: satchel_charge
	Checksum: 0xE69C6887
	Offset: 0x11C0
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_a39c62de(watcher)
{
	self endon(#"death");
	weapon = level.weaponsatchelcharge;
	if(isdefined(weapon) && self hasweapon(weapon) || (isdefined(self.var_1e593689) && self.var_1e593689.size > 0))
	{
		if(!isdefined(self.var_1e593689) && self getammocount(weapon) == 0)
		{
			self playsoundtoplayer("uin_default_action_denied", self);
			itemindex = getitemindexfromref(weapon.name);
			self luinotifyevent(#"hash_74dc06b4b4fb436c", 1, itemindex);
		}
		function_521f546a(watcher);
	}
}

/*
	Name: onplayerkilled
	Namespace: satchel_charge
	Checksum: 0x19BAC09D
	Offset: 0x12F0
	Size: 0x18C
	Parameters: 1
	Flags: Linked
*/
function onplayerkilled(params)
{
	weapon = params.weapon;
	eattacker = params.eattacker;
	einflictor = params.einflictor;
	self.var_1e593689 = undefined;
	self.var_bf73db8c = undefined;
	if(weapon.name === #"satchel_charge" && eattacker util::isenemyplayer(self) && self isinvehicle())
	{
		if(!isdefined(einflictor.var_3c0a7eef))
		{
			einflictor.var_3c0a7eef = [];
		}
		var_71f7928d = spawnstruct();
		var_71f7928d.player = self;
		var_71f7928d.vehicle = self getvehicleoccupied();
		var_71f7928d.var_33c9fbd5 = gettime();
		if(!isdefined(einflictor.var_3c0a7eef))
		{
			einflictor.var_3c0a7eef = [];
		}
		else if(!isarray(einflictor.var_3c0a7eef))
		{
			einflictor.var_3c0a7eef = array(einflictor.var_3c0a7eef);
		}
		einflictor.var_3c0a7eef[einflictor.var_3c0a7eef.size] = var_71f7928d;
	}
}

/*
	Name: onvehiclekilled
	Namespace: satchel_charge
	Checksum: 0x851EA8EF
	Offset: 0x1488
	Size: 0x1D4
	Parameters: 9
	Flags: Linked
*/
function onvehiclekilled(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, occupants)
{
	if(isdefined(occupants.size) && occupants.size > 0)
	{
		foreach(occupant in occupants)
		{
			if(psoffsettime util::isenemyplayer(occupant))
			{
				shitloc function_af9b1762(psoffsettime);
				break;
			}
		}
	}
	else if(isdefined(shitloc.var_3c0a7eef))
	{
		foreach(var_71f7928d in shitloc.var_3c0a7eef)
		{
			if(self == var_71f7928d.vehicle && var_71f7928d.var_33c9fbd5 == gettime())
			{
				shitloc function_af9b1762(psoffsettime);
				break;
			}
		}
	}
}

/*
	Name: function_af9b1762
	Namespace: satchel_charge
	Checksum: 0x536AE472
	Offset: 0x1668
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_af9b1762(eattacker)
{
	scoreevents = globallogic_score::function_3cbc4c6c(self.weapon.var_2e4a8800);
	if(isdefined(scoreevents.var_f8792376))
	{
		scoreevents::processscoreevent(scoreevents.var_f8792376, eattacker, undefined, self.weapon, undefined);
	}
}

/*
	Name: function_99514548
	Namespace: satchel_charge
	Checksum: 0xACBFCE13
	Offset: 0x16E0
	Size: 0x13C
	Parameters: 1
	Flags: Event
*/
event function_99514548(eventstruct)
{
	weapon = eventstruct.weapon;
	var_5d175791 = level.weaponsatchelcharge;
	if(weapon !== var_5d175791)
	{
		return;
	}
	if(!function_a2f3d962())
	{
		return;
	}
	player = self;
	if(!isplayer(player))
	{
		return;
	}
	if(isdefined(var_5d175791) && player hasweapon(var_5d175791))
	{
		var_383b646d = player getammocount(weapon);
		if(var_383b646d <= 0)
		{
			watcher = player weaponobjects::getweaponobjectwatcherbyweapon(weapon);
			if(isdefined(watcher))
			{
				player function_abe8608d(weapon, 1);
				player thread function_521f546a(watcher);
			}
		}
	}
}

/*
	Name: function_4ba658e5
	Namespace: satchel_charge
	Checksum: 0xD74A8AB8
	Offset: 0x1828
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function function_4ba658e5(watcher, player)
{
}

/*
	Name: function_335a9072
	Namespace: satchel_charge
	Checksum: 0xBB931860
	Offset: 0x1848
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_335a9072(text)
{
	/#
		if(level.weaponobjectdebug == 1)
		{
			entitynumber = self getentitynumber();
			println((("" + entitynumber) + "") + text);
		}
	#/
}

/*
	Name: function_87e9f461
	Namespace: satchel_charge
	Checksum: 0x1DEBB8C0
	Offset: 0x18C8
	Size: 0xB6
	Parameters: 0
	Flags: None
*/
function function_87e9f461()
{
	/#
		self endon(#"death", #"hacked", #"detonating");
		function_a0778d59();
		starttime = gettime();
		while(true)
		{
			function_335a9072("" + ((float(self.weapon.fusetime - (gettime() - starttime))) / 1000));
			waitframe(1);
		}
	#/
}

