#using script_1cc417743d7c262d;
#using script_2c74a7b5eea1ec89;
#using script_2dc48f46bfeac894;
#using script_47fb62300ac0bd60;
#using script_545a0bac37bda541;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_79a7e1c31a3e8cc;
#using script_7f6cd71c43c45c57;
#using script_8988fdbc78d6c53;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\mp_common\draft.gsc;

#namespace supplypod;

/*
	Name: function_dbb40761
	Namespace: supplypod
	Checksum: 0x6C6AA3CE
	Offset: 0x2E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dbb40761()
{
	level notify(1069473174);
}

/*
	Name: function_89f2df9
	Namespace: supplypod
	Checksum: 0x54E6F6AF
	Offset: 0x300
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"supplypod", &function_70a657d8, undefined, &finalize, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: supplypod
	Checksum: 0x20B9F580
	Offset: 0x360
	Size: 0x1DC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(game.var_6ccfdacd))
	{
		game.var_6ccfdacd = 0;
	}
	level.var_934fb97 = spawnstruct();
	level.var_934fb97.var_27fce4c0 = [];
	level.var_934fb97.var_d741a6a4 = [];
	level.var_934fb97.bundle = getscriptbundle("killstreak_supplypod");
	level.var_934fb97.weapon = getweapon("gadget_supplypod");
	level.var_934fb97.var_ff101fac = getweapon(#"hash_3b38033eca0a3bdd");
	level.var_dc8edcba = &function_827486aa;
	level.var_49ef5263 = &function_49ef5263;
	level.var_1e64d41 = &function_1e64d41;
	setupcallbacks();
	setupclientfields();
	deployable::function_2e088f73(level.var_934fb97.weapon, &function_1f8cd247);
	globallogic_score::function_5a241bd8(level.var_934fb97.weapon, &function_92856c6);
	globallogic_score::function_c1e9b86b(level.var_934fb97.weapon, &function_8d653231);
}

/*
	Name: finalize
	Namespace: supplypod
	Checksum: 0x552CD43A
	Offset: 0x548
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function finalize()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](level.var_934fb97.weapon, &function_bff5c062);
	}
}

/*
	Name: function_127fb8f3
	Namespace: supplypod
	Checksum: 0x93834BDD
	Offset: 0x590
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function function_127fb8f3(supplypod, var_dbd1a594)
{
	var_dbd1a594.gameobject gameobjects::allow_use(#"hash_161f03feaadc9b8f");
	if(isdefined(level.var_86e3d17a))
	{
		_station_up_to_detention_center_triggers = [[level.var_86e3d17a]]();
		if((isdefined(_station_up_to_detention_center_triggers) ? _station_up_to_detention_center_triggers : 0) > 0)
		{
			var_dbd1a594 notify(#"hash_602ae7ca650d6287");
			var_dbd1a594 thread weaponobjects::weapon_object_timeout(var_dbd1a594.var_2d045452, _station_up_to_detention_center_triggers);
		}
	}
}

/*
	Name: function_bff5c062
	Namespace: supplypod
	Checksum: 0x98C9FD52
	Offset: 0x650
	Size: 0x40C
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(supplypod, var_dbd1a594)
{
	if(!isdefined(supplypod.gameobject))
	{
		return;
	}
	original_owner = supplypod.owner;
	supplypod.owner weaponobjects::hackerremoveweapon(supplypod);
	supplypod.owner function_890b2784();
	supplypod.owner = var_dbd1a594;
	supplypod setowner(var_dbd1a594);
	supplypod setteam(var_dbd1a594 getteam());
	supplypod.team = var_dbd1a594 getteam();
	supplypod.gameobject gameobjects::set_owner_team(var_dbd1a594.team);
	supplypod.gameobject gameobjects::set_visible(#"hash_150a20fa4efc5c7a");
	supplypod.gameobject gameobjects::allow_use(#"hash_150a20fa4efc5c7a");
	supplypod notify(#"hash_523ddcbd662010e5");
	supplypod notify(#"hacked");
	if(isdefined(supplypod.var_2d045452))
	{
		supplypod.var_2d045452 notify(#"hacked");
	}
	supplypod thread watchfordamage();
	supplypod thread watchfordeath();
	var_a87deb22 = 1;
	if(!level.teambased)
	{
		supplypod.gameobject.trigger setteamfortrigger(supplypod.team);
	}
	if(isdefined(level.var_f1edf93f) && isdefined(supplypod.var_2d045452))
	{
		_station_up_to_detention_center_triggers = [[level.var_f1edf93f]]();
		if((isdefined(_station_up_to_detention_center_triggers) ? _station_up_to_detention_center_triggers : 0))
		{
			supplypod.var_2d045452 notify(#"hash_602ae7ca650d6287");
			if(isdefined(original_owner))
			{
				watcher = original_owner weaponobjects::getweaponobjectwatcherbyweapon(supplypod.var_2d045452.weapon);
				if(isdefined(watcher))
				{
					supplypod.var_2d045452 thread weaponobjects::function_6d8aa6a0(var_dbd1a594, watcher);
					supplypod.var_2d045452 thread weaponobjects::weapon_object_timeout(watcher, _station_up_to_detention_center_triggers);
					var_a87deb22 = 0;
				}
			}
		}
	}
	if(isdefined(level.var_fc1bbaef))
	{
		[[level.var_fc1bbaef]](supplypod);
	}
	level.var_934fb97.var_5f6d033b[supplypod.objectiveid] = supplypod;
	if(!isdefined(level.var_934fb97.var_27fce4c0[var_dbd1a594.clientid]))
	{
		level.var_934fb97.var_27fce4c0[var_dbd1a594.clientid] = [];
	}
	var_a7edcaed = level.var_934fb97.var_27fce4c0.size + 1;
	array::push(level.var_934fb97.var_27fce4c0[var_dbd1a594.clientid], supplypod, var_a7edcaed);
	if(var_a87deb22)
	{
		supplypod thread function_827486aa(0);
	}
}

/*
	Name: function_29de6f1f
	Namespace: supplypod
	Checksum: 0x7980D1E1
	Offset: 0xA68
	Size: 0x1C8
	Parameters: 2
	Flags: Linked
*/
function function_29de6f1f(weapon, meansofdeath)
{
	if(!isdefined(meansofdeath))
	{
		meansofdeath = undefined;
	}
	baseweapon = weapons::getbaseweapon(weapon);
	var_62c1bfaa = weapon.inventorytype == "ability" && weapon.offhandslot == "Special";
	islethalgrenade = weapon.inventorytype == "offhand" && weapon.offhandslot == "Lethal grenade";
	istacticalgrenade = weapon.inventorytype == "offhand" && weapon.offhandslot == "Tactical grenade";
	iskillstreak = isdefined(killstreaks::get_from_weapon(weapon));
	ismelee = isdefined(meansofdeath) && (meansofdeath == #"mod_melee" || meansofdeath == #"mod_melee_weapon_butt");
	var_4ea2a976 = weapon.name == "launcher_standard_t9" || weapon.name == "sig_buckler_dw";
	if(var_62c1bfaa || islethalgrenade || istacticalgrenade || iskillstreak || ismelee || var_4ea2a976)
	{
		return false;
	}
	return true;
}

/*
	Name: function_49ef5263
	Namespace: supplypod
	Checksum: 0x3728A359
	Offset: 0xC38
	Size: 0x28
	Parameters: 0
	Flags: Linked
*/
function function_49ef5263()
{
	if(self function_e8e1d88e() > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_1e64d41
	Namespace: supplypod
	Checksum: 0x694C8E5B
	Offset: 0xC68
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function function_1e64d41(weapon)
{
	if(!isdefined(self) || !isplayer(self) || !self function_49ef5263() || !isdefined(weapon) || weapon.name != "launcher_standard_t8")
	{
		return;
	}
	scoreevents::processscoreevent(#"hash_21472dde8e287011", self, undefined, level.var_934fb97.weapon);
	if(isdefined(self.var_bfeea3dd) && isalive(self.var_bfeea3dd) && self != self.var_bfeea3dd && self.team == self.var_bfeea3dd.team)
	{
		scoreevents::processscoreevent(#"hash_131b23d720fc82c3", self.var_bfeea3dd, undefined, level.var_934fb97.weapon);
	}
	self playlocalsound(#"hash_6c2a2fee191330a0");
}

/*
	Name: function_92856c6
	Namespace: supplypod
	Checksum: 0x6B68387F
	Offset: 0xDD0
	Size: 0x14C
	Parameters: 5
	Flags: Linked
*/
function function_92856c6(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	if(!isdefined(victim) || !isdefined(weapon) || !isdefined(meansofdeath))
	{
		return false;
	}
	if(!function_29de6f1f(attackerweapon, meansofdeath))
	{
		return false;
	}
	if(victim function_49ef5263())
	{
		if(isdefined(victim.var_bfeea3dd) && isalive(victim.var_bfeea3dd) && victim != victim.var_bfeea3dd && victim.team == victim.var_bfeea3dd.team)
		{
			scoreevents::processscoreevent(#"hash_131b23d720fc82c3", victim.var_bfeea3dd, undefined, level.var_934fb97.weapon);
		}
		victim playlocalsound(#"hash_6c2a2fee191330a0");
		return true;
	}
	return false;
}

/*
	Name: function_8d653231
	Namespace: supplypod
	Checksum: 0x30EF83B4
	Offset: 0xF28
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_8d653231(params)
{
	attacker = params.attacker;
	attacker stats::function_dad108fa(#"hash_816e30933fc24d9", 1);
}

/*
	Name: function_f579e72b
	Namespace: supplypod
	Checksum: 0x4123F677
	Offset: 0xF78
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_f579e72b(watcher)
{
	watcher.watchforfire = 1;
	watcher.onspawn = &function_37a2d89d;
	watcher.timeout = float(level.var_934fb97.bundle.ksduration) / 1000;
	watcher.ontimeout = &function_7c0d095c;
	watcher.var_994b472b = &function_f7d9ebce;
	watcher.var_10efd558 = "switched_field_upgrade";
}

/*
	Name: function_f7d9ebce
	Namespace: supplypod
	Checksum: 0x1B90649C
	Offset: 0x1030
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_f7d9ebce(player)
{
	if(!isdefined(self.supplypod))
	{
		return;
	}
	self.supplypod.var_8d834202 = 1;
	self.supplypod thread function_827486aa(0);
}

/*
	Name: function_7c0d095c
	Namespace: supplypod
	Checksum: 0x77142FEC
	Offset: 0x1088
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_7c0d095c()
{
	if(!isdefined(self.supplypod))
	{
		return;
	}
	self.supplypod thread function_827486aa(0);
}

/*
	Name: function_37a2d89d
	Namespace: supplypod
	Checksum: 0x5591276D
	Offset: 0x10C0
	Size: 0x1BE
	Parameters: 2
	Flags: Linked
*/
function function_37a2d89d(watcher, owner)
{
	self endon(#"death");
	self thread weaponobjects::onspawnuseweaponobject(watcher, owner);
	self hide();
	self.var_52a68abf = 1;
	self.var_24d0abd1 = 1;
	self.delete_on_death = 1;
	if(!is_true(self.previouslyhacked))
	{
		if(isdefined(owner))
		{
			owner stats::function_e24eec31(self.weapon, #"used", 1);
			owner notify(#"supplypod");
		}
		self waittilltimeout(0.05, #"stationary");
		if(!owner deployable::function_f8fe102f())
		{
			owner setriotshieldfailhint();
			self deletedelay();
			return;
		}
		self deployable::function_dd266e08(owner);
		self.var_3823265d = owner.var_3823265d;
		owner.var_3823265d = undefined;
		owner function_63c23d02(watcher, self);
		supplypod = self.supplypod;
		supplypod.var_48d842c3 = 1;
		supplypod.var_515d6dda = 1;
	}
}

/*
	Name: playdeathfx
	Namespace: supplypod
	Checksum: 0xF945184
	Offset: 0x1288
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function playdeathfx()
{
	weaponobjects::function_b4793bda(self, level.var_934fb97.weapon);
	self playsound(level.var_934fb97.bundle.var_b3756378);
}

/*
	Name: function_263be969
	Namespace: supplypod
	Checksum: 0x397DAAB
	Offset: 0x12F0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_263be969()
{
	weaponobjects::function_f2a06099(self, level.var_934fb97.weapon);
	self playsound(level.var_934fb97.bundle.var_b3756378);
}

/*
	Name: function_d7cd849c
	Namespace: supplypod
	Checksum: 0x93BE9294
	Offset: 0x1358
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function function_d7cd849c(var_cb0f3959, team)
{
	if(!isdefined(team))
	{
		return;
	}
	if(!isdefined(level.var_934fb97.var_d741a6a4[team]))
	{
		level.var_934fb97.var_d741a6a4[team] = 0;
	}
	var_ad7969ca = level.var_934fb97.var_d741a6a4[team];
	if(var_ad7969ca != 0 && gettime() < ((int(5 * 1000)) + var_ad7969ca))
	{
		return;
	}
	level.var_934fb97.var_d741a6a4[team] = gettime();
}

/*
	Name: setupclientfields
	Namespace: supplypod
	Checksum: 0x67D80659
	Offset: 0x1430
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function setupclientfields()
{
	clientfield::register("scriptmover", "supplypod_placed", 1, 1, "int");
}

/*
	Name: setupcallbacks
	Namespace: supplypod
	Checksum: 0x9A2705C7
	Offset: 0x1470
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private setupcallbacks()
{
	ability_player::register_gadget_activation_callbacks(35, &function_8524b3c5, &function_f4255c84);
	callback::on_spawned(&on_player_spawned);
	weaponobjects::function_e6400478(#"gadget_supplypod", &function_f579e72b, 1);
}

/*
	Name: on_player_spawned
	Namespace: supplypod
	Checksum: 0xC45538E1
	Offset: 0x1508
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	player = self;
	player.var_2383a10c = [];
	self function_46d74bb7(0);
	var_8d33d79 = isdefined(player.var_29fdd9dd) && player.team != player.var_29fdd9dd;
	if((isdefined(player.var_228b6835) ? player.var_228b6835 : 0) || var_8d33d79 || (isdefined(level.var_934fb97.bundle.var_18ede0bb) ? level.var_934fb97.bundle.var_18ede0bb : 0))
	{
		player.var_17d74a5c = undefined;
		player.var_29fdd9dd = undefined;
		player.var_48107b1c = undefined;
		player function_a0814839(0);
	}
	if(isdefined(player.var_17d74a5c))
	{
		if(isdefined(player.var_57de9100))
		{
			player.var_57de9100.trigger setinvisibletoplayer(player);
		}
		player thread function_18f999b5(float(player.var_17d74a5c) / 1000);
		player.var_17d74a5c = player.var_17d74a5c + gettime();
		player function_3ea286();
	}
}

/*
	Name: function_46d74bb7
	Namespace: supplypod
	Checksum: 0x77B86EAD
	Offset: 0x16D8
	Size: 0x294
	Parameters: 1
	Flags: Linked
*/
function function_46d74bb7(var_70150641)
{
	if((isdefined(var_70150641) ? var_70150641 : 0))
	{
		players = getplayers(self.team);
	}
	else
	{
		players = getplayers();
	}
	foreach(player in players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		/#
			assert(isdefined(player.clientid));
		#/
		if(!isdefined(player.clientid))
		{
			continue;
		}
		pods = level.var_934fb97.var_27fce4c0[player.clientid];
		if(isdefined(pods))
		{
			foreach(pod in pods)
			{
				if(!isdefined(pod))
				{
					continue;
				}
				if(isdefined(pod.gameobject))
				{
					gameobject = pod.gameobject;
					if(!(isdefined(level.var_934fb97.bundle.var_82fccdb8) ? level.var_934fb97.bundle.var_82fccdb8 : 0) && isdefined(self.var_2383a10c[gameobject.entnum]) && self.var_2383a10c[gameobject.entnum] >= level.var_934fb97.bundle.var_186e07b5)
					{
						continue;
					}
					pod.gameobject.trigger setvisibletoplayer(self);
				}
			}
		}
	}
}

/*
	Name: function_8524b3c5
	Namespace: supplypod
	Checksum: 0xC2F8215E
	Offset: 0x1978
	Size: 0x66
	Parameters: 2
	Flags: Linked
*/
function function_8524b3c5(slot, playerweapon)
{
	/#
		assert(isplayer(self));
	#/
	self notify(#"start_killstreak", {#weapon:playerweapon});
}

/*
	Name: function_f4255c84
	Namespace: supplypod
	Checksum: 0xB62A4958
	Offset: 0x19E8
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function function_f4255c84(slot, weapon)
{
}

/*
	Name: getobjectiveid
	Namespace: supplypod
	Checksum: 0x2D32EB77
	Offset: 0x1A08
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function getobjectiveid()
{
	return gameobjects::get_next_obj_id();
}

/*
	Name: deleteobjective
	Namespace: supplypod
	Checksum: 0x1E0736F0
	Offset: 0x1A28
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function deleteobjective(objectiveid)
{
	if(isdefined(objectiveid))
	{
		objective_delete(objectiveid);
		gameobjects::release_obj_id(objectiveid);
	}
}

/*
	Name: function_890b2784
	Namespace: supplypod
	Checksum: 0x30E15E95
	Offset: 0x1A78
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_890b2784()
{
	var_10432750 = undefined;
	for(index = 0; index < level.var_934fb97.var_27fce4c0[self.clientid].size; index++)
	{
		if(level.var_934fb97.var_27fce4c0[self.clientid][index] == self)
		{
			var_10432750 = index;
		}
	}
	if(isdefined(var_10432750))
	{
		level.var_934fb97.var_27fce4c0[self.clientid] = array::remove_index(level.var_934fb97.var_27fce4c0[self.clientid], var_10432750, 0);
	}
}

/*
	Name: function_827486aa
	Namespace: supplypod
	Checksum: 0x13851C10
	Offset: 0x1B50
	Size: 0x216
	Parameters: 2
	Flags: Linked
*/
function function_827486aa(var_d3213f00, var_7497ba51)
{
	if(!isdefined(var_7497ba51))
	{
		var_7497ba51 = 1;
	}
	self notify(#"hash_523ddcbd662010e5");
	self.var_ab0875aa = 1;
	if(isdefined(self.var_83d9bfb5) && self.var_83d9bfb5)
	{
		return;
	}
	deleteobjective(self.objectiveid);
	deleteobjective(self.var_134eefb9);
	self.var_83d9bfb5 = 1;
	level.var_934fb97.var_5f6d033b[self.objectiveid] = undefined;
	self clientfield::set("enemyequip", 0);
	if(isdefined(self.gameobject))
	{
		self.gameobject thread gameobjects::destroy_object(1, 1);
	}
	self function_890b2784();
	if(isdefined(self.owner))
	{
		if(game.state == #"playing")
		{
			if(is_true(var_d3213f00))
			{
				self.owner globallogic_score::function_5829abe3(self.var_846acfcf, self.var_d02ddb8e, level.var_934fb97.weapon);
			}
		}
	}
	if(var_7497ba51 && self.var_8d834202 === 1)
	{
		wait((isdefined(level.var_934fb97.bundle.var_fd663ee0) ? level.var_934fb97.bundle.var_fd663ee0 : 0) / 1000);
	}
	function_9d4aabb9(var_d3213f00);
}

/*
	Name: function_9d4aabb9
	Namespace: supplypod
	Checksum: 0x213EA5B7
	Offset: 0x1D70
	Size: 0x3FC
	Parameters: 1
	Flags: Linked
*/
function function_9d4aabb9(var_d3213f00)
{
	if(!isdefined(self))
	{
		return;
	}
	player = self.owner;
	if(isdefined(self.var_846acfcf) && isdefined(player) && self.var_846acfcf != player)
	{
		self battlechatter::function_d2600afc(self.var_846acfcf, player, level.var_934fb97.weapon, self.var_d02ddb8e);
	}
	if(game.state == #"playing")
	{
		if(self.health <= 0)
		{
			if(isdefined(level.var_934fb97.bundle.var_b3756378))
			{
				self playsound(level.var_934fb97.bundle.var_b3756378);
			}
		}
		if(is_true(var_d3213f00))
		{
			if(isdefined(player))
			{
				var_f3ab6571 = self.owner weaponobjects::function_8481fc06(level.var_934fb97.weapon) > 1;
				self.owner thread globallogic_audio::function_6daffa93(level.var_934fb97.weapon, var_f3ab6571);
			}
			if(isplayer(self.var_846acfcf))
			{
				self.var_846acfcf challenges::destroyedequipment(self.var_d02ddb8e);
			}
			function_d7cd849c(level.var_934fb97.bundle.var_2ee73347, self.team);
			function_d7cd849c(level.var_934fb97.bundle.var_79efc1, util::getotherteam(self.team));
		}
		else
		{
			function_d7cd849c(level.var_934fb97.bundle.var_10c9ba2d, self.team);
			function_d7cd849c(level.var_934fb97.bundle.var_f29e64de, util::getotherteam(self.team));
		}
	}
	if(self.var_8d834202 === 1)
	{
		function_263be969();
	}
	else
	{
		playdeathfx();
	}
	if(isdefined(level.var_934fb97.bundle.var_bb6c29b4) && isdefined(self.var_d02ddb8e) && self.var_d02ddb8e == getweapon(#"shock_rifle"))
	{
		playfx(level.var_934fb97.bundle.var_bb6c29b4, self.origin);
	}
	deployable::function_81598103(self);
	if(isdefined(self.var_2d045452))
	{
		self.var_2d045452 delete();
	}
	self stoploopsound();
	self notify(#"hash_6d5130f90f39295e");
	self deletedelay();
}

/*
	Name: function_5761966a
	Namespace: supplypod
	Checksum: 0xD23CA095
	Offset: 0x2178
	Size: 0x158
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5761966a(supplypod)
{
	player = self;
	player endon(#"disconnect");
	level endon(#"game_ended");
	supplypod endon(#"hash_6d5130f90f39295e");
	if(!isdefined(supplypod.var_7b7607df[player.clientid]))
	{
		return;
	}
	objective_setvisibletoplayer(supplypod.var_134eefb9, player);
	while(isdefined(supplypod.var_7b7607df[player.clientid]) && supplypod.var_7b7607df[player.clientid] > gettime())
	{
		timeremaining = (float(supplypod.var_7b7607df[player.clientid] - gettime())) / 1000;
		if(timeremaining > 0)
		{
			wait(timeremaining);
		}
	}
	objective_setinvisibletoplayer(supplypod.var_134eefb9, player);
	supplypod.var_7b7607df[player.clientid] = undefined;
}

/*
	Name: function_3c4843e3
	Namespace: supplypod
	Checksum: 0x7C932C9
	Offset: 0x22D8
	Size: 0x44
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3c4843e3(supplypod, timetoadd)
{
	supplypod.var_7b7607df[self.clientid] = gettime() + (int(timetoadd * 1000));
}

/*
	Name: watchfordeath
	Namespace: supplypod
	Checksum: 0xBB05A722
	Offset: 0x2328
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function watchfordeath()
{
	level endon(#"game_ended");
	self.owner endon(#"disconnect", #"joined_team", #"changed_specialist");
	self endon(#"hash_523ddcbd662010e5");
	waitresult = undefined;
	waitresult = self waittill(#"death");
	if(!isdefined(self))
	{
		return;
	}
	var_b08a3652 = 1;
	if(isdefined(level.figure_out_attacker))
	{
		self.var_846acfcf = self [[level.figure_out_attacker]](waitresult.attacker);
	}
	else
	{
		self.var_846acfcf = waitresult.attacker;
	}
	self.var_d02ddb8e = waitresult.weapon;
	if(isdefined(waitresult.attacker) && isdefined(self) && isdefined(self.owner) && waitresult.attacker.team == self.owner.team)
	{
		var_b08a3652 = 0;
	}
	else
	{
		killstreaks::function_e729ccee(waitresult.attacker, waitresult.weapon);
	}
	self thread function_827486aa(var_b08a3652);
}

/*
	Name: watchfordamage
	Namespace: supplypod
	Checksum: 0x760C944E
	Offset: 0x24C0
	Size: 0x288
	Parameters: 0
	Flags: Linked
*/
function watchfordamage()
{
	self endon(#"death");
	level endon(#"game_ended");
	self endon(#"hash_523ddcbd662010e5");
	supplypod = self;
	supplypod endon(#"death");
	supplypod.health = level.var_934fb97.bundle.kshealth;
	startinghealth = supplypod.health;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if((isdefined(level.var_934fb97.bundle.var_4f845dc4) ? level.var_934fb97.bundle.var_4f845dc4 : 0) && isdefined(waitresult.attacker) && isplayer(waitresult.attacker))
		{
			var_fd03ecd9 = supplypod.health / startinghealth;
			objective_setprogress(supplypod.var_134eefb9, var_fd03ecd9);
			var_adb78fe4 = isdefined(supplypod.var_7b7607df[waitresult.attacker.clientid]);
			waitresult.attacker function_3c4843e3(supplypod, level.var_934fb97.bundle.var_c14832cd);
			if(!var_adb78fe4)
			{
				waitresult.attacker thread function_5761966a(supplypod);
			}
		}
		if(isdefined(waitresult.attacker) && waitresult.amount > 0 && damagefeedback::dodamagefeedback(waitresult.weapon, waitresult.attacker))
		{
			waitresult.attacker damagefeedback::update(waitresult.mod, waitresult.inflictor, undefined, waitresult.weapon, self);
		}
	}
}

/*
	Name: function_8d362deb
	Namespace: supplypod
	Checksum: 0x7FDECE7A
	Offset: 0x2750
	Size: 0x10A
	Parameters: 13
	Flags: Linked
*/
function function_8d362deb(einflictor, attacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex)
{
	bundle = level.var_934fb97.bundle;
	chargelevel = 0;
	weapon_damage = killstreak_bundles::get_weapon_damage("killstreak_supplypod", bundle.kshealth, vdir, imodelindex, iboneindex, shitloc, psoffsettime, chargelevel);
	if(!isdefined(weapon_damage))
	{
		weapon_damage = killstreaks::get_old_damage(vdir, imodelindex, iboneindex, shitloc, 1);
	}
	return int(weapon_damage);
}

/*
	Name: function_438ca4e0
	Namespace: supplypod
	Checksum: 0x556BFBFE
	Offset: 0x2868
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function function_438ca4e0()
{
	supplypod = self;
	supplypod endon(#"hash_6d5130f90f39295e", #"death");
	level waittill(#"game_ended");
	if(!isdefined(self))
	{
		return;
	}
	supplypod.var_8d834202 = 1;
	self thread function_827486aa(0, 0);
	supplypod.var_648955e6 = 1;
}

/*
	Name: function_fec0924
	Namespace: supplypod
	Checksum: 0xA0BC5D82
	Offset: 0x2908
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function function_fec0924()
{
	var_d5110c6d = game.var_6ccfdacd;
	game.var_6ccfdacd = game.var_6ccfdacd + 1;
	return var_d5110c6d;
}

/*
	Name: function_9abdee8c
	Namespace: supplypod
	Checksum: 0xA5E1F957
	Offset: 0x2948
	Size: 0xA7C
	Parameters: 2
	Flags: Linked
*/
function function_9abdee8c(watcher, object)
{
	player = self;
	if(isdefined(level.var_934fb97.var_27fce4c0[player.clientid]) && level.var_934fb97.var_27fce4c0[player.clientid].size >= (isdefined(level.var_934fb97.bundle.var_cbe1e532) ? level.var_934fb97.bundle.var_cbe1e532 : 1))
	{
		obj = level.var_934fb97.var_27fce4c0[player.clientid][0];
		if(isdefined(obj))
		{
			obj.var_8d834202 = 1;
			obj thread function_827486aa(0);
		}
		else
		{
			level.var_934fb97.var_27fce4c0[self.clientid] = undefined;
		}
	}
	slot = player gadgetgetslot(level.var_934fb97.weapon);
	player gadgetpowerreset(slot);
	player gadgetpowerset(slot, 0);
	supplypod = spawn("script_model", object.origin);
	supplypod function_619a5c20();
	supplypod setmodel(level.var_934fb97.weapon.var_22082a57);
	object.supplypod = supplypod;
	supplypod.var_2d045452 = object;
	supplypod function_41b29ff0("wpn_t9_eqp_supply_pod_destructible");
	supplypod useanimtree("generic");
	supplypod.owner = player;
	supplypod.clientid = supplypod.owner.clientid;
	supplypod.angles = player.angles;
	supplypod clientfield::set("supplypod_placed", 1);
	supplypod setteam(player getteam());
	supplypod.var_86a21346 = &function_8d362deb;
	supplypod solid();
	supplypod show();
	supplypod.victimsoundmod = "vehicle";
	supplypod.weapon = level.var_934fb97.weapon;
	supplypod setweapon(supplypod.weapon);
	supplypod.var_57022ab8 = (isdefined(level.var_934fb97.bundle.var_5a0d87e0) ? level.var_934fb97.bundle.var_5a0d87e0 : 20);
	supplypod.usecount = 0;
	supplypod.objectiveid = getobjectiveid();
	level.var_934fb97.var_5f6d033b[supplypod.objectiveid] = supplypod;
	if(!isdefined(level.var_934fb97.var_27fce4c0[player.clientid]))
	{
		level.var_934fb97.var_27fce4c0[player.clientid] = [];
	}
	var_a7edcaed = level.var_934fb97.var_27fce4c0.size + 1;
	array::push(level.var_934fb97.var_27fce4c0[player.clientid], supplypod, var_a7edcaed);
	supplypod setcandamage(1);
	supplypod clientfield::set("enemyequip", 1);
	supplypod.var_99d2556b = gettime();
	supplypod.uniqueid = function_fec0924();
	function_d7cd849c(level.var_934fb97.bundle.var_69b1ff7, player getteam());
	function_d7cd849c(level.var_934fb97.bundle.var_4f37dfe9, util::getotherteam(player getteam()));
	if(isdefined(level.var_934fb97.bundle.var_a0db3d4d))
	{
		supplypod playloopsound(level.var_934fb97.bundle.var_a0db3d4d);
	}
	if((isdefined(level.var_934fb97.bundle.var_4f845dc4) ? level.var_934fb97.bundle.var_4f845dc4 : 0))
	{
		supplypod.var_134eefb9 = getobjectiveid();
		supplypod.var_7b7607df = [];
		objective_add(supplypod.var_134eefb9, "active", supplypod.origin, level.var_934fb97.bundle.var_ce75f65c);
		objective_setprogress(supplypod.var_134eefb9, 1);
		objective_setinvisibletoall(supplypod.var_134eefb9);
	}
	triggerradius = level.var_934fb97.bundle.var_366f43e9;
	triggerheight = level.var_934fb97.bundle.var_2f1567fb;
	var_b1a6d849 = level.var_934fb97.bundle.var_2d890f85;
	upangle = vectorscale(vectornormalize(anglestoup(supplypod.angles)), 5);
	var_40989bda = supplypod.origin + upangle;
	usetrigger = spawn("trigger_radius_use", var_40989bda, 0, triggerradius, triggerheight);
	usetrigger setcursorhint("HINT_INTERACTIVE_PROMPT");
	usetrigger function_49462027(1, (((1 | 4096) | 2) | 2097152) | 2048);
	usetrigger function_cb5cf7cb();
	usetrigger usetriggerignoreuseholdtime();
	supplypod.gameobject = gameobjects::create_use_object(#"any", usetrigger, [], undefined, level.var_934fb97.bundle.var_9333131b, 1, 1);
	supplypod.gameobject gameobjects::set_use_time(var_b1a6d849);
	supplypod.gameobject.onbeginuse = &function_8c8fb7b5;
	supplypod.gameobject.onenduse = &function_a1434496;
	supplypod.gameobject.canuseobject = &canuseobject;
	supplypod.gameobject.var_5ecd70 = supplypod;
	supplypod.gameobject.var_33d50507 = 1;
	supplypod.gameobject.dontlinkplayertotrigger = 1;
	supplypod.gameobject.keepweapon = 1;
	supplypod.gameobject.requireslos = 1;
	supplypod.gameobject.var_d647eb08 = 1;
	player deployable::function_6ec9ee30(supplypod, level.var_934fb97.weapon);
	supplypod animation::play(#"hash_7540bb5a61e603a");
	supplypod.gameobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	supplypod.gameobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	if(supplypod.gameobject canuseobject(player))
	{
		supplypod.gameobject function_a1434496(undefined, player, 1, 1);
	}
	supplypod thread function_438ca4e0();
	supplypod thread watchfordamage();
	supplypod thread watchfordeath();
}

/*
	Name: function_8c8fb7b5
	Namespace: supplypod
	Checksum: 0x6D58BB42
	Offset: 0x33D0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8c8fb7b5(player)
{
}

/*
	Name: function_a143899c
	Namespace: supplypod
	Checksum: 0x809C5626
	Offset: 0x33E8
	Size: 0x14
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a143899c(player, waittime)
{
}

/*
	Name: function_a1434496
	Namespace: supplypod
	Checksum: 0x4B1101E3
	Offset: 0x3408
	Size: 0x4C4
	Parameters: 4
	Flags: Linked, Private
*/
function private function_a1434496(team, player, result, var_d862c76d)
{
	supplypod = self.var_5ecd70;
	if(!isdefined(supplypod))
	{
		return;
	}
	supplypod.isdisabled = 0;
	if(is_true(result))
	{
		var_8a0724f7 = supplypod.team !== player.team;
		supplypod.usecount++;
		if(!isdefined(player.var_2383a10c[self.entnum]))
		{
			player.var_2383a10c[self.entnum] = 0;
		}
		player.var_2383a10c[self.entnum]++;
		if(isdefined(supplypod.owner) && isplayer(player))
		{
			if(supplypod.owner != player && !var_8a0724f7)
			{
				scoreevents::processscoreevent(#"hash_69dbfbd660f8c53e", supplypod.owner, undefined, level.var_934fb97.weapon);
				supplypod.owner contracts::function_a54e2068(#"hash_67f98344b931e7ff");
				supplypod.owner stats::function_dad108fa(#"hash_3d7d26fa33ba6f97", 1);
			}
			supplypod.owner battlechatter::function_fc82b10(level.var_934fb97.weapon, self.origin, self);
		}
		thread function_a143899c(player, 1.5);
		if(var_d862c76d !== 1)
		{
			player thread gestures::function_f3e2696f(supplypod, level.var_934fb97.var_ff101fac, undefined, 0.5);
		}
		supplypod thread animation::play(#"hash_79647b3513fd2190");
		player function_bcf0dd99();
		if(!(isdefined(level.var_934fb97.bundle.var_82fccdb8) ? level.var_934fb97.bundle.var_82fccdb8 : 0) && player.var_2383a10c[self.entnum] >= level.var_934fb97.bundle.var_186e07b5)
		{
			self.trigger setinvisibletoplayer(player);
		}
		player.var_57de9100 = self;
		player.var_29fdd9dd = self.team;
		player.var_bfeea3dd = supplypod.owner;
		player notify(#"hash_69dbfbd660f8c53e");
		if(!(isdefined(level.var_934fb97.bundle.var_18ede0bb) ? level.var_934fb97.bundle.var_18ede0bb : 0))
		{
			self.trigger setinvisibletoplayer(player);
			duration = (isdefined(level.var_934fb97.bundle.var_84471829) ? level.var_934fb97.bundle.var_84471829 : 30);
			player.var_17d74a5c = gettime() + (int(duration * 1000));
			player thread function_18f999b5(duration);
		}
		else
		{
			player.var_48107b1c = 1;
		}
		if(var_8a0724f7)
		{
			supplypod.var_846acfcf = player;
			supplypod thread function_827486aa(1);
		}
		else if(supplypod.usecount == supplypod.var_57022ab8)
		{
			supplypod.var_8d834202 = 1;
			supplypod thread function_827486aa(0);
		}
	}
	else
	{
		thread function_a143899c(player, 0);
	}
}

/*
	Name: canuseobject
	Namespace: supplypod
	Checksum: 0xDD0C3E61
	Offset: 0x38D8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function canuseobject(user)
{
	return user function_f828c1cd();
}

/*
	Name: function_18f999b5
	Namespace: supplypod
	Checksum: 0x776A35B6
	Offset: 0x3908
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_18f999b5(waittime)
{
	self notify(#"hash_10cd6a20d4e45365");
	self endon(#"hash_10cd6a20d4e45365", #"disconnect");
	result = undefined;
	result = self waittilltimeout(waittime, #"death");
	if(result._notify == #"timeout")
	{
		self function_46d74bb7(1);
	}
	else
	{
		if((isdefined(level.var_934fb97.bundle.var_98da26d) ? level.var_934fb97.bundle.var_98da26d : 0))
		{
			self.var_17d74a5c = self.var_17d74a5c - gettime();
		}
		else
		{
			self.var_17d74a5c = undefined;
			self.var_bfeea3dd = undefined;
		}
	}
	self function_a0814839(0);
}

/*
	Name: function_1f8cd247
	Namespace: supplypod
	Checksum: 0x48347737
	Offset: 0x3A40
	Size: 0x228
	Parameters: 3
	Flags: Linked
*/
function function_1f8cd247(origin, angles, player)
{
	if(!isdefined(player.var_3823265d))
	{
		player.var_3823265d = spawnstruct();
	}
	var_1898acdc = (isdefined(level.var_934fb97.bundle.var_bdc8276) ? level.var_934fb97.bundle.var_bdc8276 : 0);
	testdistance = var_1898acdc * var_1898acdc;
	ids = getarraykeys(level.var_934fb97.var_27fce4c0);
	foreach(id in ids)
	{
		if(id == player.clientid)
		{
			continue;
		}
		pods = level.var_934fb97.var_27fce4c0[id];
		foreach(pod in pods)
		{
			if(!isdefined(pod))
			{
				continue;
			}
			distsqr = distancesquared(angles, pod.origin);
			if(distsqr <= testdistance)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_63c23d02
	Namespace: supplypod
	Checksum: 0x1ED9DC64
	Offset: 0x3C70
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function function_63c23d02(watcher, supplypod)
{
	supplypod setvisibletoall();
	if(isdefined(supplypod.othermodel))
	{
		supplypod.othermodel setinvisibletoall();
	}
	if(isdefined(supplypod.var_3823265d))
	{
		self function_9abdee8c(watcher, supplypod);
	}
	if(isdefined(level.var_84bf013e))
	{
		self notify(#"supplypod_placed", {#pod:supplypod});
	}
}

/*
	Name: oncancelplacement
	Namespace: supplypod
	Checksum: 0x6DEF742F
	Offset: 0x3D30
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function oncancelplacement(supplypod)
{
	slot = self gadgetgetslot(level.var_934fb97.weapon);
	self gadgetdeactivate(slot, level.var_934fb97.weapon, 0);
	self gadgetpowerset(slot, 100);
}

/*
	Name: function_452147b1
	Namespace: supplypod
	Checksum: 0xCB25D3BD
	Offset: 0x3DC8
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_452147b1(weapon, weaponindex)
{
	player = self;
	level endon(#"game_ended");
	player notify("on_death_ammon_backup" + weaponindex);
	player endon("on_death_ammon_backup" + weaponindex, #"disconnect");
	player waittill(#"death");
	player.pers["pod_ammo" + weaponindex] = player getweaponammostock(weapon);
}

/*
	Name: function_5bc9564e
	Namespace: supplypod
	Checksum: 0x19A93879
	Offset: 0x3E88
	Size: 0x196
	Parameters: 1
	Flags: Linked
*/
function function_5bc9564e(weapon)
{
	player = self;
	level endon(#"game_ended");
	player notify(#"hash_620e9c8ce0a79cf7");
	player endon(#"hash_620e9c8ce0a79cf7", #"disconnect");
	while(isdefined(player.pod_ammo) && player.pod_ammo.size > 0)
	{
		weapon = player getcurrentweapon();
		var_2f9ea2b9 = weapons::getbaseweapon(weapon);
		baseweaponindex = getbaseweaponitemindex(var_2f9ea2b9);
		if(is_true(player.pod_ammo[baseweaponindex]))
		{
			var_831b3584 = player getweaponammostock(weapon);
			if(var_831b3584 == 0)
			{
				player setweaponammostock(weapon, int(player.pod_ammo[baseweaponindex]));
				player.pod_ammo[baseweaponindex] = undefined;
				player thread function_452147b1(weapon, baseweaponindex);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_740ec27e
	Namespace: supplypod
	Checksum: 0x37E6DD12
	Offset: 0x4028
	Size: 0x154
	Parameters: 0
	Flags: None
*/
function function_740ec27e()
{
	player = self;
	primary_weapons = player getweaponslistprimaries();
	foreach(weapon in primary_weapons)
	{
		var_2f9ea2b9 = weapons::getbaseweapon(weapon);
		baseweaponindex = getbaseweaponitemindex(var_2f9ea2b9);
		player.pod_ammo[baseweaponindex] = (isdefined(getgametypesetting(#"hash_1441f7ad44e1cfd4")) ? getgametypesetting(#"hash_1441f7ad44e1cfd4") : 0) * weapon.clipsize;
	}
	player thread function_5bc9564e();
}

/*
	Name: function_bcf0dd99
	Namespace: supplypod
	Checksum: 0x94D6CFDE
	Offset: 0x4188
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_bcf0dd99()
{
	player = self;
	primary_weapons = player getweaponslistprimaries();
	foreach(weapon in primary_weapons)
	{
		var_831b3584 = player getweaponammostock(weapon);
		var_6e175b4f = (isdefined(getgametypesetting(#"hash_1441f7ad44e1cfd4")) ? getgametypesetting(#"hash_1441f7ad44e1cfd4") : 0) * weapon.clipsize;
		player setweaponammostock(weapon, int(var_831b3584 + var_6e175b4f));
	}
	player function_3ea286();
}

/*
	Name: function_b8a25634
	Namespace: supplypod
	Checksum: 0x29BB123E
	Offset: 0x42F0
	Size: 0x18C
	Parameters: 1
	Flags: None
*/
function function_b8a25634(owner)
{
	player = self;
	var_ab282d2a[0] = level.var_934fb97.bundle.var_b9443d6b;
	var_ab282d2a[1] = level.var_934fb97.bundle.var_ea340924;
	var_ab282d2a[2] = level.var_934fb97.bundle.var_ff3d4d40;
	for(slot = 0; slot < 3; slot++)
	{
		if(!isdefined(var_ab282d2a[slot]))
		{
			continue;
		}
		if(!isdefined(player._gadgets_player[slot]))
		{
			continue;
		}
		cooldown = slot * (isdefined(player._gadgets_player[slot].var_e4d4fa7e) ? player._gadgets_player[slot].var_e4d4fa7e : 0);
		if(is_true(owner))
		{
			cooldown = cooldown * (isdefined(level.var_934fb97.bundle.var_44a195ff) ? level.var_934fb97.bundle.var_44a195ff : 0);
		}
		player gadgetpowerchange(slot, cooldown);
	}
}

/*
	Name: function_de737a35
	Namespace: supplypod
	Checksum: 0x5731EAE8
	Offset: 0x4488
	Size: 0x204
	Parameters: 0
	Flags: None
*/
function function_de737a35()
{
	player = self;
	weapon = player getcurrentweapon();
	while(weapon == level.weaponnone)
	{
		waitframe(1);
		weapon = player getcurrentweapon();
	}
	slot = player gadgetgetslot(weapon);
	if(slot == 2 || weapon == getweapon(#"sig_buckler_turret"))
	{
		if(isdefined(weapon.var_7a93ed37))
		{
			player gadgetpowerchange(slot, weapon.var_7a93ed37);
		}
		if(isdefined(weapon.var_60563796))
		{
			if(weapon == getweapon(#"sig_buckler_turret") || weapon == getweapon(#"sig_buckler_dw"))
			{
				stockammo = player getweaponammoclip(weapon);
				player setweaponammoclip(weapon, stockammo + int(weapon.var_60563796));
			}
			else
			{
				stockammo = player getweaponammostock(weapon);
				player setweaponammostock(weapon, stockammo + int(weapon.var_60563796));
			}
		}
	}
}

