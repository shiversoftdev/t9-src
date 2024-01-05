#using script_10f7bf5199723c91;
#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_6b71c9befed901f2;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_30c7fb449869910;
#using script_771f5bff431d8d57;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using scripts\core_common\struct.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_e32bb68;

/*
	Name: init
	Namespace: namespace_e32bb68
	Checksum: 0xBC85A624
	Offset: 0x170
	Size: 0x264
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "play_sfx", 1, 9, "int", &play_sfx, 0, 0);
	clientfield::register("allplayers", "play_sfx", 1, 9, "int", &play_sfx, 0, 0);
	clientfield::register("actor", "play_sfx", 1, 9, "int", &play_sfx, 0, 0);
	clientfield::register("vehicle", "play_sfx", 1, 9, "int", &play_sfx, 0, 0);
	clientfield::register("scriptmover", "stop_sfx", 1, 9, "int", &stop_sfx, 0, 0);
	clientfield::register("allplayers", "stop_sfx", 1, 9, "int", &stop_sfx, 0, 0);
	clientfield::register("actor", "stop_sfx", 1, 9, "int", &stop_sfx, 0, 0);
	clientfield::register("vehicle", "stop_sfx", 1, 9, "int", &stop_sfx, 0, 0);
	namespace_9bef0a98::function_fd4107e4();
	function_32d5e898();
}

/*
	Name: function_32d5e898
	Namespace: namespace_e32bb68
	Checksum: 0x7B571A60
	Offset: 0x3E0
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_32d5e898(localclientnum)
{
}

/*
	Name: play_sfx
	Namespace: namespace_e32bb68
	Checksum: 0x34EE3B07
	Offset: 0x3F8
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function play_sfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname != 0)
	{
		return;
	}
	if(bwastimejump != 0)
	{
		self function_fec92021(fieldname, bwastimejump, 0);
	}
}

/*
	Name: stop_sfx
	Namespace: namespace_e32bb68
	Checksum: 0xF58A6E06
	Offset: 0x478
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function stop_sfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname != 0)
	{
		return;
	}
	if(bwastimejump != 0)
	{
		self function_fec92021(fieldname, bwastimejump, 1);
	}
}

/*
	Name: function_c1e0cc87
	Namespace: namespace_e32bb68
	Checksum: 0x236014E6
	Offset: 0x4F8
	Size: 0xEC
	Parameters: 4
	Flags: Linked
*/
function function_c1e0cc87(name, looping, fadeout, unused)
{
	if(!isdefined(fadeout))
	{
		fadeout = 0;
	}
	if(!isdefined(unused))
	{
		unused = 0.5;
	}
	if(!isdefined(level.var_9e132ad0))
	{
		level.var_9e132ad0 = [];
	}
	var_318e5b78 = level.var_9e132ad0.size + 1;
	/#
		assert(var_318e5b78 < 512, "");
	#/
	level.var_9e132ad0[var_318e5b78] = {#fadeout:unused, #looping:fadeout, #name:looping};
}

/*
	Name: function_9585130f
	Namespace: namespace_e32bb68
	Checksum: 0xA530AE04
	Offset: 0x5F0
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_9585130f(type)
{
	/#
		assert(isdefined(level.var_9e132ad0[type]), "");
	#/
	return level.var_9e132ad0[type].name;
}

/*
	Name: function_4744227e
	Namespace: namespace_e32bb68
	Checksum: 0x7A9128E0
	Offset: 0x650
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_4744227e(type)
{
	/#
		assert(isdefined(level.var_9e132ad0[type]), "");
	#/
	return level.var_9e132ad0[type].looping;
}

/*
	Name: function_90ddbde4
	Namespace: namespace_e32bb68
	Checksum: 0x43504E12
	Offset: 0x6B0
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_90ddbde4(type)
{
	/#
		assert(isdefined(level.var_9e132ad0[type]), "");
	#/
	return level.var_9e132ad0[type].fadeout;
}

/*
	Name: function_fec92021
	Namespace: namespace_e32bb68
	Checksum: 0xFA3AB33D
	Offset: 0x710
	Size: 0x1CE
	Parameters: 3
	Flags: Linked
*/
function function_fec92021(localclientnum, type, off)
{
	if(localclientnum != 0)
	{
		return;
	}
	self endon(#"entityshutdown", #"death", #"disconnect");
	while(isdefined(self) && !clienthassnapshot(localclientnum))
	{
		waitframe(1);
	}
	self util::waittill_dobj(localclientnum);
	looping = function_4744227e(type);
	alias = function_9585130f(type);
	if(!off)
	{
		if(!looping)
		{
			self playsound(localclientnum, alias);
		}
		else
		{
			if(isdefined(self.var_d1354b88))
			{
				self stoploopsound(self.var_d1354b88, function_90ddbde4(type));
				self.var_d1354b88 = undefined;
			}
			self.var_d1354b88 = self playloopsound(alias);
		}
	}
	else if(looping && isdefined(self.var_d1354b88))
	{
		self stoploopsound(self.var_d1354b88, function_90ddbde4(type));
		self.var_d1354b88 = undefined;
	}
}

