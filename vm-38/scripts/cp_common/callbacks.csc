#using script_46259d8dc4abfd9c;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\cp_common\callbacks.csc;

#namespace callbacks;

/*
	Name: function_ec5e196c
	Namespace: callbacks
	Checksum: 0x48A7D7FB
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ec5e196c()
{
	level notify(953193771);
}

#namespace callback;

/*
	Name: function_89f2df9
	Namespace: callback
	Checksum: 0xEBAD4C22
	Offset: 0x110
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
	Checksum: 0xEC9F3FF8
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
	Checksum: 0xA59661E2
	Offset: 0x180
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function set_default_callbacks()
{
	level.callbackplayerspawned = &playerspawned;
	level.callbacklocalclientconnect = &localclientconnect;
	level.callbackcreatingcorpse = &creating_corpse;
	level.callbackentityspawned = &entityspawned;
	level.callbackplayaifootstep = &footsteps::playaifootstep;
	level.var_4564d138 = &function_e551f1ce;
	level.var_6bd86801 = &function_1786cd9e;
	level.var_bad05810 = &function_c3238310;
	level._custom_weapon_cb_func = &spawned_weapon_type;
	level.var_6b11d5f6 = &function_cbfd8fd6;
}

/*
	Name: localclientconnect
	Namespace: callback
	Checksum: 0x2E987E36
	Offset: 0x280
	Size: 0x9C
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
	if(isdefined(level.weaponcustomizationiconsetup))
	{
		[[level.weaponcustomizationiconsetup]](localclientnum);
	}
	callback(#"on_localclient_connect", localclientnum);
}

/*
	Name: playerspawned
	Namespace: callback
	Checksum: 0x30BE1950
	Offset: 0x328
	Size: 0xC4
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x55B41880
	Offset: 0x3F8
	Size: 0x300
	Parameters: 1
	Flags: Linked
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
	Checksum: 0x2C4A5268
	Offset: 0x700
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function creating_corpse(localclientnum, player)
{
}

/*
	Name: callback_stunned
	Namespace: callback
	Checksum: 0x4C6EC832
	Offset: 0x720
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
	Checksum: 0x1BF52673
	Offset: 0x7C0
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
	Checksum: 0xFD6F4B97
	Offset: 0x860
	Size: 0x4A
	Parameters: 7
	Flags: None
*/
function callback_proximity(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.enemyinproximity = bwastimejump;
}

/*
	Name: function_19bd6f4f
	Namespace: callback
	Checksum: 0x4C6C8271
	Offset: 0x8B8
	Size: 0x138
	Parameters: 0
	Flags: Linked
*/
function function_19bd6f4f()
{
	for(localclientnum = 0; localclientnum < level.localplayers.size; localclientnum++)
	{
		foreach(var_883bd19d in level.var_a706401b)
		{
			foreach(var_5aec6a8d in var_883bd19d)
			{
				if([[ var_5aec6a8d.var_34327e5a ]]->is_open(localclientnum))
				{
					[[ var_5aec6a8d.var_34327e5a ]]->close(localclientnum);
				}
			}
		}
	}
}

/*
	Name: function_a578d98
	Namespace: callback
	Checksum: 0x89323061
	Offset: 0x9F8
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_a578d98()
{
	if(!level.var_4fe1773a)
	{
		audio::function_d3790fe();
	}
}

/*
	Name: function_e551f1ce
	Namespace: callback
	Checksum: 0x7F58F4EB
	Offset: 0xA28
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_e551f1ce()
{
	function_19bd6f4f();
}

/*
	Name: function_1786cd9e
	Namespace: callback
	Checksum: 0x30463CDA
	Offset: 0xA48
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_1786cd9e()
{
	function_19bd6f4f();
}

/*
	Name: function_c3238310
	Namespace: callback
	Checksum: 0xED14444D
	Offset: 0xA68
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_c3238310()
{
	function_a578d98();
}

