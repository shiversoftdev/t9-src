#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_543dc48f;

/*
	Name: function_2095051e
	Namespace: namespace_543dc48f
	Checksum: 0x4A8D2886
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2095051e()
{
	level notify(891264949);
}

/*
	Name: __init__system__
	Namespace: namespace_543dc48f
	Checksum: 0x148ABFF9
	Offset: 0x90
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2e174447c1bc5bd6", &function_70a657d8, undefined, undefined, #"zm_weapons");
}

/*
	Name: function_70a657d8
	Namespace: namespace_543dc48f
	Checksum: 0xE75DADD5
	Offset: 0xE0
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_5714f442 = 25;
	level.var_a77fcfbe = &function_dafd9cd;
	callback::on_connect(&on_connect);
}

/*
	Name: on_connect
	Namespace: namespace_543dc48f
	Checksum: 0x8BF6C30D
	Offset: 0x138
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private on_connect()
{
	callback::function_d8abfc3d(#"hash_4b807b1167b4a811", &function_c5b14b2f);
}

/*
	Name: function_c5b14b2f
	Namespace: namespace_543dc48f
	Checksum: 0xE6EE9AB
	Offset: 0x178
	Size: 0x4E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c5b14b2f()
{
	callback::function_d8abfc3d(#"done_healing", &function_afade0d0);
	self.var_f7500d42 = self.health;
	self.ignore_health_regen_delay = 1;
}

/*
	Name: function_afade0d0
	Namespace: namespace_543dc48f
	Checksum: 0x6AE13101
	Offset: 0x1D0
	Size: 0x92
	Parameters: 0
	Flags: Linked, Private
*/
function private function_afade0d0()
{
	callback::function_52ac9652(#"done_healing", &function_afade0d0);
	if(isdefined(self.var_f7500d42))
	{
		self.var_c2b7641c = self.health - self.var_f7500d42;
		self notify(#"hash_18e59631bf777496", {#heal_amount:self.var_c2b7641c});
	}
	self.ignore_health_regen_delay = 0;
}

/*
	Name: function_dafd9cd
	Namespace: namespace_543dc48f
	Checksum: 0xFE596EA9
	Offset: 0x270
	Size: 0xCA
	Parameters: 2
	Flags: Linked
*/
function function_dafd9cd(attacker, damage)
{
	if(gettime() < self.heal.var_a1cac2f1)
	{
		return false;
	}
	if(!is_true(self.heal.var_f0f1ff36) && damage < getdvarfloat(#"hash_3671f84e911fb747", (isdefined(level.var_5714f442) ? level.var_5714f442 : 0)))
	{
		return false;
	}
	if(isdefined(level.deathcircle) && level.deathcircle === attacker)
	{
		return false;
	}
	return true;
}

