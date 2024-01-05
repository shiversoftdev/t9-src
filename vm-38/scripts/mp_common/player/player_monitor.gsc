#using scripts\mp_common\bb.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;

#namespace player_monitor;

/*
	Name: function_cba66f39
	Namespace: player_monitor
	Checksum: 0x5D9F0A0E
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cba66f39()
{
	level notify(339778291);
}

/*
	Name: __init__system__
	Namespace: player_monitor
	Checksum: 0x4B369126
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_monitor", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_monitor
	Checksum: 0x58A927FA
	Offset: 0x140
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_player_killed(&on_player_killed);
}

/*
	Name: monitor
	Namespace: player_monitor
	Checksum: 0xF1C15431
	Offset: 0x170
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function monitor()
{
	if(sessionmodeismultiplayergame())
	{
		if(!isbot(self) && getdvarint(#"hash_18b3343408da85f5", 0) == 1)
		{
			self thread breadcrumbs();
		}
	}
	else if(sessionmodeiswarzonegame())
	{
		if(!isbot(self) && getdvarint(#"hash_6d5a49354d02940d", 0) == 1)
		{
			self thread breadcrumbs();
		}
	}
	self thread travel_dist();
	if(sessionmodeiswarzonegame())
	{
		self function_654cd97();
		return;
	}
	self thread inactivity();
}

/*
	Name: function_d35f877a
	Namespace: player_monitor
	Checksum: 0xC49D3D7E
	Offset: 0x2C0
	Size: 0x1A2
	Parameters: 4
	Flags: Linked
*/
function function_d35f877a(player, weapon, statname, value)
{
	if(!isdefined(value))
	{
		value = 0;
	}
	if(isdefined(weapon.var_3dc66299))
	{
		if(statname == #"shots")
		{
			weapon.var_3dc66299.shots = weapon.var_3dc66299.shots + value;
		}
		else
		{
			if(statname == #"hits")
			{
				weapon.var_3dc66299.hits = weapon.var_3dc66299.hits + value;
			}
			else
			{
				if(statname == #"kills")
				{
					weapon.var_3dc66299.kills = weapon.var_3dc66299.kills + value;
				}
				else
				{
					if(statname == #"deathsduringuse")
					{
						weapon.var_3dc66299.deathsduringuse = weapon.var_3dc66299.deathsduringuse + value;
					}
					else if(statname == #"headshots")
					{
						weapon.var_3dc66299.headshots = weapon.var_3dc66299.headshots + value;
					}
				}
			}
		}
	}
}

/*
	Name: function_36185795
	Namespace: player_monitor
	Checksum: 0x6EF2C597
	Offset: 0x470
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_36185795(params)
{
	if(isalive(self))
	{
		waittillframeend();
		self function_43e771ee();
	}
}

/*
	Name: function_43e771ee
	Namespace: player_monitor
	Checksum: 0xFB487648
	Offset: 0x4B8
	Size: 0x36A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43e771ee(died)
{
	if(!isdefined(died))
	{
		died = 0;
	}
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"disconnect");
	if(isdefined(self.var_3dc66299.currentweapon))
	{
		timeused = function_f8d53445() - self.var_3dc66299.starttime;
		if(self.var_3dc66299.shots > 0 || timeused >= 2000)
		{
			longesthitdist = 0;
			var_e0ba2ec1 = self match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
			if(isdefined(var_e0ba2ec1))
			{
				longesthitdist = self match_record::get_stat(#"lives", var_e0ba2ec1, "longest_hit_distance");
				self match_record::set_stat(#"lives", var_e0ba2ec1, "longest_hit_distance", 0);
			}
			if(self.var_3dc66299.deathsduringuse > 0)
			{
				died = 1;
			}
			var_27047881 = int(timeused / 1000);
			attachments = bb::function_285f8efd(self.var_3dc66299.currentweapon);
			reticle = hash(self getweaponoptic(self.var_3dc66299.currentweapon));
			var_178db383 = spawnstruct();
			var_178db383.shots = self.var_3dc66299.shots;
			var_178db383.hits = self.var_3dc66299.hits;
			var_178db383.kills = self.var_3dc66299.kills;
			var_178db383.headshots = self.var_3dc66299.headshots;
			var_178db383.died = died;
			var_178db383.time_used_s = var_27047881;
			var_178db383.longest_hit_distance = longesthitdist;
			var_178db383.attachment1 = attachments.attachment0;
			var_178db383.attachment2 = attachments.attachment1;
			var_178db383.attachment3 = attachments.attachment2;
			var_178db383.attachment4 = attachments.attachment3;
			var_178db383.attachment5 = attachments.attachment4;
			var_178db383.attachment6 = attachments.attachment5;
			var_178db383.attachment7 = attachments.attachment6;
			var_178db383.reticle = reticle;
			var_178db383.weapon = self.var_3dc66299.currentweapon.name;
			function_92d1707f(#"hash_618e6178a21f0b3d", var_178db383);
			self.var_3dc66299.currentweapon = undefined;
		}
	}
}

/*
	Name: function_91abdff4
	Namespace: player_monitor
	Checksum: 0xFE12FABA
	Offset: 0x830
	Size: 0x102
	Parameters: 1
	Flags: Event
*/
event function_91abdff4(eventstruct)
{
	if(!sessionmodeiswarzonegame())
	{
		return;
	}
	if(game.state == #"playing")
	{
		if(isdefined(eventstruct.weapon))
		{
			self function_43e771ee();
			if(!isdefined(self.var_3dc66299))
			{
				self.var_3dc66299 = {};
			}
			self.var_3dc66299.currentweapon = eventstruct.weapon;
			self.var_3dc66299.starttime = function_f8d53445();
			self.var_3dc66299.shots = 0;
			self.var_3dc66299.hits = 0;
			self.var_3dc66299.kills = 0;
			self.var_3dc66299.deathsduringuse = 0;
			self.var_3dc66299.headshots = 0;
		}
	}
}

/*
	Name: on_player_killed
	Namespace: player_monitor
	Checksum: 0x8D750A31
	Offset: 0x940
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(params)
{
	self function_43e771ee(1);
	if(isdefined(self.lastswimmingstarttime) && self isplayerswimming())
	{
		self function_9fabf258();
	}
	if(isdefined(self.lastwallrunstarttime) && self isplayerwallrunning())
	{
		self function_83433c76();
	}
}

/*
	Name: function_654cd97
	Namespace: player_monitor
	Checksum: 0xD36785C2
	Offset: 0x9E0
	Size: 0x82
	Parameters: 0
	Flags: Linked, Private
*/
function private function_654cd97()
{
	self.var_3dc66299 = {};
	self.var_3dc66299.starttime = -1;
	self.var_3dc66299.shots = 0;
	self.var_3dc66299.hits = 0;
	self.var_3dc66299.kills = 0;
	self.var_3dc66299.deathsduringuse = 0;
	self.var_3dc66299.headshots = 0;
	self.var_3dc66299.currentweapon = undefined;
}

/*
	Name: breadcrumbs
	Namespace: player_monitor
	Checksum: 0x3D187C08
	Offset: 0xA70
	Size: 0x19E
	Parameters: 0
	Flags: Linked, Private
*/
function private breadcrumbs()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	waittime = 10;
	if(sessionmodeismultiplayergame())
	{
		while(level.inprematchperiod)
		{
			waitframe(1);
		}
		waittime = getdvarfloat(#"hash_78606296733432c4", 2);
	}
	else if(sessionmodeiswarzonegame())
	{
		level waittill(#"game_playing");
		waittime = getdvarfloat(#"hash_2872d2b12241500c", 4);
	}
	while(true)
	{
		if(isalive(self))
		{
			lifeindex = (isdefined(self.pers[#"telemetry"].life.life_index) ? self.pers[#"telemetry"].life.life_index : -1);
			recordbreadcrumbdataforplayer(self, lifeindex);
		}
		wait(waittime);
	}
}

/*
	Name: travel_dist
	Namespace: player_monitor
	Checksum: 0x2A8C220C
	Offset: 0xC18
	Size: 0x532
	Parameters: 0
	Flags: Linked, Private
*/
function private travel_dist()
{
	self notify("215bd2e13aec9293");
	self endon("215bd2e13aec9293");
	self.time_played_moving = self.pers[#"time_played_moving"];
	if(!isdefined(self.pers[#"movement_update_count"]))
	{
		self.pers[#"movement_update_count"] = 0;
	}
	prevpos = self.origin;
	positionptm = self.origin;
	var_aab0a48f = 0;
	var_601d5ffc = 0;
	var_ec704eef = 0;
	var_365f7ec5 = 0;
	var_7e8e90a4 = 0;
	var_87a9b1b1 = 0;
	while(true)
	{
		if(!isdefined(self))
		{
			return;
		}
		is_alive = isalive(self);
		if(is_alive)
		{
			dist = distance(self.origin, prevpos);
			var_365f7ec5 = var_365f7ec5 + dist;
			if(dist > 0 && game.state == #"playing")
			{
				if(!self isinvehicle())
				{
					groundent = self getgroundent();
					if(isdefined(groundent) && !isvehicle(groundent))
					{
						var_7e8e90a4 = var_7e8e90a4 + dist;
						if(is_true(self.outsidedeathcircle))
						{
							var_87a9b1b1 = var_87a9b1b1 + dist;
						}
					}
				}
			}
			var_601d5ffc++;
			prevpos = self.origin;
			if(dist >= 1.6)
			{
				var_aab0a48f = var_aab0a48f + 1;
			}
		}
		if((var_601d5ffc % 5) == 0 || !is_alive || isdefined(self.usingremote))
		{
			if(var_aab0a48f > 0)
			{
				distancemoved = distance(self.origin, positionptm);
				if(distancemoved > 16)
				{
					var_ec704eef = var_ec704eef + distancemoved;
					self.time_played_moving = self.time_played_moving + var_aab0a48f;
				}
			}
			positionptm = self.origin;
			var_aab0a48f = 0;
		}
		if(is_alive && isdefined(self.usingremote))
		{
			self waittill(#"stopped_using_remote", #"death", #"disconnect");
			if(isdefined(self))
			{
				prevpos = self.origin;
				positionptm = self.origin;
				is_alive = isalive(self);
			}
		}
		if(isdefined(self) && (!is_alive || level.gameended === 1 || self.player_disconnected === 1))
		{
			self stats::function_d40764f3(#"distance_traveled_foot", int(var_7e8e90a4));
			self stats::function_d40764f3(#"hash_630fffa7f053a2b7", int(var_87a9b1b1));
			self match_record::function_34800eec(#"hash_630fffa7f053a2b7", int(var_87a9b1b1));
			self.pers[#"total_distance_travelled"] = self.pers[#"total_distance_travelled"] + var_365f7ec5;
			self.pers[#"movement_update_count"] = self.pers[#"movement_update_count"] + var_601d5ffc;
			self.pers[#"hash_20464b40eeb9b465"] = self.pers[#"hash_20464b40eeb9b465"] + var_ec704eef;
			self.pers[#"time_played_moving"] = self.time_played_moving;
			return;
		}
		self waittilltimeout(1, #"death", #"disconnect");
	}
}

/*
	Name: function_f69038ac
	Namespace: player_monitor
	Checksum: 0xDF62DF45
	Offset: 0x1158
	Size: 0x16
	Parameters: 1
	Flags: Event
*/
event function_f69038ac(eventstruct)
{
	self.lastwallrunstarttime = gettime();
}

/*
	Name: function_830b9d71
	Namespace: player_monitor
	Checksum: 0x6659C30A
	Offset: 0x1178
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event function_830b9d71(eventstruct)
{
	self function_83433c76();
}

/*
	Name: function_83433c76
	Namespace: player_monitor
	Checksum: 0x14A241B6
	Offset: 0x11A8
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function function_83433c76()
{
	if(!isdefined(self.timespentwallrunninginlife))
	{
		self.timespentwallrunninginlife = 0;
	}
	self.timespentwallrunninginlife = self.timespentwallrunninginlife + (gettime() - self.lastwallrunstarttime);
}

/*
	Name: function_d18b7e6e
	Namespace: player_monitor
	Checksum: 0xF2BF9C9E
	Offset: 0x11E8
	Size: 0x16
	Parameters: 1
	Flags: Event
*/
event function_d18b7e6e(eventstruct)
{
	self.lastswimmingstarttime = gettime();
}

/*
	Name: function_b3154405
	Namespace: player_monitor
	Checksum: 0xCFA0B9F7
	Offset: 0x1208
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event function_b3154405(eventstruct)
{
	self function_9fabf258();
}

/*
	Name: function_9fabf258
	Namespace: player_monitor
	Checksum: 0xC843CEE4
	Offset: 0x1238
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function function_9fabf258()
{
	if(!isdefined(self.timespentswimminginlife))
	{
		self.timespentswimminginlife = 0;
	}
	self.timespentswimminginlife = self.timespentswimminginlife + (gettime() - self.lastswimmingstarttime);
}

/*
	Name: function_86596790
	Namespace: player_monitor
	Checksum: 0x2B76ED3E
	Offset: 0x1278
	Size: 0x38
	Parameters: 1
	Flags: Event
*/
event function_86596790(eventstruct)
{
	self.lastslidestarttime = gettime();
	if(!isdefined(self.numberofslidesinlife))
	{
		self.numberofslidesinlife = 0;
	}
	self.numberofslidesinlife++;
}

/*
	Name: function_2d820dd0
	Namespace: player_monitor
	Checksum: 0xDC279798
	Offset: 0x12B8
	Size: 0x38
	Parameters: 1
	Flags: Event
*/
event function_2d820dd0(eventstruct)
{
	self.lastdoublejumpstarttime = gettime();
	if(!isdefined(self.numberofdoublejumpsinlife))
	{
		self.numberofdoublejumpsinlife = 0;
	}
	self.numberofdoublejumpsinlife++;
}

/*
	Name: inactivity
	Namespace: player_monitor
	Checksum: 0xAC09D277
	Offset: 0x12F8
	Size: 0xE6
	Parameters: 0
	Flags: Linked, Private
*/
function private inactivity()
{
	self endon(#"disconnect");
	self notify(#"player_monitor_inactivity");
	self endon(#"player_monitor_inactivity");
	wait(10);
	while(true)
	{
		if(isdefined(self))
		{
			if(self isremotecontrolling() || self util::isusingremote() || is_true(level.inprematchperiod) || is_true(self.var_4c45f505))
			{
				self resetinactivitytimer();
			}
		}
		wait(5);
	}
}

