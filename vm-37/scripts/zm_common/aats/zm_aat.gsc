#using script_5f261a5d57de5f7c;
#using scripts\zm_common\zm_stats.gsc;
#using script_1a6b88eb823340b0;
#using script_3fbe90dd521a8e2d;
#using script_7445d698c7893a17;
#using script_746c9396ccd2c32d;
#using script_6b1f7ff883ed7f20;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace zm_aat;

/*
	Name: __init__system__
	Namespace: zm_aat
	Checksum: 0x4EB0AA9D
	Offset: 0x1B0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_aat", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_aat
	Checksum: 0x99B1B5FF
	Offset: 0x1F8
	Size: 0x1FC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	level.var_9d1d502c = 1;
	level.aat_initializing = 1;
	level aat::function_571fceb("ammomod_brainrot", &ammomod_brainrot::function_9384b521);
	level aat::function_571fceb("ammomod_cryofreeze", &ammomod_cryofreeze::function_ab6c8a0b);
	level aat::function_571fceb("ammomod_deadwire", &ammomod_deadwire::function_af1f180);
	level aat::function_571fceb("ammomod_napalmburst", &ammomod_napalmburst::function_4e4244c1);
	level aat::function_571fceb("ammomod_electriccherry", &ammomod_electriccherry::function_4b66248d);
	clientfield::register("toplayer", "ammomod_cryofreeze_idle", 1, 3, "int");
	clientfield::register("toplayer", "ammomod_napalmburst_idle", 1, 3, "int");
	clientfield::register("toplayer", "ammomod_brainrot_idle", 1, 3, "int");
	clientfield::register("toplayer", "ammomod_deadwire_idle", 1, 3, "int");
	level aat::function_2b3bcce0();
	level.var_a839c34d = &function_3ac3c47e;
}

/*
	Name: function_ec7953fa
	Namespace: zm_aat
	Checksum: 0x5899784A
	Offset: 0x400
	Size: 0x33C
	Parameters: 0
	Flags: Linked
*/
function function_ec7953fa()
{
	weapon = self getcurrentweapon();
	item = item_inventory::function_230ceec4(weapon);
	if(isdefined(item.aat))
	{
		aat_name = item.aat;
	}
	if(isdefined(aat_name))
	{
		if(function_4b36d8a(aat_name))
		{
			tier = function_4b36d8a(aat_name);
			clientfield::set_to_player("ammomod_cryofreeze_idle", tier);
			clientfield::set_to_player("ammomod_napalmburst_idle", 0);
			clientfield::set_to_player("ammomod_brainrot_idle", 0);
			clientfield::set_to_player("ammomod_deadwire_idle", 0);
		}
		else
		{
			if(function_9022de1(aat_name))
			{
				tier = function_9022de1(aat_name);
				clientfield::set_to_player("ammomod_cryofreeze_idle", 0);
				clientfield::set_to_player("ammomod_napalmburst_idle", tier);
				clientfield::set_to_player("ammomod_brainrot_idle", 0);
				clientfield::set_to_player("ammomod_deadwire_idle", 0);
			}
			else
			{
				if(function_8bd7087d(aat_name))
				{
					tier = function_8bd7087d(aat_name);
					clientfield::set_to_player("ammomod_cryofreeze_idle", 0);
					clientfield::set_to_player("ammomod_napalmburst_idle", 0);
					clientfield::set_to_player("ammomod_brainrot_idle", tier);
					clientfield::set_to_player("ammomod_deadwire_idle", 0);
				}
				else if(function_eb854b26(aat_name))
				{
					tier = function_eb854b26(aat_name);
					clientfield::set_to_player("ammomod_cryofreeze_idle", 0);
					clientfield::set_to_player("ammomod_napalmburst_idle", 0);
					clientfield::set_to_player("ammomod_brainrot_idle", 0);
					clientfield::set_to_player("ammomod_deadwire_idle", tier);
				}
			}
		}
	}
	else
	{
		clientfield::set_to_player("ammomod_cryofreeze_idle", 0);
		clientfield::set_to_player("ammomod_napalmburst_idle", 0);
		clientfield::set_to_player("ammomod_brainrot_idle", 0);
		clientfield::set_to_player("ammomod_deadwire_idle", 0);
	}
}

/*
	Name: function_4b36d8a
	Namespace: zm_aat
	Checksum: 0x1BEEF728
	Offset: 0x748
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_4b36d8a(aat_name)
{
	if(!isdefined(aat_name))
	{
		aat_name = "none";
	}
	switch(aat_name)
	{
		case "ammomod_cryofreeze":
		{
			return 1;
			break;
		}
		case "ammomod_cryofreeze_1":
		{
			return 2;
			break;
		}
		case "ammomod_cryofreeze_2":
		{
			return 3;
			break;
		}
		case "ammomod_cryofreeze_3":
		{
			return 4;
			break;
		}
		case "ammomod_cryofreeze_4":
		{
			return 5;
			break;
		}
		case "ammomod_cryofreeze_5":
		{
			return 6;
			break;
		}
	}
	return 0;
}

/*
	Name: function_9022de1
	Namespace: zm_aat
	Checksum: 0x6FFB7ECA
	Offset: 0x828
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_9022de1(aat_name)
{
	if(!isdefined(aat_name))
	{
		aat_name = "none";
	}
	switch(aat_name)
	{
		case "ammomod_napalmburst":
		{
			return 1;
			break;
		}
		case "ammomod_napalmburst_1":
		{
			return 2;
			break;
		}
		case "ammomod_napalmburst_2":
		{
			return 3;
			break;
		}
		case "ammomod_napalmburst_3":
		{
			return 4;
			break;
		}
		case "ammomod_napalmburst_4":
		{
			return 5;
			break;
		}
		case "ammomod_napalmburst_5":
		{
			return 6;
			break;
		}
	}
	return 0;
}

/*
	Name: function_8bd7087d
	Namespace: zm_aat
	Checksum: 0xE98666A2
	Offset: 0x908
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_8bd7087d(aat_name)
{
	if(!isdefined(aat_name))
	{
		aat_name = "none";
	}
	switch(aat_name)
	{
		case "ammomod_brainrot":
		{
			return 1;
			break;
		}
		case "ammomod_brainrot_1":
		{
			return 2;
			break;
		}
		case "ammomod_brainrot_2":
		{
			return 3;
			break;
		}
		case "ammomod_brainrot_3":
		{
			return 4;
			break;
		}
		case "ammomod_brainrot_4":
		{
			return 5;
			break;
		}
		case "ammomod_brainrot_5":
		{
			return 6;
			break;
		}
	}
	return 0;
}

/*
	Name: function_eb854b26
	Namespace: zm_aat
	Checksum: 0x19DDDFAD
	Offset: 0x9E8
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_eb854b26(aat_name)
{
	if(!isdefined(aat_name))
	{
		aat_name = "none";
	}
	switch(aat_name)
	{
		case "ammomod_deadwire":
		{
			return 1;
			break;
		}
		case "ammomod_deadwire_1":
		{
			return 2;
			break;
		}
		case "ammomod_deadwire_2":
		{
			return 3;
			break;
		}
		case "ammomod_deadwire_3":
		{
			return 4;
			break;
		}
		case "ammomod_deadwire_4":
		{
			return 5;
			break;
		}
		case "ammomod_deadwire_5":
		{
			return 6;
			break;
		}
	}
	return 0;
}

/*
	Name: function_296cde87
	Namespace: zm_aat
	Checksum: 0xDB594D7D
	Offset: 0xAC8
	Size: 0x202
	Parameters: 1
	Flags: Linked
*/
function function_296cde87(aat_name)
{
	if(isdefined(aat_name))
	{
		switch(aat_name)
		{
			case "ammomod_cryofreeze":
			case "ammomod_cryofreeze_5":
			case "ammomod_cryofreeze_4":
			case "ammomod_cryofreeze_1":
			case "ammomod_cryofreeze_3":
			case "ammomod_cryofreeze_2":
			{
				return "ammomod_cryofreeze";
				break;
			}
			case "ammomod_napalmburst":
			case "ammomod_napalmburst_1":
			case "ammomod_napalmburst_2":
			case "ammomod_napalmburst_3":
			case "ammomod_napalmburst_4":
			case "ammomod_napalmburst_5":
			{
				return "ammomod_napalmburst";
				break;
			}
			case "ammomod_brainrot_4":
			case "ammomod_brainrot_5":
			case "ammomod_brainrot_1":
			case "ammomod_brainrot_2":
			case "ammomod_brainrot_3":
			case "ammomod_brainrot":
			{
				return "ammomod_brainrot";
				break;
			}
			case "ammomod_deadwire_2":
			case "ammomod_deadwire_3":
			case "ammomod_deadwire_1":
			case "ammomod_deadwire_4":
			case "ammomod_deadwire_5":
			case "ammomod_deadwire":
			{
				return "ammomod_deadwire";
				break;
			}
			case "ammomod_electriccherry":
			{
				return "ammomod_electriccherry";
				break;
			}
		}
	}
	return #"none";
}

/*
	Name: function_70c0e823
	Namespace: zm_aat
	Checksum: 0xEF500AC6
	Offset: 0xCD8
	Size: 0x8A
	Parameters: 1
	Flags: None
*/
function function_70c0e823(aat_name)
{
	/#
		/#
			assert(isdefined(level.aat[aat_name]), "" + (ishash(aat_name) ? function_9e72a96(aat_name) : aat_name));
		#/
	#/
	return level.aat[aat_name].element;
}

/*
	Name: function_3ac3c47e
	Namespace: zm_aat
	Checksum: 0xA14FFE8B
	Offset: 0xD70
	Size: 0x1AC
	Parameters: 3
	Flags: Linked
*/
function function_3ac3c47e(name, now, attacker)
{
	n_multiplier = 1;
	if(isplayer(attacker))
	{
		if(attacker namespace_e86ffa8::function_cd6787b(2))
		{
			n_multiplier = 0.8;
		}
	}
	else
	{
		return false;
	}
	if(isdefined(self.aat_cooldown_start) && (isdefined(self.aat_cooldown_start[name]) && (isdefined(level.aat) && (isdefined(level.aat[name]) && isdefined(level.aat[name].cooldown_time_entity)))) && now <= (self.aat_cooldown_start[name] + (level.aat[name].cooldown_time_entity * n_multiplier)))
	{
		return true;
	}
	if(isdefined(attacker.aat_cooldown_start) && isdefined(attacker.aat_cooldown_start[name]) && now <= (attacker.aat_cooldown_start[name] + (level.aat[name].cooldown_time_attacker * n_multiplier)))
	{
		return true;
	}
	if(now <= (level.aat[name].cooldown_time_global_start + (level.aat[name].cooldown_time_global * n_multiplier)))
	{
		return true;
	}
	return false;
}

/*
	Name: function_6b15092
	Namespace: zm_aat
	Checksum: 0x31221227
	Offset: 0xF28
	Size: 0xBE
	Parameters: 3
	Flags: Linked
*/
function function_6b15092(aat_name, damage, victim)
{
	switch(aat_name)
	{
		case "ammomod_cryofreeze_5":
		case "ammomod_cryofreeze_4":
		case "ammomod_cryofreeze_1":
		case "ammomod_cryofreeze_3":
		case "ammomod_cryofreeze_2":
		{
			if(is_true(victim.var_958cf9c5))
			{
				damage = damage + (damage * 0.25);
			}
			break;
		}
	}
	return damage;
}

/*
	Name: function_14ccd92a
	Namespace: zm_aat
	Checksum: 0xD1ECE2E6
	Offset: 0xFF0
	Size: 0x1A2
	Parameters: 1
	Flags: Linked
*/
function function_14ccd92a(str_name)
{
	/#
		var_c07a4345 = getdvarint(#"hash_37466543dd4004e5", 0);
		if(var_c07a4345 > 0)
		{
			return var_c07a4345;
		}
	#/
	var_8c590502 = (isdefined(getgametypesetting(#"hash_3c2c78e639bfd3c6")) ? getgametypesetting(#"hash_3c2c78e639bfd3c6") : 0);
	if(var_8c590502 > 0)
	{
		return var_8c590502;
	}
	switch(str_name)
	{
		case "ammomod_cryofreeze":
		{
			return self zm_stats::function_12b698fa(#"hash_63114aea3939d941");
			break;
		}
		case "ammomod_napalmburst":
		{
			return self zm_stats::function_12b698fa(#"hash_5769f8ea57e496b4");
			break;
		}
		case "ammomod_brainrot":
		{
			return self zm_stats::function_12b698fa(#"hash_54782d04f50f4fb0");
			break;
		}
		case "ammomod_deadwire":
		{
			return self zm_stats::function_12b698fa(#"hash_69a99172dc42f08a");
			break;
		}
	}
}

