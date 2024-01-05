#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\struct.csc;

#namespace callbacks;

/*
	Name: function_16855028
	Namespace: callbacks
	Checksum: 0x22812703
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_16855028()
{
	level notify(1291686709);
}

#namespace callback;

/*
	Name: __init__system__
	Namespace: callback
	Checksum: 0x48FAE484
	Offset: 0x110
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
	Checksum: 0x15EEE93F
	Offset: 0x158
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
	Checksum: 0x8B6941BF
	Offset: 0x180
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function set_default_callbacks()
{
	level.callbackplayerspawned = &playerspawned;
	level.callbacklocalclientconnect = &localclientconnect;
	level.callbackplayerlaststand = &playerlaststand;
	level.callbackentityspawned = &entityspawned;
	level.callbackhostmigration = &host_migration;
	level.callbackplayaifootstep = &footsteps::playaifootstep;
	level._custom_weapon_cb_func = &spawned_weapon_type;
	level.var_6b11d5f6 = &function_cbfd8fd6;
}

/*
	Name: localclientconnect
	Namespace: callback
	Checksum: 0xC181A2B7
	Offset: 0x250
	Size: 0x78
	Parameters: 1
	Flags: Linked
*/
function localclientconnect(localclientnum)
{
	/#
		println("" + localclientnum);
	#/
	callback(#"on_localclient_connect", localclientnum);
	if(isdefined(level.charactercustomizationsetup))
	{
		[[level.charactercustomizationsetup]](localclientnum);
	}
}

/*
	Name: playerlaststand
	Namespace: callback
	Checksum: 0xAD1E4CF3
	Offset: 0x2D0
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
	Checksum: 0xCE11655
	Offset: 0x320
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function playerspawned(localclientnum)
{
	self endon(#"death");
	util::function_89a98f85();
	if(isdefined(level._playerspawned_override))
	{
		self thread [[level._playerspawned_override]](localclientnum);
		return;
	}
	/#
		println("");
	#/
	if(self function_21c0fa55())
	{
		callback(#"on_localplayer_spawned", localclientnum);
	}
	callback(#"on_player_spawned", localclientnum);
	level.localplayers = getlocalplayers();
}

/*
	Name: entityspawned
	Namespace: callback
	Checksum: 0xA31CFE31
	Offset: 0x418
	Size: 0x34C
	Parameters: 1
	Flags: Linked
*/
function entityspawned(localclientnum)
{
	self endon(#"death");
	util::function_89a98f85();
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
		switch(self.weapon.name)
		{
			case "sticky_grenade":
			{
				break;
			}
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
			if(self.archetype === #"bat")
			{
				if(isdefined(level._customactorcbfunc))
				{
					self thread [[level._customactorcbfunc]](localclientnum);
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
			else
			{
				if(self.type == "scriptmover")
				{
					if(isdefined(self.weapon))
					{
						if(isdefined(level.var_6b11d5f6))
						{
							self thread [[level.var_6b11d5f6]](localclientnum);
						}
					}
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
	Name: host_migration
	Namespace: callback
	Checksum: 0xDE9E1B7C
	Offset: 0x770
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function host_migration(localclientnum)
{
	level thread prevent_round_switch_animation();
}

/*
	Name: prevent_round_switch_animation
	Namespace: callback
	Checksum: 0x5E40FAE3
	Offset: 0x7A0
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function prevent_round_switch_animation()
{
	wait(3);
}

