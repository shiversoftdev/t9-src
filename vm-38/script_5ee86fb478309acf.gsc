#using scripts\core_common\system_shared.csc;
#using script_727042a075af51b7;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_85745671;

/*
	Name: function_e8f296b1
	Namespace: namespace_85745671
	Checksum: 0xE7AD778
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e8f296b1()
{
	level notify(-1331857284);
}

/*
	Name: __init__system__
	Namespace: namespace_85745671
	Checksum: 0x38501B9B
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_74761c506cae8855", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_85745671
	Checksum: 0x3B8FCE9C
	Offset: 0x158
	Size: 0x29C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "zombie_teleport", 1, 1, "counter", &function_65829e59, 0, 0);
	clientfield::register("toplayer", "zombie_vehicle_shake", 1, 1, "counter", &function_3acc8ce4, 0, 0);
	clientfield::register("toplayer", "zombie_melee_shake", 1, 1, "counter", &function_6c13a7f0, 0, 0);
	level._effect[#"hash_2ff87d61167ea531"] = #"wz/fx8_zm_box_marker";
	level._effect[#"hash_1e5c0bbc60604949"] = #"wz/fx8_zm_box_marker_red";
	level._effect[#"hash_7fe086085cbbacac"] = #"hash_4bd4c9b0fb97f425";
	level._effect[#"hash_4048cb4967032c4a"] = #"hash_1e43d43c6586fcb5";
	level._effect[#"hash_1e35a559be3b8286"] = #"wz/fx8_magicbox_marker_fl_red";
	level._effect[#"hash_53f5cefd054ceacd"] = #"hash_6bcc939010112ea";
	level._effect[#"hash_62a055b8f2259270"] = #"hash_3235e29f5bf57d5a";
	level._effect[#"hash_19f4dd97cbb87594"] = #"hash_5f376e9395e16666";
	level._effect[#"hash_4fbab83578c5a7e7"] = #"hash_5c4ef04b0752716a";
	level._effect[#"hash_538c528b09706dc8"] = #"hash_286e0d228779181";
	level.var_96add4a1 = #"hash_210be93b3bfae433";
	level.var_86e1b0cc = #"hash_1807f48a5193ce49";
}

/*
	Name: function_65829e59
	Namespace: namespace_85745671
	Checksum: 0xC28B28E8
	Offset: 0x400
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function function_65829e59(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(self hasdobj(bwastimejump))
	{
		function_239993de(bwastimejump, #"hash_3028e4dc03a28071", self, "j_spine4");
		playsound(bwastimejump, #"hash_74d089a256aab94", self.origin + vectorscale((0, 0, 1), 35));
	}
}

/*
	Name: function_3acc8ce4
	Namespace: namespace_85745671
	Checksum: 0x55C9AF86
	Offset: 0x4C0
	Size: 0x8E
	Parameters: 7
	Flags: Linked
*/
function function_3acc8ce4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	id = earthquake(bwastimejump, 0.3, 1, self.origin, 1000);
}

/*
	Name: function_6c13a7f0
	Namespace: namespace_85745671
	Checksum: 0x4FE8FD18
	Offset: 0x558
	Size: 0x7E
	Parameters: 7
	Flags: Linked
*/
function function_6c13a7f0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	id = earthquake(bwastimejump, 0.2, 0.25, self.origin, 1000, 0);
}

