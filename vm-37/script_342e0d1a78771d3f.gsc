#using scripts\core_common\lui_shared.gsc;

class cremote_missile_target_lockon : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cremote_missile_target_lockon
		Checksum: 0x6BF102F0
		Offset: 0x278
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
		Checksum: 0x3EE994A2
		Offset: 0x4F0
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
		Checksum: 0x17A73751
		Offset: 0x2C0
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
		Checksum: 0xD72391F5
		Offset: 0x390
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
		Checksum: 0xA11ACECD
		Offset: 0x338
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
		Checksum: 0x5F05BF2
		Offset: 0x3E8
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
		Checksum: 0x1D97147
		Offset: 0x308
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
		Checksum: 0xB1F5B8BD
		Offset: 0x498
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
		Checksum: 0x1F2AA3D6
		Offset: 0x298
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
		Checksum: 0xEE777903
		Offset: 0x440
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
	Name: register
	Namespace: remote_missile_target_lockon
	Checksum: 0xE687D4D
	Offset: 0xB8
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
	Checksum: 0x52224920
	Offset: 0xF8
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
	Checksum: 0x753C763F
	Offset: 0x138
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
	Checksum: 0xEFF97288
	Offset: 0x160
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
	Checksum: 0x36F6BD51
	Offset: 0x188
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
	Checksum: 0x6450FD06
	Offset: 0x1B8
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
	Checksum: 0xAF34ADBB
	Offset: 0x1E8
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
	Checksum: 0x3DF6040D
	Offset: 0x218
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
	Checksum: 0xBBA4B9A1
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_isvehicle(player, value)
{
	[[ self ]]->set_isvehicle(player, value);
}

