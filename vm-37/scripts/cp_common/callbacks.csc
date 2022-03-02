#using script_46259d8dc4abfd9c;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\cp_common\callbacks.csc;

#namespace callback;

/*
	Name: function_89f2df9
	Namespace: callback
	Checksum: 0x43C39159
	Offset: 0xE8
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
	Checksum: 0x3258CC52
	Offset: 0x130
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level thread set_default_callbacks();
}

/*
	Name: set_default_callbacks
	Namespace: callback
	Checksum: 0x5E4C9789
	Offset: 0x158
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function set_default_callbacks()
{
	level.callbackplayerspawned = &playerspawned;
	level.callbacklocalclientconnect = &localclientconnect;
	level.callbackcreatingcorpse = &creating_corpse;
	level.callbackentityspawned = &entityspawned;
	level.callbackplayaifootstep = &footsteps::playaifootstep;
	level._custom_weapon_cb_func = &spawned_weapon_type;
	level.var_6b11d5f6 = &function_cbfd8fd6;
}

/*
	Name: localclientconnect
	Namespace: callback
	Checksum: 0xE3AE0F71
	Offset: 0x210
	Size: 0x9C
	Parameters: 1
	Flags: None
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
	if(isdefined(level.weaponcustomizationiconsetup))
	{
		[[level.weaponcustomizationiconsetup]](localclientnum);
	}
	callback(#"on_localclient_connect", localclientnum);
}

/*
	Name: playerspawned
	Namespace: callback
	Checksum: 0x836FFCD0
	Offset: 0x2B8
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function playerspawned(localclientnum)
{
	self endon(#"death");
	util::function_89a98f85();
	if(isdefined(level.infraredvisionset))
	{
		function_8608b950(localclientnum, level.infraredvisionset);
	}
	if(self function_21c0fa55())
	{
		callback(#"on_localplayer_spawned", localclientnum);
	}
	callback(#"on_player_spawned", localclientnum);
}

/*
	Name: entityspawned
	Namespace: callback
	Checksum: 0x2BDC9381
	Offset: 0x388
	Size: 0x300
	Parameters: 1
	Flags: None
*/
function entityspawned(localclientnum)
{
	self endon(#"death");
	util::function_89a98f85();
	if(!isdefined(self.type))
	{
		/#
			println("");
		#/
		return;
	}
	if(isplayer(self))
	{
		if(isdefined(level._clientfaceanimonplayerspawned))
		{
			self thread [[level._clientfaceanimonplayerspawned]](localclientnum);
		}
	}
	if(self.type == "missile")
	{
		if(isdefined(level._custom_weapon_cb_func))
		{
			self thread [[level._custom_weapon_cb_func]](localclientnum);
		}
		switch(self.weapon.name)
		{
			case "explosive_bolt":
			{
				self thread explosive_bolt::spawned(localclientnum);
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
			if(self.vehicleclass == "plane" || self.vehicleclass == "helicopter")
			{
				self thread vehicle::aircraft_dustkick();
			}
		}
		else
		{
			if(self.type == "actor")
			{
				self enableonradar();
				if(isdefined(level._customactorcbfunc))
				{
					self thread [[level._customactorcbfunc]](localclientnum);
				}
				self callback(#"on_actor_spawned", localclientnum);
			}
			else
			{
				if(self.type == "NA")
				{
					if(isdefined(self.weapon))
					{
						if(isdefined(level.var_6b11d5f6))
						{
							self thread [[level.var_6b11d5f6]](localclientnum);
						}
					}
				}
				else if(self function_8d8e91af())
				{
					if(isdefined(level.var_9d3b5cf9))
					{
						self thread [[level.var_9d3b5cf9]](localclientnum);
					}
				}
			}
		}
	}
}

/*
	Name: creating_corpse
	Namespace: callback
	Checksum: 0xD4BF7855
	Offset: 0x690
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function creating_corpse(localclientnum, player)
{
}

/*
	Name: callback_stunned
	Namespace: callback
	Checksum: 0xBF2E0C79
	Offset: 0x6B0
	Size: 0x96
	Parameters: 7
	Flags: None
*/
function callback_stunned(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.stunned = bwastimejump;
	/#
		println("");
	#/
	if(bwastimejump)
	{
		self notify(#"stunned");
	}
	else
	{
		self notify(#"not_stunned");
	}
}

/*
	Name: callback_emp
	Namespace: callback
	Checksum: 0x6BCF1526
	Offset: 0x750
	Size: 0x96
	Parameters: 7
	Flags: None
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
	Checksum: 0x3743C2E3
	Offset: 0x7F0
	Size: 0x4A
	Parameters: 7
	Flags: None
*/
function callback_proximity(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.enemyinproximity = bwastimejump;
}

