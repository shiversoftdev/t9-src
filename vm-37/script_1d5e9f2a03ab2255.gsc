#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_c3742963 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_c3742963
		Checksum: 0x2942F936
		Offset: 0x4F8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_c3742963
		Checksum: 0x53B23BEA
		Offset: 0x6A8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_c3742963
		Checksum: 0x8FBEA65C
		Offset: 0x590
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
		Name: close
		Namespace: namespace_c3742963
		Checksum: 0x90A2D5F3
		Offset: 0x5D8
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
		Namespace: namespace_c3742963
		Checksum: 0xDE853594
		Offset: 0x518
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("consequences_notification");
		namespace_6aaccc24::function_da693cbe("visible", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("content_index", 1, 4, "int");
	}

	/*
		Name: function_afdd9f65
		Namespace: namespace_c3742963
		Checksum: 0x8EBE7FBA
		Offset: 0x658
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_afdd9f65(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "content_index", value);
	}

	/*
		Name: set_visible
		Namespace: namespace_c3742963
		Checksum: 0x6CDED033
		Offset: 0x608
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_visible(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "visible", value);
	}

}

#namespace consequences_notification;

/*
	Name: function_aa7a37a1
	Namespace: consequences_notification
	Checksum: 0x36A321AB
	Offset: 0xE0
	Size: 0x64
	Parameters: 2
	Flags: None
*/
function function_aa7a37a1(player, index)
{
	if(![[ self ]]->function_7bfd10e6(player))
	{
		[[ self ]]->open(player);
	}
	[[ self ]]->function_afdd9f65(player, index);
	[[ self ]]->set_visible(player, 1);
}

/*
	Name: function_78a5981a
	Namespace: consequences_notification
	Checksum: 0x810892D9
	Offset: 0x150
	Size: 0x88
	Parameters: 2
	Flags: None
*/
function function_78a5981a(player, ref)
{
	if(![[ self ]]->function_7bfd10e6(player))
	{
		[[ self ]]->open(player);
	}
	var_445570c4 = [[ self ]]->function_cd2efd2d(player, ref);
	if(var_445570c4)
	{
		[[ self ]]->set_visible(player, 1);
	}
	else
	{
		[[ self ]]->close(player);
	}
}

/*
	Name: function_d27ad9da
	Namespace: consequences_notification
	Checksum: 0xCBF5B944
	Offset: 0x1E0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_d27ad9da(player)
{
	if([[ self ]]->function_7bfd10e6(player))
	{
		[[ self ]]->set_visible(player, 0);
		[[ self ]]->close(player);
	}
}

/*
	Name: function_cd2efd2d
	Namespace: consequences_notification
	Checksum: 0xC72D599F
	Offset: 0x230
	Size: 0x10C
	Parameters: 2
	Flags: None
*/
function function_cd2efd2d(player, ref)
{
	field = getmapfields();
	if(isdefined(field) && isdefined(field.var_2f3c2756))
	{
		index = 0;
		var_b7c59076 = getscriptbundlelist(field.var_2f3c2756);
		foreach(consequence in var_b7c59076)
		{
			if(consequence == ref)
			{
				[[ self ]]->function_afdd9f65(player, index);
				return true;
			}
			index++;
		}
	}
	return false;
}

/*
	Name: function_d9ee11d6
	Namespace: consequences_notification
	Checksum: 0xF509D07D
	Offset: 0x348
	Size: 0x78
	Parameters: 1
	Flags: None
*/
function function_d9ee11d6(player)
{
	field = getmapfields();
	if(isdefined(field) && isdefined(field.var_2f3c2756))
	{
		var_b7c59076 = getscriptbundlelist(field.var_2f3c2756);
		if(isdefined(var_b7c59076))
		{
			return var_b7c59076.size;
		}
	}
	return undefined;
}

/*
	Name: register
	Namespace: consequences_notification
	Checksum: 0x1F7F30D7
	Offset: 0x3C8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_c3742963();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: consequences_notification
	Checksum: 0x5A9A6AE8
	Offset: 0x408
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
	Namespace: consequences_notification
	Checksum: 0x798603F3
	Offset: 0x448
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
	Namespace: consequences_notification
	Checksum: 0x885A0FB1
	Offset: 0x470
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_visible
	Namespace: consequences_notification
	Checksum: 0x262DC79E
	Offset: 0x498
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_visible(player, value)
{
	[[ self ]]->set_visible(player, value);
}

/*
	Name: function_afdd9f65
	Namespace: consequences_notification
	Checksum: 0xFAEC3D01
	Offset: 0x4C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_afdd9f65(player, value)
{
	[[ self ]]->function_afdd9f65(player, value);
}

