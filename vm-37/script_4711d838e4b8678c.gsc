#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_3a56904b;

/*
	Name: function_89f2df9
	Namespace: namespace_3a56904b
	Checksum: 0x2AF3CB4E
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_14545d2d685e6304", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3a56904b
	Checksum: 0x743CAF2B
	Offset: 0xD8
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
	zm_trial::register_challenge(#"hash_53d304fe41545371", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_3a56904b
	Checksum: 0xD4129963
	Offset: 0x140
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	zm::register_actor_damage_callback(&function_306332df);
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_3a56904b
	Checksum: 0x1F146005
	Offset: 0x170
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	if(isinarray(level.actor_damage_callbacks, &function_306332df))
	{
		arrayremovevalue(level.actor_damage_callbacks, &function_306332df, 0);
	}
}

/*
	Name: is_active
	Namespace: namespace_3a56904b
	Checksum: 0x9527CF0C
	Offset: 0x1E0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_53d304fe41545371");
	return isdefined(challenge);
}

/*
	Name: function_306332df
	Namespace: namespace_3a56904b
	Checksum: 0x6A02DFE4
	Offset: 0x220
	Size: 0x122
	Parameters: 13
	Flags: Private
*/
function private function_306332df(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(!isplayer(boneindex) && !isplayer(psoffsettime))
	{
		return -1;
	}
	if(is_true(self.aat_turned))
	{
		return surfacetype;
	}
	if(isdefined(boneindex.origin) && isdefined(self.origin) && distance2dsquared(boneindex.origin, self.origin) <= 122500)
	{
		return surfacetype;
	}
	return 0;
}

/*
	Name: function_23d15bf3
	Namespace: namespace_3a56904b
	Checksum: 0x426C5F7F
	Offset: 0x350
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function function_23d15bf3(var_f85889ce)
{
	if(isplayer(var_f85889ce) && distance2dsquared(var_f85889ce.origin, self.origin) <= 122500)
	{
		return true;
	}
	return false;
}

