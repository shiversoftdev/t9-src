#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace battletracks;

/*
	Name: function_89f2df9
	Namespace: battletracks
	Checksum: 0x96BBF329
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"battletracks", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: battletracks
	Checksum: 0xBBD41C19
	Offset: 0xE0
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("vehicle", "battletrack_active", 1, 1, "int", &function_14657fe9, 0, 0);
}

/*
	Name: function_14657fe9
	Namespace: battletracks
	Checksum: 0x2BC75662
	Offset: 0x138
	Size: 0x15C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_14657fe9(local_client_num, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_23944654 = bwastimejump;
	waitframe(1);
	players = getlocalplayers();
	foreach(player in players)
	{
		vehicle = getplayervehicle(player);
		if(isdefined(vehicle))
		{
			if(vehicle.var_23944654 !== 0)
			{
				setdvar(#"hash_30d02c7f5a4acf54", 1);
				return;
			}
		}
	}
	setdvar(#"hash_30d02c7f5a4acf54", 0);
}

