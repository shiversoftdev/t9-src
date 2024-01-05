#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_1b611bca;

/*
	Name: function_f395109c
	Namespace: namespace_1b611bca
	Checksum: 0xA42CEC02
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f395109c()
{
	level notify(1398534853);
}

#namespace missile_turret;

/*
	Name: init_shared
	Namespace: missile_turret
	Checksum: 0xAC6FD41
	Offset: 0x118
	Size: 0x13C
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x783284F3
	Offset: 0x260
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
	Namespace: missile_turret
	Checksum: 0xF25D8B42
	Offset: 0x358
	Size: 0xDC
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
	self function_1f0c7136(1);
	self useanimtree("generic");
	self setanimrestart(#"o_turret_mini_deploy", 1, 0, 1);
}

/*
	Name: turret_close_anim
	Namespace: missile_turret
	Checksum: 0xA9EF9BDC
	Offset: 0x440
	Size: 0x3C
	Parameters: 7
	Flags: Linked
*/
function turret_close_anim(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

/*
	Name: function_c1c49ac7
	Namespace: missile_turret
	Checksum: 0x112B0381
	Offset: 0x488
	Size: 0x138
	Parameters: 7
	Flags: Linked
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

