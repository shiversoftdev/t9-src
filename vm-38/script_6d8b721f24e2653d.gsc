#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_a2fc8c70;

/*
	Name: function_eff1f448
	Namespace: namespace_a2fc8c70
	Checksum: 0x37528DDC
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eff1f448()
{
	level notify(408093746);
}

/*
	Name: __init__system__
	Namespace: namespace_a2fc8c70
	Checksum: 0x38563E5E
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_35d5e49c19d9cf09", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_a2fc8c70
	Checksum: 0x80F724D1
	Offset: 0x1A0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_504792
	Namespace: namespace_a2fc8c70
	Checksum: 0x2E1AF478
	Offset: 0x1B0
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_504792()
{
	level._effect[#"hash_11fd5c794ccab4e5"] = "zombie/fx9_onslaught_orb_unstable";
	level._effect[#"soul_fx"] = "maps/zm_red/fx8_soul_red";
	level._effect[#"hash_308d15c5b36ba48a"] = "maps/zm_red/fx8_soul_charge_red";
	level._effect[#"hash_d7a655f41aa4b03"] = "zombie/fx9_onslaught_spawn_lg_unstable";
	level._effect[#"hash_55ab97f3dc5e7ba2"] = "zombie/fx9_onslaught_orb_unstable_collapse";
	level.var_de8cc106 = #"hash_6a78a4f5119b8978";
}

