#using script_79fbbb4d5723c197;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_6747c550;

/*
	Name: function_cce36c55
	Namespace: namespace_6747c550
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
	Name: function_89f2df9
	Namespace: namespace_6747c550
	Checksum: 0x4925E959
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_23b05089013ba630", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6747c550
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
	var_b9b9b499 = [];
	foreach(mapping in level.var_a16c38d9)
	{
		if(!isdefined(var_b9b9b499[mapping.var_cd35dfb2]))
		{
			var_b9b9b499[mapping.var_cd35dfb2] = 1;
			if(is_true(mapping.var_7f12f171))
			{
				clientfield::function_a8bbc967(mapping.var_cd35dfb2, mapping.var_a88efd0b, mapping.var_2972a1c0, 1, mapping.numbits, "int", undefined, 0, 0);
				continue;
			}
			clientfield::function_5b7d846d(mapping.var_cd35dfb2, mapping.var_a88efd0b, mapping.var_2972a1c0, 1, mapping.numbits, "int", undefined, 0, 0);
		}
	}
}

