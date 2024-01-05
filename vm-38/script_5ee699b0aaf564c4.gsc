#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_75da5547b1822294;
#using scripts\core_common\system_shared.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using script_7dc3a36c222eaf22;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using script_305d57cf0618009d;
#using scripts\core_common\player\player_insertion.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_f9f7b554;

/*
	Name: function_f02e2747
	Namespace: namespace_f9f7b554
	Checksum: 0x587B1754
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f02e2747()
{
	level notify(-1334639945);
}

#namespace namespace_aaddef5a;

/*
	Name: function_98ebe1b4
	Namespace: namespace_aaddef5a
	Checksum: 0xA4F29174
	Offset: 0x178
	Size: 0x244
	Parameters: 0
	Flags: Linked
*/
function function_98ebe1b4()
{
	callback::on_player_killed(&function_7d709aa4);
	level.var_4cf012f7 = [];
	level.var_4cf012f7[level.var_4cf012f7.size] = {#hash_64e61448:0, #rightoffset:100, #forwardoffset:300};
	level.var_4cf012f7[level.var_4cf012f7.size] = {#hash_64e61448:100, #rightoffset:-100, #forwardoffset:300};
	level.var_4cf012f7[level.var_4cf012f7.size] = {#hash_64e61448:200, #rightoffset:300, #forwardoffset:150};
	level.var_4cf012f7[level.var_4cf012f7.size] = {#hash_64e61448:300, #rightoffset:-300, #forwardoffset:150};
	level.var_4cf012f7[level.var_4cf012f7.size] = {#hash_64e61448:400, #rightoffset:500, #forwardoffset:0};
	level.var_4cf012f7[level.var_4cf012f7.size] = {#hash_64e61448:500, #rightoffset:-500, #forwardoffset:0};
	if(!isdefined(level.var_b113cd65))
	{
		level.var_b113cd65 = 1;
	}
	level thread function_1e077098();
}

/*
	Name: function_7d709aa4
	Namespace: namespace_aaddef5a
	Checksum: 0x4DFF8460
	Offset: 0x3C8
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_7d709aa4(params)
{
}

/*
	Name: function_855ba783
	Namespace: namespace_aaddef5a
	Checksum: 0x64918FD1
	Offset: 0x3E0
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function function_855ba783()
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self waittill(#"spawned");
	if(self.currentspectatingclient > -1)
	{
		self.var_26074a5b = self.currentspectatingclient;
	}
}

/*
	Name: function_c3144b08
	Namespace: namespace_aaddef5a
	Checksum: 0x7FF97FFD
	Offset: 0x450
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_c3144b08()
{
	self endon(#"disconnect", #"spawned", #"force_spawn");
	level endon(#"game_ended");
	waitresult = undefined;
	waitresult = self waittill(#"waitingtospawn");
	var_fa9f2461 = waitresult.timeuntilspawn + -0.5;
	if(var_fa9f2461 > 0)
	{
		wait(var_fa9f2461);
	}
	self luinotifyevent(#"hash_175f8739ed7a932", 0);
}

/*
	Name: function_403f2d91
	Namespace: namespace_aaddef5a
	Checksum: 0x7235D6EE
	Offset: 0x518
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_403f2d91()
{
	return getgametypesetting(#"hash_564289af24e283db");
}

/*
	Name: function_46fcf917
	Namespace: namespace_aaddef5a
	Checksum: 0xE5737468
	Offset: 0x548
	Size: 0x22A
	Parameters: 1
	Flags: Linked
*/
function function_46fcf917(player)
{
	point_team = player.pers[#"team"];
	influencer_team = player.pers[#"team"];
	vis_team_mask = util::getotherteamsmask(player.pers[#"team"]);
	var_5f9a6e72 = [0:"start_spawn"];
	if(level.var_5e74f048[player.squad].lasttime + 6000 < gettime())
	{
		var_ffdfd3c9 = util::get_start_time();
		level.var_5e74f048[player.squad].var_9eafb38c = getbestspawnpoint(point_team, influencer_team, vis_team_mask, player, 0, var_5f9a6e72);
		util::note_elapsed_time(var_ffdfd3c9, "spawn point");
		level.var_5e74f048[player.squad].lasttime = gettime();
		level.var_5e74f048[player.squad].nextindex = 0;
	}
	var_5a752f59 = level.var_5e74f048[player.squad].var_9eafb38c;
	/#
		assert(isdefined(var_5a752f59));
	#/
	if(!isdefined(var_5a752f59))
	{
		return {#angles:(0, 0, 0), #origin:level.mapcenter};
	}
	return function_e624cfcf(player, var_5a752f59[#"origin"], var_5a752f59[#"angles"]);
}

/*
	Name: function_e624cfcf
	Namespace: namespace_aaddef5a
	Checksum: 0x8C08FCE3
	Offset: 0x780
	Size: 0x20C
	Parameters: 3
	Flags: Linked
*/
function function_e624cfcf(player, origin, angles)
{
	nextindex = level.var_5e74f048[player.squad].nextindex % level.var_4cf012f7.size;
	level.var_5e74f048[player.squad].nextindex = nextindex + 1;
	var_4cf012f7 = level.var_4cf012f7[nextindex];
	playerorigin = origin;
	trace = groundtrace(playerorigin + vectorscale((0, 0, 1), 100), playerorigin - vectorscale((0, 0, 1), 10100), 0, playerorigin, 0, 0);
	if(trace[#"surfacetype"] == #"none" || trace[#"surfacetype"] == #"default")
	{
		playerorigin = (playerorigin[0], playerorigin[1], level.mapcenter[2]);
	}
	else
	{
		playerorigin = trace[#"position"];
	}
	offset_origin = playerorigin + (anglestoforward(angles) * var_4cf012f7.forwardoffset);
	offset_origin = offset_origin + (anglestoright(angles) * var_4cf012f7.rightoffset);
	offset_origin = offset_origin + (anglestoup(angles) * var_4cf012f7.var_64e61448);
	return {#angles:angles, #origin:offset_origin};
}

/*
	Name: function_96d350e9
	Namespace: namespace_aaddef5a
	Checksum: 0x14D7F781
	Offset: 0x998
	Size: 0x304
	Parameters: 1
	Flags: Linked
*/
function function_96d350e9(spawn)
{
	if(!isdefined(level.inprematchperiod) || level.inprematchperiod)
	{
		return;
	}
	origin = spawn.origin;
	angles = spawn.angles;
	if(!isdefined(level.var_5e74f048))
	{
		level.var_5e74f048 = [];
	}
	if(!isdefined(level.var_5e74f048[self.squad]))
	{
		level.var_5e74f048[self.squad] = spawnstruct();
	}
	if(!isdefined(level.var_5e74f048[self.squad].lasttime))
	{
		level.var_5e74f048[self.squad].lasttime = 0;
	}
	if(!isdefined(level.var_5e74f048[self.squad].nextindex))
	{
		level.var_5e74f048[self.squad].nextindex = 0;
	}
	if(is_true(self.var_20250438))
	{
		spawn = function_46fcf917(self);
		origin = spawn.origin;
		angles = spawn.angles;
	}
	else if(level.var_b113cd65)
	{
		var_613ca383 = function_70f1d702();
		if(isdefined(var_613ca383))
		{
			if(!isdefined(var_613ca383.var_86f5f2a9))
			{
				var_613ca383.var_86f5f2a9 = 0;
			}
			if(var_613ca383.var_86f5f2a9 + 3000 < gettime())
			{
				var_613ca383.var_86f5f2a9 = gettime();
				var_613ca383.var_9e066a4d = var_613ca383.origin;
			}
			forward = anglestoforward(level.mapcenter - var_613ca383.var_9e066a4d);
			angles = vectortoangles(forward);
			spawn = function_e624cfcf(self, var_613ca383.var_9e066a4d, angles);
			origin = spawn.origin;
			angles = spawn.angles;
		}
	}
	zoffset = getdvarint(#"hash_1e5142ed6dd5c6a0", randomintrange(10000, 10100));
	origin = origin + (0, 0, zoffset);
	self thread function_2613549d(origin, angles);
	self luinotifyevent(#"hash_516ebb180cde442", 0);
}

/*
	Name: function_70f1d702
	Namespace: namespace_aaddef5a
	Checksum: 0x2193671F
	Offset: 0xCA8
	Size: 0x1CA
	Parameters: 0
	Flags: Linked
*/
function function_70f1d702()
{
	if(isdefined(self.var_26074a5b))
	{
		player = getentbynum(self.var_26074a5b);
		if(isalive(player) && player.team == self.team)
		{
			return player;
		}
	}
	players = function_a1cff525(self.squad);
	validplayers = [];
	time = gettime();
	foreach(player in players)
	{
		if(player == self)
		{
			continue;
		}
		if(player function_9a0edd92() || player isinfreefall())
		{
			continue;
		}
		if(is_true(player.laststand))
		{
			continue;
		}
		if(player player_insertion::function_51350a25())
		{
			continue;
		}
		if(player.lastspawntime < time)
		{
			validplayers[validplayers.size] = player;
		}
	}
	if(validplayers.size > 0)
	{
		return validplayers[randomint(validplayers.size)];
	}
	return undefined;
}

/*
	Name: function_b74c009d
	Namespace: namespace_aaddef5a
	Checksum: 0x826FB161
	Offset: 0xE80
	Size: 0x18C
	Parameters: 2
	Flags: None
*/
function function_b74c009d(groundpoint, angles)
{
	players = function_c65231e2(self.squad);
	if(players.size <= 0)
	{
		return;
	}
	for(squadindex = 0; squadindex < players.size; squadindex++)
	{
		if(self == players[squadindex])
		{
			break;
		}
	}
	slice = 360 / players.size;
	angle = squadindex * slice;
	r = randomintrange(150, 200);
	xoffset = r * cos(angle);
	yoffset = r * sin(angle);
	zoffset = getdvarint(#"hash_1e5142ed6dd5c6a0", randomintrange(10000, 10100));
	origin = groundpoint + (xoffset, yoffset, zoffset);
	self thread function_2613549d(origin, angles);
}

/*
	Name: function_2613549d
	Namespace: namespace_aaddef5a
	Checksum: 0x3D77258B
	Offset: 0x1018
	Size: 0x2CC
	Parameters: 2
	Flags: Linked
*/
function function_2613549d(origin, angles)
{
	level endon(#"game_ended");
	self endon(#"disconnect", #"end_respawn");
	if(isbot(self) && is_true(self.bot.var_6af67fd1))
	{
		return false;
	}
	vehicle = self.reinsertionvehicle;
	self.reinsertionvehicle = undefined;
	launchvelocity = (0, 0, 0);
	self spawn(origin, angles);
	if(isdefined(vehicle))
	{
		vehicle.origin = origin;
		vehicle.angles = angles;
		self ghost();
		self notsolid();
		self dontinterpolate();
		self setclientthirdperson(1);
		self function_648c1f6(vehicle, undefined, 0, 180, 180, 180, 180, 0);
		self setplayerangles(angles);
		wait(0);
		self setclientthirdperson(0);
		self startcameratween(0);
		self show();
		self solid();
		self unlink();
		launchvelocity = anglestoforward(self getplayerangles());
		vehicle deletedelay();
	}
	self setplayerangles((85, angles[1], 0));
	self player_insertion::start_freefall(launchvelocity, 1);
	self function_c147c6c5();
	level thread function_5d5011dc(self);
}

/*
	Name: function_5d5011dc
	Namespace: namespace_aaddef5a
	Checksum: 0x7D3B35B7
	Offset: 0x12F0
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function function_5d5011dc(var_b1cf3b20)
{
	wait(1);
	if(!isdefined(var_b1cf3b20))
	{
		return;
	}
	level.var_a349ea8[var_b1cf3b20 getentitynumber()] = undefined;
	level.var_c1413cbd[level.var_c1413cbd.size] = var_b1cf3b20;
}

/*
	Name: function_1e077098
	Namespace: namespace_aaddef5a
	Checksum: 0x610D098E
	Offset: 0x1350
	Size: 0x4FE
	Parameters: 0
	Flags: Linked
*/
function function_1e077098()
{
	level endon(#"game_ended");
	level.var_c1413cbd = [];
	var_e11beb90 = sqr(500);
	level.var_a349ea8 = [];
	while(true)
	{
		var_dbcced97 = [];
		var_c1413cbd = level.var_c1413cbd;
		level.var_c1413cbd = [];
		var_24c3509f = 0;
		foreach(var_ab9478c7 in var_c1413cbd)
		{
			if(var_24c3509f >= 2)
			{
				var_24c3509f = 0;
				waitframe(1);
			}
			var_24c3509f++;
			if(!isdefined(var_ab9478c7))
			{
				continue;
			}
			if(var_ab9478c7 isonground())
			{
				level.var_a349ea8[var_ab9478c7 getentitynumber()] = undefined;
				continue;
			}
			trace = groundtrace(var_ab9478c7.origin, var_ab9478c7.origin - vectorscale((0, 0, 1), 5000), 0, var_ab9478c7, 0, 0);
			if(trace[#"surfacetype"] == #"none")
			{
				var_dbcced97[var_dbcced97.size] = var_ab9478c7;
				continue;
			}
			if(distancesquared(var_ab9478c7.origin, trace[#"position"]) < var_e11beb90)
			{
				level.var_a349ea8[var_ab9478c7 getentitynumber()] = undefined;
				continue;
			}
			var_7ec01616 = getplayers(undefined, trace[#"position"], 3000);
			var_c3d4dc49 = (isdefined(level.var_a349ea8[var_ab9478c7 getentitynumber()]) ? level.var_a349ea8[var_ab9478c7 getentitynumber()] : []);
			foreach(var_ba607277 in var_7ec01616)
			{
				if(var_ba607277 == var_ab9478c7)
				{
					continue;
				}
				if(!isalive(var_ba607277))
				{
					continue;
				}
				if(isdefined(var_c3d4dc49[var_ba607277 getentitynumber()]))
				{
					continue;
				}
				if(var_ba607277.team != var_ab9478c7.team)
				{
					if(isdefined(var_ba607277.var_7adbb832) && var_ba607277.var_7adbb832 > gettime())
					{
						continue;
					}
					var_ba607277 globallogic_audio::play_taacom_dialog("airSpawnEnemyDropping", undefined, undefined, undefined, undefined, undefined, 1);
					var_ba607277.var_7adbb832 = gettime() + (int(5 * 1000));
				}
				else
				{
					if(isdefined(var_ba607277.var_291cbaa3) && var_ba607277.var_291cbaa3 > gettime())
					{
						continue;
					}
					var_ba607277 globallogic_audio::play_taacom_dialog("airSpawnFriendlyDropping", undefined, undefined, undefined, undefined, undefined, 1);
					var_ba607277.var_291cbaa3 = gettime() + (int(5 * 1000));
				}
				var_c3d4dc49[var_ba607277 getentitynumber()] = 1;
			}
			level.var_a349ea8[var_ab9478c7 getentitynumber()] = var_c3d4dc49;
			var_dbcced97[var_dbcced97.size] = var_ab9478c7;
		}
		level.var_c1413cbd = arraycombine(var_dbcced97, level.var_c1413cbd, 0, 0);
		waitframe(1);
	}
}

/*
	Name: function_c147c6c5
	Namespace: namespace_aaddef5a
	Checksum: 0xE167F98D
	Offset: 0x1858
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_c147c6c5()
{
	if(isdefined(level.var_a1c77c9c))
	{
		[[level.var_a1c77c9c]](self.team, self.curclass);
	}
}

