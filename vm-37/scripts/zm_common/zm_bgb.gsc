#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace bgb;

/*
	Name: __init__system__
	Namespace: bgb
	Checksum: 0x52015155
	Offset: 0x2C8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"bgb", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bgb
	Checksum: 0x9DBE5EC8
	Offset: 0x320
	Size: 0x2D4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_connect(&on_player_connect);
	if(!is_true(level.bgb_in_use))
	{
		return;
	}
	level.weaponbgbgrab = getweapon(#"zombie_bgb_grab");
	level.var_ddff6359 = array(getweapon(#"hash_d0f29de78e218ad"), getweapon(#"hash_5e07292c519531e6"), getweapon(#"hash_305e5faa9ecb625a"), getweapon(#"hash_23cc1f9c16b375c3"), getweapon(#"hash_155cc0a9ba3c3260"), getweapon(#"hash_2394c41f048f7d2"), getweapon(#"hash_4565adf3abc61ea3"));
	level.bgb = [];
	clientfield::register_clientuimodel("zmhud.bgb_current", 1, 8, "int", 0);
	clientfield::register_clientuimodel("zmhud.bgb_display", 1, 1, "int", 0);
	clientfield::register_clientuimodel("zmhud.bgb_timer", 1, 8, "float", 0);
	clientfield::register_clientuimodel("zmhud.bgb_activations_remaining", 1, 3, "int", 0);
	clientfield::register_clientuimodel("zmhud.bgb_invalid_use", 1, 1, "counter", 0);
	clientfield::register_clientuimodel("zmhud.bgb_one_shot_use", 1, 1, "counter", 0);
	clientfield::register("toplayer", "bgb_blow_bubble", 1, 1, "counter");
	zm::register_vehicle_damage_callback(&vehicle_damage_override);
	zm_perks::register_lost_perk_override(&lost_perk_override);
}

/*
	Name: function_8ac3bea9
	Namespace: bgb
	Checksum: 0x1CBD1A7
	Offset: 0x600
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(!is_true(level.bgb_in_use))
	{
		return;
	}
	bgb_finalize();
	/#
		level thread setup_devgui();
	#/
	level._effect[#"samantha_steal"] = #"zombie/fx_monkey_lightning_zmb";
}

/*
	Name: on_player_connect
	Namespace: bgb
	Checksum: 0x403471B9
	Offset: 0x680
	Size: 0x56
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_connect()
{
	self.bgb = #"none";
	if(!is_true(level.bgb_in_use))
	{
		return;
	}
	self thread bgb_player_init();
	self.var_1898de24 = [];
}

/*
	Name: bgb_player_init
	Namespace: bgb
	Checksum: 0x28D4019B
	Offset: 0x6E0
	Size: 0x740
	Parameters: 0
	Flags: Linked, Private
*/
function private bgb_player_init()
{
	if(isdefined(self.bgb_pack))
	{
		for(i = 0; i < 4; i++)
		{
			if(isdefined(self.bgb_pack[i]) && isdefined(level.bgb[self.bgb_pack[i]]))
			{
				self bgb_pack::function_7b91e81c(i, level.bgb[self.bgb_pack[i]].item_index);
			}
		}
		return;
	}
	self.bgb_pack = self getbubblegumpack();
	for(x = 0; x < self.bgb_pack.size; x++)
	{
		if(isstring(self.bgb_pack[x]))
		{
			self.bgb_pack[x] = hash(self.bgb_pack[x]);
		}
	}
	self.bgb_pack_randomized = [];
	var_6e18a410 = array();
	for(i = 0; i < 4; i++)
	{
		str_bgb = self.bgb_pack[i];
		if(str_bgb == #"weapon_null")
		{
			continue;
		}
		if(zm_custom::function_3ac936c6(str_bgb))
		{
			var_6e18a410[i] = str_bgb;
			continue;
		}
		if(str_bgb != #"weapon_null" && self getbgbremaining(str_bgb) > 0)
		{
			self thread zm_custom::function_deae84ba();
		}
	}
	self.bgb_pack = var_6e18a410;
	/#
		if(isdefined(self.var_d03d9cf3))
		{
			self.bgb_pack = self.var_d03d9cf3;
		}
	#/
	self.bgb_stats = [];
	foreach(bgb in self.bgb_pack)
	{
		if(bgb == #"weapon_null")
		{
			continue;
		}
		if(isdefined(level.bgb) && isdefined(level.bgb[bgb]) && !is_true(level.bgb[bgb].consumable))
		{
			continue;
		}
		self.bgb_stats[bgb] = spawnstruct();
		if(!isbot(self))
		{
			self.bgb_stats[bgb].var_c2a984f0 = self getbgbremaining(bgb);
		}
		else
		{
			self.bgb_stats[bgb].var_c2a984f0 = 0;
		}
		self.bgb_stats[bgb].bgb_used_this_game = 0;
	}
	self init_weapon_cycling();
	self thread bgb_player_monitor();
	self thread bgb_end_game();
	for(i = 0; i < 4; i++)
	{
		if(isdefined(self.bgb_pack[i]) && isdefined(level.bgb[self.bgb_pack[i]]))
		{
			self bgb_pack::function_7b91e81c(i, level.bgb[self.bgb_pack[i]].item_index);
		}
	}
	if(zm_custom::function_901b751c(#"hash_3ab7cedcfef7eacc"))
	{
		var_66dd5e25 = array(#"zm_bgb_nowhere_but_there", #"zm_bgb_now_you_see_me");
		n_rank = self rank::getrank() + 1;
		foreach(bgb in level.bgb)
		{
			str_name = bgb.name;
			if(bgb.rarity === 0 && str_name != #"zm_bgb_point_drops" && !array::contains(self.bgb_pack, str_name))
			{
				var_544e77f8 = level.bgb[str_name].var_a1750d43;
				if(!isdefined(var_544e77f8) || (isdefined(var_544e77f8) && n_rank >= var_544e77f8 || function_bea73b01() == 1) && zm_custom::function_3ac936c6(str_name))
				{
					if(!isinarray(var_66dd5e25, str_name))
					{
						if(!isdefined(self.var_2b74c8fe))
						{
							self.var_2b74c8fe = [];
						}
						else if(!isarray(self.var_2b74c8fe))
						{
							self.var_2b74c8fe = array(self.var_2b74c8fe);
						}
						self.var_2b74c8fe[self.var_2b74c8fe.size] = str_name;
					}
					if(!isdefined(self.var_82971641))
					{
						self.var_82971641 = [];
					}
					else if(!isarray(self.var_82971641))
					{
						self.var_82971641 = array(self.var_82971641);
					}
					self.var_82971641[self.var_82971641.size] = str_name;
				}
			}
		}
	}
}

/*
	Name: bgb_end_game
	Namespace: bgb
	Checksum: 0x4A8AB265
	Offset: 0xE28
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private bgb_end_game()
{
	self endon(#"disconnect");
	self waittill(#"report_bgb_consumption");
	self thread take();
}

/*
	Name: bgb_finalize
	Namespace: bgb
	Checksum: 0x8F444F7B
	Offset: 0xE70
	Size: 0x1F2
	Parameters: 0
	Flags: Linked, Private
*/
function private bgb_finalize()
{
	foreach(v in level.bgb)
	{
		v.item_index = getitemindexfromref(v.name);
		var_ddcb67f4 = getunlockableiteminfofromindex(v.item_index, 2);
		v.stat_index = (isdefined(var_ddcb67f4.var_2f8e25b8) ? var_ddcb67f4.var_2f8e25b8 : 0);
		var_5415dfb9 = function_b143666d(v.item_index, 2);
		if(!isdefined(var_ddcb67f4) || !isdefined(var_5415dfb9))
		{
			/#
				println(("" + v.name) + "");
			#/
			continue;
		}
		if(!isdefined(var_5415dfb9.bgbrarity))
		{
			var_5415dfb9.bgbrarity = 0;
		}
		v.rarity = var_5415dfb9.bgbrarity;
		if(0 == v.rarity || 1 == v.rarity)
		{
			v.consumable = 0;
		}
		else
		{
			v.consumable = 1;
		}
		v.camo_index = var_5415dfb9.var_daefc551;
		v.dlc_index = var_ddcb67f4.dlc;
	}
}

/*
	Name: bgb_player_monitor
	Namespace: bgb
	Checksum: 0xEA9F366D
	Offset: 0x1070
	Size: 0xD0
	Parameters: 0
	Flags: Linked, Private
*/
function private bgb_player_monitor()
{
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"between_round_over", #"restart_round");
		str_return = waitresult._notify;
		if(isdefined(level.var_b77403b9))
		{
			if(!is_true(self [[level.var_b77403b9]]()))
			{
				continue;
			}
		}
		if(str_return === "restart_round")
		{
			level waittill(#"between_round_over");
		}
	}
}

/*
	Name: setup_devgui
	Namespace: bgb
	Checksum: 0x62D9F871
	Offset: 0x1148
	Size: 0x254
	Parameters: 0
	Flags: Private
*/
function private setup_devgui()
{
	/#
		waittillframeend();
		setdvar(#"bgb_acquire_devgui", "");
		setdvar(#"hash_7877ee182ba11433", -1);
		bgb_devgui_base = "";
		keys = getarraykeys(level.bgb);
		foreach(key in keys)
		{
			name = function_9e72a96(level.bgb[key].name);
			adddebugcommand((((((bgb_devgui_base + name) + "") + "") + "") + name) + "");
		}
		adddebugcommand(((((bgb_devgui_base + "") + "") + "") + "") + "");
		for(i = 0; i < 4; i++)
		{
			playernum = i + 1;
			adddebugcommand(((((((bgb_devgui_base + "") + playernum) + "") + "") + "") + i) + "");
		}
		level thread bgb_devgui_think();
	#/
}

/*
	Name: bgb_devgui_think
	Namespace: bgb
	Checksum: 0xD4015F70
	Offset: 0x13A8
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private bgb_devgui_think()
{
	/#
		for(;;)
		{
			var_522737d6 = getdvarstring(#"bgb_acquire_devgui");
			if(var_522737d6 != "")
			{
				bgb_devgui_acquire(var_522737d6);
			}
			setdvar(#"bgb_acquire_devgui", "");
			wait(0.5);
		}
	#/
}

/*
	Name: bgb_devgui_acquire
	Namespace: bgb
	Checksum: 0x90A3E570
	Offset: 0x1440
	Size: 0x13C
	Parameters: 1
	Flags: Private
*/
function private bgb_devgui_acquire(bgb_name)
{
	/#
		bgb_name = hash(bgb_name);
		playerid = getdvarint(#"hash_7877ee182ba11433", 0);
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(playerid != -1 && playerid != i)
			{
				continue;
			}
			if(#"none" == bgb_name)
			{
				players[i] thread take();
				continue;
			}
			players[i] bgb_gumball_anim(bgb_name);
			if(isdefined(level.bgb[bgb_name].activation_func))
			{
				players[i] thread run_activation_func(bgb_name);
			}
		}
	#/
}

/*
	Name: bgb_debug_text_display_init
	Namespace: bgb
	Checksum: 0xB448DA64
	Offset: 0x1588
	Size: 0x142
	Parameters: 0
	Flags: Private
*/
function private bgb_debug_text_display_init()
{
	/#
		self.bgb_debug_text = newdebughudelem(self);
		self.bgb_debug_text.elemtype = "";
		self.bgb_debug_text.font = "";
		self.bgb_debug_text.fontscale = 1.8;
		self.bgb_debug_text.horzalign = "";
		self.bgb_debug_text.vertalign = "";
		self.bgb_debug_text.alignx = "";
		self.bgb_debug_text.aligny = "";
		self.bgb_debug_text.x = 15;
		self.bgb_debug_text.y = 35;
		self.bgb_debug_text.sort = 2;
		self.bgb_debug_text.color = (1, 1, 1);
		self.bgb_debug_text.alpha = 1;
		self.bgb_debug_text.hidewheninmenu = 1;
	#/
}

/*
	Name: bgb_set_debug_text
	Namespace: bgb
	Checksum: 0x19D8136E
	Offset: 0x16D8
	Size: 0x1BE
	Parameters: 2
	Flags: Private
*/
function private bgb_set_debug_text(name, activations_remaining)
{
	/#
		if(!isdefined(self.bgb_debug_text))
		{
			return;
		}
		if(isdefined(activations_remaining))
		{
		}
		self notify(#"bgb_set_debug_text_thread");
		self endon(#"bgb_set_debug_text_thread", #"disconnect");
		self.bgb_debug_text fadeovertime(0.05);
		self.bgb_debug_text.alpha = 1;
		prefix = "";
		short_name = name;
		if(issubstr(name, prefix))
		{
			short_name = getsubstr(name, prefix.size);
		}
		if(isdefined(activations_remaining))
		{
			self.bgb_debug_text settext(((("" + short_name) + "") + activations_remaining) + "");
		}
		else
		{
			self.bgb_debug_text settext("" + short_name);
		}
		wait(1);
		if(#"none" == name)
		{
			self.bgb_debug_text fadeovertime(1);
			self.bgb_debug_text.alpha = 0;
		}
	#/
}

/*
	Name: bgb_print_stats
	Namespace: bgb
	Checksum: 0xEC30094D
	Offset: 0x18A0
	Size: 0x114
	Parameters: 1
	Flags: None
*/
function bgb_print_stats(bgb)
{
	/#
		printtoprightln((function_9e72a96(bgb) + "") + self.bgb_stats[bgb].var_c2a984f0, (1, 1, 1));
		printtoprightln((function_9e72a96(bgb) + "") + self.bgb_stats[bgb].bgb_used_this_game, (1, 1, 1));
		n_available = self.bgb_stats[bgb].var_c2a984f0 - self.bgb_stats[bgb].bgb_used_this_game;
		printtoprightln((function_9e72a96(bgb) + "") + n_available, (1, 1, 1));
	#/
}

/*
	Name: has_consumable_bgb
	Namespace: bgb
	Checksum: 0x9DD7C88E
	Offset: 0x19C0
	Size: 0x56
	Parameters: 1
	Flags: Linked, Private
*/
function private has_consumable_bgb(bgb)
{
	if(!isdefined(self.bgb_stats[bgb]) || !is_true(level.bgb[bgb].consumable))
	{
		return false;
	}
	return true;
}

/*
	Name: sub_consumable_bgb
	Namespace: bgb
	Checksum: 0x98710073
	Offset: 0x1A20
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function sub_consumable_bgb(bgb)
{
	if(!has_consumable_bgb(bgb))
	{
		return;
	}
	if(isdefined(level.bgb[bgb].var_f8d9ac8c) && ![[level.bgb[bgb].var_f8d9ac8c]]())
	{
		return;
	}
	self.bgb_stats[bgb].bgb_used_this_game++;
	if(level flag::exists("first_consumables_used"))
	{
		level flag::set("first_consumables_used");
	}
	/#
		bgb_print_stats(bgb);
	#/
}

/*
	Name: get_bgb_available
	Namespace: bgb
	Checksum: 0x5D78E3B4
	Offset: 0x1B00
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function get_bgb_available(bgb)
{
	if(!isdefined(bgb))
	{
		return 0;
	}
	if(!isdefined(self.bgb_stats[bgb]))
	{
		return 1;
	}
	var_cb4d0349 = self.bgb_stats[bgb].var_c2a984f0;
	n_bgb_used_this_game = self.bgb_stats[bgb].bgb_used_this_game;
	n_bgb_remaining = var_cb4d0349 - n_bgb_used_this_game;
	if(is_true(level.var_4af38aa3))
	{
		return 1;
	}
	return 0 < n_bgb_remaining;
}

/*
	Name: function_b331a28c
	Namespace: bgb
	Checksum: 0x68CB2989
	Offset: 0x1BB8
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b331a28c(bgb)
{
	if(!is_true(level.bgb[bgb].var_50206ca3))
	{
		return;
	}
	self val::set(#"bgb_activation", "takedamage", 0);
	s_result = undefined;
	s_result = self waittilltimeout(2, #"bgb_bubble_blow_complete");
	if(isdefined(self))
	{
		self val::reset(#"bgb_activation", "takedamage");
	}
}

/*
	Name: function_1f3eb76f
	Namespace: bgb
	Checksum: 0xC3C48039
	Offset: 0x1C88
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1f3eb76f(bgb)
{
	if(!is_true(level.bgb[bgb].var_f1f46d6b))
	{
		return;
	}
	self.var_e75517b1 = 1;
	self waittilltimeout(2, #"bgb_bubble_blow_complete");
	if(isdefined(self))
	{
		self.var_e75517b1 = 0;
	}
}

/*
	Name: bgb_gumball_anim
	Namespace: bgb
	Checksum: 0x1A412045
	Offset: 0x1D08
	Size: 0x2B0
	Parameters: 1
	Flags: Linked
*/
function bgb_gumball_anim(bgb)
{
	self endon(#"disconnect");
	level endon(#"end_game");
	if(self isinmovemode("ufo", "noclip"))
	{
		return false;
	}
	if(self laststand::player_is_in_laststand())
	{
		return false;
	}
	weapon = bgb_get_gumball_anim_weapon(bgb);
	if(!isdefined(weapon))
	{
		return false;
	}
	while(self isswitchingweapons() || self isusingoffhand() || self isthrowinggrenade() || self ismeleeing() || self function_61efcfe5() || self function_f071483d())
	{
		waitframe(1);
	}
	while(is_true(self.var_1d940ef6))
	{
		waitframe(1);
	}
	while(self getcurrentweapon() == level.weaponnone)
	{
		waitframe(1);
	}
	weapon_options = self function_6eff28b5(level.bgb[bgb].camo_index, 0, 0);
	self thread gestures::function_f3e2696f(bgb, weapon, weapon_options, 2.5, &function_16670e75, &function_3b2a02d8, &function_62f40b0d);
	while(self isswitchingweapons())
	{
		waitframe(1);
	}
	evt = undefined;
	evt = self waittilltimeout(3, #"hash_593f920e9efd2ecd", #"bgb_gumball_anim_give");
	if(isdefined(evt) && evt.bgb === bgb)
	{
		if(evt._notify == #"bgb_gumball_anim_give")
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a6c704c
	Namespace: bgb
	Checksum: 0xA626E19E
	Offset: 0x1FC0
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_a6c704c(bgb)
{
	self endon(#"disconnect");
	level endon(#"end_game");
	self thread function_b331a28c(bgb);
	self thread function_1f3eb76f(bgb);
	util::delay(#"offhand_fire", "death", &zm_audio::create_and_play_dialog, #"elixir", #"drink");
	if(is_true(level.bgb[bgb].var_4a9b0cdc) || self function_e98aa964(1))
	{
		self notify(#"hash_27b238d082f65849", bgb);
		self activation_start();
		self thread run_activation_func(bgb);
		return true;
	}
	return false;
}

/*
	Name: run_activation_func
	Namespace: bgb
	Checksum: 0x1B17D04A
	Offset: 0x2118
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function run_activation_func(bgb)
{
	self endon(#"disconnect");
	self set_active(1);
	self do_one_shot_use();
	self notify(#"bgb_bubble_blow_complete");
	self [[level.bgb[bgb].activation_func]]();
	self set_active(0);
	self activation_complete();
}

/*
	Name: bgb_get_gumball_anim_weapon
	Namespace: bgb
	Checksum: 0x61E811C2
	Offset: 0x21D8
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private bgb_get_gumball_anim_weapon(bgb)
{
	var_ab8d8da3 = undefined;
	if(isdefined(level.bgb[bgb]))
	{
		n_rarity = level.bgb[bgb].rarity;
		if(isdefined(level.var_ddff6359) && isdefined(n_rarity))
		{
			var_ab8d8da3 = level.var_ddff6359[n_rarity];
		}
	}
	return var_ab8d8da3;
}

/*
	Name: function_16670e75
	Namespace: bgb
	Checksum: 0x4E8D201E
	Offset: 0x2260
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_16670e75(bgb)
{
	if(!isdefined(self))
	{
		return;
	}
	if(self laststand::player_is_in_laststand())
	{
		return;
	}
	self thread function_b331a28c(bgb);
	self thread function_1f3eb76f(bgb);
}

/*
	Name: function_3b2a02d8
	Namespace: bgb
	Checksum: 0xB1DC21AC
	Offset: 0x22C8
	Size: 0x2D4
	Parameters: 1
	Flags: Linked
*/
function function_3b2a02d8(bgb)
{
	if(!isdefined(self))
	{
		return;
	}
	if(self laststand::player_is_in_laststand())
	{
		return;
	}
	self notify(#"bgb_gumball_anim_give", {#bgb:bgb});
	self thread give(bgb);
	zm_audio::create_and_play_dialog(#"elixir", #"drink");
	self zm_stats::increment_client_stat("bgbs_chewed");
	self zm_stats::increment_player_stat("bgbs_chewed");
	self zm_stats::increment_challenge_stat(#"gum_gobbler_consume");
	self zm_stats::function_8f10788e("boas_bgbs_chewed");
	self zm_stats::function_c0c6ab19(#"hash_67f429ee3f93764d");
	if(level.bgb[bgb].rarity > 0)
	{
		self zm_stats::increment_challenge_stat(#"hash_41d41d501c70fb30");
	}
	self stats::inc_stat(#"bgb_stats", bgb, #"used", #"statvalue", 1);
	health = 0;
	if(isdefined(self.health))
	{
		health = self.health;
	}
	if(is_true(level.bgb[bgb].consumable))
	{
		self luinotifyevent(#"zombie_bgb_used", 1, level.bgb[bgb].item_index);
	}
	self recordmapevent(4, gettime(), self.origin, level.round_number, level.bgb[bgb].stat_index, health);
	demo::bookmark(#"zm_player_bgb_grab", gettime(), self);
	potm::bookmark(#"zm_player_bgb_grab", gettime(), self);
}

/*
	Name: function_62f40b0d
	Namespace: bgb
	Checksum: 0x60C51E52
	Offset: 0x25A8
	Size: 0x46
	Parameters: 2
	Flags: Linked
*/
function function_62f40b0d(bgb, var_f3b15ce0)
{
	if(!isdefined(self))
	{
		return;
	}
	self notify(#"hash_593f920e9efd2ecd", {#bgb:var_f3b15ce0});
}

/*
	Name: bgb_clear_monitors_and_clientfields
	Namespace: bgb
	Checksum: 0x6C3F997F
	Offset: 0x25F8
	Size: 0x7C
	Parameters: 0
	Flags: Linked, Private
*/
function private bgb_clear_monitors_and_clientfields()
{
	self notify(#"bgb_limit_monitor");
	self notify(#"bgb_activation_monitor");
	self clientfield::set_player_uimodel("zmhud.bgb_display", 0);
	self clientfield::set_player_uimodel("zmhud.bgb_activations_remaining", 0);
	self clear_timer();
}

/*
	Name: bgb_limit_monitor
	Namespace: bgb
	Checksum: 0x91BCA9DA
	Offset: 0x2680
	Size: 0x5CC
	Parameters: 0
	Flags: Linked, Private
*/
function private bgb_limit_monitor()
{
	self notify(#"bgb_limit_monitor");
	self endon(#"bgb_limit_monitor", #"death", #"bgb_update");
	self clientfield::set_player_uimodel("zmhud.bgb_display", 1);
	self playsoundtoplayer(#"hash_56cc165edb993de8", self);
	switch(level.bgb[self.bgb].limit_type)
	{
		case "activated":
		{
			for(i = level.bgb[self.bgb].limit; i > 0; i--)
			{
				if(i != level.bgb[self.bgb].limit)
				{
					self playsoundtoplayer(#"hash_7bb31f4a25cf34a", self);
				}
				level.bgb[self.bgb].var_dbe7d224 = i;
				if(level.bgb[self.bgb].var_57eb02e)
				{
					function_f0d592c9();
				}
				else
				{
					self set_timer(i, level.bgb[self.bgb].limit);
				}
				self clientfield::set_player_uimodel("zmhud.bgb_activations_remaining", i);
				/#
					self thread bgb_set_debug_text(self.bgb, i);
				#/
				self waittill(#"bgb_activation");
				while(is_true(self get_active()))
				{
					waitframe(1);
				}
			}
			if(isdefined(self.bgb) && isdefined(level.bgb[self.bgb]))
			{
				level.bgb[self.bgb].var_dbe7d224 = 0;
			}
			self playsoundtoplayer(#"hash_b8e60131176554b", self);
			if(isdefined(self.bgb) && isdefined(level.bgb[self.bgb]))
			{
				self set_timer(0, level.bgb[self.bgb].limit);
			}
			while(is_true(self.bgb_activation_in_progress))
			{
				waitframe(1);
			}
			break;
		}
		case "time":
		{
			/#
				self thread bgb_set_debug_text(self.bgb);
			#/
			self thread run_timer(level.bgb[self.bgb].limit);
			self waittill(#"hash_347d2afccb8337ab");
			self playsoundtoplayer(#"hash_b8e60131176554b", self);
			break;
		}
		case "rounds":
		{
			/#
				self thread bgb_set_debug_text(self.bgb);
			#/
			count = level.bgb[self.bgb].limit + 1;
			for(i = 0; i < count; i++)
			{
				if(i != 0)
				{
					self playsoundtoplayer(#"hash_7bb31f4a25cf34a", self);
				}
				self set_timer(count - i, count);
				level waittill(#"end_of_round");
			}
			self playsoundtoplayer(#"hash_b8e60131176554b", self);
			break;
		}
		case "event":
		{
			/#
				self thread bgb_set_debug_text(self.bgb);
			#/
			self bgb_set_timer_clientfield(1);
			self [[level.bgb[self.bgb].limit]]();
			self playsoundtoplayer(#"hash_b8e60131176554b", self);
			break;
		}
		default:
		{
			/#
				assert(0, ((("" + self.bgb) + "") + level.bgb[self.bgb].limit_type) + "");
			#/
		}
	}
	self thread take();
}

/*
	Name: bgb_bled_out_monitor
	Namespace: bgb
	Checksum: 0x13DA8711
	Offset: 0x2C58
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private bgb_bled_out_monitor()
{
	self endon(#"disconnect", #"bgb_update");
	self notify(#"bgb_bled_out_monitor");
	self endon(#"bgb_bled_out_monitor");
	self waittill(#"bled_out");
	self notify(#"bgb_about_to_take_on_bled_out");
	wait(0.1);
	self thread take();
}

/*
	Name: bgb_activation_monitor
	Namespace: bgb
	Checksum: 0xF0C98F6D
	Offset: 0x2CF8
	Size: 0xD2
	Parameters: 0
	Flags: Private
*/
function private bgb_activation_monitor()
{
	self endon(#"disconnect");
	self notify(#"bgb_activation_monitor");
	self endon(#"bgb_activation_monitor");
	if("activated" != level.bgb[self.bgb].limit_type)
	{
		return;
	}
	for(;;)
	{
		self waittill(#"bgb_activation_request");
		waitframe(1);
		if(!self function_e98aa964(0))
		{
			continue;
		}
		if(self function_a6c704c(self.bgb))
		{
			self notify(#"bgb_activation", self.bgb);
		}
	}
}

/*
	Name: function_e98aa964
	Namespace: bgb
	Checksum: 0x93FFE42E
	Offset: 0x2DD8
	Size: 0x1A4
	Parameters: 2
	Flags: Linked
*/
function function_e98aa964(var_3e37f503, var_8593b089)
{
	if(!isdefined(var_3e37f503))
	{
		var_3e37f503 = 0;
	}
	if(!isdefined(var_8593b089))
	{
		var_8593b089 = self.bgb;
	}
	var_ceb582a8 = isdefined(level.bgb[var_8593b089].validation_func) && !self [[level.bgb[var_8593b089].validation_func]]();
	var_e6b14ccc = isdefined(level.var_67713b46) && !self [[level.var_67713b46]]();
	if(!var_3e37f503 && is_true(self.is_drinking) || (is_true(self.bgb_activation_in_progress) && !is_true(self.var_ec8a9710)) || self laststand::player_is_in_laststand() || var_ceb582a8 || var_e6b14ccc || is_true(self.var_16735873) || is_true(self.var_30cbff55))
	{
		self clientfield::increment_uimodel("zmhud.bgb_invalid_use");
		return false;
	}
	return true;
}

/*
	Name: function_1fdcef80
	Namespace: bgb
	Checksum: 0x52863A85
	Offset: 0x2F88
	Size: 0xAC
	Parameters: 1
	Flags: Private
*/
function private function_1fdcef80(bgb)
{
	self endon(#"disconnect", #"bled_out", #"bgb_update");
	if(is_true(level.bgb[bgb].var_5a047886))
	{
		function_9c8e12d1(6);
	}
	else
	{
		return;
	}
	self waittill(#"bgb_activation_request");
	self thread take();
}

/*
	Name: function_9c8e12d1
	Namespace: bgb
	Checksum: 0xE99A706F
	Offset: 0x3040
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_9c8e12d1(n_value)
{
	self setactionslot(1, "bgb");
	self clientfield::set_player_uimodel("zmhud.bgb_activations_remaining", n_value);
}

/*
	Name: function_f37655df
	Namespace: bgb
	Checksum: 0x77148F01
	Offset: 0x3098
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_f37655df(n_value)
{
	self clientfield::set_player_uimodel("zmhud.bgb_activations_remaining", 0);
}

/*
	Name: function_57eb02e
	Namespace: bgb
	Checksum: 0x8663CD06
	Offset: 0x30D0
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function function_57eb02e(name)
{
	level.bgb[name].var_57eb02e = 1;
}

/*
	Name: do_one_shot_use
	Namespace: bgb
	Checksum: 0xC38F6C85
	Offset: 0x3108
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function do_one_shot_use(skip_demo_bookmark)
{
	if(!isdefined(skip_demo_bookmark))
	{
		skip_demo_bookmark = 0;
	}
	self clientfield::increment_uimodel("zmhud.bgb_one_shot_use");
	if(!skip_demo_bookmark)
	{
		demo::bookmark(#"zm_player_bgb_activate", gettime(), self);
		potm::bookmark(#"zm_player_bgb_activate", gettime(), self);
	}
}

/*
	Name: activation_start
	Namespace: bgb
	Checksum: 0x5E30A56D
	Offset: 0x31A0
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function activation_start()
{
	self.bgb_activation_in_progress = 1;
}

/*
	Name: activation_complete
	Namespace: bgb
	Checksum: 0x6A5DFEDA
	Offset: 0x31C0
	Size: 0x1E
	Parameters: 0
	Flags: Linked, Private
*/
function private activation_complete()
{
	self.bgb_activation_in_progress = 0;
	self notify(#"activation_complete");
}

/*
	Name: set_active
	Namespace: bgb
	Checksum: 0x24CE2699
	Offset: 0x31E8
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private set_active(b_is_active)
{
	self.bgb_active = b_is_active;
}

/*
	Name: get_active
	Namespace: bgb
	Checksum: 0xF166A24C
	Offset: 0x3210
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function get_active()
{
	return is_true(self.bgb_active);
}

/*
	Name: is_active
	Namespace: bgb
	Checksum: 0xE2BD9929
	Offset: 0x3238
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function is_active(name)
{
	if(!isdefined(self.bgb))
	{
		return 0;
	}
	return self.bgb == name && is_true(self.bgb_active);
}

/*
	Name: is_team_active
	Namespace: bgb
	Checksum: 0x2B860B43
	Offset: 0x3288
	Size: 0xA2
	Parameters: 1
	Flags: None
*/
function is_team_active(name)
{
	foreach(player in level.players)
	{
		if(player is_active(name))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: increment_ref_count
	Namespace: bgb
	Checksum: 0xF462C576
	Offset: 0x3338
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function increment_ref_count(name)
{
	if(!isdefined(level.bgb[name]))
	{
		return 0;
	}
	var_d1efe11 = level.bgb[name].ref_count;
	level.bgb[name].ref_count++;
	return var_d1efe11;
}

/*
	Name: decrement_ref_count
	Namespace: bgb
	Checksum: 0xFB680FC3
	Offset: 0x33A8
	Size: 0x56
	Parameters: 1
	Flags: None
*/
function decrement_ref_count(name)
{
	if(!isdefined(level.bgb[name]))
	{
		return 0;
	}
	level.bgb[name].ref_count--;
	return level.bgb[name].ref_count;
}

/*
	Name: calc_remaining_duration_lerp
	Namespace: bgb
	Checksum: 0x51CFA992
	Offset: 0x3408
	Size: 0x8A
	Parameters: 2
	Flags: Linked, Private
*/
function private calc_remaining_duration_lerp(start_time, end_time)
{
	if(0 >= (end_time - start_time))
	{
		return 0;
	}
	now = gettime();
	frac = (float(end_time - now)) / (float(end_time - start_time));
	return math::clamp(frac, 0, 1);
}

/*
	Name: function_af43111c
	Namespace: bgb
	Checksum: 0x5BA8030E
	Offset: 0x34A0
	Size: 0x112
	Parameters: 3
	Flags: Linked, Private
*/
function private function_af43111c(var_f205d85d, percent, var_5f12e334)
{
	if(!isdefined(var_5f12e334))
	{
		var_5f12e334 = 0;
	}
	self endon(#"disconnect", #"hash_6ae783a3051b411b");
	if(var_5f12e334)
	{
		self.var_4b0fb2fb = 1;
	}
	start_time = gettime();
	end_time = start_time + 1000;
	var_2cd46f25 = var_f205d85d;
	while(var_2cd46f25 > percent)
	{
		var_2cd46f25 = lerpfloat(percent, var_f205d85d, calc_remaining_duration_lerp(start_time, end_time));
		self clientfield::set_player_uimodel("zmhud.bgb_timer", var_2cd46f25);
		waitframe(1);
	}
	if(var_5f12e334)
	{
		self.var_76c47001 = var_2cd46f25;
		self.var_4b0fb2fb = undefined;
	}
}

/*
	Name: bgb_set_timer_clientfield
	Namespace: bgb
	Checksum: 0x75EE5DB1
	Offset: 0x35C0
	Size: 0xB4
	Parameters: 2
	Flags: Linked, Private
*/
function private bgb_set_timer_clientfield(percent, var_5f12e334)
{
	if(!isdefined(var_5f12e334))
	{
		var_5f12e334 = 0;
	}
	self notify(#"hash_6ae783a3051b411b");
	var_f205d85d = self clientfield::get_player_uimodel("zmhud.bgb_timer");
	if(percent < var_f205d85d && 0.1 <= (var_f205d85d - percent))
	{
		self thread function_af43111c(var_f205d85d, percent, var_5f12e334);
	}
	else
	{
		self clientfield::set_player_uimodel("zmhud.bgb_timer", percent);
	}
}

/*
	Name: function_f0d592c9
	Namespace: bgb
	Checksum: 0x64AC4C15
	Offset: 0x3680
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f0d592c9()
{
	self bgb_set_timer_clientfield(1);
}

/*
	Name: set_timer
	Namespace: bgb
	Checksum: 0xC2B6D8F5
	Offset: 0x36A8
	Size: 0x64
	Parameters: 3
	Flags: Linked
*/
function set_timer(current, max, var_5f12e334)
{
	if(!isdefined(var_5f12e334))
	{
		var_5f12e334 = 0;
	}
	if(!is_true(self.var_4b0fb2fb))
	{
		self bgb_set_timer_clientfield(current / max, var_5f12e334);
	}
}

/*
	Name: run_timer
	Namespace: bgb
	Checksum: 0xA72BF263
	Offset: 0x3718
	Size: 0x13E
	Parameters: 1
	Flags: Linked
*/
function run_timer(max)
{
	self endon(#"disconnect");
	self notify(#"bgb_run_timer");
	self endon(#"bgb_run_timer");
	current = max;
	self.var_ec8a9710 = 1;
	while(current > 0)
	{
		self set_timer(current, max);
		waitframe(1);
		if(isdefined(self.var_76c47001))
		{
			current = max * self.var_76c47001;
			self.var_76c47001 = undefined;
		}
		else if(!is_true(self.var_4b0fb2fb))
		{
			current = current - (float(function_60d95f53()) / 1000);
		}
	}
	self notify(#"hash_347d2afccb8337ab");
	self clear_timer();
	self.var_ec8a9710 = undefined;
}

/*
	Name: clear_timer
	Namespace: bgb
	Checksum: 0x80AE03AF
	Offset: 0x3860
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function clear_timer()
{
	self bgb_set_timer_clientfield(0);
	self notify(#"bgb_run_timer");
}

/*
	Name: register
	Namespace: bgb
	Checksum: 0x3ECFFB2E
	Offset: 0x3898
	Size: 0x52E
	Parameters: 7
	Flags: None
*/
function register(name, limit_type, limit, enable_func, disable_func, validation_func, activation_func)
{
	/#
		assert(isdefined(name), "");
	#/
	/#
		assert(#"none" != name, ("" + #"none") + "");
	#/
	/#
		assert(!isdefined(level.bgb[name]), ("" + name) + "");
	#/
	/#
		assert(isdefined(limit_type), ("" + name) + "");
	#/
	/#
		assert(isdefined(limit), ("" + name) + "");
	#/
	/#
		assert(!isdefined(enable_func) || isfunctionptr(enable_func), ("" + name) + "");
	#/
	/#
		assert(!isdefined(disable_func) || isfunctionptr(disable_func), ("" + name) + "");
	#/
	switch(limit_type)
	{
		case "activated":
		{
			/#
				assert(!isdefined(validation_func) || isfunctionptr(validation_func), ((("" + name) + "") + limit_type) + "");
			#/
			/#
				assert(isdefined(activation_func), ((("" + name) + "") + limit_type) + "");
			#/
			/#
				assert(isfunctionptr(activation_func), ((("" + name) + "") + limit_type) + "");
			#/
		}
		case "time":
		case "rounds":
		{
			/#
				assert(isint(limit), ((((("" + name) + "") + limit) + "") + limit_type) + "");
			#/
			break;
		}
		case "event":
		{
			/#
				assert(isfunctionptr(limit), ((("" + name) + "") + limit_type) + "");
			#/
			break;
		}
		default:
		{
			/#
				assert(0, ((("" + name) + "") + limit_type) + "");
			#/
		}
	}
	level.bgb[name] = spawnstruct();
	level.bgb[name].name = name;
	level.bgb[name].limit_type = limit_type;
	level.bgb[name].limit = limit;
	level.bgb[name].enable_func = enable_func;
	level.bgb[name].disable_func = disable_func;
	level.bgb[name].validation_func = validation_func;
	if("activated" == limit_type)
	{
		level.bgb[name].activation_func = activation_func;
		level.bgb[name].var_57eb02e = 0;
	}
	level.bgb[name].ref_count = 0;
}

/*
	Name: register_actor_damage_override
	Namespace: bgb
	Checksum: 0x5D80E391
	Offset: 0x3DD0
	Size: 0x6E
	Parameters: 2
	Flags: None
*/
function register_actor_damage_override(name, actor_damage_override_func)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	level.bgb[name].actor_damage_override_func = actor_damage_override_func;
}

/*
	Name: register_vehicle_damage_override
	Namespace: bgb
	Checksum: 0xDEB377BD
	Offset: 0x3E48
	Size: 0x6E
	Parameters: 2
	Flags: None
*/
function register_vehicle_damage_override(name, vehicle_damage_override_func)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	level.bgb[name].vehicle_damage_override_func = vehicle_damage_override_func;
}

/*
	Name: register_actor_death_override
	Namespace: bgb
	Checksum: 0x1ABDE32D
	Offset: 0x3EC0
	Size: 0x6E
	Parameters: 2
	Flags: None
*/
function register_actor_death_override(name, actor_death_override_func)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	level.bgb[name].actor_death_override_func = actor_death_override_func;
}

/*
	Name: register_lost_perk_override
	Namespace: bgb
	Checksum: 0x50216D93
	Offset: 0x3F38
	Size: 0x8E
	Parameters: 3
	Flags: None
*/
function register_lost_perk_override(name, lost_perk_override_func, lost_perk_override_func_always_run)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	level.bgb[name].lost_perk_override_func = lost_perk_override_func;
	level.bgb[name].lost_perk_override_func_always_run = lost_perk_override_func_always_run;
}

/*
	Name: function_c2721e81
	Namespace: bgb
	Checksum: 0x10C318AD
	Offset: 0x3FD0
	Size: 0x8E
	Parameters: 3
	Flags: None
*/
function function_c2721e81(name, add_to_player_score_override_func, add_to_player_score_override_func_always_run)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	level.bgb[name].add_to_player_score_override_func = add_to_player_score_override_func;
	level.bgb[name].add_to_player_score_override_func_always_run = add_to_player_score_override_func_always_run;
}

/*
	Name: function_72469efe
	Namespace: bgb
	Checksum: 0x4BCE7E73
	Offset: 0x4068
	Size: 0x6E
	Parameters: 2
	Flags: None
*/
function function_72469efe(name, var_50206ca3)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	level.bgb[name].var_50206ca3 = var_50206ca3;
}

/*
	Name: function_8a5d8cfb
	Namespace: bgb
	Checksum: 0xA816C71A
	Offset: 0x40E0
	Size: 0x6E
	Parameters: 2
	Flags: None
*/
function function_8a5d8cfb(name, var_f1f46d6b)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	level.bgb[name].var_f1f46d6b = var_f1f46d6b;
}

/*
	Name: function_be42abb0
	Namespace: bgb
	Checksum: 0xBD224DB9
	Offset: 0x4158
	Size: 0x6E
	Parameters: 2
	Flags: None
*/
function function_be42abb0(name, var_f8d9ac8c)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	level.bgb[name].var_f8d9ac8c = var_f8d9ac8c;
}

/*
	Name: function_afe7b8e7
	Namespace: bgb
	Checksum: 0xB11A1CFF
	Offset: 0x41D0
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function function_afe7b8e7(name)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	level.bgb[name].var_5a047886 = 1;
}

/*
	Name: function_e1f37ce7
	Namespace: bgb
	Checksum: 0xC06849BB
	Offset: 0x4248
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function function_e1f37ce7(name)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	level.bgb[name].var_4a9b0cdc = 1;
}

/*
	Name: function_1fee6b3
	Namespace: bgb
	Checksum: 0xE0D136CA
	Offset: 0x42C0
	Size: 0x9E
	Parameters: 2
	Flags: None
*/
function function_1fee6b3(name, n_rank)
{
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	/#
		assert(isdefined(n_rank), ("" + name) + "");
	#/
	level.bgb[name].var_a1750d43 = n_rank;
}

/*
	Name: give
	Namespace: bgb
	Checksum: 0x748973DB
	Offset: 0x4368
	Size: 0x224
	Parameters: 1
	Flags: Linked
*/
function give(name)
{
	self thread take();
	if(#"none" == name)
	{
		return;
	}
	/#
		assert(isdefined(level.bgb[name]), ("" + name) + "");
	#/
	self notify(#"bgb_update", {#hash_826ddd38:self.bgb, #hash_3aee8e4:name});
	self notify("bgb_update_give_" + name);
	self.bgb = name;
	self clientfield::set_player_uimodel("zmhud.bgb_current", level.bgb[name].item_index);
	self luinotifyevent(#"zombie_bgb_notification", 1, level.bgb[name].item_index);
	self luinotifyeventtospectators(#"zombie_bgb_notification", 1, level.bgb[name].item_index);
	if(isdefined(level.bgb[name].enable_func))
	{
		self thread [[level.bgb[name].enable_func]]();
	}
	if(isdefined("activated" == level.bgb[name].limit_type))
	{
		self setactionslot(1, "bgb");
	}
	self thread bgb_limit_monitor();
	self thread bgb_bled_out_monitor();
}

/*
	Name: take
	Namespace: bgb
	Checksum: 0x679119F6
	Offset: 0x4598
	Size: 0x132
	Parameters: 0
	Flags: Linked
*/
function take()
{
	if(#"none" == self.bgb)
	{
		return;
	}
	self setactionslot(1, "");
	/#
		self thread bgb_set_debug_text(#"none");
	#/
	if(isdefined(level.bgb[self.bgb].disable_func))
	{
		self thread [[level.bgb[self.bgb].disable_func]]();
	}
	self bgb_clear_monitors_and_clientfields();
	self notify(#"bgb_update", {#hash_826ddd38:self.bgb, #hash_3aee8e4:#"none"});
	self notify("bgb_update_take_" + self.bgb);
	self.bgb = #"none";
}

/*
	Name: get_enabled
	Namespace: bgb
	Checksum: 0xEA851429
	Offset: 0x46D8
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function get_enabled()
{
	if(isplayer(self) && isdefined(self.bgb))
	{
		return self.bgb;
	}
	return #"none";
}

/*
	Name: is_enabled
	Namespace: bgb
	Checksum: 0xCC9FB264
	Offset: 0x4730
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function is_enabled(name)
{
	if(!is_true(level.bgb_in_use))
	{
		return 0;
	}
	/#
		assert(isdefined(self.bgb), "");
	#/
	if(!isdefined(self) || !isdefined(self.bgb))
	{
		return 0;
	}
	return self.bgb === name;
}

/*
	Name: any_enabled
	Namespace: bgb
	Checksum: 0x487C5449
	Offset: 0x47B8
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function any_enabled()
{
	/#
		assert(isdefined(self.bgb));
	#/
	return self.bgb !== #"none";
}

/*
	Name: is_team_enabled
	Namespace: bgb
	Checksum: 0xE644E6E8
	Offset: 0x4800
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function is_team_enabled(bgb_name)
{
	foreach(player in getplayers())
	{
		/#
			assert(isdefined(player.bgb));
		#/
		if(player.bgb === bgb_name)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: get_player_dropped_powerup_origin
	Namespace: bgb
	Checksum: 0xAD67D12E
	Offset: 0x48D0
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function get_player_dropped_powerup_origin()
{
	powerup_origin = (self.origin + vectorscale(anglestoforward((0, self getplayerangles()[1], 0)), 60)) + vectorscale((0, 0, 1), 5);
	self zm_stats::increment_challenge_stat(#"gum_gobbler_powerups");
	return powerup_origin;
}

/*
	Name: function_c6cd71d5
	Namespace: bgb
	Checksum: 0x35DFDFB2
	Offset: 0x4960
	Size: 0xBC
	Parameters: 3
	Flags: None
*/
function function_c6cd71d5(str_powerup, v_origin, var_22a4c702)
{
	if(!isdefined(var_22a4c702))
	{
		var_22a4c702 = self get_player_dropped_powerup_origin();
	}
	e_powerup = zm_powerups::specific_powerup_drop(v_origin, var_22a4c702, undefined, 0.1, undefined, undefined, 1, 1, 1, 1);
	e_powerup.var_2b5ec373 = self;
	if(isplayer(self))
	{
		self zm_stats::increment_challenge_stat(#"hash_3ebae93ea866519c");
	}
}

/*
	Name: function_9d8118f5
	Namespace: bgb
	Checksum: 0x11BEA2F0
	Offset: 0x4A28
	Size: 0x238
	Parameters: 1
	Flags: None
*/
function function_9d8118f5(v_origin)
{
	if(!self isonground() && !self isplayerswimming())
	{
		return 0;
	}
	if(!isdefined(v_origin))
	{
		v_origin = self get_player_dropped_powerup_origin();
	}
	var_116b3a00 = 1;
	var_806b07bd = util::spawn_model("tag_origin", v_origin + (0, 0, 40));
	v_origin = var_806b07bd.origin;
	if(isdefined(var_806b07bd) && (!var_806b07bd zm_player::in_enabled_playable_area(96) && !var_806b07bd zm_player::in_life_brush()))
	{
		var_116b3a00 = 0;
	}
	if(self zm_utility::function_ab9a9770() || var_806b07bd zm_utility::function_ab9a9770())
	{
		var_116b3a00 = 0;
	}
	v_close = getclosestpointonnavmesh(v_origin, 128, 24);
	if(var_116b3a00 && (!isdefined(v_close) || (v_close[2] - v_origin[2]) > (40 / 4)) && !self isplayerswimming())
	{
		var_116b3a00 = 0;
	}
	if(var_116b3a00 && !is_true(bullettracepassed(self geteye(), v_origin, 0, self, undefined, 0, 1)))
	{
		var_116b3a00 = 0;
	}
	if(isdefined(var_806b07bd))
	{
		var_806b07bd delete();
	}
	return var_116b3a00;
}

/*
	Name: actor_damage_override
	Namespace: bgb
	Checksum: 0x674CE618
	Offset: 0x4C68
	Size: 0x132
	Parameters: 13
	Flags: Linked
*/
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(isplayer(attacker))
	{
		name = attacker get_enabled();
		if(name !== #"none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].actor_damage_override_func))
		{
			damage = [[level.bgb[name].actor_damage_override_func]](inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
		}
	}
	return damage;
}

/*
	Name: vehicle_damage_override
	Namespace: bgb
	Checksum: 0xF9027344
	Offset: 0x4DA8
	Size: 0x16E
	Parameters: 16
	Flags: Linked
*/
function vehicle_damage_override(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(!is_true(level.bgb_in_use))
	{
		return idamage;
	}
	if(isplayer(eattacker))
	{
		name = eattacker get_enabled();
		if(name !== #"none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].vehicle_damage_override_func))
		{
			idamage = [[level.bgb[name].vehicle_damage_override_func]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
		}
	}
	return idamage;
}

/*
	Name: actor_death_override
	Namespace: bgb
	Checksum: 0x8898EE99
	Offset: 0x4F20
	Size: 0xDA
	Parameters: 1
	Flags: Linked
*/
function actor_death_override(attacker)
{
	if(!is_true(level.bgb_in_use))
	{
		return 0;
	}
	if(isplayer(attacker))
	{
		name = attacker get_enabled();
		if(name !== #"none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].actor_death_override_func))
		{
			damage = [[level.bgb[name].actor_death_override_func]](attacker);
		}
	}
	return damage;
}

/*
	Name: lost_perk_override
	Namespace: bgb
	Checksum: 0xBB77C787
	Offset: 0x5008
	Size: 0x218
	Parameters: 1
	Flags: Linked
*/
function lost_perk_override(perk)
{
	b_result = 0;
	if(!is_true(level.bgb_in_use))
	{
		return b_result;
	}
	keys = getarraykeys(level.bgb);
	for(i = 0; i < keys.size; i++)
	{
		name = keys[i];
		if(is_true(level.bgb[name].lost_perk_override_func_always_run) && isdefined(level.bgb[name].lost_perk_override_func))
		{
			b_result = [[level.bgb[name].lost_perk_override_func]](perk, self, undefined);
			if(b_result)
			{
				return b_result;
			}
		}
	}
	foreach(player in function_a1ef346b())
	{
		name = player get_enabled();
		if(name !== #"none" && isdefined(level.bgb[name]) && isdefined(level.bgb[name].lost_perk_override_func))
		{
			b_result = [[level.bgb[name].lost_perk_override_func]](perk, self, player);
			if(b_result)
			{
				return b_result;
			}
		}
	}
	return b_result;
}

/*
	Name: add_to_player_score_override
	Namespace: bgb
	Checksum: 0x521562A5
	Offset: 0x5228
	Size: 0x1A2
	Parameters: 2
	Flags: Linked
*/
function add_to_player_score_override(n_points, str_awarded_by)
{
	if(!is_true(level.bgb_in_use))
	{
		return n_points;
	}
	str_enabled = self get_enabled();
	keys = getarraykeys(level.bgb);
	for(i = 0; i < keys.size; i++)
	{
		str_bgb = keys[i];
		if(str_bgb === str_enabled)
		{
			continue;
		}
		if(is_true(level.bgb[str_bgb].add_to_player_score_override_func_always_run) && isdefined(level.bgb[str_bgb].add_to_player_score_override_func))
		{
			n_points = [[level.bgb[str_bgb].add_to_player_score_override_func]](n_points, str_awarded_by, 0);
		}
	}
	if(str_enabled !== #"none" && isdefined(level.bgb[str_enabled]) && isdefined(level.bgb[str_enabled].add_to_player_score_override_func))
	{
		n_points = [[level.bgb[str_enabled].add_to_player_score_override_func]](n_points, str_awarded_by, 1);
	}
	return n_points;
}

/*
	Name: function_3fa57f3f
	Namespace: bgb
	Checksum: 0x3B313DB6
	Offset: 0x53D8
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_3fa57f3f()
{
	keys = array::randomize(getarraykeys(level.bgb));
	for(i = 0; i < keys.size; i++)
	{
		if(level.bgb[keys[i]].rarity != 1)
		{
			continue;
		}
		if(level.bgb[keys[i]].dlc_index > 0)
		{
			continue;
		}
		return keys[i];
	}
}

/*
	Name: function_f51e3503
	Namespace: bgb
	Checksum: 0x13CF579E
	Offset: 0x5490
	Size: 0x20A
	Parameters: 3
	Flags: None
*/
function function_f51e3503(n_max_distance, var_5250f4f6, var_8bc18989)
{
	self endon(#"disconnect", #"bled_out", #"bgb_update");
	self.var_9c42f3fe = [];
	while(true)
	{
		foreach(e_player in level.players)
		{
			if(e_player == self)
			{
				continue;
			}
			arrayremovevalue(self.var_9c42f3fe, undefined);
			var_fd14be26 = array::contains(self.var_9c42f3fe, e_player);
			var_d9cac58e = zm_utility::is_player_valid(e_player, 0, 1) && function_b70b2809(n_max_distance, self, e_player);
			if(!var_fd14be26 && var_d9cac58e)
			{
				array::add(self.var_9c42f3fe, e_player, 0);
				if(isdefined(var_5250f4f6))
				{
					self thread [[var_5250f4f6]](e_player);
				}
				continue;
			}
			if(var_fd14be26 && !var_d9cac58e)
			{
				arrayremovevalue(self.var_9c42f3fe, e_player);
				if(isdefined(var_8bc18989))
				{
					self thread [[var_8bc18989]](e_player);
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_b70b2809
	Namespace: bgb
	Checksum: 0x9B36F1CA
	Offset: 0x56A8
	Size: 0x70
	Parameters: 3
	Flags: Linked, Private
*/
function private function_b70b2809(n_distance, var_7b235bec, var_f8084a8)
{
	var_8c1c6c8d = n_distance * n_distance;
	var_a91ae6d4 = distancesquared(var_7b235bec.origin, var_f8084a8.origin);
	if(var_a91ae6d4 <= var_8c1c6c8d)
	{
		return true;
	}
	return false;
}

/*
	Name: function_b57e693f
	Namespace: bgb
	Checksum: 0xE71E64F1
	Offset: 0x5720
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_b57e693f()
{
	self clientfield::increment_uimodel("zmhud.bgb_invalid_use");
}

/*
	Name: suspend_weapon_cycling
	Namespace: bgb
	Checksum: 0x98E12738
	Offset: 0x5750
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function suspend_weapon_cycling()
{
	self flag::clear("bgb_weapon_cycling");
}

/*
	Name: resume_weapon_cycling
	Namespace: bgb
	Checksum: 0x65D22F22
	Offset: 0x5780
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function resume_weapon_cycling()
{
	self flag::set("bgb_weapon_cycling");
}

/*
	Name: init_weapon_cycling
	Namespace: bgb
	Checksum: 0xD73F02B4
	Offset: 0x57B0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function init_weapon_cycling()
{
	if(!self flag::exists("bgb_weapon_cycling"))
	{
		self flag::init("bgb_weapon_cycling");
	}
	self flag::set("bgb_weapon_cycling");
}

/*
	Name: function_303bde69
	Namespace: bgb
	Checksum: 0xE462EB2
	Offset: 0x5820
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_303bde69()
{
	self flag::wait_till("bgb_weapon_cycling");
}

/*
	Name: function_bd839f2c
	Namespace: bgb
	Checksum: 0xC2828E9B
	Offset: 0x5850
	Size: 0x13C
	Parameters: 2
	Flags: None
*/
function function_bd839f2c(e_reviver, var_84280a99)
{
	if(is_true(self.var_bdeb0f02) || (isdefined(e_reviver) && (isdefined(self.bgb) && self is_enabled(#"zm_bgb_near_death_experience"))) || (isdefined(e_reviver) && isdefined(e_reviver.bgb) && e_reviver is_enabled(#"zm_bgb_near_death_experience")) || (isdefined(e_reviver) && (isdefined(self.bgb) && self is_enabled(#"zm_bgb_phoenix_up"))) || (isdefined(e_reviver) && isdefined(e_reviver.bgb) && e_reviver is_enabled(#"zm_bgb_phoenix_up")) || isdefined(var_84280a99))
	{
		return true;
	}
	return false;
}

/*
	Name: bgb_revive_watcher
	Namespace: bgb
	Checksum: 0x2693C2ED
	Offset: 0x5998
	Size: 0x9E
	Parameters: 0
	Flags: None
*/
function bgb_revive_watcher()
{
	self endon(#"death");
	self.var_bdeb0f02 = 1;
	waitresult = undefined;
	waitresult = self waittill(#"player_revived");
	e_reviver = waitresult.reviver;
	waitframe(1);
	if(is_true(self.var_bdeb0f02))
	{
		self notify(#"bgb_revive");
		self.var_bdeb0f02 = undefined;
	}
}

/*
	Name: function_69b88b5
	Namespace: bgb
	Checksum: 0x9DDFEF18
	Offset: 0x5A40
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function function_69b88b5()
{
	if(!is_true(self.ready_for_score_events))
	{
		return false;
	}
	return true;
}

