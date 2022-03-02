#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_957938f0;

/*
	Name: function_533e723a
	Namespace: namespace_957938f0
	Checksum: 0xDA95EC9F
	Offset: 0x1E8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_533e723a()
{
	level notify(593579883);
}

/*
	Name: function_89f2df9
	Namespace: namespace_957938f0
	Checksum: 0x49CB5A48
	Offset: 0x208
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3256c1e06451aec4", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_957938f0
	Checksum: 0xBEF7F127
	Offset: 0x250
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_318abd2654cf527a")) && !getdvarint(#"hash_1afcd13f069fa385", 0))
	{
		return;
	}
	clientfield::register("scriptmover", "jump_pad_active", 1, 1, "int", &jump_pad_active, 0, 0);
	clientfield::register("scriptmover", "jump_pad_essence_fx", 1, 1, "int", &function_c01b356c, 0, 0);
	clientfield::register("scriptmover", "jump_pad_amb_sound_lp", 1, 1, "int", &function_da442c1, 0, 0);
	clientfield::register("toplayer", "jump_pad_wind_sound", 1, 1, "int", &function_27dd512, 0, 0);
	visionset_mgr::register_overlay_info_style_postfx_bundle("sr_jump_pad_visionset", 1, 1, "pstfx_jump_pad_launch");
}

/*
	Name: jump_pad_active
	Namespace: namespace_957938f0
	Checksum: 0x89ED4D02
	Offset: 0x420
	Size: 0x164
	Parameters: 7
	Flags: Linked
*/
function jump_pad_active(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		self.var_3364a192 = util::playfxontag(fieldname, #"hash_2fa753029cdd63bd", self, "tag_light_right_fx");
		self.var_d47b7586 = util::playfxontag(fieldname, #"hash_2fa753029cdd63bd", self, "tag_light_left_fx");
	}
	else
	{
		if(isdefined(self.var_3364a192))
		{
			killfx(fieldname, self.var_3364a192);
		}
		if(isdefined(self.var_d47b7586))
		{
			killfx(fieldname, self.var_d47b7586);
		}
	}
	self function_d309e55a("tag_light_left", bwastimejump);
	self function_d309e55a("tag_light_right", bwastimejump);
}

/*
	Name: function_c01b356c
	Namespace: namespace_957938f0
	Checksum: 0x4AD4BB8C
	Offset: 0x590
	Size: 0x12C
	Parameters: 7
	Flags: Linked
*/
function function_c01b356c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		playfx(fieldname, #"hash_740a639c59126f59", self.origin);
		function_239993de(fieldname, #"hash_23f38f1190bb99d9", self, "tag_origin");
		self thread function_6192b162();
	}
	else
	{
		playfx(fieldname, #"hash_326df840230b71d6", self.origin);
		playsound(fieldname, #"hash_52277036a18a5157", self.origin);
	}
}

/*
	Name: function_6192b162
	Namespace: namespace_957938f0
	Checksum: 0xF42DEC5F
	Offset: 0x6C8
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_6192b162()
{
	self endon(#"death");
	while(true)
	{
		if(!self function_d2503806(#"hash_5b08235c0b55a003"))
		{
			self function_bf9d3071(#"hash_5b08235c0b55a003");
		}
		waitframe(1);
	}
}

/*
	Name: function_da442c1
	Namespace: namespace_957938f0
	Checksum: 0xE5037F4A
	Offset: 0x740
	Size: 0x6A
	Parameters: 7
	Flags: Linked
*/
function function_da442c1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_c50612a2 = self playloopsound(#"hash_67d068901551222c");
	}
}

/*
	Name: function_27dd512
	Namespace: namespace_957938f0
	Checksum: 0xE329D29F
	Offset: 0x7B8
	Size: 0x116
	Parameters: 7
	Flags: Linked
*/
function function_27dd512(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_dbe88563 = self playloopsound(#"hash_296e1c756ae8ae2b");
		self thread function_ca483953(fieldname);
		self thread function_6b3f6fa7(fieldname);
		self thread function_dcffb6f();
		self thread function_d80deb1d();
	}
	else
	{
		if(isdefined(self.var_dbe88563))
		{
			self stoploopsound(self.var_dbe88563);
			self.var_dbe88563 = undefined;
		}
		self notify(#"hash_29a69758939eca52");
	}
}

/*
	Name: function_ca483953
	Namespace: namespace_957938f0
	Checksum: 0xA6092123
	Offset: 0x8D8
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function function_ca483953(localclientnum)
{
	self notify("6765c7d7714e2e17");
	self endon("6765c7d7714e2e17");
	self endon(#"death", #"hash_5db49134b7c7de10");
	while(true)
	{
		earthquake(localclientnum, 0.15, 0.3, self.origin, 256);
		wait(0.1);
	}
}

/*
	Name: function_6b3f6fa7
	Namespace: namespace_957938f0
	Checksum: 0x31C993E2
	Offset: 0x990
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function function_6b3f6fa7(localclientnum)
{
	self notify("422835d1e630de6e");
	self endon("422835d1e630de6e");
	self endon(#"death", #"hash_78558ed9d8282358");
	while(true)
	{
		self playrumbleonentity(localclientnum, #"anim_light");
		wait(0.1);
	}
}

/*
	Name: function_dcffb6f
	Namespace: namespace_957938f0
	Checksum: 0x396ADB2F
	Offset: 0xA28
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_dcffb6f()
{
	self notify("4127143e533fb306");
	self endon("4127143e533fb306");
	self endon(#"death", #"hash_5db49134b7c7de10", #"hash_78558ed9d8282358");
	self waittill(#"hash_29a69758939eca52");
	wait(3);
	self notify(#"hash_7387c0ba13aefdd7");
	self notify(#"hash_78558ed9d8282358");
	self notify(#"hash_5db49134b7c7de10");
}

/*
	Name: function_d80deb1d
	Namespace: namespace_957938f0
	Checksum: 0x36C7A92B
	Offset: 0xAD0
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function function_d80deb1d()
{
	self notify("1bffdf02996b6185");
	self endon("1bffdf02996b6185");
	self endon(#"death", #"hash_7387c0ba13aefdd7");
	while(self getvelocity()[2] <= 600)
	{
		waitframe(1);
	}
	while(self getvelocity()[2] > 600)
	{
		waitframe(1);
	}
	self notify(#"hash_5db49134b7c7de10");
	wait(0.5);
	self notify(#"hash_78558ed9d8282358");
}

