#using scripts\core_common\math_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace archetype_damage_effects;

/*
	Name: main
	Namespace: archetype_damage_effects
	Checksum: 0xE834E23A
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	registerclientfields();
}

/*
	Name: registerclientfields
	Namespace: archetype_damage_effects
	Checksum: 0xFB4B627A
	Offset: 0xE8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function registerclientfields()
{
	clientfield::register("actor", "arch_actor_fire_fx", 1, 2, "int", &actor_fire_fx, 0, 0);
}

/*
	Name: actor_fire_fx
	Namespace: archetype_damage_effects
	Checksum: 0x84C80619
	Offset: 0x140
	Size: 0x19A
	Parameters: 7
	Flags: Linked
*/
function actor_fire_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	switch(bwastimejump)
	{
		case 0:
		{
			if(isdefined(self.activefx))
			{
				self stopallloopsounds(1);
				foreach(fx in self.activefx)
				{
					stopfx(fieldname, fx);
				}
				self.activefx = [];
			}
			break;
		}
		case 1:
		case 2:
		case 3:
		{
			self.activefx = playtagfxset(fieldname, "weapon_hero_molotov_fire_3p", self);
			break;
		}
	}
}

