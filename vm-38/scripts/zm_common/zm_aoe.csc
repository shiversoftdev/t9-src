#using scripts\zm_common\load.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

class class_698343df 
{

	/*
		Name: constructor
		Namespace: namespace_698343df
		Checksum: 0x80F724D1
		Offset: 0x220
		Size: 0x4
		Parameters: 0
		Flags: Linked, 8, 16
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_698343df
		Checksum: 0x80F724D1
		Offset: 0x230
		Size: 0x4
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

}

#namespace zm_aoe;

/*
	Name: function_a8424abb
	Namespace: zm_aoe
	Checksum: 0x6B868AC2
	Offset: 0x1A8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a8424abb()
{
	level notify(-686672962);
}

/*
	Name: __init__system__
	Namespace: zm_aoe
	Checksum: 0x1AD2422A
	Offset: 0x1C8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_aoe", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_aoe
	Checksum: 0x1E76DEAC
	Offset: 0x2C8
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "aoe_state", 1, getminbitcountfornum(5), "int", &function_dcc24343, 0, 0);
	clientfield::register("scriptmover", "aoe_id", 1, getminbitcountfornum(2), "int", &function_6bcf2a61, 0, 0);
}

/*
	Name: function_8ac3bea9
	Namespace: zm_aoe
	Checksum: 0x255F17EE
	Offset: 0x388
	Size: 0x164
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	function_15dea507(1, "zm_aoe_spear", "zm_aoe_spear");
	function_15dea507(2, "zm_aoe_spear_small", "zm_aoe_spear_small");
	function_15dea507(3, "zm_aoe_spear_big", "zm_aoe_spear_big");
	function_15dea507(4, "zm_aoe_strafe_storm", "zm_aoe_strafe_storm");
	function_15dea507(5, "zm_aoe_chaos_bolt", "zm_aoe_chaos_bolt");
	function_15dea507(6, "zm_aoe_chaos_bolt_2", "zm_aoe_chaos_bolt_2");
	function_15dea507(7, "zm_aoe_chaos_bolt_annihilate", "zm_aoe_chaos_bolt_annihilate");
	function_15dea507(1, "zm_aoe_radiation_hazard", "zm_aoe_radiation_hazard");
	function_1b06433("zm_aoe_radiation_hazard", "zm_aoe_radiation_hazard_ieu_override");
}

/*
	Name: function_e969e75
	Namespace: zm_aoe
	Checksum: 0x3B886474
	Offset: 0x4F8
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e969e75(aoeid)
{
	/#
		assert(isdefined(level.var_400ae143));
	#/
	if(!isdefined(level.var_400ae143))
	{
		level.var_400ae143 = [];
	}
	foreach(var_46f1b5eb in level.var_400ae143)
	{
		/#
			assert(isdefined(var_46f1b5eb.aoeid));
		#/
		if(var_46f1b5eb.aoeid == aoeid)
		{
			return var_46f1b5eb;
		}
	}
	return undefined;
}

/*
	Name: function_15dea507
	Namespace: zm_aoe
	Checksum: 0xE49C6CD
	Offset: 0x600
	Size: 0x1D6
	Parameters: 3
	Flags: Linked
*/
function function_15dea507(aoeid, type, var_5ff737c1)
{
	/#
		assert(isdefined(var_5ff737c1));
	#/
	var_6ec6e01 = getscriptbundle(var_5ff737c1);
	if(!isdefined(var_6ec6e01))
	{
		return;
	}
	if(!isdefined(level.var_400ae143))
	{
		level.var_400ae143 = [];
	}
	arraykeys = getarraykeys(level.var_400ae143);
	/#
		assert(!isinarray(arraykeys, hash(type)));
	#/
	var_46f1b5eb = new class_698343df();
	level.var_400ae143[type] = var_46f1b5eb;
	var_46f1b5eb.startfx = var_6ec6e01.start_effect;
	var_46f1b5eb.endfx = var_6ec6e01.end_effect;
	var_46f1b5eb.loopfx = var_6ec6e01.loop_effect;
	var_46f1b5eb.startsound = var_6ec6e01.var_e41627fe;
	var_46f1b5eb.endsound = var_6ec6e01.var_99ec7d60;
	var_46f1b5eb.loopsound = var_6ec6e01.var_1ee49376;
	var_46f1b5eb.startrumble = var_6ec6e01.startrumble;
	var_46f1b5eb.endrumble = var_6ec6e01.endrumble;
	var_46f1b5eb.var_a8609f98 = var_6ec6e01.var_a8609f98;
	var_46f1b5eb.earthquakescale = var_6ec6e01.earthquakescale;
	var_46f1b5eb.var_e4c85a5f = var_6ec6e01.var_e4c85a5f;
	var_46f1b5eb.effectradius = var_6ec6e01.effectradius;
	var_46f1b5eb.aoeid = aoeid;
}

/*
	Name: function_1b06433
	Namespace: zm_aoe
	Checksum: 0x9844B945
	Offset: 0x7E0
	Size: 0xAE
	Parameters: 2
	Flags: Linked
*/
function function_1b06433(type, var_2badd710)
{
	/#
		assert(isdefined(var_2badd710));
	#/
	var_3d910b11 = getscriptbundle(var_2badd710);
	if(!isdefined(var_3d910b11))
	{
		return;
	}
	if(!isdefined(level.var_400ae143[type]))
	{
		return;
	}
	var_46f1b5eb = level.var_400ae143[type];
	var_46f1b5eb.var_3eb74948 = var_3d910b11.end_effect;
	var_46f1b5eb.var_8f85134 = var_3d910b11.var_99ec7d60;
}

/*
	Name: function_dcc24343
	Namespace: zm_aoe
	Checksum: 0xA3607A0C
	Offset: 0x898
	Size: 0x3FC
	Parameters: 7
	Flags: Linked, Private
*/
function private function_dcc24343(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(!isdefined(self.aoeid))
	{
		return;
	}
	player = function_5c10bd79(fieldname);
	aoeorigin = self.origin;
	distsq = distancesquared(player.origin, aoeorigin);
	var_46f1b5eb = function_e969e75(self.aoeid);
	if(!isdefined(var_46f1b5eb))
	{
		return;
	}
	if(bwastimejump == 1)
	{
		if(isdefined(var_46f1b5eb.startfx))
		{
			playfx(fieldname, var_46f1b5eb.startfx, self.origin, (0, 0, 1));
		}
		if(isdefined(var_46f1b5eb.startsound))
		{
			playsound(fieldname, var_46f1b5eb.startsound, self.origin);
		}
		if(isdefined(var_46f1b5eb.effectradius) && distsq <= sqr(var_46f1b5eb.effectradius))
		{
			if(isdefined(var_46f1b5eb.earthquakescale))
			{
				earthquake(fieldname, var_46f1b5eb.earthquakescale, var_46f1b5eb.var_e4c85a5f, self.origin, var_46f1b5eb.effectradius);
			}
			if(isdefined(var_46f1b5eb.startrumble))
			{
				function_36e4ebd4(fieldname, var_46f1b5eb.startrumble);
			}
		}
	}
	else
	{
		if(bwastimejump == 2)
		{
			if(isdefined(var_46f1b5eb.loopfx))
			{
				self.aoefx = playfx(fieldname, var_46f1b5eb.loopfx, self.origin, (0, 0, 1));
			}
			if(isdefined(var_46f1b5eb.loopsound))
			{
				self.var_e0952422 = self playloopsound(var_46f1b5eb.loopsound);
			}
		}
		else if(bwastimejump == 3 || bwastimejump == 4)
		{
			if(isdefined(self.aoefx))
			{
				stopfx(fieldname, self.aoefx);
			}
			if(isdefined(self.var_e0952422))
			{
				self stoploopsound(self.var_e0952422);
				self.var_e0952422 = undefined;
			}
			endfx = var_46f1b5eb.endfx;
			endsound = var_46f1b5eb.endsound;
			if(bwastimejump == 4)
			{
				endfx = var_46f1b5eb.var_3eb74948;
				endsound = var_46f1b5eb.var_8f85134;
			}
			if(isdefined(endfx))
			{
				playfx(fieldname, endfx, self.origin, (0, 0, 1));
			}
			if(isdefined(endsound))
			{
				playsound(fieldname, endsound, self.origin);
			}
			if(isdefined(var_46f1b5eb.effectradius) && distsq <= sqr(var_46f1b5eb.effectradius))
			{
				if(isdefined(var_46f1b5eb.endrumble))
				{
					function_36e4ebd4(fieldname, var_46f1b5eb.endrumble);
				}
			}
		}
	}
}

/*
	Name: function_6bcf2a61
	Namespace: zm_aoe
	Checksum: 0x4D5993E5
	Offset: 0xCA0
	Size: 0x4A
	Parameters: 7
	Flags: Linked, Private
*/
function private function_6bcf2a61(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.aoeid = bwastimejump;
}

