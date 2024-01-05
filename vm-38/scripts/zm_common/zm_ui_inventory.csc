#using scripts\zm_common\zm_inventory.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_ui_inventory;

/*
	Name: function_cce36c55
	Namespace: zm_ui_inventory
	Checksum: 0xB0D75135
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cce36c55()
{
	level notify(467959617);
}

/*
	Name: __init__system__
	Namespace: zm_ui_inventory
	Checksum: 0x4925E959
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_ui_inventory", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_ui_inventory
	Checksum: 0x235C7A2E
	Offset: 0x128
	Size: 0x1A8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::function_91cd7763("string", "hudItems.zmFeatureDescription", #"hud_items", #"hash_2d1fa0af7d884150", 1, undefined, 0, 0);
	zm_inventory::function_c7c05a13();
	registeredfields = [];
	foreach(mapping in level.var_a16c38d9)
	{
		if(!isdefined(registeredfields[mapping.var_cd35dfb2]))
		{
			registeredfields[mapping.var_cd35dfb2] = 1;
			if(is_true(mapping.var_7f12f171))
			{
				clientfield::register_clientuimodel(mapping.var_cd35dfb2, mapping.var_a88efd0b, mapping.var_2972a1c0, 1, mapping.numbits, "int", undefined, 0, 0);
				continue;
			}
			clientfield::function_5b7d846d(mapping.var_cd35dfb2, mapping.var_a88efd0b, mapping.var_2972a1c0, 1, mapping.numbits, "int", undefined, 0, 0);
		}
	}
}

