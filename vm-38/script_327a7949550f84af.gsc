#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_af634c52;

/*
	Name: function_c1b863ae
	Namespace: namespace_af634c52
	Checksum: 0xC67F39F2
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c1b863ae()
{
	level notify(969589508);
}

#namespace ultimate_turret;

/*
	Name: init_shared
	Namespace: ultimate_turret
	Checksum: 0xC299E103
	Offset: 0x118
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.var_1427245))
	{
		level.var_1427245 = {};
		clientfield::register("vehicle", "ultimate_turret_open", 1, 1, "int", &turret_open, 0, 0);
		clientfield::register("vehicle", "ultimate_turret_init", 1, 1, "int", &turret_init_anim, 0, 0);
		clientfield::register("vehicle", "ultimate_turret_close", 1, 1, "int", &turret_close_anim, 0, 0);
		clientfield::function_a8bbc967("hudItems.ultimateTurretCount", #"hud_items", #"hash_58c43b819104fd6f", 1, 3, "int", undefined, 0, 0);
	}
}

/*
	Name: turret_init_anim
	Namespace: ultimate_turret
	Checksum: 0x963DBD6A
	Offset: 0x268
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function turret_init_anim(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!bwastimejump)
	{
		return;
	}
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	self useanimtree("generic");
	self setanimrestart(#"o_turret_mini_deploy", 1, 0, 1);
	self setanimtime(#"o_turret_mini_deploy", 0);
}

/*
	Name: turret_open
	Namespace: ultimate_turret
	Checksum: 0xF20ACE2D
	Offset: 0x360
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function turret_open(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!bwastimejump)
	{
		return;
	}
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	self useanimtree("generic");
	self setanimrestart(#"o_turret_mini_deploy", 1, 0, 1);
}

/*
	Name: turret_close_anim
	Namespace: ultimate_turret
	Checksum: 0x1E034281
	Offset: 0x430
	Size: 0x3C
	Parameters: 7
	Flags: Linked
*/
function turret_close_anim(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

