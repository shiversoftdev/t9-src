#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace clientfield_shared;

/*
	Name: function_1c755e29
	Namespace: clientfield_shared
	Checksum: 0x68595B66
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1c755e29()
{
	level notify(1790534910);
}

#namespace clientfield;

/*
	Name: register
	Namespace: clientfield
	Checksum: 0x3511F407
	Offset: 0xE0
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
	Checksum: 0x22A9DDF5
	Offset: 0x138
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
	Checksum: 0x7D8CD162
	Offset: 0x188
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
	Checksum: 0xF8214521
	Offset: 0x1E0
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
	Checksum: 0x4F492A30
	Offset: 0x288
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
	Checksum: 0xCBE11130
	Offset: 0x2D8
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
	Checksum: 0x36793BC1
	Offset: 0x320
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
	Checksum: 0x7FB41075
	Offset: 0x370
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
	Checksum: 0xC5B572DF
	Offset: 0x410
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
	Checksum: 0x38A4C50B
	Offset: 0x448
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
	Checksum: 0xE36477AB
	Offset: 0x560
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
	Checksum: 0xD27064BD
	Offset: 0x5E8
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
	Checksum: 0x74E85E15
	Offset: 0x618
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
	Checksum: 0x7ED87319
	Offset: 0x6A8
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
	Checksum: 0xCBF32486
	Offset: 0x6D8
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
	Checksum: 0x24B2061A
	Offset: 0x710
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
	Checksum: 0x2E728E56
	Offset: 0x740
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
	Checksum: 0x42D0FDFD
	Offset: 0x7C0
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
	Checksum: 0xCF32FD46
	Offset: 0x838
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
	Checksum: 0x972C0198
	Offset: 0x868
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
	Checksum: 0x19BEFD4A
	Offset: 0x8E0
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
	Checksum: 0x1E5C4CED
	Offset: 0x918
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
	Checksum: 0xFD3261FD
	Offset: 0x948
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
	Checksum: 0x4AC3353B
	Offset: 0x978
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
	Checksum: 0xAF9DD922
	Offset: 0x9A8
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
	Checksum: 0xC6B4084B
	Offset: 0x9E0
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
	Checksum: 0xB0EC2A8D
	Offset: 0xB30
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
	Checksum: 0x4418EB87
	Offset: 0xC48
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
	Checksum: 0xF0BEA7A8
	Offset: 0xCB0
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
	Checksum: 0xFB30EAA5
	Offset: 0xD00
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_to_player(field_name)
{
	return codegetplayerstateclientfield(self, field_name);
}

