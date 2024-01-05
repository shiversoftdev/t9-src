#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_perks.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_perk_elemental_pop;

/*
	Name: function_ec5fce88
	Namespace: zm_perk_elemental_pop
	Checksum: 0xAD346410
	Offset: 0x198
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ec5fce88()
{
	level notify(1550291296);
}

/*
	Name: __init__system__
	Namespace: zm_perk_elemental_pop
	Checksum: 0x746DF9A9
	Offset: 0x1B8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_elemental_pop", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_elemental_pop
	Checksum: 0x64192226
	Offset: 0x200
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	function_27473e44();
}

/*
	Name: function_27473e44
	Namespace: zm_perk_elemental_pop
	Checksum: 0xC5262B1F
	Offset: 0x220
	Size: 0x21C
	Parameters: 0
	Flags: Linked
*/
function function_27473e44()
{
	zm_perks::register_perk_clientfields(#"hash_51b6cc6dbafb7f31", &client_field_func, &callback_func);
	zm_perks::register_perk_effects(#"hash_51b6cc6dbafb7f31", "elemental_pop_light");
	zm_perks::register_perk_init_thread(#"hash_51b6cc6dbafb7f31", &init_perk);
	zm_perks::function_f3c80d73("zombie_perk_bottle_elemental_pop");
	clientfield::register("allplayers", "elemental_pop_reload_fx", 1, 2, "int", &function_7f805dac, 0, 0);
	clientfield::register("actor", "tesla_death_fx", 1, 1, "int", &tesla_death_fx_callback, 0, 0);
	clientfield::register("vehicle", "tesla_death_fx", 1, 1, "int", &tesla_death_fx_callback, 0, 0);
	clientfield::register("actor", "tesla_shock_eyes_fx", 1, 1, "int", &tesla_shock_eyes_fx_callback, 0, 0);
	clientfield::register("vehicle", "tesla_shock_eyes_fx", 1, 1, "int", &tesla_shock_eyes_fx_callback, 0, 0);
}

/*
	Name: init_perk
	Namespace: zm_perk_elemental_pop
	Checksum: 0x81723C94
	Offset: 0x448
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function init_perk()
{
	if(is_true(level.enable_magic))
	{
		level._effect[#"elemental_pop_light"] = #"zombie/fx_perk_element_pop_ndu";
	}
}

/*
	Name: client_field_func
	Namespace: zm_perk_elemental_pop
	Checksum: 0x3EEEAE33
	Offset: 0x498
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function client_field_func()
{
	clientfield::register("scriptmover", "" + #"hash_2bc83061af453e44", 1, 1, "counter", &function_9717930f, 0, 0);
	clientfield::register("toplayer", "" + #"hash_12c6e46c315cd43b", 1, 1, "counter", &function_2d190a32, 0, 0);
}

/*
	Name: callback_func
	Namespace: zm_perk_elemental_pop
	Checksum: 0x80F724D1
	Offset: 0x558
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function callback_func()
{
}

/*
	Name: function_9717930f
	Namespace: zm_perk_elemental_pop
	Checksum: 0xD6E0D967
	Offset: 0x568
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function function_9717930f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, #"hash_35c5a29b4a86b5fb", self, "tag_origin");
	util::playfxontag(bwastimejump, #"hash_250adc9af94491d1", self, "tag_origin");
	util::playfxontag(bwastimejump, #"hash_4bbd9da4b24f7552", self, "tag_origin");
	playsound(bwastimejump, #"hash_67d6791052a84d2a", self.origin + vectorscale((0, 0, 1), 75));
}

/*
	Name: function_2d190a32
	Namespace: zm_perk_elemental_pop
	Checksum: 0x9E08B7B
	Offset: 0x660
	Size: 0x84
	Parameters: 7
	Flags: Linked, Private
*/
function private function_2d190a32(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(zm_utility::function_f8796df3(bwastimejump))
	{
		playfxoncamera(bwastimejump, #"hash_b471a5df94f45b7", undefined, (1, 0, 0), (0, 0, 1));
	}
}

/*
	Name: function_7f805dac
	Namespace: zm_perk_elemental_pop
	Checksum: 0x67B61505
	Offset: 0x6F0
	Size: 0x112
	Parameters: 7
	Flags: Linked
*/
function function_7f805dac(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.var_c278b547))
	{
		stopfx(fieldname, self.var_c278b547);
		self.var_c278b547 = undefined;
	}
	switch(bwastimejump)
	{
		case 1:
		case 2:
		case 3:
		{
			self.var_c278b547 = util::playfxontag(fieldname, #"hash_70912cde462752a8", self, "tag_origin");
			break;
		}
	}
}

/*
	Name: tesla_death_fx_callback
	Namespace: zm_perk_elemental_pop
	Checksum: 0xC0B7CBCC
	Offset: 0x810
	Size: 0x1EE
	Parameters: 7
	Flags: Linked
*/
function tesla_death_fx_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump == 1)
	{
		str_tag = "J_SpineUpper";
		if(isdefined(self.str_tag_tesla_death_fx))
		{
			str_tag = self.str_tag_tesla_death_fx;
		}
		else if(is_true(self.isdog))
		{
			str_tag = "J_Spine1";
		}
		if(!isdefined(self.var_16e53a57))
		{
			self playsound(fieldname, #"hash_444d07230f4c95bf");
			self.var_16e53a57 = self playloopsound(#"hash_b02589e63759483");
		}
		self.n_death_fx = util::playfxontag(fieldname, #"hash_43be23bab63afdc6", self, str_tag);
		if(isdefined(self.n_death_fx))
		{
			setfxignorepause(fieldname, self.n_death_fx, 1);
		}
	}
	else
	{
		if(isdefined(self.n_death_fx))
		{
			deletefx(fieldname, self.n_death_fx, 1);
			self.n_death_fx = undefined;
		}
		if(isdefined(self.var_16e53a57))
		{
			self stoploopsound(self.var_16e53a57);
			self.var_16e53a57 = undefined;
		}
	}
}

/*
	Name: tesla_shock_eyes_fx_callback
	Namespace: zm_perk_elemental_pop
	Checksum: 0x8FA025A2
	Offset: 0xA08
	Size: 0x29E
	Parameters: 7
	Flags: Linked
*/
function tesla_shock_eyes_fx_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump == 1)
	{
		str_tag = "J_SpineUpper";
		if(isdefined(self.str_tag_tesla_shock_eyes_fx))
		{
			str_tag = self.str_tag_tesla_shock_eyes_fx;
		}
		else if(is_true(self.isdog))
		{
			str_tag = "J_Spine1";
		}
		if(!isdefined(self.var_16e53a57))
		{
			self playsound(fieldname, #"hash_3b277f4572603015");
			self.var_16e53a57 = self playloopsound(#"hash_2f0f235f7f6fc84d");
		}
		self.n_shock_eyes_fx = util::playfxontag(fieldname, #"hash_335e2bb9ccc18354", self, "J_Eyeball_LE");
		if(isdefined(self) && isdefined(self.n_shock_eyes_fx))
		{
			setfxignorepause(fieldname, self.n_shock_eyes_fx, 1);
		}
		self.n_shock_fx = util::playfxontag(fieldname, #"hash_43be23bab63afdc6", self, str_tag);
		if(isdefined(self) && isdefined(self.n_shock_eyes_fx))
		{
			setfxignorepause(fieldname, self.n_shock_fx, 1);
		}
	}
	else
	{
		if(isdefined(self.n_shock_eyes_fx))
		{
			deletefx(fieldname, self.n_shock_eyes_fx, 1);
			self.n_shock_eyes_fx = undefined;
		}
		if(isdefined(self.n_shock_fx))
		{
			deletefx(fieldname, self.n_shock_fx, 1);
			self.n_shock_fx = undefined;
		}
		if(isdefined(self.var_16e53a57))
		{
			self stoploopsound(self.var_16e53a57);
			self.var_16e53a57 = undefined;
		}
	}
}

