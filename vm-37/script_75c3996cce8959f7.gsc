#using script_18910f59cc847b42;
#using script_1b2f6ef7778cf920;
#using script_30c7fb449869910;
#using script_3314b730521b9666;
#using script_38635d174016f682;
#using script_42cbbdcd1e160063;
#using script_4adf64e112e9afec;
#using script_64e5d3ad71ce8140;
#using script_67049b48b589d81;
#using script_6b71c9befed901f2;
#using script_71603a58e2da0698;
#using script_75c3996cce8959f7;
#using script_76abb7986de59601;
#using script_77163d5a569e2071;
#using script_771f5bff431d8d57;
#using script_7bf1bd99605135bf;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_7f5aeb59;

/*
	Name: function_f3143608
	Namespace: namespace_7f5aeb59
	Checksum: 0x8A17DB67
	Offset: 0x1C0
	Size: 0x564
	Parameters: 1
	Flags: Linked
*/
function function_f3143608(localclientnum)
{
	self endon(#"disconnect");
	self.doa = spawnstruct();
	self.topdowncamera = 1;
	self.doa.var_10752c35 = 1;
	self.doa.var_71122e79 = 0;
	self.doa.var_903d75b1 = undefined;
	self namespace_ac2a80f5::function_278f20a3(vectorscale((1, 0, 0), 75), namespace_ac2a80f5::function_ccf8a968(self.doa.var_10752c35));
	self.doa.var_25f4de97 = 0;
	self.skits = undefined;
	self.doa.var_3e81d24c = 0;
	self.entnum = self getentitynumber();
	self.var_88a2ff29 = level.var_30df1fad;
	self cameraforcedisablescriptcam(0);
	if(getlocalplayers().size > 1)
	{
		namespace_4dae815d::function_e1887b0f(1);
	}
	namespace_6e90e490::function_9c238883(self getentitynumber(), self getlocalclientnumber(), 0);
	self camerasetupdatecallback(&namespace_ac2a80f5::function_14f1aa2b);
	self function_4d692cc4(localclientnum, self.var_88a2ff29);
	self util::waittill_dobj(localclientnum);
	if(!isdefined(self))
	{
		return;
	}
	self.entnum = self getentitynumber();
	if(islocalplayer(self))
	{
		localclientnum = self getlocalclientnumber();
		if(isdefined(localclientnum))
		{
			self setcontrollerlightbarcolor(localclientnum, function_144f26b2(self.entnum));
		}
	}
	name = self getplayername();
	switch(self getentitynumber())
	{
		case 0:
		{
			setuimodelvalue(getuimodel(getuimodel(function_5f72e972(#"hash_365a974a1df27ef4"), "player1"), "playerName"), name);
			break;
		}
		case 1:
		{
			setuimodelvalue(getuimodel(getuimodel(function_5f72e972(#"hash_365a974a1df27ef4"), "player2"), "playerName"), name);
			break;
		}
		case 2:
		{
			setuimodelvalue(getuimodel(getuimodel(function_5f72e972(#"hash_365a974a1df27ef4"), "player3"), "playerName"), name);
			break;
		}
		case 3:
		{
			setuimodelvalue(getuimodel(getuimodel(function_5f72e972(#"hash_365a974a1df27ef4"), "player4"), "playerName"), name);
			break;
		}
	}
	name = "player_trail_" + function_7b9bc9ff(self.entnum);
	self thread namespace_83eb6304::function_f58618d7(localclientnum, name, 0, "tag_origin", 1);
	self thread namespace_ac2a80f5::function_57ce3201(localclientnum);
	if(islocalplayer(self) && is_true(level.doa.var_318aa67a))
	{
		namespace_b59ddbce::function_f32984d0(localclientnum, 0, 1);
	}
}

/*
	Name: function_144f26b2
	Namespace: namespace_7f5aeb59
	Checksum: 0x73913C49
	Offset: 0x730
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function function_144f26b2(entnum)
{
	if(!isdefined(entnum))
	{
		return (1, 1, 1);
	}
	switch(entnum)
	{
		case 0:
		{
			return (0, 1, 0);
		}
		case 1:
		{
			return (0, 0, 1);
		}
		case 2:
		{
			return (1, 0, 0);
		}
		case 3:
		{
			return (1, 1, 0);
		}
		default:
		{
			return (1, 1, 1);
		}
	}
}

/*
	Name: function_7b9bc9ff
	Namespace: namespace_7f5aeb59
	Checksum: 0x8B88BE40
	Offset: 0x7D8
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_7b9bc9ff(entnum)
{
	if(!isdefined(entnum))
	{
		return (1, 1, 1);
	}
	switch(entnum)
	{
		case 0:
		{
			return "green";
		}
		case 1:
		{
			return "blue";
		}
		case 2:
		{
			return "red";
		}
		case 3:
		{
			return "yellow";
		}
		default:
		{
			return "unk";
		}
	}
}

/*
	Name: function_fcc90081
	Namespace: namespace_7f5aeb59
	Checksum: 0xAE6568B1
	Offset: 0x890
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_fcc90081(var_45b95f80)
{
	if(!isdefined(self) || !isdefined(self.doa))
	{
		return;
	}
	self.skits = undefined;
	self.doa.var_10752c35 = 1;
	self.doa.var_71122e79 = 0;
	self.doa.var_903d75b1 = undefined;
	self.var_88a2ff29 = level.var_30df1fad;
	namespace_6e90e490::function_9c238883(self getentitynumber(), self getlocalclientnumber(), 0);
}

/*
	Name: function_4d692cc4
	Namespace: namespace_7f5aeb59
	Checksum: 0xEB16AEA3
	Offset: 0x948
	Size: 0x124
	Parameters: 2
	Flags: Linked
*/
function function_4d692cc4(localclientnum, mapping)
{
	if(!isdefined(mapping))
	{
		mapping = "zombietron";
	}
	/#
		loc_00000998:
		namespace_1e25ad94::debugmsg((((("" + (isdefined(self.name) ? self.name : "")) + "") + mapping) + "") + (islocalplayer(self) ? "" : ""));
	#/
	if(islocalplayer(self))
	{
		/#
			namespace_1e25ad94::debugmsg("" + localclientnum);
		#/
		forcegamemodemappings(localclientnum, mapping);
	}
	else
	{
		/#
			namespace_1e25ad94::debugmsg("");
		#/
	}
}

/*
	Name: islocalplayer
	Namespace: namespace_7f5aeb59
	Checksum: 0xC9B4F158
	Offset: 0xA78
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function islocalplayer(player)
{
	/#
		assert(isdefined(player), "");
	#/
	return isinarray(getlocalplayers(), player);
}

