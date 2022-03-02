#using script_18077945bb84ede7;
#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_256b8879317373de;
#using script_340a2e805e35f7a2;
#using script_3751b21462a54a7d;
#using script_3ddf84b7bb3bf47d;
#using script_4108035fe400ce67;
#using script_471b31bd963b388e;
#using script_5fb26eef020f9958;
#using script_68d2ee1489345a1d;
#using script_7bacb32f8222fa3e;
#using script_7d7ac1f663edcdc8;
#using script_7fc996fe8678852;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_dd7e54e3;

/*
	Name: function_89f2df9
	Namespace: namespace_dd7e54e3
	Checksum: 0x2C28D329
	Offset: 0x288
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7da9887a9375293", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_dd7e54e3
	Checksum: 0xCD97F900
	Offset: 0x2E0
	Size: 0x1DC
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
	clientfield::register("scriptmover", "armor_machine_fx", 1, 1, "int");
	namespace_52c8f34d::function_70a657d8();
	callback::on_spawned(&function_ef39f61b);
	callback::function_10a4dd0a(&function_10a4dd0a);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_dd7e54e3
	Checksum: 0x7A62F60F
	Offset: 0x4C8
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
	Checksum: 0xBA743B74
	Offset: 0x570
	Size: 0x90
	Parameters: 1
	Flags: None
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
	Checksum: 0x53D442AF
	Offset: 0x608
	Size: 0x2CC
	Parameters: 1
	Flags: Linked
*/
function function_93a99046(struct)
{
	/#
		assert(isstruct(struct), "");
	#/
	scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, #"p9_fxanim_zm_gp_armor_station_xmodel", 1);
	zm_utility::function_ca960904(scriptmodel);
	objid = zm_utility::function_4a4cf79a(#"hash_25a19901af9e8467", scriptmodel);
	struct.objectiveid = objid;
	scriptmodel.objectiveid = objid;
	if(!isdefined(level.var_6bf8ee58))
	{
		level.var_6bf8ee58 = [];
	}
	else if(!isarray(level.var_6bf8ee58))
	{
		level.var_6bf8ee58 = array(level.var_6bf8ee58);
	}
	level.var_6bf8ee58[level.var_6bf8ee58.size] = objid;
	if(scriptmodel.script_noteworthy === "power")
	{
		trigger = namespace_8b6a9d79::function_214737c7(struct, &function_fe5f8894, #"hash_71158766520dc432", undefined, 128, 128, undefined, vectorscale((0, 0, 1), 50));
		scriptmodel.var_49d94d8a = &function_38ac8b73;
		scriptmodel thread zm_power::wait_for_power(#"hash_614130df578d98f0");
	}
	else
	{
		trigger = namespace_8b6a9d79::function_214737c7(struct, &function_fe5f8894, #"hash_614130df578d98f0", undefined, 128, 128, undefined, vectorscale((0, 0, 1), 50));
		scriptmodel function_38ac8b73();
	}
	trigger.scriptmodel = scriptmodel;
	scriptmodel.trigger = trigger;
	scriptmodel clientfield::set("item_machine_spawn_rob", 1);
	playfx("sr/fx9_safehouse_mchn_upgrades_spawn", struct.origin);
	playsoundatposition(#"hash_5c2fc4437449ddb4", struct.origin);
}

/*
	Name: function_38ac8b73
	Namespace: namespace_dd7e54e3
	Checksum: 0x5270276E
	Offset: 0x8E0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_38ac8b73()
{
	self thread scene::play("p9_fxanim_zm_gp_armor_station_bundle", "Shot 1", self);
	self clientfield::set("armor_machine_fx", 1);
}

/*
	Name: function_fe5f8894
	Namespace: namespace_dd7e54e3
	Checksum: 0x9724A1D9
	Offset: 0x938
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
	Checksum: 0xA64CC596
	Offset: 0xA78
	Size: 0x156
	Parameters: 2
	Flags: Linked
*/
function function_6c71e778(machine, trigger)
{
	if(!isplayer(self) || !isdefined(level.var_2a994cc0))
	{
		return;
	}
	if(isdefined(machine) && isdefined(trigger))
	{
		trigger sethintstringforplayer(self, #"hash_614130df578d98f0");
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
	Checksum: 0x3AA62933
	Offset: 0xBD8
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
	Checksum: 0x223BA5B2
	Offset: 0xC80
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function function_620db6a4(machine, trigger)
{
	self endon(#"disconnect", #"death", #"hash_5e4c1bf6d3ef5df0");
	start_origin = self.origin;
	while(distance2d(self.origin, start_origin) < 32 && !self laststand::player_is_in_laststand() && !self isinvehicle())
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
	Checksum: 0x7BE8052C
	Offset: 0xDB0
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
	Checksum: 0xA3097CA4
	Offset: 0xEE8
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
	Checksum: 0x5E661725
	Offset: 0x1070
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
	Checksum: 0x860888FF
	Offset: 0x1180
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
	Checksum: 0x353A56EE
	Offset: 0x11C8
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
			item = namespace_b376ff3f::function_230ceec4(weapon);
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
							self playrumbleonentity(#"hash_410bd55524ae7d");
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
									var_af76aeca = function_44368952(weapon, item.var_a6762160.rarity);
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
										self zm_weapons::function_8fdfe5e4(weapon, item, var_af76aeca, var_79770f09, clipsize, var_9839b3b1, var_7fa2b50b);
										if(isplayer(self))
										{
											currentweapon = self getcurrentweapon();
											if(isdefined(item.var_a8bccf69))
											{
												self namespace_b376ff3f::function_d92c6b5b(currentweapon, undefined, item.var_a8bccf69);
											}
											self playrumbleonentity(#"hash_410bd55524ae7d");
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
									self playrumbleonentity(#"hash_410bd55524ae7d");
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
	Checksum: 0xFCA303E0
	Offset: 0x1C70
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
	Name: function_10a4dd0a
	Namespace: namespace_dd7e54e3
	Checksum: 0x377595C5
	Offset: 0x1D60
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_10a4dd0a(params)
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
	Checksum: 0x3960C0F2
	Offset: 0x1E20
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
		var_fa3df96 = self namespace_b376ff3f::function_e66dcff5(point);
		self namespace_b376ff3f::function_e274f1fe(point, 1, point.var_a6762160.amount, var_fa3df96);
		self namespace_b376ff3f::equip_armor(point);
		self function_f3ce6afc(var_cc87b623);
	}
	self.armor = self.maxarmor;
}

/*
	Name: function_b2f69241
	Namespace: namespace_dd7e54e3
	Checksum: 0x94442100
	Offset: 0x1F18
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_b2f69241()
{
	var_416640e8 = self.inventory.items[6];
	if(var_416640e8.var_bd027dd9 != 32767)
	{
		var_4d7e11d8 = self namespace_b376ff3f::function_418f9eb8(var_416640e8.var_bd027dd9);
		if(isdefined(var_4d7e11d8))
		{
			var_4d7e11d8 delete();
		}
	}
}

/*
	Name: function_68649d54
	Namespace: namespace_dd7e54e3
	Checksum: 0x9771947C
	Offset: 0x1FA0
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
	Checksum: 0x83705126
	Offset: 0x1FF0
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

