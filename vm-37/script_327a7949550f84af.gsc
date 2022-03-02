#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace ultimate_turret;

/*
	Name: init_shared
	Namespace: ultimate_turret
	Checksum: 0xAFD8DFAA
	Offset: 0xF8
	Size: 0x144
	Parameters: 0
	Flags: None
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
	Checksum: 0xBDB43326
	Offset: 0x248
	Size: 0xEC
	Parameters: 7
	Flags: None
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
	Checksum: 0xAC51F352
	Offset: 0x340
	Size: 0xC4
	Parameters: 7
	Flags: None
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
	Checksum: 0xAC78D9C7
	Offset: 0x410
	Size: 0x9C
	Parameters: 7
	Flags: None
*/
function turret_close_anim(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!bwastimejump)
	{
		return;
	}
	self useanimtree("generic");
	self setanimrestart(#"o_turret_sentry_close", 1, 0, 1);
}

