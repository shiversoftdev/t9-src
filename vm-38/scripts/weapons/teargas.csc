#using scripts\core_common\util_shared.csc;
#using scripts\core_common\sound_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace teargas;

/*
	Name: function_13440ba9
	Namespace: teargas
	Checksum: 0xE3BBA61B
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_13440ba9()
{
	level notify(1807389435);
}

/*
	Name: init_shared
	Namespace: teargas
	Checksum: 0xE6492820
	Offset: 0xF0
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	clientfield::register("toplayer", "in_tear_gas", 1, 2, "int", &function_9810ebc, 0, 0);
}

/*
	Name: function_9810ebc
	Namespace: teargas
	Checksum: 0x11147709
	Offset: 0x148
	Size: 0x1FE
	Parameters: 7
	Flags: None
*/
function function_9810ebc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self notify(#"hash_75ccb6543bb805ed");
	self endon(#"death", #"hash_75ccb6543bb805ed");
	switch(bwastimejump)
	{
		case 1:
		{
			targetvalue = 0.25;
			break;
		}
		case 2:
		{
			targetvalue = 0.5;
			break;
		}
		case 3:
		{
			targetvalue = 0.8;
			break;
		}
		default:
		{
			targetvalue = 0;
			break;
		}
	}
	if(targetvalue != 0)
	{
		self notify(#"hash_59dc3b94303bbeac");
	}
	else
	{
		self notify(#"hash_71bef43cb9e9e9f4");
	}
	if(!isdefined(self.var_5316504e))
	{
		self.var_5316504e = 0;
	}
	while(!self function_d2cb869e(#"hash_26ffc556c5b45ab7"))
	{
		waitframe(1);
	}
	self util::lerp_generic(fieldname, 1000, &function_3b08d399, self.var_5316504e, targetvalue, "Reveal Threshold", #"hash_26ffc556c5b45ab7");
	if(targetvalue == 0)
	{
		self codestoppostfxbundle(#"hash_26ffc556c5b45ab7");
		self.var_5316504e = undefined;
	}
}

/*
	Name: function_3b08d399
	Namespace: teargas
	Checksum: 0x7A017367
	Offset: 0x350
	Size: 0xA4
	Parameters: 8
	Flags: None
*/
function function_3b08d399(currenttime, elapsedtime, localclientnum, duration, var_2347e08e, var_991d3376, constant, postfx)
{
	percent = localclientnum / duration;
	amount = (var_991d3376 * percent) + (var_2347e08e * (1 - percent));
	self.var_5316504e = amount;
	self function_116b95e5(postfx, constant, amount);
}

