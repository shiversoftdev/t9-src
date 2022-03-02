#using script_18f0d22c75b141a7;
#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_3f27a7b2232674db;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_8d0ae0b4;

/*
	Name: function_89f2df9
	Namespace: namespace_8d0ae0b4
	Checksum: 0xDBC8B021
	Offset: 0xE0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3c80acaf1d791b8c", &function_70a657d8, undefined, undefined, #"hash_53528dbbf6cd15c4");
}

/*
	Name: function_70a657d8
	Namespace: namespace_8d0ae0b4
	Checksum: 0xD8F43823
	Offset: 0x130
	Size: 0x214
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	telemetry::function_98df8818(#"hash_44873692d238cf3b", &function_3f08a12b);
	telemetry::function_98df8818(#"hash_4481df211c9d18aa", &function_3b4b8944);
	telemetry::function_98df8818(#"hash_27cccc0731de1722", &function_1f5722ec);
	callback::function_7897dfe6(&function_7897dfe6);
	callback::function_10a4dd0a(&function_10a4dd0a);
	callback::on_spawned(&on_player_spawned);
	telemetry::add_callback(#"hash_361e06db4b210e", &function_72c32279);
	telemetry::add_callback(#"hash_3ca80e35288a78d0", &function_d519e318);
	telemetry::add_callback(#"on_player_connect", &on_player_connect);
	telemetry::add_callback(#"on_player_disconnect", &on_player_disconnect);
	telemetry::add_callback(#"hash_193ded5c8932fe29", &function_189f87c1);
	telemetry::add_callback(#"hash_5118a91e667446ee", &function_189f87c1);
}

/*
	Name: function_72c32279
	Namespace: namespace_8d0ae0b4
	Checksum: 0xEBAA4D86
	Offset: 0x350
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
		println("" + util::function_53bbf9d2());
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
	matchstart.map = hash(util::function_53bbf9d2());
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
	Checksum: 0xADCEA163
	Offset: 0x708
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
		player on_player_disconnect();
	}
	/#
		println("" + function_f8d53445());
		println("" + gettime());
		println("" + util::function_53bbf9d2());
		println("" + level.gametype);
		println("" + getutc());
	#/
	utc = getutc();
	matchend = {};
	matchend.utc_start_time_s = 0;
	matchend.utc_end_time_s = utc;
	matchend.map = hash(util::function_53bbf9d2());
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
	Name: function_189f87c1
	Namespace: namespace_8d0ae0b4
	Checksum: 0xED33FC4
	Offset: 0xC10
	Size: 0x18C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_189f87c1(data)
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
	Checksum: 0xB0A5FBBF
	Offset: 0xDA8
	Size: 0xE62
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2d28a3b3(data)
{
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
	playerdata.var_819cb855 = var_60851c1 - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_60851c1) ? self.pers[#"telemetry"].var_ff8bd64a.var_60851c1 : 0);
	playerdata.var_bf725dc2 = var_af273c68 - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_af273c68) ? self.pers[#"telemetry"].var_ff8bd64a.var_af273c68 : 0);
	playerdata.var_dcf31c62 = var_665cf4ce - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_665cf4ce) ? self.pers[#"telemetry"].var_ff8bd64a.var_665cf4ce : 0);
	playerdata.var_776b5e62 = var_b8b0d676 - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_b8b0d676) ? self.pers[#"telemetry"].var_ff8bd64a.var_b8b0d676 : 0);
	playerdata.var_f86edb1e = var_7fe08e84 - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_7fe08e84) ? self.pers[#"telemetry"].var_ff8bd64a.var_7fe08e84 : 0);
	playerdata.var_50941cea = var_3874f1f2 - (isdefined(self.pers[#"telemetry"].var_ff8bd64a.var_3874f1f2) ? self.pers[#"telemetry"].var_ff8bd64a.var_3874f1f2 : 0);
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
	Checksum: 0x563508C4
	Offset: 0x1C18
	Size: 0x45C
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
		self function_678f57c8(#"hash_577b6d450d80cbd5", playerdata);
	}
}

/*
	Name: on_player_disconnect
	Namespace: namespace_8d0ae0b4
	Checksum: 0xE2194758
	Offset: 0x2080
	Size: 0x77C
	Parameters: 1
	Flags: Linked
*/
function on_player_disconnect(data)
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
	role = self player_role::get();
	var_a791abd1 = function_b14806c6(role, currentsessionmode());
	playerdata.operator = (isdefined(var_a791abd1) ? var_a791abd1 : 0);
	playerdata.var_161a9fc9 = 0;
	if(!is_true(game.telemetry.var_36b58be2))
	{
		playerdata.var_161a9fc9 = 1;
	}
	self function_678f57c8(#"hash_60754262dd09efac", playerdata);
}

/*
	Name: on_player_spawned
	Namespace: namespace_8d0ae0b4
	Checksum: 0x4BD4A171
	Offset: 0x2808
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
	Checksum: 0xE2149E6
	Offset: 0x29B8
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
	Name: function_10a4dd0a
	Namespace: namespace_8d0ae0b4
	Checksum: 0xB840EBF4
	Offset: 0x2A98
	Size: 0x23C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_10a4dd0a(params)
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
	Name: function_7897dfe6
	Namespace: namespace_8d0ae0b4
	Checksum: 0xB43461EB
	Offset: 0x2CE0
	Size: 0x234
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7897dfe6(params)
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
	Checksum: 0x4D4605AD
	Offset: 0x2F20
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
	Checksum: 0xD03A1ED4
	Offset: 0x2FD0
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
	Checksum: 0xD41A0FF0
	Offset: 0x30D0
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

