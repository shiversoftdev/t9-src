#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_3ddf84b7bb3bf47d;
#using script_5a8a1aa32dea1a04;
#using script_5bb072c3abf4652c;
#using script_68d2ee1489345a1d;
#using script_7d7ac1f663edcdc8;
#using script_7fc996fe8678852;
#using script_f11fc6f7a3ad5b9;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_4b9fccd8;

/*
	Name: function_89f2df9
	Namespace: namespace_4b9fccd8
	Checksum: 0x6FEFDF88
	Offset: 0x228
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_794c3bb2e36b3278", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_4b9fccd8
	Checksum: 0xA0F04D17
	Offset: 0x280
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_2457162c = sr_weapon_upgrade_menu::register();
	clientfield::register("scriptmover", "weapon_machine_fx", 1, 1, "int");
	weapon = getweapon(#"bare_hands");
	aat::register_aat_exemption(weapon);
	callback::on_spawned(&function_e3af0084);
	callback::on_connect(&on_connect);
	level.var_fee1eaaf = &function_be24d7ce;
	level.var_af0de66 = array(0, 5000, 15000, 30000);
	level function_a5ed2da0();
	namespace_52c8f34d::function_70a657d8();
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_4b9fccd8
	Checksum: 0xA02EE6A6
	Offset: 0x3C0
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
	var_f5ae494f = struct::get_array(#"hash_313be7fccc870cdd", "variantname");
	if(is_true(getgametypesetting(#"hash_19d48a0d4490b0a2")) && isdefined(var_f5ae494f) && var_f5ae494f.size > 0)
	{
		level thread function_329ecd95(var_f5ae494f[0]);
	}
}

/*
	Name: function_a5ed2da0
	Namespace: namespace_4b9fccd8
	Checksum: 0x6802FE
	Offset: 0x470
	Size: 0x308
	Parameters: 0
	Flags: Linked
*/
function function_a5ed2da0()
{
	level.var_dcd62c45 = [];
	var_a559259f = [];
	itemspawnlist = getscriptbundle(#"hash_dddaaa65c676e29");
	var_70f9bc79 = getscriptbundle(#"hash_2eb1f6fc96ab3345");
	foreach(item in var_70f9bc79.itemlist)
	{
		point = getscriptbundle(item.var_a6762160);
		if(isdefined(point.weapon))
		{
			parentweapon = point.weapon.name;
			if(isdefined(parentweapon) && isdefined(item.var_3f8c08e3))
			{
				var_a559259f[parentweapon] = item.var_3f8c08e3;
			}
		}
	}
	foreach(item in itemspawnlist.itemlist)
	{
		point = getscriptbundle(item.var_a6762160);
		if(isdefined(point.weapon))
		{
			parentweapon = point.weapon.name;
			if(isdefined(parentweapon) && (isdefined(var_a559259f[parentweapon]) && (isdefined(item.var_8261a18) && (isdefined(item.var_8261a18) && (isdefined(item.var_7b0c7fe3) && (isdefined(item.var_23a1d10f) && isdefined(item.var_168e36e8)))))))
			{
				level.var_dcd62c45[parentweapon] = [#"legendary":item.var_168e36e8, #"epic":item.var_23a1d10f, #"rare":item.var_7b0c7fe3, #"uncommon":item.var_8261a18, #"resource":item.var_3f8c08e3, #"loadout":var_a559259f[parentweapon]];
			}
		}
	}
}

/*
	Name: function_cb9d309b
	Namespace: namespace_4b9fccd8
	Checksum: 0xF49FDAEE
	Offset: 0x780
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function function_cb9d309b(var_beee4994)
{
	foreach(struct in var_beee4994)
	{
		function_e0069640(struct);
	}
}

/*
	Name: function_e0069640
	Namespace: namespace_4b9fccd8
	Checksum: 0x5D259D2B
	Offset: 0x818
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function function_e0069640(struct)
{
	/#
		assert(isstruct(struct), "");
	#/
	scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, #"p9_fxanim_zm_gp_pap_xmodel", 1);
	zm_utility::function_ca960904(scriptmodel);
	objid = zm_utility::function_4a4cf79a(#"hash_1fb6c7512b2e0e38", scriptmodel);
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
	trigger = namespace_8b6a9d79::function_214737c7(struct, &function_5b75a557, #"hash_2492283b9609c4a", undefined, 128, 128, undefined, vectorscale((0, 0, 1), 50));
	trigger.scriptmodel = scriptmodel;
	trigger thread function_395f9528();
	scriptmodel.trigger = trigger;
	scriptmodel clientfield::set("item_machine_spawn_rob", 1);
	playfx("sr/fx9_safehouse_mchn_wonderfizz_spawn", struct.origin);
	playsoundatposition(#"hash_5c2fc4437449ddb4", struct.origin);
}

/*
	Name: function_395f9528
	Namespace: namespace_4b9fccd8
	Checksum: 0xCC3C0EA8
	Offset: 0xA50
	Size: 0x138
	Parameters: 0
	Flags: Linked
*/
function function_395f9528()
{
	self endon(#"death");
	while(true)
	{
		self hide();
		level flag::wait_till_clear("disable_weapon_machine");
		self show();
		self.scriptmodel clientfield::set("weapon_machine_fx", 1);
		self.scriptmodel thread scene::play(#"hash_19d0f38dbaefcd65", "Shot 1", self.scriptmodel);
		level flag::wait_till("disable_weapon_machine");
		self.scriptmodel clientfield::set("weapon_machine_fx", 0);
		self.scriptmodel thread scene::stop(#"hash_19d0f38dbaefcd65");
	}
}

/*
	Name: function_5b75a557
	Namespace: namespace_4b9fccd8
	Checksum: 0x5037D65
	Offset: 0xB90
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_5b75a557(eventstruct)
{
	player = eventstruct.activator;
	machine = self.scriptmodel;
	/#
		assert(isdefined(machine), "");
	#/
	if(isplayer(player))
	{
		if(!level.var_2457162c sr_weapon_upgrade_menu::is_open(player) && !player clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
		{
			player notify(#"hash_5f178db4550eeae9");
			level.var_2457162c sr_weapon_upgrade_menu::open(player, 0);
			player thread function_4609e67c(machine, self);
			player namespace_553954de::function_14bada94();
		}
	}
}

/*
	Name: on_connect
	Namespace: namespace_4b9fccd8
	Checksum: 0xB150A7A8
	Offset: 0xCB8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private on_connect()
{
	callback::function_d8abfc3d(#"hash_75ec9942d2d5fd0f", &function_90017e84);
}

/*
	Name: function_90017e84
	Namespace: namespace_4b9fccd8
	Checksum: 0xC9FD008E
	Offset: 0xCF8
	Size: 0xEC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_90017e84(params)
{
	if(!isdefined(params.var_a8bccf69))
	{
		return;
	}
	switch(params.var_a8bccf69)
	{
		case 1:
		{
			var_ee3c60e = #"hash_2490c799564294c7";
			break;
		}
		case 2:
		{
			var_ee3c60e = #"hash_2490c8995642967a";
			break;
		}
		case 3:
		{
			var_ee3c60e = #"hash_2490c9995642982d";
			break;
		}
	}
	if(isdefined(var_ee3c60e))
	{
		level thread popups::displayteammessagetoteam(var_ee3c60e, self, self.team, params.var_ca3e1138);
	}
}

/*
	Name: function_e3af0084
	Namespace: namespace_4b9fccd8
	Checksum: 0xAC060403
	Offset: 0xDF0
	Size: 0x252
	Parameters: 0
	Flags: Linked
*/
function function_e3af0084()
{
	level endon(#"game_ended");
	self endon(#"disconnect");
	weapon = self getcurrentweapon();
	while(true)
	{
		var_bd027dd9 = namespace_b376ff3f::function_ec087745();
		if(var_bd027dd9 != 32767)
		{
			var_d2648452 = namespace_b376ff3f::function_dfcacdc2(var_bd027dd9);
			if(isdefined(var_d2648452.var_a8bccf69))
			{
				self clientfield::set_player_uimodel("pap_current", var_d2648452.var_a8bccf69);
			}
			else
			{
				self clientfield::set_player_uimodel("pap_current", 0);
			}
			if(!zm_weapons::is_wonder_weapon(weapon))
			{
				if(isdefined(var_d2648452.aat))
				{
					if(weapon.weapclass != "melee")
					{
						self function_bf3044dc(weapon, 1);
					}
				}
				else
				{
					self function_bf3044dc(weapon, 0);
				}
			}
		}
		else
		{
			self clientfield::set_player_uimodel("pap_current", 0);
		}
		self namespace_3e3637fc::function_ec7953fa();
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change", #"hash_4de2d5115dc310e2", #"hash_75ec9942d2d5fd0f", #"hash_5cd57762f792396b", #"hash_3713641b67661d30");
		weapon = (isdefined(waitresult.weapon) ? waitresult.weapon : self getcurrentweapon());
	}
}

/*
	Name: function_10e802ad
	Namespace: namespace_4b9fccd8
	Checksum: 0xFD9EFFAC
	Offset: 0x1050
	Size: 0x7E
	Parameters: 0
	Flags: Linked
*/
function function_10e802ad()
{
	weapon = self getcurrentweapon();
	aat = (isdefined(self aat::getaatonweapon(weapon, 1)) ? self aat::getaatonweapon(weapon, 1) : "none");
	return aat;
}

/*
	Name: function_6c71e778
	Namespace: namespace_4b9fccd8
	Checksum: 0xAFD35089
	Offset: 0x10D8
	Size: 0x156
	Parameters: 2
	Flags: Linked
*/
function function_6c71e778(machine, trigger)
{
	if(!isplayer(self) || !isdefined(level.var_2457162c))
	{
		return;
	}
	if(isdefined(machine) && isdefined(trigger))
	{
		trigger sethintstringforplayer(self, #"hash_2492283b9609c4a");
		if(isdefined(machine.objectiveid))
		{
			objective_setvisibletoplayer(machine.objectiveid, self);
			zm_utility::function_e8f4d47b(self, machine.objectiveid, 0);
		}
	}
	if(level.var_2457162c sr_weapon_upgrade_menu::is_open(self) && self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
	{
		level.var_2457162c sr_weapon_upgrade_menu::close(self);
		self namespace_553954de::function_548f282();
	}
	self notify(#"hash_213991f4845a7f0f");
}

/*
	Name: refill_ammo
	Namespace: namespace_4b9fccd8
	Checksum: 0xD23C85E3
	Offset: 0x1238
	Size: 0x14C
	Parameters: 0
	Flags: None
*/
function refill_ammo()
{
	nullweapon = getweapon(#"none");
	var_f945fa92 = getweapon(#"bare_hands");
	currentweapon = self getcurrentweapon();
	if(currentweapon != nullweapon && currentweapon != var_f945fa92)
	{
		maxammo = currentweapon.maxammo;
		self setweaponammostock(currentweapon, int(maxammo));
	}
	var_824ff7c7 = self getstowedweapon();
	if(var_824ff7c7 != nullweapon && var_824ff7c7 != var_f945fa92)
	{
		maxammo = var_824ff7c7.maxammo;
		self setweaponammostock(var_824ff7c7, int(maxammo));
	}
}

/*
	Name: function_ee7e837d
	Namespace: namespace_4b9fccd8
	Checksum: 0x1EAF8F7F
	Offset: 0x1390
	Size: 0x2E
	Parameters: 1
	Flags: None
*/
function function_ee7e837d(item)
{
	if(isdefined(item.var_a8bccf69))
	{
		return item.var_a8bccf69;
	}
	return 0;
}

/*
	Name: function_d6739845
	Namespace: namespace_4b9fccd8
	Checksum: 0xAB73C00
	Offset: 0x13C8
	Size: 0x30
	Parameters: 1
	Flags: Linked
*/
function function_d6739845(var_461c9e9e)
{
	if(!isdefined(level.var_7c5fd6a4))
	{
		return undefined;
	}
	return level.var_7c5fd6a4[var_461c9e9e];
}

/*
	Name: function_a9a3d4e0
	Namespace: namespace_4b9fccd8
	Checksum: 0xF9CE6A63
	Offset: 0x1400
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function function_a9a3d4e0(machine, trigger)
{
	self endon(#"disconnect", #"death", #"hash_213991f4845a7f0f");
	start_origin = self.origin;
	while(distance2d(self.origin, start_origin) < 32 && !self laststand::player_is_in_laststand() && !self isinvehicle())
	{
		waitframe(1);
		if(!isdefined(machine))
		{
			break;
		}
	}
	if(level.var_2457162c sr_weapon_upgrade_menu::is_open(self) && self clientfield::get_player_uimodel("hudItems.srOverlayOpen"))
	{
		self function_6c71e778(machine, trigger);
	}
}

/*
	Name: function_ef9d58d0
	Namespace: namespace_4b9fccd8
	Checksum: 0xEDF24FBD
	Offset: 0x1530
	Size: 0xB4
	Parameters: 1
	Flags: Linked
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
	Name: function_4609e67c
	Namespace: namespace_4b9fccd8
	Checksum: 0x9679B953
	Offset: 0x15F0
	Size: 0x91E
	Parameters: 2
	Flags: Linked
*/
function function_4609e67c(machine, trigger)
{
	self endon(#"hash_5f178db4550eeae9");
	trigger sethintstringforplayer(self, "");
	if(isdefined(machine.objectiveid))
	{
		zm_utility::function_e8f4d47b(self, machine.objectiveid, 1);
		objective_setinvisibletoplayer(machine.objectiveid, self);
	}
	self endoncallback(&function_6c71e778, #"death");
	self thread function_a9a3d4e0(machine, trigger);
	self zm_stats::increment_client_stat(#"use_pap");
	self zm_stats::increment_player_stat(#"use_pap");
	while(true)
	{
		weapon = self getcurrentweapon();
		var_9f40587a = 0;
		if(isdefined(weapon))
		{
			var_9f40587a = (weapon.name === #"ray_gun_mk2_upgraded" ? 1 : 0);
		}
		waitresult = undefined;
		waitresult = self waittill(#"menuresponse");
		menu = waitresult.menu;
		response = waitresult.response;
		intpayload = waitresult.intpayload;
		if(menu == #"sr_weapon_upgrade_menu")
		{
			item = namespace_b376ff3f::function_230ceec4(weapon);
			switch(waitresult.response)
			{
				case "hash_6235f4ca625f415":
				{
					var_82e23366 = getunlockableiteminfofromindex(intpayload, 3);
					var_438da649 = function_b143666d(intpayload, 3);
					var_461c9e9e = var_82e23366.var_3cf2d21;
					aat_name = function_d6739845(var_461c9e9e);
					var_dfa2c41b = var_438da649.var_b5ec8024;
					if(!isdefined(var_dfa2c41b))
					{
						var_dfa2c41b = 0;
					}
					has_enough = self zm_score::can_player_purchase(var_dfa2c41b);
					var_42a3b8a3 = self function_10e802ad();
					if(isdefined(item) && !killstreaks::is_killstreak_weapon(weapon) && !var_9f40587a)
					{
						if(!is_true(item.var_a6762160.var_6e136726) && has_enough && !aat::is_exempt_weapon(weapon) && var_42a3b8a3 != aat_name && item.var_bd027dd9 != 32767)
						{
							var_4f0c684c = namespace_3e3637fc::function_296cde87(aat_name);
							if(zm_weapons::function_89e5e7dd(var_4f0c684c))
							{
								switch(var_4f0c684c)
								{
									case "ammomod_napalmburst":
									{
										self playlocalsound(#"hash_51ce55cb5e478c26");
										break;
									}
									case "ammomod_cryofreeze":
									{
										self playlocalsound(#"hash_110bd5fceb403850");
										break;
									}
									case "ammomod_brainrot":
									{
										self playlocalsound(#"hash_26a2938f2f36ad31");
										break;
									}
									case "ammomod_deadwire":
									{
										self playlocalsound(#"hash_55e994939fce271b");
										break;
									}
								}
								self playrumbleonentity(#"hash_410bd55524ae7d");
								self zm_weapons::function_37e9e0cb(item, weapon, aat_name);
								self zm_score::minus_to_player_score(var_dfa2c41b);
								self zm_stats::increment_client_stat(#"hash_1bcba3bbca05dee0");
								self zm_stats::increment_player_stat(#"hash_1bcba3bbca05dee0");
								self function_80287c83(undefined, var_461c9e9e);
								machine thread scene::play(#"hash_19d0f38dbaefcd65", "Shot 3", machine);
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
					}
					break;
				}
				case "hash_199f079f459775b4":
				{
					if(self isswitchingweapons())
					{
						machine playsoundtoplayer(#"uin_default_action_denied", self);
					}
					else
					{
						var_a8bccf69 = intpayload;
						var_340eb1b = level.var_af0de66[var_a8bccf69];
						has_enough = self zm_score::can_player_purchase(var_340eb1b);
						if(isdefined(item) && has_enough && var_a8bccf69 <= 3 && item.var_bd027dd9 != 32767 && !killstreaks::is_killstreak_weapon(weapon) && !function_ef9d58d0(item))
						{
							self playlocalsound(#"hash_1a8a0ca90d106338" + var_a8bccf69);
							self namespace_b376ff3f::function_73ae3380(item, var_a8bccf69);
							self playrumbleonentity(#"hash_410bd55524ae7d");
							self zm_score::minus_to_player_score(var_340eb1b);
							self zm_stats::increment_client_stat(#"hash_14f07bc6dbeaab78" + var_a8bccf69);
							self zm_stats::increment_player_stat(#"hash_14f07bc6dbeaab78" + var_a8bccf69);
							self function_80287c83(weapon);
							machine thread scene::play(#"hash_19d0f38dbaefcd65", "Shot 2", machine);
						}
					}
					break;
				}
				case "hash_383c519d3bdac984":
				{
					self notify(#"hash_213991f4845a7f0f", aat::is_exempt_weapon(weapon) || zm_weapons::is_wonder_weapon(weapon) || var_9f40587a || killstreaks::is_killstreak_weapon(weapon));
					self function_6c71e778(machine, trigger);
					return;
				}
			}
		}
	}
}

/*
	Name: function_be24d7ce
	Namespace: namespace_4b9fccd8
	Checksum: 0xEEDA1D7B
	Offset: 0x1F18
	Size: 0x112
	Parameters: 1
	Flags: Linked
*/
function function_be24d7ce(item)
{
	if(isdefined(item.var_a6762160))
	{
		rarity = item.var_a6762160.rarity;
		weapon = item.var_a6762160.weapon;
		if(!isdefined(rarity) || rarity == #"none")
		{
			return;
		}
		if(rarity == #"ultra")
		{
			rarity = #"legendary";
		}
		if(isdefined(level.var_dcd62c45[weapon.name][rarity]))
		{
			var_c4139485 = level.var_dcd62c45[weapon.name][rarity];
			point = function_4ba8fde(var_c4139485);
			if(isdefined(point.var_a6762160))
			{
				return point;
			}
		}
	}
}

/*
	Name: function_329ecd95
	Namespace: namespace_4b9fccd8
	Checksum: 0xA3E7BF3E
	Offset: 0x2038
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_329ecd95(destination)
{
	level flag::wait_till("start_zombie_round_logic");
	waittillframeend();
	function_ff03fdfb(destination);
}

/*
	Name: function_ff03fdfb
	Namespace: namespace_4b9fccd8
	Checksum: 0x83B9CF47
	Offset: 0x2088
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_ff03fdfb(destination)
{
	if(isdefined(level.var_ce45839f))
	{
		level waittill(level.var_ce45839f);
	}
	foreach(location in destination.locations)
	{
		var_55bc5738 = location.instances[#"hash_448adaf187bbb953"];
		if(isdefined(var_55bc5738))
		{
			children = namespace_8b6a9d79::function_f703a5a(var_55bc5738);
			foreach(child in children)
			{
				function_e0069640(child);
			}
		}
	}
}

/*
	Name: function_80287c83
	Namespace: namespace_4b9fccd8
	Checksum: 0x4C5B1886
	Offset: 0x2200
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function function_80287c83(weapon, var_353b5fbf)
{
	var_5503dd3 = {#hash_9e0aa06:var_353b5fbf, #weapon:weapon.name, #hash_19b950db:zm_utility::get_round_number(), #hash_671a4a8f:zm_utility::function_e3025ca5(), #hash_c08f8ddc:gettime()};
	self function_678f57c8(#"hash_6856c2164be3f8db", var_5503dd3);
}

