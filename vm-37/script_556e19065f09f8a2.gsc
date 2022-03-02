#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zombie_eye_glow;

/*
	Name: function_89f2df9
	Namespace: zombie_eye_glow
	Checksum: 0x89A23C94
	Offset: 0xB0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zombie_eye_glow", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zombie_eye_glow
	Checksum: 0x13EE82FF
	Offset: 0x108
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "zombie_eye_glow", 1, 3, "int");
	callback::on_ai_spawned(&on_ai_spawned);
	callback::on_ai_killed(&on_ai_killed);
}

/*
	Name: function_8ac3bea9
	Namespace: zombie_eye_glow
	Checksum: 0x80F724D1
	Offset: 0x188
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: on_ai_spawned
	Namespace: zombie_eye_glow
	Checksum: 0x919E2AF6
	Offset: 0x198
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function on_ai_spawned()
{
	self endon(#"death");
	if(self.archetype === #"zombie")
	{
		self thread delayed_zombie_eye_glow();
		callback::function_d8abfc3d(#"head_gibbed", &function_95cae3e3);
	}
}

/*
	Name: on_ai_killed
	Namespace: zombie_eye_glow
	Checksum: 0xCAA13034
	Offset: 0x218
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function on_ai_killed(params)
{
	if(self.archetype === #"zombie")
	{
		self function_95cae3e3();
	}
}

/*
	Name: delayed_zombie_eye_glow
	Namespace: zombie_eye_glow
	Checksum: 0x23F93F3D
	Offset: 0x260
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function delayed_zombie_eye_glow(var_64959d6d)
{
	self notify("4ce8b1e0390be791");
	self endon("4ce8b1e0390be791");
	self endon(#"death");
	if(is_true(self.in_the_ground) || is_true(self.in_the_ceiling))
	{
		while(!isdefined(self.create_eyes))
		{
			wait(0.1);
		}
	}
	else
	{
		wait(0.5);
	}
	self function_b43f92cd(var_64959d6d);
}

/*
	Name: function_b43f92cd
	Namespace: zombie_eye_glow
	Checksum: 0x570C948A
	Offset: 0x318
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_b43f92cd(var_64959d6d)
{
	if(!isdefined(var_64959d6d))
	{
		var_64959d6d = 1;
	}
	if(!isdefined(self) || !isactor(self))
	{
		return;
	}
	if(isdefined(self.var_1f966535))
	{
		var_64959d6d = self.var_1f966535;
	}
	else if(isdefined(level.var_1f966535))
	{
		var_64959d6d = level.var_1f966535;
	}
	if(!is_true(self.no_eye_glow) && !is_true(self.is_inert))
	{
		self clientfield::set("zombie_eye_glow", var_64959d6d);
	}
}

/*
	Name: function_95cae3e3
	Namespace: zombie_eye_glow
	Checksum: 0xD56301E8
	Offset: 0x400
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_95cae3e3()
{
	if(!isdefined(self) || !isactor(self))
	{
		return;
	}
	self clientfield::set("zombie_eye_glow", 0);
}

