#using script_3819e7a1427df6d2;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace archetype_damage_effects;

/*
	Name: main
	Namespace: archetype_damage_effects
	Checksum: 0x4B579042
	Offset: 0xB8
	Size: 0x74
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	clientfield::register("actor", "arch_actor_fire_fx", 1, 2, "int");
	callback::on_actor_damage(&onactordamagecallback);
	callback::on_actor_killed(&onactorkilledcallback);
}

/*
	Name: onactordamagecallback
	Namespace: archetype_damage_effects
	Checksum: 0xA9B61188
	Offset: 0x138
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function onactordamagecallback(params)
{
	onactordamage(params);
}

/*
	Name: onactorkilledcallback
	Namespace: archetype_damage_effects
	Checksum: 0xD97EEDB1
	Offset: 0x168
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function onactorkilledcallback(params)
{
	onactorkilled();
}

/*
	Name: function_6fedb40d
	Namespace: archetype_damage_effects
	Checksum: 0x671496A
	Offset: 0x190
	Size: 0xBE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6fedb40d()
{
	self endon(#"death");
	if(is_true(self.var_73c36602))
	{
		return;
	}
	self clientfield::set("arch_actor_fire_fx", 1);
	self.var_73c36602 = 1;
	wait((isdefined(self.var_ab2486b4 / 1000) ? self.var_ab2486b4 / 1000 : 3));
	self clientfield::set("arch_actor_fire_fx", 0);
	self.var_73c36602 = 0;
}

/*
	Name: function_6eb1fbde
	Namespace: archetype_damage_effects
	Checksum: 0xD5AA380F
	Offset: 0x258
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6eb1fbde()
{
	if(self.var_40543c03 === "fire")
	{
		self thread function_6fedb40d();
	}
}

/*
	Name: onactordamage
	Namespace: archetype_damage_effects
	Checksum: 0x18F91D4A
	Offset: 0x290
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function onactordamage(params)
{
	self.var_40543c03 = undefined;
	self.var_ab2486b4 = 0;
	if(isdefined(params.weapon) && isdefined(params.weapon.var_8456d4d))
	{
		var_8d93b9c8 = aiutility::function_e2010f4c(self, getscriptbundle(params.weapon.var_8456d4d));
		if(isdefined(var_8d93b9c8))
		{
			self.var_40543c03 = var_8d93b9c8.effecttype;
			if(!isdefined(var_8d93b9c8.var_4badc00f) || !var_8d93b9c8.var_4badc00f)
			{
				self.var_ab2486b4 = var_8d93b9c8.duration * 1000;
			}
		}
		self function_6eb1fbde();
	}
}

/*
	Name: onactorkilled
	Namespace: archetype_damage_effects
	Checksum: 0x1D8BE6EE
	Offset: 0x388
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function onactorkilled()
{
	if(isdefined(self.damagemod))
	{
		if(self.damagemod == "MOD_BURNED")
		{
			if(isdefined(self.damageweapon) && isdefined(self.damageweapon.specialpain) && self.damageweapon.specialpain == 0)
			{
				self clientfield::set("arch_actor_fire_fx", 2);
			}
		}
	}
}

