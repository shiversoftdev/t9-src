#using scripts\core_common\battlechatter.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\draft.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\abilities\ability_player.gsc;

#namespace supplypod;

/*
	Name: __init__system__
	Namespace: supplypod
	Checksum: 0xEA1878AF
	Offset: 0x2E0
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"supplypod", &function_70a657d8, undefined, &finalize, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: supplypod
	Checksum: 0xCFA4CED6
	Offset: 0x340
	Size: 0x1BC
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
	level.var_934fb97.var_ff101fac = getweapon(#"supplypod_catch");
	level.var_dc8edcba = &function_827486aa;
	level.var_49ef5263 = &function_49ef5263;
	level.hintobjectivehint_updat = &hintobjectivehint_updat;
	setupcallbacks();
	setupclientfields();
	deployable::register_deployable(level.var_934fb97.weapon, &function_1f8cd247);
	globallogic_score::function_5a241bd8(getweapon(#"gadget_supplypod"), &function_92856c6);
}

/*
	Name: finalize
	Namespace: supplypod
	Checksum: 0x6BE72638
	Offset: 0x508
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
	Checksum: 0x6728504B
	Offset: 0x550
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function function_127fb8f3(supplypod, attackingplayer)
{
	attackingplayer.gameobject gameobjects::allow_use(#"hash_161f03feaadc9b8f");
	if(isdefined(level.var_86e3d17a))
	{
		_station_up_to_detention_center_triggers = [[level.var_86e3d17a]]();
		if((isdefined(_station_up_to_detention_center_triggers) ? _station_up_to_detention_center_triggers : 0) > 0)
		{
			attackingplayer notify(#"cancel_timeout");
			attackingplayer thread weaponobjects::weapon_object_timeout(attackingplayer.var_2d045452, _station_up_to_detention_center_triggers);
		}
	}
}

/*
	Name: function_bff5c062
	Namespace: supplypod
	Checksum: 0xF59B00A8
	Offset: 0x610
	Size: 0x40C
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(supplypod, attackingplayer)
{
	if(!isdefined(supplypod.gameobject))
	{
		return;
	}
	original_owner = supplypod.owner;
	supplypod.owner weaponobjects::hackerremoveweapon(supplypod);
	supplypod.owner function_890b2784();
	supplypod.owner = attackingplayer;
	supplypod setowner(attackingplayer);
	supplypod setteam(attackingplayer getteam());
	supplypod.team = attackingplayer getteam();
	supplypod.gameobject gameobjects::set_owner_team(attackingplayer.team);
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
			supplypod.var_2d045452 notify(#"cancel_timeout");
			if(isdefined(original_owner))
			{
				watcher = original_owner weaponobjects::getweaponobjectwatcherbyweapon(supplypod.var_2d045452.weapon);
				if(isdefined(watcher))
				{
					supplypod.var_2d045452 thread weaponobjects::function_6d8aa6a0(attackingplayer, watcher);
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
	level.var_934fb97.supplypods[supplypod.objectiveid] = supplypod;
	if(!isdefined(level.var_934fb97.var_27fce4c0[attackingplayer.clientid]))
	{
		level.var_934fb97.var_27fce4c0[attackingplayer.clientid] = [];
	}
	var_a7edcaed = level.var_934fb97.var_27fce4c0.size + 1;
	array::push(level.var_934fb97.var_27fce4c0[attackingplayer.clientid], supplypod, var_a7edcaed);
	if(var_a87deb22)
	{
		supplypod thread function_827486aa(0);
	}
}

/*
	Name: function_29de6f1f
	Namespace: supplypod
	Checksum: 0x6E331899
	Offset: 0xA28
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
	Checksum: 0xC37ACBE1
	Offset: 0xBF8
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
	Name: hintobjectivehint_updat
	Namespace: supplypod
	Checksum: 0x45C2734A
	Offset: 0xC28
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function hintobjectivehint_updat(weapon)
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
	Checksum: 0x71A77E15
	Offset: 0xD90
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
	Name: function_f579e72b
	Namespace: supplypod
	Checksum: 0xFC97F04D
	Offset: 0xEE8
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_f579e72b(watcher)
{
	watcher.watchforfire = 1;
	watcher.onspawn = &supplypod_spawned;
	watcher.timeout = float(level.var_934fb97.bundle.ksduration) / 1000;
	watcher.ontimeout = &function_7c0d095c;
	watcher.var_994b472b = &function_f7d9ebce;
	watcher.var_10efd558 = "switched_field_upgrade";
}

/*
	Name: function_f7d9ebce
	Namespace: supplypod
	Checksum: 0x75533AF7
	Offset: 0xFA0
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
	Checksum: 0x2925FC65
	Offset: 0xFF8
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
	Name: supplypod_spawned
	Namespace: supplypod
	Checksum: 0x332DF4E7
	Offset: 0x1030
	Size: 0x1BE
	Parameters: 2
	Flags: Linked
*/
function supplypod_spawned(watcher, owner)
{
	self endon(#"death");
	self thread weaponobjects::onspawnuseweaponobject(watcher, owner);
	self hide();
	self.canthack = 1;
	self.ignoreemp = 1;
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
	Checksum: 0x30AB94CB
	Offset: 0x11F8
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
	Checksum: 0xAABB3C2C
	Offset: 0x1260
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
	Checksum: 0x8CAA5266
	Offset: 0x12C8
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
	Checksum: 0xD87EE1D1
	Offset: 0x13A0
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
	Checksum: 0x39A8F917
	Offset: 0x13E0
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private setupcallbacks()
{
	ability_player::register_gadget_activation_callbacks(35, &supplypod_on, &supplypod_off);
	callback::on_spawned(&on_player_spawned);
	weaponobjects::function_e6400478(#"gadget_supplypod", &function_f579e72b, 1);
}

/*
	Name: on_player_spawned
	Namespace: supplypod
	Checksum: 0x6426EF70
	Offset: 0x1478
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	player = self;
	player.var_2383a10c = [];
	self function_46d74bb7(0);
	changedteam = isdefined(player.var_29fdd9dd) && player.team != player.var_29fdd9dd;
	if((isdefined(player.var_228b6835) ? player.var_228b6835 : 0) || changedteam || (isdefined(level.var_934fb97.bundle.var_18ede0bb) ? level.var_934fb97.bundle.var_18ede0bb : 0))
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
	Checksum: 0x2A937023
	Offset: 0x1648
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
	Name: supplypod_on
	Namespace: supplypod
	Checksum: 0x70434E47
	Offset: 0x18E8
	Size: 0x66
	Parameters: 2
	Flags: Linked
*/
function supplypod_on(slot, playerweapon)
{
	/#
		assert(isplayer(self));
	#/
	self notify(#"start_killstreak", {#weapon:playerweapon});
}

/*
	Name: supplypod_off
	Namespace: supplypod
	Checksum: 0x5D3BAA24
	Offset: 0x1958
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function supplypod_off(slot, weapon)
{
}

/*
	Name: getobjectiveid
	Namespace: supplypod
	Checksum: 0x600763F3
	Offset: 0x1978
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
	Checksum: 0x85FE42E9
	Offset: 0x1998
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
	Checksum: 0xE6998D94
	Offset: 0x19E8
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
	Checksum: 0xF8E7B26B
	Offset: 0x1AC0
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
	level.var_934fb97.supplypods[self.objectiveid] = undefined;
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
	Checksum: 0xA38B0924
	Offset: 0x1CE0
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
	self notify(#"supplypod_removed");
	self deletedelay();
}

/*
	Name: function_5761966a
	Namespace: supplypod
	Checksum: 0xCC250194
	Offset: 0x20E8
	Size: 0x158
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5761966a(supplypod)
{
	player = self;
	player endon(#"disconnect");
	level endon(#"game_ended");
	supplypod endon(#"supplypod_removed");
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
	Checksum: 0x48E5FC58
	Offset: 0x2248
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
	Checksum: 0xA7614F8E
	Offset: 0x2298
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
	Checksum: 0x6BB1B12D
	Offset: 0x2430
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
	Checksum: 0x6DCC2143
	Offset: 0x26C0
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
	Checksum: 0x84E4F81D
	Offset: 0x27D8
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function function_438ca4e0()
{
	supplypod = self;
	supplypod endon(#"supplypod_removed", #"death");
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
	Checksum: 0xF796724A
	Offset: 0x2878
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
	Checksum: 0x8A70346D
	Offset: 0x28B8
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
	level.var_934fb97.supplypods[supplypod.objectiveid] = supplypod;
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
	Checksum: 0x418C775E
	Offset: 0x3340
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
	Checksum: 0xDDCF98AF
	Offset: 0x3358
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
	Checksum: 0x3210D5CB
	Offset: 0x3378
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
				supplypod.owner contracts::increment_contract(#"hash_67f98344b931e7ff");
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
	Checksum: 0xB6E583D4
	Offset: 0x3848
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
	Checksum: 0x3E3E13DA
	Offset: 0x3878
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
	Checksum: 0x34849ABC
	Offset: 0x39B0
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
	Checksum: 0x9788FEB8
	Offset: 0x3BE0
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
	Checksum: 0xBA2BFA9F
	Offset: 0x3CA0
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
	Checksum: 0xAC32CD3C
	Offset: 0x3D38
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
	Checksum: 0xC023C2A5
	Offset: 0x3DF8
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
	Checksum: 0x9DC7C97A
	Offset: 0x3F98
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
	Checksum: 0x25F29281
	Offset: 0x40F8
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
		bonusammo = (isdefined(getgametypesetting(#"hash_1441f7ad44e1cfd4")) ? getgametypesetting(#"hash_1441f7ad44e1cfd4") : 0) * weapon.clipsize;
		player setweaponammostock(weapon, int(var_831b3584 + bonusammo));
	}
	player function_3ea286();
}

/*
	Name: function_b8a25634
	Namespace: supplypod
	Checksum: 0x8D5FE8C3
	Offset: 0x4260
	Size: 0x18C
	Parameters: 1
	Flags: None
*/
function function_b8a25634(owner)
{
	player = self;
	cooldowns[0] = level.var_934fb97.bundle.var_b9443d6b;
	cooldowns[1] = level.var_934fb97.bundle.var_ea340924;
	cooldowns[2] = level.var_934fb97.bundle.var_ff3d4d40;
	for(slot = 0; slot < 3; slot++)
	{
		if(!isdefined(cooldowns[slot]))
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
	Checksum: 0x7F0F17C9
	Offset: 0x43F8
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

