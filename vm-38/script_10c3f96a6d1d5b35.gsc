#using script_14d2d89964cae0b1;
#using script_20055f2f97341caa;
#using script_311c446e3df6c3fa;
#using script_40e017336a087343;
#using script_5ee86fb478309acf;
#using script_7ae1d3c7bfe5070;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_score.csc;

#namespace namespace_e5670722;

/*
	Name: function_75dbb5bd
	Namespace: namespace_e5670722
	Checksum: 0xF7A5A9A1
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_75dbb5bd()
{
	level notify(682273577);
}

/*
	Name: init
	Namespace: namespace_e5670722
	Checksum: 0xC2716A73
	Offset: 0x128
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "" + #"hash_193cb3d6820f32c9", 28000, 1, "int", &function_3aea3305, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_b386e95b77069e4", 28000, 1, "int", &function_140c21d6, 0, 0);
}

/*
	Name: function_3aea3305
	Namespace: namespace_e5670722
	Checksum: 0x2F719C8C
	Offset: 0x1E8
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_3aea3305(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		var_3ddad43b = randomintrange(2, 4);
		for(i = 0; i < var_3ddad43b; i++)
		{
			if(isdefined(self))
			{
				v_pos = self.origin;
				playfx(fieldname, #"lensflares/fx9_lf_sniper_glint", v_pos + (anglestoup(self.angles) * 60));
				wait(randomfloatrange(0.5, 0.7));
			}
		}
	}
}

/*
	Name: function_140c21d6
	Namespace: namespace_e5670722
	Checksum: 0xBB3C34A4
	Offset: 0x300
	Size: 0x18C
	Parameters: 7
	Flags: Linked
*/
function function_140c21d6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		v_fx_offset = anglestoright(self.angles) * 3;
		var_9e6bf193 = vectorscale((-1, 0, 0), 90);
		self.fx_tag = util::spawn_model(fieldname, "tag_origin", self.origin + v_fx_offset, self.angles + var_9e6bf193);
		self.fx_tag linkto(self);
		self.fx_tag.var_c6cd7dce = util::playfxontag(fieldname, #"hash_1863acf2e22ff6ba", self.fx_tag, "tag_origin");
	}
	else if(isdefined(self.fx_tag.var_c6cd7dce))
	{
		killfx(fieldname, self.fx_tag.var_c6cd7dce);
		self.fx_tag.var_c6cd7dce = undefined;
		self.fx_tag delete();
	}
}

