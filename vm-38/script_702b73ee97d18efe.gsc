#using scripts\core_common\lui_shared.gsc;

class cbountyhunterbuy : cluielem
{

	/*
		Name: constructor
		Namespace: cbountyhunterbuy
		Checksum: 0xFB3B6A6B
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
		Namespace: cbountyhunterbuy
		Checksum: 0xA15092E1
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
		Namespace: cbountyhunterbuy
		Checksum: 0xCCF1BEB1
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: cbountyhunterbuy
		Checksum: 0xECA0F268
		Offset: 0x228
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
		Namespace: cbountyhunterbuy
		Checksum: 0x8CBD269
		Offset: 0x1B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("BountyHunterBuy");
	}

}

#namespace bountyhunterbuy;

/*
	Name: function_37241b14
	Namespace: bountyhunterbuy
	Checksum: 0xC77D05B0
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_37241b14()
{
	level notify(797778460);
}

/*
	Name: register
	Namespace: bountyhunterbuy
	Checksum: 0x26CEBDB8
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cbountyhunterbuy();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: bountyhunterbuy
	Checksum: 0x584B4B43
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
	Namespace: bountyhunterbuy
	Checksum: 0x5189623B
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
	Namespace: bountyhunterbuy
	Checksum: 0xC3D6EA8D
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

