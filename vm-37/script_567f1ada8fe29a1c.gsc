#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_5869722f;

/*
	Name: function_89f2df9
	Namespace: namespace_5869722f
	Checksum: 0x5238EC2A
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_12075e5736a83384", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5869722f
	Checksum: 0x452EB671
	Offset: 0xC0
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
	zm_trial::register_challenge(#"hash_148571995bbd7ec1", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_5869722f
	Checksum: 0x9356F1B7
	Offset: 0x128
	Size: 0x104
	Parameters: 4
	Flags: Private
*/
function private function_d1de6a85(var_34259a50, var_1d00ec07, var_10cad39b, var_f9ab255c)
{
	archetypes = [3:var_f9ab255c, 2:var_10cad39b, 1:var_1d00ec07, 0:var_34259a50];
	arrayremovevalue(archetypes, undefined, 0);
	self.var_c54c0d81 = [];
	foreach(archetype in archetypes)
	{
		self.var_c54c0d81[archetype] = 1;
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_5869722f
	Checksum: 0x6D8C6825
	Offset: 0x238
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	self.var_c54c0d81 = undefined;
}

/*
	Name: function_ff2a74e7
	Namespace: namespace_5869722f
	Checksum: 0x3DA4656D
	Offset: 0x258
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_ff2a74e7(archetype)
{
	challenge = zm_trial::function_a36e8c38(#"hash_148571995bbd7ec1");
	if(!isdefined(challenge))
	{
		return 0;
	}
	return isdefined(challenge.var_c54c0d81[archetype]);
}

