#using script_256b8879317373de;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace namespace_34cc3243;

/*
	Name: function_c58fa492
	Namespace: namespace_34cc3243
	Checksum: 0x2DE5AE54
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c58fa492()
{
	level notify(256839728);
}

/*
	Name: function_89f2df9
	Namespace: namespace_34cc3243
	Checksum: 0x7761CFA5
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_76d53a060efc848a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_34cc3243
	Checksum: 0x522981
	Offset: 0x120
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
	zm_trial::register_challenge(#"hash_424659e6cfcc0905", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_34cc3243
	Checksum: 0x8D68A70A
	Offset: 0x188
	Size: 0xA0
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	foreach(player in getplayers())
	{
		player val::set("trials_disable_regen", "health_regen", 0);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_34cc3243
	Checksum: 0xFC2FDBA8
	Offset: 0x230
	Size: 0xA8
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		player val::reset("trials_disable_regen", "health_regen");
	}
}

/*
	Name: is_active
	Namespace: namespace_34cc3243
	Checksum: 0x1684C9DE
	Offset: 0x2E0
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function is_active(var_34f09024)
{
	challenge = zm_trial::function_a36e8c38(#"hash_424659e6cfcc0905");
	return isdefined(challenge);
}

