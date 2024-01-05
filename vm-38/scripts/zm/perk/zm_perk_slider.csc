#using scripts\zm_common\zm_perks.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_perk_slider;

/*
	Name: function_fabe3ee7
	Namespace: zm_perk_slider
	Checksum: 0x2902DE4D
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fabe3ee7()
{
	level notify(950317205);
}

/*
	Name: __init__system__
	Namespace: zm_perk_slider
	Checksum: 0xF75B2CD9
	Offset: 0x1B0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_slider", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_slider
	Checksum: 0x4C001ED0
	Offset: 0x1F8
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_4b8929fb898a9e80")))
	{
		return;
	}
	enable_slider_perk_for_level();
}

/*
	Name: enable_slider_perk_for_level
	Namespace: zm_perk_slider
	Checksum: 0x1F80976D
	Offset: 0x250
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function enable_slider_perk_for_level()
{
	zm_perks::register_perk_clientfields(#"hash_3417450e1347185", &function_4bb29d61, &function_90b5e96c);
	zm_perks::register_perk_effects(#"hash_3417450e1347185", "slider_light");
	zm_perks::register_perk_init_thread(#"hash_3417450e1347185", &init_slider);
}

/*
	Name: init_slider
	Namespace: zm_perk_slider
	Checksum: 0x80F724D1
	Offset: 0x2F8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_slider()
{
}

/*
	Name: function_4bb29d61
	Namespace: zm_perk_slider
	Checksum: 0xCE502978
	Offset: 0x308
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_4bb29d61()
{
	clientfield::register("toplayer", "slide_fx", 17000, 1, "int", &function_82475467, 0, 0);
	if(zm_utility::is_classic())
	{
		clientfield::register("scriptmover", "phd_slider_machine_rob_poweron", 17000, 1, "int", &function_a0d9dbb3, 0, 0);
		clientfield::register("scriptmover", "phd_slider_machine_rob_purchase", 17000, 1, "counter", &function_ed4b5d33, 0, 0);
	}
}

/*
	Name: function_90b5e96c
	Namespace: zm_perk_slider
	Checksum: 0x80F724D1
	Offset: 0x400
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_90b5e96c()
{
}

/*
	Name: function_82475467
	Namespace: zm_perk_slider
	Checksum: 0xD5A8BAE2
	Offset: 0x410
	Size: 0x104
	Parameters: 7
	Flags: Linked
*/
function function_82475467(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(isplayer(self) && self hasdobj(fieldname))
	{
		if(bwastimejump)
		{
			self.var_b4099c13 = function_239993de(fieldname, #"hash_129046e1c36bd447", self, "j_ankle_ri");
		}
		else if(isdefined(self.var_b4099c13))
		{
			stopfx(fieldname, self.var_b4099c13);
		}
	}
}

/*
	Name: function_ed4b5d33
	Namespace: zm_perk_slider
	Checksum: 0x4D3A6317
	Offset: 0x520
	Size: 0x154
	Parameters: 7
	Flags: Linked
*/
function function_ed4b5d33(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"end_game");
	self endon(#"death");
	self notify("3d4720573ae624b0");
	self endon("3d4720573ae624b0");
	if(bwastimejump)
	{
		self function_f6e99a8d("rob_phd_slide_side_lights");
		self function_f6e99a8d("rob_phd_slide_top_lights1");
		self function_f6e99a8d("rob_phd_slide_top_lights2");
		wait(1);
		self playrenderoverridebundle("rob_phd_slide_side_lights");
		self playrenderoverridebundle("rob_phd_slide_top_lights1");
		self playrenderoverridebundle("rob_phd_slide_top_lights2");
	}
}

/*
	Name: function_a0d9dbb3
	Namespace: zm_perk_slider
	Checksum: 0xA45DF0B1
	Offset: 0x680
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_a0d9dbb3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self playrenderoverridebundle("rob_phd_slide_side_lights");
		self playrenderoverridebundle("rob_phd_slide_top_lights1");
		self playrenderoverridebundle("rob_phd_slide_top_lights2");
	}
}

