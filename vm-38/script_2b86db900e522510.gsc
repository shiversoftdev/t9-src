#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_ba33e0c1 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_ba33e0c1
		Checksum: 0x651807DD
		Offset: 0x270
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_ba33e0c1
		Checksum: 0xF2117300
		Offset: 0x520
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_ba33e0c1
		Checksum: 0x97F3DA24
		Offset: 0x330
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_4aa46834
		Namespace: namespace_ba33e0c1
		Checksum: 0x2C7B2EE3
		Offset: 0x4D0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_4aa46834(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "activatorCount", value);
	}

	/*
		Name: close
		Namespace: namespace_ba33e0c1
		Checksum: 0x5C6DE1FB
		Offset: 0x378
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_ba33e0c1
		Checksum: 0xA5DE0F5
		Offset: 0x290
		Size: 0x94
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("EncodedRadio_UseBar");
		namespace_6aaccc24::function_da693cbe("_state", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("progressFrac", 1, 10, "float");
		namespace_6aaccc24::function_da693cbe("activatorCount", 1, 3, "int", 0);
	}

	/*
		Name: set_state
		Namespace: namespace_ba33e0c1
		Checksum: 0x9488DBD6
		Offset: 0x3A8
		Size: 0xCC
		Parameters: 2
		Flags: None
	*/
	function set_state(player, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 0);
		}
		else
		{
			if(#"hash_5fba3d476e0b33f8" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				/#
					assertmsg("");
				#/
				/#
				#/
			}
		}
	}

	/*
		Name: function_f0df5702
		Namespace: namespace_ba33e0c1
		Checksum: 0xAEBF3322
		Offset: 0x480
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_f0df5702(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progressFrac", value);
	}

}

#namespace namespace_4d6a580c;

/*
	Name: function_75903978
	Namespace: namespace_4d6a580c
	Checksum: 0x94E9A22F
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_75903978()
{
	level notify(2040730319);
}

/*
	Name: register
	Namespace: namespace_4d6a580c
	Checksum: 0x931AA89E
	Offset: 0x110
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_ba33e0c1();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: namespace_4d6a580c
	Checksum: 0x584B4B43
	Offset: 0x150
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
	Namespace: namespace_4d6a580c
	Checksum: 0x5189623B
	Offset: 0x190
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
	Namespace: namespace_4d6a580c
	Checksum: 0xC3D6EA8D
	Offset: 0x1B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_state
	Namespace: namespace_4d6a580c
	Checksum: 0x9478374C
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: function_f0df5702
	Namespace: namespace_4d6a580c
	Checksum: 0xFB3969DB
	Offset: 0x210
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f0df5702(player, value)
{
	[[ self ]]->function_f0df5702(player, value);
}

/*
	Name: function_4aa46834
	Namespace: namespace_4d6a580c
	Checksum: 0xB75C7889
	Offset: 0x240
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4aa46834(player, value)
{
	[[ self ]]->function_4aa46834(player, value);
}

