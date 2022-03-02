#using script_218f57fb32d9325b;
#using script_3aa0f32b70d4f7cb;
#using script_6809bf766eba194a;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\math_shared.gsc;

#namespace archetype_cover_utility;

/*
	Name: function_a9cd911d
	Namespace: archetype_cover_utility
	Checksum: 0x3E18F3F1
	Offset: 0x280
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a9cd911d()
{
	level notify(743537958);
}

#namespace aiutility;

/*
	Name: registerbehaviorscriptfunctions
	Namespace: aiutility
	Checksum: 0xC10FA4E6
	Offset: 0x2A0
	Size: 0x10AC
	Parameters: 0
	Flags: AutoExec
*/
function autoexec registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&isatcrouchnode));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"isatcrouchnode", &isatcrouchnode);
	/#
		assert(isscriptfunctionptr(&function_1d3ee45b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5f2632e56b895b62", &function_1d3ee45b);
	/#
		assert(isscriptfunctionptr(&function_3fe92ec8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6139d3f7c5a6dcb4", &function_3fe92ec8);
	/#
		assert(iscodefunctionptr(&btapi_isatcovercondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_isatcovercondition", &btapi_isatcovercondition);
	/#
		assert(isscriptfunctionptr(&function_94bbbfa3));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_42946f41bb05517f", &function_94bbbfa3);
	/#
		assert(isscriptfunctionptr(&function_454e951f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5b793ac83d51d030", &function_454e951f);
	/#
		assert(isscriptfunctionptr(&isatcoverstrictcondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"isatcoverstrictcondition", &isatcoverstrictcondition);
	/#
		assert(isscriptfunctionptr(&isatcovermodeover));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"isatcovermodeover", &isatcovermodeover);
	/#
		assert(isscriptfunctionptr(&isatcovermodenone));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"isatcovermodenone", &isatcovermodenone);
	/#
		assert(isscriptfunctionptr(&function_d18f7e29));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6f3930f6d8ab6bea", &function_d18f7e29);
	/#
		assert(isscriptfunctionptr(&keepclaimednodeandchoosecoverdirection));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"keepclaimednodeandchoosecoverdirection", &keepclaimednodeandchoosecoverdirection);
	/#
		assert(isscriptfunctionptr(&resetcoverparameters));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"resetcoverparameters", &resetcoverparameters);
	/#
		assert(isscriptfunctionptr(&cleanupcovermode));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"cleanupcovermode", &cleanupcovermode);
	/#
		assert(isscriptfunctionptr(&shouldcoveridleonly));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldcoveridleonly", &shouldcoveridleonly);
	/#
		assert(isscriptfunctionptr(&issuppressedatcovercondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"issuppressedatcovercondition", &issuppressedatcovercondition);
	/#
		assert(isscriptfunctionptr(&function_5d963944));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_60d82d9556b0acbd", &function_5d963944);
	/#
		assert(isscriptfunctionptr(&function_af89626a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_18e7de5d241af663", &function_af89626a);
	/#
		assert(isscriptfunctionptr(&coveridleinitialize));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coveridleinitialize", &coveridleinitialize);
	/#
		assert(iscodefunctionptr(&btapi_coveridleupdate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"btapi_coveridleupdate", &btapi_coveridleupdate);
	/#
		assert(isscriptfunctionptr(&coveridleterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coveridleterminate", &coveridleterminate);
	/#
		assert(isscriptfunctionptr(&supportsovercovercondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"supportsovercovercondition", &supportsovercovercondition);
	/#
		assert(isscriptfunctionptr(&shouldoveratcovercondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldoveratcovercondition", &shouldoveratcovercondition);
	/#
		assert(isscriptfunctionptr(&function_74e272f2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2fd631156a51cc06", &function_74e272f2);
	/#
		assert(isscriptfunctionptr(&function_2b201dbe));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_66501b5b5629a24f", &function_2b201dbe);
	/#
		assert(isscriptfunctionptr(&coveroverinitialize));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coveroverinitialize", &coveroverinitialize);
	/#
		assert(isscriptfunctionptr(&function_2f4d2a0a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_194073d411274903", &function_2f4d2a0a);
	/#
		assert(isscriptfunctionptr(&coveroverterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coveroverterminate", &coveroverterminate);
	/#
		assert(isscriptfunctionptr(&function_b605a3b2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_58ddf57d938c96a6", &function_b605a3b2);
	/#
		assert(isscriptfunctionptr(&supportsleancovercondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"supportsleancovercondition", &supportsleancovercondition);
	/#
		assert(isscriptfunctionptr(&shouldleanatcovercondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"shouldleanatcovercondition", &shouldleanatcovercondition);
	/#
		assert(isscriptfunctionptr(&function_5d1688a6));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3bcae642a03335e8", &function_5d1688a6);
	/#
		assert(isscriptfunctionptr(&continueleaningatcovercondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"continueleaningatcovercondition", &continueleaningatcovercondition);
	/#
		assert(isscriptfunctionptr(&coverleaninitialize));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverleaninitialize", &coverleaninitialize);
	/#
		assert(isscriptfunctionptr(&function_bbe42083));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4d634385ba6c9d69", &function_bbe42083);
	/#
		assert(isscriptfunctionptr(&coverleanterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverleanterminate", &coverleanterminate);
	/#
		assert(isscriptfunctionptr(&function_9e5575be));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_72e14fa3a8f112e4", &function_9e5575be);
	/#
		assert(isscriptfunctionptr(&supportspeekcovercondition));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"supportspeekcovercondition", &supportspeekcovercondition);
	/#
		assert(isscriptfunctionptr(&coverpeekinitialize));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverpeekinitialize", &coverpeekinitialize);
	/#
		assert(isscriptfunctionptr(&coverpeekterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverpeekterminate", &coverpeekterminate);
	/#
		assert(isscriptfunctionptr(&coverreloadinitialize));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"coverreloadinitialize", &coverreloadinitialize);
	/#
		assert(isscriptfunctionptr(&function_6c5a8f1e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_52e41eb7d054eea4", &function_6c5a8f1e);
}

/*
	Name: coverreloadinitialize
	Namespace: aiutility
	Checksum: 0x7F3F37A2
	Offset: 0x1358
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private coverreloadinitialize(entity)
{
	entity setblackboardattribute("_cover_mode", "cover_alert");
	keepclaimnode(entity);
	function_43a090a8(entity);
}

/*
	Name: function_6c5a8f1e
	Namespace: aiutility
	Checksum: 0x7B7378
	Offset: 0x13C8
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6c5a8f1e(entity)
{
	if(isalive(entity))
	{
		function_dc44803c(entity);
	}
	releaseclaimnode(entity);
	cleanupcovermode(entity);
}

/*
	Name: supportspeekcovercondition
	Namespace: aiutility
	Checksum: 0xE7521BC1
	Offset: 0x1440
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private supportspeekcovercondition(entity)
{
	if(entity ai::get_behavior_attribute("disablepeek"))
	{
		return 0;
	}
	return isdefined(entity.node);
}

/*
	Name: coverpeekinitialize
	Namespace: aiutility
	Checksum: 0xA300CAC0
	Offset: 0x1488
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private coverpeekinitialize(entity)
{
	entity setblackboardattribute("_cover_mode", "cover_alert");
	keepclaimnode(entity);
	choosecoverdirection(entity);
}

/*
	Name: coverpeekterminate
	Namespace: aiutility
	Checksum: 0x17116F2A
	Offset: 0x14F8
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private coverpeekterminate(entity)
{
	choosefrontcoverdirection(entity);
	cleanupcovermode(entity);
	entity.var_fcadfdcd = gettime();
}

/*
	Name: supportsleancovercondition
	Namespace: aiutility
	Checksum: 0x65FB6F52
	Offset: 0x1548
	Size: 0x144
	Parameters: 1
	Flags: Linked, Private
*/
function private supportsleancovercondition(entity)
{
	if(entity ai::get_behavior_attribute("disablelean"))
	{
		return false;
	}
	if(isdefined(entity.node))
	{
		if(entity.node.type == #"hash_63cbb4767da2a801" || entity.node.type == #"hash_2a7b1ca393696762")
		{
			return true;
		}
		if(entity.node.type == #"hash_7a0e62fbbe3989d4")
		{
			if(!(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024) || (!(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048)))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: shouldleanatcovercondition
	Namespace: aiutility
	Checksum: 0x3B2E8456
	Offset: 0x1698
	Size: 0x312
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldleanatcovercondition(entity)
{
	if(!isdefined(entity.node) || !isdefined(entity.node.type) || !isdefined(entity.enemy) || !isdefined(entity.enemy.origin))
	{
		return 0;
	}
	legalaim = 0;
	if(entity.node.type == #"hash_63cbb4767da2a801")
	{
		if(!(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 4) == 4))
		{
			legalaim = function_cfe04a8d(entity, "cover_left_crouch_lean");
		}
		else
		{
			legalaim = function_cfe04a8d(entity, "cover_left_lean");
		}
	}
	else
	{
		if(entity.node.type == #"hash_2a7b1ca393696762")
		{
			if(!(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 4) == 4))
			{
				legalaim = function_cfe04a8d(entity, "cover_right_crouch_lean");
			}
			else
			{
				legalaim = function_cfe04a8d(entity, "cover_right_lean");
			}
		}
		else if(entity.node.type == #"hash_7a0e62fbbe3989d4")
		{
			supportsleft = !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024);
			supportsright = !(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048);
			angleleeway = 10;
			if(supportsright && supportsleft)
			{
				angleleeway = 0;
			}
			if(!legalaim && supportsleft)
			{
				legalaim = function_cfe04a8d(entity, "pillar_left_lean", undefined, angleleeway);
			}
			if(!legalaim && supportsright)
			{
				legalaim = function_cfe04a8d(entity, "pillar_right_lean", angleleeway, undefined);
			}
		}
	}
	return legalaim;
}

/*
	Name: function_5d1688a6
	Namespace: aiutility
	Checksum: 0xD2F21D31
	Offset: 0x19B8
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5d1688a6(entity)
{
	if(!supportsleancovercondition(entity))
	{
		return false;
	}
	if(!shouldleanatcovercondition(entity))
	{
		return false;
	}
	return true;
}

/*
	Name: continueleaningatcovercondition
	Namespace: aiutility
	Checksum: 0x1A878FCB
	Offset: 0x1A08
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private continueleaningatcovercondition(entity)
{
	if(entity asmistransitionrunning())
	{
		return 1;
	}
	return shouldleanatcovercondition(entity);
}

/*
	Name: coverleaninitialize
	Namespace: aiutility
	Checksum: 0xA821E140
	Offset: 0x1A58
	Size: 0xAE
	Parameters: 1
	Flags: Linked, Private
*/
function private coverleaninitialize(entity)
{
	setcovershootstarttime(entity);
	thread function_4ec57157(entity);
	keepclaimnode(entity);
	entity setblackboardattribute("_cover_mode", "cover_lean");
	choosecoverdirection(entity);
	entity.var_1a0b2452 = 0;
	entity.var_a4f84a7f = entity.lastshottime;
}

/*
	Name: function_bbe42083
	Namespace: aiutility
	Checksum: 0xC5073BA3
	Offset: 0x1B10
	Size: 0xDE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bbe42083(entity)
{
	if(entity asmistransitionrunning())
	{
		return;
	}
	if(entity.lastshottime > entity.var_a4f84a7f)
	{
		entity.var_1a0b2452 = 0;
		entity.var_a4f84a7f = entity.lastshottime;
	}
	if(isdefined(entity.enemy) && entity cansee(entity.enemy))
	{
		entity.var_1a0b2452 = entity.var_1a0b2452 + 0.05;
	}
	else
	{
		entity.var_1a0b2452 = 0;
	}
	if(entity.var_1a0b2452 >= 5)
	{
		entity.nextfindbestcovertime = gettime();
		entity.var_1a0b2452 = 0;
	}
}

/*
	Name: coverleanterminate
	Namespace: aiutility
	Checksum: 0x5980DD22
	Offset: 0x1BF8
	Size: 0x6A
	Parameters: 1
	Flags: Linked, Private
*/
function private coverleanterminate(entity)
{
	choosefrontcoverdirection(entity);
	cleanupcovermode(entity);
	clearcovershootstarttime(entity);
	entity.var_1a0b2452 = undefined;
	entity.var_a4f84a7f = undefined;
}

/*
	Name: function_9e5575be
	Namespace: aiutility
	Checksum: 0x1918E46B
	Offset: 0x1C70
	Size: 0x76
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9e5575be(entity)
{
	choosefrontcoverdirection(entity);
	cleanupcovermode(entity);
	clearcovershootstarttime(entity);
	entity ai::gun_recall();
	entity.blockingpain = 0;
}

/*
	Name: supportsovercovercondition
	Namespace: aiutility
	Checksum: 0xAB731993
	Offset: 0x1CF0
	Size: 0x23C
	Parameters: 1
	Flags: Linked, Private
*/
function private supportsovercovercondition(entity)
{
	if(entity ai::get_behavior_attribute("disablelean"))
	{
		return false;
	}
	stance = entity getblackboardattribute("_stance");
	if(isdefined(entity.node))
	{
		if(entity.node.type == #"hash_171465527444ed14" || entity.node.type == #"hash_1bb444d857814e92")
		{
			return true;
		}
		if(!isinarray(getvalidcoverpeekouts(entity.node), "over"))
		{
			return false;
		}
		if(entity.node.type == #"hash_63cbb4767da2a801" || entity.node.type == #"hash_2a7b1ca393696762" || (entity.node.type == #"hash_6d8019ab9d39bf96" || entity.node.type == #"hash_280d1247a6abdbae" || entity.node.type == #"hash_171465527444ed14"))
		{
			if(stance == "crouch")
			{
				return true;
			}
		}
		else if(entity.node.type == #"hash_581529fff05853f0" || entity.node.type == #"hash_1bb444d857814e92")
		{
			if(stance == "stand")
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: shouldoveratcovercondition
	Namespace: aiutility
	Checksum: 0xCD13A2BC
	Offset: 0x1F38
	Size: 0xBA
	Parameters: 1
	Flags: Linked, Private
*/
function private shouldoveratcovercondition(entity)
{
	if(!isdefined(entity.node) || !isdefined(entity.node.type) || !isdefined(entity.enemy) || !isdefined(entity.enemy.origin))
	{
		return 0;
	}
	aimtable = (iscoverconcealed(entity.node) ? "cover_concealed_over" : "cover_over");
	return function_cfe04a8d(entity, aimtable);
}

/*
	Name: function_74e272f2
	Namespace: aiutility
	Checksum: 0x48E8D674
	Offset: 0x2000
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_74e272f2(entity)
{
	if(!supportsovercovercondition(entity))
	{
		return false;
	}
	if(!shouldoveratcovercondition(entity))
	{
		return false;
	}
	return true;
}

/*
	Name: function_2b201dbe
	Namespace: aiutility
	Checksum: 0x65762CAC
	Offset: 0x2050
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2b201dbe(entity)
{
	if(entity asmistransitionrunning())
	{
		return 1;
	}
	return shouldoveratcovercondition(entity);
}

/*
	Name: coveroverinitialize
	Namespace: aiutility
	Checksum: 0x428FB56B
	Offset: 0x20A0
	Size: 0x96
	Parameters: 1
	Flags: Linked, Private
*/
function private coveroverinitialize(entity)
{
	setcovershootstarttime(entity);
	thread function_4ec57157(entity);
	keepclaimnode(entity);
	entity setblackboardattribute("_cover_mode", "cover_over");
	entity.var_d9884655 = 0;
	entity.var_a4f84a7f = entity.lastshottime;
}

/*
	Name: function_2f4d2a0a
	Namespace: aiutility
	Checksum: 0x1E17794C
	Offset: 0x2140
	Size: 0xDE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2f4d2a0a(entity)
{
	if(entity asmistransitionrunning())
	{
		return;
	}
	if(entity.lastshottime > entity.var_a4f84a7f)
	{
		entity.var_d9884655 = 0;
		entity.var_a4f84a7f = entity.lastshottime;
	}
	if(isdefined(entity.enemy) && entity cansee(entity.enemy))
	{
		entity.var_d9884655 = entity.var_d9884655 + 0.05;
	}
	else
	{
		entity.var_d9884655 = 0;
	}
	if(entity.var_d9884655 >= 5)
	{
		entity.nextfindbestcovertime = gettime();
		entity.var_1a0b2452 = 0;
	}
}

/*
	Name: coveroverterminate
	Namespace: aiutility
	Checksum: 0x5D0EF7F9
	Offset: 0x2228
	Size: 0x52
	Parameters: 1
	Flags: Linked, Private
*/
function private coveroverterminate(entity)
{
	cleanupcovermode(entity);
	clearcovershootstarttime(entity);
	entity.var_d9884655 = undefined;
	entity.var_a4f84a7f = undefined;
}

/*
	Name: function_b605a3b2
	Namespace: aiutility
	Checksum: 0x987456B
	Offset: 0x2288
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b605a3b2(entity)
{
	coveroverterminate(entity);
	entity ai::gun_recall();
	entity.blockingpain = 0;
}

/*
	Name: function_af89626a
	Namespace: aiutility
	Checksum: 0x3D360CE
	Offset: 0x22D8
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_af89626a(entity)
{
	return entity.var_ca9e83c;
}

/*
	Name: coveridleinitialize
	Namespace: aiutility
	Checksum: 0xF85A5DD9
	Offset: 0x22F8
	Size: 0x152
	Parameters: 1
	Flags: Linked, Private
*/
function private coveridleinitialize(entity)
{
	keepclaimnode(entity);
	entity setblackboardattribute("_cover_mode", "cover_alert");
	entity.var_ca9e83c = 2000;
	curtime = gettime();
	if(curtime == entity.var_79f94433)
	{
		var_ba66de3a = 500;
		var_d9320090 = 2000;
		if(isdefined(entity.ai.var_ba66de3a))
		{
			var_ba66de3a = entity.ai.var_ba66de3a;
		}
		if(isdefined(entity.ai.var_d9320090))
		{
			var_d9320090 = entity.ai.var_d9320090;
		}
		entity.var_ca9e83c = randomintrange(var_ba66de3a, var_d9320090);
	}
	if(isdefined(entity.var_fcadfdcd) && curtime == entity.var_fcadfdcd)
	{
		entity.var_ca9e83c = randomintrange(500, 2000);
	}
}

/*
	Name: coveridleterminate
	Namespace: aiutility
	Checksum: 0x463986CF
	Offset: 0x2458
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private coveridleterminate(entity)
{
	releaseclaimnode(entity);
	cleanupcovermode(entity);
	entity.var_3afb60bf = undefined;
}

/*
	Name: isatcrouchnode
	Namespace: aiutility
	Checksum: 0xC9B4182E
	Offset: 0x24A8
	Size: 0x128
	Parameters: 1
	Flags: Linked
*/
function isatcrouchnode(entity)
{
	if(isdefined(entity.node) && (entity.node.type == #"exposed" || entity.node.type == #"guard" || entity.node.type == #"path"))
	{
		if(distancesquared(entity.origin, entity.node.origin) <= sqr(24))
		{
			return !entity function_c97b59f8("stand", entity.node) && entity function_c97b59f8("crouch", entity.node);
		}
	}
	return 0;
}

/*
	Name: function_1d3ee45b
	Namespace: aiutility
	Checksum: 0xC1F0DE33
	Offset: 0x25D8
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function function_1d3ee45b(entity)
{
	if(isdefined(entity.node) && (entity.node.type == #"exposed" || entity.node.type == #"guard" || entity.node.type == #"path"))
	{
		if(distancesquared(entity.origin, entity.node.origin) <= sqr(24))
		{
			return !entity function_c97b59f8("stand", entity.node) && !entity function_c97b59f8("crouch", entity.node) && entity function_c97b59f8("prone", entity.node);
		}
	}
	return 0;
}

/*
	Name: function_3fe92ec8
	Namespace: aiutility
	Checksum: 0x897FFF89
	Offset: 0x2738
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function function_3fe92ec8(entity)
{
	if(isdefined(entity.enemy))
	{
		deltayaw = entity bb_actorgettrackingturnyaw();
	}
	else
	{
		deltayaw = entity bb_getyawtocovernode();
	}
	var_18a7cba2 = absangleclamp180(deltayaw);
	if(var_18a7cba2 > 45)
	{
		return false;
	}
	return true;
}

/*
	Name: function_94bbbfa3
	Namespace: aiutility
	Checksum: 0x5A5B8B5A
	Offset: 0x27D0
	Size: 0x154
	Parameters: 1
	Flags: Linked, Private
*/
function private function_94bbbfa3(entity)
{
	if(!btapi_isatcovercondition(entity))
	{
		if(entity isatcovernodestrict() && is_true(entity.var_b8cc25c))
		{
			if(entity asmistransitionrunning())
			{
				return true;
			}
			if(archetype_human_cover::function_1fa73a96(entity))
			{
				return true;
			}
			if(is_true(entity.ai.reloading) && !btapi_shouldmelee(entity))
			{
				return true;
			}
			if(isdefined(entity.var_f13fb34f) && (gettime() - entity.var_f13fb34f) < 3000)
			{
				if(distancesquared(entity.origin, entity.var_39226de1) < sqr(32))
				{
					return true;
				}
			}
		}
		return false;
	}
	return true;
}

/*
	Name: function_454e951f
	Namespace: aiutility
	Checksum: 0x5878874A
	Offset: 0x2930
	Size: 0x5A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_454e951f(entity)
{
	if(entity isatcovernodestrict())
	{
		entity.var_342553bc = 0;
		entity.var_b8cc25c = 1;
		entity.var_541abeb7 = gettime();
		entity.var_99d0daef = entity.origin;
	}
}

/*
	Name: isatcoverstrictcondition
	Namespace: aiutility
	Checksum: 0xBA1F58A4
	Offset: 0x2998
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function isatcoverstrictcondition(entity)
{
	return entity isatcovernodestrict() && !entity haspath();
}

/*
	Name: isatcovermodeover
	Namespace: aiutility
	Checksum: 0x831FF871
	Offset: 0x29E0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function isatcovermodeover(entity)
{
	covermode = entity getblackboardattribute("_cover_mode");
	return covermode == "cover_over";
}

/*
	Name: isatcovermodenone
	Namespace: aiutility
	Checksum: 0xA3B60F86
	Offset: 0x2A30
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function isatcovermodenone(entity)
{
	covermode = entity getblackboardattribute("_cover_mode");
	return covermode == "cover_mode_none";
}

/*
	Name: function_d18f7e29
	Namespace: aiutility
	Checksum: 0x734DBEF8
	Offset: 0x2A80
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_d18f7e29(entity)
{
	if(entity.node.type == #"hash_581529fff05853f0" || entity.node.type == #"hash_1bb444d857814e92")
	{
		covermode = entity getblackboardattribute("_cover_mode");
		if(covermode == "cover_over")
		{
			return true;
		}
	}
	return false;
}

/*
	Name: isexposedatcovercondition
	Namespace: aiutility
	Checksum: 0x81460A9B
	Offset: 0x2B20
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function isexposedatcovercondition(entity)
{
	return isatcoverstrictcondition(entity) && !entity shouldusecovernode();
}

/*
	Name: function_bd4a2ff7
	Namespace: aiutility
	Checksum: 0xE365B865
	Offset: 0x2B68
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_bd4a2ff7(entity)
{
	return isatcoverstrictcondition(entity) && entity shouldusecovernode();
}

/*
	Name: shouldcoveridleonly
	Namespace: aiutility
	Checksum: 0xFD1162F7
	Offset: 0x2BB0
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function shouldcoveridleonly(entity)
{
	if(entity ai::get_behavior_attribute("coverIdleOnly"))
	{
		return true;
	}
	if(is_true(entity.node.script_onlyidle))
	{
		return true;
	}
	return false;
}

/*
	Name: issuppressedatcovercondition
	Namespace: aiutility
	Checksum: 0x745D7D3
	Offset: 0x2C18
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function issuppressedatcovercondition(entity)
{
	if(entity.suppressionmeter > entity.var_4a68f84b)
	{
		return true;
	}
	return false;
}

/*
	Name: function_5d963944
	Namespace: aiutility
	Checksum: 0x5912C7D6
	Offset: 0x2C50
	Size: 0x10
	Parameters: 1
	Flags: Linked
*/
function function_5d963944(entity)
{
	return true;
}

/*
	Name: keepclaimednodeandchoosecoverdirection
	Namespace: aiutility
	Checksum: 0xA543997D
	Offset: 0x2C68
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function keepclaimednodeandchoosecoverdirection(entity)
{
	keepclaimnode(entity);
	choosecoverdirection(entity);
}

/*
	Name: resetcoverparameters
	Namespace: aiutility
	Checksum: 0x67239C46
	Offset: 0x2CB0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function resetcoverparameters(entity)
{
	choosefrontcoverdirection(entity);
	cleanupcovermode(entity);
	clearcovershootstarttime(entity);
}

/*
	Name: choosecoverdirection
	Namespace: aiutility
	Checksum: 0xC4357123
	Offset: 0x2D10
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function choosecoverdirection(entity, stepout)
{
	if(!isdefined(entity.node))
	{
		return;
	}
	coverdirection = entity getblackboardattribute("_cover_direction");
	entity setblackboardattribute("_previous_cover_direction", coverdirection);
	entity setblackboardattribute("_cover_direction", calculatecoverdirection(entity, stepout));
}

/*
	Name: function_f6d48a6a
	Namespace: aiutility
	Checksum: 0x3B2FC7EC
	Offset: 0x2DB8
	Size: 0x13A
	Parameters: 1
	Flags: Linked
*/
function function_f6d48a6a(entity)
{
	if(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 1024) == 1024)
	{
		return "cover_right_direction";
	}
	if(isdefined(entity.node.spawnflags) && (entity.node.spawnflags & 2048) == 2048)
	{
		return "cover_left_direction";
	}
	if(isdefined(entity.enemy))
	{
		aimlimits = entity getaimlimitsfromentry("pillar_right_lean");
		if(function_1587e509(entity, aimlimits, 0, undefined))
		{
			return "cover_right_direction";
		}
		return "cover_left_direction";
	}
	return array::random([1:"cover_right_direction", 0:"cover_left_direction"]);
}

/*
	Name: calculatecoverdirection
	Namespace: aiutility
	Checksum: 0xAB18445C
	Offset: 0x2F08
	Size: 0x1D2
	Parameters: 2
	Flags: Linked
*/
function calculatecoverdirection(entity, stepout)
{
	if(isdefined(entity.treatallcoversasgeneric))
	{
		if(!isdefined(stepout))
		{
			stepout = 0;
		}
		coverdirection = "cover_front_direction";
		if(entity.node.type == #"hash_63cbb4767da2a801")
		{
			if(entity function_c97b59f8("stand", entity.node) || math::cointoss() || stepout)
			{
				coverdirection = "cover_left_direction";
			}
		}
		else
		{
			if(entity.node.type == #"hash_2a7b1ca393696762")
			{
				if(entity function_c97b59f8("stand", entity.node) || math::cointoss() || stepout)
				{
					coverdirection = "cover_right_direction";
				}
			}
			else if(entity.node.type == #"hash_7a0e62fbbe3989d4")
			{
				coverdirection = function_f6d48a6a(entity);
			}
		}
		return coverdirection;
	}
	coverdirection = "cover_front_direction";
	if(entity.node.type == #"hash_7a0e62fbbe3989d4")
	{
		coverdirection = function_f6d48a6a(entity);
	}
	return coverdirection;
}

/*
	Name: clearcovershootstarttime
	Namespace: aiutility
	Checksum: 0x842215ED
	Offset: 0x30E8
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function clearcovershootstarttime(entity)
{
	entity.covershootstarttime = undefined;
}

/*
	Name: setcovershootstarttime
	Namespace: aiutility
	Checksum: 0x2FCA8BDF
	Offset: 0x3108
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function setcovershootstarttime(entity)
{
	entity.covershootstarttime = gettime();
}

/*
	Name: function_4ec57157
	Namespace: aiutility
	Checksum: 0xED5E7217
	Offset: 0x3128
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_4ec57157(entity)
{
	self notify("3287649832d04dd9");
	self endon("3287649832d04dd9");
	entity endon(#"death");
	starttime = gettime();
	while(!entity asmistransitionrunning())
	{
		if(gettime() - starttime > 5000)
		{
			return;
		}
		wait(0.05);
	}
	starttime = gettime();
	while(entity asmistransitionrunning())
	{
		if(gettime() - starttime > 5000)
		{
			return;
		}
		wait(0.05);
	}
	wait(0.25);
	entity.var_5aff3a1d = 0;
	entity.var_5fd4f34e = 0;
}

/*
	Name: canbeflanked
	Namespace: aiutility
	Checksum: 0x9DBF23AC
	Offset: 0x3208
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function canbeflanked(entity)
{
	return isdefined(entity.canbeflanked) && entity.canbeflanked;
}

/*
	Name: setcanbeflanked
	Namespace: aiutility
	Checksum: 0xC3C2D1E2
	Offset: 0x3238
	Size: 0x22
	Parameters: 2
	Flags: Linked
*/
function setcanbeflanked(entity, canbeflanked)
{
	entity.canbeflanked = canbeflanked;
}

/*
	Name: cleanupcovermode
	Namespace: aiutility
	Checksum: 0x6745E833
	Offset: 0x3268
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function cleanupcovermode(entity)
{
	if(btapi_isatcovercondition(entity))
	{
		covermode = entity getblackboardattribute("_cover_mode");
		entity setblackboardattribute("_previous_cover_mode", covermode);
		entity setblackboardattribute("_cover_mode", "cover_mode_none");
	}
	else
	{
		entity setblackboardattribute("_previous_cover_mode", "cover_mode_none");
		entity setblackboardattribute("_cover_mode", "cover_mode_none");
	}
}

/*
	Name: function_1587e509
	Namespace: aiutility
	Checksum: 0x1BE8D6A8
	Offset: 0x3358
	Size: 0xFA
	Parameters: 4
	Flags: Linked, Private
*/
function private function_1587e509(entity, aimlimits, var_b0b60311, var_ec53bfd8)
{
	yawtoenemyposition = getaimyawtoenemyfromnode(entity, entity.node, entity.enemy);
	var_8c878d2c = 10;
	if(isdefined(var_b0b60311))
	{
		var_8c878d2c = var_b0b60311;
	}
	var_dce16ce3 = 10;
	if(isdefined(var_ec53bfd8))
	{
		var_dce16ce3 = var_ec53bfd8;
	}
	var_5aeb5aa8 = aimlimits[#"aim_left"] + var_8c878d2c;
	var_e43acc7e = aimlimits[#"aim_right"] - var_dce16ce3;
	legalaimyaw = yawtoenemyposition >= var_e43acc7e && yawtoenemyposition <= var_5aeb5aa8;
	return legalaimyaw;
}

/*
	Name: function_db059f5c
	Namespace: aiutility
	Checksum: 0x3B94484A
	Offset: 0x3460
	Size: 0xAA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_db059f5c(entity, aimlimits)
{
	pitchtoenemyposition = getaimpitchtoenemyfromnode(entity, entity.node, entity.enemy);
	var_d50d64a8 = aimlimits[#"aim_up"] - 10;
	var_fb118db8 = aimlimits[#"aim_down"] + 10;
	legalaimpitch = pitchtoenemyposition >= var_d50d64a8 && pitchtoenemyposition <= var_fb118db8;
	return legalaimpitch;
}

/*
	Name: function_cfe04a8d
	Namespace: aiutility
	Checksum: 0xBCE0BD95
	Offset: 0x3518
	Size: 0x8E
	Parameters: 4
	Flags: Linked, Private
*/
function private function_cfe04a8d(entity, aimtable, var_b0b60311, var_ec53bfd8)
{
	aimlimits = entity getaimlimitsfromentry(aimtable);
	if(!function_1587e509(entity, aimlimits, var_b0b60311, var_ec53bfd8))
	{
		return false;
	}
	if(!function_db059f5c(entity, aimlimits))
	{
		return false;
	}
	return true;
}

