#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm.gsc;

#namespace namespace_e01afe67;

/*
	Name: function_f019ea4d
	Namespace: namespace_e01afe67
	Checksum: 0xEC1A6443
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f019ea4d()
{
	level notify(625154870);
}

/*
	Name: function_89f2df9
	Namespace: namespace_e01afe67
	Checksum: 0x9EC860E6
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_993ee8bedbddc19", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e01afe67
	Checksum: 0x83E41F6F
	Offset: 0xF0
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
	zm_trial::register_challenge(#"hash_27897abffa9137fc", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_e01afe67
	Checksum: 0x357C343C
	Offset: 0x158
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	zm::register_actor_damage_callback(&height_check);
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_e01afe67
	Checksum: 0x403DF306
	Offset: 0x188
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	if(isinarray(level.actor_damage_callbacks, &height_check))
	{
		arrayremovevalue(level.actor_damage_callbacks, &height_check, 0);
	}
}

/*
	Name: is_active
	Namespace: namespace_e01afe67
	Checksum: 0xC4403DF2
	Offset: 0x1F8
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_27897abffa9137fc");
	return isdefined(challenge);
}

/*
	Name: height_check
	Namespace: namespace_e01afe67
	Checksum: 0x8CF33D54
	Offset: 0x238
	Size: 0xBE
	Parameters: 13
	Flags: Private
*/
function private height_check(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(isdefined(boneindex.origin) && isdefined(self.origin) && boneindex.origin[2] > (self.origin[2] + 40))
	{
		return surfacetype;
	}
	return 0;
}

