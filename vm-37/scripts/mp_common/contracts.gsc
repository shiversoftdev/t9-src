#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\armor.gsc;

#namespace contracts;

/*
	Name: __init__system__
	Namespace: contracts
	Checksum: 0x9F2C980C
	Offset: 0x120
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"contracts", &function_70a657d8, undefined, &finalize_init, undefined);
}

/*
	Name: function_70a657d8
	Namespace: contracts
	Checksum: 0x99BCB68C
	Offset: 0x170
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.challengescallbacks))
	{
		level.challengescallbacks = [];
	}
	init_player_contract_events();
}

/*
	Name: finalize_init
	Namespace: contracts
	Checksum: 0xA8A1CFE3
	Offset: 0x1B0
	Size: 0x304
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize_init()
{
	callback::on_connect(&on_player_connect);
	if(can_process_contracts())
	{
		register_player_contract_event(#"headshot", &on_headshot_kill, 1);
		register_player_contract_event(#"air_assault_total_kills", &function_a0045e6a);
		register_player_contract_event(#"hash_10b0c56ae630070d", &function_8af6a5a);
		challenges::registerchallengescallback("playerKilled", &contract_kills);
		challenges::registerchallengescallback("gameEnd", &function_a4c8ce2a);
		globallogic_score::registercontractwinevent(&contract_win);
		register_player_contract_event(#"double_kill", &function_a7a24a36, 1);
		register_player_contract_event(#"ekia", &on_ekia, 2);
		register_player_contract_event(#"objective_ekia", &on_objective_ekia);
		register_player_contract_event(#"hash_31940a13f77a7a79", &function_23ddb75);
		register_player_contract_event(#"hash_2f3b5cfd90466f60", &function_fb608f0a, 1);
		register_player_contract_event(#"hash_32ed5d2b274397c1", &function_4b024d04);
		register_player_contract_event(#"hash_4da59ed3dbeca8c7", &function_2065738f, 1);
		level.var_79a93566 = &function_902ef0de;
		level.var_d9ae19f0 = &function_d9ae19f0;
		level.var_c3e2bb05 = 1;
		/#
			thread devgui_setup();
		#/
	}
}

/*
	Name: function_2065738f
	Namespace: contracts
	Checksum: 0x1E0A5A07
	Offset: 0x4C0
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function function_2065738f(killstreaktype)
{
	self increment_contract(#"hash_bf49eb59a524a2c");
	switch(killstreaktype)
	{
		case "counteruav":
		case "inventory_counteruav":
		{
			self increment_contract(#"hash_55d5fc464b179a45");
			break;
		}
		case "uav":
		case "inventory_uav":
		{
			self increment_contract(#"hash_5faef94f35522583");
			break;
		}
	}
}

/*
	Name: function_a7a24a36
	Namespace: contracts
	Checksum: 0x89D56AA6
	Offset: 0x598
	Size: 0x26A
	Parameters: 1
	Flags: Linked
*/
function function_a7a24a36(weaponname)
{
	attacker = self;
	switch(weaponname)
	{
		case "frag_grenade":
		{
			attacker increment_contract(#"hash_2414160d464f90ae");
			attacker increment_contract(#"hash_255d9fb4f18be3d4");
			break;
		}
		case "eq_molotov":
		{
			attacker increment_contract(#"hash_28eee88b752d363a");
			attacker increment_contract(#"hash_255d9fb4f18be3d4");
			break;
		}
		case "satchel_charge":
		{
			attacker increment_contract(#"hash_296479e90e353da1");
			attacker increment_contract(#"hash_255d9fb4f18be3d4");
			break;
		}
		case "eq_sticky_grenade":
		{
			attacker increment_contract(#"hash_46ab1787f07dba5a");
			attacker increment_contract(#"hash_255d9fb4f18be3d4");
			break;
		}
		case "remote_missile":
		{
			attacker increment_contract(#"hash_772e19fad283c8cf");
			break;
		}
		case "sig_bow_flame":
		{
			attacker increment_contract(#"hash_6e992792aaf0dc10");
			break;
		}
		case "hero_pineapplegun":
		{
			attacker increment_contract(#"hash_2977fecb56dd9b59");
			break;
		}
		case "recon_car":
		{
			attacker increment_contract(#"hash_3d11e20647031a01");
			break;
		}
	}
}

/*
	Name: on_player_connect
	Namespace: contracts
	Checksum: 0x8D544894
	Offset: 0x810
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(can_process_contracts())
	{
		self setup_player_contracts(3, &function_90a854d2);
	}
}

/*
	Name: can_process_contracts
	Namespace: contracts
	Checksum: 0x2722331F
	Offset: 0x858
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function can_process_contracts()
{
	if(getdvarint(#"contracts_enabled", 0) == 0)
	{
		return 0;
	}
	if(getdvarint(#"contracts_enabled_mp", 1) == 0)
	{
		return 0;
	}
	if(!(sessionmodeismultiplayergame() || sessionmodeiswarzonegame()))
	{
		return 0;
	}
	if(level.var_73e51905 === 1)
	{
		return 0;
	}
	return challenges::canprocesschallenges();
}

/*
	Name: contract_kills
	Namespace: contracts
	Checksum: 0x8811F62F
	Offset: 0x920
	Size: 0x7B4
	Parameters: 1
	Flags: Linked
*/
function contract_kills(data)
{
	victim = data.victim;
	attacker = data.attacker;
	weapon = data.weapon;
	time = data.time;
	weaponclass = util::getweaponclass(weapon);
	switch(weaponclass)
	{
		case "weapon_knife":
		{
			attacker function_fd9fb79b(#"hash_68ff70af9c6dc38e");
			break;
		}
		case "weapon_grenade":
		{
			attacker function_fd9fb79b(#"hash_36c6e603e324874f");
			switch(weapon.statname)
			{
				case "frag_grenade":
				{
					attacker function_fd9fb79b(#"hash_4ab0678e609789bc");
					break;
				}
				case "eq_molotov":
				{
					attacker function_fd9fb79b(#"hash_64d9cceff0f494c0");
					break;
				}
				case "eq_sticky_grenade":
				{
					attacker function_fd9fb79b(#"hash_1d6f62c9feb07e20");
					break;
				}
				case "satchel_charge":
				{
					attacker function_fd9fb79b(#"hash_21d156cd866d1a31");
					break;
				}
				default:
				{
					break;
				}
			}
		}
		default:
		{
			break;
		}
	}
	if(weapon.statname == #"land_mine")
	{
		attacker function_fd9fb79b(#"hash_6d99dd47b6819429");
	}
	if(weapon.name === attacker function_b958b70d(attacker.class_num, "secondary"))
	{
		attacker function_fd9fb79b(#"hash_482cefb4f3e4112c");
	}
	iskillstreak = isdefined(data.einflictor) && isdefined(data.einflictor.killstreakid);
	if(!iskillstreak && isdefined(level.iskillstreakweapon))
	{
		iskillstreakweapon = [[level.iskillstreakweapon]](weapon);
	}
	if(iskillstreak || iskillstreakweapon === 1)
	{
		attacker function_fd9fb79b(#"hash_49d55f63ca883bf7");
		switch(weapon.statname)
		{
			case "ac130":
			{
				attacker function_fd9fb79b(#"hash_72605357218516e7");
				break;
			}
			case "recon_car":
			{
				attacker function_fd9fb79b(#"hash_3c0c11fff49055d1");
				break;
			}
			case "planemortar":
			{
				attacker function_fd9fb79b(#"hash_f46876334e34517");
				break;
			}
			case "remote_missile":
			{
				attacker function_fd9fb79b(#"hash_1801dc5071019f1c");
				break;
			}
			case "hash_ed62df533816471":
			case "napalm_strike":
			{
				attacker function_fd9fb79b(#"hash_671056a002339a47");
				break;
			}
			case "sig_bow_flame":
			{
				attacker function_fd9fb79b(#"hash_3595f542499fc68e");
				break;
			}
			case "ultimate_turret":
			{
				attacker function_fd9fb79b(#"hash_3a5a17dc41083865");
				break;
			}
			case "hero_pineapplegun":
			{
				attacker function_fd9fb79b(#"hash_e160390bc7706a6");
				break;
			}
			case "supplydrop_marker":
			{
				attacker function_fd9fb79b(#"hash_75f061e34769e78e");
				break;
			}
			case "helicopter_comlink":
			{
				attacker function_fd9fb79b(#"hash_4bafcb75a048607b");
				break;
			}
			default:
			{
				break;
			}
		}
		if(weapon.issupplydropweapon === 1)
		{
			attacker function_fd9fb79b(#"hash_75f061e34769e78e");
		}
	}
	if(weapon.var_29d24e37 === 1)
	{
		attacker function_fd9fb79b(#"hash_768c7a6a36bcc892");
	}
	if(data.var_89187b46 === 1)
	{
		attacker function_fd9fb79b(#"hash_34e6da572a9a4365");
		if(data.var_8e0c4587.vehicleclass === "plane" || data.var_8e0c4587.vehicleclass === "helicopter")
		{
			attacker function_fd9fb79b(#"hash_2cb02550d0d53e98");
		}
		else if(!data.var_8e0c4587.vehicleclass === "boat")
		{
			attacker function_fd9fb79b(#"hash_7d38cb26403f57a6");
		}
	}
	if(data.var_58ecc225 === 1)
	{
		attacker function_fd9fb79b(#"hash_3cfd4a88fedc0909");
	}
	if(data.var_4e8a56b1 === 1)
	{
		attacker function_fd9fb79b(#"hash_5bcc57fa4fb8b497");
	}
	if(data.victimweapon.iscarriedkillstreak === 1)
	{
		attacker function_fd9fb79b(#"hash_20d87fd5522b859f");
	}
}

/*
	Name: on_ekia
	Namespace: contracts
	Checksum: 0xECF44338
	Offset: 0x10E0
	Size: 0x504
	Parameters: 2
	Flags: Linked
*/
function on_ekia(weapon, victim)
{
	attacker = self;
	attacker function_fd9fb79b(#"hash_224789279d37fc30");
	if(level.hardcoremode)
	{
		attacker function_fd9fb79b(#"hash_473a8eefc745db7b");
	}
	if(level.basegametype == #"fireteam_dirty_bomb")
	{
		attacker function_fd9fb79b(#"hash_72338a9a4e12ba3a");
	}
	var_6b9aa5a0 = undefined;
	weaponclass = util::getweaponclass(victim);
	if(!isdefined(weaponclass))
	{
		weaponclass = #"unspecified";
	}
	switch(weaponclass)
	{
		case "weapon_assault":
		{
			var_6b9aa5a0 = #"hash_1005918e22a7865b";
			break;
		}
		case "weapon_lmg":
		{
			var_6b9aa5a0 = #"hash_151c8e7a35e1e380";
			break;
		}
		case "weapon_pistol":
		{
			var_6b9aa5a0 = #"hash_250c2d8ef2261723";
			break;
		}
		case "weapon_cqb":
		{
			var_6b9aa5a0 = #"hash_5262d5b92e0fdc2";
			break;
		}
		case "weapon_smg":
		{
			var_6b9aa5a0 = #"hash_2173bc0bfcbdf90f";
			break;
		}
		case "weapon_sniper":
		{
			var_6b9aa5a0 = #"hash_21762ab1513fddf";
			break;
		}
		case "weapon_tactical":
		{
			var_6b9aa5a0 = #"hash_1a4fe101c7aab2d";
			break;
		}
		default:
		{
			break;
		}
	}
	if(isdefined(var_6b9aa5a0))
	{
		attacker function_fd9fb79b(var_6b9aa5a0);
	}
	var_197329e6 = victim.name == self function_b958b70d(attacker.class_num, "secondary");
	if(var_197329e6)
	{
		attacker function_fd9fb79b(#"hash_16a722c6820d552e");
	}
	var_8a4cfbd = 0;
	if(victim.var_76ce72e8)
	{
		scoreevents = globallogic_score::function_3cbc4c6c(victim.var_2e4a8800);
		var_8a4cfbd = isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1;
	}
	if(var_8a4cfbd)
	{
		attacker increment_contract(#"hash_6b52fb637a3c29cb");
	}
	else if(victim.issignatureweapon)
	{
		attacker increment_contract(#"hash_31a6484e36a0a20f");
	}
	total_unlocked = attacker gettotalunlockedweaponattachments(victim);
	loadout_primary_weapon = attacker loadout::function_18a77b37("primary");
	loadout_secondary_weapon = attacker loadout::function_18a77b37("secondary");
	if(total_unlocked >= 3)
	{
		if(loadout_primary_weapon === victim)
		{
			attacker function_fd9fb79b(#"hash_1ed264699cc951b");
		}
		else if(loadout_secondary_weapon === victim)
		{
			attacker function_fd9fb79b(#"hash_264228bd931f8deb");
		}
	}
	if(total_unlocked >= 5)
	{
		if(loadout_primary_weapon === victim)
		{
			attacker function_fd9fb79b(#"hash_d18e3651f508489");
		}
		else if(loadout_secondary_weapon === victim)
		{
			attacker function_fd9fb79b(#"hash_469703d9a67cf0dd");
		}
	}
	if(armor::get_armor() > 0 && isdefined(self.var_c79fb13d))
	{
		attacker function_fd9fb79b(#"hash_7d90475d2d43eefd");
	}
}

/*
	Name: on_objective_ekia
	Namespace: contracts
	Checksum: 0x6BB1D42F
	Offset: 0x15F0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function on_objective_ekia()
{
	self increment_contract(#"hash_674ddfad917fa524");
}

/*
	Name: function_23ddb75
	Namespace: contracts
	Checksum: 0xB8AA318F
	Offset: 0x1620
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_23ddb75()
{
	self increment_contract(#"hash_210a710134dbdaaa");
}

/*
	Name: function_fd9fb79b
	Namespace: contracts
	Checksum: 0x55393EB9
	Offset: 0x1650
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_fd9fb79b(var_38280f2f, delta)
{
	if(!isdefined(delta))
	{
		delta = 1;
	}
	if(self is_contract_active(var_38280f2f))
	{
		self function_902ef0de(var_38280f2f, delta);
	}
}

/*
	Name: function_fb608f0a
	Namespace: contracts
	Checksum: 0x55A8D7B5
	Offset: 0x16B8
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_fb608f0a(weapon)
{
	self increment_contract(#"hash_186da11489a29d82");
	if(weapon.statname == #"hash_2de6f2fb4eb1529")
	{
		increment_contract(#"hash_189a19dfebc71184");
	}
	else
	{
		if(weapon.statname == #"land_mine")
		{
			increment_contract(#"hash_4ef18c4603d407ad");
		}
		else if(util::getweaponclass(weapon) === #"weapon_grenade")
		{
			increment_contract(#"hash_58b984c08b43c46a");
			if(weapon.statname == #"satchel_charge")
			{
				increment_contract(#"hash_16feef44241889e5");
			}
		}
	}
}

/*
	Name: function_4b024d04
	Namespace: contracts
	Checksum: 0xE2AB4604
	Offset: 0x1808
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_4b024d04()
{
	var_c421e6b = undefined;
	switch(level.basegametype)
	{
		case "fireteam_dirty_bomb":
		{
			var_c421e6b = #"hash_3a3d0c0b64f00008";
			break;
		}
		case "hash_476c229898dae6a1":
		{
			var_c421e6b = #"hash_35f961407a530010";
			break;
		}
	}
	self increment_contract(var_c421e6b);
}

/*
	Name: function_902ef0de
	Namespace: contracts
	Checksum: 0x3498DC69
	Offset: 0x18A8
	Size: 0x3AC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_902ef0de(var_38280f2f, delta)
{
	/#
		if(getdvarint(#"scr_contract_debug_multiplier", 0) > 0)
		{
			delta = delta * getdvarint(#"scr_contract_debug_multiplier", 1);
		}
	#/
	if(delta <= 0)
	{
		return;
	}
	target_value = self.pers[#"contracts"][var_38280f2f].target_value;
	old_progress = (isdefined(self.pers[#"contracts"][var_38280f2f].current_value) ? self.pers[#"contracts"][var_38280f2f].current_value : self.pers[#"contracts"][var_38280f2f].var_59cb904f);
	if(old_progress == target_value)
	{
		return;
	}
	new_progress = int(old_progress + delta);
	if(new_progress > target_value)
	{
		new_progress = target_value;
	}
	if(new_progress != old_progress)
	{
		self.pers[#"contracts"][var_38280f2f].current_value = new_progress;
		if(isdefined(level.contract_ids[var_38280f2f]))
		{
			self luinotifyevent(#"hash_4b04b1cb4b3498d0", 2, level.contract_ids[var_38280f2f], new_progress);
		}
	}
	if(old_progress < target_value && target_value <= new_progress)
	{
		var_9d12108c = (isdefined(self.timeplayed[self.team]) ? self.timeplayed[self.team] : 0);
		self.pers[#"contracts"][var_38280f2f].var_be5bf249 = (self stats::get_stat_global(#"time_played_total") - self.pers[#"hash_5651f00c6c1790a4"]) + var_9d12108c;
		if(isdefined(level.contract_ids[var_38280f2f]))
		{
			self luinotifyevent(#"hash_1739c4bd5baf83bc", 1, level.contract_ids[var_38280f2f]);
		}
	}
	/#
		if(getdvarint(#"scr_contract_debug", 0) > 0)
		{
			iprintln((((function_9e72a96(var_38280f2f) + "") + new_progress) + "") + target_value);
			if(old_progress < target_value && target_value <= new_progress)
			{
				iprintln(function_9e72a96(var_38280f2f) + "");
			}
		}
	#/
}

/*
	Name: function_90a854d2
	Namespace: contracts
	Checksum: 0xC74AB1BA
	Offset: 0x1C60
	Size: 0x1C2
	Parameters: 1
	Flags: Linked
*/
function function_90a854d2(slot)
{
	/#
		if(getdvarint(#"hash_657185da33fd5f8", 0) > 0)
		{
			var_38280f2f = #"hash_6a1133003efe7380";
			switch(slot)
			{
				case 0:
				{
					return {#hash_59cb904f:98, #target_value:100, #hash_416a1e35:10011, #hash_38280f2f:#"hash_2abfdc6b42b44644"};
				}
				case 1:
				{
					return {#hash_59cb904f:195, #target_value:200, #hash_416a1e35:10004, #hash_38280f2f:#"hash_2173bc0bfcbdf90f"};
				}
				case 2:
				{
					return {#hash_59cb904f:48, #target_value:50, #hash_416a1e35:10009, #hash_38280f2f:#"hash_250c2d8ef2261723"};
				}
				default:
				{
					break;
				}
			}
			return undefined;
		}
	#/
	return function_d17bcd3c(slot);
}

/*
	Name: function_a4c8ce2a
	Namespace: contracts
	Checksum: 0xD156123A
	Offset: 0x1E30
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_a4c8ce2a(data)
{
	if(!isdefined(data))
	{
		return;
	}
	player = data.player;
	if(!isplayer(player))
	{
		return;
	}
	player function_c5958b54();
	player function_78083139();
}

/*
	Name: contract_win
	Namespace: contracts
	Checksum: 0x26B73AD3
	Offset: 0x1EA8
	Size: 0x29C
	Parameters: 1
	Flags: Linked
*/
function contract_win(winner)
{
	winner function_fd9fb79b(#"hash_1832bdb2f1aba003");
	var_831b642b = undefined;
	switch(level.gametype)
	{
		case "conf":
		case "hash_1e1515dc71a38bb9":
		case "conf_hc":
		{
			var_831b642b = #"hash_62eeb56528fb2dd2";
			break;
		}
		case "control":
		case "control_hc":
		{
			var_831b642b = #"hash_42a587fd027c16d7";
			break;
		}
		case "hash_1f03b546a8317f1d":
		case "dom_hc":
		case "dom":
		{
			var_831b642b = #"hash_1286a20fba67f00f";
			break;
		}
		case "hash_c5acc1898a61b54":
		case "gunfight":
		{
			var_831b642b = #"hash_637c243c43c99f88";
			break;
		}
		case "koth":
		case "koth_hc":
		case "hash_5ad222bb812ce35d":
		{
			var_831b642b = #"hash_1fa6cd6ec6b44413";
			break;
		}
		case "hash_ff071780b17ebd4":
		case "tdm":
		{
			var_831b642b = #"hash_491aa3b35ce36b7f";
			break;
		}
		case "tdm_hc":
		{
			var_831b642b = #"hash_91095804fbbf4ae";
			break;
		}
		case "sd":
		case "sd_hc":
		{
			var_831b642b = #"hash_7065ab34c90b39b4";
			break;
		}
		case "hash_15caa5206bc50884":
		case "vip":
		{
			var_831b642b = #"hash_769fc475cca99231";
			break;
		}
		default:
		{
			break;
		}
	}
	winner function_fd9fb79b(var_831b642b);
}

/*
	Name: function_c5958b54
	Namespace: contracts
	Checksum: 0x2D5DDC1B
	Offset: 0x2150
	Size: 0x54C
	Parameters: 0
	Flags: Linked
*/
function function_c5958b54()
{
	var_c421e6b = undefined;
	switch(level.gametype)
	{
		case "ball":
		case "ball_hc":
		{
			var_c421e6b = #"hash_34477f0475c38164";
			break;
		}
		case "bounty_hc":
		case "bounty":
		{
			var_c421e6b = #"hash_4985d4f734fdbfce";
			break;
		}
		case "conf":
		case "hash_1e1515dc71a38bb9":
		case "conf_hc":
		{
			var_c421e6b = #"hash_5de2883b8961e46f";
			break;
		}
		case "control":
		case "control_hc":
		{
			var_c421e6b = #"hash_62d0b4c184c48912";
			break;
		}
		case "ctf":
		case "ctf_hc":
		{
			var_c421e6b = #"hash_42b7ebc5926b0008";
			break;
		}
		case "dem":
		case "dem_hc":
		{
			var_c421e6b = #"hash_36472e9b2de73d63";
			break;
		}
		case "dm":
		case "dm_hc":
		{
			var_c421e6b = #"hash_5dbf89f59ac323e3";
			break;
		}
		case "hash_1f03b546a8317f1d":
		case "dom_hc":
		case "dom":
		{
			var_c421e6b = #"hash_4289a3f53c536915";
			break;
		}
		case "hash_c5acc1898a61b54":
		case "gunfight":
		{
			var_c421e6b = #"hash_6f88335358950e1";
			break;
		}
		case "escort":
		case "escort_hc":
		{
			var_c421e6b = #"hash_38fb96360f792879";
			break;
		}
		case "gun_hc":
		case "gun":
		{
			var_c421e6b = #"hash_f916a0b9718fb8";
			break;
		}
		case "infect_hc":
		case "infect":
		{
			var_c421e6b = #"hash_53542c30ea90ca02";
			break;
		}
		case "koth":
		case "koth_hc":
		case "hash_5ad222bb812ce35d":
		{
			var_c421e6b = #"hash_50f232749a3c2486";
			break;
		}
		case "prop":
		case "prop_hc":
		{
			var_c421e6b = #"hash_6b23bf478e392be0";
			break;
		}
		case "sas":
		case "sas_hc":
		{
			var_c421e6b = #"hash_4bba29532de87a59";
			break;
		}
		case "sd":
		case "sd_hc":
		{
			var_c421e6b = #"hash_5039727046c10015";
			break;
		}
		case "hash_ff071780b17ebd4":
		case "tdm":
		{
			var_c421e6b = #"hash_697ce077df5b3b5a";
			break;
		}
		case "tdm_hc":
		{
			var_c421e6b = #"hash_30ac3098e945e653";
			break;
		}
		case "hash_15caa5206bc50884":
		case "vip":
		{
			var_c421e6b = #"hash_4384359f95ad0db0";
			break;
		}
		case "fireteam_dirty_bomb":
		{
			var_c421e6b = #"hash_445752ece698bef2";
			break;
		}
		case "hash_476c229898dae6a1":
		{
			var_c421e6b = #"hash_fc181c76a01b2a";
			break;
		}
		default:
		{
			break;
		}
	}
	if(isdefined(var_c421e6b))
	{
		self function_fd9fb79b(var_c421e6b);
		self function_fd9fb79b(#"hash_20583033219fa6aa");
	}
	if(globallogic_utils::function_308e3379())
	{
		self function_fd9fb79b(#"hash_1ffdd36f8bcda97d");
	}
}

/*
	Name: on_headshot_kill
	Namespace: contracts
	Checksum: 0xF66EA06E
	Offset: 0x26A8
	Size: 0x204
	Parameters: 1
	Flags: Linked
*/
function on_headshot_kill(weapon)
{
	if(level.hardcoremode)
	{
		self function_fd9fb79b(#"hash_1246b2a33b8739f4");
	}
	self function_fd9fb79b(#"hash_2abfdc6b42b44644");
	var_6b9aa5a0 = undefined;
	weaponclass = util::getweaponclass(weapon);
	if(!isdefined(weaponclass))
	{
		weaponclass = #"unspecified";
	}
	switch(weaponclass)
	{
		case "weapon_assault":
		{
			var_6b9aa5a0 = #"hash_3a58a49b35b9fa33";
			break;
		}
		case "weapon_lmg":
		{
			var_6b9aa5a0 = #"hash_4fad0a97fc2fd9d4";
			break;
		}
		case "weapon_pistol":
		{
			var_6b9aa5a0 = #"hash_192947c83a9aafab";
			break;
		}
		case "weapon_cqb":
		{
			var_6b9aa5a0 = #"hash_6a65c11816351cf2";
			break;
		}
		case "weapon_smg":
		{
			var_6b9aa5a0 = #"hash_5a9d9828ffe3c05f";
			break;
		}
		case "weapon_sniper":
		{
			var_6b9aa5a0 = #"hash_4e0aa3269ac3f32f";
			break;
		}
		case "weapon_tactical":
		{
			var_6b9aa5a0 = #"hash_52862bdba426ec21";
			break;
		}
		default:
		{
			break;
		}
	}
	if(isdefined(var_6b9aa5a0))
	{
		self function_fd9fb79b(var_6b9aa5a0);
	}
}

/*
	Name: function_a0045e6a
	Namespace: contracts
	Checksum: 0x4200772B
	Offset: 0x28B8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_a0045e6a()
{
	self function_fd9fb79b(#"hash_5903b7c9559be1e");
}

/*
	Name: function_8af6a5a
	Namespace: contracts
	Checksum: 0x9B6A87F2
	Offset: 0x28E8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_8af6a5a()
{
	self function_fd9fb79b(#"hash_31951837e7c9b9ef");
}

/*
	Name: function_d9ae19f0
	Namespace: contracts
	Checksum: 0xBC2799C3
	Offset: 0x2918
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_d9ae19f0(player)
{
	if(player.var_9cd2c51d.var_43797ec0.statname === #"eq_stimshot" && (isdefined(player.heal.heal_amount) && isdefined(player.heal.var_fa57541f)))
	{
		player function_fd9fb79b(#"hash_4222068ae31bdf3f", player.heal.heal_amount - player.heal.var_fa57541f);
	}
}

/*
	Name: devgui_setup
	Namespace: contracts
	Checksum: 0xFE3D819F
	Offset: 0x29D0
	Size: 0x12C
	Parameters: 0
	Flags: None
*/
function devgui_setup()
{
	/#
		devgui_base = "";
		wait(3);
		function_e07e542b(devgui_base, undefined);
		function_17a92a99(devgui_base);
		function_b308be00(devgui_base);
		function_aae10509(devgui_base);
		function_7402288f(devgui_base);
		function_ef925b75(devgui_base);
		function_5ab1c2d4(devgui_base);
		function_1379e87e(devgui_base);
		function_6339ba69(devgui_base);
		function_b8984e1a(devgui_base);
		function_6961cd46(devgui_base);
	#/
}

/*
	Name: function_17a92a99
	Namespace: contracts
	Checksum: 0x4CF14E03
	Offset: 0x2B08
	Size: 0x384
	Parameters: 1
	Flags: None
*/
function function_17a92a99(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_b308be00
	Namespace: contracts
	Checksum: 0xE535907E
	Offset: 0x2E98
	Size: 0x4C4
	Parameters: 1
	Flags: None
*/
function function_b308be00(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_aae10509
	Namespace: contracts
	Checksum: 0xB20C2CE6
	Offset: 0x3368
	Size: 0x2E4
	Parameters: 1
	Flags: None
*/
function function_aae10509(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_7402288f
	Namespace: contracts
	Checksum: 0xBA61AA79
	Offset: 0x3658
	Size: 0x6F4
	Parameters: 1
	Flags: None
*/
function function_7402288f(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_ef925b75
	Namespace: contracts
	Checksum: 0x5A2543B
	Offset: 0x3D58
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_ef925b75(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_5ab1c2d4
	Namespace: contracts
	Checksum: 0x63CC3C66
	Offset: 0x3E40
	Size: 0x2BC
	Parameters: 1
	Flags: None
*/
function function_5ab1c2d4(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_1379e87e
	Namespace: contracts
	Checksum: 0xA4852027
	Offset: 0x4108
	Size: 0x5DC
	Parameters: 1
	Flags: None
*/
function function_1379e87e(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_6339ba69
	Namespace: contracts
	Checksum: 0x9ACC28AE
	Offset: 0x46F0
	Size: 0x17C
	Parameters: 1
	Flags: None
*/
function function_6339ba69(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_b8984e1a
	Namespace: contracts
	Checksum: 0x27EDFC56
	Offset: 0x4878
	Size: 0x30C
	Parameters: 1
	Flags: None
*/
function function_b8984e1a(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

/*
	Name: function_6961cd46
	Namespace: contracts
	Checksum: 0x71527998
	Offset: 0x4B90
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function function_6961cd46(var_1d89ece6)
{
	/#
		var_78a6fb52 = var_1d89ece6 + "";
		var_c8d599b5 = "";
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
		util::function_3f749abc(var_78a6fb52 + "", var_c8d599b5 + "");
	#/
}

