#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace spawn_beacon;

/*
	Name: init_shared
	Namespace: spawn_beacon
	Checksum: 0x7DD5D1B2
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	setupclientfields();
}

/*
	Name: setupclientfields
	Namespace: spawn_beacon
	Checksum: 0x65234C40
	Offset: 0x120
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function setupclientfields()
{
	clientfield::register("scriptmover", "spawnbeacon_placed", 1, 1, "int", &spawnbeacon_placed, 0, 0);
	clientfield::register_clientuimodel("hudItems.spawnbeacon.active", #"hud_items", [1:#"active", 0:#"spawnbeacon"], 1, 1, "int", undefined, 0, 0);
}

/*
	Name: spawnbeacon_placed
	Namespace: spawn_beacon
	Checksum: 0xC90FC234
	Offset: 0x1E8
	Size: 0xE4
	Parameters: 7
	Flags: Linked, Private
*/
function private spawnbeacon_placed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(bwastimejump);
	if(!isdefined(self))
	{
		return;
	}
	playtagfxset(bwastimejump, "gadget_spawnbeacon_teamlight", self);
	self useanimtree("generic");
	self setanimrestart("o_spawn_beacon_deploy", 1, 0, 1);
}

