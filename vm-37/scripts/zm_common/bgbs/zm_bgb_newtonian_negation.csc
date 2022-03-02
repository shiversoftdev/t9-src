#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_bgb.csc;

#namespace zm_bgb_newtonian_negation;

/*
	Name: function_89f2df9
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0xB12857CB
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_bgb_newtonian_negation", &function_70a657d8, undefined, undefined, #"bgb");
}

/*
	Name: function_70a657d8
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0xB661763B
	Offset: 0x100
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(level.bgb_in_use) && !is_true(level.var_5470be1c))
	{
		return;
	}
	clientfield::register("world", "newtonian_negation", 1, 1, "int", &function_8622e664, 0, 0);
	bgb::register(#"zm_bgb_newtonian_negation", "time");
}

/*
	Name: function_8622e664
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0x7678D6DC
	Offset: 0x1C0
	Size: 0xBC
	Parameters: 7
	Flags: Linked
*/
function function_8622e664(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		setdvar(#"phys_gravity_dir", (0, 0, -1));
		self notify(#"hash_747b48d62f4fbad1");
	}
	else
	{
		setdvar(#"phys_gravity_dir", (0, 0, 1));
		self thread function_e752a980(fieldname);
	}
}

/*
	Name: function_e752a980
	Namespace: zm_bgb_newtonian_negation
	Checksum: 0x6824E008
	Offset: 0x288
	Size: 0x19E
	Parameters: 1
	Flags: Linked
*/
function function_e752a980(localclientnum)
{
	self endon(#"hash_747b48d62f4fbad1", #"disconnect");
	var_f42481ac = 0;
	a_dynents = getdynentarray();
	a_corpses = getentarraybytype(localclientnum, 17);
	var_f74f1323 = arraycombine(a_dynents, a_corpses, 1, 0);
	var_f74f1323 = array::randomize(var_f74f1323);
	foreach(var_863ce745 in var_f74f1323)
	{
		if(!isdefined(var_863ce745))
		{
			continue;
		}
		physicsexplosionsphere(localclientnum, var_863ce745.origin, 2, 0, 5, undefined, undefined, 1, 1, 1);
		var_f42481ac++;
		if(var_f42481ac >= 5)
		{
			waitframe(1);
			var_f42481ac = 0;
		}
	}
}

