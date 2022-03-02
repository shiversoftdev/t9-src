#using scripts\core_common\aat_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_8652b0d1;

/*
	Name: function_42777e2f
	Namespace: namespace_8652b0d1
	Checksum: 0xA5AB4AFC
	Offset: 0x170
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_42777e2f()
{
	level notify(1462538574);
}

/*
	Name: function_4e14a881
	Namespace: namespace_8652b0d1
	Checksum: 0x372EF605
	Offset: 0x190
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function function_4e14a881()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	aat::register("ammomod_shatterblast", #"hash_348a3e874fc4d9fd", "ui_icon_zombie_ammomod_shatterblast");
	aat::register("ammomod_shatterblast_1", #"hash_348a3e874fc4d9fd", "ui_icon_zombie_ammomod_shatterblast");
	aat::register("ammomod_shatterblast_2", #"hash_348a3e874fc4d9fd", "ui_icon_zombie_ammomod_shatterblast");
	aat::register("ammomod_shatterblast_3", #"hash_348a3e874fc4d9fd", "ui_icon_zombie_ammomod_shatterblast");
	aat::register("ammomod_shatterblast_4", #"hash_348a3e874fc4d9fd", "ui_icon_zombie_ammomod_shatterblast");
	aat::register("ammomod_shatterblast_5", #"hash_348a3e874fc4d9fd", "ui_icon_zombie_ammomod_shatterblast");
	clientfield::register("toplayer", "ammomod_shatterblast_proc", 6000, 1, "counter", &function_d28d723d, 1, 0);
}

/*
	Name: function_d28d723d
	Namespace: namespace_8652b0d1
	Checksum: 0x72801BC4
	Offset: 0x328
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_d28d723d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	playviewmodelfx(bwastimejump, #"hash_49d3b58a14ed6c92", "tag_fx1", 0);
}

