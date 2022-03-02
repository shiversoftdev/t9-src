#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_f91fc158 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_f91fc158
		Checksum: 0x27AA2DC
		Offset: 0x268
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_f91fc158
		Checksum: 0xB85DD4ED
		Offset: 0x490
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_f91fc158
		Checksum: 0x820B6CDE
		Offset: 0x328
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_f91fc158
		Checksum: 0xF144FF53
		Offset: 0x370
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_74adcd8a
		Namespace: namespace_f91fc158
		Checksum: 0xDACD0248
		Offset: 0x440
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_74adcd8a(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "armor_vis", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_f91fc158
		Checksum: 0x2F848DFA
		Offset: 0x288
		Size: 0x94
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_roots_health_bar");
		namespace_6aaccc24::function_da693cbe("health", 4000, 7, "float");
		namespace_6aaccc24::function_da693cbe("armor", 4000, 7, "float");
		namespace_6aaccc24::function_da693cbe("armor_vis", 4000, 1, "int");
	}

	/*
		Name: set_armor
		Namespace: namespace_f91fc158
		Checksum: 0x7AF5C84
		Offset: 0x3F0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_armor(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "armor", value);
	}

	/*
		Name: set_health
		Namespace: namespace_f91fc158
		Checksum: 0x56079D0F
		Offset: 0x3A0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_health(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "health", value);
	}

}

#namespace namespace_fb27ba0b;

/*
	Name: function_ed8f50c6
	Namespace: namespace_fb27ba0b
	Checksum: 0x9E808339
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ed8f50c6()
{
	level notify(1888807858);
}

/*
	Name: register
	Namespace: namespace_fb27ba0b
	Checksum: 0x1068438F
	Offset: 0x108
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_f91fc158();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: namespace_fb27ba0b
	Checksum: 0xF79EBB64
	Offset: 0x148
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
	Namespace: namespace_fb27ba0b
	Checksum: 0x8223FA61
	Offset: 0x188
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
	Namespace: namespace_fb27ba0b
	Checksum: 0xC4970C2C
	Offset: 0x1B0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_health
	Namespace: namespace_fb27ba0b
	Checksum: 0xDC0BD1D1
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_health(player, value)
{
	[[ self ]]->set_health(player, value);
}

/*
	Name: set_armor
	Namespace: namespace_fb27ba0b
	Checksum: 0x9D9EADDF
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_armor(player, value)
{
	[[ self ]]->set_armor(player, value);
}

/*
	Name: function_74adcd8a
	Namespace: namespace_fb27ba0b
	Checksum: 0x62C777D3
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_74adcd8a(player, value)
{
	[[ self ]]->function_74adcd8a(player, value);
}

