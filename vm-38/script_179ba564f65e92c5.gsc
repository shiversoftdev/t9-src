#using script_ac6a30f1991e105;
#using script_5da58df20c85a0e;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_abfee9ba;

/*
	Name: function_4ac5cc2
	Namespace: namespace_abfee9ba
	Checksum: 0x9AC9C52A
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4ac5cc2()
{
	level notify(-1487434138);
}

/*
	Name: __init__system__
	Namespace: namespace_abfee9ba
	Checksum: 0x1D4194F0
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_55f568f82a7aea28", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_abfee9ba
	Checksum: 0xD1A67046
	Offset: 0x128
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_3220b44880f1807c", 24000, 1, "counter", &function_9eb59632, 0, 0);
	ai::add_archetype_spawn_function(#"tormentor", &function_a5cd9e54);
}

/*
	Name: function_a5cd9e54
	Namespace: namespace_abfee9ba
	Checksum: 0x2DE1EF5F
	Offset: 0x1C0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_a5cd9e54(localclientnum)
{
	util::playfxontag(localclientnum, #"hash_59ec528273a2d3f0", self, "tag_eye");
	if(isdefined(self.fxdef))
	{
		fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
	}
}

/*
	Name: function_9eb59632
	Namespace: namespace_abfee9ba
	Checksum: 0xBFA9605D
	Offset: 0x230
	Size: 0x1C4
	Parameters: 7
	Flags: Linked
*/
function function_9eb59632(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"end_game");
	util::waittill_dobj(bwastimejump);
	if(!isdefined(self))
	{
		return;
	}
	var_d1dc644a = playfx(bwastimejump, #"hash_2de6c1300bec68cd", self.origin + vectorscale((0, 0, 1), 36), anglestoup(self.angles));
	playsound(bwastimejump, #"hash_22dd31bb07fa0a72", self.origin + vectorscale((0, 0, 1), 36));
	wait(1);
	if(isdefined(var_d1dc644a))
	{
		stopfx(bwastimejump, var_d1dc644a);
	}
	if(isdefined(self))
	{
		var_b064d016 = playfx(bwastimejump, #"hash_44214bf58f0e6d87", self.origin + vectorscale((0, 0, 1), 36), anglestoup(self.angles));
		playsound(bwastimejump, #"hash_2b575d8db3a60a95", self.origin + vectorscale((0, 0, 1), 36));
	}
}

