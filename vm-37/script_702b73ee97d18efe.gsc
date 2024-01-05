#using scripts\core_common\lui_shared.gsc;

class cbountyhunterbuy : cluielem
{

	/*
		Name: constructor
		Namespace: cbountyhunterbuy
		Checksum: 0x61A43FAE
		Offset: 0x178
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
		Checksum: 0xF3AA983C
		Offset: 0x238
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
		Checksum: 0x7042B682
		Offset: 0x1C0
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
		Checksum: 0xD1FA9E5
		Offset: 0x208
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
		Checksum: 0x2A9D7B31
		Offset: 0x198
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
	Name: register
	Namespace: bountyhunterbuy
	Checksum: 0xBCBAF949
	Offset: 0xA8
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
	Checksum: 0x66AF6895
	Offset: 0xE8
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
	Checksum: 0xCF4D1283
	Offset: 0x128
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
	Checksum: 0xD7BC2ED4
	Offset: 0x150
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

