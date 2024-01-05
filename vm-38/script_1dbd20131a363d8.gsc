#using scripts\core_common\lui_shared.gsc;

class class_1a456b75 : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_1a456b75
		Checksum: 0x8E032608
		Offset: 0x260
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_1a456b75
		Checksum: 0x9165DC1F
		Offset: 0x4C0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_1a456b75
		Checksum: 0x926BDF2B
		Offset: 0x2A8
		Size: 0x3C
		Parameters: 2
		Flags: None
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
		Name: set_progfraca
		Namespace: namespace_1a456b75
		Checksum: 0x9B1FEB38
		Offset: 0x320
		Size: 0x6C
		Parameters: 2
		Flags: None
	*/
	function set_progfraca(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 1, int(value * (128 - 1)), 0);
	}

	/*
		Name: close
		Namespace: namespace_1a456b75
		Checksum: 0xD2C788AE
		Offset: 0x2F0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_1a456b75
		Checksum: 0x844B89A1
		Offset: 0x280
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("sr_objective_secure_hud");
	}

	/*
		Name: set_progfracb
		Namespace: namespace_1a456b75
		Checksum: 0x2A6A109
		Offset: 0x398
		Size: 0x6C
		Parameters: 2
		Flags: None
	*/
	function set_progfracb(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 2, int(value * (128 - 1)), 0);
	}

	/*
		Name: set_objectivewhitea
		Namespace: namespace_1a456b75
		Checksum: 0xC83E637B
		Offset: 0x410
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function set_objectivewhitea(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 3, value, 0);
	}

	/*
		Name: set_objectivewhiteb
		Namespace: namespace_1a456b75
		Checksum: 0xD0372B18
		Offset: 0x468
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function set_objectivewhiteb(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 4, value, 0);
	}

}

#namespace sr_objective_secure_hud;

/*
	Name: function_45d1349a
	Namespace: sr_objective_secure_hud
	Checksum: 0xA0D8106E
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_45d1349a()
{
	level notify(2085722088);
}

/*
	Name: register
	Namespace: sr_objective_secure_hud
	Checksum: 0x85ED5E28
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_1a456b75();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: sr_objective_secure_hud
	Checksum: 0x584B4B43
	Offset: 0x110
	Size: 0x38
	Parameters: 2
	Flags: None
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
	Namespace: sr_objective_secure_hud
	Checksum: 0x5189623B
	Offset: 0x150
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: sr_objective_secure_hud
	Checksum: 0xC3D6EA8D
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_progfraca
	Namespace: sr_objective_secure_hud
	Checksum: 0xB7D1BD41
	Offset: 0x1A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progfraca(player, value)
{
	[[ self ]]->set_progfraca(player, value);
}

/*
	Name: set_progfracb
	Namespace: sr_objective_secure_hud
	Checksum: 0xAA4788EA
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progfracb(player, value)
{
	[[ self ]]->set_progfracb(player, value);
}

/*
	Name: set_objectivewhitea
	Namespace: sr_objective_secure_hud
	Checksum: 0xF6E20BA7
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objectivewhitea(player, value)
{
	[[ self ]]->set_objectivewhitea(player, value);
}

/*
	Name: set_objectivewhiteb
	Namespace: sr_objective_secure_hud
	Checksum: 0x1B306AD6
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objectivewhiteb(player, value)
{
	[[ self ]]->set_objectivewhiteb(player, value);
}

