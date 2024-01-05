#namespace clientfield_shared;

/*
	Name: function_847db55e
	Namespace: clientfield_shared
	Checksum: 0x109CCA8B
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_847db55e()
{
	level notify(-2143593433);
}

#namespace clientfield;

/*
	Name: register
	Namespace: clientfield
	Checksum: 0x179C0780
	Offset: 0xB8
	Size: 0x6C
	Parameters: 8
	Flags: Linked
*/
function register(str_pool_name, str_name, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new)
{
	registerclientfield(str_pool_name, str_name, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: function_5b7d846d
	Namespace: clientfield
	Checksum: 0xCF0586A2
	Offset: 0x130
	Size: 0x74
	Parameters: 9
	Flags: Linked
*/
function function_5b7d846d(str_name, var_91c404f, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_c750339b("worlduimodel", str_name, var_91c404f, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: register_clientuimodel
	Namespace: clientfield
	Checksum: 0xE8A6D2BE
	Offset: 0x1B0
	Size: 0x74
	Parameters: 9
	Flags: Linked
*/
function register_clientuimodel(str_name, var_91c404f, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_c750339b("clientuimodel", str_name, var_91c404f, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: register_luielem
	Namespace: clientfield
	Checksum: 0x71DABE89
	Offset: 0x230
	Size: 0x7C
	Parameters: 10
	Flags: Linked
*/
function register_luielem(str_name, menu_name, var_483e93f7, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_e231bfd4(str_name, menu_name, var_483e93f7, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: register_bgcache
	Namespace: clientfield
	Checksum: 0x18815BB9
	Offset: 0x2B8
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function register_bgcache(poolname, var_b693fec6, uniqueid, version, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_3ff577e6(poolname, var_b693fec6, uniqueid, version, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: function_d89771ec
	Namespace: clientfield
	Checksum: 0xDB2D63A7
	Offset: 0x320
	Size: 0x6C
	Parameters: 8
	Flags: Linked
*/
function function_d89771ec(var_b693fec6, uniqueid, var_91c404f, path, version, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_bac6598a("worlduimodel", var_b693fec6, uniqueid, var_91c404f, path, version, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: function_91cd7763
	Namespace: clientfield
	Checksum: 0xBFD6792
	Offset: 0x398
	Size: 0x6C
	Parameters: 8
	Flags: Linked
*/
function function_91cd7763(var_b693fec6, uniqueid, var_91c404f, path, version, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_bac6598a("clientuimodel", var_b693fec6, uniqueid, var_91c404f, path, version, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: function_b63c5dfe
	Namespace: clientfield
	Checksum: 0xA177EC08
	Offset: 0x410
	Size: 0x74
	Parameters: 9
	Flags: Linked
*/
function function_b63c5dfe(var_b693fec6, uniqueid, menu_name, var_483e93f7, path, version, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_9a992427(var_b693fec6, uniqueid, menu_name, var_483e93f7, path, version, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: get
	Namespace: clientfield
	Checksum: 0x94E6AFC5
	Offset: 0x490
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function get(field_name)
{
	if(self == level)
	{
		return codegetworldclientfield(field_name);
	}
	return codegetclientfield(self, field_name);
}

/*
	Name: get_to_player
	Namespace: clientfield
	Checksum: 0x7F3B61D9
	Offset: 0x4E0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_to_player(field_name)
{
	return codegetplayerstateclientfield(self, field_name);
}

/*
	Name: get_player_uimodel
	Namespace: clientfield
	Checksum: 0x97DBA7FB
	Offset: 0x510
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function get_player_uimodel(field_name)
{
	return codegetuimodelclientfield(self, field_name);
}

/*
	Name: function_f7ae6994
	Namespace: clientfield
	Checksum: 0x60C8D070
	Offset: 0x540
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_f7ae6994(unique_name, str_field_name)
{
	return codegetuimodelclientfield(self, (("luielement." + unique_name) + ".") + str_field_name);
}

