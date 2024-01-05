#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using script_437ce686d29bb81b;
#using scripts\weapons\weapons.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_8d0ae0b4;

/*
	Name: function_f7be242f
	Namespace: namespace_8d0ae0b4
	Checksum: 0xA3B198D8
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f7be242f()
{
	level notify(1973202239);
}

/*
	Name: __init__system__
	Namespace: namespace_8d0ae0b4
	Checksum: 0x14186D7
	Offset: 0x130
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3c80acaf1d791b8c", &function_70a657d8, undefined, undefined, #"hash_53528dbbf6cd15c4");
}

/*
	Name: function_70a657d8
	Namespace: namespace_8d0ae0b4
	Checksum: 0xC6BC64EC
	Offset: 0x180
	Size: 0x32C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_46821767 = getdvarint(#"hash_661461deeee00da6", 0);
	telemetry::function_98df8818(#"hash_44873692d238cf3b", &function_3f08a12b);
	telemetry::function_98df8818(#"hash_4481df211c9d18aa", &function_3b4b8944);
	telemetry::function_98df8818(#"hash_27cccc0731de1722", &function_1f5722ec);
	callback::on_item_drop(&on_item_drop);
	callback::on_item_pickup(&on_item_pickup);
	callback::on_spawned(&on_player_spawned);
	callback::add_callback(#"objective_started", &function_e38db3d4);
	callback::add_callback(#"objective_ended", &function_f13d2749);
	callback::add_callback(#"hash_276921163232533", &function_8a38be09);
	callback::add_callback(#"hash_565739346fc951ae", &function_e89b1c3f);
	telemetry::add_callback(#"on_game_playing", &function_72c32279);
	telemetry::add_callback(#"hash_3ca80e35288a78d0", &function_d519e318);
	telemetry::add_callback(#"on_player_connect", &on_player_connect);
	telemetry::add_callback(#"on_player_disconnect", &on_player_disconnect);
	telemetry::add_callback(#"on_round_end", &on_round_end);
	telemetry::add_callback(#"hash_5118a91e667446ee", &on_round_end);
	telemetry::function_98df8818(#"hash_b88b6d2e0028e13", &function_abbc84ad);
}

/*
	Name: function_72c32279
	Namespace: namespace_8d0ae0b4
	Checksum: 0xF4903143
	Offset: 0x4B8
	Size: 0x3AA
	Parameters: 0
	Flags: Linked
*/
function function_72c32279()
{
	players = getplayers();
	foreach(player in players)
	{
		player on_player_connect();
	}
	/#
		println("" + getutc());
		println("" + util::get_map_name());
		println("" + level.gametype);
		println("" + sessionmodeisprivateonlinegame());
		println("" + sessionmodeissystemlink());
		println("" + isdedicated());
		println("");
	#/
	utc = getutc();
	if(isdefined(game.telemetry))
	{
		game.telemetry.utc_start_time_s = utc;
	}
	matchstart = {};
	matchstart.utc_start_time_s = utc;
	matchstart.map = hash(util::get_map_name());
	matchstart.game_type = hash(level.gametype);
	matchstart.var_c8019fa4 = sessionmodeisprivateonlinegame();
	matchstart.is_offline = sessionmodeissystemlink();
	matchstart.var_cc957f27 = isdedicated();
	matchstart.var_b9e06742 = function_cd124b7c();
	matchstart.playlist_name = hash(function_970f37d1());
	matchstart.is_playtest = getdvarint(#"hash_4c63a0806012e032", 0);
	matchstart.var_a14949d8 = getdvarstring(#"hash_164a9a28628343ef", "");
	function_92d1707f(#"hash_2976350adaf61c93", matchstart);
	if(isdefined(game.telemetry))
	{
		game.telemetry.var_29d0de09 = function_f8d53445();
	}
}

/*
	Name: function_d519e318
	Namespace: namespace_8d0ae0b4
	Checksum: 0x58714770
	Offset: 0x870
	Size: 0x4FC
	Parameters: 0
	Flags: Linked
*/
function function_d519e318()
{
	util::function_64ebd94d();
	players = getplayers();
	foreach(player in players)
	{
		player function_143fa1b9();
	}
	/#
		println("" + function_f8d53445());
		println("" + gettime());
		println("" + util::get_map_name());
		println("" + level.gametype);
		println("" + getutc());
	#/
	utc = getutc();
	matchend = {};
	matchend.utc_start_time_s = 0;
	matchend.utc_end_time_s = utc;
	matchend.map = hash(util::get_map_name());
	matchend.game_type = hash(level.gametype);
	matchend.var_c8019fa4 = sessionmodeisprivateonlinegame();
	matchend.is_offline = sessionmodeissystemlink();
	matchend.var_cc957f27 = isdedicated();
	matchend.player_count = 0;
	matchend.life_count = 0;
	matchend.var_b9e06742 = function_cd124b7c();
	matchend.playlist_name = hash(function_970f37d1());
	matchend.is_playtest = getdvarint(#"hash_4c63a0806012e032", 0);
	matchend.var_a14949d8 = getdvarstring(#"hash_164a9a28628343ef", "");
	if(isdefined(game.telemetry))
	{
		game.telemetry.var_36b58be2 = 1;
	}
	if(isdefined(game.telemetry.utc_start_time_s))
	{
		time_seconds = utc - game.telemetry.utc_start_time_s;
		/#
			println("" + time_seconds);
		#/
		matchend.utc_start_time_s = game.telemetry.utc_start_time_s;
	}
	match_duration = function_f8d53445() / 1000;
	/#
		println("" + match_duration);
	#/
	if(isdefined(game.telemetry.player_count))
	{
		/#
			println("" + game.telemetry.player_count);
		#/
		matchend.player_count = game.telemetry.player_count;
	}
	if(isdefined(game.telemetry.life_count))
	{
		/#
			println("" + game.telemetry.life_count);
		#/
		matchend.life_count = game.telemetry.life_count;
	}
	function_92d1707f(#"hash_572d4a196995ede6", matchend);
	/#
		println("");
	#/
}

/*
	Name: on_round_end
	Namespace: namespace_8d0ae0b4
	Checksum: 0x52A8ADE3
	Offset: 0xD78
	Size: 0x18C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_round_end(data)
{
	var_a5722144 = {};
	var_a5722144.var_29d0de09 = (isdefined(game.telemetry.var_29d0de09) ? game.telemetry.var_29d0de09 : 0);
	var_a5722144.var_b0ab3472 = function_f8d53445();
	var_a5722144.var_b4da50f0 = var_a5722144.var_b0ab3472 - var_a5722144.var_29d0de09;
	var_a5722144.round_number = zm_utility::get_round_number();
	players = getplayers();
	foreach(player in players)
	{
		player function_2d28a3b3(data);
	}
	if(isdefined(game.telemetry))
	{
		game.telemetry.var_29d0de09 = var_a5722144.var_b0ab3472;
	}
	function_92d1707f(#"hash_1ddb7882a47b6a1f", var_a5722144);
}

/*
	Name: function_2d28a3b3
	Namespace: namespace_8d0ae0b4
	Checksum: 0x1A3BC1A2
	Offset: 0xF10
	Size: 0x1182
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2d28a3b3(data)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.pers[#"telemetry"]))
	{
		self.pers[#"telemetry"] = {};
	}
	if(!isdefined(self.pers[#"telemetry"].var_ff8bd64a))
	{
		self.pers[#"telemetry"].var_ff8bd64a = {};
	}
	playerdata = {};
	if(isdefined(self.pers))
	{
		playerdata.score = (isdefined(self.pers[#"score"]) ? self.pers[#"score"] : 0);
		playerdata.kills = (isdefined(self.pers[#"kills"]) ? self.pers[#"kills"] : 0);
		playerdata.deaths = (isdefined(self.pers[#"deaths"]) ? self.pers[#"deaths"] : 0);
	}
	playerdata.var_d0266750 = (isdefined(self.pers[#"score"]) ? self.pers[#"score"] : 0) - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.score) ? self.pers[#"telemetry"].var_ff8bd64a.score : 0);
	playerdata.var_832beab2 = (isdefined(self.pers[#"kills"]) ? self.pers[#"kills"] : 0) - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.kills) ? self.pers[#"telemetry"].var_ff8bd64a.kills : 0);
	var_60851c1 = self rank::function_5b197def(0) - (isdefined(self.pers[#"telemetry"].var_a1938c60) ? self.pers[#"telemetry"].var_a1938c60 : 0);
	var_af273c68 = self rank::function_5b197def(1) - (isdefined(self.pers[#"telemetry"].var_970f034c) ? self.pers[#"telemetry"].var_970f034c : 0);
	var_665cf4ce = self rank::function_5b197def(5) - (isdefined(self.pers[#"telemetry"].var_12173831) ? self.pers[#"telemetry"].var_12173831 : 0);
	var_b8b0d676 = self rank::function_5b197def(2) - (isdefined(self.pers[#"telemetry"].var_43ab3c14) ? self.pers[#"telemetry"].var_43ab3c14 : 0);
	var_7fe08e84 = self rank::function_5b197def(4) - (isdefined(self.pers[#"telemetry"].var_9b0e83ac) ? self.pers[#"telemetry"].var_9b0e83ac : 0);
	var_3874f1f2 = self rank::getrankxp() - (isdefined(self.pers[#"telemetry"].var_35a0b8bd) ? self.pers[#"telemetry"].var_35a0b8bd : 0);
	playerdata.var_819cb855 = max(0, var_60851c1 - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_60851c1) ? self.pers[#"telemetry"].var_ff8bd64a.var_60851c1 : 0));
	playerdata.var_bf725dc2 = max(0, var_af273c68 - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_af273c68) ? self.pers[#"telemetry"].var_ff8bd64a.var_af273c68 : 0));
	playerdata.var_dcf31c62 = max(0, var_665cf4ce - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_665cf4ce) ? self.pers[#"telemetry"].var_ff8bd64a.var_665cf4ce : 0));
	playerdata.var_776b5e62 = max(0, var_b8b0d676 - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_b8b0d676) ? self.pers[#"telemetry"].var_ff8bd64a.var_b8b0d676 : 0));
	playerdata.var_f86edb1e = max(0, var_7fe08e84 - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_7fe08e84) ? self.pers[#"telemetry"].var_ff8bd64a.var_7fe08e84 : 0));
	playerdata.var_50941cea = max(0, var_3874f1f2 - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_3874f1f2) ? self.pers[#"telemetry"].var_ff8bd64a.var_3874f1f2 : 0));
	playerdata.round_number = zm_utility::get_round_number();
	playerdata.var_29d0de09 = (isdefined(game.telemetry.var_29d0de09) ? game.telemetry.var_29d0de09 : 0);
	playerdata.var_b0ab3472 = function_f8d53445();
	playerdata.var_b4da50f0 = playerdata.var_b0ab3472 - playerdata.var_29d0de09;
	var_4e4f65c9 = undefined;
	if(isdefined(self.inventory.items[17 + 1]))
	{
		var_4e4f65c9 = self.inventory.items[17 + 1];
	}
	primary_weapon = undefined;
	if(isdefined(self.weapon_array_primary[0]))
	{
		primary_weapon = self.weapon_array_primary[0];
	}
	playerdata.weapon_primary = (isdefined(primary_weapon.statname) ? primary_weapon.statname : #"");
	playerdata.var_1fc74cc3 = hash((isdefined(var_4e4f65c9.var_a6762160.rarity) ? var_4e4f65c9.var_a6762160.rarity : #""));
	playerdata.var_7acc0bf9 = [];
	if(isdefined(primary_weapon.attachments) && primary_weapon.attachments.size > 0)
	{
		attachments = [];
		foreach(attachment in primary_weapon.attachments)
		{
			if(!isdefined(attachments))
			{
				attachments = [];
			}
			else if(!isarray(attachments))
			{
				attachments = array(attachments);
			}
			attachments[attachments.size] = hash(attachment);
		}
		playerdata.var_7acc0bf9 = attachments;
	}
	playerdata.var_649035df = (isdefined(var_4e4f65c9.var_a8bccf69) ? var_4e4f65c9.var_a8bccf69 : 0);
	playerdata.var_2eee3e82 = (isdefined(var_4e4f65c9.aat) ? var_4e4f65c9.aat : "");
	var_ec323ef9 = undefined;
	if(isdefined(self.inventory.items[((17 + 1) + 8) + 1]))
	{
		var_ec323ef9 = self.inventory.items[((17 + 1) + 8) + 1];
	}
	secondary_weapon = undefined;
	if(isdefined(self.weapon_array_primary[1]))
	{
		secondary_weapon = self.weapon_array_primary[1];
	}
	playerdata.weapon_secondary = (isdefined(secondary_weapon.statname) ? secondary_weapon.statname : #"");
	playerdata.var_882c8428 = hash((isdefined(var_ec323ef9.var_a6762160.rarity) ? var_ec323ef9.var_a6762160.rarity : #""));
	playerdata.var_a76d2c9b = [];
	if(isdefined(secondary_weapon.attachments) && secondary_weapon.attachments.size > 0)
	{
		attachments = [];
		foreach(attachment in secondary_weapon.attachments)
		{
			if(!isdefined(attachments))
			{
				attachments = [];
			}
			else if(!isarray(attachments))
			{
				attachments = array(attachments);
			}
			attachments[attachments.size] = hash(attachment);
		}
		playerdata.var_a76d2c9b = attachments;
	}
	playerdata.var_df0e6d74 = (isdefined(var_ec323ef9.var_a8bccf69) ? var_ec323ef9.var_a8bccf69 : 0);
	playerdata.var_fed00167 = (isdefined(var_ec323ef9.aat) ? var_ec323ef9.aat : "");
	weapons::update_last_held_weapon_timings(gettime(), self.currentweapon);
	playerdata.var_e2a2c41a = [];
	if(isdefined(self.pers[#"hash_69b63c99be1fb428"]))
	{
		weapon_names = getarraykeys(self.pers[#"hash_69b63c99be1fb428"]);
		weapon_index = 0;
		while(weapon_index < weapon_names.size)
		{
			weapon_name = weapon_names[weapon_index];
			weapon_struct = self.pers[#"hash_69b63c99be1fb428"][weapon_name];
			var_fa5921b6 = weapon_struct[#"xpearned"];
			if(isdefined(var_fa5921b6) && var_fa5921b6 > 0)
			{
				loc_00001DA2:
				loc_00001DE2:
				loc_00001E22:
				loc_00001E62:
				var_cad81941 = {#hash_fa5921b6:(isdefined(weapon_struct[#"xpearned"]) ? weapon_struct[#"xpearned"] : 0), #hits:(isdefined(weapon_struct[#"hits"]) ? weapon_struct[#"hits"] : 0), #shots:(isdefined(weapon_struct[#"shots"]) ? weapon_struct[#"shots"] : 0), #kills:(isdefined(weapon_struct[#"kills"]) ? weapon_struct[#"kills"] : 0), #time_used_s:(isdefined(weapon_struct[#"timeused"]) ? weapon_struct[#"timeused"] : 0), #weapon_name:weapon_name};
				self function_678f57c8(#"hash_2da62e026250c65e", var_cad81941);
				waitframe(1);
			}
			weapon_index = weapon_index + 1;
		}
	}
	if(!isdefined(self))
	{
		return;
	}
	self.pers[#"hash_69b63c99be1fb428"] = [];
	self function_678f57c8(#"hash_6e340d9d9e255e95", playerdata);
	self.pers[#"telemetry"].var_ff8bd64a.score = playerdata.score;
	self.pers[#"telemetry"].var_ff8bd64a.kills = playerdata.kills;
	self.pers[#"telemetry"].var_ff8bd64a.var_60851c1 = var_60851c1;
	self.pers[#"telemetry"].var_ff8bd64a.var_af273c68 = var_af273c68;
	self.pers[#"telemetry"].var_ff8bd64a.var_665cf4ce = var_665cf4ce;
	self.pers[#"telemetry"].var_ff8bd64a.var_b8b0d676 = var_b8b0d676;
	self.pers[#"telemetry"].var_ff8bd64a.var_7fe08e84 = var_7fe08e84;
	self.pers[#"telemetry"].var_ff8bd64a.var_3874f1f2 = var_3874f1f2;
}

/*
	Name: on_player_connect
	Namespace: namespace_8d0ae0b4
	Checksum: 0x5E1994B4
	Offset: 0x20A0
	Size: 0x4A4
	Parameters: 1
	Flags: Linked
*/
function on_player_connect(data)
{
	if(!is_true(self.pers[#"telemetry"].connected))
	{
		/#
			println("" + gettime());
			println("" + getutc());
			println("" + self.name);
		#/
		self.pers[#"weaponstats"] = [];
		if(!isdefined(self.pers[#"telemetry"]))
		{
			self.pers[#"telemetry"] = {};
		}
		self.pers[#"telemetry"].utc_connect_time_s = getutc();
		self.pers[#"telemetry"].connected = 1;
		self.pers[#"telemetry"].var_35a0b8bd = self rank::getrankxp();
		self.pers[#"telemetry"].var_a1938c60 = self rank::function_5b197def(0);
		self.pers[#"telemetry"].var_970f034c = self rank::function_5b197def(1);
		self.pers[#"telemetry"].var_43ab3c14 = self rank::function_5b197def(2);
		self.pers[#"telemetry"].var_9c4d3f78 = self rank::function_5b197def(3);
		self.pers[#"telemetry"].var_12173831 = self rank::function_5b197def(5);
		self.pers[#"telemetry"].var_9f177532 = self rank::getrank();
		if(isdefined(game.telemetry.player_count))
		{
			self.pers[#"telemetry"].var_6ba64843 = game.telemetry.player_count;
			game.telemetry.player_count++;
			/#
				println("" + game.telemetry.player_count);
			#/
		}
		else
		{
			/#
				println("");
			#/
			return;
		}
		/#
			println("");
		#/
		playerdata = {};
		playerdata.utc_connect_time_s = self.pers[#"telemetry"].utc_connect_time_s;
		playerdata.var_6ba64843 = (isdefined(self.pers[#"telemetry"].var_6ba64843) ? self.pers[#"telemetry"].var_6ba64843 : 0);
		playerdata.var_524ab934 = self function_d40f1a0e();
		playerdata.var_504e19f4 = self function_21f71ac8();
		playerdata.var_68441d6f = self function_325dc923();
		self function_678f57c8(#"hash_577b6d450d80cbd5", playerdata);
	}
}

/*
	Name: function_143fa1b9
	Namespace: namespace_8d0ae0b4
	Checksum: 0x20ECAFA8
	Offset: 0x2550
	Size: 0x80C
	Parameters: 0
	Flags: Linked
*/
function function_143fa1b9()
{
	if(!is_true(self.pers[#"telemetry"].connected))
	{
		return;
	}
	self.pers[#"telemetry"].connected = 0;
	playerdata = {};
	/#
		println("" + self.name);
		println("" + gettime());
	#/
	playerdata.utc_connect_time_s = 0;
	playerdata.utc_disconnect_time_s = 0;
	playerdata.var_37b8e421 = 0;
	utc = getutc();
	if(isdefined(self.pers[#"telemetry"].utc_connect_time_s))
	{
		playerdata.utc_connect_time_s = self.pers[#"telemetry"].utc_connect_time_s;
		playerdata.utc_disconnect_time_s = utc;
		playerdata.var_37b8e421 = utc - playerdata.utc_connect_time_s;
	}
	playerdata.var_6ba64843 = (isdefined(self.pers[#"telemetry"].var_6ba64843) ? self.pers[#"telemetry"].var_6ba64843 : 0);
	if(isdefined(self.pers))
	{
		playerdata.score = (isdefined(self.pers[#"score"]) ? self.pers[#"score"] : 0);
		playerdata.kills = (isdefined(self.pers[#"kills"]) ? self.pers[#"kills"] : 0);
		playerdata.deaths = (isdefined(self.pers[#"deaths"]) ? self.pers[#"deaths"] : 0);
		playerdata.headshots = (isdefined(self.pers[#"headshots"]) ? self.pers[#"headshots"] : 0);
		playerdata.suicides = (isdefined(self.pers[#"suicides"]) ? self.pers[#"suicides"] : 0);
	}
	playerdata.var_35a0b8bd = (isdefined(self.pers[#"telemetry"].var_35a0b8bd) ? self.pers[#"telemetry"].var_35a0b8bd : 0);
	playerdata.var_f29581ce = self rank::getrankxp();
	playerdata.var_a1938c60 = (isdefined(self.pers[#"telemetry"].var_a1938c60) ? self.pers[#"telemetry"].var_a1938c60 : 0);
	playerdata.var_7ddf8420 = self rank::function_5b197def(0);
	playerdata.var_970f034c = (isdefined(self.pers[#"telemetry"].var_970f034c) ? self.pers[#"telemetry"].var_970f034c : 0);
	playerdata.var_b7d93a80 = self rank::function_5b197def(1);
	playerdata.var_43ab3c14 = (isdefined(self.pers[#"telemetry"].var_43ab3c14) ? self.pers[#"telemetry"].var_43ab3c14 : 0);
	playerdata.var_460c9ce = self rank::function_5b197def(2);
	playerdata.var_9c4d3f78 = (isdefined(self.pers[#"telemetry"].var_9c4d3f78) ? self.pers[#"telemetry"].var_9c4d3f78 : 0);
	playerdata.var_5f67b464 = self rank::function_5b197def(3);
	playerdata.var_12173831 = (isdefined(self.pers[#"telemetry"].var_12173831) ? self.pers[#"telemetry"].var_12173831 : 0);
	playerdata.var_c4d676ee = self rank::function_5b197def(5);
	playerdata.var_9f177532 = (isdefined(self.pers[#"telemetry"].var_9f177532) ? self.pers[#"telemetry"].var_9f177532 : 0);
	playerdata.var_735f5996 = self rank::getrank();
	if(!is_true(level.disablestattracking))
	{
		playerdata.var_9ffd4086 = self zm_stats::function_529e1302(#"kills");
		playerdata.var_56c22769 = self zm_stats::function_529e1302(#"deaths");
		playerdata.var_4ab9220a = self zm_stats::function_529e1302(#"score");
	}
	sessionmode = currentsessionmode();
	if(sessionmode !== 4)
	{
		role = self player_role::get();
		var_a791abd1 = function_b14806c6(role, sessionmode);
	}
	playerdata.operator = (isdefined(var_a791abd1) ? var_a791abd1 : 0);
	playerdata.var_161a9fc9 = 0;
	if(!is_true(game.telemetry.var_36b58be2))
	{
		playerdata.var_161a9fc9 = 1;
	}
	self function_678f57c8(#"hash_60754262dd09efac", playerdata);
	self function_e5d9f30(playerdata.score, playerdata.kills, playerdata.deaths, playerdata.headshots, playerdata.suicides, playerdata.var_35a0b8bd, playerdata.var_f29581ce, playerdata.var_9f177532, playerdata.var_735f5996, zm_utility::get_round_number(), playerdata.var_37b8e421);
}

/*
	Name: on_player_disconnect
	Namespace: namespace_8d0ae0b4
	Checksum: 0xF1AAE3C2
	Offset: 0x2D68
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_player_disconnect(data)
{
	self function_143fa1b9();
}

/*
	Name: on_player_spawned
	Namespace: namespace_8d0ae0b4
	Checksum: 0x2E5F72A
	Offset: 0x2D98
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(!isdefined(self.pers[#"telemetry"]))
	{
		self.pers[#"telemetry"] = {};
	}
	self.pers[#"telemetry"].life = {};
	self.pers[#"telemetry"].life.var_62c7b24e = function_f8d53445();
	self.pers[#"telemetry"].life.spawn_origin = self.origin;
	if(isdefined(game.telemetry.life_count))
	{
		self.pers[#"telemetry"].life.life_index = game.telemetry.life_count;
		game.telemetry.life_count++;
		/#
			println("" + self.name);
			println("" + game.telemetry.life_count);
		#/
	}
	/#
		println("");
	#/
}

/*
	Name: function_3f08a12b
	Namespace: namespace_8d0ae0b4
	Checksum: 0xBB926068
	Offset: 0x2F48
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3f08a12b(data)
{
	/#
		assert(isdefined(data.weapon), "");
	#/
	var_abb39438 = {};
	var_abb39438.wallbuy_weapon = data.weapon.statname;
	var_abb39438.var_5067ed1f = hash(data.rarity);
	var_abb39438.round_number = zm_utility::get_round_number();
	var_abb39438.var_173cd713 = zm_utility::function_e3025ca5();
	data.purchaser function_678f57c8(#"hash_6fc06e3919c02137", var_abb39438);
}

/*
	Name: on_item_pickup
	Namespace: namespace_8d0ae0b4
	Checksum: 0xAA587FFE
	Offset: 0x3028
	Size: 0x23C
	Parameters: 1
	Flags: Linked, Private
*/
function private on_item_pickup(params)
{
	item = params.item;
	weapon = namespace_a0d533d1::function_2b83d3ff(item);
	if(isdefined(item) && isdefined(weapon))
	{
		weapon.var_dc9b0289 = gettime();
		if(is_true(params.var_7b753bce))
		{
			var_a63abfbe = {};
			var_a63abfbe.weapon = weapon.statname;
			var_a63abfbe.var_5067ed1f = hash(item.var_a6762160.rarity);
			if(weapon.attachments.size > 0)
			{
				attachments = [];
				foreach(attachment in weapon.attachments)
				{
					if(!isdefined(attachments))
					{
						attachments = [];
					}
					else if(!isarray(attachments))
					{
						attachments = array(attachments);
					}
					attachments[attachments.size] = hash(attachment);
				}
				var_a63abfbe.weapon_attachments = attachments;
			}
			var_a63abfbe.var_ae6a042c = item.var_a8bccf69;
			var_a63abfbe.var_78a16b58 = item.aat;
			var_a63abfbe.round_number = zm_utility::get_round_number();
			var_a63abfbe.var_173cd713 = zm_utility::function_e3025ca5();
			params.player function_678f57c8(#"hash_1191dc74fe41b6a", var_a63abfbe);
		}
	}
}

/*
	Name: on_item_drop
	Namespace: namespace_8d0ae0b4
	Checksum: 0xABCDC0B3
	Offset: 0x3270
	Size: 0x234
	Parameters: 1
	Flags: Linked, Private
*/
function private on_item_drop(params)
{
	item = params.item;
	weapon = namespace_a0d533d1::function_2b83d3ff(item);
	if(isdefined(item) && isdefined(weapon))
	{
		var_a63abfbe = {};
		var_a63abfbe.weapon = weapon.statname;
		var_a63abfbe.var_5067ed1f = hash(item.var_a6762160.rarity);
		if(weapon.attachments.size > 0)
		{
			attachments = [];
			foreach(attachment in weapon.attachments)
			{
				if(!isdefined(attachments))
				{
					attachments = [];
				}
				else if(!isarray(attachments))
				{
					attachments = array(attachments);
				}
				attachments[attachments.size] = hash(attachment);
			}
			var_a63abfbe.weapon_attachments = attachments;
		}
		var_a63abfbe.var_ae6a042c = item.var_a8bccf69;
		var_a63abfbe.var_78a16b58 = item.aat;
		var_a63abfbe.round_number = zm_utility::get_round_number();
		var_a63abfbe.var_173cd713 = zm_utility::function_e3025ca5();
		if(isdefined(weapon.var_dc9b0289))
		{
			var_a63abfbe.duration_ms = gettime() - weapon.var_dc9b0289;
		}
		self function_678f57c8(#"hash_225909f0b104b123", var_a63abfbe);
	}
}

/*
	Name: function_1f5722ec
	Namespace: namespace_8d0ae0b4
	Checksum: 0xCAEB6086
	Offset: 0x34B0
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1f5722ec(data)
{
	if(!isplayer(data.player))
	{
		return;
	}
	if(is_true(game.telemetry.var_3bee079a[data.player getentitynumber()]))
	{
		data.round = (isdefined(level.round_number) ? level.round_number : 0) + 1;
		function_2d2b9f81(data);
	}
}

/*
	Name: function_3b4b8944
	Namespace: namespace_8d0ae0b4
	Checksum: 0xE992F362
	Offset: 0x3560
	Size: 0xF4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3b4b8944(data)
{
	if(!isplayer(data.player))
	{
		return;
	}
	if(!isdefined(game.telemetry.var_3bee079a))
	{
		game.telemetry.var_3bee079a = [];
	}
	if(!isdefined(game.telemetry.var_3bee079a[data.player getentitynumber()]))
	{
		game.telemetry.var_3bee079a[data.player getentitynumber()] = 1;
	}
	data.round = (isdefined(level.round_number) ? level.round_number : 0);
	function_2d2b9f81(data);
}

/*
	Name: function_2d2b9f81
	Namespace: namespace_8d0ae0b4
	Checksum: 0xDE120872
	Offset: 0x3660
	Size: 0xE4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2d2b9f81(data)
{
	var_2153b0fe = {};
	primaryweapon = data.player getloadoutweapon(data.player.class_num, "primary");
	var_2153b0fe.weapon = primaryweapon.statname;
	var_c9ec28d9 = data.player function_b958b70d(data.player.class_num, "specialgrenade");
	var_2153b0fe.field_upgrade = var_c9ec28d9;
	var_2153b0fe.round_number = data.round;
	data.player function_678f57c8(#"hash_193890e3bb1b528f", var_2153b0fe);
}

/*
	Name: function_abbc84ad
	Namespace: namespace_8d0ae0b4
	Checksum: 0xB10E715C
	Offset: 0x3750
	Size: 0x320
	Parameters: 1
	Flags: Linked
*/
function function_abbc84ad(data)
{
	if(level.var_46821767 === 1)
	{
		return;
	}
	key = data.weapon.statname;
	if(!isdefined(data.player.pers[#"weaponstats"]))
	{
		data.player.pers[#"weaponstats"] = [];
	}
	if(!isdefined(data.player.pers[#"weaponstats"][key]))
	{
		data.player.pers[#"weaponstats"][key] = [];
	}
	if(!isdefined(data.player.pers[#"weaponstats"][key][data.statname]))
	{
		data.player.pers[#"weaponstats"][key][data.statname] = 0;
	}
	data.player.pers[#"weaponstats"][key][data.statname] = data.player.pers[#"weaponstats"][key][data.statname] + data.value;
	if(!isdefined(data.player.pers[#"hash_69b63c99be1fb428"]))
	{
		data.player.pers[#"hash_69b63c99be1fb428"] = [];
	}
	if(!isdefined(data.player.pers[#"hash_69b63c99be1fb428"][key]))
	{
		data.player.pers[#"hash_69b63c99be1fb428"][key] = [];
	}
	if(!isdefined(data.player.pers[#"hash_69b63c99be1fb428"][key][data.statname]))
	{
		data.player.pers[#"hash_69b63c99be1fb428"][key][data.statname] = 0;
	}
	data.player.pers[#"hash_69b63c99be1fb428"][key][data.statname] = data.player.pers[#"hash_69b63c99be1fb428"][key][data.statname] + data.value;
}

/*
	Name: function_8a38be09
	Namespace: namespace_8d0ae0b4
	Checksum: 0xB6A0EC40
	Offset: 0x3A78
	Size: 0x154
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8a38be09(params)
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	level endon(#"end_game");
	if(namespace_cf6efd05::function_85b812c9())
	{
		level flag::wait_till(#"initial_fade_in_complete");
	}
	else
	{
		level flag::wait_till("intro_scene_done");
	}
	level.var_7cb19409 = function_f8d53445();
	var_bdad1c21 = {#hash_b8cbcff2:level.var_7d45d0d4.var_1fcbdf50, #hash_ea3397d3:getplayers().size, #hash_c2b4f8d0:level.var_b48509f9, #hash_e4ca5a4b:level.var_7cb19409, #hash_579fb993:level.script};
	function_92d1707f(#"hash_424c5668eaeebb31", var_bdad1c21);
}

/*
	Name: function_e89b1c3f
	Namespace: namespace_8d0ae0b4
	Checksum: 0x4E17AE6
	Offset: 0x3BD8
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e89b1c3f(params)
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(isdefined(level.var_7cb19409))
	{
		var_199a2a04 = function_f8d53445() - level.var_7cb19409;
	}
	var_bdad1c21 = {#hash_b8cbcff2:level.var_7d45d0d4.var_1fcbdf50, #hash_ea3397d3:getplayers().size, #hash_c2b4f8d0:level.var_b48509f9, #hash_395efa0a:var_199a2a04, #hash_44bf1770:function_f8d53445(), #hash_e4ca5a4b:level.var_7cb19409, #hash_579fb993:level.script};
	level.var_7cb19409 = undefined;
	function_92d1707f(#"hash_424c5668eaeebb31", var_bdad1c21);
}

/*
	Name: function_e38db3d4
	Namespace: namespace_8d0ae0b4
	Checksum: 0x77FC9D01
	Offset: 0x3D30
	Size: 0x12C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e38db3d4(params, activator)
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	level.var_f099aebe = function_f8d53445();
	var_8c24333b = {#hash_adfc9a7e:getplayers().size, #hash_174b4191:level.var_b48509f9, #hash_ac2606df:activator.instance.location.targetname, #hash_90f03449:level.script, #hash_fffcd514:level.var_f099aebe, #hash_4472945a:activator.instance.content_script_name};
	function_92d1707f(#"hash_7c94738a8f65d945", var_8c24333b);
}

/*
	Name: function_f13d2749
	Namespace: namespace_8d0ae0b4
	Checksum: 0x61E45DB7
	Offset: 0x3E68
	Size: 0x19C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f13d2749(params)
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(isdefined(level.var_f099aebe))
	{
		var_ecd4394f = function_f8d53445() - level.var_f099aebe;
	}
	var_8c24333b = {#hash_adfc9a7e:getplayers().size, #hash_174b4191:level.var_b48509f9, #hash_a32e2b21:is_true(params.completed), #hash_85aa2ee9:var_ecd4394f, #hash_ac2606df:params.instance.location.targetname, #hash_90f03449:level.script, #hash_26d27f23:function_f8d53445(), #hash_fffcd514:level.var_f099aebe, #hash_4472945a:params.instance.content_script_name};
	level.var_f099aebe = undefined;
	function_92d1707f(#"hash_7c94738a8f65d945", var_8c24333b);
}

