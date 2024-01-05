#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace squads;

/*
	Name: function_bcabca21
	Namespace: squads
	Checksum: 0x8671381B
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bcabca21()
{
	level notify(1467671589);
}

/*
	Name: __init__system__
	Namespace: squads
	Checksum: 0x8D809BE4
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"squads", &__init__, undefined, undefined, undefined);
}

/*
	Name: __init__
	Namespace: squads
	Checksum: 0xA32A4CB2
	Offset: 0xF0
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	if(currentsessionmode() != 4)
	{
		level.var_c58668ea = getgametypesetting(#"hash_5462586bdce0346e");
		level.var_3312552 = getgametypesetting(#"hash_7cc354dd83013a47");
	}
	level.var_704bcca1 = getgametypesetting(#"hash_3a4691a853585241");
	level.squad = {#count:function_bb1ab64b()};
	level.squads = [];
	for(squad_index = 1; squad_index <= level.squad.count; squad_index++)
	{
		var_bdb3f6a6 = "squad_" + squad_index;
		level.squads[hash("squad_" + squad_index)] = {#name:var_bdb3f6a6};
	}
}

/*
	Name: function_a9758423
	Namespace: squads
	Checksum: 0xA41184DE
	Offset: 0x258
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_a9758423()
{
	return level.squad.count > 0 && level.var_c58668ea === 1;
}

/*
	Name: function_bb1ab64b
	Namespace: squads
	Checksum: 0x39007603
	Offset: 0x290
	Size: 0x22
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bb1ab64b()
{
	return getdvarint(#"com_maxclients", 0);
}

/*
	Name: function_43a7bead
	Namespace: squads
	Checksum: 0x70AE8FC8
	Offset: 0x2C0
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function function_43a7bead()
{
	foreach(squad, _ in level.squads)
	{
		if(self function_59396fe8(squad))
		{
			return squad;
		}
	}
	return #"none";
}

/*
	Name: function_59396fe8
	Namespace: squads
	Checksum: 0x5FB9C6B4
	Offset: 0x370
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_59396fe8(squad)
{
	var_74578e76 = function_c65231e2(squad);
	if(var_74578e76.size > 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_fc04a299
	Namespace: squads
	Checksum: 0x142954BF
	Offset: 0x3C0
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function function_fc04a299(party)
{
	foreach(member in party.var_d77ed5eb)
	{
		if(self == member)
		{
			continue;
		}
		if(member.squad != #"none" && member.squad != #"invalid")
		{
			return member.squad;
		}
	}
	return #"none";
}

/*
	Name: function_c98289a5
	Namespace: squads
	Checksum: 0x82D949D7
	Offset: 0x4B0
	Size: 0xFA
	Parameters: 1
	Flags: Linked
*/
function function_c98289a5(team)
{
	teammates = getplayers(team);
	foreach(player in teammates)
	{
		if(self == player)
		{
			continue;
		}
		if(player.squad != #"none" && player.squad != #"invalid")
		{
			return player.squad;
		}
	}
	return #"none";
}

/*
	Name: function_faeb0876
	Namespace: squads
	Checksum: 0x6DA60419
	Offset: 0x5B8
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function function_faeb0876()
{
	status = self player::function_3d288f14();
	squad = self function_33843308(status);
	if(squad == #"none")
	{
		squad = function_43a7bead();
	}
	if(squad == #"none")
	{
		squad = function_4f237b02();
	}
	return squad;
}

/*
	Name: function_46edfa55
	Namespace: squads
	Checksum: 0xD8E749E7
	Offset: 0x670
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_46edfa55(var_74578e76)
{
	return level.var_704bcca1 - player::function_1cec6cba(var_74578e76);
}

/*
	Name: function_a65e2082
	Namespace: squads
	Checksum: 0xAAA0958D
	Offset: 0x6A8
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function function_a65e2082(squad)
{
	var_74578e76 = function_c65231e2(squad);
	if(var_74578e76.size >= level.var_704bcca1)
	{
		return false;
	}
	if(var_74578e76.size > 0)
	{
		if(var_74578e76[0].team != self.team)
		{
			return false;
		}
	}
	var_fa810454 = function_46edfa55(var_74578e76);
	party = self getparty();
	if(party.var_a15e4438 > var_fa810454)
	{
		return false;
	}
	return true;
}

/*
	Name: function_4f237b02
	Namespace: squads
	Checksum: 0x522DFEAA
	Offset: 0x780
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function function_4f237b02()
{
	foreach(squad, _ in level.squads)
	{
		if(self function_a65e2082(squad))
		{
			return squad;
		}
	}
	return #"none";
}

/*
	Name: function_33843308
	Namespace: squads
	Checksum: 0x220339F5
	Offset: 0x830
	Size: 0x12A
	Parameters: 1
	Flags: Linked
*/
function function_33843308(status)
{
	foreach(var_bdb3f6a6, squad in level.squads)
	{
		if(status == #"game")
		{
			if(isdefined(squad.voip) && squad.voip != #"game")
			{
				continue;
			}
		}
		else if(isdefined(squad.voip) && squad.voip == #"game")
		{
			continue;
		}
		if(self function_a65e2082(var_bdb3f6a6))
		{
			return var_bdb3f6a6;
		}
	}
	return #"none";
}

/*
	Name: function_b0c92599
	Namespace: squads
	Checksum: 0x30D36DB1
	Offset: 0x968
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function function_b0c92599(party)
{
	if(isdefined(level.var_7d3ed2bf) && level.var_7d3ed2bf && isdefined(party) && party.fill == 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_f65acad1
	Namespace: squads
	Checksum: 0x5EF91019
	Offset: 0x9C0
	Size: 0x62
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f65acad1()
{
	if(getdvarint(#"hash_587d8e03df4f4f8a", 0))
	{
		squad = function_4f237b02();
	}
	else
	{
		squad = self function_faeb0876();
	}
	return squad;
}

/*
	Name: function_49c2a7d1
	Namespace: squads
	Checksum: 0xF9593153
	Offset: 0xA30
	Size: 0x6A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_49c2a7d1(party)
{
	if(level.var_c58668ea && function_b0c92599(party))
	{
		squad = function_43a7bead();
	}
	else
	{
		squad = function_f65acad1();
	}
	return squad;
}

/*
	Name: function_4c9d66b1
	Namespace: squads
	Checksum: 0xABDB0B2
	Offset: 0xAA8
	Size: 0xEA
	Parameters: 0
	Flags: Linked
*/
function function_4c9d66b1()
{
	var_432c77c2 = function_785ee514(self);
	/#
		var_d1f1fdbf = getdvarstring(#"hash_1c90c9250b52435a", "");
		var_8ec96d19 = strtok(var_d1f1fdbf, "");
		if(var_8ec96d19.size > 0)
		{
			var_51662597 = var_8ec96d19[self getentitynumber()];
			if(isdefined(var_51662597) && isdefined(level.squads[var_51662597]))
			{
				var_432c77c2 = hash(var_51662597);
			}
		}
	#/
	return var_432c77c2;
}

/*
	Name: function_c70b26ea
	Namespace: squads
	Checksum: 0xF6D9BAD4
	Offset: 0xBA0
	Size: 0x274
	Parameters: 1
	Flags: Linked
*/
function function_c70b26ea(squad)
{
	if(!isdefined(squad))
	{
		squad = self function_4c9d66b1();
	}
	if(squad == #"none")
	{
		/#
			println("");
		#/
		if(level.var_c58668ea)
		{
			squad = function_c98289a5(self.team);
			if(squad == #"none")
			{
				squad = function_4f237b02();
			}
		}
		else
		{
			squad = #"none";
			party = self getparty();
			if(isdefined(party) && party.var_a15e4438 > 1)
			{
				squad = function_fc04a299(party);
				if(squad == #"none")
				{
					squad = function_49c2a7d1();
				}
			}
			if(!isdefined(squad) || squad == #"none")
			{
				if(level.var_3312552)
				{
					squad = function_f65acad1();
				}
			}
		}
	}
	/#
		var_d1f1fdbf = getdvarstring(#"hash_1c90c9250b52435a", "");
		var_8ec96d19 = strtok(var_d1f1fdbf, "");
		if(var_8ec96d19.size > 0)
		{
			var_51662597 = var_8ec96d19[self getentitynumber()];
			if(isdefined(var_51662597) && isdefined(level.squads[var_51662597]))
			{
				squad = hash(var_51662597);
			}
		}
	#/
	self function_ff3321ee(squad);
}

/*
	Name: function_ff3321ee
	Namespace: squads
	Checksum: 0xA043718C
	Offset: 0xE20
	Size: 0x19A
	Parameters: 1
	Flags: Linked
*/
function function_ff3321ee(var_bdb3f6a6)
{
	self.pers[#"squad"] = var_bdb3f6a6;
	self.squad = var_bdb3f6a6;
	self.pers[#"teammateindex"] = 0;
	self.teammateindex = 0;
	self function_a4c9eb05();
	/#
		xuid = self getxuid();
		println((("" + xuid) + "") + int(var_bdb3f6a6));
	#/
	if(isdefined(level.squads[var_bdb3f6a6]))
	{
		squad = level.squads[var_bdb3f6a6];
		status = self player::function_3d288f14();
		if(!isdefined(squad.voip) || (status != squad.voip && status == #"game"))
		{
			if(status == #"game")
			{
				squad.voip = #"game";
			}
			else
			{
				squad.voip = #"none";
			}
		}
	}
}

/*
	Name: function_e249c6ae
	Namespace: squads
	Checksum: 0xE2298718
	Offset: 0xFC8
	Size: 0x9C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e249c6ae(squadmates, index)
{
	foreach(player in squadmates)
	{
		if(player.teammateindex == index)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_114b9455
	Namespace: squads
	Checksum: 0x43905DBF
	Offset: 0x1070
	Size: 0x4A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_114b9455(squadmates, start_index)
{
	for(var_cd210c3e = start_index; function_e249c6ae(squadmates, var_cd210c3e); var_cd210c3e++)
	{
	}
	return var_cd210c3e;
}

/*
	Name: function_80d5f55
	Namespace: squads
	Checksum: 0xFE8A5CF3
	Offset: 0x10C8
	Size: 0xFA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_80d5f55(squadmates, party)
{
	last_index = 1;
	foreach(var_52ec371a in party.var_d77ed5eb)
	{
		if(var_52ec371a.teammateindex > 0)
		{
			last_index = var_52ec371a.teammateindex;
		}
		else
		{
			last_index = function_114b9455(squadmates, last_index);
		}
		if(self == var_52ec371a)
		{
			return last_index;
		}
	}
	return function_114b9455(squadmates, 1);
}

/*
	Name: function_a4c9eb05
	Namespace: squads
	Checksum: 0xEEC4C22E
	Offset: 0x11D0
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_a4c9eb05()
{
	if(self.squad != #"invalid")
	{
		squadmates = function_c65231e2(self.squad);
	}
	else
	{
		squadmates = getplayers(self.team);
	}
	self.teammateindex = self function_80d5f55(squadmates, self getparty());
	self.pers[#"teammateindex"] = self.teammateindex;
}

