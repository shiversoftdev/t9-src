#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_32399001bdb550da;
#using scripts\cp_common\collectibles.gsc;

#namespace player_decision;

/*
	Name: function_ea730341
	Namespace: player_decision
	Checksum: 0xC608B520
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ea730341()
{
	level notify(2132181919);
}

/*
	Name: __init__system__
	Namespace: player_decision
	Checksum: 0xEA8CBD0F
	Offset: 0xC0
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("player_decision", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_decision
	Checksum: 0x91293C20
	Offset: 0x100
	Size: 0x1B4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		if(!isdefined(level.var_cc2922d))
		{
			level.var_cc2922d = [];
		}
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
		util::init_dvar("", -1, &function_db698ba5);
	#/
}

/*
	Name: function_db698ba5
	Namespace: player_decision
	Checksum: 0xDEE6AC49
	Offset: 0x2C0
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private function_db698ba5(dvar)
{
	/#
		level.var_cc2922d[dvar.name] = int(dvar.value);
	#/
}

/*
	Name: function_4f0f89
	Namespace: player_decision
	Checksum: 0x9228ED78
	Offset: 0x308
	Size: 0xA8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4f0f89(var_6176a8ab, var_de282b38)
{
	var_6c8b1954 = savegame::get_mission_data(#"transient");
	if(!isdefined(var_6c8b1954.var_6e64bcd))
	{
		var_6c8b1954.var_6e64bcd = [];
	}
	else if(!isarray(var_6c8b1954.var_6e64bcd))
	{
		var_6c8b1954.var_6e64bcd = array(var_6c8b1954.var_6e64bcd);
	}
	var_6c8b1954.var_6e64bcd[var_6176a8ab] = var_de282b38;
}

/*
	Name: function_9240114e
	Namespace: player_decision
	Checksum: 0x39837C0E
	Offset: 0x3B8
	Size: 0x7A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9240114e(var_6176a8ab, default_value)
{
	var_6c8b1954 = savegame::get_mission_data(#"transient");
	if(isdefined(var_6c8b1954.var_6e64bcd[var_6176a8ab]))
	{
		return var_6c8b1954.var_6e64bcd[var_6176a8ab];
	}
	return savegame::get_player_data(var_6176a8ab, default_value);
}

/*
	Name: function_d04c220e
	Namespace: player_decision
	Checksum: 0xE0443FFB
	Offset: 0x440
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_d04c220e()
{
	var_6c8b1954 = savegame::get_mission_data(#"transient");
	if(!isdefined(var_6c8b1954.var_6e64bcd))
	{
		return;
	}
	foreach(var_6176a8ab, var_de282b38 in var_6c8b1954.var_6e64bcd)
	{
		savegame::set_player_data(var_6176a8ab, var_de282b38);
	}
}

/*
	Name: function_ff7e19cb
	Namespace: player_decision
	Checksum: 0xDFE3945C
	Offset: 0x510
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_ff7e19cb(var_6aeabb95)
{
	/#
		var_2c1ecd1d = [2:2, 1:1, 0:0];
		if(!isinarray(var_2c1ecd1d, var_6aeabb95))
		{
			/#
				assertmsg("" + var_6aeabb95);
			#/
		}
	#/
	function_4f0f89(#"hash_3650eaf15ceb89e7", var_6aeabb95);
	if(var_6aeabb95 == 2)
	{
		getplayers()[0] stats::function_dad108fa(#"cp_bloodthirty_park_lazar_dead", 1);
	}
}

/*
	Name: function_1c4fb6d4
	Namespace: player_decision
	Checksum: 0x8BBC1C30
	Offset: 0x600
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function function_1c4fb6d4()
{
	var_313a5853 = int(function_9240114e(#"hash_3650eaf15ceb89e7", 0));
	/#
		if(level.var_cc2922d[#"hash_3c471eb0b4890d28"] >= 0)
		{
			var_313a5853 = level.var_cc2922d[#"hash_3c471eb0b4890d28"];
		}
		var_2c1ecd1d = [2:2, 1:1, 0:0];
		if(!isinarray(var_2c1ecd1d, var_313a5853))
		{
			/#
				assertmsg("" + var_313a5853);
			#/
		}
	#/
	return var_313a5853;
}

/*
	Name: function_cde4f4e9
	Namespace: player_decision
	Checksum: 0xC5FDB2E3
	Offset: 0x708
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function function_cde4f4e9(var_fda79bf3)
{
	/#
		var_2c1ecd1d = [1:1, 0:0];
		if(!isinarray(var_2c1ecd1d, var_fda79bf3))
		{
			/#
				assertmsg("" + var_fda79bf3);
			#/
		}
	#/
	function_4f0f89(#"hash_5cdfba0959eb3c63", var_fda79bf3);
}

/*
	Name: function_d9f060cc
	Namespace: player_decision
	Checksum: 0x3E852D56
	Offset: 0x7B0
	Size: 0xF8
	Parameters: 0
	Flags: None
*/
function function_d9f060cc()
{
	var_fda79bf3 = int(function_9240114e(#"hash_5cdfba0959eb3c63", 0));
	/#
		if(level.var_cc2922d[#"hash_1d0ba9436c1b8160"] >= 0)
		{
			var_fda79bf3 = level.var_cc2922d[#"hash_1d0ba9436c1b8160"];
		}
		var_2c1ecd1d = [1:1, 0:0];
		if(!isinarray(var_2c1ecd1d, var_fda79bf3))
		{
			/#
				assertmsg("" + var_fda79bf3);
			#/
		}
	#/
	return var_fda79bf3;
}

/*
	Name: function_83bb4d9c
	Namespace: player_decision
	Checksum: 0x88448A6E
	Offset: 0x8B0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_83bb4d9c(iskilled)
{
	function_4f0f89(#"hash_78916ab4267af9ff", iskilled);
}

/*
	Name: function_2da4c32c
	Namespace: player_decision
	Checksum: 0xCD443F82
	Offset: 0x8E8
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function function_2da4c32c()
{
	/#
		if(level.var_cc2922d[#"hash_4ba5f5e5135a166e"] >= 0)
		{
			return level.var_cc2922d[#"hash_4ba5f5e5135a166e"];
		}
	#/
	return function_9240114e(#"hash_78916ab4267af9ff", 0);
}

/*
	Name: function_a029a114
	Namespace: player_decision
	Checksum: 0x83EC6796
	Offset: 0x958
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_a029a114(iskilled)
{
	function_4f0f89(#"hash_2209b7d4d5e867da", iskilled);
	if(!iskilled)
	{
		getplayers()[0] stats::function_dad108fa(#"cp_loyal_agent_qasim_live", 1);
	}
}

/*
	Name: function_251a57bb
	Namespace: player_decision
	Checksum: 0xDA4BE3D3
	Offset: 0x9D0
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function function_251a57bb()
{
	/#
		if(level.var_cc2922d[#"hash_3ac48e6f15883c17"] >= 0)
		{
			return level.var_cc2922d[#"hash_3ac48e6f15883c17"];
		}
	#/
	return function_9240114e(#"hash_2209b7d4d5e867da", 0);
}

/*
	Name: function_5d2eb7fa
	Namespace: player_decision
	Checksum: 0x9D5B3679
	Offset: 0xA40
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_5d2eb7fa(iskilled)
{
	function_4f0f89(#"hash_19be69882298b84a", iskilled);
	if(!iskilled)
	{
		getplayers()[0] stats::function_dad108fa(#"cp_loyal_agent_volkov_capture", 1);
	}
	else
	{
		getplayers()[0] stats::function_dad108fa(#"cp_bloodthirty_volkov_dead", 1);
	}
}

/*
	Name: function_5584c739
	Namespace: player_decision
	Checksum: 0xF7F89187
	Offset: 0xAF0
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function function_5584c739()
{
	/#
		if(level.var_cc2922d[#"hash_653b4358e2685205"] >= 0)
		{
			return level.var_cc2922d[#"hash_653b4358e2685205"];
		}
	#/
	return function_9240114e(#"hash_19be69882298b84a", 0);
}

/*
	Name: function_b95efbcd
	Namespace: player_decision
	Checksum: 0x915BE15
	Offset: 0xB60
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_b95efbcd(iskilled)
{
	function_4f0f89(#"hash_2c88ea06da308fcc", iskilled);
}

/*
	Name: function_733a5c27
	Namespace: player_decision
	Checksum: 0x42B0A8C8
	Offset: 0xB98
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function function_733a5c27()
{
	/#
		if(level.var_cc2922d[#"hash_5050d4ae63037c35"] >= 0)
		{
			return level.var_cc2922d[#"hash_5050d4ae63037c35"];
		}
	#/
	return function_9240114e(#"hash_2c88ea06da308fcc", 0);
}

/*
	Name: function_fc8e281d
	Namespace: player_decision
	Checksum: 0xD2CAAEF0
	Offset: 0xC08
	Size: 0x5A
	Parameters: 0
	Flags: Linked
*/
function function_fc8e281d()
{
	/#
		if(level.var_cc2922d[#"hash_709460f14c72da1d"] >= 0)
		{
			return level.var_cc2922d[#"hash_709460f14c72da1d"];
		}
	#/
	return savegame::function_ac15668a(#"cp_sidemission_tundra");
}

/*
	Name: function_e0bd7f7a
	Namespace: player_decision
	Checksum: 0xE1A846CB
	Offset: 0xC70
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_e0bd7f7a(var_b8291d8f)
{
	/#
		assert(var_b8291d8f <= 3);
	#/
	savegame::set_player_data(#"hash_ce196830d20c798", var_b8291d8f);
}

/*
	Name: function_e40c7d56
	Namespace: player_decision
	Checksum: 0x48F2BD6F
	Offset: 0xCC8
	Size: 0x7A
	Parameters: 0
	Flags: None
*/
function function_e40c7d56()
{
	/#
		if(level.var_cc2922d[#"hash_395dca7924a7661c"] >= 0)
		{
			return level.var_cc2922d[#"hash_395dca7924a7661c"];
		}
	#/
	if(!function_fc8e281d())
	{
		return 0;
	}
	return savegame::get_player_data(#"hash_ce196830d20c798", 0);
}

/*
	Name: function_557c31b1
	Namespace: player_decision
	Checksum: 0x876AE659
	Offset: 0xD50
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_557c31b1()
{
	savegame::set_player_data(#"hash_1353a738ffed49d7", 1);
	getplayers()[0] stats::function_dad108fa(#"cp_dark_chaos", 1);
}

/*
	Name: function_ee124ba3
	Namespace: player_decision
	Checksum: 0xFC31CB68
	Offset: 0xDC0
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function function_ee124ba3()
{
	/#
		if(level.var_cc2922d[#"hash_9b807de107e21ef"] >= 0)
		{
			return level.var_cc2922d[#"hash_9b807de107e21ef"];
		}
	#/
	return savegame::get_player_data(#"hash_1353a738ffed49d7", 0);
}

/*
	Name: function_c8718964
	Namespace: player_decision
	Checksum: 0x1DBC84C4
	Offset: 0xE30
	Size: 0x5A
	Parameters: 0
	Flags: None
*/
function function_c8718964()
{
	/#
		if(level.var_cc2922d[#"hash_2576aa389eb6fa86"] >= 0)
		{
			return level.var_cc2922d[#"hash_2576aa389eb6fa86"];
		}
	#/
	return savegame::function_ac15668a(#"cp_sidemission_takedown");
}

/*
	Name: function_8c0836dd
	Namespace: player_decision
	Checksum: 0x29F02C4E
	Offset: 0xE98
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function function_8c0836dd(var_2b7725a)
{
	/#
		assert(var_2b7725a >= 0 && var_2b7725a < 10);
	#/
	var_6c8b1954 = savegame::get_mission_data(#"transient");
	if(!isdefined(var_6c8b1954.var_f4d7790b))
	{
		var_6c8b1954.var_f4d7790b = [];
	}
	else if(!isarray(var_6c8b1954.var_f4d7790b))
	{
		var_6c8b1954.var_f4d7790b = array(var_6c8b1954.var_f4d7790b);
	}
	if(!isdefined(var_6c8b1954.var_f4d7790b))
	{
		var_6c8b1954.var_f4d7790b = [];
	}
	else if(!isarray(var_6c8b1954.var_f4d7790b))
	{
		var_6c8b1954.var_f4d7790b = array(var_6c8b1954.var_f4d7790b);
	}
	if(!isinarray(var_6c8b1954.var_f4d7790b, var_2b7725a))
	{
		var_6c8b1954.var_f4d7790b[var_6c8b1954.var_f4d7790b.size] = var_2b7725a;
	}
}

/*
	Name: function_430ebd4b
	Namespace: player_decision
	Checksum: 0xAF813FE7
	Offset: 0xFF8
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_430ebd4b(var_2b7725a, var_2a51713)
{
	if(is_true(collectibles::function_ab921f3d(var_2a51713)))
	{
		function_8c0836dd(var_2b7725a);
	}
}

/*
	Name: function_6efc0ff8
	Namespace: player_decision
	Checksum: 0x5FA076EF
	Offset: 0x1058
	Size: 0x122
	Parameters: 2
	Flags: None
*/
function function_6efc0ff8(var_3740aa91, var_2b7725a)
{
	/#
		assert(var_2b7725a >= 0 && var_2b7725a < 10);
	#/
	var_a268cecc = savegame::get_mission_name();
	if(var_3740aa91 == var_a268cecc)
	{
		var_6c8b1954 = savegame::get_mission_data(#"transient");
		if(isdefined(var_6c8b1954.var_f4d7790b) && isinarray(var_6c8b1954.var_f4d7790b, var_2b7725a))
		{
			return 1;
		}
	}
	player = getplayers()[0];
	return player stats::get_stat(#"mapdata", var_3740aa91, #"hash_43a738b893199779", var_2b7725a);
}

/*
	Name: function_ef22e409
	Namespace: player_decision
	Checksum: 0xF766B484
	Offset: 0x1188
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_ef22e409()
{
	var_6c8b1954 = savegame::get_mission_data(#"transient");
	if(!isdefined(var_6c8b1954.var_f4d7790b))
	{
		return;
	}
	player = getplayers()[0];
	var_a268cecc = savegame::get_mission_name();
	for(var_2b7725a = 0; var_2b7725a < 10; var_2b7725a++)
	{
		if(isinarray(var_6c8b1954.var_f4d7790b, var_2b7725a))
		{
			player stats::set_stat(#"mapdata", var_a268cecc, #"hash_43a738b893199779", var_2b7725a, 1);
			continue;
		}
		player stats::set_stat(#"mapdata", var_a268cecc, #"hash_43a738b893199779", var_2b7725a, 0);
	}
	player function_d0c3d0ce();
	uploadstats(player);
}

/*
	Name: function_d0c3d0ce
	Namespace: player_decision
	Checksum: 0x6CF4C646
	Offset: 0x12F0
	Size: 0x4B4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d0c3d0ce()
{
	player = self;
	var_a268cecc = savegame::get_mission_name();
	var_6c8b1954 = savegame::get_mission_data(#"transient");
	if(var_a268cecc == #"cp_ger_stakeout")
	{
		if(!isinarray(var_6c8b1954.var_f4d7790b, 4))
		{
			player stats::set_stat(#"mapdata", #"cp_rus_kgb", #"hash_43a738b893199779", 2, 0);
		}
	}
	else
	{
		if(var_a268cecc == #"cp_ger_hub8")
		{
			if(isinarray(var_6c8b1954.var_f4d7790b, 0))
			{
				player stats::set_stat(#"mapdata", #"cp_rus_duga", #"hash_43a738b893199779", 0, 0);
				player stats::set_stat(#"mapdata", #"cp_rus_duga", #"hash_43a738b893199779", 1, 0);
			}
			if(isinarray(var_6c8b1954.var_f4d7790b, 1))
			{
				player stats::set_stat(#"mapdata", #"cp_rus_siege", #"hash_43a738b893199779", 0, 0);
			}
		}
		else
		{
			if(var_a268cecc == #"cp_rus_siege")
			{
				if(isinarray(var_6c8b1954.var_f4d7790b, 0))
				{
					player stats::set_stat(#"mapdata", #"cp_rus_duga", #"hash_43a738b893199779", 0, 0);
					player stats::set_stat(#"mapdata", #"cp_rus_duga", #"hash_43a738b893199779", 1, 0);
					player stats::set_stat(#"mapdata", #"cp_ger_hub8", #"hash_43a738b893199779", 0, 1);
					player stats::set_stat(#"mapdata", #"cp_ger_hub8", #"hash_43a738b893199779", 1, 0);
					player stats::set_stat(#"mapdata", #"cp_ger_hub8", #"hash_43a738b893199779", 2, 0);
				}
			}
			else if(var_a268cecc == #"cp_rus_duga")
			{
				if(isinarray(var_6c8b1954.var_f4d7790b, 0))
				{
					player stats::set_stat(#"mapdata", #"cp_rus_siege", #"hash_43a738b893199779", 0, 0);
					player stats::set_stat(#"mapdata", #"cp_ger_hub8", #"hash_43a738b893199779", 0, 0);
					player stats::set_stat(#"mapdata", #"cp_ger_hub8", #"hash_43a738b893199779", 1, 1);
				}
			}
		}
	}
}

