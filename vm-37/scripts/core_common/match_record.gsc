#using scripts\core_common\array_shared.gsc;

#namespace match_record;

/*
	Name: function_d92cb558
	Namespace: match_record
	Checksum: 0x7C78897E
	Offset: 0x68
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
	Checksum: 0x6A92C92B
	Offset: 0xA8
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
	Checksum: 0x12024F01
	Offset: 0x130
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
	Checksum: 0x560006ED
	Offset: 0x1F8
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
	Checksum: 0x9E47538B
	Offset: 0x350
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
	Checksum: 0xD08F53A8
	Offset: 0x418
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
	Checksum: 0x7DDA31D8
	Offset: 0x490
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
	Checksum: 0x6F4E5847
	Offset: 0x528
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
	Checksum: 0x63EAB62E
	Offset: 0x600
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
	Checksum: 0x72F62194
	Offset: 0x7A8
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

