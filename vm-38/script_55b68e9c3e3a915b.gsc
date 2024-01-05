#using scripts\core_common\lui_shared.gsc;

class class_a19c3039 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_a19c3039
		Checksum: 0x680BE4E1
		Offset: 0x1A0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a19c3039
		Checksum: 0xA8DAA590
		Offset: 0x260
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_a19c3039
		Checksum: 0x55526F87
		Offset: 0x1E8
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
		Name: close
		Namespace: namespace_a19c3039
		Checksum: 0xB2D9649
		Offset: 0x230
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a19c3039
		Checksum: 0xB439A2BF
		Offset: 0x1C0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("sr_perk_machine_choice");
	}

}

#namespace sr_perk_machine_choice;

/*
	Name: function_66cb17c2
	Namespace: sr_perk_machine_choice
	Checksum: 0x35E1C5CF
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_66cb17c2()
{
	level notify(-671337281);
}

/*
	Name: register
	Namespace: sr_perk_machine_choice
	Checksum: 0xF6E2F525
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_a19c3039();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: sr_perk_machine_choice
	Checksum: 0x40D59CB0
	Offset: 0x110
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
	Namespace: sr_perk_machine_choice
	Checksum: 0x6221B1B7
	Offset: 0x150
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
	Namespace: sr_perk_machine_choice
	Checksum: 0xD7920DB2
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

