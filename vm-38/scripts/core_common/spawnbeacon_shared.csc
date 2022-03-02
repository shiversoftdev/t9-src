#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_f2029649;

/*
	Name: function_6dfbd99a
	Namespace: namespace_f2029649
	Checksum: 0x7DB72FFE
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6dfbd99a()
{
	level notify(494411775);
}

#namespace spawn_beacon;

/*
	Name: init_shared
	Namespace: spawn_beacon
	Checksum: 0x8F0FC5A9
	Offset: 0x120
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
	Checksum: 0xDA091366
	Offset: 0x140
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function setupclientfields()
{
	clientfield::register("scriptmover", "spawnbeacon_placed", 1, 1, "int", &spawnbeacon_placed, 0, 0);
	clientfield::function_a8bbc967("hudItems.spawnbeacon.active", #"hud_items", [1:#"active", 0:#"spawnbeacon"], 1, 1, "int", undefined, 0, 0);
}

/*
	Name: spawnbeacon_placed
	Namespace: spawn_beacon
	Checksum: 0xBC7798F6
	Offset: 0x208
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

