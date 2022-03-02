#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zombie_eye_glow;

/*
	Name: function_9822984d
	Namespace: zombie_eye_glow
	Checksum: 0xEC092F78
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9822984d()
{
	level notify(1132983429);
}

/*
	Name: function_89f2df9
	Namespace: zombie_eye_glow
	Checksum: 0x39968B63
	Offset: 0xD0
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
	Checksum: 0xBA9784A7
	Offset: 0x128
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
	Offset: 0x1A8
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
	Checksum: 0xA5B349B7
	Offset: 0x1B8
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
	Checksum: 0x197C5626
	Offset: 0x238
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
	Checksum: 0xDE1878DB
	Offset: 0x280
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
	Checksum: 0x69645857
	Offset: 0x338
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
	Checksum: 0x2F487E88
	Offset: 0x420
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

