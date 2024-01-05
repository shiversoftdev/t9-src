#using scripts\core_common\clientfield_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_custom;

/*
	Name: function_d776b402
	Namespace: zm_custom
	Checksum: 0x4CB13844
	Offset: 0x5A8
	Size: 0x4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_d776b402()
{
}

/*
	Name: function_901b751c
	Namespace: zm_custom
	Checksum: 0x9571D70C
	Offset: 0x7E8
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_901b751c(var_c9db62d5)
{
	if(var_c9db62d5 === "")
	{
		return undefined;
	}
	setting = getgametypesetting(var_c9db62d5);
	/#
		/#
			assert(isdefined(setting), ("" + function_9e72a96(var_c9db62d5)) + "");
		#/
	#/
	return setting;
}

/*
	Name: function_16020b98
	Namespace: zm_custom
	Checksum: 0x9E394FBB
	Offset: 0x878
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function function_16020b98(var_c9db62d5)
{
	a_s_defaults = function_a8e9a6c7();
	foreach(s_setting in a_s_defaults)
	{
		if(var_c9db62d5 == s_setting.name)
		{
			return s_setting.default_val;
		}
	}
	return undefined;
}

/*
	Name: function_9be9c072
	Namespace: zm_custom
	Checksum: 0x68FB545F
	Offset: 0x938
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_9be9c072(var_c9db62d5)
{
	foreach(e_player in level.players)
	{
		e_player val::set(#"game_end", "freezecontrols", 1);
	}
	level notify(#"end_game");
}

/*
	Name: function_8b8fa6e5
	Namespace: zm_custom
	Checksum: 0xF70D8DBB
	Offset: 0xA00
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_8b8fa6e5(e_player)
{
	foreach(str_perk in level.var_b8be892e)
	{
		if(!e_player hasperk(str_perk))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_928be07c
	Namespace: zm_custom
	Checksum: 0x4819B588
	Offset: 0xAB0
	Size: 0x292
	Parameters: 1
	Flags: Linked
*/
function function_928be07c(var_6a59aecf)
{
	if(isdefined(var_6a59aecf))
	{
		var_7df0eb2d = var_6a59aecf;
		level.friendlyfire = var_6a59aecf;
		setgametypesetting(#"zmfriendlyfiretype", var_6a59aecf);
		setdvar(#"ui_friendlyfire", var_6a59aecf);
	}
	else
	{
		var_7df0eb2d = function_901b751c(#"zmfriendlyfiretype");
	}
	switch(var_7df0eb2d)
	{
		case 0:
		{
			zm_player::function_a8846426(&function_e57809dd);
			zm_player::function_a8846426(&function_4225c3b7);
			zm_player::function_a8846426(&function_6607cdee);
			break;
		}
		case 1:
		{
			zm_player::function_a8846426(&function_4225c3b7);
			zm_player::function_a8846426(&function_6607cdee);
			zm_player::register_player_friendly_fire_callback(&function_e57809dd);
			break;
		}
		case 2:
		{
			zm_player::function_a8846426(&function_e57809dd);
			zm_player::function_a8846426(&function_6607cdee);
			zm_player::register_player_friendly_fire_callback(&function_4225c3b7);
			break;
		}
		case 3:
		{
			zm_player::function_a8846426(&function_e57809dd);
			zm_player::function_a8846426(&function_4225c3b7);
			zm_player::register_player_friendly_fire_callback(&function_6607cdee);
			break;
		}
	}
}

/*
	Name: function_ff4557dc
	Namespace: zm_custom
	Checksum: 0x7450FC7B
	Offset: 0xD50
	Size: 0xC86
	Parameters: 1
	Flags: None
*/
function function_ff4557dc(s_talisman)
{
	if(!function_901b751c(#"zmtalismansenabled"))
	{
		return false;
	}
	switch(s_talisman.name)
	{
		case "talisman_box_guarantee_box_only":
		{
			if(!function_901b751c(#"zmtalismanboxguaranteeboxonly") || function_901b751c(#"hash_4e0ec3fe56f08b47") == 0)
			{
				return false;
			}
			break;
		}
		case "talisman_box_guarantee_lmg":
		{
			if(!function_901b751c(#"zmtalismanboxguaranteelmg") || !function_901b751c(#"zmweaponslmg") || function_901b751c(#"hash_4e0ec3fe56f08b47") == 0)
			{
				return false;
			}
			break;
		}
		case "talisman_coagulant":
		{
			if(!function_901b751c(#"zmtalismancoagulant"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_claymore":
		{
			if(!function_901b751c(#"zmtalismanextraclaymore"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_frag":
		{
			if(!function_901b751c(#"zmtalismanextrafrag"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_miniturret":
		{
			if(!function_901b751c(#"zmtalismanextraminiturret"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_molotov":
		{
			if(!function_901b751c(#"zmtalismanextramolotov"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_semtex":
		{
			if(!function_901b751c(#"zmtalismanextrasemtex"))
			{
				return false;
			}
			break;
		}
		case "talisman_impatient":
		{
			if(!function_901b751c(#"zmtalismanimpatient"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_mod_single":
		{
			if(!function_901b751c(#"zmtalismanperkmodsingle"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_permanent_1":
		{
			if(!function_901b751c(#"zmtalismanperkpermanent1") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_permanent_2":
		{
			if(!function_901b751c(#"zmtalismanperkpermanent2") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_permanent_3":
		{
			if(!function_901b751c(#"zmtalismanperkpermanent3") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_permanent_4":
		{
			if(!function_901b751c(#"zmtalismanperkpermanent4") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_reducecost_1":
		{
			if(!function_901b751c(#"zmtalismanperkreducecost1") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_reducecost_2":
		{
			if(!function_901b751c(#"zmtalismanperkreducecost2") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_reducecost_3":
		{
			if(!function_901b751c(#"zmtalismanperkreducecost3") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_reducecost_4":
		{
			if(!function_901b751c(#"zmtalismanperkreducecost4") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_start_1":
		{
			if(!function_901b751c(#"zmtalismanperkstart1") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_start_2":
		{
			if(!function_901b751c(#"zmtalismanperkstart2") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_start_3":
		{
			if(!function_901b751c(#"zmtalismanperkstart3") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_perk_start_4":
		{
			if(!function_901b751c(#"zmtalismanperkstart4") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "talisman_shield_durability_legendary":
		{
			if(!function_901b751c(#"zmtalismanshielddurabilitylegendary") || !function_901b751c(#"zmshieldisenabled"))
			{
				return false;
			}
			break;
		}
		case "talisman_shield_durability_rare":
		{
			if(!function_901b751c(#"zmtalismanshielddurabilityrare") || !function_901b751c(#"zmshieldisenabled"))
			{
				return false;
			}
			break;
		}
		case "talisman_shield_price":
		{
			if(!function_901b751c(#"zmtalismanshieldprice") || !function_901b751c(#"zmshieldisenabled"))
			{
				return false;
			}
			break;
		}
		case "talisman_special_startlv2":
		{
			if(!function_901b751c(#"zmtalismanspecialstartlvl2"))
			{
				return false;
			}
			break;
		}
		case "talisman_special_startlv3":
		{
			if(!function_901b751c(#"zmtalismanspecialstartlvl3"))
			{
				return false;
			}
			break;
		}
		case "talisman_special_xp_rate":
		{
			if(!function_901b751c(#"zmtalismanspecialxprate"))
			{
				return false;
			}
			break;
		}
		case "talisman_start_weapon_ar":
		{
			if(!function_901b751c(#"zmtalismanstartweaponar"))
			{
				return false;
			}
			break;
		}
		case "talisman_start_weapon_lmg":
		{
			if(!function_901b751c(#"zmtalismanstartweaponlmg"))
			{
				return false;
			}
			break;
		}
		case "talisman_start_weapon_smg":
		{
			if(!function_901b751c(#"zmtalismanstartweaponsmg"))
			{
				return false;
			}
			break;
		}
		case "talisman_weapon_reducepapcost":
		{
			if(!function_901b751c(#"zmtalismanreducepapcost"))
			{
				return false;
			}
			break;
		}
		case "talisman_permanent_heroweap_armor":
		{
			if(!function_901b751c(#"zmtalismanpermanentheroweaparmor"))
			{
				return false;
			}
			break;
		}
		case "talisman_extra_self_revive":
		{
			if(!function_901b751c(#"zmtalismanextraselfrevive"))
			{
				return false;
			}
			break;
		}
		default:
		{
			break;
		}
	}
	if(isdefined(s_talisman.rarity))
	{
		switch(s_talisman.rarity)
		{
			case 0:
			{
				if(!function_901b751c(#"zmtalismanscommon"))
				{
					return false;
				}
				break;
			}
			case 1:
			{
				if(!function_901b751c(#"zmtalismansrare"))
				{
					return false;
				}
				break;
			}
			case 2:
			{
				if(!function_901b751c(#"zmtalismanslegendary"))
				{
					return false;
				}
				break;
			}
			case 3:
			{
				if(!function_901b751c(#"zmtalismansepic"))
				{
					return false;
				}
				break;
			}
			case 4:
			{
				if(!function_901b751c(#"zmtalismansultra"))
				{
					return false;
				}
				break;
			}
			default:
			{
				break;
			}
		}
	}
	return true;
}

/*
	Name: function_3ac936c6
	Namespace: zm_custom
	Checksum: 0x13B3BD4F
	Offset: 0x19E0
	Size: 0x15AE
	Parameters: 1
	Flags: Linked
*/
function function_3ac936c6(var_ce5ed2e9)
{
	if(!isdefined(var_ce5ed2e9) || var_ce5ed2e9 == "" || !function_901b751c(#"zmelixirsenabled"))
	{
		return false;
	}
	n_index = getitemindexfromref(var_ce5ed2e9);
	s_fields = function_b143666d(n_index, 2);
	if(isdefined(s_fields) && isdefined(s_fields.bgbrarity))
	{
		n_rarity = s_fields.bgbrarity;
	}
	if(!isdefined(n_rarity))
	{
		n_rarity = 0;
	}
	switch(var_ce5ed2e9)
	{
		case "zm_bgb_always_done_swiftly":
		{
			if(!function_901b751c(#"zmelixiralwaysdoneswiftly"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_anywhere_but_here":
		{
			if(!function_901b751c(#"zmelixiranywherebuthere"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_arsenal_accelerator":
		{
			if(!function_901b751c(#"zmelixirarsenalaccelerator") || !function_901b751c(#"zmspecweaponisenabled"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_danger_closest":
		{
			if(!function_901b751c(#"zmelixirdangerclosest"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_in_plain_sight":
		{
			if(!function_901b751c(#"zmelixirinplainsight"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_newtonian_negation":
		{
			if(!function_901b751c(#"zmelixirnewtoniannegation"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_now_you_see_me":
		{
			if(!function_901b751c(#"zmelixirnowyouseeme"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_stock_option":
		{
			if(!function_901b751c(#"zmelixirstockoption"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_board_games":
		{
			if(!function_901b751c(#"zmelixirboardgames") || !function_901b751c(#"zmbarricadestate"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_burned_out":
		{
			if(!function_901b751c(#"zmelixirburnedout"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_crawl_space":
		{
			if(!function_901b751c(#"zmelixircrawlspace") || function_901b751c(#"zmcrawlerstate") == 0)
			{
				return false;
			}
			break;
		}
		case "zm_bgb_pop_shocks":
		{
			if(!function_901b751c(#"zmelixirpopshocks"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_temporal_gift":
		{
			if(!function_901b751c(#"zmelixirtemporalgift") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_point_drops":
		{
			if(!function_901b751c(#"zmelixirpointdrops") || !function_901b751c(#"zmpowerupchaospoints") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_alchemical_antithesis":
		{
			if(!function_901b751c(#"zmelixiralchemicalantithesis") || function_901b751c(#"zmpointsfixed"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_sword_flay":
		{
			if(!function_901b751c(#"zmelixirswordflay") || !function_901b751c(#"zmweaponsmelee"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_dead_of_nuclear_winter":
		{
			if(!function_901b751c(#"zmelixirdeadofnuclearwinter") || !function_901b751c(#"zmpowerupnuke") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_licensed_contractor":
		{
			if(!function_901b751c(#"zmelixirlicensedcontractor") || !function_901b751c(#"zmpowerupcarpenter") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_undead_man_walking":
		{
			if(!function_901b751c(#"zmelixirundeadmanwalking"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_whos_keeping_score":
		{
			if(!function_901b751c(#"zmelixirwhoskeepingscore") || !function_901b751c(#"zmpowerupdouble") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_aftertaste":
		{
			if(!function_901b751c(#"zmelixiraftertaste"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_extra_credit":
		{
			if(!function_901b751c(#"zmelixirextracredit") || !function_901b751c(#"zmpowerupchaospoints") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_kill_joy":
		{
			if(!function_901b751c(#"zmelixirkilljoy") || !function_901b751c(#"zmpowerupinstakill") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_soda_fountain":
		{
			if(!function_901b751c(#"zmelixirsodafountain") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_ctrl_z":
		{
			if(!function_901b751c(#"zmelixirctrlz"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_free_fire":
		{
			if(!function_901b751c(#"zmelixirfreefire"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_cache_back":
		{
			if(!function_901b751c(#"zmelixircacheback") || !function_901b751c(#"zmpowerupmaxammo") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_immolation_liquidation":
		{
			if(!function_901b751c(#"zmelixirimmolationliquidation") || !function_901b751c(#"zmpowerupfiresale") || !function_901b751c(#"zmpowerupsactive") || function_901b751c(#"hash_4e0ec3fe56f08b47") == 0)
			{
				return false;
			}
			break;
		}
		case "zm_bgb_phoenix_up":
		{
			if(!function_901b751c(#"zmelixirphoenixup") || !function_901b751c(#"zmlaststandduration"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_power_keg":
		{
			if(!function_901b751c(#"zmelixirpowerkeg") || !function_901b751c(#"zmspecweaponisenabled") || !function_901b751c(#"zmpowerupspecialweapon") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_blood_debt":
		{
			if(!function_901b751c(#"zmelixirblooddebt"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_near_death_experience":
		{
			if(!function_901b751c(#"zmelixirneardeathexperience"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_perkaholic":
		{
			if(!function_901b751c(#"zmelixirperkaholic") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_wall_power":
		{
			if(!function_901b751c(#"zmelixirwallpower") || function_901b751c(#"zmpapenabled") == 0)
			{
				return false;
			}
			break;
		}
		case "zm_bgb_anti_entrapment":
		{
			if(!function_901b751c(#"zmelixirantientrapment"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_equip_mint":
		{
			if(!function_901b751c(#"zmelixirequipmint"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_head_scan":
		{
			if(!function_901b751c(#"zmelixirheadscan"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_join_the_party":
		{
			if(!function_901b751c(#"zmelixirjointheparty"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_nowhere_but_there":
		{
			if(!function_901b751c(#"zmelixirnowherebutthere"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_phantom_reload":
		{
			if(!function_901b751c(#"zmelixirphantomreload"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_shields_up":
		{
			if(!function_901b751c(#"zmelixirshieldsup") || !function_901b751c("zmShieldIsEnabled"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_wall_to_wall_clearance":
		{
			if(!function_901b751c(#"zmelixirwalltowall"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_conflagration_liquidation":
		{
			if(!function_901b751c(#"zmelixirconflagrationliquidation") || function_901b751c(#"zmpapenabled") == 0)
			{
				return false;
			}
			break;
		}
		case "zm_bgb_perk_up":
		{
			if(!function_901b751c(#"zmelixirperkup") || !function_901b751c(#"zmperksactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_refresh_mint":
		{
			if(!function_901b751c(#"zmelixirrefreshmint") || (!function_901b751c(#"zmequipmentisenabled") && !function_901b751c(#"zmspecweaponisenabled")))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_dividend_yield":
		{
			if(!function_901b751c(#"zmelixirdividendyield"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_suit_up":
		{
			if(!function_901b751c(#"zmelixirsuitup"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_talkin_bout_regeneration":
		{
			if(!function_901b751c(#"zmelixirtalkinboutregeneration"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_bullet_boost":
		{
			if(!function_901b751c(#"zmelixirbulletboost"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_quacknarok":
		{
			if(!function_901b751c(#"zmelixirquacknarok"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_near_death_experience":
		{
			if(!function_901b751c(#"zmelixirneardeathexperience"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_shopping_free":
		{
			if(!function_901b751c(#"zmelixirshoppingfree"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_phoenix_up":
		{
			if(!function_901b751c(#"zmelixirphoenixup"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_perkaholic":
		{
			if(!function_901b751c(#"zmelixirperkaholic"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_reign_drops":
		{
			if(!function_901b751c(#"zmelixirreigndrops") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_head_drama":
		{
			if(!function_901b751c(#"zmelixirheaddrama"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_power_vacuum":
		{
			if(!function_901b751c(#"zmelixirpowervacuum") || !function_901b751c(#"zmpowerupsactive"))
			{
				return false;
			}
			break;
		}
		case "zm_bgb_secret_shopper":
		{
			if(!function_901b751c(#"zmelixirsecretshopper") || !function_901b751c(#"zmwallbuysenabled"))
			{
				return false;
			}
			break;
		}
		default:
		{
			break;
		}
	}
	switch(n_rarity)
	{
		case 0:
		{
			if(!function_901b751c(#"hash_3ab7cedcfef7eacc"))
			{
				return false;
			}
			break;
		}
		case 2:
		{
			if(!function_901b751c(#"zmelixirscommon"))
			{
				return false;
			}
			break;
		}
		case 3:
		{
			if(!function_901b751c(#"zmelixirsrare"))
			{
				return false;
			}
			break;
		}
		case 5:
		{
			if(!function_901b751c(#"zmelixirsepic"))
			{
				return false;
			}
			break;
		}
		case 4:
		{
			if(!function_901b751c(#"zmelixirslegendary"))
			{
				return false;
			}
			break;
		}
		default:
		{
			break;
		}
	}
	return true;
}

/*
	Name: function_bce642a1
	Namespace: zm_custom
	Checksum: 0x5FD4C1A3
	Offset: 0x2F98
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function function_bce642a1(s_weap)
{
	if(s_weap.itemgroupname === "weapon_cqb" && !function_901b751c(#"zmweaponsshotgun") || (s_weap.itemgroupname === "weapon_smg" && !function_901b751c(#"zmweaponssmg")) || (s_weap.itemgroupname === "weapon_assault" && !function_901b751c(#"zmweaponsar")) || (s_weap.itemgroupname === "weapon_tactical" && !function_901b751c(#"zmweaponstr")) || (s_weap.itemgroupname === "weapon_lmg" && !function_901b751c(#"zmweaponslmg")) || (s_weap.itemgroupname === "weapon_sniper" && !function_901b751c(#"zmweaponssniper")))
	{
		return false;
	}
	return true;
}

/*
	Name: function_d9f0defb
	Namespace: zm_custom
	Checksum: 0x10DE8468
	Offset: 0x3138
	Size: 0x496
	Parameters: 1
	Flags: None
*/
function function_d9f0defb(str_perk)
{
	if(!isdefined(str_perk) || !function_901b751c(#"zmperksactive"))
	{
		return false;
	}
	switch(str_perk)
	{
		case "hash_47d7a8105237c88":
		{
			if(!function_901b751c(#"zmperksjuggernaut"))
			{
				return false;
			}
			break;
		}
		case "hash_5930cf0eb070e35a":
		{
			if(!function_901b751c(#"zmperksspeed"))
			{
				return false;
			}
			break;
		}
		case "hash_7f98b3dd3cce95aa":
		{
			if(!function_901b751c(#"zmperksquickrevive"))
			{
				return false;
			}
			break;
		}
		case "specialty_widowswine":
		{
			if(!function_901b751c(#"hash_557e3edd7fe168c3"))
			{
				return false;
			}
			break;
		}
		case "hash_602a1b6107105f07":
		{
			if(!function_901b751c(#"zmperksstaminup"))
			{
				return false;
			}
			break;
		}
		case "specialty_additionalprimaryweapon":
		{
			if(!function_901b751c(#"zmperksmulekick"))
			{
				return false;
			}
			break;
		}
		case "specialty_electriccherry":
		{
			if(!function_901b751c(#"zmperkselectricburst"))
			{
				return false;
			}
			break;
		}
		case "hash_210097a75bb6c49a":
		{
			if(!function_901b751c(#"zmperksdeadshot"))
			{
				return false;
			}
			break;
		}
		case "specialty_cooldown":
		{
			if(!function_901b751c(#"zmperkscooldown"))
			{
				return false;
			}
			break;
		}
		case "specialty_berserker":
		{
			if(!function_901b751c(#"zmperksdyingwish"))
			{
				return false;
			}
			break;
		}
		case "specialty_phdflopper":
		{
			if(!function_901b751c(#"zmperksphdslider"))
			{
				return false;
			}
			break;
		}
		case "specialty_camper":
		{
			if(!function_901b751c(#"hash_5690c4dcc61973ec"))
			{
				return false;
			}
			break;
		}
		case "specialty_extraammo":
		{
			if(!function_901b751c(#"zmperksbandolier"))
			{
				return false;
			}
			break;
		}
		case "specialty_awareness":
		{
			if(!function_901b751c(#"zmperksdeathperception"))
			{
				return false;
			}
			break;
		}
		case "specialty_shield":
		{
			if(!function_901b751c(#"zmperksvictorious"))
			{
				return false;
			}
			break;
		}
		case "specialty_mystery":
		{
			if(!function_901b751c(#"zmperkssecretsauce"))
			{
				return false;
			}
			break;
		}
		case "specialty_etherealrazor":
		{
			if(!function_901b751c(#"zmperksetherealrazor"))
			{
				return false;
			}
			break;
		}
		case "specialty_zombshell":
		{
			if(!function_901b751c(#"zmperkszombshell"))
			{
				return false;
			}
			break;
		}
		case "specialty_wolf_protector":
		{
			if(!function_901b751c(#"zmperkswolfprotector"))
			{
				return false;
			}
			break;
		}
		default:
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_2717f4b3
	Namespace: zm_custom
	Checksum: 0x4C7B4DC7
	Offset: 0x35D8
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_2717f4b3()
{
	var_17b7891d = "53d3ed6b43743770" + "talismanmsg";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"game_ended");
	self endon(#"disconnect");
	level flag::wait_till("all_players_spawned");
	wait(9);
	self iprintlnbold(#"hash_329de7d3aa04177c");
}

/*
	Name: function_deae84ba
	Namespace: zm_custom
	Checksum: 0x6DCCC2FF
	Offset: 0x3688
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_deae84ba()
{
	var_17b7891d = "b004e24506319a1" + "elixirmsg";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"game_ended");
	self endon(#"disconnect");
	level flag::wait_till("all_players_spawned");
	wait(10);
	self iprintlnbold(#"hash_6d446c2466f066ac");
}

/*
	Name: function_343353f8
	Namespace: zm_custom
	Checksum: 0xFB408A01
	Offset: 0x3738
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_343353f8()
{
	var_17b7891d = "782fe6896ef7bb67" + "weaponmsg";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"game_ended");
	self endon(#"disconnect");
	level flag::wait_till("all_players_spawned");
	wait(8);
	self iprintlnbold(#"hash_1225b8e31a9ffb76");
}

/*
	Name: function_41ed4017
	Namespace: zm_custom
	Checksum: 0x9BD27A48
	Offset: 0x37E8
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_41ed4017()
{
	var_17b7891d = "9762621e9270e3" + "perkmsg";
	self notify(var_17b7891d);
	self endon(var_17b7891d);
	level endon(#"game_ended");
	self endon(#"disconnect");
	level flag::wait_till("all_players_spawned");
	wait(11);
	if(!is_true(level.var_5f7c5b5d))
	{
		self iprintlnbold(#"hash_d77fc2d11c6deb1");
	}
}

/*
	Name: function_928e94b9
	Namespace: zm_custom
	Checksum: 0x50CEBB09
	Offset: 0x38B0
	Size: 0x298
	Parameters: 1
	Flags: None
*/
function function_928e94b9(a_str_archetypes)
{
	foreach(str_archetype in a_str_archetypes)
	{
		str_archetype = hash(str_archetype);
		if(isinarray(array(#"blight_father", #"brutus", #"gegenees", #"mechz", #"hash_7c0d83ac1e845ac2"), str_archetype) && function_901b751c(#"hash_4269e873a0c207c") == 0)
		{
			return true;
		}
		if(isinarray(array(#"stoker", #"gladiator", #"gladiator_marauder", #"gladiator_destroyer", #"werewolf", #"avogadro", #"raz"), str_archetype) && function_901b751c(#"hash_69262a31e0f8f91c") == 0)
		{
			return true;
		}
		if(isinarray(array(#"bat", #"dog", #"zombie_dog", #"zombie"), str_archetype) && function_901b751c(#"hash_4035c12ee5837454") == 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_e1f04ede
	Namespace: zm_custom
	Checksum: 0x657C6EF2
	Offset: 0x3B50
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_e1f04ede()
{
	if(function_901b751c(#"zmpowerupsislimitedround") && level.powerup_drop_count >= function_901b751c(#"hash_d46a4e7a41e005c"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_318d417b
	Namespace: zm_custom
	Checksum: 0xC5AF4152
	Offset: 0x3BB8
	Size: 0x256
	Parameters: 1
	Flags: None
*/
function function_318d417b(e_player)
{
	self endon(#"death");
	e_player endon(#"disconnect");
	if(!zm_perks::vending_trigger_can_player_use(e_player, 1))
	{
		waitframe(1);
		return;
	}
	n_slot = self.stub.script_int;
	n_cost = 2000;
	var_ffc1cdd8 = e_player.var_c27f1e90[n_slot];
	if(!e_player zm_score::can_player_purchase(n_cost))
	{
		self playsound(#"evt_perk_deny");
		e_player zm_audio::create_and_play_dialog(#"general", #"outofmoney");
		waitframe(1);
		return;
	}
	e_player zm_score::minus_to_player_score(n_cost);
	e_player.var_ec426a71 = 1;
	sound = "evt_bottle_dispense";
	playsoundatposition(sound, self.origin);
	var_cc1db3c1 = array::exclude(level.var_b8be892e, e_player.perks_active);
	e_player.var_62fef0f1 = array::random(var_cc1db3c1);
	if(!isdefined(e_player.var_62fef0f1))
	{
		waitframe(1);
		return;
	}
	e_player.var_c27f1e90[n_slot] = e_player.var_62fef0f1;
	e_player notify(#"perk_purchased", {#perk:e_player.var_62fef0f1});
	e_player thread zm_perks::function_4acf7b43(n_slot, e_player.var_62fef0f1);
	self thread zm_perks::taking_cover_tanks_(e_player, e_player.var_62fef0f1, n_slot);
	e_player.var_ec426a71 = 0;
}

/*
	Name: function_8e7a6cf
	Namespace: zm_custom
	Checksum: 0x27CBE889
	Offset: 0x3E18
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function function_8e7a6cf()
{
	if(function_3f3752ab())
	{
		return false;
	}
	return true;
}

/*
	Name: function_3f3752ab
	Namespace: zm_custom
	Checksum: 0xAFB58269
	Offset: 0x3E40
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_3f3752ab()
{
	if(util::get_game_type() != "zclassic")
	{
		return false;
	}
	a_s_defaults = function_a8e9a6c7();
	foreach(s_default in a_s_defaults)
	{
		if(function_901b751c(s_default.name) !== s_default.default_val)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_db030433
	Namespace: zm_custom
	Checksum: 0x2A66254A
	Offset: 0x3F28
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_db030433()
{
	self clientfield::increment_uimodel("zmhud.damage_point_shake");
}

/*
	Name: function_74b79f63
	Namespace: zm_custom
	Checksum: 0xF956E73F
	Offset: 0x3F58
	Size: 0x1054
	Parameters: 0
	Flags: Linked, Private
*/
function private function_74b79f63()
{
	level thread function_214e109e();
	function_cd05a082();
	function_5b526135();
	function_928be07c();
	level waittill(#"all_players_spawned");
	function_7a8180ae();
	wait(5);
	switch(function_901b751c(#"zmdoorstate"))
	{
		case 1:
		default:
		{
			break;
		}
		case 2:
		{
			players = getplayers();
			a_zombie_doors = getentarray("zombie_door", "targetname");
			foreach(door in arraycopy(a_zombie_doors))
			{
				if(isdefined(level.var_f3a008f))
				{
					if(is_true(door [[level.var_f3a008f]]()))
					{
						arrayremovevalue(a_zombie_doors, door);
					}
				}
			}
			if(isdefined(level.var_229f30cd))
			{
				level thread [[level.var_229f30cd]](a_zombie_doors);
			}
			else
			{
				for(i = 0; i < a_zombie_doors.size; i++)
				{
					if(!is_true(a_zombie_doors[i].has_been_opened))
					{
						a_zombie_doors[i] notify(#"trigger", {#is_forced:1});
					}
					waitframe(1);
				}
				var_38a6b7d0 = getentarray("zombie_airlock_buy", "targetname");
				for(i = 0; i < var_38a6b7d0.size; i++)
				{
					var_38a6b7d0[i] notify(#"trigger", {#is_forced:1});
					waitframe(1);
				}
				a_zombie_debris = getentarray("zombie_debris", "targetname");
				for(i = 0; i < a_zombie_debris.size; i++)
				{
					if(isdefined(a_zombie_debris[i]))
					{
						a_zombie_debris[i] notify(#"trigger", {#is_forced:1});
					}
					waitframe(1);
				}
			}
		}
	}
	switch(function_901b751c(#"zmpowerdoorstate"))
	{
		case 1:
		default:
		{
			break;
		}
		case 2:
		{
			a_zombie_doors = getentarray("zombie_door", "targetname");
			foreach(door in a_zombie_doors)
			{
				if(!isdefined(door.script_noteworthy) || !isdefined(door.classname))
				{
					continue;
				}
				if(isdefined(level.var_f3a008f))
				{
					if(is_true(door [[level.var_f3a008f]]()))
					{
						continue;
					}
				}
				if(door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door")
				{
					door thread zm_blockers::door_opened();
					if(isdefined(level.temporary_power_switch_logic))
					{
						door.power_on = 1;
					}
					continue;
				}
				if(door.script_noteworthy === "local_electric_door")
				{
					door thread zm_blockers::door_opened();
				}
			}
		}
	}
	switch(function_901b751c(#"zmpowerstate"))
	{
		case 1:
		{
			break;
		}
		case 2:
		{
			level flag::set("power_on");
			level flag::set(#"hash_3e80d503318a5674");
			if(function_901b751c(#"zmpowerdoorstate") == 1)
			{
				a_zombie_doors = getentarray("zombie_door", "targetname");
				foreach(door in a_zombie_doors)
				{
					if(!isdefined(door.script_noteworthy) || !isdefined(door.classname))
					{
						continue;
					}
					if(isdefined(level.var_f3a008f))
					{
						if(is_true(door [[level.var_f3a008f]]()))
						{
							continue;
						}
					}
					if(door.script_noteworthy == "electric_door" || door.script_noteworthy == "electric_buyable_door")
					{
						door thread zm_blockers::door_opened();
						if(isdefined(level.temporary_power_switch_logic))
						{
							door.power_on = 1;
						}
						continue;
					}
					if(door.script_noteworthy === "local_electric_door")
					{
						door thread zm_blockers::door_opened();
					}
				}
			}
		}
		case 0:
		{
			a_trigs = getentarray("use_elec_switch", "targetname");
			foreach(trig in a_trigs)
			{
				trig notify(#"hash_21e36726a7f30458");
				trig delete();
			}
			break;
		}
		default:
		{
		}
	}
	if(!function_901b751c(#"zmpowerupnuke"))
	{
		zm_powerups::powerup_remove_from_regular_drops("nuke");
	}
	if(!function_901b751c(#"zmpowerupdouble"))
	{
		zm_powerups::powerup_remove_from_regular_drops("double_points");
	}
	if(!function_901b751c(#"zmpowerupinstakill"))
	{
		zm_powerups::powerup_remove_from_regular_drops("insta_kill");
	}
	if(!function_901b751c(#"zmpowerupchaospoints"))
	{
		zm_powerups::powerup_remove_from_regular_drops("bonus_points_player");
		zm_powerups::powerup_remove_from_regular_drops("bonus_points_team");
	}
	if(!function_901b751c(#"zmpowerupfiresale"))
	{
		zm_powerups::powerup_remove_from_regular_drops("fire_sale");
	}
	if(!function_901b751c(#"zmpowerupspecialweapon") || !function_901b751c(#"zmspecweaponisenabled"))
	{
		zm_powerups::powerup_remove_from_regular_drops("hero_weapon_power");
	}
	if(!function_901b751c(#"zmpowerupfreeperk"))
	{
		zm_powerups::powerup_remove_from_regular_drops("free_perk");
	}
	if(!function_901b751c(#"zmpowerupmaxammo"))
	{
		zm_powerups::powerup_remove_from_regular_drops("full_ammo");
	}
	if(!function_901b751c(#"zmpowerupcarpenter"))
	{
		zm_powerups::powerup_remove_from_regular_drops("carpenter");
	}
	if(!isdefined(level.var_cbc6587a))
	{
		level.var_cbc6587a = [];
	}
	foreach(s_weap in level.zombie_weapons)
	{
		if(s_weap.weapon_classname == "pistol" && !function_901b751c(#"zmweaponspistol") || (s_weap.weapon_classname == "shotgun" && !function_901b751c(#"zmweaponsshotgun")) || (s_weap.weapon_classname == "smg" && !function_901b751c(#"zmweaponssmg")) || (s_weap.weapon_classname == "ar" && !function_901b751c(#"zmweaponsar")) || (s_weap.weapon_classname == "tr" && !function_901b751c(#"zmweaponstr")) || (s_weap.weapon_classname == "lmg" && !function_901b751c(#"zmweaponslmg")) || (s_weap.weapon_classname == "sniper" && !function_901b751c(#"zmweaponssniper")) || (s_weap.weapon_classname == "melee" && !function_901b751c(#"zmweaponsknife")) || (s_weap.weapon_classname == "equipment" && !function_901b751c(#"zmequipmentisenabled")))
		{
			if(!isdefined(level.var_cbc6587a))
			{
				level.var_cbc6587a = [];
			}
			else if(!isarray(level.var_cbc6587a))
			{
				level.var_cbc6587a = array(level.var_cbc6587a);
			}
			if(!isinarray(level.var_cbc6587a, s_weap.weapon))
			{
				level.var_cbc6587a[level.var_cbc6587a.size] = s_weap.weapon;
			}
		}
	}
	if(!function_901b751c(#"zmshieldisenabled"))
	{
		foreach(var_b772a844 in array("zblueprint_shield", "zblueprint_shield_dual_wield", "zblueprint_zhield_zword", "zblueprint_shield_spectral_shield"))
		{
			zm_crafting::function_ca244624(hash(var_b772a844));
		}
	}
	if(!function_901b751c(#"zmbarricadestate"))
	{
		level.no_board_repair = 1;
		level flag::wait_till("all_players_spawned");
		zm_blockers::function_22642075();
		level.no_board_repair = 1;
	}
	switch(function_901b751c(#"zmequipmentchargerate"))
	{
		case 1:
		{
			setgametypesetting("scoreEquipmentPowerTimeFactor", 1);
			break;
		}
		case 2:
		{
			setgametypesetting("scoreEquipmentPowerTimeFactor", 2);
			break;
		}
		case 0:
		{
			setgametypesetting("scoreEquipmentPowerTimeFactor", 0.5);
			break;
		}
	}
	level flag::wait_till("all_players_spawned");
}

/*
	Name: function_214e109e
	Namespace: zm_custom
	Checksum: 0x4BCD0704
	Offset: 0x4FB8
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_214e109e()
{
	level waittill(#"start_of_round");
	if(function_901b751c(#"zmroundcap") && function_901b751c(#"startround") > function_901b751c(#"zmroundcap"))
	{
		wait(1);
		function_9be9c072("zmRoundCap");
	}
}

/*
	Name: function_34c2aeb5
	Namespace: zm_custom
	Checksum: 0xB48EE972
	Offset: 0x5068
	Size: 0x5B2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_34c2aeb5()
{
	self endon(#"disconnect");
	player = self;
	level flag::wait_till("all_players_spawned");
	n_regen_delay = function_901b751c(#"zmhealthregendelay");
	n_regen_rate = function_901b751c(#"zmhealthregenrate");
	n_health_on_kill = function_901b751c(#"zmhealthonkill");
	n_health_drain = function_901b751c(#"zmhealthdrain");
	switch(function_901b751c(#"hash_29d174e7d8ab76c8"))
	{
		case 3:
		default:
		{
			var_d75008e3 = 0;
			break;
		}
		case 4:
		{
			var_d75008e3 = 1;
			break;
		}
		case 5:
		{
			var_d75008e3 = 2;
			break;
		}
		case 6:
		{
			var_d75008e3 = 3;
			break;
		}
		case 2:
		{
			var_d75008e3 = -1;
			break;
		}
		case 1:
		{
			var_d75008e3 = -2;
			break;
		}
		case 0:
		{
			var_d75008e3 = -3;
			break;
		}
	}
	n_target = int(max(zombie_utility::function_d2dfacfd(#"player_base_health") + (50 * var_d75008e3), 1));
	n_mod = math::clamp(n_target - player.var_66cb03ad, 0, n_target);
	player player::function_2a67df65(#"custom_settings", n_mod);
	player.var_66cb03ad = n_target;
	player.maxhealth = n_target;
	player setmaxhealth(n_target);
	player zm_utility::set_max_health();
	/#
		println((("" + player.name) + "") + player.var_66cb03ad);
	#/
	switch(n_regen_delay)
	{
		case 0:
		{
			player.n_regen_delay = 2;
			break;
		}
		case 1:
		{
			player.n_regen_delay = zombie_utility::function_d2dfacfd("player_health_regen_delay");
			break;
		}
		case 2:
		{
			player.n_regen_delay = 8;
			break;
		}
	}
	switch(n_regen_rate)
	{
		case 0:
		{
			player.var_44d52546 = 1;
			break;
		}
		case 1:
		{
			player.n_regen_rate = 50;
			break;
		}
		case 2:
		{
			player.n_regen_rate = zombie_utility::function_d2dfacfd("player_health_regen_rate");
			break;
		}
		case 3:
		{
			player.n_regen_rate = 12.5;
			break;
		}
		case 4:
		{
			player.n_regen_rate = 0;
			break;
		}
	}
	switch(n_health_on_kill)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			player.n_health_on_kill = 10;
			break;
		}
		case 2:
		{
			player.n_health_on_kill = 25;
			break;
		}
		case 3:
		{
			player.n_health_on_kill = 50;
			break;
		}
	}
	switch(n_health_drain)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			player thread drain_health(6);
			break;
		}
		case 2:
		{
			player thread drain_health(3);
			break;
		}
		case 3:
		{
			player thread drain_health(1);
			break;
		}
	}
}

/*
	Name: drain_health
	Namespace: zm_custom
	Checksum: 0xC659C14E
	Offset: 0x5628
	Size: 0x190
	Parameters: 1
	Flags: Linked, Private
*/
function private drain_health(var_c454f44e)
{
	self notify(#"hash_13fcb28a561bd5fe");
	self endon(#"disconnect", #"hash_13fcb28a561bd5fe");
	level endon(#"game_ended");
	self val::set(#"custom_games", "health_regen", 0);
	while(zombie_utility::get_current_zombie_count() == 0)
	{
		waitframe(1);
	}
	while(true)
	{
		wait(var_c454f44e);
		if(self.health <= 0 || self laststand::player_is_in_laststand() || is_true(self.var_eb319d10))
		{
			waitframe(1);
			continue;
		}
		if(self.health <= 5)
		{
			if(zm_utility::is_magic_bullet_shield_enabled(self))
			{
				self util::stop_magic_bullet_shield();
			}
			self dodamage(self.health + 1000, self.origin);
		}
		else
		{
			self dodamage(5, self.origin);
		}
	}
}

/*
	Name: function_e57809dd
	Namespace: zm_custom
	Checksum: 0x1262036B
	Offset: 0x57C0
	Size: 0xA2
	Parameters: 11
	Flags: Linked, Private
*/
function private function_e57809dd(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	if(boneindex > 0)
	{
		boneindex = max(int(boneindex * 0.25), 1);
	}
	return boneindex;
}

/*
	Name: function_4225c3b7
	Namespace: zm_custom
	Checksum: 0x83CE19E3
	Offset: 0x5870
	Size: 0xBE
	Parameters: 11
	Flags: Linked, Private
*/
function private function_4225c3b7(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	if(boneindex > 0)
	{
		boneindex = max(int(boneindex * 0.25), 1);
	}
	psoffsettime dodamage(boneindex, self.origin);
	return false;
}

/*
	Name: function_6607cdee
	Namespace: zm_custom
	Checksum: 0x3B3C915C
	Offset: 0x5938
	Size: 0xC0
	Parameters: 11
	Flags: Linked, Private
*/
function private function_6607cdee(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	if(boneindex > 0)
	{
		boneindex = max(int((boneindex * 0.25) / 2), 1);
	}
	psoffsettime dodamage(boneindex, self.origin);
	return boneindex;
}

/*
	Name: function_cd05a082
	Namespace: zm_custom
	Checksum: 0x4E73312E
	Offset: 0x5A00
	Size: 0x174
	Parameters: 0
	Flags: Linked, Private
*/
function private function_cd05a082()
{
	var_320de887 = function_901b751c(#"zmpointsfixed");
	var_46e28538 = function_901b751c(#"zmpointsstarting") * 100;
	var_1f9ee1b2 = function_901b751c(#"hash_5566698b97a6282e");
	var_58d18c72 = function_901b751c(#"hash_3326ed4311c47268");
	var_523e89f3 = function_901b751c(#"hash_696b8f3671d2baf1");
	var_39215b53 = function_901b751c(#"hash_3b279133f5b3371");
	if(var_46e28538 != 500)
	{
		level.player_starting_points = var_46e28538;
	}
	if(var_320de887)
	{
		level.var_894a83d8 = 1;
	}
	if(var_58d18c72)
	{
		if(var_58d18c72 == 1)
		{
			level.var_a2d8b7eb = var_523e89f3 / 100;
		}
		else
		{
			level.var_39e18a71 = var_39215b53;
		}
	}
}

/*
	Name: function_c25113
	Namespace: zm_custom
	Checksum: 0xE810BA38
	Offset: 0x5B80
	Size: 0x102
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c25113()
{
	self endon(#"disconnect");
	level flag::wait_till("start_zombie_round_logic");
	waitframe(1);
	var_629da31e = function_901b751c(#"zmlaststandduration");
	switch(var_629da31e)
	{
		case 0:
		{
			self.var_39c78617 = 1;
			self zm_laststand::function_3d685b5f(0);
			return;
		}
		case 1:
		{
			self.var_b92e42da = 20;
			break;
		}
		case 2:
		{
			break;
		}
		case 3:
		{
			self.var_b92e42da = 60;
			break;
		}
	}
}

/*
	Name: function_8abf3abd
	Namespace: zm_custom
	Checksum: 0xBD065C12
	Offset: 0x5C90
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8abf3abd()
{
	if(!function_901b751c(#"zmweaponsmelee"))
	{
		self allowmelee(0);
		self thread function_bfc2f3f1();
		self thread function_dc856fd8();
	}
}

/*
	Name: function_99c0cc77
	Namespace: zm_custom
	Checksum: 0x4A99C373
	Offset: 0x5D08
	Size: 0xC8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_99c0cc77()
{
	if(!function_901b751c(#"zmequipmentisenabled") && isdefined(self.slot_weapons[#"lethal_grenade"]))
	{
		self takeweapon(self.slot_weapons[#"lethal_grenade"]);
	}
}

/*
	Name: function_bfc2f3f1
	Namespace: zm_custom
	Checksum: 0x6D671D20
	Offset: 0x5DD8
	Size: 0x80
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bfc2f3f1()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"hero_weapon_power_on");
		self allowmelee(1);
		self waittill(#"hero_weapon_power_off");
		self allowmelee(0);
	}
}

/*
	Name: function_dc856fd8
	Namespace: zm_custom
	Checksum: 0x450029B3
	Offset: 0x5E60
	Size: 0x70
	Parameters: 0
	Flags: Linked, Private
*/
function private function_dc856fd8()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"crafting_fail", #"crafting_success", #"bgb_update");
		self allowmelee(0);
	}
}

/*
	Name: function_7a8180ae
	Namespace: zm_custom
	Checksum: 0xA8EE1AE1
	Offset: 0x5ED8
	Size: 0x45A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7a8180ae()
{
	var_52e65b4 = function_901b751c(#"zmcrawlerstate");
	var_a98f5518 = function_901b751c(#"zmzombiespread");
	var_1b9aa497 = function_901b751c(#"zmzombieminspeed");
	var_34f5f077 = function_901b751c(#"zmzombiemaxspeed");
	var_46e03bb6 = function_901b751c(#"zmzombiehealthmult");
	var_c739ead9 = function_901b751c(#"hash_10457cddea07071");
	switch(var_52e65b4)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_41259f0d = 1;
			break;
		}
		case 2:
		{
			level.var_6d8a8e47 = 1;
			break;
		}
	}
	switch(var_a98f5518)
	{
		case 0:
		{
			level.zigzag_activation_distance = 256;
			level.inner_zigzag_radius = 0;
			level.outer_zigzag_radius = 16;
			level.zigzag_distance_min = 16;
			level.zigzag_distance_max = 512;
			break;
		}
		case 1:
		{
			break;
		}
		case 2:
		{
			level.zigzag_activation_distance = 16;
			level.inner_zigzag_radius = 256;
			level.outer_zigzag_radius = 2048;
			level.zigzag_distance_min = 128;
			level.zigzag_distance_max = 1024;
			break;
		}
	}
	switch(var_1b9aa497)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			level.var_43fb4347 = "run";
			break;
		}
		case 2:
		{
			level.var_43fb4347 = "sprint";
			break;
		}
		case 3:
		{
			level.var_43fb4347 = "super_sprint";
			break;
		}
	}
	switch(var_34f5f077)
	{
		case 0:
		{
			level.var_102b1301 = "walk";
			break;
		}
		case 1:
		{
			level.var_102b1301 = "run";
			break;
		}
		case 2:
		{
			level.var_102b1301 = "sprint";
			break;
		}
		case 3:
		{
			break;
		}
	}
	switch(var_c739ead9)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_c739ead9 = 0.5;
			break;
		}
		case 2:
		{
			level.var_c739ead9 = 2;
			break;
		}
	}
	switch(var_46e03bb6)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_46e03bb6 = 0.5;
			break;
		}
		case 2:
		{
			level.var_46e03bb6 = 2;
			break;
		}
	}
}

/*
	Name: function_5b526135
	Namespace: zm_custom
	Checksum: 0x6ED84682
	Offset: 0x6340
	Size: 0x9C4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5b526135()
{
	var_525c797b = function_901b751c(#"hash_69262a31e0f8f91c");
	var_cfbc34ae = function_901b751c(#"hash_47683a928d3b5c50");
	var_6a6ab4ce = function_901b751c(#"hash_260fe4ac4d0ee7c7");
	var_d46f8e18 = function_901b751c(#"hash_35ac79d2ca5673c8");
	var_9b9f6d3d = function_901b751c(#"hash_4269e873a0c207c");
	var_5a59b382 = function_901b751c(#"hash_407d7afcff755230");
	var_8593895d = function_901b751c(#"hash_3e1334207938d6a7");
	var_8670c016 = function_901b751c(#"hash_443cfbf2a6fbc040");
	var_47a77473 = function_901b751c(#"hash_4035c12ee5837454");
	var_97850f30 = function_901b751c(#"hash_2d0db902620447a8");
	var_f2b4495f = function_901b751c(#"hash_29b057ccce3ee75f");
	var_12c07114 = function_901b751c(#"hash_35ac79d2ca5673c8");
	switch(var_525c797b)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_ef0aada0 = 1;
			break;
		}
		case 2:
		{
			level.var_5931f93f = 1;
			level.var_78acec0a = 1;
			level.var_f38e5f93 = 0.2;
		}
	}
	switch(var_cfbc34ae)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_cfbc34ae = 0.5;
			break;
		}
		case 2:
		{
			level.var_cfbc34ae = 2;
			break;
		}
	}
	switch(var_6a6ab4ce)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_6a6ab4ce = 0.5;
			break;
		}
		case 2:
		{
			level.var_6a6ab4ce = 2;
			break;
		}
	}
	switch(var_d46f8e18)
	{
		case 1:
		default:
		{
			break;
		}
		case 0:
		{
			level.var_66682370 = 0.5;
			break;
		}
		case 2:
		{
			level.var_66682370 = 2;
			break;
		}
		case 3:
		{
			level.var_66682370 = 4;
			break;
		}
	}
	switch(var_9b9f6d3d)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_b38bb71 = 1;
			break;
		}
		case 2:
		{
			level.var_d3e01096 = 1;
			level.var_78acec0a = 1;
			level.var_f38e5f93 = 0.2;
		}
	}
	switch(var_5a59b382)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_5a59b382 = 0.5;
			break;
		}
		case 2:
		{
			level.var_5a59b382 = 2;
			break;
		}
	}
	switch(var_8593895d)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_8593895d = 0.5;
			break;
		}
		case 2:
		{
			level.var_8593895d = 2;
			break;
		}
	}
	switch(var_8670c016)
	{
		case 1:
		default:
		{
			break;
		}
		case 0:
		{
			level.var_397ca369 = 0.5;
			break;
		}
		case 2:
		{
			level.var_397ca369 = 2;
			break;
		}
		case 3:
		{
			level.var_397ca369 = 4;
			break;
		}
	}
	switch(var_47a77473)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_1931799d = 1;
			break;
		}
		case 2:
		{
			level.var_d56511a2 = 1;
		}
	}
	switch(var_97850f30)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_97850f30 = 0.5;
			break;
		}
		case 2:
		{
			level.var_97850f30 = 2;
			break;
		}
	}
	switch(var_f2b4495f)
	{
		case 1:
		{
			break;
		}
		case 0:
		{
			level.var_f2b4495f = 0.5;
			break;
		}
		case 2:
		{
			level.var_f2b4495f = 2;
			break;
		}
	}
	switch(var_12c07114)
	{
		case 1:
		default:
		{
			break;
		}
		case 0:
		{
			level.var_6a9f25ba = 0.5;
			break;
		}
		case 2:
		{
			level.var_6a9f25ba = 2;
			break;
		}
		case 3:
		{
			level.var_6a9f25ba = 4;
			break;
		}
	}
	if(is_true(level.var_d3e01096))
	{
		setgametypesetting(#"hash_4deb3ae7a73c87f3", 0);
		level.var_ef0aada0 = 1;
		level.var_1931799d = 1;
		level.var_81bce2c8 = 1;
	}
	else
	{
		if(is_true(level.var_5931f93f))
		{
			setgametypesetting(#"hash_4deb3ae7a73c87f3", 0);
			level.var_b38bb71 = 1;
			level.var_1931799d = 1;
			level.var_888f3e2 = 1;
		}
		else
		{
			if(is_true(level.var_90534a4f))
			{
				setgametypesetting(#"hash_4deb3ae7a73c87f3", 0);
				level.var_b38bb71 = 1;
				level.var_ef0aada0 = 1;
				level.var_1931799d = 1;
			}
			else if(is_true(level.var_d56511a2))
			{
				setgametypesetting(#"hash_4deb3ae7a73c87f3", 0);
				level.var_b38bb71 = 1;
				level.var_ef0aada0 = 1;
			}
		}
	}
}

/*
	Name: function_a00576dd
	Namespace: zm_custom
	Checksum: 0x57047D2D
	Offset: 0x6D10
	Size: 0xA4
	Parameters: 3
	Flags: None
*/
function function_a00576dd(var_59459749, var_7fe52f51, var_8ccdc1e3)
{
	if(is_true(level.var_d3e01096))
	{
		level.var_78afc69 = var_59459749;
	}
	else
	{
		if(is_true(level.var_5931f93f))
		{
			level.var_78afc69 = var_7fe52f51;
		}
		else if(is_true(level.var_d56511a2))
		{
			level.var_78afc69 = var_8ccdc1e3;
		}
	}
}

/*
	Name: function_6129676c
	Namespace: zm_custom
	Checksum: 0xEA4A59BF
	Offset: 0x6DC0
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6129676c()
{
	timer = function_901b751c(#"zmtimecap") * 60;
	if(timer === 0)
	{
		return;
	}
	level endon(#"game_ended");
	level flag::wait_till("gameplay_started");
	clientfield::set_world_uimodel("ZMHudGlobal.trials.gameStartTime", gettime());
	wait(timer);
	function_9be9c072("zmTimeCap");
}

/*
	Name: function_c2ebdc07
	Namespace: zm_custom
	Checksum: 0xF24CF999
	Offset: 0x6E78
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_c2ebdc07()
{
	self endon(#"disconnect");
	self waittill(#"spawned");
	if(level.players.size < 4)
	{
		bot::add_bot(self.team);
	}
}

/*
	Name: function_401f18e6
	Namespace: zm_custom
	Checksum: 0xDEFCD07B
	Offset: 0x6ED8
	Size: 0x154
	Parameters: 0
	Flags: Linked, Private
*/
function private function_401f18e6()
{
	if(!function_901b751c(#"hash_4deb3ae7a73c87f3"))
	{
		while(!flag::exists(#"disable_special_rounds"))
		{
			waitframe(1);
		}
		level flag::set(#"disable_special_rounds");
	}
	n_start = function_901b751c(#"startround");
	if(n_start > 1)
	{
		level waittill(#"start_of_round");
		for(i = 0; i < n_start; i++)
		{
			if(isdefined(level.var_45827161) && isdefined(level.var_45827161[i]))
			{
				for(var_830a0b65 = i + n_start; isdefined(level.var_45827161[var_830a0b65]); var_830a0b65++)
				{
				}
				level.var_45827161[var_830a0b65] = level.var_45827161[i];
			}
		}
	}
}

/*
	Name: function_a8e9a6c7
	Namespace: zm_custom
	Checksum: 0xA70D06FD
	Offset: 0x7038
	Size: 0x2E52
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a8e9a6c7()
{
	return array({#default_val:1, #name:#"startround"}, {#default_val:0, #name:#"headshotsonly"}, {#default_val:0, #name:#"zmroundcap"}, {#default_val:0, #name:#"zmtimecap"}, {#default_val:0, #name:#"zmshowtimer"}, {#default_val:0, #name:#"zmkillcap"}, {#default_val:1, #name:#"zmdoorstate"}, {#default_val:1, #name:#"hash_4deb3ae7a73c87f3"}, {#default_val:0, #name:#"zmendonquest"}, {#default_val:2, #name:#"hash_4e0ec3fe56f08b47"}, {#default_val:0, #name:#"hash_5d65c0983698a539"}, {#default_val:0, #name:#"hash_1513b70c43495cc0"}, {#default_val:0, #name:#"hash_23fe21eb92ffbc2c"}, {#default_val:0, #name:#"hash_4ffb80b47c049c61"}, {#default_val:0, #name:#"hash_751384283abde22c"}, {#default_val:0, #name:#"hash_543954c3281a530f"}, {#default_val:1, #name:#"zmpowerstate"}, {#default_val:1, #name:#"zmpowerdoorstate"}, {#default_val:1, #name:#"zmperksactive"}, {#default_val:1, #name:#"zmperksjuggernaut"}, {#default_val:1, #name:#"zmperksspeed"}, {#default_val:1, #name:#"zmperksquickrevive"}, {#default_val:1, #name:#"hash_557e3edd7fe168c3"}, {#default_val:1, #name:#"zmperksstaminup"}, {#default_val:1, #name:#"zmperksmulekick"}, {#default_val:1, #name:#"zmperkselectricburst"}, {#default_val:1, #name:#"zmperksdeadshot"}, {#default_val:1, #name:#"zmperkscooldown"}, {#default_val:1, #name:#"zmperksdyingwish"}, {#default_val:1, #name:#"zmpapenabled"}, {#default_val:1, #name:#"hash_57a5c7a9dcf94d61"}, {#default_val:1, #name:#"zmpowerupsactive"}, {#default_val:1, #name:#"zmpowerupnuke"}, {#default_val:1, #name:#"zmpowerupdouble"}, {#default_val:1, #name:#"zmpowerupinstakill"}, {#default_val:1, #name:#"zmpowerupchaospoints"}, {#default_val:1, #name:#"zmpowerupfiresale"}, {#default_val:1, #name:#"zmpowerupspecialweapon"}, {#default_val:1, #name:#"zmpowerupfreeperk"}, {#default_val:1, #name:#"zmpowerupmaxammo"}, {#default_val:1, #name:#"zmpowerupcarpenter"}, {#default_val:0, #name:#"zmpowerupsislimitedround"}, {#default_val:1, #name:#"hash_d46a4e7a41e005c"}, {#default_val:1, #name:#"zmpowerupsharing"}, {#default_val:1, #name:#"zmwallbuysenabled"}, {#default_val:0, #name:#"zmrandomwallbuys"}, {#default_val:1, #name:#"zmelixirsenabled"}, {#default_val:1, #name:#"zmelixirscooldown"}, {#default_val:1, #name:#"zmelixirsindividual"}, {#default_val:1, #name:#"hash_3ab7cedcfef7eacc"}, {#default_val:1, #name:#"zmelixirscommon"}, {#default_val:1, #name:#"zmelixirsrare"}, {#default_val:1, #name:#"zmelixirslegendary"}, {#default_val:1, #name:#"zmelixirsepic"}, {#default_val:1, #name:#"zmtalismansenabled"}, {#default_val:1, #name:#"zmtalismansindividual"}, {#default_val:1, #name:#"zmtalismanscommon"}, {#default_val:1, #name:#"zmtalismansrare"}, {#default_val:1, #name:#"zmtalismanslegendary"}, {#default_val:1, #name:#"zmtalismansepic"}, {#default_val:1, #name:#"zmweaponspistol"}, {#default_val:1, #name:#"zmweaponsshotgun"}, {#default_val:1, #name:#"zmweaponssmg"}, {#default_val:1, #name:#"zmweaponsar"}, {#default_val:1, #name:#"zmweaponstr"}, {#default_val:1, #name:#"zmweaponslmg"}, {#default_val:1, #name:#"zmweaponssniper"}, {#default_val:1, #name:#"zmweaponsknife"}, {#default_val:1, #name:#"zmweaponsmelee"}, {#default_val:1, #name:#"zmspecweaponisenabled"}, {#default_val:1, #name:#"hash_2f03c6055447a6b1"}, {#default_val:1, #name:#"zmwonderweaponisenabled"}, {#default_val:1, #name:#"zmequipmentisenabled"}, {#default_val:1, #name:#"zmequipmentchargerate"}, {#default_val:1, #name:#"zmshieldisenabled"}, {#default_val:1, #name:#"zmshielddurability"}, {#default_val:0, #name:#"zmheadshotsonly"}, {#default_val:0, #name:#"zmrunnerstate"}, {#default_val:0, #name:#"zmwalkerstate"}, {#default_val:1, #name:#"zmcrawlerstate"}, {#default_val:1, #name:#"zmzombiespread"}, {#default_val:0, #name:#"zmzombieminspeed"}, {#default_val:3, #name:#"zmzombiemaxspeed"}, {#default_val:1, #name:#"hash_10457cddea07071"}, {#default_val:1, #name:#"zmzombiehealthmult"}, {#default_val:1, #name:#"hash_5e30739150832bd3"}, {#default_val:1, #name:#"hash_3b558172d2c08a74"}, {#default_val:1, #name:#"zmcrawleraggro"}, {#default_val:1, #name:#"hash_69262a31e0f8f91c"}, {#default_val:1, #name:#"hash_47683a928d3b5c50"}, {#default_val:1, #name:#"hash_260fe4ac4d0ee7c7"}, {#default_val:1, #name:#"hash_2f2281537f0463f7"}, {#default_val:1, #name:#"hash_4269e873a0c207c"}, {#default_val:1, #name:#"hash_407d7afcff755230"}, {#default_val:1, #name:#"hash_3e1334207938d6a7"}, {#default_val:1, #name:#"hash_4a23f5a8d8193e57"}, {#default_val:3, #name:#"hash_29d174e7d8ab76c8"}, {#default_val:1, #name:#"zmhealthregendelay"}, {#default_val:2, #name:#"zmhealthregenrate"}, {#default_val:0, #name:#"zmhealthonkill"}, {#default_val:0, #name:#"zmhealthdrain"}, {#default_val:0, #name:#"zmpointsfixed"}, {#default_val:5, #name:#"zmpointsstarting"}, {#default_val:0, #name:#"hash_5566698b97a6282e"}, {#default_val:0, #name:#"hash_3326ed4311c47268"}, {#default_val:1, #name:#"hash_696b8f3671d2baf1"}, {#default_val:100, #name:#"hash_3b279133f5b3371"}, {#default_val:2, #name:#"zmlaststandduration"}, {#default_val:0, #name:#"hash_12f776f6bc579bb4"}, {#default_val:0, #name:#"hash_2d34a5d9024db85f"}, {#default_val:1, #name:#"zmbarricadestate"}, {#default_val:1, #name:#"hash_3c5363541b97ca3e"}, {#default_val:1, #name:#"zmpowerupfrequency"}, {#default_val:1, #name:#"zmtalismanboxguaranteeboxonly"}, {#default_val:1, #name:#"zmtalismanboxguaranteelmg"}, {#default_val:1, #name:#"hash_61695e52556ff2d1"}, {#default_val:1, #name:#"zmtalismancoagulant"}, {#default_val:1, #name:#"zmtalismanextraclaymore"}, {#default_val:1, #name:#"zmtalismanextrafrag"}, {#default_val:1, #name:#"zmtalismanextraminiturret"}, {#default_val:1, #name:#"zmtalismanextramolotov"}, {#default_val:1, #name:#"zmtalismanextrasemtex"}, {#default_val:1, #name:#"zmtalismanimpatient"}, {#default_val:1, #name:#"zmtalismanperkmodsingle"}, {#default_val:1, #name:#"zmtalismanperkpermanent1"}, {#default_val:1, #name:#"zmtalismanperkpermanent2"}, {#default_val:1, #name:#"zmtalismanperkpermanent3"}, {#default_val:1, #name:#"zmtalismanperkpermanent4"}, {#default_val:1, #name:#"zmtalismanperkreducecost1"}, {#default_val:1, #name:#"zmtalismanperkreducecost2"}, {#default_val:1, #name:#"zmtalismanperkreducecost3"}, {#default_val:1, #name:#"zmtalismanperkreducecost4"}, {#default_val:1, #name:#"zmtalismanperkstart1"}, {#default_val:1, #name:#"zmtalismanperkstart2"}, {#default_val:1, #name:#"zmtalismanperkstart3"}, {#default_val:1, #name:#"zmtalismanperkstart4"}, {#default_val:1, #name:#"zmtalismanshielddurabilitylegendary"}, {#default_val:1, #name:#"zmtalismanshielddurabilityrare"}, {#default_val:1, #name:#"zmtalismanshieldprice"}, {#default_val:1, #name:#"zmtalismanspecialstartlvl2"}, {#default_val:1, #name:#"zmtalismanspecialstartlvl3"}, {#default_val:1, #name:#"zmtalismanspecialxprate"}, {#default_val:1, #name:#"zmtalismanstartweaponar"}, {#default_val:1, #name:#"zmtalismanstartweaponlmg"}, {#default_val:1, #name:#"zmtalismanstartweaponsmg"}, {#default_val:1, #name:#"zmtalismanreducepapcost"}, {#default_val:1, #name:#"zmtalismansultra"}, {#default_val:1, #name:#"zmelixiralwaysdoneswiftly"}, {#default_val:1, #name:#"zmelixiranywherebuthere"}, {#default_val:1, #name:#"zmelixirarsenalaccelerator"}, {#default_val:1, #name:#"zmelixirdangerclosest"}, {#default_val:1, #name:#"zmelixirinplainsight"}, {#default_val:1, #name:#"zmelixirnewtoniannegation"}, {#default_val:1, #name:#"zmelixirnowyouseeme"}, {#default_val:1, #name:#"zmelixirstockoption"}, {#default_val:1, #name:#"zmelixirboardgames"}, {#default_val:1, #name:#"zmelixirburnedout"}, {#default_val:1, #name:#"zmelixircrawlspace"}, {#default_val:1, #name:#"zmelixirpopshocks"}, {#default_val:1, #name:#"zmelixirtemporalgift"}, {#default_val:1, #name:#"zmelixirpointdrops"}, {#default_val:1, #name:#"zmelixiralchemicalantithesis"}, {#default_val:1, #name:#"zmelixirswordflay"}, {#default_val:1, #name:#"zmelixirdeadofnuclearwinter"}, {#default_val:1, #name:#"zmelixirlicensedcontractor"}, {#default_val:1, #name:#"zmelixirundeadmanwalking"}, {#default_val:1, #name:#"zmelixirwhoskeepingscore"}, {#default_val:1, #name:#"zmelixiraftertaste"}, {#default_val:1, #name:#"zmelixirextracredit"}, {#default_val:1, #name:#"zmelixirkilljoy"}, {#default_val:1, #name:#"zmelixirsodafountain"}, {#default_val:1, #name:#"zmelixirctrlz"}, {#default_val:1, #name:#"zmelixirfreefire"}, {#default_val:1, #name:#"zmelixircacheback"}, {#default_val:1, #name:#"zmelixirimmolationliquidation"}, {#default_val:1, #name:#"zmelixirphoenixup"}, {#default_val:1, #name:#"zmelixirpowerkeg"}, {#default_val:1, #name:#"zmelixirblooddebt"}, {#default_val:1, #name:#"zmelixirneardeathexperience"}, {#default_val:1, #name:#"zmelixirperkaholic"}, {#default_val:1, #name:#"zmelixirwallpower"}, {#default_val:0, #name:#"hash_429b520a87274afb"}, {#default_val:1, #name:#"zmtrapsenabled"}, {#default_val:1, #name:#"zmstartingweaponenabled"}, {#default_val:1, #name:#"hash_35ac79d2ca5673c8"}, {#default_val:1, #name:#"hash_443cfbf2a6fbc040"}, {#default_val:0, #name:#"zmselfreviveamount"}, {#default_val:1, #name:#"hash_4035c12ee5837454"}, {#default_val:1, #name:#"hash_2d0db902620447a8"}, {#default_val:1, #name:#"hash_29b057ccce3ee75f"}, {#default_val:1, #name:#"hash_35ac79d2ca5673c8"}, {#default_val:1, #name:#"zmretainweapons"}, {#default_val:1, #name:#"zmperkdecay"}, {#default_val:0, #name:#"zmcraftingkeyline"}, {#default_val:0, #name:#"hash_1fed0d9afc0b0040"}, {#default_val:0, #name:#"hash_1158d006a3913ef6"}, {#default_val:0, #name:#"hash_64291919b16c489a"}, {#default_val:1, #name:#"zmelixirantientrapment"}, {#default_val:1, #name:#"zmelixirequipmint"}, {#default_val:1, #name:#"zmelixirheadscan"}, {#default_val:1, #name:#"zmelixirjointheparty"}, {#default_val:1, #name:#"zmelixirnowherebutthere"}, {#default_val:1, #name:#"zmelixirphantomreload"}, {#default_val:1, #name:#"zmelixirshieldsup"}, {#default_val:1, #name:#"zmelixirwalltowall"}, {#default_val:1, #name:#"zmperksbandolier"}, {#default_val:1, #name:#"zmperksdeathperception"}, {#default_val:1, #name:#"zmperksphdslider"}, {#default_val:1, #name:#"zmperkssecretsauce"}, {#default_val:1, #name:#"hash_5690c4dcc61973ec"}, {#default_val:1, #name:#"zmperkswolfprotector"}, {#default_val:1, #name:#"zmperksvictorious"}, {#default_val:0, #name:#"zmfriendlyfiretype"}, {#default_val:1, #name:#"zmelixirconflagrationliquidation"}, {#default_val:1, #name:#"zmelixirperkup"}, {#default_val:1, #name:#"zmelixirrefreshmint"});
}

/*
	Name: function_185687d7
	Namespace: zm_custom
	Checksum: 0x434BAC97
	Offset: 0x9E98
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function function_185687d7(event)
{
	return false;
}

/*
	Name: function_3ca8ca85
	Namespace: zm_custom
	Checksum: 0xC6F90D0D
	Offset: 0x9EB0
	Size: 0x56C
	Parameters: 0
	Flags: Private
*/
function private function_3ca8ca85()
{
	/#
		if(getdvarint(#"hash_459b2d01242f9fd4", 0))
		{
			setgametypesetting("", 9);
			setgametypesetting("", 2);
			setgametypesetting("", 2);
			setgametypesetting("", 2);
			setgametypesetting("", 0);
			setgametypesetting("", 1);
			setgametypesetting("", 9);
			setgametypesetting("", 2);
			setgametypesetting("", 1);
			setgametypesetting("", 9);
		}
		if(getdvarint(#"hash_18b717f0d84d2ee6", 0))
		{
			setgametypesetting("", 4);
			setgametypesetting("", 6);
			setgametypesetting("", 1);
			setgametypesetting("", 2);
			setgametypesetting("", 2);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
		}
		if(getdvarint(#"hash_712656a2976e26c6", 0))
		{
			setgametypesetting("", 40);
			setgametypesetting("", 1);
			setgametypesetting("", 0);
			setgametypesetting("", 3);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 1);
			setgametypesetting("", 3);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
		}
		if(getdvarint(#"hash_6e1983b84de27c22", 0))
		{
			setgametypesetting("", 6);
			setgametypesetting("", 4);
			setgametypesetting("", 3);
			setgametypesetting("", 2);
			setgametypesetting("", 10);
			setgametypesetting("", 5);
			setgametypesetting("", 0);
			setgametypesetting("", 2);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 0);
			setgametypesetting("", 2);
		}
	#/
}

/*
	Name: function_172decfc
	Namespace: zm_custom
	Checksum: 0xC5F38991
	Offset: 0xA428
	Size: 0x474
	Parameters: 0
	Flags: Private
*/
function private function_172decfc()
{
	/#
		level endon(#"game_ended");
		level waittill(#"all_players_spawned");
		var_325bac97 = function_338abd6d();
		var_32d62863 = array();
		var_210f7603 = 0;
		var_ecc27a73 = 0;
		foreach(s_var in var_325bac97)
		{
			if(s_var.name.size > var_ecc27a73)
			{
				var_ecc27a73 = s_var.name.size;
			}
		}
		for(i = 0; i < var_325bac97.size; i++)
		{
			var_2f572bbb = "";
			for(j = 0; j < var_ecc27a73 - var_325bac97[i].size; j++)
			{
				var_2f572bbb = var_2f572bbb + "";
			}
			var_2f572bbb = var_2f572bbb + (var_325bac97[i].name + "");
			if(var_325bac97[i].state[0] != "" && isdefined(var_325bac97[i].state[int(getgametypesetting(var_325bac97[i].name))]))
			{
				var_2f572bbb = var_2f572bbb + var_325bac97[i].state[int(getgametypesetting(var_325bac97[i].name))];
				for(j = 0; j < 13 - var_325bac97[i].state[int(getgametypesetting(var_325bac97[i].name))].size; j++)
				{
					var_2f572bbb = var_2f572bbb + "";
				}
			}
			else
			{
				var_2f572bbb = var_2f572bbb + getgametypesetting(var_325bac97[i].name);
				for(j = 0; j < 13 - string(getgametypesetting(var_325bac97[i].name)).size; j++)
				{
					var_2f572bbb = var_2f572bbb + "";
				}
			}
			array::add(var_32d62863, var_2f572bbb);
		}
		var_5f0a1940 = 0;
		var_af35ffa2 = 0;
		if(function_3f3752ab())
		{
			for(i = 0; i < var_325bac97.size; i++)
			{
				if(floor(getgametypesetting(var_325bac97[i].name)) != var_325bac97[i].default_val)
				{
					var_5f0a1940++;
					if(var_5f0a1940 > 29)
					{
						var_5f0a1940 = var_5f0a1940 - 29;
						var_af35ffa2++;
					}
					v_pos = 300 + (18 * var_5f0a1940);
					var_f993b45d = 200 + (400 * var_af35ffa2);
					debug2dtext((var_f993b45d, v_pos, 0), var_32d62863[i], (0, 1, 0), undefined, (0, 0, 0), 0.75, 0.85, 360);
				}
			}
		}
	#/
}

/*
	Name: function_338abd6d
	Namespace: zm_custom
	Checksum: 0x6D49E69F
	Offset: 0xA8A8
	Size: 0x4AE2
	Parameters: 0
	Flags: Private
*/
function private function_338abd6d()
{
	/#
		return array({#state:array(""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", "", "", ""), #default_val:2, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array(""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", "", ""), #default_val:0, #name:""}, {#state:array("", "", "", ""), #default_val:3, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array(""), #default_val:3, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", "", "", ""), #default_val:2, #name:""}, {#state:array("", "", "", ""), #default_val:0, #name:""}, {#state:array("", "", "", ""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:5, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", "", "", ""), #default_val:2, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", "", "", ""), #default_val:1, #name:""}, {#state:array("", "", "", ""), #default_val:1, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", ""), #default_val:1, #name:""}, {#state:array("", "", "", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array(""), #default_val:0, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""}, {#state:array("", ""), #default_val:1, #name:""});
	#/
}

