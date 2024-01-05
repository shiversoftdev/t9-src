#using scripts\core_common\ai\archetype_nosferatu.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_58e19d6;

/*
	Name: init
	Namespace: namespace_58e19d6
	Checksum: 0xC16C9DC5
	Offset: 0xF0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_silverback");
	clientfield::register("actor", "silverback_spawn", 1, 1, "counter", &silverback_spawn, 0, 0);
}

/*
	Name: silverback_spawn
	Namespace: namespace_58e19d6
	Checksum: 0x3C46F3C9
	Offset: 0x160
	Size: 0x8C
	Parameters: 7
	Flags: Linked, Private
*/
function private silverback_spawn(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(bwastimejump);
	forcestreamxmodel("zombietron_spoon");
	wait(3);
	stopforcestreamingxmodel("zombietron_spoon");
}

