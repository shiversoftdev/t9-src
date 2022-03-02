#using scripts\core_common\lui_shared.gsc;

class class_d1ed471a : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_d1ed471a
		Checksum: 0x26EA4E8B
		Offset: 0x198
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_d1ed471a
		Checksum: 0x122ED914
		Offset: 0x258
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_d1ed471a
		Checksum: 0x514B7CAE
		Offset: 0x1E0
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
		Namespace: namespace_d1ed471a
		Checksum: 0x2744138D
		Offset: 0x228
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
		Namespace: namespace_d1ed471a
		Checksum: 0xDEFAEFE5
		Offset: 0x1B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_gold_hud");
	}

}

#namespace namespace_82d7691b;

/*
	Name: function_f310382b
	Namespace: namespace_82d7691b
	Checksum: 0xA6CDD314
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f310382b()
{
	level notify(1105584694);
}

/*
	Name: register
	Namespace: namespace_82d7691b
	Checksum: 0x1ED96D3
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_d1ed471a();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: namespace_82d7691b
	Checksum: 0xF79EBB64
	Offset: 0x108
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
	Namespace: namespace_82d7691b
	Checksum: 0x8223FA61
	Offset: 0x148
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
	Namespace: namespace_82d7691b
	Checksum: 0xC4970C2C
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

