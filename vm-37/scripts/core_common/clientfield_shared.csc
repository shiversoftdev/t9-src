#namespace clientfield;

/*
	Name: register
	Namespace: clientfield
	Checksum: 0x9882C82
	Offset: 0x98
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
	Checksum: 0x7202BF3B
	Offset: 0x110
	Size: 0x74
	Parameters: 9
	Flags: Linked
*/
function function_5b7d846d(str_name, var_91c404f, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_c750339b("worlduimodel", str_name, var_91c404f, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: function_a8bbc967
	Namespace: clientfield
	Checksum: 0x86C7E078
	Offset: 0x190
	Size: 0x74
	Parameters: 9
	Flags: Linked
*/
function function_a8bbc967(str_name, var_91c404f, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_c750339b("clientuimodel", str_name, var_91c404f, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: function_346f95ba
	Namespace: clientfield
	Checksum: 0x7D66746B
	Offset: 0x210
	Size: 0x7C
	Parameters: 10
	Flags: Linked
*/
function function_346f95ba(str_name, menu_name, var_483e93f7, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_e231bfd4(str_name, menu_name, var_483e93f7, path, n_version, n_bits, str_type, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: function_78175813
	Namespace: clientfield
	Checksum: 0xA92D0B42
	Offset: 0x298
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function function_78175813(poolname, var_b693fec6, uniqueid, version, func_callback, b_host, b_callback_for_zero_when_new)
{
	function_3ff577e6(poolname, var_b693fec6, uniqueid, version, func_callback, b_host, b_callback_for_zero_when_new);
}

/*
	Name: function_d89771ec
	Namespace: clientfield
	Checksum: 0x2EA63661
	Offset: 0x300
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
	Checksum: 0x42D944E1
	Offset: 0x378
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
	Checksum: 0x5082B2A4
	Offset: 0x3F0
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
	Checksum: 0xC761B9AB
	Offset: 0x470
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
	Checksum: 0x634F4C2C
	Offset: 0x4C0
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
	Checksum: 0x9426F0A6
	Offset: 0x4F0
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
	Checksum: 0x989C470F
	Offset: 0x520
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_f7ae6994(var_a832fdfa, str_field_name)
{
	return codegetuimodelclientfield(self, (("luielement." + var_a832fdfa) + ".") + str_field_name);
}

