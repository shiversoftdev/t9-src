#using scripts\core_common\struct.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_clone;

/*
	Name: spawn_player_clone
	Namespace: zm_clone
	Checksum: 0x7F0E9C8F
	Offset: 0x108
	Size: 0x4D6
	Parameters: 4
	Flags: None
*/
function spawn_player_clone(player, origin, forceweapon, forcemodel)
{
	if(!isdefined(origin))
	{
		origin = player.origin;
	}
	primaryweapons = player getweaponslistprimaries();
	if(isdefined(forceweapon))
	{
		weapon = forceweapon;
	}
	else
	{
		if(primaryweapons.size)
		{
			weapon = primaryweapons[0];
		}
		else
		{
			weapon = player getcurrentweapon();
		}
	}
	weaponmodel = weapon.worldmodel;
	spawner = getent("fake_player_spawner", "targetname");
	if(isdefined(spawner))
	{
		clone = spawner spawnfromspawner();
		clone.origin = origin;
		clone.isactor = 1;
	}
	else
	{
		clone = spawn("script_model", origin);
		clone.isactor = 0;
	}
	if(isdefined(forcemodel))
	{
		clone setmodel(forcemodel);
	}
	else
	{
		if(player function_390cb543())
		{
			var_1749f1e8 = player function_92ea4100();
			if(isdefined(var_1749f1e8))
			{
				clone setmodel(var_1749f1e8);
			}
			headmodel = player function_44a7328f();
			if(isdefined(headmodel))
			{
				if(isdefined(clone.head))
				{
					clone detach(clone.head);
				}
				clone attach(headmodel);
			}
			if(isdefined(clone.legs))
			{
				clone detach(clone.legs);
			}
			if(isdefined(clone.torso))
			{
				clone detach(clone.torso);
			}
		}
		else
		{
			var_41206ae3 = player function_5d23af5b();
			if(isdefined(var_41206ae3))
			{
				clone setmodel(var_41206ae3);
			}
			headmodel = player function_44a7328f();
			if(isdefined(headmodel))
			{
				if(isdefined(clone.head))
				{
					clone detach(clone.head);
				}
				clone attach(headmodel);
			}
			var_b4d88433 = player function_cde23658();
			if(isdefined(var_b4d88433))
			{
				if(isdefined(clone.legs))
				{
					clone detach(clone.legs);
				}
				clone attach(var_b4d88433);
			}
			var_1749f1e8 = player function_92ea4100();
			if(isdefined(var_1749f1e8))
			{
				if(isdefined(clone.torso))
				{
					clone detach(clone.torso);
				}
				clone attach(var_1749f1e8);
			}
		}
		clone function_1fac41e4(player function_19124308());
	}
	if(weaponmodel != "" && weaponmodel != "none")
	{
		clone attach(weaponmodel, "tag_weapon_right");
	}
	clone.team = player.team;
	clone.is_inert = 1;
	clone.zombie_move_speed = "walk";
	clone.script_noteworthy = "corpse_clone";
	clone.actor_damage_func = &clone_damage_func;
	return clone;
}

/*
	Name: clone_damage_func
	Namespace: zm_clone
	Checksum: 0x8FE11D0F
	Offset: 0x5E8
	Size: 0xB2
	Parameters: 11
	Flags: Linked
*/
function clone_damage_func(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex)
{
	psoffsettime = 0;
	if(boneindex.isballisticknife && zm_weapons::is_weapon_upgraded(boneindex))
	{
		self notify(#"player_revived", {#reviver:shitloc});
	}
	return psoffsettime;
}

/*
	Name: clone_give_weapon
	Namespace: zm_clone
	Checksum: 0x9F81101E
	Offset: 0x6A8
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function clone_give_weapon(weapon)
{
	weaponmodel = weapon.worldmodel;
	if(weaponmodel != "" && weaponmodel != "none")
	{
		self attach(weaponmodel, "tag_weapon_right");
	}
}

/*
	Name: clone_animate
	Namespace: zm_clone
	Checksum: 0x562F7D76
	Offset: 0x718
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function clone_animate(animtype)
{
	if(self.isactor)
	{
		self thread clone_actor_animate(animtype);
	}
	else
	{
		self thread clone_mover_animate(animtype);
	}
}

/*
	Name: clone_actor_animate
	Namespace: zm_clone
	Checksum: 0x8294A472
	Offset: 0x768
	Size: 0x9A
	Parameters: 1
	Flags: Linked
*/
function clone_actor_animate(animtype)
{
	wait(0.1);
	switch(animtype)
	{
		case "laststand":
		{
			self setanimstatefromasd("laststand");
			break;
		}
		case "idle":
		default:
		{
			self setanimstatefromasd("idle");
			break;
		}
	}
}

/*
	Name: clone_mover_animate
	Namespace: zm_clone
	Checksum: 0x35E5B3FD
	Offset: 0x810
	Size: 0x162
	Parameters: 1
	Flags: Linked
*/
function clone_mover_animate(animtype)
{
	self useanimtree("generic");
	switch(animtype)
	{
		case "laststand":
		{
			self setanim(#"pb_laststand_idle");
			break;
		}
		case "afterlife":
		{
			self setanim(#"pb_afterlife_laststand_idle");
			break;
		}
		case "chair":
		{
			self setanim(#"ai_actor_elec_chair_idle");
			break;
		}
		case "falling":
		{
			self setanim(#"pb_falling_loop");
			break;
		}
		case "idle":
		default:
		{
			self setanim(#"pb_stand_alert");
			break;
		}
	}
}

