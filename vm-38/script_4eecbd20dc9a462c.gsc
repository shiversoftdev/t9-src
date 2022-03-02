#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_e8c18978;

/*
	Name: function_d86ff5b9
	Namespace: namespace_e8c18978
	Checksum: 0x7ED63492
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d86ff5b9()
{
	level notify(1898869657);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e8c18978
	Checksum: 0xBE181D5A
	Offset: 0x128
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function function_70a657d8(bundlename)
{
	clientfield::register("toplayer", "" + #"hash_7c907650b14abbbe", 1, 1, "int", &function_d3a9eef4, 0, 0);
	clientfield::register("vehicle", "" + #"hash_4ddf67f7aa0f6884", 1, 1, "int", &function_241229f1, 0, 0);
	clientfield::register("vehicle", "" + #"hash_46646871455cab15", 1, 2, "int", &function_1da732e, 0, 0);
	clientfield::register("vehicle", "" + #"hash_6cf1a3b26118d892", 1, 1, "int", &function_d6f6757c, 0, 0);
	level.var_f7dac9d2 = getscriptbundle("killstreak_chopper_gunner");
	if(!getdvarint(#"hash_4aad305a4a7f93db", 0))
	{
		level thread function_53e5abd3();
	}
}

/*
	Name: function_53e5abd3
	Namespace: namespace_e8c18978
	Checksum: 0xD466047A
	Offset: 0x2F8
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_53e5abd3()
{
	level endon(#"game_ended");
	wait(15);
	forcestreamxmodel(#"veh_t9_mil_us_helicopter_large_doors_rear_open_attach_chopper_gunner", 8, 1);
	forcestreamxmodel(#"veh_t9_mil_us_helicopter_large_doors_mid_attach", 8, 1);
	forcestreamxmodel(#"veh_t9_mil_us_helicopter_large_interior_attach", 8, 1);
	if(sessionmodeiszombiesgame())
	{
		forcestreamxmodel(#"veh_t9_mil_us_helicopter_large_right_gun_mount_attach", 8, 1);
	}
}

/*
	Name: function_d3a9eef4
	Namespace: namespace_e8c18978
	Checksum: 0x8665D1B4
	Offset: 0x3D8
	Size: 0x106
	Parameters: 7
	Flags: Linked
*/
function function_d3a9eef4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level.var_bb4264e3 = self;
	}
	else
	{
		if(isdefined(level.var_f7dac9d2.ksvehicleposteffectbun))
		{
			postfxbundle = level.var_f7dac9d2.ksvehicleposteffectbun;
			if(self function_d2cb869e(postfxbundle))
			{
				self codestoppostfxbundle(postfxbundle);
			}
		}
		if(isdefined(level.var_f7dac9d2.var_917dc7d4))
		{
			self stoprumble(fieldname, level.var_f7dac9d2.var_917dc7d4);
		}
		level.var_bb4264e3 = undefined;
	}
}

/*
	Name: function_241229f1
	Namespace: namespace_e8c18978
	Checksum: 0xA2F4E688
	Offset: 0x4E8
	Size: 0x1F4
	Parameters: 7
	Flags: Linked
*/
function function_241229f1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self util::waittill_dobj(fieldname);
		if(!isdefined(self))
		{
			return;
		}
		if(isdefined(level.var_bb4264e3))
		{
			self setsoundentcontext("plr_vehicle", "driver");
			level.var_bb4264e3 playrumblelooponentity(fieldname, #"hash_3c2b94894227f3cf");
			self thread scene::play(#"chopper_gunner_door_open_client");
			if(isdefined(level.var_f7dac9d2.ksvehicleposteffectbun))
			{
				postfxbundle = level.var_f7dac9d2.ksvehicleposteffectbun;
				level.var_bb4264e3 codeplaypostfxbundle(postfxbundle);
			}
		}
		self function_1f0c7136(2);
		self setanim(#"hash_7483c325182bab52");
		wait(getanimlength(#"hash_7483c325182bab52"));
		if(isdefined(level.var_bb4264e3))
		{
			level.var_bb4264e3 stoprumble(fieldname, #"hash_3c2b94894227f3cf");
		}
		if(isdefined(self))
		{
			self clearanim(#"hash_7483c325182bab52", 0.2);
		}
	}
}

/*
	Name: function_1da732e
	Namespace: namespace_e8c18978
	Checksum: 0xE36F1212
	Offset: 0x6E8
	Size: 0x2DC
	Parameters: 7
	Flags: Linked
*/
function function_1da732e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		alarm_sound = self gettagorigin("TAG_PROBE_COCKPIT");
		util::playfxontag(fieldname, level.var_f7dac9d2.var_24b7aa85, self, "tag_body");
		if(isdefined(level.var_bb4264e3))
		{
			if(isdefined(level.var_f7dac9d2.var_c6eb2a1d))
			{
				level.var_bb4264e3 playrumbleonentity(fieldname, level.var_f7dac9d2.var_c6eb2a1d);
			}
			level.var_bb4264e3 playsound(fieldname, #"hash_7b6b109a826f44cf");
			waitframe(1);
			if(isdefined(level.var_bb4264e3))
			{
				level.var_bb4264e3 playsound(fieldname, #"hash_733033c981df7144", alarm_sound);
			}
		}
		else
		{
			self playsound(fieldname, #"hash_2879bee00b0dbf87");
		}
	}
	else if(bwastimejump == 2)
	{
		alarm_sound = self gettagorigin("TAG_PROBE_COCKPIT");
		util::playfxontag(fieldname, level.var_f7dac9d2.var_8334e8e, self, "tag_body");
		if(isdefined(level.var_bb4264e3))
		{
			if(isdefined(level.var_f7dac9d2.var_c6eb2a1d))
			{
				level.var_bb4264e3 playrumbleonentity(fieldname, level.var_f7dac9d2.var_bf7c296c);
			}
			level.var_bb4264e3 playsound(fieldname, #"hash_7b6b119a826f4682");
			waitframe(1);
			if(isdefined(level.var_bb4264e3))
			{
				level.var_bb4264e3 playsound(fieldname, #"hash_733036c981df765d", alarm_sound);
			}
		}
		else
		{
			self playsound(fieldname, #"hash_331a5d0f62ba4e66");
		}
	}
}

/*
	Name: function_d6f6757c
	Namespace: namespace_e8c18978
	Checksum: 0x8A6D275E
	Offset: 0x9D0
	Size: 0x1B4
	Parameters: 7
	Flags: Linked
*/
function function_d6f6757c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(isdefined(level.var_bb4264e3))
		{
			util::playfxontag(fieldname, level.var_f7dac9d2.var_1d9da603, self, "tag_deathfx");
			level.var_bb4264e3 playsound(fieldname, #"hash_7b6b129a826f4835");
			if(isdefined(level.var_f7dac9d2.var_a97fd8e0))
			{
				level.var_bb4264e3 playrumbleonentity(fieldname, level.var_f7dac9d2.var_a97fd8e0);
			}
			if(isdefined(level.var_f7dac9d2.var_917dc7d4))
			{
				level.var_bb4264e3 playrumblelooponentity(fieldname, level.var_f7dac9d2.var_917dc7d4);
			}
		}
		else if(isdefined(level.var_f7dac9d2.var_2a77dc37))
		{
			util::playfxontag(fieldname, level.var_f7dac9d2.var_2a77dc37, self, "tag_deathfx");
			playsound(fieldname, #"hash_331a5d0f62ba4e66");
		}
	}
}

