#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_fbe341f : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_fbe341f
		Checksum: 0xBF886762
		Offset: 0x250
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_fbe341f
		Checksum: 0x3027D772
		Offset: 0x500
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_fbe341f
		Checksum: 0xE8B551DB
		Offset: 0x310
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
		Namespace: namespace_fbe341f
		Checksum: 0x6F3194CD
		Offset: 0x4B0
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
		Namespace: namespace_fbe341f
		Checksum: 0xA80C57EA
		Offset: 0x358
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
		Namespace: namespace_fbe341f
		Checksum: 0x7C199C54
		Offset: 0x270
		Size: 0x94
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("DirtyBomb_UseBar");
		namespace_6aaccc24::function_da693cbe("_state", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("progressFrac", 1, 10, "float");
		namespace_6aaccc24::function_da693cbe("activatorCount", 1, 3, "int", 0);
	}

	/*
		Name: set_state
		Namespace: namespace_fbe341f
		Checksum: 0xCE30F09
		Offset: 0x388
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
			if(#"detonating" == state_name)
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
		Namespace: namespace_fbe341f
		Checksum: 0xF948958C
		Offset: 0x460
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_f0df5702(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progressFrac", value);
	}

}

#namespace dirtybomb_usebar;

/*
	Name: register
	Namespace: dirtybomb_usebar
	Checksum: 0x723A030F
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_fbe341f();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: dirtybomb_usebar
	Checksum: 0x52224920
	Offset: 0x130
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
	Namespace: dirtybomb_usebar
	Checksum: 0x753C763F
	Offset: 0x170
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
	Namespace: dirtybomb_usebar
	Checksum: 0xEFF97288
	Offset: 0x198
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
	Namespace: dirtybomb_usebar
	Checksum: 0xF6E05EF2
	Offset: 0x1C0
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
	Namespace: dirtybomb_usebar
	Checksum: 0x43153B29
	Offset: 0x1F0
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
	Namespace: dirtybomb_usebar
	Checksum: 0xBEC1AF0A
	Offset: 0x220
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4aa46834(player, value)
{
	[[ self ]]->function_4aa46834(player, value);
}

