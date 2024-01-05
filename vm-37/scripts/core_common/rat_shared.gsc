#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace rat;

/*
	Name: init
	Namespace: rat
	Checksum: 0x550555EF
	Offset: 0x80
	Size: 0x65C
	Parameters: 0
	Flags: None
*/
function init()
{
	/#
		if(!isdefined(level.rat))
		{
			level.rat = spawnstruct();
			level.rat.common = spawnstruct();
			level.rat.script_command_list = [];
			level.rat.playerskilled = 0;
			level.rat.var_cd4fd549 = 0;
			callback::on_player_killed(&function_cecf7c3d);
			level.rat.var_44083397 = [];
			addratscriptcmd("", &function_5fd1a95b);
			addratscriptcmd("", &rscteleport);
			addratscriptcmd("", &function_51706559);
			addratscriptcmd("", &function_b2fe8b5a);
			addratscriptcmd("", &function_bff535fb);
			addratscriptcmd("", &function_220d66d8);
			addratscriptcmd("", &function_be6e2f9f);
			addratscriptcmd("", &function_ff0fa082);
			addratscriptcmd("", &function_aecb1023);
			addratscriptcmd("", &function_90282828);
			addratscriptcmd("", &function_3b51dc31);
			addratscriptcmd("", &function_a6d4d86b);
			addratscriptcmd("", &function_54b7f226);
			addratscriptcmd("", &function_1b77bedd);
			addratscriptcmd("", &rscsimulatescripterror);
			addratscriptcmd("", &function_1f00a502);
			addratscriptcmd("", &function_696e6dd3);
			addratscriptcmd("", &function_dec22d87);
			addratscriptcmd("", &function_e3ab4393);
			addratscriptcmd("", &function_d5c8e330);
			addratscriptcmd("", &function_dff6f575);
			addratscriptcmd("", &function_d197a150);
			addratscriptcmd("", &function_c4336b49);
			addratscriptcmd("", &function_ccc178f3);
			addratscriptcmd("", &function_2fa64525);
			addratscriptcmd("", &function_6fb461e2);
			addratscriptcmd("", &function_f52fc58b);
			addratscriptcmd("", &function_dbc9b57c);
			addratscriptcmd("", &function_4f3a7675);
			addratscriptcmd("", &function_458913b0);
			addratscriptcmd("", &function_191d6974);
			addratscriptcmd("", &function_d1b632ff);
			addratscriptcmd("", &function_7d9a084b);
			addratscriptcmd("", &function_1ac5a32b);
			addratscriptcmd("", &function_7992a479);
			addratscriptcmd("", &function_9efe300c);
		}
	#/
}

/*
	Name: function_7d22c1c9
	Namespace: rat
	Checksum: 0x607E3AF7
	Offset: 0x6E8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_7d22c1c9()
{
	/#
		level flag::set("");
	#/
}

/*
	Name: function_65e13d0f
	Namespace: rat
	Checksum: 0x91B4CE9C
	Offset: 0x718
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_65e13d0f()
{
	/#
		level flag::clear("");
	#/
}

/*
	Name: function_b4f2a076
	Namespace: rat
	Checksum: 0x1608C21E
	Offset: 0x748
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_b4f2a076()
{
	/#
		level flag::set("");
	#/
}

/*
	Name: function_6aa20375
	Namespace: rat
	Checksum: 0x8D0D20E9
	Offset: 0x778
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_6aa20375()
{
	/#
		level flag::clear("");
	#/
}

/*
	Name: addratscriptcmd
	Namespace: rat
	Checksum: 0xED29B579
	Offset: 0x7A8
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function addratscriptcmd(commandname, functioncallback)
{
	/#
		init();
		level.rat.script_command_list[commandname] = functioncallback;
	#/
}

/*
	Name: codecallback_ratscriptcommand
	Namespace: rat
	Checksum: 0xE5DAA936
	Offset: 0x7F8
	Size: 0x114
	Parameters: 1
	Flags: Event
*/
event codecallback_ratscriptcommand(params)
{
	/#
		init();
		/#
			assert(isdefined(params._cmd));
		#/
		/#
			assert(isdefined(params._id));
		#/
		/#
			assert(isdefined(level.rat.script_command_list[params._cmd]), "" + params._cmd);
		#/
		callback = level.rat.script_command_list[params._cmd];
		ret = level [[callback]](params);
		ratreportcommandresult(params._id, 1, ret);
	#/
}

/*
	Name: getplayer
	Namespace: rat
	Checksum: 0xFF3A1BE1
	Offset: 0x918
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function getplayer(params)
{
	/#
		if(isdefined(params._xuid))
		{
			xuid = int(params._xuid);
			foreach(player in getplayers())
			{
				if(!isdefined(player.bot))
				{
					player_xuid = int(player getxuid(1));
					if(xuid == player_xuid)
					{
						return player;
					}
				}
			}
			ratreportcommandresult(params._id, 0, "");
			wait(1);
		}
		else
		{
			return util::gethostplayer();
		}
	#/
}

/*
	Name: function_5fd1a95b
	Namespace: rat
	Checksum: 0x2B3AC21B
	Offset: 0xA80
	Size: 0xA8
	Parameters: 1
	Flags: None
*/
function function_5fd1a95b(params)
{
	/#
		foreach(func in level.rat.script_command_list)
		{
			function_55e20e75(params._id, cmd);
		}
	#/
}

/*
	Name: function_7992a479
	Namespace: rat
	Checksum: 0x8EF7CD87
	Offset: 0xB30
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_7992a479(params)
{
	/#
		player = getplayer(params);
		weapon = getweapon(params.weaponname);
		player giveweapon(weapon);
	#/
}

/*
	Name: function_1b77bedd
	Namespace: rat
	Checksum: 0xF858386D
	Offset: 0xBA8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_1b77bedd(params)
{
	/#
		if(isdefined(level.inprematchperiod))
		{
			return level.inprematchperiod;
		}
	#/
}

/*
	Name: rscteleport
	Namespace: rat
	Checksum: 0xC29B822
	Offset: 0xBE0
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function rscteleport(params)
{
	/#
		player = getplayer(params);
		pos = (float(params.x), float(params.y), float(params.z));
		player setorigin(pos);
		if(isdefined(params.ax))
		{
			angles = (float(params.ax), float(params.ay), float(params.az));
			player setplayerangles(angles);
		}
	#/
}

/*
	Name: function_696e6dd3
	Namespace: rat
	Checksum: 0x29DCF60
	Offset: 0xD10
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_696e6dd3(params)
{
	/#
		player = getplayer(params);
		player setstance(params.stance);
	#/
}

/*
	Name: function_b2fe8b5a
	Namespace: rat
	Checksum: 0xFFBE612C
	Offset: 0xD68
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_b2fe8b5a(params)
{
	/#
		player = getplayer(params);
		return player getstance();
	#/
}

/*
	Name: function_ccc8790a
	Namespace: rat
	Checksum: 0x49E6DAE8
	Offset: 0xDB8
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_ccc8790a(params)
{
	/#
		level endon(#"hash_5ce872746ed86569");
		player = getplayer(params);
		xuid = int(player getxuid(1));
		level.rat.var_44083397[xuid] = 0;
		while(!level.rat.var_44083397[xuid])
		{
			level.rat.var_44083397[xuid] = player ismeleeing();
			wait(0.01);
		}
	#/
}

/*
	Name: function_d5c8e330
	Namespace: rat
	Checksum: 0x645D01C7
	Offset: 0xEA8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_d5c8e330(params)
{
	/#
		level thread function_ccc8790a(params);
	#/
}

/*
	Name: function_dff6f575
	Namespace: rat
	Checksum: 0xD35A7EBC
	Offset: 0xEE0
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_dff6f575(params)
{
	/#
		player = getplayer(params);
		xuid = int(player getxuid(1));
		var_faf86e88 = level.rat.var_44083397[xuid];
		if(!var_faf86e88)
		{
			level notify(#"hash_5ce872746ed86569");
		}
		return var_faf86e88;
	#/
}

/*
	Name: function_bff535fb
	Namespace: rat
	Checksum: 0x1504C5D2
	Offset: 0xF98
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_bff535fb(params)
{
	/#
		player = getplayer(params);
		return player playerads();
	#/
}

/*
	Name: function_220d66d8
	Namespace: rat
	Checksum: 0xE894F202
	Offset: 0xFE8
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function function_220d66d8(params)
{
	/#
		player = getplayer(params);
		return player.health;
	#/
}

/*
	Name: function_be6e2f9f
	Namespace: rat
	Checksum: 0xAE5E0BA6
	Offset: 0x1028
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_be6e2f9f(params)
{
	/#
		player = getplayer(params);
		if(isdefined(params.amount))
		{
			player dodamage(int(params.amount), player getorigin());
		}
		else
		{
			player dodamage(1, player getorigin());
		}
	#/
}

/*
	Name: function_ff0fa082
	Namespace: rat
	Checksum: 0x52128AE5
	Offset: 0x10E0
	Size: 0x78
	Parameters: 1
	Flags: None
*/
function function_ff0fa082(params)
{
	/#
		player = getplayer(params);
		if(!isdefined(player))
		{
			return "";
		}
		currentweapon = player getcurrentweapon();
		if(isdefined(currentweapon.name))
		{
			return currentweapon.name;
		}
	#/
}

/*
	Name: function_7d9a084b
	Namespace: rat
	Checksum: 0x753245B2
	Offset: 0x1160
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function function_7d9a084b(params)
{
	/#
		player = getplayer(params);
		currentweapon = player getcurrentweapon();
		if(isdefined(currentweapon.name))
		{
			return currentweapon.reloadtime;
		}
	#/
}

/*
	Name: function_aecb1023
	Namespace: rat
	Checksum: 0x18B21F6
	Offset: 0x11D0
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_aecb1023(params)
{
	/#
		player = getplayer(params);
		currentweapon = player getcurrentweapon();
		return player getammocount(currentweapon);
	#/
}

/*
	Name: function_90282828
	Namespace: rat
	Checksum: 0x6F4DA70
	Offset: 0x1240
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_90282828(params)
{
	/#
		player = getplayer(params);
		currentweapon = player getcurrentweapon();
		return player getweaponammoclip(currentweapon);
	#/
}

/*
	Name: function_3b51dc31
	Namespace: rat
	Checksum: 0xE9E67B11
	Offset: 0x12B0
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_3b51dc31(params)
{
	/#
		player = getplayer(params);
		currentweapon = player getcurrentweapon();
		return player getweaponammoclipsize(currentweapon);
	#/
}

/*
	Name: function_54b7f226
	Namespace: rat
	Checksum: 0x687FFB8D
	Offset: 0x1320
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_54b7f226(params)
{
	/#
		player = getplayer(params);
		origin = player getorigin();
		function_55e20e75(params._id, origin);
		angles = player getplayerangles();
		function_55e20e75(params._id, angles);
	#/
}

/*
	Name: function_a6d4d86b
	Namespace: rat
	Checksum: 0xC8BD2476
	Offset: 0x13D8
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_a6d4d86b(params)
{
	/#
		if(isdefined(params.var_185699f8))
		{
			return getnumconnectedplayers(1);
		}
		return getnumconnectedplayers(0);
	#/
}

/*
	Name: function_cecf7c3d
	Namespace: rat
	Checksum: 0x25D8F5B8
	Offset: 0x1430
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function function_cecf7c3d(params)
{
	/#
		if(isdefined(self.bot))
		{
			level.rat.var_cd4fd549 = level.rat.var_cd4fd549 + 1;
		}
		else
		{
			level.rat.playerskilled = level.rat.playerskilled + 1;
		}
	#/
}

/*
	Name: function_d197a150
	Namespace: rat
	Checksum: 0xD6E7F07
	Offset: 0x14B0
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_d197a150(params)
{
	/#
		return level.rat.playerskilled;
	#/
}

/*
	Name: function_c4336b49
	Namespace: rat
	Checksum: 0x78095D02
	Offset: 0x14E0
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_c4336b49(params)
{
	/#
		return level.rat.var_cd4fd549;
	#/
}

/*
	Name: function_51706559
	Namespace: rat
	Checksum: 0x7C961324
	Offset: 0x1510
	Size: 0x19C
	Parameters: 1
	Flags: None
*/
function function_51706559(params)
{
	/#
		foreach(player in level.players)
		{
			if(!isdefined(player.bot))
			{
				continue;
			}
			pos = (float(params.x), float(params.y), float(params.z));
			player setorigin(pos);
			if(isdefined(params.ax))
			{
				angles = (float(params.ax), float(params.ay), float(params.az));
				player setplayerangles(angles);
			}
			if(!isdefined(params.all))
			{
				break;
			}
		}
	#/
}

/*
	Name: function_dec22d87
	Namespace: rat
	Checksum: 0xA0EF5C00
	Offset: 0x16B8
	Size: 0x190
	Parameters: 1
	Flags: None
*/
function function_dec22d87(params)
{
	/#
		player = getplayer(params);
		forward = anglestoforward(player.angles);
		distance = 50;
		if(isdefined(params.distance))
		{
			distance = float(params.distance);
		}
		spawn = player.origin + (forward * distance);
		foreach(other_player in level.players)
		{
			if(other_player == player)
			{
				continue;
			}
			if(isdefined(params.var_5d792f96) && int(params.var_5d792f96) && !isdefined(other_player.bot))
			{
				continue;
			}
			other_player setorigin(spawn);
		}
	#/
}

/*
	Name: function_e3ab4393
	Namespace: rat
	Checksum: 0xB149A766
	Offset: 0x1850
	Size: 0x1EC
	Parameters: 1
	Flags: None
*/
function function_e3ab4393(params)
{
	/#
		player = getplayer(params);
		forward = anglestoforward(player.angles);
		distance = 50;
		if(isdefined(params.distance))
		{
			distance = float(params.distance);
		}
		spawn = player.origin + (forward * distance);
		foreach(other_player in level.players)
		{
			if(isdefined(params.bot) && int(params.bot) && !isdefined(other_player.bot))
			{
				continue;
			}
			if(player getteam() != other_player getteam())
			{
				other_player setorigin(spawn);
				other_player setplayerangles(player.angles);
				return;
			}
		}
		ratreportcommandresult(params._id, 0, "");
	#/
}

/*
	Name: function_1ac5a32b
	Namespace: rat
	Checksum: 0x734E63FC
	Offset: 0x1A48
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_1ac5a32b(params)
{
	/#
		player = getplayer(params);
		forward = anglestoforward(player.angles);
		distance = 50;
		if(isdefined(params.distance))
		{
			distance = float(params.distance);
		}
		front = player.origin + (forward * distance);
		player setorigin(front);
	#/
}

/*
	Name: function_ccc178f3
	Namespace: rat
	Checksum: 0x8D306A68
	Offset: 0x1B20
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_ccc178f3(params)
{
	/#
		player = getplayer(params);
		return player isplayinganimscripted();
	#/
}

/*
	Name: function_6fb461e2
	Namespace: rat
	Checksum: 0xF3219C4D
	Offset: 0x1B70
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function function_6fb461e2(params)
{
	/#
		player = getplayer(params);
		if(isdefined(player))
		{
			return !player arecontrolsfrozen();
		}
		return 0;
	#/
}

/*
	Name: function_2fa64525
	Namespace: rat
	Checksum: 0x30896F08
	Offset: 0x1BD0
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_2fa64525(params)
{
	/#
		if(isdefined(params.flag))
		{
			return flag::get(params.flag);
		}
	#/
}

/*
	Name: function_1f00a502
	Namespace: rat
	Checksum: 0xD6BAC2E5
	Offset: 0x1C18
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_1f00a502(params)
{
	/#
		foreach(player in getplayers())
		{
			if(isbot(player))
			{
				return player.health;
			}
		}
		return -1;
	#/
}

/*
	Name: function_4f3a7675
	Namespace: rat
	Checksum: 0x205B985D
	Offset: 0x1CD8
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_4f3a7675(params)
{
	/#
		if(isdefined(level.var_5efad16e))
		{
			level [[level.var_5efad16e]]();
			return true;
		}
		return false;
	#/
}

/*
	Name: function_d04e8397
	Namespace: rat
	Checksum: 0xAB36FD18
	Offset: 0x1D28
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_d04e8397(name)
{
	/#
		level flag::set("");
		level scene::play(name);
		level flag::clear("");
	#/
}

/*
	Name: function_191d6974
	Namespace: rat
	Checksum: 0xFA6FF06C
	Offset: 0x1D98
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_191d6974(params)
{
	/#
		if(isdefined(params.name))
		{
			level thread function_d04e8397(params.name);
		}
		else
		{
			ratreportcommandresult(params._id, 0, "");
		}
	#/
}

/*
	Name: function_d1b632ff
	Namespace: rat
	Checksum: 0x10172A75
	Offset: 0x1E08
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function function_d1b632ff(params)
{
	/#
		return flag::get("");
	#/
}

/*
	Name: rscsimulatescripterror
	Namespace: rat
	Checksum: 0x6CBB92B4
	Offset: 0x1E40
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function rscsimulatescripterror(params)
{
	/#
		if(params.errorlevel == "")
		{
			/#
				assertmsg("");
			#/
		}
		else
		{
			thisdoesntexist.orthis = 0;
		}
	#/
}

/*
	Name: rscrecteleport
	Namespace: rat
	Checksum: 0xC675785E
	Offset: 0x1EA8
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function rscrecteleport(params)
{
	/#
		println("");
		player = [[level.rat.common.gethostplayer]]();
		pos = player getorigin();
		angles = player getplayerangles();
		cmd = (((((((((("" + pos[0]) + "") + pos[1]) + "") + pos[2]) + "") + angles[0]) + "") + angles[1]) + "") + angles[2];
		ratrecordmessage(0, "", cmd);
		setdvar(#"rat_record_teleport_request", 0);
	#/
}

/*
	Name: function_f52fc58b
	Namespace: rat
	Checksum: 0xB0D62054
	Offset: 0x2008
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_f52fc58b(params)
{
	/#
		num = 0;
		if(isdefined(params))
		{
			if(isdefined(params.num))
			{
				num = int(params.num);
			}
		}
		if(num > 0)
		{
			adddebugcommand("" + num);
		}
	#/
}

/*
	Name: function_dbc9b57c
	Namespace: rat
	Checksum: 0xF173ADBF
	Offset: 0x2090
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_dbc9b57c(params)
{
	/#
		num = 0;
		if(isdefined(params))
		{
			if(isdefined(params.num))
			{
				num = int(params.num);
			}
		}
		if(num > 0)
		{
			adddebugcommand("" + num);
		}
	#/
}

/*
	Name: function_458913b0
	Namespace: rat
	Checksum: 0x6EAF7470
	Offset: 0x2118
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_458913b0(params)
{
	/#
		player = getplayer(params);
		toggleplayercontrol(player);
	#/
}

/*
	Name: function_9efe300c
	Namespace: rat
	Checksum: 0xCFDC6625
	Offset: 0x2168
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_9efe300c(params)
{
	/#
		player = getplayer(params);
		spawn = 0;
		team = "";
		if(isdefined(params) && isdefined(params.spawn))
		{
			if(isdefined(params.spawn))
			{
				spawn = int(params.spawn);
			}
			if(isdefined(params.team))
			{
				team = params.team;
			}
		}
		if(isdefined(level.spawn_start) && isdefined(level.spawn_start[team]))
		{
			player setorigin(level.spawn_start[team][spawn].origin);
			player setplayerangles(level.spawn_start[team][spawn].angles);
		}
	#/
}

