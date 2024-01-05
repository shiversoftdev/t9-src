#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_81245006;

/*
	Name: __init__system__
	Namespace: namespace_81245006
	Checksum: 0x70E3116D
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_130a49b747d3bf82", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_81245006
	Checksum: 0xA32279C3
	Offset: 0xE8
	Size: 0x114
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!sessionmodeiszombiesgame())
	{
		return;
	}
	for(i = 0; i < 6; i++)
	{
		clientfield::register("actor", ("" + #"hash_1474b2823ab7e9f3") + i, 1, 1, "int", &function_9c1a4204, 0, 0);
		clientfield::register("actor", ("" + #"hash_855297c2add300") + i, 1, 1, "counter", &function_e5efcc39, 0, 0);
	}
	ai::add_ai_spawn_function(&initweakpoints);
}

/*
	Name: function_9c1a4204
	Namespace: namespace_81245006
	Checksum: 0xAEB1273E
	Offset: 0x208
	Size: 0x124
	Parameters: 7
	Flags: Linked
*/
function function_9c1a4204(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(binitialsnap);
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.var_5ace757d))
	{
		return;
	}
	foreach(var_dd54fdb1 in self.var_5ace757d)
	{
		if(var_dd54fdb1.var_ee8794bf == bwastimejump)
		{
			function_6c64ebd3(binitialsnap, var_dd54fdb1, (fieldname == 1 ? 1 : 2));
			break;
		}
	}
}

/*
	Name: function_e5efcc39
	Namespace: namespace_81245006
	Checksum: 0xFECAA88F
	Offset: 0x338
	Size: 0x11C
	Parameters: 7
	Flags: Linked
*/
function function_e5efcc39(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.var_5ace757d))
	{
		return;
	}
	foreach(var_dd54fdb1 in self.var_5ace757d)
	{
		if(var_dd54fdb1.var_98634dc5 == bwastimejump)
		{
			function_239993de(fieldname, var_dd54fdb1.hitfx, self, var_dd54fdb1.var_6fb74226);
			break;
		}
	}
}

/*
	Name: initweakpoints
	Namespace: namespace_81245006
	Checksum: 0x16B75E28
	Offset: 0x460
	Size: 0x23C
	Parameters: 0
	Flags: Linked
*/
function initweakpoints()
{
	entity = self;
	if(!isdefined(self.aitype))
	{
		return;
	}
	var_97e1b97d = function_768b9c03(self.aitype);
	if(!isdefined(var_97e1b97d))
	{
		return;
	}
	var_5ace757d = getscriptbundle(var_97e1b97d);
	if(!isdefined(var_5ace757d) || !isdefined(var_5ace757d.weakpoints) || !isdefined(var_5ace757d.var_8009bee))
	{
		return;
	}
	entity.var_5ace757d = [];
	clientfield_index = 0;
	foreach(var_8cc382e6 in var_5ace757d.var_8009bee)
	{
		if(!isdefined(var_8cc382e6.var_4aa216c9) || !isdefined(var_8cc382e6.weakpoint))
		{
			continue;
		}
		entity.var_5ace757d[entity.var_5ace757d.size] = {#currstate:2, #hash_47b606f3:function_aed4cd9e(var_8cc382e6), #hash_6fb74226:var_8cc382e6.fxtag, #hitfx:var_8cc382e6.var_4aa216c9, #hash_98634dc5:("" + #"hash_855297c2add300") + clientfield_index, #hash_ee8794bf:("" + #"hash_1474b2823ab7e9f3") + clientfield_index};
		clientfield_index++;
	}
}

/*
	Name: function_aed4cd9e
	Namespace: namespace_81245006
	Checksum: 0x8D888707
	Offset: 0x6A8
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_aed4cd9e(var_dd54fdb1)
{
	var_47b606f3 = [];
	foreach(var_91e65f92 in var_dd54fdb1.var_47b606f3)
	{
		var_47b606f3[var_47b606f3.size] = var_91e65f92.tag;
	}
	return var_47b606f3;
}

/*
	Name: function_6c64ebd3
	Namespace: namespace_81245006
	Checksum: 0x392A98E6
	Offset: 0x758
	Size: 0x150
	Parameters: 3
	Flags: Linked
*/
function function_6c64ebd3(localclientnum, var_dd54fdb1, state)
{
	var_dd54fdb1.currstate = state;
	if(var_dd54fdb1.currstate == 1)
	{
		foreach(tag in var_dd54fdb1.var_47b606f3)
		{
			self function_f1f85b1d(localclientnum, tag, 0);
		}
	}
	else
	{
		foreach(tag in var_dd54fdb1.var_47b606f3)
		{
			self function_f1f85b1d(localclientnum, tag, 1);
		}
	}
}

