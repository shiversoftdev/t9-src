#using script_1c65dbfc2f1c8d8f;
#using script_35598499769dbb3d;
#using script_5f261a5d57de5f7c;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_42457a0;

/*
	Name: function_d401c967
	Namespace: namespace_42457a0
	Checksum: 0x38FCA4C7
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d401c967()
{
	level notify(206293533);
}

/*
	Name: function_d6863a3
	Namespace: namespace_42457a0
	Checksum: 0xADE7BE79
	Offset: 0xC8
	Size: 0x25E
	Parameters: 6
	Flags: Linked
*/
function function_d6863a3(inflictor, attacker, meansofdeath, weapon, aat, item)
{
	element = self.var_8126f3c8;
	player = attacker;
	if(!isplayer(player) && isplayer(inflictor))
	{
		player = inflictor;
	}
	if(isdefined(aat) && isdefined(weapon) && !isdefined(element) && isplayer(player) && (meansofdeath !== "MOD_MELEE" || weapon.type === "melee"))
	{
		element = aat.element;
	}
	if(!isdefined(element))
	{
		element = zm_weapons::function_f066796f(weapon);
	}
	if(!isdefined(element) && isdefined(item))
	{
		if(isplayer(player) && isdefined(weapon) && !namespace_b376ff3f::function_4d426f94(weapon))
		{
			if(!isdefined(item))
			{
				item = player namespace_b376ff3f::function_230ceec4(weapon);
			}
			if(isdefined(item.var_e91aba42))
			{
				var_c3317960 = gibserverutils::function_de4d9d(weapon, item.var_e91aba42);
				if(isdefined(var_c3317960))
				{
					switch(var_c3317960)
					{
						case 1:
						{
							element = #"cold";
							break;
						}
						case 4:
						{
							element = #"electrical";
							break;
						}
						case 3:
						{
							element = #"fire";
							break;
						}
					}
				}
			}
		}
	}
	return element;
}

/*
	Name: function_1b3815a7
	Namespace: namespace_42457a0
	Checksum: 0x7C2A6BDA
	Offset: 0x330
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_1b3815a7(element)
{
	if(isdefined(element) && (isdefined(self.var_19f5037) && is_true(self.var_19f5037[element])))
	{
		switch(element)
		{
			case "fire":
			{
				return 1;
			}
			case "explosive":
			{
				return 2;
			}
			case "hash_16b5c37d8feae38c":
			{
				return 3;
			}
			case "electrical":
			{
				return 4;
			}
			case "cold":
			{
				return 5;
			}
		}
	}
	return 0;
}

/*
	Name: function_9caeb2f3
	Namespace: namespace_42457a0
	Checksum: 0xD0F0EC3
	Offset: 0x400
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_9caeb2f3(var_a4a310f7)
{
	var_2bce48e0 = [];
	if(!isdefined(var_a4a310f7))
	{
		return var_2bce48e0;
	}
	foreach(entry in var_a4a310f7)
	{
		if(isdefined(entry.type) && is_true(entry.weakness))
		{
			var_2bce48e0[entry.type] = 1;
		}
	}
	return var_2bce48e0;
}

/*
	Name: function_9fbcd067
	Namespace: namespace_42457a0
	Checksum: 0x6424F54B
	Offset: 0x4E8
	Size: 0x210
	Parameters: 13
	Flags: Linked
*/
function function_9fbcd067(element, inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(!isdefined(shitloc))
	{
		return;
	}
	new_damage = surfacetype;
	if(isdefined(self.var_19f5037) && is_true(self.var_19f5037[shitloc]))
	{
		new_damage = surfacetype * 1.5;
		if(isplayer(boneindex) && boneindex namespace_e86ffa8::function_cd6787b(4))
		{
			new_damage = new_damage + ((new_damage - surfacetype) * 0.5);
		}
		level.var_d921ba10 = 1;
		/#
			if(is_true(level.var_a12b24d0))
			{
				function_8666eb93(surfacetype, new_damage, shitloc, (isplayer(psoffsettime) ? psoffsettime : boneindex), self);
			}
		#/
	}
	else
	{
		/#
			function_8666eb93(surfacetype, new_damage, shitloc, (isplayer(psoffsettime) ? psoffsettime : boneindex), self);
		#/
		if(is_true(level.var_a12b24d0) && !is_true(level.var_98e71360))
		{
		}
	}
	return new_damage;
}

/*
	Name: function_601fabe9
	Namespace: namespace_42457a0
	Checksum: 0xCB806AE7
	Offset: 0x700
	Size: 0xDE
	Parameters: 11
	Flags: Linked
*/
function function_601fabe9(element, amount, pos, attacker, inflictor, hitloc, mod, dflags, weapon, var_65c05877, var_9473a4eb)
{
	self.var_8126f3c8 = element;
	new_damage = amount;
	self dodamage(new_damage, pos, attacker, inflictor, hitloc, mod, dflags, weapon, var_65c05877, is_true(var_9473a4eb));
	if(isalive(self))
	{
		self.var_8126f3c8 = undefined;
	}
}

/*
	Name: function_5dbd7c2a
	Namespace: namespace_42457a0
	Checksum: 0x403CFDE9
	Offset: 0x7E8
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_5dbd7c2a()
{
	/#
		level.var_bb60d9c = 1;
		util::waittill_can_add_debug_command();
		function_5ac4dc99("", "");
		function_cd140ee9("", &function_977b852e);
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
		adddebugcommand("");
	#/
}

/*
	Name: function_977b852e
	Namespace: namespace_42457a0
	Checksum: 0x8EBD107A
	Offset: 0x910
	Size: 0x17C
	Parameters: 1
	Flags: None
*/
function function_977b852e(dvar)
{
	/#
		if(dvar.value === "")
		{
			return;
		}
		tokens = strtok(dvar.value, "");
		switch(tokens[0])
		{
			case "toggle_debug":
			{
				level.var_a12b24d0 = !is_true(level.var_a12b24d0);
				if(!is_true(level.var_a12b24d0))
				{
					level notify(#"hash_7417360c17579602");
				}
				else
				{
					level thread function_793d38f();
				}
				break;
			}
			case "hash_8c3f5aa0d2959b8":
			{
				level.var_98e71360 = !is_true(level.var_98e71360);
				break;
			}
			case "hash_2ba0f54a8ae24152":
			{
				function_11c1d3c(tokens[1]);
				break;
			}
		}
		setdvar(dvar.name, "");
	#/
}

/*
	Name: function_793d38f
	Namespace: namespace_42457a0
	Checksum: 0xC9D9C667
	Offset: 0xA98
	Size: 0x36E
	Parameters: 0
	Flags: None
*/
function function_793d38f()
{
	/#
		level endon(#"game_ended", #"hash_7417360c17579602");
		level.var_cc43c151 = [];
		level.var_536f1a3 = 0;
		var_92abc4e4 = [#"cold":"", #"electrical":"", #"hash_16b5c37d8feae38c":"", #"explosive":"", #"fire":""];
		while(true)
		{
			waitframe(1);
			offset = 75 + (22 * 11);
			if(is_true(level.var_98e71360))
			{
				debug2dtext((105, offset * 0.85, 0), "" + "", (1, 1, 1), undefined, vectorscale((1, 1, 1), 0.1), 0.9, 0.85);
				offset = offset - 22;
			}
			else
			{
				offset = offset - 22;
			}
			for(i = 0; i < level.var_cc43c151.size; i++)
			{
				index = (level.var_536f1a3 - i) + (level.var_cc43c151.size - 1) % level.var_cc43c151.size;
				debug_struct = level.var_cc43c151[index];
				string = (((((((((((((debug_struct.timestamp + "") + "") + debug_struct.attacker) + "") + "") + "") + debug_struct.damage) + "") + debug_struct.var_d036befe) + "") + "") + ((var_92abc4e4[debug_struct.element] + function_9e72a96(debug_struct.element)) + "") + "") + "") + debug_struct.entity;
				debug2dtext((105, offset * 0.85, 0), string, (1, 1, 1), undefined, (i == 0 ? vectorscale((1, 1, 1), 0.2) : vectorscale((1, 1, 1), 0.1)), 0.9, 0.85);
				offset = offset - 22;
			}
		}
	#/
}

/*
	Name: function_8666eb93
	Namespace: namespace_42457a0
	Checksum: 0x63EE1D7E
	Offset: 0xE10
	Size: 0x228
	Parameters: 5
	Flags: None
*/
function function_8666eb93(damage, var_d036befe, element, attacker, entity)
{
	/#
		loc_00000F04:
		level.var_cc43c151[level.var_536f1a3] = {#timestamp:gettime(), #entity:(isdefined(entity) ? (isactor(entity) ? function_9e72a96((isdefined(entity.var_9fde8624) ? entity.var_9fde8624 : entity.archetype)) : (isplayer(entity) ? "" + entity getentitynumber() : entity getentitynumber())) : ""), #attacker:(isdefined(attacker) ? (isactor(attacker) ? function_9e72a96((isdefined(attacker.var_9fde8624) ? attacker.var_9fde8624 : attacker.archetype)) : (isplayer(attacker) ? "" + attacker getentitynumber() : attacker getentitynumber())) : ""), #element:element, #hash_d036befe:var_d036befe, #damage:damage};
		level.var_536f1a3 = (level.var_536f1a3 + 1) % 10;
	#/
}

/*
	Name: function_11c1d3c
	Namespace: namespace_42457a0
	Checksum: 0x60181BC
	Offset: 0x1040
	Size: 0x108
	Parameters: 1
	Flags: None
*/
function function_11c1d3c(type)
{
	/#
		nearby_ai = getentitiesinradius(level.players[0].origin, 512, 15);
		foreach(ai in nearby_ai)
		{
			ai function_601fabe9(type, 1, level.players[0].origin, level.players[0], level.players[0], "", "", 0);
		}
	#/
}

