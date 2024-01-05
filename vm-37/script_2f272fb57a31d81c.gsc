#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace missile_turret;

/*
	Name: init_shared
	Namespace: missile_turret
	Checksum: 0x321D8281
	Offset: 0xF8
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	if(!isdefined(level.var_7f854017))
	{
		level.var_7f854017 = {};
		clientfield::register("vehicle", "missile_turret_open", 1, 1, "int", &turret_open, 0, 0);
		clientfield::register("vehicle", "missile_turret_init", 1, 1, "int", &turret_init_anim, 0, 0);
		clientfield::register("vehicle", "missile_turret_close", 1, 1, "int", &turret_close_anim, 0, 0);
		clientfield::register("vehicle", "missile_turret_is_jammed_by_cuav", 1, 1, "int", &function_c1c49ac7, 0, 0);
	}
}

/*
	Name: turret_init_anim
	Namespace: missile_turret
	Checksum: 0xBC4527CB
	Offset: 0x240
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
	Namespace: missile_turret
	Checksum: 0x170EA761
	Offset: 0x338
	Size: 0xDC
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
	self function_1f0c7136(1);
	self useanimtree("generic");
	self setanimrestart(#"o_turret_mini_deploy", 1, 0, 1);
}

/*
	Name: turret_close_anim
	Namespace: missile_turret
	Checksum: 0xF676F5E
	Offset: 0x420
	Size: 0x3C
	Parameters: 7
	Flags: None
*/
function turret_close_anim(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

/*
	Name: function_c1c49ac7
	Namespace: missile_turret
	Checksum: 0xEA0B9133
	Offset: 0x468
	Size: 0x138
	Parameters: 7
	Flags: None
*/
function function_c1c49ac7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self.weapon.var_96850284))
	{
		return;
	}
	if(bwastimejump == 1)
	{
		self.var_37e84ddb = playtagfxset(fieldname, self.weapon.var_96850284, self);
	}
	else if(isdefined(self.var_37e84ddb))
	{
		foreach(fx in self.var_37e84ddb)
		{
			stopfx(fieldname, fx);
		}
	}
}

