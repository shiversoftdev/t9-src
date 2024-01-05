#using script_32399001bdb550da;
#using scripts\abilities\ability_util.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_25c09ccacf057919;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace profile_traits;

/*
	Name: __init__system__
	Namespace: profile_traits
	Checksum: 0xD2A63AD3
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"profile_traits", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: profile_traits
	Checksum: 0x4A83A24F
	Offset: 0x150
	Size: 0x3B4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		function_bba23c40("", 0.75);
		function_bba23c40("", 0.75);
	#/
	level.var_e85d5a3f = spawnstruct();
	var_1f7a9822 = getscriptbundle(#"profile_traits");
	level.var_e85d5a3f.var_e4f193a3 = [];
	for(i = 0; i < var_1f7a9822.traits.size; i++)
	{
		if(!is_true(var_1f7a9822.traits[i].disabled))
		{
			var_1f7a9822.traits[i].bitflag = 1 << i;
			level.var_e85d5a3f.var_e4f193a3[level.var_e85d5a3f.var_e4f193a3.size] = var_1f7a9822.traits[i];
			continue;
		}
		if(var_1f7a9822.traits[i].ref_name == "classified")
		{
			level.var_e85d5a3f.var_8651d525 = var_1f7a9822.traits[i];
		}
	}
	/#
		function_5ac4dc99("", 0);
		function_5ac4dc99("", -1);
		function_5ac4dc99("", -1);
		function_5ac4dc99("", 0);
		function_cd140ee9("", &function_df62d47f);
		function_cd140ee9("", &function_df62d47f);
		function_cd140ee9("", &function_df62d47f);
		function_cd140ee9("", &function_df62d47f);
		for(i = 0; i < level.var_e85d5a3f.var_e4f193a3.size; i++)
		{
			var_fb7d23d9 = level.var_e85d5a3f.var_e4f193a3[i];
			adddebugcommand(((((("" + var_fb7d23d9.var_7c0b3589) + "") + i) + "") + i) + "");
			adddebugcommand(((((("" + var_fb7d23d9.var_7c0b3589) + "") + i) + "") + i) + "");
		}
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: function_df62d47f
	Namespace: profile_traits
	Checksum: 0x657683C
	Offset: 0x510
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_df62d47f(params)
{
	/#
		level thread function_b8f86396(params);
	#/
}

/*
	Name: function_b8f86396
	Namespace: profile_traits
	Checksum: 0xE19A3B09
	Offset: 0x548
	Size: 0x2A8
	Parameters: 1
	Flags: Private
*/
function private function_b8f86396(params)
{
	/#
		level endon(#"game_ended");
		waitframe(1);
		player = getplayers()[0];
		if(params.name == "")
		{
			var_e3ffeeb4 = params.value;
			if(var_e3ffeeb4 > -1)
			{
				/#
					assert(var_e3ffeeb4 < level.var_e85d5a3f.var_e4f193a3.size);
				#/
				var_fb7d23d9 = level.var_e85d5a3f.var_e4f193a3[var_e3ffeeb4];
				player function_18198dfb(var_fb7d23d9.bitflag);
				setdvar(#"hash_1d3ff4dcafbd084e", -1);
			}
		}
		else
		{
			if(params.name == "")
			{
				var_eccea24e = params.value;
				if(var_eccea24e > -1)
				{
					/#
						assert(var_eccea24e < level.var_e85d5a3f.var_e4f193a3.size);
					#/
					var_fb7d23d9 = level.var_e85d5a3f.var_e4f193a3[var_eccea24e];
					player function_1c1fa213(var_fb7d23d9.bitflag);
					setdvar(#"hash_35ef1fad3aba3507", -1);
				}
			}
			else
			{
				if(params.name == "")
				{
					var_6eee7673 = params.value;
					if(var_6eee7673)
					{
						player function_56266435();
						setdvar(#"hash_28a6f53c5000afe4", 0);
					}
				}
				else if(params.name == "")
				{
					if(params.value)
					{
						player thread function_30a971a4();
					}
					else
					{
						player notify(#"hash_639ee73311ef0e56");
					}
				}
			}
		}
	#/
}

/*
	Name: function_30a971a4
	Namespace: profile_traits
	Checksum: 0x13F9D532
	Offset: 0x7F8
	Size: 0x3B0
	Parameters: 0
	Flags: Private
*/
function private function_30a971a4()
{
	/#
		player = self;
		player endoncallback(&function_6f60cb1e, #"hash_639ee73311ef0e56");
		player.var_adeb44c2 = [];
		for(i = 0; i < level.var_e85d5a3f.var_e4f193a3.size; i++)
		{
			trait = level.var_e85d5a3f.var_e4f193a3[i];
			hudelem = newdebughudelem(player);
			hudelem.alignx = "";
			hudelem.aligny = "";
			hudelem.x = 400;
			hudelem.y = 220 + (i * 14);
			hudelem.foreground = 1;
			hudelem.fontscale = 1;
			hudelem settext(trait.ref_name + "");
			hudelem.var_16021753 = 0;
			hudelem.var_300d73bc = 0;
			hudelem.color = vectorscale((1, 1, 1), 0.75);
			player.var_adeb44c2[i] = hudelem;
		}
		while(true)
		{
			wait(0.5);
			for(i = 0; i < level.var_e85d5a3f.var_e4f193a3.size; i++)
			{
				trait = level.var_e85d5a3f.var_e4f193a3[i];
				var_16021753 = function_a996bd5e(trait.bitflag);
				var_300d73bc = -1;
				if(is_true(trait.var_e75fcf1a))
				{
					if(player hasperk(trait.perk_name))
					{
						var_300d73bc = 1;
					}
					else
					{
						var_300d73bc = 0;
					}
				}
				hudelem = player.var_adeb44c2[i];
				if(var_16021753 != hudelem.var_16021753 || var_300d73bc != hudelem.var_300d73bc)
				{
					hudelem.var_16021753 = var_16021753;
					hudelem.var_300d73bc = var_300d73bc;
					var_63d9d5cb = trait.ref_name + "";
					if(var_16021753)
					{
						var_63d9d5cb = var_63d9d5cb + "";
						hudelem.color = (0, 1, 0);
					}
					else
					{
						var_63d9d5cb = var_63d9d5cb + "";
						hudelem.color = vectorscale((1, 1, 1), 0.75);
					}
					if(var_300d73bc == -1)
					{
						var_63d9d5cb = var_63d9d5cb + "";
					}
					else
					{
						if(var_300d73bc)
						{
							var_63d9d5cb = var_63d9d5cb + "";
							if(!var_16021753)
							{
								hudelem.color = (1, 0, 0);
							}
						}
						else
						{
							var_63d9d5cb = var_63d9d5cb + "";
							if(var_16021753)
							{
								hudelem.color = (1, 0, 0);
							}
						}
					}
					hudelem settext(var_63d9d5cb);
				}
			}
		}
	#/
}

/*
	Name: function_6f60cb1e
	Namespace: profile_traits
	Checksum: 0x9814EFA
	Offset: 0xBB0
	Size: 0xB2
	Parameters: 0
	Flags: Private
*/
function private function_6f60cb1e()
{
	/#
		player = self;
		if(isdefined(player.var_adeb44c2))
		{
			foreach(elem in player.var_adeb44c2)
			{
				elem destroy();
			}
			player.var_adeb44c2 = undefined;
		}
	#/
}

/*
	Name: function_979631fd
	Namespace: profile_traits
	Checksum: 0xA752899F
	Offset: 0xC70
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function function_979631fd()
{
	return level.var_e85d5a3f.var_e4f193a3;
}

/*
	Name: function_3937b542
	Namespace: profile_traits
	Checksum: 0xF70BA056
	Offset: 0xC90
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function function_3937b542()
{
	return level.var_e85d5a3f.var_8651d525;
}

/*
	Name: function_d9b59414
	Namespace: profile_traits
	Checksum: 0x2312AF93
	Offset: 0xCB0
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_d9b59414(var_f2c93983)
{
	if(var_f2c93983 == "classified")
	{
		return 0;
	}
	foreach(trait in level.var_e85d5a3f.var_e4f193a3)
	{
		if(trait.ref_name == var_f2c93983)
		{
			return trait.bitflag;
		}
	}
	/#
		assertmsg(("" + var_f2c93983) + "");
	#/
}

/*
	Name: function_56266435
	Namespace: profile_traits
	Checksum: 0x36D5FDE6
	Offset: 0xDA0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_56266435()
{
	player = self;
	player function_1c1fa213(~0);
}

/*
	Name: function_a996bd5e
	Namespace: profile_traits
	Checksum: 0xDC238BC
	Offset: 0xDD8
	Size: 0xA2
	Parameters: 1
	Flags: None
*/
function function_a996bd5e(var_f03e5d1b)
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	var_b3903404 = player savegame::get_player_data("savegame_personal_trait_flags", undefined);
	if(!isdefined(var_b3903404))
	{
		var_b3903404 = 0;
		player savegame::set_player_data("savegame_personal_trait_flags", var_b3903404);
	}
	return var_b3903404 & var_f03e5d1b;
}

/*
	Name: function_18198dfb
	Namespace: profile_traits
	Checksum: 0x81538F48
	Offset: 0xE88
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_18198dfb(var_f03e5d1b)
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	var_b3903404 = player savegame::get_player_data("savegame_personal_trait_flags", undefined);
	if(!isdefined(var_b3903404))
	{
		var_b3903404 = 0;
	}
	var_b3903404 = var_b3903404 | var_f03e5d1b;
	player savegame::set_player_data("savegame_personal_trait_flags", var_b3903404);
	player function_d53bb873();
}

/*
	Name: function_1c1fa213
	Namespace: profile_traits
	Checksum: 0xC900F940
	Offset: 0xF50
	Size: 0x21C
	Parameters: 1
	Flags: None
*/
function function_1c1fa213(var_f03e5d1b)
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	var_b3903404 = player savegame::get_player_data("savegame_personal_trait_flags", undefined);
	if(!isdefined(var_b3903404))
	{
		var_b3903404 = 0;
	}
	foreach(trait in level.var_e85d5a3f.var_e4f193a3)
	{
		if((var_f03e5d1b & var_b3903404) & trait.bitflag)
		{
			if(is_true(trait.var_e75fcf1a) && player hasperk(trait.perk_name))
			{
				player perks::perk_unsetperk(trait.perk_name);
			}
			else if(trait.ref_name == "jugernog")
			{
				player player::function_b933de24("jugernog", 0);
			}
			/#
				println(("" + trait.ref_name) + "");
			#/
		}
	}
	if(var_b3903404 & var_f03e5d1b)
	{
		var_b3903404 = var_b3903404 & (~var_f03e5d1b);
	}
	player savegame::set_player_data("savegame_personal_trait_flags", var_b3903404);
	player function_d53bb873();
}

/*
	Name: function_d53bb873
	Namespace: profile_traits
	Checksum: 0xE3DCEB14
	Offset: 0x1178
	Size: 0x1E8
	Parameters: 0
	Flags: None
*/
function function_d53bb873()
{
	/#
		assert(isplayer(self));
	#/
	player = self;
	var_b3903404 = player savegame::get_player_data("savegame_personal_trait_flags", undefined);
	if(!isdefined(var_b3903404))
	{
		return false;
	}
	foreach(trait in level.var_e85d5a3f.var_e4f193a3)
	{
		if(var_b3903404 & trait.bitflag)
		{
			if(is_true(trait.var_e75fcf1a) && !player hasperk(trait.perk_name))
			{
				player perks::perk_setperk(trait.perk_name);
			}
			else if(trait.ref_name == "jugernog")
			{
				player player::function_2a67df65("jugernog", 25, undefined, 1);
				player.health = 125;
				player.maxhealth = 125;
			}
			/#
				println(("" + trait.ref_name) + "");
			#/
		}
	}
}

