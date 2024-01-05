#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace clientfield;

/*
	Name: register
	Namespace: clientfield
	Checksum: 0x644C516C
	Offset: 0xC0
	Size: 0x4C
	Parameters: 5
	Flags: Linked
*/
function register(str_pool_name, str_name, n_version, n_bits, str_type)
{
	registerclientfield(str_pool_name, str_name, n_version, n_bits, str_type);
}

/*
	Name: function_5b7d846d
	Namespace: clientfield
	Checksum: 0x6EE4E5CB
	Offset: 0x118
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_5b7d846d(str_name, n_version, n_bits, str_type)
{
	registerclientfield("worlduimodel", str_name, n_version, n_bits, str_type);
}

/*
	Name: register_clientuimodel
	Namespace: clientfield
	Checksum: 0xACFD2D9B
	Offset: 0x168
	Size: 0x4C
	Parameters: 5
	Flags: Linked
*/
function register_clientuimodel(str_name, n_version, n_bits, str_type, var_59f69872)
{
	registerclientfield("clientuimodel", str_name, n_version, n_bits, str_type, var_59f69872);
}

/*
	Name: register_luielem
	Namespace: clientfield
	Checksum: 0xF5B494E
	Offset: 0x1C0
	Size: 0x9C
	Parameters: 7
	Flags: Linked
*/
function register_luielem(menu_name, var_483e93f7, field_name, n_version, n_bits, str_type, var_59f69872)
{
	registerclientfield("clientuimodel", (("luielement." + menu_name) + ".") + (isdefined(var_483e93f7) ? "" + var_483e93f7 : "") + field_name, n_version, n_bits, str_type, var_59f69872);
}

/*
	Name: register_bgcache
	Namespace: clientfield
	Checksum: 0x9D12C65D
	Offset: 0x268
	Size: 0x44
	Parameters: 4
	Flags: None
*/
function register_bgcache(poolname, var_b693fec6, uniqueid, version)
{
	function_3ff577e6(poolname, var_b693fec6, uniqueid, version);
}

/*
	Name: function_d89771ec
	Namespace: clientfield
	Checksum: 0x89C48A9
	Offset: 0x2B8
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function function_d89771ec(var_b693fec6, uniqueid, version)
{
	function_3ff577e6("worlduimodel", var_b693fec6, uniqueid, version);
}

/*
	Name: function_91cd7763
	Namespace: clientfield
	Checksum: 0x61EB94E4
	Offset: 0x300
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_91cd7763(var_b693fec6, uniqueid, version, var_59f69872)
{
	function_3ff577e6("clientuimodel", var_b693fec6, uniqueid, version, var_59f69872);
}

/*
	Name: function_b63c5dfe
	Namespace: clientfield
	Checksum: 0xE45204F0
	Offset: 0x350
	Size: 0x94
	Parameters: 6
	Flags: Linked
*/
function function_b63c5dfe(var_b693fec6, menu_name, var_483e93f7, field_name, version, var_59f69872)
{
	function_3ff577e6("clientuimodel", var_b693fec6, (("luielement." + menu_name) + ".") + (isdefined(var_483e93f7) ? "" + var_483e93f7 : "") + field_name, version, var_59f69872);
}

/*
	Name: set
	Namespace: clientfield
	Checksum: 0x296E0D33
	Offset: 0x3F0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function set(str_field_name, n_value)
{
	self thread _set(str_field_name, n_value);
}

/*
	Name: _set
	Namespace: clientfield
	Checksum: 0xD06826C5
	Offset: 0x428
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function _set(str_field_name, n_value)
{
	if(!isdefined(str_field_name))
	{
		/#
			/#
				assertmsg("");
			#/
		#/
		return;
	}
	if(!level flag::get(#"hash_4f4b65226250fc99"))
	{
		var_17b7891d = "1be1d21ba1b21218" + str_field_name;
		self notify(var_17b7891d);
		self endon(var_17b7891d);
		self endon(#"death");
		level flag::wait_till(#"hash_4f4b65226250fc99");
	}
	if(self == level)
	{
		codesetworldclientfield(str_field_name, n_value);
	}
	else
	{
		codesetclientfield(self, str_field_name, n_value);
	}
}

/*
	Name: is_registered
	Namespace: clientfield
	Checksum: 0x97442436
	Offset: 0x540
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function is_registered(field_name)
{
	if(self == level)
	{
		return function_6de43d39(field_name);
	}
	var_24d738a9 = function_cf197fb7(self);
	if(var_24d738a9 == -1)
	{
		return 0;
	}
	return function_bda9951d(var_24d738a9, field_name);
}

/*
	Name: can_set
	Namespace: clientfield
	Checksum: 0x8087A26F
	Offset: 0x5C8
	Size: 0x22
	Parameters: 2
	Flags: Linked
*/
function can_set(str_field_name, n_value)
{
	return function_26b3a620();
}

/*
	Name: set_to_player
	Namespace: clientfield
	Checksum: 0x7502931A
	Offset: 0x5F8
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function set_to_player(str_field_name, n_value)
{
	/#
		/#
			assert(isplayer(self), "");
		#/
	#/
	if(isplayer(self))
	{
		codesetplayerstateclientfield(self, str_field_name, n_value);
	}
}

/*
	Name: function_ec6130f9
	Namespace: clientfield
	Checksum: 0xA65EB6D9
	Offset: 0x688
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_ec6130f9(str_field_name)
{
	return function_3424020a(str_field_name);
}

/*
	Name: set_player_uimodel
	Namespace: clientfield
	Checksum: 0xBADC4B3A
	Offset: 0x6B8
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function set_player_uimodel(str_field_name, n_value)
{
	codesetuimodelclientfield(self, str_field_name, n_value);
}

/*
	Name: function_40aa8832
	Namespace: clientfield
	Checksum: 0x7C80B6D0
	Offset: 0x6F0
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_40aa8832(str_field_name)
{
	return function_fcaed52(str_field_name);
}

/*
	Name: function_9bf78ef8
	Namespace: clientfield
	Checksum: 0xBDF7B3EA
	Offset: 0x720
	Size: 0x74
	Parameters: 4
	Flags: Linked
*/
function function_9bf78ef8(menu_name, var_483e93f7, str_field_name, n_value)
{
	codesetuimodelclientfield(self, (("luielement." + menu_name) + ".") + (isdefined(var_483e93f7) ? "" + var_483e93f7 : "") + str_field_name, n_value);
}

/*
	Name: function_bb878fc3
	Namespace: clientfield
	Checksum: 0x63F88A06
	Offset: 0x7A0
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function function_bb878fc3(menu_name, var_483e93f7, str_field_name)
{
	codeincrementuimodelclientfield(self, (("luielement." + menu_name) + ".") + (isdefined(var_483e93f7) ? "" + var_483e93f7 : "") + str_field_name);
}

/*
	Name: get_player_uimodel
	Namespace: clientfield
	Checksum: 0x8994691F
	Offset: 0x818
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_player_uimodel(str_field_name)
{
	return codegetuimodelclientfield(self, str_field_name);
}

/*
	Name: function_f7ae6994
	Namespace: clientfield
	Checksum: 0xB38784C9
	Offset: 0x848
	Size: 0x6A
	Parameters: 3
	Flags: None
*/
function function_f7ae6994(menu_name, var_483e93f7, str_field_name)
{
	return codegetuimodelclientfield(self, (("luielement." + menu_name) + ".") + (isdefined(var_483e93f7) ? "" + var_483e93f7 : "") + str_field_name);
}

/*
	Name: set_world_uimodel
	Namespace: clientfield
	Checksum: 0x381D0130
	Offset: 0x8C0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function set_world_uimodel(str_field_name, n_value)
{
	codesetworlduimodelfield(str_field_name, n_value);
}

/*
	Name: function_1bea0e72
	Namespace: clientfield
	Checksum: 0xFB35B62
	Offset: 0x8F8
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_1bea0e72(str_field_name)
{
	return function_a02eca40(str_field_name);
}

/*
	Name: get_world_uimodel
	Namespace: clientfield
	Checksum: 0x9C76ABA3
	Offset: 0x928
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_world_uimodel(str_field_name)
{
	return codegetworlduimodelfield(str_field_name);
}

/*
	Name: increment_world_uimodel
	Namespace: clientfield
	Checksum: 0x6711CAA4
	Offset: 0x958
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function increment_world_uimodel(str_field_name)
{
	return codeincrementworlduimodelfield(str_field_name);
}

/*
	Name: increment
	Namespace: clientfield
	Checksum: 0xEDE31220
	Offset: 0x988
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function increment(str_field_name, n_increment_count)
{
	self thread _increment(str_field_name, n_increment_count);
}

/*
	Name: _increment
	Namespace: clientfield
	Checksum: 0x92B4F773
	Offset: 0x9C0
	Size: 0x144
	Parameters: 2
	Flags: Linked, Private
*/
function private _increment(str_field_name, n_increment_count)
{
	if(!isdefined(n_increment_count))
	{
		n_increment_count = 1;
	}
	if(self != level)
	{
		self endon(#"death", #"disconnect");
		waittillframeend();
	}
	for(i = 0; i < n_increment_count; i++)
	{
		if(self == level)
		{
			codeincrementworldclientfield(str_field_name);
			continue;
		}
		/#
			assert(isdefined(level.var_58bc5d04));
		#/
		if(isdefined(self.birthtime) && self.birthtime >= level.var_58bc5d04)
		{
			util::wait_network_frame();
		}
		if(self.birthtime === gettime())
		{
			util::wait_network_frame();
		}
		if(isdefined(self))
		{
			if(self.birthtime === gettime())
			{
				continue;
			}
			codeincrementclientfield(self, str_field_name);
		}
	}
}

/*
	Name: increment_uimodel
	Namespace: clientfield
	Checksum: 0x36F57988
	Offset: 0xB10
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function increment_uimodel(str_field_name, n_increment_count)
{
	if(!isdefined(n_increment_count))
	{
		n_increment_count = 1;
	}
	if(self == level)
	{
		foreach(player in level.players)
		{
			for(i = 0; i < n_increment_count; i++)
			{
				codeincrementuimodelclientfield(player, str_field_name);
			}
		}
	}
	else
	{
		for(i = 0; i < n_increment_count; i++)
		{
			codeincrementuimodelclientfield(self, str_field_name);
		}
	}
}

/*
	Name: increment_to_player
	Namespace: clientfield
	Checksum: 0x53C41FF0
	Offset: 0xC28
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function increment_to_player(str_field_name, n_increment_count)
{
	if(!isdefined(n_increment_count))
	{
		n_increment_count = 1;
	}
	for(i = 0; i < n_increment_count; i++)
	{
		codeincrementplayerstateclientfield(self, str_field_name);
	}
}

/*
	Name: get
	Namespace: clientfield
	Checksum: 0xBB281FB3
	Offset: 0xC90
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function get(str_field_name)
{
	if(self == level)
	{
		return codegetworldclientfield(str_field_name);
	}
	return codegetclientfield(self, str_field_name);
}

/*
	Name: get_to_player
	Namespace: clientfield
	Checksum: 0x57DE9DB
	Offset: 0xCE0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_to_player(field_name)
{
	return codegetplayerstateclientfield(self, field_name);
}

