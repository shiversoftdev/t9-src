#using script_4611af4073d18808;
#using script_1d730eca5a7f1fa8;
#using script_2474a362752098d2;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_1ce46999727f2f2b;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_6b6510e124bad778;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using script_4c5c4a64a59247a2;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_7f5aeb59;

/*
	Name: function_1e020ef7
	Namespace: namespace_7f5aeb59
	Checksum: 0x8AE0CC2F
	Offset: 0x870
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1e020ef7()
{
	level notify(-1773607986);
}

/*
	Name: function_c17e1c0e
	Namespace: namespace_7f5aeb59
	Checksum: 0x44B04314
	Offset: 0x890
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function function_c17e1c0e()
{
	if(!isdefined(self.entnum))
	{
		self.entnum = self getentitynumber();
	}
	count = getplayerroletemplatecount(currentsessionmode());
	if(!isdefined(self.doa.characterindex))
	{
		self detachall();
		if(isbot(self))
		{
			self.doa.characterindex = (self.entnum + 1) % count;
		}
		else
		{
			self.doa.characterindex = self player_role::function_2a911680();
			if(player_role::is_valid(self.doa.characterindex) == 0)
			{
				self.doa.characterindex = (self.entnum + 1) % count;
			}
		}
		self.pers[#"characterindex"] = self.doa.characterindex;
		self player_role::set(self.doa.characterindex);
		if(isbot(self))
		{
			self setcharacterbodytype(self.doa.characterindex);
		}
	}
}

/*
	Name: function_f3143608
	Namespace: namespace_7f5aeb59
	Checksum: 0xDCA30244
	Offset: 0xA60
	Size: 0x194
	Parameters: 0
	Flags: Linked
*/
function function_f3143608()
{
	self namespace_ec06fe4a::function_4f72130c();
	self.doa = spawnstruct();
	self function_c17e1c0e();
	self function_fcc90081(1);
	self enablelinkto();
	self.var_90b81208 = (isdefined(level.doa.roundnumber) ? level.doa.roundnumber : 0);
	if(isdefined(level.doa) && isdefined(level.doa.var_5c6568f4))
	{
		self thread [[level.doa.var_5c6568f4]]();
	}
	self thread function_d09d2055();
	spawn_points = struct::get_array("info_player_start", "targetname");
	entnumber = self getentitynumber();
	if(spawn_points.size > entnumber)
	{
		self setorigin(spawn_points[entnumber].origin);
	}
	self thread function_c0310e2a();
}

/*
	Name: function_d09d2055
	Namespace: namespace_7f5aeb59
	Checksum: 0xC2C3291F
	Offset: 0xC00
	Size: 0x9A
	Parameters: 0
	Flags: Linked
*/
function function_d09d2055()
{
	self endon(#"disconnect");
	level endon(#"game_over");
	while(array::contains(function_a1ef346b(), self) == 0 || is_true(self.var_fcb4914a))
	{
		self.ignoreme = 1;
		waitframe(1);
	}
	self.ignoreme = 0;
}

/*
	Name: function_b1a82efa
	Namespace: namespace_7f5aeb59
	Checksum: 0x69FE6EDF
	Offset: 0xCA8
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_b1a82efa(on)
{
	self setclientuivisibilityflag("weapon_hud_visible", 0);
	self setclientuivisibilityflag("g_compassShowEnemies", 0);
	self setclientuivisibilityflag("hud_visible", 0);
	self setclientuivisibilityflag("radar_client", 0);
	self setclientuivisibilityflag("killcam_nemesis", 0);
	if(on)
	{
		self setclientuivisibilityflag("hud_visible", 1);
		self setclientuivisibilityflag("radar_client", 1);
		self setclientuivisibilityflag("g_compassShowEnemies", 1);
	}
}

/*
	Name: function_5b373dae
	Namespace: namespace_7f5aeb59
	Checksum: 0x9ADB11EC
	Offset: 0xDC8
	Size: 0x2A
	Parameters: 0
	Flags: Linked
*/
function function_5b373dae()
{
	if(isdefined(self) && isdefined(self.doa))
	{
		self.doa.respawning = 0;
	}
}

/*
	Name: function_c5f9ea85
	Namespace: namespace_7f5aeb59
	Checksum: 0xC03005C6
	Offset: 0xE00
	Size: 0x20A
	Parameters: 0
	Flags: Linked
*/
function function_c5f9ea85()
{
	self endon(#"disconnect");
	level endon(#"game_over");
	self notify("279dae47ae5f3741");
	self endon("279dae47ae5f3741");
	self.doa.var_370ac26d = (isdefined(level.var_418c1e64[self.name]) ? level.var_418c1e64[self.name] : 0);
	self.doa.var_d362196a = (isdefined(level.var_eb40a3b8[self.name]) ? level.var_eb40a3b8[self.name] : 0);
	var_8c201285 = getdvarint(#"hash_548f3080d78da0bf", 5000);
	var_e984c3d6 = getdvarint(#"hash_3a50a740f2de580a", 1);
	var_cdcdd992 = getdvarint(#"hash_7d3a5d6f06e77084", 1);
	if(var_e984c3d6 <= 0)
	{
		return;
	}
	while(true)
	{
		wait(var_cdcdd992);
		if(level.doa.world_state != 0)
		{
			continue;
		}
		if(isdefined(level.doa.var_6f3d327))
		{
			continue;
		}
		if(level flag::get("doa_round_spawning") == 0)
		{
			continue;
		}
		if(gettime() - self.doa.var_a8b7e1f4 > var_8c201285)
		{
			continue;
		}
		self.doa.var_d362196a = self.doa.var_d362196a + var_e984c3d6;
	}
}

/*
	Name: function_fcc90081
	Namespace: namespace_7f5aeb59
	Checksum: 0x86E3D219
	Offset: 0x1018
	Size: 0x844
	Parameters: 1
	Flags: Linked
*/
function function_fcc90081(var_45b95f80)
{
	if(!isdefined(var_45b95f80))
	{
		var_45b95f80 = 0;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(var_45b95f80)
	{
		namespace_1e25ad94::debugmsg("OoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOoOo");
		namespace_1e25ad94::debugmsg("PLAYER FULL INITIALIZE");
		self.doa.entnum = self getentitynumber();
		self.topdowncamera = 1;
		self.doa.var_3e81d24c = undefined;
		self.doa.var_370ac26d = 0;
		self.doa.var_d748ac3f = 0;
		self.doa.weapontype = 0;
		self.doa.weaponlevel = 0;
		self.doa.var_fd5fcb75 = "";
		self.doa.var_909a4dd5 = 0;
		self.doa.var_484cc88b = 0;
		self.doa.rof = undefined;
		self.doa.roj = undefined;
		self.doa.color = function_83fe843d(self);
		self.doa.var_d6b75dff = 0;
		self.doa.var_1106edda = 0;
		self.doa.var_d8955419 = 0;
		self.doa.default_movespeed = 1;
		self.doa.var_77c8b9d4 = 0;
		self.doa.var_2d965438 = 0;
		self.doa.var_99c6ee47 = 0;
		self.doa.var_2c18f1d5 = 0;
		self.doa.var_d1d5998d = 0;
		self.doa.var_82fb5d17 = 0;
		self.doa.var_f583234e = 0;
		self.doa.var_ab338943 = 0;
		self.var_f16a71ae = 1;
		self.doa.var_4f3aee7b = undefined;
		self.doa.var_25f4de97 = 0;
		self.doa.var_ed8fde10 = "zombietron_lmg";
		self.lastnonkillstreakweapon = getweapon(self.doa.var_ed8fde10);
		self.doa.var_6b4163f1 = randomint(250);
		self.doa.var_ad888d1f = [];
		self setmovespeedscale(self.doa.default_movespeed);
		self function_b1a82efa(1);
		self.health = 150;
		self.maxhealth = 150;
		self.doa.var_bb4d9604 = [];
		self.doa.var_96ca2395 = 1;
		self.doa.var_7e445455 = 0;
		self.doa.var_90e186f2 = 0;
		self.doa.var_20c63763 = [];
		if(isdefined(level.doa.var_d0b39b1a))
		{
			self [[level.doa.var_d0b39b1a]]();
		}
		if(isdefined(level.doa.var_3bc55386))
		{
			self [[level.doa.var_3bc55386]]();
		}
		if(isdefined(level.doa.var_502e9288))
		{
			self [[level.doa.var_502e9288]]();
		}
		self.doa.var_11abc438 = self.origin;
		self function_c17e1c0e();
		self setperk("specialty_sprint");
		self setperk("specialty_seethroughjammer");
		self setperk("specialty_sprintreload");
		self setperk("specialty_slide");
		self setperk("specialty_showenemyvehicles");
		self.var_f07d3654 = 1;
		self thread function_77785447(0, 1);
		self thread namespace_491fa2b2::function_ebbc302();
		self hud_message::clearlowermessage();
		self setclientminiscoreboardhide(0);
		self.kills = 0;
		self.deaths = 0;
		self.headshots = 0;
		self.revives = 0;
		self.downs = 0;
		self.doa.var_a8b7e1f4 = 0;
		self namespace_83eb6304::function_3ecfde67("player_trail_" + self.doa.color);
		self thread function_c5f9ea85();
	}
	/#
		assert(isdefined(self.doa.entnum), "");
	#/
	self.ignoreme = 0;
	self.ignoremelee = 0;
	self.laststand = 0;
	self.doa.var_a5eb0385 = 0;
	self.doa.var_d524abd8 = 0;
	self.doa.var_dbe90a1f = 0;
	self.doa.var_9ff62c1c = 0;
	self.doa.var_9ca03c2f = 0;
	self clientfield::set_to_player("showMap", 0);
	self namespace_41cb996::function_6c4d9896(self.doa.var_ed8fde10);
	self setplayercollision(1);
	self cleardamageindicator();
	self thread function_d690f109();
	/#
		if(isdefined(self.hud_damagefeedback))
		{
			self.hud_damagefeedback destroy();
			self.hud_damagefeedback = undefined;
		}
	#/
	self function_fae39d88();
	self thread function_e2104e07();
	if(isdefined(level.var_cee39136))
	{
		self [[level.var_cee39136]](var_45b95f80);
	}
	if(isdefined(level.var_52f56101))
	{
		self [[level.var_52f56101]](var_45b95f80);
	}
	self.doa.var_ccd8393c = 0;
	if(self doa_fate::function_8a19ece())
	{
		self namespace_b754744b::function_b784c6bd(46);
	}
	if(!isbot(self) && is_true(level.doa.var_318aa67a))
	{
		self thread namespace_a4bedd45::function_1f704cee(1);
	}
}

/*
	Name: function_d690f109
	Namespace: namespace_7f5aeb59
	Checksum: 0xE8145FB1
	Offset: 0x1868
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_d690f109()
{
	self endon(#"disconnect");
	waitframe(1);
	self clientfield::increment_to_player("controlBinding");
}

/*
	Name: function_fae39d88
	Namespace: namespace_7f5aeb59
	Checksum: 0x3197C397
	Offset: 0x18B0
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function function_fae39d88()
{
	if(!is_true(level.var_fdf900b7))
	{
		self disableweaponcycling();
	}
	self allowjump(is_true(self.doa.var_3e81d24c));
	self allowcrouch(0);
	self allowprone(0);
	self allowslide(is_true(self.doa.var_3e81d24c));
	self allowdoublejump(0);
	self allowwallrun(0);
	self allowmantle(0);
	self allowsprint(is_true(self.doa.var_3e81d24c));
	self allowads(is_true(self.doa.var_3e81d24c));
	self setstance("stand");
	self disableweaponreload();
	self solid();
}

/*
	Name: function_83fe843d
	Namespace: namespace_7f5aeb59
	Checksum: 0x7134E0E8
	Offset: 0x1A78
	Size: 0x1C2
	Parameters: 1
	Flags: Linked
*/
function function_83fe843d(player)
{
	i = 0;
	if(is_true(level.var_29628b5f))
	{
		if(self.team == #"allies")
		{
			return "blue";
		}
		if(self.team == #"axis")
		{
			return "red";
		}
		if(self.team == #"team3")
		{
			return "green";
		}
		if(self.team == #"team4")
		{
			return "yellow";
		}
		return "yellow";
	}
	i = player.entnum;
	if(is_true(level.var_4ed7ab1b))
	{
		i = i % 4;
	}
	switch(i)
	{
		case 0:
		{
			return "green";
		}
		case 1:
		{
			return "blue";
		}
		case 2:
		{
			return "red";
		}
		case 3:
		{
			return "yellow";
		}
		default:
		{
			/#
				assert(0, "");
			#/
		}
	}
}

/*
	Name: function_7781556b
	Namespace: namespace_7f5aeb59
	Checksum: 0x3D82EB39
	Offset: 0x1C48
	Size: 0x102
	Parameters: 2
	Flags: Linked
*/
function function_7781556b(origin, var_396c606d)
{
	if(!isdefined(var_396c606d))
	{
		var_396c606d = 0;
	}
	valid_player_found = 0;
	players = getplayers();
	if(players.size > 1)
	{
		players = arraysortclosest(players, origin);
	}
	foreach(player in players)
	{
		if(isplayervalid(player, var_396c606d))
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: isplayervalid
	Namespace: namespace_7f5aeb59
	Checksum: 0xB91897A6
	Offset: 0x1D58
	Size: 0xB0
	Parameters: 2
	Flags: Linked
*/
function isplayervalid(player, var_396c606d)
{
	if(!isdefined(var_396c606d))
	{
		var_396c606d = 0;
	}
	if(!isdefined(player))
	{
		return false;
	}
	if(!isplayer(player))
	{
		return false;
	}
	if(var_396c606d && is_true(player.ignoreme))
	{
		return false;
	}
	if(player.sessionstate == "spectator")
	{
		return false;
	}
	if(player.sessionstate == "intermission")
	{
		return false;
	}
	return true;
}

/*
	Name: function_2e8dc9d3
	Namespace: namespace_7f5aeb59
	Checksum: 0xDF2A7658
	Offset: 0x1E10
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function function_2e8dc9d3(volume)
{
	players = function_23e1f90f();
	foreach(player in players)
	{
		if(!player istouching(volume))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_23e1f90f
	Namespace: namespace_7f5aeb59
	Checksum: 0x7F5F3E1E
	Offset: 0x1ED0
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_23e1f90f()
{
	players = [];
	foreach(player in getplayers())
	{
		if(!isdefined(player))
		{
			continue;
		}
		if(isdefined(player.doa))
		{
			players[players.size] = player;
		}
	}
	return players;
}

/*
	Name: function_518c4c78
	Namespace: namespace_7f5aeb59
	Checksum: 0x5F5AB922
	Offset: 0x1F90
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_518c4c78()
{
	players = [];
	foreach(player in getplayers())
	{
		if(!isdefined(player))
		{
			continue;
		}
		if(is_true(player.laststand))
		{
			continue;
		}
		if(isdefined(player.doa))
		{
			players[players.size] = player;
		}
	}
	return players;
}

/*
	Name: function_878118b
	Namespace: namespace_7f5aeb59
	Checksum: 0xAA7A5826
	Offset: 0x2070
	Size: 0xF0
	Parameters: 0
	Flags: Linked
*/
function function_878118b()
{
	downedplayers = [];
	players = function_23e1f90f();
	foreach(player in players)
	{
		if(!is_true(player.laststand))
		{
			continue;
		}
		if(player.doa.score.lives > 0)
		{
			continue;
		}
		downedplayers[downedplayers.size] = player;
	}
	return downedplayers;
}

/*
	Name: function_f08b75c1
	Namespace: namespace_7f5aeb59
	Checksum: 0x4BC21D16
	Offset: 0x2168
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_f08b75c1()
{
	players = function_23e1f90f();
	return players.size;
}

/*
	Name: function_88b90714
	Namespace: namespace_7f5aeb59
	Checksum: 0x24C28540
	Offset: 0x2198
	Size: 0x12E
	Parameters: 1
	Flags: None
*/
function function_88b90714(var_9618185e)
{
	if(!isdefined(var_9618185e))
	{
		var_9618185e = 2;
	}
	players = function_23e1f90f();
	most = undefined;
	var_8bc263b9 = 0;
	foreach(player in players)
	{
		if(player.doa.score.lives <= var_9618185e)
		{
			continue;
		}
		if(player.doa.score.lives > var_8bc263b9)
		{
			most = player;
			var_8bc263b9 = player.doa.score.lives;
		}
	}
	return most;
}

/*
	Name: getclosestto
	Namespace: namespace_7f5aeb59
	Checksum: 0x66122D4
	Offset: 0x22D0
	Size: 0x72
	Parameters: 3
	Flags: None
*/
function getclosestto(origin, &entarray, maxdist)
{
	if(!isdefined(maxdist))
	{
		maxdist = 2048;
	}
	if(!isdefined(entarray))
	{
		return;
	}
	if(entarray.size == 0)
	{
		return;
	}
	if(entarray.size == 1)
	{
		return entarray[0];
	}
	return arraygetclosest(origin, entarray, maxdist);
}

/*
	Name: function_19616199
	Namespace: namespace_7f5aeb59
	Checksum: 0x1C272355
	Offset: 0x2350
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function function_19616199()
{
	/#
		self endon(#"disconnect");
		level endon(#"game_over");
		self notify("");
		self endon("");
		while(is_true(level.doa.var_2e491399))
		{
			waitframe(1);
			if(self getinvulnerability() || is_true(self.doa.var_221ef439))
			{
				level thread namespace_1e25ad94::function_e8f2d12c(self.origin, 60, 72, 1, (1, 0, 0));
			}
		}
	#/
}

/*
	Name: function_77785447
	Namespace: namespace_7f5aeb59
	Checksum: 0xB14356CA
	Offset: 0x2430
	Size: 0x1EC
	Parameters: 2
	Flags: Linked
*/
function function_77785447(on, clear)
{
	if(!isdefined(clear))
	{
		clear = 0;
	}
	if(!isdefined(self) || !isdefined(self.doa))
	{
		return;
	}
	if(!isdefined(self.doa.var_221ef439))
	{
		self.doa.var_221ef439 = 0;
	}
	loc_000024D0:
	namespace_1e25ad94::debugmsg(((("Player(" + self.doa.color) + ") playerInvulnerability active: ") + (on ? "true" : "false") + "  clear: ") + (clear ? "true" : "false"));
	if(clear)
	{
		self.doa.var_221ef439 = 0;
	}
	if(on)
	{
		self.doa.var_221ef439++;
	}
	else
	{
		self.doa.var_221ef439--;
	}
	if(self.doa.var_221ef439 > 0)
	{
		self enableinvulnerability();
		self.takedamage = 0;
	}
	else
	{
		self.doa.var_221ef439 = 0;
		self disableinvulnerability();
		self.takedamage = 1;
	}
	namespace_1e25ad94::debugmsg((("Player(" + self.doa.color) + ") invulRefCount: ") + (isdefined(self.doa.var_221ef439) ? self.doa.var_221ef439 : "undefined"));
}

/*
	Name: function_61bccc9
	Namespace: namespace_7f5aeb59
	Checksum: 0x5DEE3843
	Offset: 0x2628
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_61bccc9()
{
	return isdefined(self.doa.var_9cd55f0c) && self.doa.var_9cd55f0c.activetime >= gettime();
}

/*
	Name: turnplayershieldoff
	Namespace: namespace_7f5aeb59
	Checksum: 0x47FB8199
	Offset: 0x2668
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function turnplayershieldoff()
{
	if(isdefined(self.doa.var_9cd55f0c))
	{
		self.doa.var_9cd55f0c.activetime = 0;
	}
	self namespace_83eb6304::turnofffx("player_shield_short");
	self namespace_83eb6304::turnofffx("player_shield_short_sideView");
	self namespace_83eb6304::turnofffx("player_shield_long");
	self namespace_83eb6304::turnofffx("player_shield_long_sideView");
}

/*
	Name: turnplayershieldon
	Namespace: namespace_7f5aeb59
	Checksum: 0x6DD82E23
	Offset: 0x2720
	Size: 0x3CC
	Parameters: 1
	Flags: Linked
*/
function turnplayershieldon(short_shield)
{
	if(!isdefined(short_shield))
	{
		short_shield = 1;
	}
	if(!isplayer(self))
	{
		return;
	}
	self endon(#"disconnect");
	self endon(#"enter_vehicle");
	self notify("4ec8bfc3f2a25978");
	self endon("4ec8bfc3f2a25978");
	if(!isdefined(self.doa) || isdefined(self.doa.vehicle))
	{
		return;
	}
	if(!is_true(self.doa.var_c026f7c9))
	{
		self namespace_e32bb68::function_3a59ec34("evt_doa_player_shield_start");
	}
	if(!short_shield)
	{
		self namespace_e32bb68::function_3a59ec34("evt_doa_player_shield_full");
	}
	if(!isdefined(self.doa.var_9cd55f0c))
	{
		self.doa.var_9cd55f0c = namespace_ec06fe4a::spawntrigger("trigger_radius", self.origin, ((1 | 512) | 8) | 16, 60, 72);
		self.doa.var_9cd55f0c.activetime = 0;
		self.doa.var_9cd55f0c thread namespace_ec06fe4a::function_ae010bb4(self);
		self.doa.var_9cd55f0c thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
		self.doa.var_9cd55f0c.targetname = "turnPlayerShieldOn";
		self.doa.var_9cd55f0c enablelinkto();
		self.doa.var_9cd55f0c linkto(self);
		self.doa.var_9cd55f0c thread shield_trigger_think(self);
	}
	if(short_shield)
	{
		activetime = gettime() + 3500;
		if(self.doa.var_9cd55f0c.activetime < activetime)
		{
			self.doa.var_9cd55f0c.activetime = activetime;
		}
		if(!is_true(level.doa.var_af74d0b))
		{
			self namespace_83eb6304::function_3ecfde67("player_shield_short");
		}
		else
		{
			self namespace_83eb6304::function_3ecfde67("player_shield_short_sideView");
		}
	}
	else
	{
		self.doa.var_9cd55f0c.activetime = gettime() + 9500;
		if(!is_true(level.doa.var_af74d0b))
		{
			self namespace_83eb6304::function_3ecfde67("player_shield_long");
		}
		else
		{
			self namespace_83eb6304::function_3ecfde67("player_shield_long_sideView");
		}
		wait(6);
	}
	self namespace_e32bb68::function_3a59ec34("evt_doa_player_shield_half");
	wait(3);
	self namespace_e32bb68::function_3a59ec34("evt_doa_player_shield_stop");
}

/*
	Name: function_9f177b30
	Namespace: namespace_7f5aeb59
	Checksum: 0xCD0E3C40
	Offset: 0x2AF8
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function function_9f177b30(player)
{
	self endon(#"death");
	level endon(#"game_over");
	while(true)
	{
		if(player function_61bccc9())
		{
			level thread namespace_1e25ad94::function_e8f2d12c(self.origin, 60, 72, 1, (1, 0, 0));
		}
		waitframe(1);
	}
}

/*
	Name: shield_trigger_think
	Namespace: namespace_7f5aeb59
	Checksum: 0x45E5577C
	Offset: 0x2B88
	Size: 0x594
	Parameters: 4
	Flags: Linked
*/
function shield_trigger_think(player, var_ca85cba1, thresh, boosting)
{
	if(!isdefined(boosting))
	{
		boosting = 0;
	}
	self endon(#"death");
	if(getdvarint(#"hash_e71870b070f9374", 0))
	{
		self thread function_9f177b30(player);
	}
	self thread function_e93fae6f(player);
	self.player = player;
	while(isdefined(player))
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		if(self.activetime < gettime())
		{
			continue;
		}
		guy = waitresult.activator;
		if(!isdefined(player.team))
		{
			continue;
		}
		if(!isdefined(guy))
		{
			continue;
		}
		if(isplayer(guy))
		{
			continue;
		}
		if(isdefined(guy.launched))
		{
			continue;
		}
		if(!issentient(guy))
		{
			continue;
		}
		if(!is_true(guy.takedamage))
		{
			continue;
		}
		if(is_true(guy.var_3505487) || is_true(guy.boss))
		{
			continue;
		}
		if(!isdefined(guy.team))
		{
			continue;
		}
		if(guy.team === player.team)
		{
			continue;
		}
		ok = 1;
		if(isdefined(var_ca85cba1))
		{
			v_velocity = var_ca85cba1 getvelocity();
			speed = lengthsquared(v_velocity);
			/#
			#/
			ok = speed < sqr(thresh);
		}
		if(!ok)
		{
			continue;
		}
		guy setplayercollision(0);
		guy.var_eeaac918 = boosting;
		if(!isvehicle(guy))
		{
			if(!is_true(guy.no_ragdoll))
			{
				guy.launched = 1;
				if(is_true(guy.var_4dcf6637) || randomint(100) < 50)
				{
					velocity = namespace_ec06fe4a::velocity_to_mph(player getvelocity());
					if(velocity > 30 && !is_true(guy.no_gib))
					{
						guy thread namespace_83eb6304::function_3ecfde67("boost_explode");
						namespace_ed80aead::trygibbinglimb(guy, 5000);
						namespace_ed80aead::trygibbinglegs(guy, 5000, undefined, undefined, undefined, 1, player);
					}
					/#
						assert(!is_true(guy.boss));
					#/
					guy thread namespace_ec06fe4a::function_5678f0d(vectorscale((0, 0, 1), 220), 180, 0.3, player);
					guy thread namespace_ec06fe4a::function_570729f0(0.2, player, "MOD_EXPLOSIVE", level.doa.default_weapon);
					guy namespace_e32bb68::function_3a59ec34("zmb_ragdoll_launched");
				}
				else
				{
					guy.annihilate = 1;
					guy dodamage(guy.health, player.origin, player, player, "none", "MOD_EXPLOSIVE", 0, level.doa.default_weapon);
				}
			}
			else
			{
				guy dodamage(guy.health, player.origin, player, player, "none", "MOD_EXPLOSIVE", 0, level.doa.default_weapon);
			}
		}
		else
		{
			guy thread namespace_ec06fe4a::function_570729f0(0.1, player, "MOD_EXPLOSIVE", level.doa.default_weapon);
		}
	}
	self delete();
}

/*
	Name: function_e93fae6f
	Namespace: namespace_7f5aeb59
	Checksum: 0x7E94D885
	Offset: 0x3128
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e93fae6f(player)
{
	self endon(#"death");
	if(!isdefined(level.doa) || !isdefined(level.doa.hazards))
	{
		return;
	}
	while(true)
	{
		foreach(hazard in level.doa.hazards)
		{
			if(isdefined(hazard) && self istouching(hazard) && isdefined(hazard.death_func))
			{
				hazard thread [[hazard.death_func]]();
			}
		}
		wait(0.1);
	}
}

/*
	Name: function_a8b57c52
	Namespace: namespace_7f5aeb59
	Checksum: 0xF8F49225
	Offset: 0x3258
	Size: 0x248
	Parameters: 4
	Flags: Linked
*/
function function_a8b57c52(var_2784b779, angles, ignore, var_b498e4b0)
{
	players = getplayers();
	foreach(player in players)
	{
		player notify(#"hash_279998c5df86c04d");
		player notify(#"hash_7893364bd228d63e");
	}
	wait(0.2);
	players = getplayers();
	offset = vectorscale((1, -1, 0), 8);
	foreach(player in players)
	{
		player thread turnplayershieldon(0);
		if(isdefined(ignore))
		{
			if(isarray(ignore))
			{
				if(isinarray(ignore, player))
				{
					continue;
				}
			}
			else if(player === ignore)
			{
				continue;
			}
		}
		if(isdefined(var_b498e4b0) && player istouching(var_b498e4b0))
		{
			continue;
		}
		player setorigin(var_2784b779);
		player setplayerangles(angles);
		var_2784b779 = var_2784b779 + offset;
		offset = offset * -1;
	}
}

/*
	Name: function_c0310e2a
	Namespace: namespace_7f5aeb59
	Checksum: 0x7F9B8C11
	Offset: 0x34A8
	Size: 0x45E
	Parameters: 0
	Flags: Linked
*/
function function_c0310e2a()
{
	/#
		if(!getdvarint(#"hash_2364dfae0e289844", 0))
		{
			return;
		}
		while(true)
		{
			if(self stancebuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self fragbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self reloadbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self secondaryoffhandbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self inventorybuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self offhandspecialbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self weaponswitchbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self vehiclemoveupbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self actionbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self jumpbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self sprintbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self meleebuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self throwbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self adsbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self actionslotfourbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self actionslotthreebuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self actionslottwobuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self actionslotonebuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self attackbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self boostbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self changeseatbuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			if(self usebuttonpressed())
			{
				namespace_1e25ad94::debugmsg("");
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_5ed5daa7
	Namespace: namespace_7f5aeb59
	Checksum: 0x3F6391CC
	Offset: 0x3910
	Size: 0x2CE
	Parameters: 0
	Flags: Linked
*/
function function_5ed5daa7()
{
	/#
		assert(isdefined(self.doa));
	#/
	if(self doa_fate::function_d17f9bcb())
	{
		self.doa.score.boosts = int(max(self.doa.score.boosts, 2));
	}
	else
	{
		self.doa.score.boosts = int(max(self.doa.score.boosts, 1));
	}
	if(self doa_fate::function_8a19ece())
	{
		self.doa.score.bombs = int(max(self.doa.score.bombs, 2));
		roll = randomint(30);
		if(roll < 10)
		{
			level doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_barrel"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
		}
		else
		{
			if(roll < 10)
			{
				level doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_boxing_glove"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
			}
			else
			{
				level doa_pickups::itemspawn(doa_pickups::function_6265bde4("zombietron_sawblade"), self.origin, undefined, undefined, 1, undefined, undefined, undefined, self);
			}
		}
	}
	else
	{
		self.doa.score.bombs = int(max(self.doa.score.bombs, 1));
	}
	self.health = self.maxhealth;
	self.ignoreme = 0;
}

/*
	Name: function_d0251f76
	Namespace: namespace_7f5aeb59
	Checksum: 0x6E621DA4
	Offset: 0x3BE8
	Size: 0x208
	Parameters: 1
	Flags: Linked
*/
function function_d0251f76(var_8987df35)
{
	if(!isdefined(var_8987df35))
	{
		var_8987df35 = 1;
	}
	players = function_23e1f90f();
	foreach(player in players)
	{
		if(!isalive(player) || is_true(player.doa.respawning))
		{
			player function_513831e1();
		}
		if(is_true(var_8987df35))
		{
			player function_5ed5daa7();
		}
		player.doa.var_d320bb5d = undefined;
		player namespace_83eb6304::turnofffx("lantern_fade");
		player namespace_83eb6304::turnofffx("lantern");
		player notify(#"lantern_terminated");
		if(isdefined(player.doa.var_ad639ebd))
		{
			player.doa.var_ad639ebd delete();
		}
		player.doa.var_f583234e = 0;
		player clientfield::set_to_player("toggleflashlight", player.doa.var_f583234e);
	}
}

/*
	Name: function_513831e1
	Namespace: namespace_7f5aeb59
	Checksum: 0x1FAE741D
	Offset: 0x3DF8
	Size: 0x434
	Parameters: 2
	Flags: Linked
*/
function function_513831e1(var_c4b5b87c, spot)
{
	if(!isdefined(var_c4b5b87c))
	{
		var_c4b5b87c = 0;
	}
	if(!isdefined(spot))
	{
		spot = undefined;
	}
	self endon(#"disconnect");
	level endon(#"game_over");
	if(!isdefined(self))
	{
		return;
	}
	/#
		assert(isdefined(self.doa));
	#/
	namespace_1e25ad94::debugmsg("player respawning now");
	self.doa.respawning = 0;
	self namespace_ec06fe4a::function_4f72130c();
	self notify(#"doa_respawn_player");
	self undolaststand();
	self.laststand = 0;
	level.doa.downedplayers = function_878118b();
	self solid();
	self clientfield::set_to_player("lastStand", 0);
	namespace_1e25ad94::debugmsg("player respawning stage 1 complete");
	self.doa.var_fd5fcb75 = "";
	self laststand_enable_player_weapons();
	self reviveplayer();
	self.health = 150;
	if(!isdefined(spot))
	{
		spot = self.origin;
	}
	if(isdefined(self.revivetrigger))
	{
		self.revivetrigger delete();
	}
	self setorigin(spot);
	namespace_1e25ad94::debugmsg("player respawning stage 2 complete");
	if(mayspawnentity())
	{
		self playsound("zmb_player_respawn");
	}
	self namespace_83eb6304::turnofffx("remote_player_busy");
	self namespace_83eb6304::function_3ecfde67("player_respawn_" + self.doa.color);
	self turnplayershieldoff();
	self function_77785447(0, 1);
	self thread function_fcc90081(var_c4b5b87c);
	namespace_1e25ad94::debugmsg("player respawning stage 3 complete");
	if(!var_c4b5b87c)
	{
		self thread turnplayershieldon(0);
	}
	self setplayercollision(1);
	self namespace_ec06fe4a::function_a4b3f184(0);
	self.dead = undefined;
	self.var_4a81243b = undefined;
	self notify(#"player_respawned");
	namespace_1e25ad94::debugmsg("player respawning stage 4 complete");
	if(!var_c4b5b87c && self.doa.score.lives)
	{
		self.doa.score.lives--;
		if(self.doa.score.lives < 0)
		{
			self.doa.score.lives = 0;
		}
	}
	if(self doa_fate::function_b01c3b20())
	{
		self thread function_a99cfd4f();
	}
	namespace_1e25ad94::debugmsg("player respawn done");
}

/*
	Name: function_ebcb2cca
	Namespace: namespace_7f5aeb59
	Checksum: 0x2984F3B
	Offset: 0x4238
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function function_ebcb2cca()
{
	self notify("63ca6d8f7818ae05");
	self endon("63ca6d8f7818ae05");
	self endon(#"disconnnect");
	level endon(#"game_over");
	rate = 2;
	if(self doa_fate::function_b01c3b20())
	{
		rate = rate + 2;
	}
	while(isdefined(self))
	{
		if(self.health < self.maxhealth && !is_true(self.doa.respawning))
		{
			self.health = self.health + rate;
			if(self.health > self.maxhealth)
			{
				self.health = self.maxhealth;
			}
		}
		wait(1);
	}
}

/*
	Name: function_5934bbc8
	Namespace: namespace_7f5aeb59
	Checksum: 0xEAF3DE3B
	Offset: 0x4340
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function function_5934bbc8()
{
	switch(self.doa.color)
	{
		case "green":
		{
			return (0, 1, 0);
		}
		case "blue":
		{
			return (0, 0, 1);
		}
		case "red":
		{
			return (1, 0, 0);
		}
		case "yellow":
		{
			return (1, 1, 0);
		}
		default:
		{
			return (1, 1, 1);
		}
	}
}

/*
	Name: function_f8645db3
	Namespace: namespace_7f5aeb59
	Checksum: 0xC9DC5860
	Offset: 0x43E0
	Size: 0x140
	Parameters: 1
	Flags: Linked
*/
function function_f8645db3(var_370ac26d)
{
	if(!getdvarint(#"hash_73899531201aebda", 0))
	{
		return;
	}
	if(getdvarint(#"hash_262e5087a510a8dc", 0))
	{
		luinotifyevent(#"hash_3e6dd0ad7b864154", 1, var_370ac26d);
		foreach(player in function_23e1f90f())
		{
			player.doa.var_370ac26d = player.doa.var_370ac26d + var_370ac26d;
			player addrankxpvalue("wave_end_xp", var_370ac26d, 4);
		}
	}
}

/*
	Name: function_67f054d7
	Namespace: namespace_7f5aeb59
	Checksum: 0xBF9CCBEC
	Offset: 0x4528
	Size: 0x146
	Parameters: 1
	Flags: Linked
*/
function function_67f054d7(duration)
{
	if(!isdefined(duration))
	{
		duration = 2;
	}
	if(is_true(level.var_b62ca8c))
	{
		return;
	}
	self notify("259e20f3e1ed5ea1");
	self endon("259e20f3e1ed5ea1");
	level notify(#"hash_7893364bd228d63e");
	namespace_ec06fe4a::function_445bad70(1);
	players = getplayers();
	foreach(player in players)
	{
		player thread lui::screen_fade_out(duration);
	}
	wait(duration);
	util::wait_network_frame();
	self notify(#"hash_1b322de3d2e3e781");
}

/*
	Name: function_ec758d18
	Namespace: namespace_7f5aeb59
	Checksum: 0x1D190F8
	Offset: 0x4678
	Size: 0xC8
	Parameters: 0
	Flags: Linked
*/
function function_ec758d18()
{
	players = getplayers();
	foreach(player in players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		if(player.birthtime == gettime())
		{
			waitframe(1);
		}
		player clientfield::increment_to_player("controlBinding");
	}
}

/*
	Name: function_836aeb74
	Namespace: namespace_7f5aeb59
	Checksum: 0x3D97AC45
	Offset: 0x4748
	Size: 0x17E
	Parameters: 1
	Flags: Linked
*/
function function_836aeb74(duration)
{
	if(!isdefined(duration))
	{
		duration = 2;
	}
	if(is_true(level.var_b62ca8c))
	{
		return;
	}
	self notify("7e7509c97d95723b");
	self endon("7e7509c97d95723b");
	level notify(#"hash_7893364bd228d63e");
	namespace_ec06fe4a::function_445bad70(0);
	players = getplayers();
	foreach(player in players)
	{
		if(isdefined(player.var_d57eeb7f) && player.var_d57eeb7f == 0)
		{
			continue;
		}
		if(is_true(player.is_ready))
		{
			player thread lui::function_a6eb5334(duration);
		}
	}
	wait(duration);
	level.doa.var_270a21a3 = undefined;
	self notify(#"hash_58caf0ade03043bb");
}

/*
	Name: function_96c20925
	Namespace: namespace_7f5aeb59
	Checksum: 0x4D1D0C84
	Offset: 0x48D0
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_96c20925(duration)
{
	if(!isdefined(duration))
	{
		duration = 2;
	}
	self namespace_ec06fe4a::function_a4b3f184(0);
	self thread lui::function_a6eb5334(duration);
	wait(duration);
}

/*
	Name: function_f83ea3c
	Namespace: namespace_7f5aeb59
	Checksum: 0x7C46A0C4
	Offset: 0x4930
	Size: 0x194
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f83ea3c(var_832465bf, timeout)
{
	if(!isdefined(var_832465bf))
	{
		var_832465bf = 0;
	}
	if(!isdefined(timeout))
	{
		timeout = 30;
	}
	self notify("72b1a89f985734c3");
	self endon("72b1a89f985734c3");
	self endon(#"disconnect");
	result = undefined;
	result = self waittilltimeout(timeout, #"speed_change", #"entering_last_stand", #"hash_eda603acd32c6ca");
	if(!var_832465bf)
	{
		self.doa.fast_feet = undefined;
		self namespace_83eb6304::turnofffx("boots");
		self namespace_e32bb68::function_ae271c0b("evt_doa_pickup_boots_active_lp");
	}
	else
	{
		self.doa.var_51a3bdbd = undefined;
		self namespace_83eb6304::turnofffx("nova_crawler_aura_fx");
		self namespace_e32bb68::function_ae271c0b("zmb_pwup_slowspeed_loop");
		self namespace_e32bb68::function_3a59ec34("zmb_pwup_slowspeed_end");
	}
	self setmovespeedscale(self.doa.default_movespeed);
}

/*
	Name: function_ec9a307f
	Namespace: namespace_7f5aeb59
	Checksum: 0x6210AFB3
	Offset: 0x4AD0
	Size: 0x22E
	Parameters: 3
	Flags: Linked
*/
function function_ec9a307f(time, rate, var_72515092)
{
	if(!isdefined(time))
	{
		time = 5;
	}
	if(!isdefined(rate))
	{
		rate = 0.7;
	}
	self endon(#"disconnect");
	if(self function_61bccc9())
	{
		return;
	}
	if(self getinvulnerability() || is_true(self.doa.var_221ef439))
	{
		return;
	}
	if(isdefined(self.doa.fast_feet))
	{
		self notify(#"speed_change");
	}
	self thread function_f83ea3c(1, time + 1);
	if(!isdefined(self.doa.var_51a3bdbd))
	{
		self.doa.var_51a3bdbd = 1;
		self namespace_e32bb68::function_3a59ec34("zmb_pwup_slowspeed_loop");
		self namespace_83eb6304::function_3ecfde67("nova_crawler_aura_fx");
		self setmovespeedscale(rate);
	}
	if(isdefined(var_72515092))
	{
		var_8937f972 = gettime() + (var_72515092 * 1000);
		while(isdefined(level.doa.var_6f3d327) && gettime() < var_8937f972)
		{
			wait(0.25);
		}
	}
	self.doa.var_2161f996 = gettime() + (time * 1000);
	while(self.doa.var_2161f996 > gettime())
	{
		wait(0.25);
	}
	if(is_true(self.doa.var_51a3bdbd))
	{
		self notify(#"hash_eda603acd32c6ca");
	}
}

/*
	Name: function_a99cfd4f
	Namespace: namespace_7f5aeb59
	Checksum: 0x69491DFA
	Offset: 0x4D08
	Size: 0x146
	Parameters: 2
	Flags: Linked
*/
function function_a99cfd4f(time, rate)
{
	if(!isdefined(time))
	{
		time = 25;
	}
	if(!isdefined(rate))
	{
		rate = 1.5;
	}
	self endon(#"disconnect");
	self notify("5d80a8c5cffee345");
	self endon("5d80a8c5cffee345");
	waitframe(1);
	if(!is_true(self.doa.fast_feet))
	{
		self notify(#"speed_change");
		self thread function_f83ea3c();
		self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_boots_active_lp");
		self thread namespace_83eb6304::function_3ecfde67("boots");
	}
	self setmovespeedscale(rate);
	self.doa.fast_feet = 1;
	self.doa.var_51a3bdbd = undefined;
	wait(time);
	self notify(#"hash_eda603acd32c6ca");
}

/*
	Name: laststand_disable_player_weapons
	Namespace: namespace_7f5aeb59
	Checksum: 0x1D544FBF
	Offset: 0x4E58
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function laststand_disable_player_weapons()
{
	self giveweapon(level.laststandweapon);
	self givemaxammo(level.laststandweapon);
	self switchtoweaponimmediate(level.laststandweapon, 1);
	self disableweaponcycling();
	self disableoffhandweapons();
}

/*
	Name: laststand_enable_player_weapons
	Namespace: namespace_7f5aeb59
	Checksum: 0x88F420D7
	Offset: 0x4EF8
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function laststand_enable_player_weapons()
{
	self endon(#"disconnect");
	self takeweapon(level.laststandweapon);
	self enableweaponcycling();
	self enableoffhandweapons();
	self enableusability();
	self namespace_41cb996::function_6c4d9896(self.doa.var_ed8fde10);
}

/*
	Name: function_884143e
	Namespace: namespace_7f5aeb59
	Checksum: 0x9B2D5A0B
	Offset: 0x4FA8
	Size: 0x1C4
	Parameters: 1
	Flags: None
*/
function function_884143e(attacker)
{
	/#
		if(isdefined(attacker))
		{
			level thread namespace_1e25ad94::debugcircle(attacker.origin + vectorscale((0, 0, 1), 12), 40, 10, (1, 0, 0));
			level thread namespace_1e25ad94::debugline(self.origin + vectorscale((0, 0, 1), 12), attacker.origin + vectorscale((0, 0, 1), 12), 10, (1, 0, 0));
			attacker thread namespace_1e25ad94::debugorigin(10, 24, (1, 0, 0));
			if(isdefined(attacker.zombie_type))
			{
				text = attacker.zombie_type;
			}
			else
			{
				if(isdefined(attacker.var_fd5301f9))
				{
					text = attacker.var_fd5301f9;
				}
				else
				{
					if(isdefined(attacker.model))
					{
						text = function_9e72a96(attacker.model);
					}
					else
					{
						if(isdefined(attacker.targetname))
						{
							text = function_9e72a96(attacker.targetname);
						}
						else
						{
							if(isdefined(attacker.classname))
							{
								text = function_9e72a96(attacker.classname);
							}
							else
							{
								text = "";
							}
						}
					}
				}
			}
			level thread namespace_1e25ad94::function_75ebaff2(text, 10, attacker);
		}
	#/
}

/*
	Name: function_52392bd1
	Namespace: namespace_7f5aeb59
	Checksum: 0xA9253A5A
	Offset: 0x5178
	Size: 0x100
	Parameters: 1
	Flags: Linked
*/
function function_52392bd1(long)
{
	if(!isdefined(long))
	{
		long = 0;
	}
	self endon(#"disconnect");
	level endon(#"game_over");
	if(!long)
	{
		self thread namespace_6e90e490::function_47e11416(2, undefined, 1);
	}
	else
	{
		while(is_true(self.laststand))
		{
			wait(randomint(15));
			if(level flag::get("doa_round_paused"))
			{
				continue;
			}
			if(is_true(self.laststand))
			{
				self thread namespace_6e90e490::function_47e11416(3);
			}
		}
	}
}

/*
	Name: function_12bdee53
	Namespace: namespace_7f5aeb59
	Checksum: 0x6F8DAB24
	Offset: 0x5280
	Size: 0x35C
	Parameters: 2
	Flags: Linked
*/
function function_12bdee53(clone, player)
{
	if(isplayer(player) && isai(clone))
	{
		if(player function_390cb543())
		{
			var_1749f1e8 = player function_92ea4100();
			if(isdefined(var_1749f1e8))
			{
				clone setmodel(var_1749f1e8);
			}
			headmodel = player function_44a7328f();
			if(isdefined(headmodel))
			{
				if(isdefined(clone.head))
				{
					clone detach(clone.head);
				}
				clone attach(headmodel);
			}
			if(isdefined(clone.legs))
			{
				clone detach(clone.legs);
			}
			if(isdefined(clone.torso))
			{
				clone detach(clone.torso);
			}
		}
		else
		{
			var_41206ae3 = player function_5d23af5b();
			if(isdefined(var_41206ae3))
			{
				clone setmodel(var_41206ae3);
			}
			headmodel = player function_44a7328f();
			if(isdefined(headmodel) && headmodel != #"tag_origin")
			{
				if(isdefined(clone.head))
				{
					clone detach(clone.head);
				}
				clone attach(headmodel);
			}
			var_b4d88433 = player function_cde23658();
			if(isdefined(var_b4d88433) && var_b4d88433 != #"tag_origin")
			{
				if(isdefined(clone.legs))
				{
					clone detach(clone.legs);
				}
				clone attach(var_b4d88433);
			}
			var_1749f1e8 = player function_92ea4100();
			if(isdefined(var_1749f1e8) && var_1749f1e8 != #"tag_origin")
			{
				if(isdefined(clone.torso))
				{
					clone detach(clone.torso);
				}
				clone attach(var_1749f1e8);
			}
		}
		clone function_1fac41e4(player function_19124308());
	}
}

/*
	Name: function_31df67c1
	Namespace: namespace_7f5aeb59
	Checksum: 0x6491D157
	Offset: 0x55E8
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_31df67c1(player)
{
	if(isdefined(player.doa.currentweapon))
	{
		self shared::placeweaponon(player.doa.currentweapon, "right");
	}
}

/*
	Name: function_f98b7b5f
	Namespace: namespace_7f5aeb59
	Checksum: 0x9EC10150
	Offset: 0x5648
	Size: 0x190
	Parameters: 1
	Flags: Linked
*/
function function_f98b7b5f(player)
{
	var_41206ae3 = player function_5d23af5b();
	headmodel = player function_44a7328f();
	var_b4d88433 = player function_cde23658();
	var_1749f1e8 = player function_92ea4100();
	clone = namespace_ec06fe4a::function_e22ae9b3(player.origin, "tag_origin", player.angles, "player clone model");
	if(isdefined(var_41206ae3))
	{
		clone setmodel(var_41206ae3);
	}
	if(isdefined(headmodel) && headmodel != #"tag_origin")
	{
		clone attach(headmodel);
	}
	if(isdefined(var_b4d88433) && var_b4d88433 != #"tag_origin")
	{
		clone attach(var_b4d88433);
	}
	if(isdefined(var_1749f1e8) && var_1749f1e8 != #"tag_origin")
	{
		clone attach(var_1749f1e8);
	}
	return clone;
}

/*
	Name: function_e2104e07
	Namespace: namespace_7f5aeb59
	Checksum: 0xBA1F4A10
	Offset: 0x57E0
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function function_e2104e07()
{
	self endon(#"disconnect");
	self notify("2c700ea92d9bf49");
	self endon("2c700ea92d9bf49");
	while(true)
	{
		waitframe(1);
		self function_8fef418b();
	}
}

/*
	Name: function_6c074975
	Namespace: namespace_7f5aeb59
	Checksum: 0x97026EFD
	Offset: 0x5840
	Size: 0x12E
	Parameters: 0
	Flags: Linked
*/
function function_6c074975()
{
	switch(level.doa.world_state)
	{
		case 0:
		{
			lookahead = 0.45;
			break;
		}
		case 4:
		{
			lookahead = 0.65;
			break;
		}
		case 5:
		{
			lookahead = 0.55;
			break;
		}
		default:
		{
			lookahead = 0.45;
			break;
		}
	}
	if(!isdefined(self.doa.predicted_pos))
	{
		self.doa.predicted_pos = self.origin;
	}
	velocity = self getvelocity();
	self.doa.predicted_pos = self.origin + (velocity * lookahead);
	return self.doa.predicted_pos;
}

/*
	Name: function_8fef418b
	Namespace: namespace_7f5aeb59
	Checksum: 0xE35419B4
	Offset: 0x5978
	Size: 0x3F2
	Parameters: 0
	Flags: Linked
*/
function function_8fef418b()
{
	if(!isdefined(self.last_valid_position))
	{
		self.last_valid_position = getclosestpointonnavmesh(self.origin, 2048, 0);
	}
	if(!isdefined(self.playerradius))
	{
		self.playerradius = 24;
	}
	if(!isdefined(self.var_f09063b2))
	{
		self.var_f09063b2 = sqr(self.playerradius);
	}
	if(!isdefined(self.last_valid_position))
	{
		return;
	}
	if(isdefined(self.doa.vehicle))
	{
		if(isdefined(self.doa.var_baad518e))
		{
			origin = self.doa.var_baad518e;
		}
		else
		{
			origin = self.doa.vehicle.origin;
		}
	}
	else
	{
		if(1)
		{
			if(is_true(self.doa.var_c026f7c9))
			{
				origin = self.origin;
			}
			else
			{
				origin = function_6c074975();
			}
		}
		else
		{
			origin = self.origin;
		}
	}
	if(ispointonnavmesh(self.last_valid_position) && distance2dsquared(origin, self.last_valid_position) < sqr(self.playerradius) && (sqr(origin[2] - self.last_valid_position[2])) < sqr(16))
	{
		return;
	}
	if(self isplayerswimming())
	{
		if(isdefined(self.var_5d991645))
		{
			if(distancesquared(origin, self.var_5d991645) < sqr(self.playerradius))
			{
				return;
			}
		}
		ground_pos = groundtrace(origin + vectorscale((0, 0, 1), 8), origin + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
		if(!isdefined(ground_pos))
		{
			return;
		}
		position = getclosestpointonnavmesh(ground_pos, 256, self.playerradius);
		if(isdefined(position))
		{
			self.last_valid_position = position;
			self.var_5d991645 = origin;
		}
	}
	else
	{
		if(ispointonnavmesh(origin, self.playerradius))
		{
			self.last_valid_position = origin;
		}
		else
		{
			if(ispointonnavmesh(self.last_valid_position, self.playerradius) && distance2dsquared(origin, self.last_valid_position) < self.var_f09063b2 && (sqr(origin[2] - self.last_valid_position[2])) < self.var_f09063b2)
			{
				return;
			}
			position = getclosestpointonnavmesh(origin, 100, self.playerradius);
			if(isdefined(position))
			{
				self.last_valid_position = position;
			}
		}
	}
}

/*
	Name: function_a74228bc
	Namespace: namespace_7f5aeb59
	Checksum: 0x9C83F1A9
	Offset: 0x5D78
	Size: 0xDE
	Parameters: 1
	Flags: Linked
*/
function function_a74228bc(value)
{
	if(!isdefined(value))
	{
		value = 450;
	}
	self notify("3f91245325dad0bf");
	self endon("3f91245325dad0bf");
	self endon(#"disconnect");
	self.doa.var_9ff62c1c = self.doa.var_9ff62c1c + value;
	dec = 6;
	while(self.doa.var_9ff62c1c > 0)
	{
		waitframe(1);
		self.doa.var_9ff62c1c = math::clamp(self.doa.var_9ff62c1c - dec, 0, self.doa.var_9ff62c1c);
	}
}

/*
	Name: function_61d74d57
	Namespace: namespace_7f5aeb59
	Checksum: 0xAB14EEAF
	Offset: 0x5E60
	Size: 0x96
	Parameters: 0
	Flags: Linked
*/
function function_61d74d57()
{
	self.var_85f8774c = 1;
	foreach(chicken in self.doa.var_20c63763)
	{
		chicken.var_85f8774c = 1;
	}
}

