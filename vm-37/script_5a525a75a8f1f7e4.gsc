#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\core_common\struct.gsc;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_c09ae6c3;

/*
	Name: __init__system__
	Namespace: namespace_c09ae6c3
	Checksum: 0xECA601DE
	Offset: 0x178
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_50d62958d724dac2", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_c09ae6c3
	Checksum: 0xA616EB8E
	Offset: 0x1D0
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	namespace_8b6a9d79::function_b3464a7c("ammo_cache", &function_9ed7339b);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_c09ae6c3
	Checksum: 0x46A20D5F
	Offset: 0x208
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	var_f5ae494f = struct::get_array(#"hash_313be7fccc870cdd", "variantname");
	if(!zm_utility::is_survival() && isdefined(var_f5ae494f) && var_f5ae494f.size > 0)
	{
		level thread init_ammo_cache(var_f5ae494f[0]);
	}
}

/*
	Name: function_9ed7339b
	Namespace: namespace_c09ae6c3
	Checksum: 0x54CA12F7
	Offset: 0x298
	Size: 0x2D0
	Parameters: 1
	Flags: Linked
*/
function function_9ed7339b(struct)
{
	/#
		assert(isstruct(struct), "");
	#/
	spawn_points = struct.var_fe2612fe[#"hash_6873efb1dfa0ebea"];
	foreach(point in spawn_points)
	{
		spawn_struct = point;
		scriptmodel = namespace_8b6a9d79::spawn_script_model(spawn_struct, #"hash_94b3a8b935248d0", 1);
		scriptmodel clientfield::set("set_compass_icon", 1);
		forward = anglestoforward(scriptmodel.angles);
		forward = vectornormalize(forward);
		forward = (forward[0] * 16, forward[1] * 16, forward[2] * 16);
		forward = (forward[0], forward[1], forward[2] + 48);
		trigger = namespace_8b6a9d79::function_214737c7(spawn_struct, &function_e4ff673, #"hash_47f37dccf2dfd164", 250, (isdefined(spawn_struct.radius) ? spawn_struct.radius : 80), (isdefined(spawn_struct.height) ? spawn_struct.height : 48), undefined, forward);
		trigger.scriptmodel = scriptmodel;
		trigger thread function_5eeaa168();
		scriptmodel.trigger = trigger;
		struct.trigger = trigger;
		struct.scriptmodel = scriptmodel;
		playfx(#"sr/fx9_safehouse_mchn_upgrades_spawn", struct.origin);
		playsoundatposition(#"hash_5c2fc4437449ddb4", struct.origin);
	}
}

/*
	Name: function_adb75323
	Namespace: namespace_c09ae6c3
	Checksum: 0xB6FB83B3
	Offset: 0x570
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_adb75323(item)
{
	cost = 250;
	if(isdefined(item))
	{
		if(isdefined(item.var_a8bccf69))
		{
			switch(item.var_a8bccf69)
			{
				case 1:
				{
					cost = 1000;
					break;
				}
				case 2:
				{
					cost = 2500;
					break;
				}
				case 3:
				{
					cost = 5000;
					break;
				}
			}
		}
		if(isdefined(item.var_a6762160.weapon) && zm_weapons::is_wonder_weapon(item.var_a6762160.weapon))
		{
			cost = 10000;
		}
	}
	return cost;
}

/*
	Name: function_baef2915
	Namespace: namespace_c09ae6c3
	Checksum: 0xBBCF9796
	Offset: 0x668
	Size: 0x148
	Parameters: 2
	Flags: Linked
*/
function function_baef2915(player, currentweapon)
{
	self setinvisibletoplayer(player);
	if(distancesquared(player.origin, self.origin) > sqr(160))
	{
		return false;
	}
	if(player zm_utility::is_drinking() || player zm_equipment::hacker_active())
	{
		return false;
	}
	if(player zm_utility::in_revive_trigger() || !player zm_laststand::laststand_has_players_weapons_returned())
	{
		return false;
	}
	if(zm_loadout::is_placeable_mine(currentweapon) || zm_equipment::is_equipment_that_blocks_purchase(currentweapon))
	{
		return false;
	}
	if(currentweapon.isgadget || currentweapon.isriotshield)
	{
		return false;
	}
	self setvisibletoplayer(player);
	return true;
}

/*
	Name: function_5eeaa168
	Namespace: namespace_c09ae6c3
	Checksum: 0x8E16220F
	Offset: 0x7B8
	Size: 0xA24
	Parameters: 0
	Flags: Linked
*/
function function_5eeaa168()
{
	level endon(#"game_ended");
	self endon(#"death");
	nullweapon = getweapon(#"none");
	var_f945fa92 = getweapon(#"bare_hands");
	while(true)
	{
		foreach(player in getplayers())
		{
			if(!isdefined(player.var_b8783de6))
			{
				player.var_b8783de6 = 0;
			}
			currentweapon = player getcurrentweapon();
			if(!self function_baef2915(player, currentweapon))
			{
				if(isdefined(player.var_d30f56e4) && player.var_d30f56e4 == self)
				{
					player.var_d30f56e4 = undefined;
					player globallogic::function_d96c031e();
				}
				continue;
			}
			var_1c7e95e9 = 0;
			player.var_d30f56e4 = self;
			weapon1 = player namespace_a0d533d1::function_2b83d3ff(player item_inventory::function_2e711614(17 + 1));
			weapon2 = player namespace_a0d533d1::function_2b83d3ff(player item_inventory::function_2e711614(((17 + 1) + 8) + 1));
			if(!isdefined(weapon1))
			{
				weapon1 = var_f945fa92;
			}
			if(!isdefined(weapon2))
			{
				weapon2 = var_f945fa92;
			}
			if(weapon1 == var_f945fa92 || weapon1 == nullweapon || weapon1.weapclass == "melee" && (weapon2 != var_f945fa92 && weapon2 != nullweapon && weapon2.weapclass != "melee") || (weapon2 == var_f945fa92 || weapon2 == nullweapon || weapon2.weapclass == "melee" && (weapon1 != var_f945fa92 && weapon1 != nullweapon && weapon1.weapclass != "melee")))
			{
				if(killstreaks::is_killstreak_weapon(currentweapon))
				{
					player.var_b8783de6 = 3;
					self sethintstringforplayer(player, #"hash_3f91b2cf51b00772");
				}
				else
				{
					if(weapon1 == var_f945fa92 || weapon1 == nullweapon || weapon1.weapclass == "melee" && (weapon2 != var_f945fa92 && weapon2 != nullweapon && weapon2.weapclass != "melee"))
					{
						item = player item_inventory::function_230ceec4(weapon2);
						cost = function_adb75323(item);
						if(player zm_score::can_player_purchase(cost) && !player function_f300168a(weapon2))
						{
							player.var_b8783de6 = 2;
							self sethintstringforplayer(player, #"hash_47f37dccf2dfd164", cost, weapon2.displayname);
						}
						else
						{
							if(player zm_score::can_player_purchase(cost) && player function_f300168a(weapon2))
							{
								player.var_b8783de6 = 3;
								self sethintstringforplayer(player, #"hash_36de8d628bb52fe9", weapon2.displayname);
							}
							else
							{
								player.var_b8783de6 = 3;
								var_1c7e95e9 = 1;
								self sethintstringforplayer(player, #"hash_56d6b70cf6595b1a", cost, weapon2.displayname);
							}
						}
					}
					else if(weapon2 == var_f945fa92 || weapon2 == nullweapon || weapon2.weapclass == "melee" && (weapon1 != var_f945fa92 && weapon1 != nullweapon && weapon1.weapclass != "melee"))
					{
						item = player item_inventory::function_230ceec4(weapon1);
						cost = function_adb75323(item);
						if(player zm_score::can_player_purchase(cost) && !player function_f300168a(weapon1))
						{
							player.var_b8783de6 = 1;
							self sethintstringforplayer(player, #"hash_47f37dccf2dfd164", cost, weapon1.displayname);
						}
						else
						{
							if(player zm_score::can_player_purchase(cost) && player function_f300168a(weapon1))
							{
								player.var_b8783de6 = 3;
								self sethintstringforplayer(player, #"hash_36de8d628bb52fe9", weapon1.displayname);
							}
							else
							{
								player.var_b8783de6 = 3;
								var_1c7e95e9 = 1;
								self sethintstringforplayer(player, #"hash_56d6b70cf6595b1a", cost, weapon1.displayname);
							}
						}
					}
				}
			}
			else
			{
				if(weapon1 != var_f945fa92 && weapon1 != nullweapon && weapon1.weapclass != "melee" && (weapon2 != var_f945fa92 && weapon2 != nullweapon && weapon2.weapclass != "melee"))
				{
					if(killstreaks::is_killstreak_weapon(currentweapon))
					{
						player.var_b8783de6 = 3;
						self sethintstringforplayer(player, #"hash_56425e74a921890d");
					}
					else
					{
						item = player item_inventory::function_230ceec4(currentweapon);
						cost = function_adb75323(item);
						if(player zm_score::can_player_purchase(cost) && !player function_f300168a(currentweapon))
						{
							player.var_b8783de6 = 0;
							self sethintstringforplayer(player, #"hash_47f37dccf2dfd164", cost, currentweapon.displayname);
						}
						else
						{
							if(player zm_score::can_player_purchase(cost) && player function_f300168a(currentweapon))
							{
								player.var_b8783de6 = 3;
								self sethintstringforplayer(player, #"hash_36de8d628bb52fe9", currentweapon.displayname);
							}
							else
							{
								player.var_b8783de6 = 3;
								var_1c7e95e9 = 1;
								self sethintstringforplayer(player, #"hash_56d6b70cf6595b1a", cost, currentweapon.displayname);
							}
						}
					}
				}
				else
				{
					player.var_b8783de6 = 3;
					self sethintstringforplayer(player, #"hash_56425e74a921890d");
				}
			}
			if(var_1c7e95e9)
			{
				if(self zm_utility::function_4f593819(player))
				{
					player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
				}
				else
				{
					player globallogic::function_d96c031e();
				}
				continue;
			}
			player globallogic::function_d96c031e();
		}
		wait(1);
	}
}

/*
	Name: function_ef9d58d0
	Namespace: namespace_c09ae6c3
	Checksum: 0xABEC1047
	Offset: 0x11E8
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function function_ef9d58d0(item)
{
	if(isdefined(item.var_a6762160.name))
	{
		switch(item.var_a6762160.name)
		{
			case "hash_c20bf6cb2f436fd":
			case "hash_f5896e310254300":
			case "hash_315d03848e9c8533":
			case "hash_3d6c85e60e7f64bf":
			case "hash_3dff7d94b9ae5c97":
			case "hash_4c696ce5b8b4e675":
			{
				return true;
				break;
			}
		}
	}
	return false;
}

/*
	Name: function_e4ff673
	Namespace: namespace_c09ae6c3
	Checksum: 0x3EA3906A
	Offset: 0x12A8
	Size: 0x2BA
	Parameters: 1
	Flags: Linked
*/
function function_e4ff673(eventstruct)
{
	player = eventstruct.activator;
	model = self.scriptmodel;
	/#
		assert(isdefined(model), "");
	#/
	if(isplayer(player))
	{
		nullweapon = getweapon(#"none");
		var_f945fa92 = getweapon(#"bare_hands");
		currentweapon = player getcurrentweapon();
		weapon1 = player namespace_a0d533d1::function_2b83d3ff(player item_inventory::function_2e711614(17 + 1));
		weapon2 = player namespace_a0d533d1::function_2b83d3ff(player item_inventory::function_2e711614(((17 + 1) + 8) + 1));
		if(!isdefined(weapon1))
		{
			weapon1 = var_f945fa92;
		}
		if(!isdefined(weapon2))
		{
			weapon2 = var_f945fa92;
		}
		if(isdefined(player.var_b8783de6))
		{
			switch(player.var_b8783de6)
			{
				case 3:
				{
					player playsoundtoplayer(#"zmb_no_cha_ching", player);
					return;
					break;
				}
				case 0:
				{
					self function_7c1cc13c(player, currentweapon, model);
					return;
					break;
				}
				case 1:
				{
					self function_7c1cc13c(player, weapon1, model);
					if(currentweapon == weapon2)
					{
						player switchtoweapon(weapon1);
					}
					return;
					break;
				}
				case 2:
				{
					self function_7c1cc13c(player, weapon2, model);
					if(currentweapon == weapon1)
					{
						player switchtoweapon(weapon2);
					}
					return;
					break;
				}
			}
		}
	}
}

/*
	Name: function_7c1cc13c
	Namespace: namespace_c09ae6c3
	Checksum: 0x2F69A36D
	Offset: 0x1570
	Size: 0x2BC
	Parameters: 3
	Flags: Linked
*/
function function_7c1cc13c(player, weapon, model)
{
	if(killstreaks::is_killstreak_weapon(weapon))
	{
		return;
	}
	item = player item_inventory::function_230ceec4(weapon);
	cost = function_adb75323(item);
	has_enough = player zm_score::can_player_purchase(cost);
	currentclip = player getweaponammoclip(weapon);
	maxammo = weapon.maxammo;
	var_53b14ebf = weapon.clipsize;
	player playrumbleonentity(#"zm_interact_rumble");
	if(currentclip < weapon.clipsize && (maxammo == 0 || is_true(weapon.cliponly)) && has_enough)
	{
		if(player hasweapon(weapon))
		{
			player setweaponammoclip(weapon, var_53b14ebf);
			player playsoundtoplayer(#"hash_3d571b980c703675", player);
			player zm_score::minus_to_player_score(cost);
		}
	}
	else
	{
		if(has_enough && !player function_f300168a(weapon))
		{
			if(player hasweapon(weapon))
			{
				player setweaponammoclip(weapon, var_53b14ebf);
				player setweaponammostock(weapon, maxammo);
				player playsoundtoplayer(#"hash_3d571b980c703675", player);
				player zm_score::minus_to_player_score(cost);
			}
		}
		else
		{
			player playsoundtoplayer(#"zmb_no_cha_ching", player);
		}
	}
	if(isdefined(model))
	{
		model thread scene::play("p9_usa_large_ammo_crate_01_bundle_zm", "open_close", model);
	}
}

/*
	Name: function_f300168a
	Namespace: namespace_c09ae6c3
	Checksum: 0xBF462466
	Offset: 0x1838
	Size: 0x10E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f300168a(weapon)
{
	var_e20637be = 1;
	nullweapon = getweapon(#"none");
	var_f945fa92 = getweapon(#"bare_hands");
	if(weapon != nullweapon && weapon != var_f945fa92)
	{
		maxammo = weapon.maxammo;
		var_53b14ebf = weapon.clipsize;
		currentammostock = self getweaponammostock(weapon);
		currentclipammo = self getweaponammoclip(weapon);
		if(currentammostock < maxammo || currentclipammo < var_53b14ebf)
		{
			var_e20637be = 0;
		}
	}
	return var_e20637be;
}

/*
	Name: init_ammo_cache
	Namespace: namespace_c09ae6c3
	Checksum: 0x34B89067
	Offset: 0x1950
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function init_ammo_cache(destination)
{
	level flag::wait_till("start_zombie_round_logic");
	waittillframeend();
	spawn_ammo_cache(destination);
}

/*
	Name: spawn_ammo_cache
	Namespace: namespace_c09ae6c3
	Checksum: 0xD3C379F6
	Offset: 0x19A0
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function spawn_ammo_cache(destination)
{
	foreach(location in destination.locations)
	{
		ammo_cache = location.instances[#"ammo_cache"];
		if(isdefined(ammo_cache))
		{
			namespace_8b6a9d79::function_20d7e9c7(ammo_cache);
		}
	}
}

