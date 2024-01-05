#using scripts\core_common\lui_shared.gsc;

class cremote_missile_target_lockon : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cremote_missile_target_lockon
		Checksum: 0x4ED14D0E
		Offset: 0x298
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cremote_missile_target_lockon
		Checksum: 0xF3461FEF
		Offset: 0x510
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cremote_missile_target_lockon
		Checksum: 0x3B7D76BD
		Offset: 0x2E0
		Size: 0x3C
		Parameters: 2
		Flags: Linked
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_target_locked
		Namespace: cremote_missile_target_lockon
		Checksum: 0xC24CA9E
		Offset: 0x3B0
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_target_locked(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 2, value, 0);
	}

	/*
		Name: set_clientnum
		Namespace: cremote_missile_target_lockon
		Checksum: 0xEBA581AE
		Offset: 0x358
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_clientnum(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 1, value, 0);
	}

	/*
		Name: set_ishawktag
		Namespace: cremote_missile_target_lockon
		Checksum: 0x65D80C31
		Offset: 0x408
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_ishawktag(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 3, value, 0);
	}

	/*
		Name: close
		Namespace: cremote_missile_target_lockon
		Checksum: 0xC8276047
		Offset: 0x328
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_isvehicle
		Namespace: cremote_missile_target_lockon
		Checksum: 0x900360B8
		Offset: 0x4B8
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_isvehicle(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 5, value, 0);
	}

	/*
		Name: setup_clientfields
		Namespace: cremote_missile_target_lockon
		Checksum: 0x2C843164
		Offset: 0x2B8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("remote_missile_target_lockon");
	}

	/*
		Name: set_killed
		Namespace: cremote_missile_target_lockon
		Checksum: 0x890E8632
		Offset: 0x460
		Size: 0x4C
		Parameters: 2
		Flags: Linked
	*/
	function set_killed(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 4, value, 0);
	}

}

#namespace remote_missile_target_lockon;

/*
	Name: function_427aa51a
	Namespace: remote_missile_target_lockon
	Checksum: 0x3EEDAA45
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_427aa51a()
{
	level notify(-1141273591);
}

/*
	Name: register
	Namespace: remote_missile_target_lockon
	Checksum: 0x76CD975B
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new cremote_missile_target_lockon();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: remote_missile_target_lockon
	Checksum: 0x3A6790E3
	Offset: 0x118
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: remote_missile_target_lockon
	Checksum: 0x2AD0B106
	Offset: 0x158
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: remote_missile_target_lockon
	Checksum: 0x1E0592EA
	Offset: 0x180
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_clientnum
	Namespace: remote_missile_target_lockon
	Checksum: 0xA07519F
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_clientnum(player, value)
{
	[[ self ]]->set_clientnum(player, value);
}

/*
	Name: set_target_locked
	Namespace: remote_missile_target_lockon
	Checksum: 0x5FC3158B
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_target_locked(player, value)
{
	[[ self ]]->set_target_locked(player, value);
}

/*
	Name: set_ishawktag
	Namespace: remote_missile_target_lockon
	Checksum: 0x811AEAD5
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_ishawktag(player, value)
{
	[[ self ]]->set_ishawktag(player, value);
}

/*
	Name: set_killed
	Namespace: remote_missile_target_lockon
	Checksum: 0xF0DA9298
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_killed(player, value)
{
	[[ self ]]->set_killed(player, value);
}

/*
	Name: set_isvehicle
	Namespace: remote_missile_target_lockon
	Checksum: 0x3E4BA7B1
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_isvehicle(player, value)
{
	[[ self ]]->set_isvehicle(player, value);
}

