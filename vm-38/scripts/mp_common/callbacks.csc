#using script_1b80a90bb1ce332e;
#using script_7c21aca7f8a3572a;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\mp_common\callbacks.csc;
#using scripts\mp_common\vehicle.csc;

#namespace callbacks;

/*
	Name: function_f375697
	Namespace: callbacks
	Checksum: 0x392C6778
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f375697()
{
	level notify(1776923280);
}

#namespace callback;

/*
	Name: function_89f2df9
	Namespace: callback
	Checksum: 0xD291A86C
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"callback", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: callback
	Checksum: 0x74E19437
	Offset: 0x1A0
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level thread set_default_callbacks();
}

/*
	Name: set_default_callbacks
	Namespace: callback
	Checksum: 0xA760ACCB
	Offset: 0x1C8
	Size: 0x124
	Parameters: 0
	Flags: Linked
*/
function set_default_callbacks()
{
	level.callbackplayerspawned = &playerspawned;
	level.callbackplayerlaststand = &playerlaststand;
	level.var_beec2b1 = &function_27cbba18;
	level.callbacklocalclientconnect = &localclientconnect;
	level.callbackcreatingcorpse = &creating_corpse;
	level.callbackentityspawned = &entityspawned;
	level.var_69b47c50 = &entervehicle;
	level.var_db2ec524 = &exitvehicle;
	level.callbackairsupport = &airsupport;
	level.callbackplayaifootstep = &footsteps::playaifootstep;
	level._custom_weapon_cb_func = &spawned_weapon_type;
	level.var_6b11d5f6 = &function_cbfd8fd6;
}

/*
	Name: localclientconnect
	Namespace: callback
	Checksum: 0xCB80F4CC
	Offset: 0x2F8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function localclientconnect(localclientnum)
{
	/#
		println("" + localclientnum);
	#/
	if(isdefined(level.charactercustomizationsetup))
	{
		[[level.charactercustomizationsetup]](localclientnum);
	}
	callback(#"on_localclient_connect", localclientnum);
}

/*
	Name: function_27cbba18
	Namespace: callback
	Checksum: 0x718CD1B5
	Offset: 0x380
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_27cbba18(localclientnum)
{
	self callback(#"hash_781399e15b138a4e", localclientnum);
}

/*
	Name: playerlaststand
	Namespace: callback
	Checksum: 0xF5ED8813
	Offset: 0x3B8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function playerlaststand(localclientnum)
{
	self endon(#"death");
	callback(#"on_player_laststand", localclientnum);
}

/*
	Name: playerspawned
	Namespace: callback
	Checksum: 0x903376F7
	Offset: 0x408
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function playerspawned(localclientnum)
{
	self endon(#"death");
	self notify(#"playerspawned_callback");
	self endon(#"playerspawned_callback");
	if(isdefined(level.infraredvisionset))
	{
		function_8608b950(localclientnum, level.infraredvisionset);
	}
	if(isdefined(level._playerspawned_override))
	{
		self thread [[level._playerspawned_override]](localclientnum);
		return;
	}
	if(self function_21c0fa55())
	{
		level notify(#"localplayer_spawned");
		callback(#"on_localplayer_spawned", localclientnum);
	}
	callback(#"on_player_spawned", localclientnum);
}

/*
	Name: entityspawned
	Namespace: callback
	Checksum: 0x56222FE7
	Offset: 0x518
	Size: 0x32C
	Parameters: 1
	Flags: Linked
*/
function entityspawned(localclientnum)
{
	self endon(#"death");
	if(isplayer(self))
	{
		if(isdefined(level._clientfaceanimonplayerspawned))
		{
			self thread [[level._clientfaceanimonplayerspawned]](localclientnum);
		}
	}
	if(isdefined(level._entityspawned_override))
	{
		self thread [[level._entityspawned_override]](localclientnum);
		return;
	}
	if(!isdefined(self.type))
	{
		/#
			println("");
		#/
		return;
	}
	if(self.type == "missile")
	{
		if(isdefined(level._custom_weapon_cb_func))
		{
			self thread [[level._custom_weapon_cb_func]](localclientnum);
		}
	}
	else
	{
		if(self.type == "vehicle" || self.type == "helicopter" || self.type == "plane")
		{
			if(isdefined(level._customvehiclecbfunc))
			{
				self thread [[level._customvehiclecbfunc]](localclientnum);
			}
			self thread vehicle::field_toggle_exhaustfx_handler(localclientnum, undefined, 0, 1);
			self thread vehicle::field_toggle_lights_handler(localclientnum, undefined, 0, 1);
			if(self.type == "plane" || self.type == "helicopter")
			{
				self thread vehicle::aircraft_dustkick();
			}
		}
		else
		{
			if(self.type == "scriptmover")
			{
				if(isdefined(level.var_83485e06))
				{
					self thread [[level.var_83485e06]](localclientnum);
				}
				if(isdefined(self.weapon))
				{
					if(isdefined(level.var_6b11d5f6))
					{
						self thread [[level.var_6b11d5f6]](localclientnum);
					}
				}
			}
			else
			{
				if(self.type == "script_model")
				{
					if(isdefined(self.weapon))
					{
						if(isdefined(level.var_6b11d5f6))
						{
							self thread [[level.var_6b11d5f6]](localclientnum);
						}
					}
				}
				else
				{
					if(self.type == "actor")
					{
						if(isdefined(level._customactorcbfunc))
						{
							self thread [[level._customactorcbfunc]](localclientnum);
						}
						self callback(#"on_actor_spawned", localclientnum);
					}
					else if(self.type == "NA")
					{
						if(isdefined(self.weapon))
						{
							if(isdefined(level.var_6b11d5f6))
							{
								self thread [[level.var_6b11d5f6]](localclientnum);
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: entervehicle
	Namespace: callback
	Checksum: 0x5773829F
	Offset: 0x850
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function entervehicle(localclientnum, vehicle)
{
	if(isdefined(level.var_e583fd9b))
	{
		self thread [[level.var_e583fd9b]](localclientnum, vehicle);
	}
}

/*
	Name: exitvehicle
	Namespace: callback
	Checksum: 0xAC02B1BE
	Offset: 0x898
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function exitvehicle(localclientnum, vehicle)
{
	if(isdefined(level.var_8e36d09b))
	{
		self thread [[level.var_8e36d09b]](localclientnum, vehicle);
	}
}

/*
	Name: airsupport
	Namespace: callback
	Checksum: 0xE84E048B
	Offset: 0x8E0
	Size: 0x5D6
	Parameters: 12
	Flags: Linked
*/
function airsupport(localclientnum, x, y, z, type, yaw, team, teamfaction, owner, exittype, time, height)
{
	pos = (y, z, type);
	switch(owner)
	{
		case "v":
		{
			owner = #"vietcong";
			break;
		}
		case "nva":
		case "n":
		{
			owner = #"nva";
			break;
		}
		case "j":
		{
			owner = #"japanese";
			break;
		}
		case "m":
		{
			owner = #"marines";
			break;
		}
		case "s":
		{
			owner = #"specops";
			break;
		}
		case "r":
		{
			owner = #"russian";
			break;
		}
		default:
		{
			/#
				println("");
			#/
			/#
				println(("" + owner) + "");
			#/
			owner = #"marines";
			break;
		}
	}
	switch(teamfaction)
	{
		case "x":
		{
			teamfaction = #"axis";
			break;
		}
		case "l":
		{
			teamfaction = #"allies";
			break;
		}
		case "r":
		{
			teamfaction = #"none";
			break;
		}
		default:
		{
			/#
				println(("" + teamfaction) + "");
			#/
			teamfaction = #"allies";
			break;
		}
	}
	data = spawnstruct();
	data.team = teamfaction;
	data.owner = exittype;
	data.bombsite = pos;
	data.yaw = team;
	direction = (0, team, 0);
	data.direction = direction;
	data.flyheight = height;
	if(yaw == "a")
	{
		planehalfdistance = 12000;
		data.planehalfdistance = planehalfdistance;
		data.startpoint = pos + (vectorscale(anglestoforward(direction), -1 * planehalfdistance));
		data.endpoint = pos + vectorscale(anglestoforward(direction), planehalfdistance);
		data.planemodel = "t5_veh_air_b52";
		data.flybysound = "null";
		data.washsound = #"veh_b52_flyby_wash";
		data.apextime = 6145;
		data.exittype = -1;
		data.flyspeed = 2000;
		data.flytime = (planehalfdistance * 2) / data.flyspeed;
		planetype = "airstrike";
	}
	else
	{
		if(yaw == "n")
		{
			planehalfdistance = 24000;
			data.planehalfdistance = planehalfdistance;
			data.startpoint = pos + (vectorscale(anglestoforward(direction), -1 * planehalfdistance));
			data.endpoint = pos + vectorscale(anglestoforward(direction), planehalfdistance);
			data.planemodel = airsupport::getplanemodel(owner);
			data.flybysound = "null";
			data.washsound = #"evt_us_napalm_wash";
			data.apextime = 2362;
			data.exittype = time;
			data.flyspeed = 7000;
			data.flytime = (planehalfdistance * 2) / data.flyspeed;
			planetype = "napalm";
		}
		else
		{
			/#
				println("");
				println("");
				println(yaw);
				println("");
			#/
			return;
		}
	}
}

/*
	Name: creating_corpse
	Namespace: callback
	Checksum: 0xB7890DBC
	Offset: 0xEC0
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function creating_corpse(localclientnum, player)
{
	params = spawnstruct();
	params.player = player;
	if(isdefined(player))
	{
		params.playername = player getplayername();
		params.playernum = player getentitynumber();
	}
	self callback(#"on_player_corpse", localclientnum, params);
}

/*
	Name: callback_emp
	Namespace: callback
	Checksum: 0x67F4FC2B
	Offset: 0xF68
	Size: 0x96
	Parameters: 7
	Flags: Linked
*/
function callback_emp(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.emp = bwastimejump;
	/#
		println("");
	#/
	if(bwastimejump)
	{
		self notify(#"emp");
	}
	else
	{
		self notify(#"not_emp");
	}
}

/*
	Name: callback_proximity
	Namespace: callback
	Checksum: 0x15872ACE
	Offset: 0x1008
	Size: 0x4A
	Parameters: 7
	Flags: Linked
*/
function callback_proximity(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.enemyinproximity = bwastimejump;
}

