#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_260f8380;

/*
	Name: function_89f2df9
	Namespace: namespace_260f8380
	Checksum: 0x6F0AA02D
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5cd88d9b0fb0d8ad", undefined, &function_64608eb3, undefined, undefined);
}

/*
	Name: function_64608eb3
	Namespace: namespace_260f8380
	Checksum: 0xFE8BCDF8
	Offset: 0x140
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_64608eb3()
{
	callback::on_localplayer_spawned(&start);
}

/*
	Name: start
	Namespace: namespace_260f8380
	Checksum: 0xEC3F4974
	Offset: 0x170
	Size: 0x184
	Parameters: 7
	Flags: Linked
*/
function start(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(function_72a9e321())
	{
		self.bundle = "pstfx_t9_cp_default";
	}
	else
	{
		self.bundle = "pstfx_t9_cp_current_gen";
	}
	self postfx::playpostfxbundle(self.bundle);
	self postfx::function_c8b5f318(self.bundle, "Vignette Fade", 0.5);
	self postfx::function_c8b5f318(self.bundle, "Reveal Threshold", 0.5);
	if(function_72a9e321())
	{
		self postfx::function_c8b5f318(self.bundle, "Blur Amount", 0.5);
		self postfx::function_c8b5f318(self.bundle, "Aberration", 0.5);
	}
	setdvar(#"hash_7633a587d5705d08", 1);
}

/*
	Name: stop
	Namespace: namespace_260f8380
	Checksum: 0x8F554A06
	Offset: 0x300
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function stop(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(postfx::function_556665f2(self.bundle))
	{
		self postfx::stoppostfxbundle(self.bundle);
	}
}

/*
	Name: function_d9475fc
	Namespace: namespace_260f8380
	Checksum: 0x36BD22DE
	Offset: 0x380
	Size: 0x124
	Parameters: 4
	Flags: Linked
*/
function function_d9475fc(var_dccfb95, blur_amount, var_72bbca87, var_a7207c52)
{
	if(!postfx::function_556665f2(self.bundle))
	{
		waitframe(1);
	}
	if(isdefined(var_dccfb95))
	{
		self postfx::function_c8b5f318(self.bundle, "Vignette Fade", var_dccfb95);
	}
	if(isdefined(blur_amount) && function_72a9e321())
	{
		self postfx::function_c8b5f318(self.bundle, "Blur Amount", blur_amount);
	}
	if(isdefined(var_72bbca87) && function_72a9e321())
	{
		self postfx::function_c8b5f318(self.bundle, "Aberration", var_72bbca87);
	}
	if(isdefined(var_a7207c52))
	{
		self postfx::function_c8b5f318(self.bundle, "Reveal Threshold", var_a7207c52);
	}
}

