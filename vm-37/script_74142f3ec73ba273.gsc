#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace player_tank;

/*
	Name: function_89f2df9
	Namespace: player_tank
	Checksum: 0xBC2067B3
	Offset: 0x160
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"player_tank", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: player_tank
	Checksum: 0x2E3ECC66
	Offset: 0x1B0
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_70a657d8(localclientnum)
{
	vehicle::add_vehicletype_callback("player_tank", &function_c0f1d81b);
	clientfield::register("scriptmover", "tank_deathfx", 1, 1, "int", &function_de69d, 0, 0);
	clientfield::register("vehicle", "tank_shellejectfx", 1, 1, "int", &function_5c44d585, 0, 0);
}

/*
	Name: function_c0f1d81b
	Namespace: player_tank
	Checksum: 0x4C322362
	Offset: 0x280
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c0f1d81b(localclientnum)
{
}

/*
	Name: function_de69d
	Namespace: player_tank
	Checksum: 0xD04E7ED3
	Offset: 0x298
	Size: 0x6C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_de69d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self util::playfxontag(fieldname, "vehicle/fx9_vdest_mil_ru_tank_t72_death_turret", self, "tag_turret_animate");
	}
}

/*
	Name: function_5c44d585
	Namespace: player_tank
	Checksum: 0x63406629
	Offset: 0x310
	Size: 0x6C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_5c44d585(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self util::playfxontag(fieldname, "vehicle/fx9_mil_tank_ru_t72_shell_eject", self, "tag_fx_shell_eject");
	}
}

