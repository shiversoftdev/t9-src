#using scripts\zm_common\zm_maptable.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace zm_inventory;

/*
	Name: function_cb96f01d
	Namespace: zm_inventory
	Checksum: 0x2824B574
	Offset: 0x198
	Size: 0x13A
	Parameters: 5
	Flags: Linked, Private
*/
function private function_cb96f01d(mappingname, internalname, var_2972a1c0, numbits, var_7f12f171)
{
	if(!isdefined(level.var_a16c38d9[mappingname]))
	{
		level.var_a16c38d9[mappingname] = spawnstruct();
	}
	if(!isdefined(var_7f12f171))
	{
		var_7f12f171 = 0;
	}
	if(var_7f12f171)
	{
		internalname = "ZMInventoryPersonal." + internalname;
	}
	else
	{
		internalname = "ZMInventory." + internalname;
	}
	level.var_a16c38d9[mappingname].var_cd35dfb2 = internalname;
	level.var_a16c38d9[mappingname].var_a88efd0b = (var_7f12f171 ? #"hash_1d3ddede734994d8" : #"zm_inventory");
	level.var_a16c38d9[mappingname].var_2972a1c0 = var_2972a1c0;
	level.var_a16c38d9[mappingname].numbits = numbits;
	level.var_a16c38d9[mappingname].var_7f12f171 = var_7f12f171;
}

/*
	Name: function_c7c05a13
	Namespace: zm_inventory
	Checksum: 0x3E032A0F
	Offset: 0x2E0
	Size: 0xC80
	Parameters: 0
	Flags: Linked
*/
function function_c7c05a13()
{
	level.var_a16c38d9 = [];
	fields = zm_maptable::function_10672567();
	if(!isdefined(fields) || !isdefined(fields.zm_inventory))
	{
		return;
	}
	var_21249230 = getscriptbundle(fields.zm_inventory);
	level.var_a16c38d9 = [];
	if(isdefined(var_21249230.challenges) && isdefined(var_21249230.var_5a90928f))
	{
		clientfield = ("ChallengesInfo" + ".") + "stage";
		function_cb96f01d(var_21249230.var_5a90928f, clientfield, [1:#"stage", 0:#"challengesinfo"], 5, 1);
		if(isdefined(var_21249230.var_f7d932ea))
		{
			clientfield = ("ChallengesInfo" + ".") + "currentProgress";
			function_cb96f01d(var_21249230.var_f7d932ea, clientfield, [1:#"currentprogress", 0:#"challengesinfo"], 7, 1);
		}
	}
	if(isdefined(var_21249230.var_48fdfb9a) && isdefined(var_21249230.var_88c17f11))
	{
		clientfield = ((("ObjProgInfo" + ".") + "Eye") + ".") + "stage";
		function_cb96f01d(var_21249230.var_88c17f11, clientfield, [2:#"stage", 1:#"eye", 0:#"objproginfo"], 2, var_21249230.var_f3d39d90);
	}
	if(is_true(var_21249230.var_38b9613))
	{
		if(isdefined(var_21249230.var_ffb8d676))
		{
			for(i = 0; i < var_21249230.var_ffb8d676.size; i++)
			{
				item = var_21249230.var_ffb8d676[i];
				if(isdefined(item.var_846fa8e))
				{
					clientfield = (((("ObjProgInfo" + ".") + "NonlinearObjProgRingItemInfos") + ".") + (i + 1) + ".") + "earned";
					function_cb96f01d(item.var_846fa8e, clientfield, [3:#"earned", 2:hash((isdefined(i + 1) ? "" + (i + 1) : "")), 1:#"nonlinearobjprogringiteminfos", 0:#"objproginfo"], 1, var_21249230.var_f3d39d90);
				}
			}
		}
	}
	else if(isdefined(var_21249230.var_f4dc6a81) && isdefined(var_21249230.var_846fa8e))
	{
		clientfield = ((("ObjProgInfo" + ".") + "Ring") + ".") + "stage";
		function_cb96f01d(var_21249230.var_846fa8e, clientfield, [2:#"stage", 1:#"ring", 0:#"objproginfo"], 4, var_21249230.var_f3d39d90);
	}
	if(isdefined(var_21249230.var_207c2ef6))
	{
		for(i = 0; i < var_21249230.var_207c2ef6.size; i++)
		{
			item = var_21249230.var_207c2ef6[i];
			if(isdefined(item.clientfield))
			{
				clientfield = (("PaPItems" + ".") + (i + 1) + ".") + "stage";
				function_cb96f01d(item.clientfield, clientfield, [2:#"stage", 1:hash((isdefined(i + 1) ? "" + (i + 1) : "")), 0:#"papitems"], 2, item.var_7db3435c);
			}
		}
	}
	if(isdefined(var_21249230.var_50cf6c21))
	{
		if(isdefined(var_21249230.var_b10f2611))
		{
			clientfield = ("WonderWeaponPhaseInfo" + ".") + "phase";
			function_cb96f01d(var_21249230.var_b10f2611, clientfield, [1:#"phase", 0:#"wonderweaponphaseinfo"], 2, var_21249230.var_3e38620e);
		}
		var_867e2c15 = -1;
		var_b3aac704 = -1;
		index = 1;
		for(p = 0; p < var_21249230.var_50cf6c21.size; p++)
		{
			phase = var_21249230.var_50cf6c21[p];
			for(c = 0; c < phase.components.size; c++)
			{
				component = phase.components[c];
				if(isdefined(component.clientfield))
				{
					var_2641997d = ((("WonderWeaponItems" + ".") + index) + ".") + "stage";
					function_cb96f01d(component.clientfield, var_2641997d, [2:#"stage", 1:hash((isdefined(index) ? "" + index : "")), 0:#"wonderweaponitems"], 3, component.var_7db3435c);
				}
				if(isdefined(component.var_9f618001))
				{
					var_9f618001 = ((("WonderWeaponItems" + ".") + index) + ".") + "numAcquired";
					function_cb96f01d(component.var_9f618001, var_9f618001, [2:#"numacquired", 1:hash((isdefined(index) ? "" + index : "")), 0:#"wonderweaponitems"], 2, component.var_7db3435c);
				}
				index++;
			}
		}
	}
	if(isdefined(var_21249230.shieldpieces))
	{
		for(p = 0; p < var_21249230.shieldpieces.size; p++)
		{
			if(isdefined(var_21249230.shieldpieces[p].clientfield))
			{
				clientfield = (("ShieldPieces" + ".") + (p + 1) + ".") + "stage";
				function_cb96f01d(var_21249230.shieldpieces[p].clientfield, clientfield, [2:#"stage", 1:hash((isdefined(p + 1) ? "" + (p + 1) : "")), 0:#"shieldpieces"], 1, var_21249230.shieldpieces[p].var_7db3435c);
			}
		}
	}
	if(isdefined(var_21249230.quests))
	{
		for(q = 0; q < var_21249230.quests.size; q++)
		{
			quest = var_21249230.quests[q];
			if(isdefined(quest.var_a0ebe517))
			{
				var_e7e5896d = (("QuestPhaseInfos" + ".") + (q + 1) + ".") + "phase";
				function_cb96f01d(var_21249230.quests[q].var_a0ebe517, var_e7e5896d, [2:#"phase", 1:hash((isdefined(q + 1) ? "" + (q + 1) : "")), 0:#"questphaseinfos"], 2, var_21249230.quests[q].var_7db3435c);
			}
			var_d4cb13fd = "Quest" + (q + 1);
			index = 1;
			for(p = 0; p < quest.phases.size; p++)
			{
				phase = quest.phases[p];
				for(i = 0; i < phase.items.size; i++)
				{
					if(isdefined(phase.items[i].clientfield))
					{
						var_2641997d = (((var_d4cb13fd + ".") + index) + ".") + "stage";
						function_cb96f01d(phase.items[i].clientfield, var_2641997d, [2:#"stage", 1:hash((isdefined(index) ? "" + index : "")), 0:#"quest" + (q + 1)], 2, phase.items[i].var_7db3435c);
					}
					index++;
				}
			}
		}
	}
}

