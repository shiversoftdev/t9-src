#using scripts\mp_common\vehicle.csc;
#using scripts\mp_common\callbacks.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\killstreaks\helicopter_shared.csc;
#using scripts\killstreaks\airsupport.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace callback;

/*
	Name: __init__system__
	Namespace: callback
	Checksum: 0xAAA3A661
	Offset: 0x128
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"callback", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: callback
	Checksum: 0x9A124155
	Offset: 0x170
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
	Checksum: 0xA6E77C73
	Offset: 0x198
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
	Checksum: 0xAEE1E668
	Offset: 0x2C8
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
	Checksum: 0xD1322D9A
	Offset: 0x350
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
	Checksum: 0x26CB32D0
	Offset: 0x388
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
	Checksum: 0x7646CC5
	Offset: 0x3D8
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
	Checksum: 0x48A28F37
	Offset: 0x4E8
	Size: 0x2B4
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

/*
	Name: entervehicle
	Namespace: callback
	Checksum: 0x847837DA
	Offset: 0x7A8
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
	Checksum: 0x2CF6F735
	Offset: 0x7F0
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
	Checksum: 0xABDBB331
	Offset: 0x838
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
	Checksum: 0xBDB99878
	Offset: 0xE18
	Size: 0x84
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
	}
	self callback(#"on_player_corpse", localclientnum, params);
}

/*
	Name: callback_emp
	Namespace: callback
	Checksum: 0xD8A6FA5E
	Offset: 0xEA8
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
	Checksum: 0x97657C28
	Offset: 0xF48
	Size: 0x4A
	Parameters: 7
	Flags: Linked
*/
function callback_proximity(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.enemyinproximity = bwastimejump;
}

