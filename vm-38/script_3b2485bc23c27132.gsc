#using script_14f4a3c583c77d4b;
#using script_6021ce59143452c3;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_16581a1a;

/*
	Name: function_339d2804
	Namespace: namespace_16581a1a
	Checksum: 0xCABD3094
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_339d2804()
{
	level notify(249254089);
}

/*
	Name: function_89f2df9
	Namespace: namespace_16581a1a
	Checksum: 0x99BBDF26
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_ae6e3a9f5a7733c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_16581a1a
	Checksum: 0x69C31DB5
	Offset: 0x100
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_177b4c21886142c7", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_16581a1a
	Checksum: 0xF5D9DF84
	Offset: 0x168
	Size: 0x1F0
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(var_e84d35d1, var_16e6b8ea)
{
	var_e9433d0 = struct::get_array(var_e84d35d1);
	/#
		assert(var_e9433d0.size, "");
	#/
	var_64e17761 = [];
	foreach(var_93154b10 in var_e9433d0)
	{
		/#
			assert(isdefined(var_93154b10.target), "");
		#/
		var_94d5ccbc = getentarray(var_93154b10.target, "targetname");
		var_64e17761 = arraycombine(var_64e17761, var_94d5ccbc, 0, 0);
	}
	var_16e6b8ea = zm_trial::function_5769f26a(var_16e6b8ea);
	foreach(player in getplayers())
	{
		player thread function_68b149a2(var_64e17761, var_16e6b8ea);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_16581a1a
	Checksum: 0xAB4FC8EC
	Offset: 0x360
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
}

/*
	Name: function_68b149a2
	Namespace: namespace_16581a1a
	Checksum: 0xD00701F9
	Offset: 0x378
	Size: 0x15C
	Parameters: 2
	Flags: None
*/
function function_68b149a2(var_64e17761, var_16e6b8ea)
{
	level endon(#"hash_7646638df88a3656");
	self endon(#"disconnect");
	wait(12);
	while(true)
	{
		var_4cda8676 = 0;
		foreach(var_c1f5749f in var_64e17761)
		{
			if(self istouching(var_c1f5749f))
			{
				var_4cda8676 = 1;
				break;
			}
		}
		if(!var_4cda8676 && isalive(self) && !self laststand::player_is_in_laststand())
		{
			self dodamage(var_16e6b8ea, self.origin);
			wait(1);
		}
		waitframe(1);
	}
}

