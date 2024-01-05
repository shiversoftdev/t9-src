#using scripts\zm_common\zm_power.gsc;
#using script_3ddf84b7bb3bf47d;
#using scripts\zm_common\zm_weapons.gsc;
#using script_18077945bb84ede7;
#using scripts\zm_common\zm_utility.gsc;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using script_4108035fe400ce67;
#using scripts\core_common\armor.gsc;
#using script_5fb26eef020f9958;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using script_471b31bd963b388e;
#using script_340a2e805e35f7a2;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using script_7d7ac1f663edcdc8;
#using script_3751b21462a54a7d;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\struct.gsc;

#namespace namespace_dd7e54e3;

/*
	Name: function_9641b07b
	Namespace: namespace_dd7e54e3
	Checksum: 0xA3AADF58
	Offset: 0x290
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9641b07b()
{
	level notify(-220600650);
}

/*
	Name: __init__system__
	Namespace: namespace_dd7e54e3
	Checksum: 0xD46EBE48
	Offset: 0x2B0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7da9887a9375293", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_dd7e54e3
	Checksum: 0x3CFFCF2D
	Offset: 0x308
	Size: 0x1EC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_2a994cc0 = sr_armor_menu::register();
	level.var_ade77b07 = array(#"hash_6c055e078965b4e3", #"hash_35675bbd363f934a", #"hash_7777b2b5970da847", #"hash_7bc70addda19ca00");
	level.var_3a2e321c = array(250, 500, 1000, 250);
	level.weaponrarities = array(#"hash_1bce1d027595650f", #"green", #"blue", #"purple", #"orange");
	level.var_9d209b60 = array(250, 500, 1000, 500, 1000);
	level.var_1b95a5be = array(0, 0, 0, 1, 1);
	namespace_52c8f34d::function_70a657d8();
	callback::on_spawned(&function_ef39f61b);
	callback::on_item_pickup(&on_item_pickup);
	clientfield::register("scriptmover", "" + #"hash_7dfc37315a4eff0", 1, 1, "int");
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_dd7e54e3
	Checksum: 0xF68E97D8
	Offset: 0x500
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	var_f5ae494f = struct::get_array(#"hash_313be7fccc870cdd", "variantname");
	if(zm_utility::is_classic() || zm_utility::function_c4b020f8() && isdefined(var_f5ae494f) && var_f5ae494f.size > 0)
	{
		level thread function_68649d54(var_f5ae494f[0]);
	}
}

/*
	Name: function_1cbc3614
	Namespace: namespace_dd7e54e3
	Checksum: 0x3A80FDD2
	Offset: 0x5A8
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function function_1cbc3614(var_beee4994)
{
	foreach(struct in var_beee4994)
	{
		function_93a99046(struct);
	}
}

/*
	Name: function_93a99046
	Namespace: namespace_dd7e54e3
	Checksum: 0xF7F84135
	Offset: 0x640
	Size: 0x354
	Parameters: 1
	Flags: Linked
*/
function function_93a99046(struct)
{
	/#
		assert(isstruct(struct), "");
	#/
	if(zm_utility::is_survival())
	{
		model = #"hash_6847db4bdfca2dc8";
		var_c6d25878 = &zm_utility::function_f5a222a8;
	}
	else
	{
		model = #"p9_fxanim_zm_gp_armor_station_xmodel";
		var_c6d25878 = &zm_utility::function_4a4cf79a;
	}
	scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, model, 1);
	zm_utility::function_ca960904(scriptmodel);
	if(struct.parent.content_script_name !== #"safehouse")
	{
		objid = [[var_c6d25878]](#"hash_25a19901af9e8467", scriptmodel);
		struct.objectiveid = objid;
		scriptmodel.objectiveid = objid;
	}
	forward = anglestoforward(scriptmodel.angles);
	forward = vectornormalize(forward);
	offset = forward * 24;
	offset = (offset[0], offset[1], offset[2] + 50);
	if(scriptmodel.script_noteworthy === "power")
	{
		trigger = namespace_8b6a9d79::function_214737c7(struct, &function_fe5f8894, #"hash_71158766520dc432", undefined, 64, 128, undefined, offset);
		scriptmodel.var_49d94d8a = &function_38ac8b73;
		scriptmodel.var_7cf0a191 = &function_e255b251;
		scriptmodel thread zm_power::function_da4a8c05(#"hash_614130df578d98f0", struct.script_int);
	}
	else
	{
		trigger = namespace_8b6a9d79::function_214737c7(struct, &function_fe5f8894, #"hash_614130df578d98f0", undefined, 64, 128, undefined, offset);
		scriptmodel function_38ac8b73();
	}
	trigger.scriptmodel = scriptmodel;
	scriptmodel.trigger = trigger;
	if(zm_utility::is_survival())
	{
		level thread zm_utility::clear_vehicles(scriptmodel);
	}
	scriptmodel clientfield::set("item_machine_spawn_rob", 1);
	playfx("sr/fx9_safehouse_mchn_upgrades_spawn", struct.origin);
}

/*
	Name: function_38ac8b73
	Namespace: namespace_dd7e54e3
	Checksum: 0x3A25AF8A
	Offset: 0x9A0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function function_38ac8b73()
{
	if(!self flag::get(#"first_power_on"))
	{
		self flag::set(#"first_power_on");
		self thread scene::play("p9_fxanim_zm_gp_armor_station_bundle", "Shot 1", self);
	}
	self clientfield::set("" + #"hash_7dfc37315a4eff0", 1);
}

/*
	Name: function_e255b251
	Namespace: namespace_dd7e54e3
	Checksum: 0xF2DCDDC2
	Offset: 0xA48
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_e255b251()
{
	self clientfield::set("" + #"hash_7dfc37315a4eff0", 0);
}

/*
	Name: function_fe5f8894
	Namespace: namespace_dd7e54e3
	Checksum: 0x3C5F14A4
	Offset: 0xA80
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_fe5f8894(eventstruct)
{
	player = eventstruct.activator;
	machine = self.scriptmodel;
	/#
		assert(isdefined(machine), "");
	#/
	if(isplayer(player))
	{
		if(!level.var_2a994cc0 sr_armor_menu::is_open(player) && !player clientfield::get_player_uimodel("hudItems.srOverlayOpen") && machine.script_noteworthy !== "power")
		{
			player notify(#"hash_5f178db4550eeae9");
			level.var_2a994cc0 sr_armor_menu::open(player, 0);
			player thread function_cb2d9b9b(machine, self);
			player namespace_553954de::function_14bada94();
		}
	}
}

/*
	Name: function_6c71e778
	Namespace: namespace_dd7e54e3
	Checksum: 0xD4A5E6FE
	Offset: 0xBC0
	Size: 0x1B6
	Parameters: 2
	Flags: Linked
*/
function function_6c71e778(machine, trigger)
{
	if(!isplayer(self) || !isdefined(level.var_2a994cc0))
	{
		return;
	}
	self val::reset(#"hash_55af237178580523", "disable_weapons");
	if(isdefined(machine) && isdefined(trigger))
	{
		str_hint = #"hash_614130df578d98f0";
		if(machine.script_noteworthy === "power")
		{
			str_hint = #"hash_71158766520dc432";
		}
		trigger sethintstringforplayer(self, str_hint);
		if(isdefined(machine.objectiveid))
		{
			objective_setvisibletoplayer(machine.objectiveid, self);
			zm_utility::function_e8f4d47b(self, machine.objectiveid, 0);
		}
	}
	if(level.var_2a994cc0 sr_armor_menu::is_open(self) && self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
	{
		level.var_2a994cc0 sr_armor_menu::close(self);
		self namespace_553954de::function_548f282();
	}
	self notify(#"hash_5e4c1bf6d3ef5df0");
}

/*
	Name: function_ef39f61b
	Namespace: namespace_dd7e54e3
	Checksum: 0xCECB0FFE
	Offset: 0xD80
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_ef39f61b()
{
	level endon(#"game_ended");
	self endon(#"disconnect");
	while(true)
	{
		if((isdefined(self.armortier) ? self.armortier : 0) != 0 && self.maxarmor != 0)
		{
			self clientfield::set_player_uimodel("hudItems.armorPercent", self.armor / self.maxarmor);
		}
		waitframe(1);
	}
}

/*
	Name: function_620db6a4
	Namespace: namespace_dd7e54e3
	Checksum: 0x44226E6F
	Offset: 0xE28
	Size: 0x194
	Parameters: 2
	Flags: Linked
*/
function function_620db6a4(machine, trigger)
{
	self endon(#"disconnect", #"death", #"hash_5e4c1bf6d3ef5df0");
	var_f9c2bece = distance2d(machine.origin, self.origin);
	start_origin = self.origin;
	while(distance2d(machine.origin, self.origin) <= var_f9c2bece || distance2d(self.origin, start_origin) < 32 && !self laststand::player_is_in_laststand() && !self isinvehicle() && machine.script_noteworthy !== "power")
	{
		waitframe(1);
		if(!isdefined(machine))
		{
			break;
		}
	}
	if(level.var_2a994cc0 sr_armor_menu::is_open(self) && self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
	{
		self function_6c71e778(machine, trigger);
	}
}

/*
	Name: function_137f88c6
	Namespace: namespace_dd7e54e3
	Checksum: 0xC4FF984D
	Offset: 0xFC8
	Size: 0x12E
	Parameters: 1
	Flags: Linked
*/
function function_137f88c6(var_a0abda6)
{
	if(!isdefined(var_a0abda6))
	{
		var_a0abda6 = #"resource";
	}
	rarity = #"white";
	switch(var_a0abda6)
	{
		case "resource":
		case "loadout":
		{
			rarity = #"white";
			break;
		}
		case "uncommon":
		{
			rarity = #"green";
			break;
		}
		case "rare":
		{
			rarity = #"blue";
			break;
		}
		case "epic":
		{
			rarity = #"purple";
			break;
		}
		case "legendary":
		{
			rarity = #"orange";
			break;
		}
	}
	return rarity;
}

/*
	Name: function_44368952
	Namespace: namespace_dd7e54e3
	Checksum: 0xD4F36A5D
	Offset: 0x1100
	Size: 0x17A
	Parameters: 2
	Flags: Linked
*/
function function_44368952(weapon, rarity)
{
	if(!isdefined(rarity))
	{
		rarity = #"white";
	}
	switch(rarity)
	{
		case "resource":
		case "loadout":
		{
			rarity = #"white";
			break;
		}
		case "uncommon":
		{
			rarity = #"green";
			break;
		}
		case "rare":
		{
			rarity = #"blue";
			break;
		}
		case "epic":
		{
			rarity = #"purple";
			break;
		}
		case "legendary":
		{
			rarity = #"orange";
			break;
		}
	}
	if(zm_weapons::is_weapon_upgraded(weapon))
	{
		weapon = zm_weapons::get_base_weapon(weapon);
	}
	weapon_name = weapon.name;
	item_name = level.var_29d88fe5[weapon_name][rarity];
	return item_name;
}

/*
	Name: function_1490abe2
	Namespace: namespace_dd7e54e3
	Checksum: 0xC5932E5
	Offset: 0x1288
	Size: 0x106
	Parameters: 1
	Flags: Linked
*/
function function_1490abe2(weapon)
{
	var_78c4a705 = getweapon(#"bare_hands");
	if(!isdefined(weapon.name))
	{
		return false;
	}
	if(killstreaks::is_killstreak_weapon(weapon))
	{
		return false;
	}
	if(zm_weapons::is_wonder_weapon(weapon))
	{
		return false;
	}
	if(weapon == level.weaponnone || weapon == var_78c4a705)
	{
		return false;
	}
	switch(weapon.name)
	{
		case "ray_gun_mk2":
		case "ray_gun_upgraded":
		case "ray_gun":
		case "ray_gun_mk2_upgraded":
		{
			return false;
			break;
		}
	}
	return true;
}

/*
	Name: function_5aad4a79
	Namespace: namespace_dd7e54e3
	Checksum: 0xD552B3AE
	Offset: 0x1398
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function function_5aad4a79()
{
	if(!is_true(getgametypesetting(#"hash_48d605c9ac0d9395")))
	{
		return false;
	}
	return true;
}

/*
	Name: function_cb2d9b9b
	Namespace: namespace_dd7e54e3
	Checksum: 0x5C1361EC
	Offset: 0x13E0
	Size: 0xA9E
	Parameters: 2
	Flags: Linked
*/
function function_cb2d9b9b(machine, trigger)
{
	self endon(#"hash_5f178db4550eeae9");
	trigger sethintstringforplayer(self, "");
	if(isdefined(machine.objectiveid))
	{
		zm_utility::function_e8f4d47b(self, machine.objectiveid, 1);
		objective_setinvisibletoplayer(machine.objectiveid, self);
	}
	self endoncallback(&function_6c71e778, #"death");
	self thread function_620db6a4(machine, trigger);
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		intpayload = waitresult.intpayload;
		if(menu == #"sr_armor_menu")
		{
			weapon = self getcurrentweapon();
			item = item_inventory::function_230ceec4(weapon);
			switch(waitresult.response)
			{
				case "hash_1028a1675bc987fe":
				{
					var_1a988176 = level.var_ade77b07[intpayload];
					var_1d1d4a2a = level.var_3a2e321c[intpayload];
					if(var_1a988176 == #"hash_7bc70addda19ca00")
					{
						has_enough = self sr_scrap::function_415b1e(var_1d1d4a2a);
					}
					else
					{
						has_enough = self sr_scrap::function_c29a8aa1(var_1d1d4a2a);
					}
					if(has_enough && isdefined(var_1a988176) && isdefined(var_1d1d4a2a))
					{
						if(function_5aad4a79())
						{
							self playlocalsound(#"hash_500cfba1d8f28c89");
							if(var_1a988176 == #"hash_6c055e078965b4e3")
							{
								self.armor = self.maxarmor;
							}
							else
							{
								self give_armor(var_1a988176);
							}
							self playrumbleonentity(#"zm_interact_rumble");
							machine scene::stop("p9_fxanim_zm_gp_armor_station_bundle");
							machine animation::stop();
							waitframe(1);
							machine thread scene::play("p9_fxanim_zm_gp_armor_station_bundle", "Shot 2", machine);
							if(var_1a988176 == #"hash_7bc70addda19ca00")
							{
								self sr_scrap::function_8bfa3267(var_1d1d4a2a);
							}
							else
							{
								self sr_scrap::function_3610299b(var_1d1d4a2a);
							}
						}
						else
						{
							machine playsoundtoplayer(#"uin_default_action_denied", self);
						}
					}
					else
					{
						machine playsoundtoplayer(#"uin_default_action_denied", self);
					}
					break;
				}
				case "hash_652072d835f5b0fa":
				{
					if(!function_1490abe2(weapon) || self isswitchingweapons())
					{
						machine playsoundtoplayer(#"uin_default_action_denied", self);
					}
					else
					{
						var_35d31714 = level.weaponrarities[intpayload];
						var_9b05d455 = level.var_9d209b60[intpayload];
						var_372067dc = level.var_1b95a5be[intpayload];
						if(isdefined(var_35d31714) && isdefined(var_9b05d455))
						{
							if(var_35d31714 === #"hash_1bce1d027595650f")
							{
								if(weapon.weapclass === "melee" || weapon.weapclass === "rocketlauncher" || weapon.weapclass === "grenade")
								{
									machine playsoundtoplayer(#"uin_default_action_denied", self);
								}
								else
								{
									item_weapon = function_44368952(weapon, item.var_a6762160.rarity);
									var_79770f09 = function_137f88c6(item.var_a6762160.rarity);
									has_enough = self sr_scrap::function_c29a8aa1(250);
									if(has_enough)
									{
										currentweapon = self getcurrentweapon();
										clipsize = self getweaponammoclip(currentweapon);
										var_9839b3b1 = self getweaponammostock(currentweapon);
										if(is_true(currentweapon.isdualwield) && isdefined(currentweapon.dualwieldweapon) && currentweapon.dualwieldweapon != level.weaponnone)
										{
											var_7fa2b50b = self getweaponammoclip(currentweapon.dualwieldweapon);
										}
										weaponoptions = self function_ade49959(currentweapon);
										self zm_weapons::function_8fdfe5e4(weapon, item, item_weapon, var_79770f09, clipsize, var_9839b3b1, var_7fa2b50b);
										if(isplayer(self))
										{
											currentweapon = self getcurrentweapon();
											if(isdefined(item.var_a8bccf69))
											{
												self item_inventory::function_d92c6b5b(currentweapon, undefined, item.var_a8bccf69);
											}
											self playrumbleonentity(#"zm_interact_rumble");
											machine scene::stop("p9_fxanim_zm_gp_armor_station_bundle");
											machine animation::stop();
											waitframe(1);
											machine thread scene::play("p9_fxanim_zm_gp_armor_station_bundle", "Shot 3", machine);
											self sr_scrap::function_3610299b(250);
										}
									}
									else
									{
										machine playsoundtoplayer(#"uin_default_action_denied", self);
									}
								}
							}
							else
							{
								if(var_372067dc)
								{
									has_enough = self sr_scrap::function_415b1e(var_9b05d455);
								}
								else
								{
									has_enough = self sr_scrap::function_c29a8aa1(var_9b05d455);
								}
								if(has_enough)
								{
									self playrumbleonentity(#"zm_interact_rumble");
									currentweapon = self getcurrentweapon();
									clipsize = self getweaponammoclip(currentweapon);
									var_9839b3b1 = self getweaponammostock(currentweapon);
									if(is_true(currentweapon.isdualwield) && isdefined(currentweapon.dualwieldweapon) && currentweapon.dualwieldweapon != level.weaponnone)
									{
										var_7fa2b50b = self getweaponammoclip(currentweapon.dualwieldweapon);
									}
									self zm_weapons::function_17e9ed37(var_35d31714, clipsize, var_9839b3b1, var_7fa2b50b);
									if(isplayer(self))
									{
										machine scene::stop("p9_fxanim_zm_gp_armor_station_bundle");
										machine animation::stop();
										waitframe(1);
										machine thread scene::play("p9_fxanim_zm_gp_armor_station_bundle", "Shot 3", machine);
										if(var_372067dc)
										{
											self sr_scrap::function_8bfa3267(var_9b05d455);
										}
										else
										{
											self sr_scrap::function_3610299b(var_9b05d455);
										}
									}
								}
								else
								{
									machine playsoundtoplayer(#"uin_default_action_denied", self);
								}
							}
						}
						else
						{
							machine playsoundtoplayer(#"uin_default_action_denied", self);
						}
					}
					break;
				}
				case "hash_383c519d3bdac984":
				{
					self notify(#"hash_5e4c1bf6d3ef5df0");
					self function_6c71e778(machine, trigger);
					return;
				}
			}
		}
	}
}

/*
	Name: function_f3ce6afc
	Namespace: namespace_dd7e54e3
	Checksum: 0x9256633
	Offset: 0x1E88
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_f3ce6afc(var_cc87b623)
{
	if(isplayer(self))
	{
		var_bb1797ae = {#hash_500db157:zm_utility::function_e3025ca5(), #hash_159283d5:zm_utility::get_round_number(), #hash_7d003586:function_f8d53445(), #hash_7ebcde3b:hash(var_cc87b623)};
		self function_678f57c8(#"hash_653ddf74d3ce14d0", var_bb1797ae);
	}
}

/*
	Name: on_item_pickup
	Namespace: namespace_dd7e54e3
	Checksum: 0xA2BB456F
	Offset: 0x1F78
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private on_item_pickup(params)
{
	var_abf29e5c = params.item.var_a6762160.name;
	if(isplayer(self) && isdefined(var_abf29e5c) && (isinarray(level.var_ade77b07, hash(var_abf29e5c)) || var_abf29e5c === #"hash_fb02b41b0d01f39"))
	{
		self function_f3ce6afc(var_abf29e5c);
	}
}

/*
	Name: give_armor
	Namespace: namespace_dd7e54e3
	Checksum: 0xBD5E938B
	Offset: 0x2038
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function give_armor(var_cc87b623)
{
	point = function_4ba8fde(var_cc87b623);
	if(isdefined(point) && isdefined(point.var_a6762160))
	{
		self function_b2f69241();
		var_fa3df96 = self item_inventory::function_e66dcff5(point);
		self item_inventory::give_inventory_item(point, 1, point.var_a6762160.amount, var_fa3df96);
		self item_inventory::equip_armor(point);
		self function_f3ce6afc(var_cc87b623);
	}
	self.armor = self.maxarmor;
}

/*
	Name: function_b2f69241
	Namespace: namespace_dd7e54e3
	Checksum: 0xD1B455E5
	Offset: 0x2130
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_b2f69241()
{
	var_416640e8 = self.inventory.items[6];
	if(var_416640e8.var_bd027dd9 != 32767)
	{
		var_4d7e11d8 = self item_inventory::drop_inventory_item(var_416640e8.var_bd027dd9);
		if(isdefined(var_4d7e11d8))
		{
			var_4d7e11d8 delete();
		}
	}
}

/*
	Name: function_68649d54
	Namespace: namespace_dd7e54e3
	Checksum: 0xAD4272F4
	Offset: 0x21B8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_68649d54(destination)
{
	level flag::wait_till("start_zombie_round_logic");
	waittillframeend();
	function_85834b2c(destination);
}

/*
	Name: function_85834b2c
	Namespace: namespace_dd7e54e3
	Checksum: 0xBCABEA88
	Offset: 0x2208
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_85834b2c(destination)
{
	foreach(location in destination.locations)
	{
		var_55a59069 = location.instances[#"hash_629e563c2ebf707a"];
		if(isdefined(var_55a59069))
		{
			children = namespace_8b6a9d79::function_f703a5a(var_55a59069);
			foreach(child in children)
			{
				function_93a99046(child);
			}
		}
	}
}

