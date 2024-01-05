#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_543dc48f;

/*
	Name: __init__system__
	Namespace: namespace_543dc48f
	Checksum: 0xACD7998E
	Offset: 0x70
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
	Checksum: 0xACBB2CD0
	Offset: 0xC0
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
	Checksum: 0x79E64667
	Offset: 0x118
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
	Checksum: 0x2DDDE837
	Offset: 0x158
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
	Checksum: 0x381EC2BC
	Offset: 0x1B0
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
	Checksum: 0xDAD7CA2F
	Offset: 0x250
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

