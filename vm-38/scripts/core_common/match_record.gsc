#using scripts\core_common\array_shared.gsc;

#namespace match_record;

/*
	Name: function_168ed6ed
	Namespace: match_record
	Checksum: 0xB483211B
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_168ed6ed()
{
	level notify(80933673);
}

/*
	Name: function_d92cb558
	Namespace: match_record
	Checksum: 0x23638ECE
	Offset: 0x88
	Size: 0x36
	Parameters: 2
	Flags: None
*/
function function_d92cb558(result, vararg)
{
	/#
		var_2f3fa528 = "";
		return var_2f3fa528;
	#/
}

/*
	Name: get_stat
	Namespace: match_record
	Checksum: 0x63E5FA82
	Offset: 0xC8
	Size: 0x80
	Parameters: 1
	Flags: Linked, Variadic
*/
function get_stat(...)
{
	/#
		assert(vararg.size > 0);
	#/
	if(vararg.size == 0)
	{
		return undefined;
	}
	result = function_644a3b03(vararg);
	/#
		function_d92cb558(result, vararg);
	#/
	return result;
}

/*
	Name: set_stat
	Namespace: match_record
	Checksum: 0x72DAFFA2
	Offset: 0x150
	Size: 0xC0
	Parameters: 1
	Flags: Linked, Variadic
*/
function set_stat(...)
{
	/#
		assert(vararg.size > 1);
	#/
	if(vararg.size <= 1)
	{
		return;
	}
	value = vararg[vararg.size - 1];
	arrayremoveindex(vararg, vararg.size - 1);
	result = function_484b4b09(vararg, value);
	/#
		function_d92cb558(result, vararg);
	#/
	return result;
}

/*
	Name: function_7a93acec
	Namespace: match_record
	Checksum: 0xCF10E241
	Offset: 0x218
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_7a93acec(...)
{
	vec = vararg[vararg.size - 1];
	arrayremoveindex(vararg, vararg.size - 1);
	var_22f1ed01 = set_stat(vararg, 0, int(vec[0]));
	var_531b181 = set_stat(vararg, 1, int(vec[1]));
	var_bea5a46a = set_stat(vararg, 2, int(vec[2]));
	return is_true(var_22f1ed01) && is_true(var_531b181) && is_true(var_bea5a46a);
}

/*
	Name: inc_stat
	Namespace: match_record
	Checksum: 0x108735B6
	Offset: 0x370
	Size: 0xC0
	Parameters: 1
	Flags: Linked, Variadic
*/
function inc_stat(...)
{
	/#
		assert(vararg.size > 1);
	#/
	if(vararg.size <= 1)
	{
		return;
	}
	value = vararg[vararg.size - 1];
	arrayremoveindex(vararg, vararg.size - 1);
	result = function_976e9113(vararg, value);
	/#
		function_d92cb558(result, vararg);
	#/
	return result;
}

/*
	Name: get_player_index
	Namespace: match_record
	Checksum: 0x7DD80681
	Offset: 0x438
	Size: 0x70
	Parameters: 0
	Flags: None
*/
function get_player_index()
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	if(isplayer(player) && isdefined(player.clientid))
	{
		return player.clientid;
	}
}

/*
	Name: get_player_stat
	Namespace: match_record
	Checksum: 0x7E08C167
	Offset: 0x4B0
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Variadic
*/
function get_player_stat(...)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	if(isplayer(player))
	{
		return get_stat(#"players", player.clientid, vararg);
	}
}

/*
	Name: set_player_stat
	Namespace: match_record
	Checksum: 0x2B0C5D2E
	Offset: 0x548
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Variadic
*/
function set_player_stat(...)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	if(isplayer(player))
	{
		value = vararg[vararg.size - 1];
		arrayremoveindex(vararg, vararg.size - 1);
		return set_stat(#"players", player.clientid, vararg, value);
	}
}

/*
	Name: function_ded5f5b6
	Namespace: match_record
	Checksum: 0x6BFC014
	Offset: 0x620
	Size: 0x19E
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_ded5f5b6(...)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	if(isplayer(player))
	{
		vec = vararg[vararg.size - 1];
		arrayremoveindex(vararg, vararg.size - 1);
		var_22f1ed01 = set_player_stat(vararg, 0, int(vec[0]));
		var_531b181 = set_player_stat(vararg, 1, int(vec[1]));
		var_bea5a46a = set_player_stat(vararg, 2, int(vec[2]));
		return is_true(var_22f1ed01) && is_true(var_531b181) && is_true(var_bea5a46a);
	}
}

/*
	Name: function_34800eec
	Namespace: match_record
	Checksum: 0xBE363FE4
	Offset: 0x7C8
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Variadic
*/
function function_34800eec(...)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	if(isplayer(player))
	{
		value = vararg[vararg.size - 1];
		arrayremoveindex(vararg, vararg.size - 1);
		return inc_stat(#"players", player.clientid, vararg, value);
	}
}

