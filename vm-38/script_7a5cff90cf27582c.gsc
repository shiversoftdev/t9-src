#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_6b831806 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_6b831806
		Checksum: 0xDD162454
		Offset: 0x1F8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_6b831806
		Checksum: 0x5DCA77CC
		Offset: 0x330
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_6b831806
		Checksum: 0x9806AE76
		Offset: 0x268
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
		Name: function_26d9350e
		Namespace: namespace_6b831806
		Checksum: 0x8DBAB234
		Offset: 0x2E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_26d9350e(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "deployProgress", value);
	}

	/*
		Name: close
		Namespace: namespace_6b831806
		Checksum: 0xF4792E4E
		Offset: 0x2B0
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
		Namespace: namespace_6b831806
		Checksum: 0x5DDFB015
		Offset: 0x218
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("BlackSeaJetskiDeployPrompt");
		namespace_6aaccc24::function_da693cbe("deployProgress", 1, 5, "float");
	}

}

#namespace blackseajetskideployprompt;

/*
	Name: function_f245841a
	Namespace: blackseajetskideployprompt
	Checksum: 0xE7E785B3
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f245841a()
{
	level notify(1615659129);
}

/*
	Name: register
	Namespace: blackseajetskideployprompt
	Checksum: 0xC52BF7E
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_6b831806();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: blackseajetskideployprompt
	Checksum: 0x83B95F3F
	Offset: 0x138
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
	Namespace: blackseajetskideployprompt
	Checksum: 0xDE74B2A0
	Offset: 0x178
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
	Namespace: blackseajetskideployprompt
	Checksum: 0x686D9D85
	Offset: 0x1A0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_26d9350e
	Namespace: blackseajetskideployprompt
	Checksum: 0xCC4922BF
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_26d9350e(player, value)
{
	[[ self ]]->function_26d9350e(player, value);
}

