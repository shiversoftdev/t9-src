#using script_139ae0bb0a87141c;
#using script_16a28d93ee216f6f;
#using script_1883fa4e60abbf9f;
#using script_3ad66e3076c279ab;
#using script_3eb3df5aef50b41c;
#using script_42310dfa1362069f;
#using script_4f58b276cb938e94;
#using script_5450c003e8a913b7;
#using script_6809bf766eba194a;
#using script_68d08b784c92da95;
#using script_6f8610e78fdd3440;
#using script_75ce7fc4212a82af;
#using script_7b68dad851540de;
#using script_7e3221b6c80d8cc4;
#using script_7ec0431a754945b3;
#using script_912160eeb6a2d51;
#using script_fe983bbff18d77f;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_77fd5d41;

/*
	Name: scalevolume
	Namespace: namespace_77fd5d41
	Checksum: 0x376272A3
	Offset: 0x4D0
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function scalevolume(ent, vol)
{
}

/*
	Name: main
	Namespace: namespace_77fd5d41
	Checksum: 0x81C1FD41
	Offset: 0x4F0
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function main()
{
	/#
		function_5ac4dc99("", 0);
	#/
}

/*
	Name: initstealthfunctions
	Namespace: namespace_77fd5d41
	Checksum: 0xE0024059
	Offset: 0x520
	Size: 0x18A
	Parameters: 0
	Flags: Linked
*/
function initstealthfunctions()
{
	self.var_d26a48de = &function_e5b8ad1b;
	self.fnsetstealthstate = &setstealthstate;
	self.fnisinstealthidle = &isidle;
	self.fnisinstealthinvestigate = &isinvestigating;
	self.fnisinstealthhunt = &ishunting;
	self.fnisinstealthcombat = &iscombating;
	self.fnstealthupdatevisionforlighting = &updatevisionforlighting;
	self.fnclearstealthvolume = &clearstealthvolume;
	self.fnstealthmusictransition = undefined;
	self.fnupdatelightmeter = undefined;
	self.fnstealthgotonode = &spawner::go_to_node;
	self.var_d28ad254 = &function_36915a04;
	self.var_40dd40ac = &function_7653ca27;
	self.var_ee308dc1 = &function_bf263c90;
	self.var_728f218b = &function_ffdd3cba;
	self.var_e892f39b = &function_589cf326;
	self.bt = spawnstruct();
	self.bt.instancedata = [];
}

/*
	Name: function_db1c5a52
	Namespace: namespace_77fd5d41
	Checksum: 0x77B9AF9E
	Offset: 0x6B8
	Size: 0xFE
	Parameters: 2
	Flags: Linked
*/
function function_db1c5a52(var_fb16d5c1, layer)
{
	if(!isdefined(layer))
	{
		layer = "task";
	}
	if(!isdefined(self.bt.taskid))
	{
		self.bt.taskid = [];
	}
	if(!isdefined(self.bt.taskid[layer]))
	{
		if(is_true(var_fb16d5c1))
		{
			self.bt.taskid[layer] = 0;
		}
		else
		{
			return undefined;
		}
	}
	if(is_true(var_fb16d5c1))
	{
		self.bt.taskid[layer]++;
	}
	return ((self.unique_id + "_") + layer) + self.bt.taskid[layer];
}

/*
	Name: ifinstealth
	Namespace: namespace_77fd5d41
	Checksum: 0xC374CE11
	Offset: 0x7C0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function ifinstealth(behaviortreeentity)
{
	if(!isdefined(self.stealth))
	{
		return false;
	}
	if(self.team == "allies")
	{
		return false;
	}
	if(self.stealth.bsmstate == 3)
	{
		return false;
	}
	return true;
}

/*
	Name: function_ba0a486b
	Namespace: namespace_77fd5d41
	Checksum: 0xDACF2730
	Offset: 0x820
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_ba0a486b(behaviortreeentity)
{
	return (gettime() - behaviortreeentity.damagetime) <= function_60d95f53();
}

/*
	Name: isidle
	Namespace: namespace_77fd5d41
	Checksum: 0xE226263D
	Offset: 0x858
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function isidle()
{
	return isdefined(self.stealth) && self.stealth.bsmstate == 0;
}

/*
	Name: isinvestigating
	Namespace: namespace_77fd5d41
	Checksum: 0xB9A9D6EB
	Offset: 0x888
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function isinvestigating()
{
	return isdefined(self.stealth) && self.stealth.bsmstate == 1;
}

/*
	Name: ishunting
	Namespace: namespace_77fd5d41
	Checksum: 0xA9203B92
	Offset: 0x8B8
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function ishunting()
{
	return isdefined(self.stealth) && self.stealth.bsmstate == 2;
}

/*
	Name: iscombating
	Namespace: namespace_77fd5d41
	Checksum: 0xF3B65A7B
	Offset: 0x8E8
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function iscombating()
{
	return isdefined(self.stealth) && self.stealth.bsmstate == 3;
}

/*
	Name: function_9a6e96bd
	Namespace: namespace_77fd5d41
	Checksum: 0xB249B184
	Offset: 0x918
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_9a6e96bd(behaviortreeentity)
{
	function_11d3f42d(behaviortreeentity);
	function_3031f40e(behaviortreeentity);
}

/*
	Name: function_4fff0007
	Namespace: namespace_77fd5d41
	Checksum: 0x656256D
	Offset: 0x960
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_4fff0007(behaviortreeentity)
{
	function_242c2d67(behaviortreeentity);
	function_bd5f9968(behaviortreeentity);
}

/*
	Name: function_3031f40e
	Namespace: namespace_77fd5d41
	Checksum: 0x83865A24
	Offset: 0x9A8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_3031f40e(behaviortreeentity)
{
	behaviortreeentity.keepclaimednode = 1;
	if(self flashlight::function_47df32b8())
	{
		self flashlight::function_7db73593();
	}
}

/*
	Name: function_242c2d67
	Namespace: namespace_77fd5d41
	Checksum: 0x33040AF6
	Offset: 0x9F8
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_242c2d67(behaviortreeentity)
{
	behaviortreeentity.keepclaimednode = 0;
}

/*
	Name: function_11d3f42d
	Namespace: namespace_77fd5d41
	Checksum: 0x489815FE
	Offset: 0xA18
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function function_11d3f42d(behaviortreeentity)
{
	behaviortreeentity.stealth.reacting = 1;
	if(!is_true(self.stealth.var_527ef51c))
	{
		self.stealth.var_7f670ead = 1;
	}
}

/*
	Name: function_bd5f9968
	Namespace: namespace_77fd5d41
	Checksum: 0x3DAB7272
	Offset: 0xA80
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function function_bd5f9968(behaviortreeentity)
{
	behaviortreeentity.stealth.reacting = undefined;
	self.stealth.var_7f670ead = undefined;
	behaviortreeentity notify(#"hash_22ca87c523f21d6d");
}

/*
	Name: function_3b8bcbc7
	Namespace: namespace_77fd5d41
	Checksum: 0x5217D5F3
	Offset: 0xAC8
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function function_3b8bcbc7(behaviortreeentity)
{
	if(self.team == "axis")
	{
		return true;
	}
	return false;
}

/*
	Name: stealth_shouldfriendly
	Namespace: namespace_77fd5d41
	Checksum: 0x7B8FBE31
	Offset: 0xAF8
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function stealth_shouldfriendly(behaviortreeentity)
{
	if(self.team == "allies")
	{
		return true;
	}
	return false;
}

/*
	Name: stealth_initfriendly
	Namespace: namespace_77fd5d41
	Checksum: 0x7F3E1544
	Offset: 0xB28
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function stealth_initfriendly(behaviortreeentity)
{
	self namespace_32a4062b::main();
	return true;
}

/*
	Name: stealth_terminatefriendly
	Namespace: namespace_77fd5d41
	Checksum: 0xF12C84C4
	Offset: 0xB58
	Size: 0x16
	Parameters: 1
	Flags: None
*/
function stealth_terminatefriendly(behaviortreeentity)
{
	self.stealth = undefined;
}

/*
	Name: stealth_shouldneutral
	Namespace: namespace_77fd5d41
	Checksum: 0x2C2D2ABA
	Offset: 0xB78
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function stealth_shouldneutral(behaviortreeentity)
{
	if(self.team == "neutral")
	{
		return true;
	}
	return false;
}

/*
	Name: stealth_initneutral
	Namespace: namespace_77fd5d41
	Checksum: 0xB93FA389
	Offset: 0xBA8
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function stealth_initneutral(behaviortreeentity)
{
	self namespace_578db516::main();
	return true;
}

/*
	Name: isinlight
	Namespace: namespace_77fd5d41
	Checksum: 0x5C781F41
	Offset: 0xBD8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function isinlight(var_474fe760)
{
	if(!isdefined(var_474fe760))
	{
		return !is_true(level.is_dark);
	}
	return var_474fe760 >= 0.5;
}

/*
	Name: updatevisionforlighting
	Namespace: namespace_77fd5d41
	Checksum: 0x80F724D1
	Offset: 0xC20
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function updatevisionforlighting()
{
}

/*
	Name: function_6a7ad1cf
	Namespace: namespace_77fd5d41
	Checksum: 0xCC6B6220
	Offset: 0xC30
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_6a7ad1cf(behaviortreeentity)
{
	if(is_true(self.flashlight.transition))
	{
		if(!isdefined(self.var_3ed929ba) && self getblackboardattribute("_flashlight") === "flashlight_out")
		{
			foreach(player in getplayers())
			{
				if(self getthreatsight(player) > 0)
				{
					return false;
				}
			}
		}
		return true;
	}
	return false;
}

/*
	Name: function_dcb14105
	Namespace: namespace_77fd5d41
	Checksum: 0x51961B6
	Offset: 0xD48
	Size: 0xDE
	Parameters: 1
	Flags: Linked
*/
function function_dcb14105(behaviortreeentity)
{
	if(is_true(self.flashlight.out))
	{
		if(isalive(self))
		{
			self setblackboardattribute("_flashlight", "flashlight_out");
			if(isdefined(self.var_710f0e6e))
			{
				self [[self.var_710f0e6e]](1);
			}
		}
	}
	else
	{
		self setblackboardattribute("_flashlight", "flashlight_stow");
		if(isdefined(self.fnstealthflashlightdetach))
		{
			self [[self.fnstealthflashlightdetach]]();
		}
	}
	self.flashlight.transition = undefined;
}

/*
	Name: stealth_enemy_getbsmstate
	Namespace: namespace_77fd5d41
	Checksum: 0x87AC147F
	Offset: 0xE30
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function stealth_enemy_getbsmstate(behaviortreeentity)
{
	switch(self.stealth.bsmstate)
	{
		case 0:
		{
			return "Stealth_Idle";
		}
		case 1:
		{
			return "Stealth_Investigate";
		}
		case 2:
		{
			return "Stealth_Hunt";
		}
		case 3:
		{
			return "Stealth_Combat";
		}
	}
}

/*
	Name: stealth_reacter_updateeveryframe
	Namespace: namespace_77fd5d41
	Checksum: 0x8CC2380C
	Offset: 0xEC8
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function stealth_reacter_updateeveryframe(behaviortreeentity)
{
	if(self.stealth.var_4df71901 === gettime())
	{
		return true;
	}
	self namespace_f1f700ac::proximity_check();
	switch(self.stealth.bsmstate)
	{
		case 0:
		{
			idle_update(self);
			break;
		}
	}
	self.stealth.var_4df71901 = gettime();
	return true;
}

/*
	Name: stealth_enemy_updateeveryframe
	Namespace: namespace_77fd5d41
	Checksum: 0x8369FEAA
	Offset: 0xF68
	Size: 0x19A
	Parameters: 1
	Flags: Linked
*/
function stealth_enemy_updateeveryframe(behaviortreeentity)
{
	if(self.stealth.var_4df71901 === gettime())
	{
		return 1;
	}
	var_e8c7dd7e = level flag::get("react_to_dynolights");
	if(var_e8c7dd7e && !isdefined(self.lightmeter))
	{
		namespace_979752dc::update_light_meter();
		var_e8c7dd7e = 0;
	}
	self updatelightbasedflashlight(self.stealth.bsmstate, 0.5);
	if(var_e8c7dd7e)
	{
		entnum = self getentitynumber();
		frametime = level.frameduration;
		/#
			assert(isdefined(frametime));
		#/
		if(((gettime() / frametime) % 5) == (entnum % 5))
		{
			namespace_979752dc::update_light_meter();
		}
	}
	self function_d19483ee();
	self stealth_corpse::corpse_sight();
	self ai::look_at(self.cqb_target);
	return stealth_reacter_updateeveryframe(behaviortreeentity);
}

/*
	Name: stealth_neutral_updateeveryframe
	Namespace: namespace_77fd5d41
	Checksum: 0xE55AFED5
	Offset: 0x1110
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function stealth_neutral_updateeveryframe(behaviortreeentity)
{
	return stealth_reacter_updateeveryframe(behaviortreeentity);
}

/*
	Name: function_55c47950
	Namespace: namespace_77fd5d41
	Checksum: 0xDE6006A0
	Offset: 0x1140
	Size: 0x152
	Parameters: 2
	Flags: Linked
*/
function function_55c47950(var_7a44d7c, event)
{
	if(self ai::has_behavior_attribute("stealth"))
	{
		switch(event)
		{
			case 0:
			{
				self.awarenesslevelcurrent = "unaware";
				self ai::set_behavior_attribute("stealth", 1);
				break;
			}
			case 1:
			{
				self.awarenesslevelcurrent = "low_alert";
				self ai::set_behavior_attribute("stealth", 1);
				break;
			}
			case 2:
			{
				self.awarenesslevelcurrent = "high_alert";
				self ai::set_behavior_attribute("stealth", 1);
				break;
			}
			case 3:
			{
				self.awarenesslevelcurrent = "combat";
				self ai::set_behavior_attribute("stealth", 0);
				break;
			}
		}
	}
}

/*
	Name: enterstealthstate
	Namespace: namespace_77fd5d41
	Checksum: 0x4E5C7F34
	Offset: 0x12A0
	Size: 0x142
	Parameters: 2
	Flags: Linked
*/
function enterstealthstate(var_7a44d7c, event)
{
	exitstealthstate(self.stealth.bsmstate);
	if(self.stealth.bsmstate !== var_7a44d7c)
	{
		self.stealth.var_9b6cd53f = gettime();
	}
	self.stealth.bsmstate = var_7a44d7c;
	self function_55c47950(var_7a44d7c, event);
	switch(var_7a44d7c)
	{
		case 0:
		{
			idle_init(self);
			break;
		}
		case 1:
		{
			investigate_init();
			break;
		}
		case 2:
		{
			hunt_init();
			break;
		}
		case 3:
		{
			combat_init();
			break;
		}
	}
}

/*
	Name: exitstealthstate
	Namespace: namespace_77fd5d41
	Checksum: 0xC5DA893D
	Offset: 0x13F0
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function exitstealthstate(var_7a44d7c)
{
	switch(var_7a44d7c)
	{
		case 0:
		{
			idle_terminate(self);
			break;
		}
		case 1:
		{
			investigate_terminate();
			break;
		}
		case 2:
		{
			hunt_terminate();
			break;
		}
		case 3:
		{
			combat_terminate();
			break;
		}
	}
}

/*
	Name: isdonewithsearchmove
	Namespace: namespace_77fd5d41
	Checksum: 0x18205A36
	Offset: 0x14C0
	Size: 0x198
	Parameters: 1
	Flags: Linked
*/
function isdonewithsearchmove(instancedata)
{
	curtime = gettime();
	if(curtime > (instancedata.starttime + 500) && (!isdefined(self.pathgoalpos) || distance2dsquared(self.pathgoalpos, self.origin) < 4) && !self.isarriving && !isdefined(self.ai.doortoopen))
	{
		if(!isdefined(self.stealth.var_627b2039))
		{
			return true;
		}
		var_16922a23 = self.stealth.var_627b2039;
		if(!isvec(var_16922a23))
		{
			var_16922a23 = var_16922a23.origin;
		}
		if(distance2dsquared(self.origin, var_16922a23) < 3600 && (sqr(var_16922a23[2] - self.origin[2])) < 5184)
		{
			return true;
		}
		if(!isdefined(instancedata.numfails))
		{
			instancedata.numfails = 0;
		}
		instancedata.numfails++;
		instancedata.starttime = curtime;
		if(instancedata.numfails >= 10)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_d19483ee
	Namespace: namespace_77fd5d41
	Checksum: 0xE53CBB64
	Offset: 0x1660
	Size: 0x198
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d19483ee()
{
	entnum = self getentitynumber();
	range = (isdefined(self.var_1c936867) ? self.var_1c936867 : 850);
	cosfov = 0.866;
	foreach(player in getplayers())
	{
		if(!isdefined(player.stealth))
		{
			continue;
		}
		if(!isdefined(player.stealth.var_f6c2537d))
		{
			player.stealth.var_f6c2537d = [];
		}
		player.stealth.var_f6c2537d[entnum] = undefined;
		if(range <= player.maxvisibledist && self flashlight::function_51dea76e(player))
		{
			player.stealth.var_f6c2537d[entnum] = self;
		}
		arrayremovevalue(player.stealth.var_f6c2537d, undefined, 1);
	}
}

/*
	Name: function_7c7868e8
	Namespace: namespace_77fd5d41
	Checksum: 0x98D0D4B5
	Offset: 0x1800
	Size: 0x42
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7c7868e8()
{
	if(ishunting())
	{
		return self flashlight::function_3aec1b7();
	}
	return self flashlight::function_b8090745();
}

/*
	Name: updatelightbasedflashlight
	Namespace: namespace_77fd5d41
	Checksum: 0x4379CA77
	Offset: 0x1850
	Size: 0x204
	Parameters: 2
	Flags: Linked
*/
function updatelightbasedflashlight(state, var_2fd642f)
{
	if(self isinscriptedstate())
	{
		return;
	}
	if(gettime() == self.stealth.starttime)
	{
		return;
	}
	lightmeter = self.lightmeter;
	/#
		if(getdvarint(#"hash_55b967be4d026006", 0))
		{
			lightmeter = 0;
		}
	#/
	var_3b69096c = self function_7c7868e8();
	var_4da08689 = var_3b69096c;
	if(isdefined(self.flashlightoverride))
	{
		var_4da08689 = self.flashlightoverride;
	}
	else
	{
		if(is_true(self.noflashlight))
		{
			var_4da08689 = 0;
		}
		else
		{
			if(isdefined(lightmeter))
			{
				var_86c3b867 = 0.1;
				if(var_3b69096c)
				{
					if(lightmeter > var_2fd642f + var_86c3b867)
					{
						var_4da08689 = 0;
					}
				}
				else
				{
					var_4da08689 = lightmeter < var_2fd642f;
				}
			}
			else
			{
				var_4da08689 = is_true(level.is_dark);
			}
		}
	}
	if(self flag::get("flashlight_on"))
	{
		var_4da08689 = 1;
	}
	else if(self flag::get("flashlight_off"))
	{
		var_4da08689 = 0;
	}
	if(var_3b69096c != var_4da08689)
	{
		if(ishunting())
		{
			self flashlight::function_8d59ee47(var_4da08689);
		}
		else
		{
			self flashlight::function_9b7441d1(var_4da08689);
		}
	}
}

/*
	Name: idle_updatestyle
	Namespace: namespace_77fd5d41
	Checksum: 0x794D53D
	Offset: 0x1A60
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function idle_updatestyle(instancedata)
{
	self namespace_f1f700ac::setpatrolstyle_base();
	instancedata.nextstylechecktime = gettime() + randomintrange(500, 2000);
	if(isdefined(self.stealth.patrol_moveplaybackrate))
	{
		self.moveplaybackrate = self.stealth.patrol_moveplaybackrate;
	}
	else
	{
		self.moveplaybackrate = 1;
	}
}

/*
	Name: function_efc17e1a
	Namespace: namespace_77fd5d41
	Checksum: 0x2D8F09F7
	Offset: 0x1AF8
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function function_efc17e1a(behaviortreeentity)
{
	var_e4ef5000 = self function_4794d6a3();
	if(isdefined(var_e4ef5000.goalangles) && !self haspath() && (self ai::get_behavior_attribute("demeanor") === "patrol" || self ai::get_behavior_attribute("demeanor") === "alert"))
	{
		if(absangleclamp180(self.angles[1] - var_e4ef5000.goalangles[1]) > 45)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_fe3c7909
	Namespace: namespace_77fd5d41
	Checksum: 0x4911CA4F
	Offset: 0x1BF0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_fe3c7909(behaviortreeentity)
{
	return function_6f8594d4(50);
}

/*
	Name: function_6f8594d4
	Namespace: namespace_77fd5d41
	Checksum: 0x31EFB215
	Offset: 0x1C20
	Size: 0xDA
	Parameters: 1
	Flags: Linked
*/
function function_6f8594d4(var_b7d36d34)
{
	if(isdefined(self.stealth.corpse.ent) && distancesquared(self.stealth.corpse.ent.origin, self.origin) < sqr(var_b7d36d34))
	{
		if(!is_true(self.stealth.corpse.ent.investigated))
		{
			self.stealth.corpse.ent.investigated = 1;
			return true;
		}
	}
	return false;
}

/*
	Name: function_ff473d5
	Namespace: namespace_77fd5d41
	Checksum: 0xA1B4D778
	Offset: 0x1D08
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_ff473d5(behaviortreeentity)
{
	if(!btapi_shouldarriveexposed(behaviortreeentity))
	{
		return 0;
	}
	return function_6f8594d4(100);
}

/*
	Name: function_26e16543
	Namespace: namespace_77fd5d41
	Checksum: 0xE30FC423
	Offset: 0x1D58
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_26e16543(behaviortreeentity)
{
	return is_true(self.stealth.bidlecurious);
}

/*
	Name: function_6c404960
	Namespace: namespace_77fd5d41
	Checksum: 0x200085E6
	Offset: 0x1D90
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function function_6c404960(behaviortreeentity)
{
	if(function_5bfdfc9d())
	{
		return false;
	}
	if(self stealth_shouldinvestigate(behaviortreeentity) || self stealth_shouldhunt(behaviortreeentity))
	{
		if(self function_efc17e1a(behaviortreeentity))
		{
			return false;
		}
		return true;
	}
	return false;
}

/*
	Name: function_96903634
	Namespace: namespace_77fd5d41
	Checksum: 0xE132BA6
	Offset: 0x1E18
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_96903634(behaviortreeentity)
{
	return is_true(self.stealth.var_ca926557);
}

/*
	Name: function_ffdd3cba
	Namespace: namespace_77fd5d41
	Checksum: 0x9D392D8C
	Offset: 0x1E50
	Size: 0x80
	Parameters: 6
	Flags: Linked
*/
function function_ffdd3cba(mode, target, tag, duration, sethealth, ignorefirstshotwait)
{
	if(namespace_979752dc::get_stealth_state() != "normal")
	{
		return false;
	}
	self.stealth.var_ca926557 = 1;
	self thread function_d346f1cf();
	return true;
}

/*
	Name: function_d346f1cf
	Namespace: namespace_77fd5d41
	Checksum: 0x5A07F699
	Offset: 0x1ED8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_d346f1cf()
{
	self notify("b478fa11a5368c9");
	self endon("b478fa11a5368c9");
	self endon(#"death", #"stop_shoot_at_target");
	level waittill(#"stealth_event");
	self ai::stop_shoot_at_target();
}

/*
	Name: function_589cf326
	Namespace: namespace_77fd5d41
	Checksum: 0x2AE88071
	Offset: 0x1F50
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_589cf326(target)
{
	self.stealth.var_ca926557 = 0;
}

/*
	Name: function_e73fe99
	Namespace: namespace_77fd5d41
	Checksum: 0xDEABE94A
	Offset: 0x1F78
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_e73fe99(behaviortreeentity)
{
	if(!isdefined(self.stealth))
	{
		return false;
	}
	if(self.awarenesslevelcurrent !== "unaware")
	{
		self.stealth.var_e39ea5e7 = undefined;
	}
	if(is_true(self.stealth.var_e39ea5e7))
	{
		return true;
	}
	return false;
}

/*
	Name: function_5db27177
	Namespace: namespace_77fd5d41
	Checksum: 0x8F1A3F31
	Offset: 0x1FE8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function function_5db27177(behaviortreeentity)
{
	self.stealth.var_e39ea5e7 = undefined;
}

/*
	Name: idle_updatecurious
	Namespace: namespace_77fd5d41
	Checksum: 0xAE1D68E7
	Offset: 0x2010
	Size: 0x234
	Parameters: 1
	Flags: Linked
*/
function idle_updatecurious(behaviortreeentity)
{
	target = undefined;
	var_d37db7af = 0;
	foreach(player in getplayers())
	{
		threatsight = self getthreatsight(player);
		if(!isdefined(target) || threatsight > var_d37db7af)
		{
			target = player;
			var_d37db7af = threatsight;
		}
	}
	threatsight = var_d37db7af;
	var_85153501 = 0.25;
	if(self.stealth.bidlecurious)
	{
		var_9f0689a6 = 2000;
		if(threatsight >= var_85153501)
		{
			self.stealth.curiousstarttime = gettime();
		}
		if(gettime() > self.stealth.curiousstarttime + var_9f0689a6)
		{
			if(threatsight < var_85153501 * 0.9)
			{
				self.stealth.bidlecurious = 0;
				self.stealth.idlecurioustarget = undefined;
			}
		}
	}
	else if(threatsight >= var_85153501 && !is_true(self.stealth.bidlecurious) && ai::function_5e5653d3())
	{
		self.stealth.bidlecurious = 1;
		self.stealth.idlecurioustarget = target;
		self.stealth.curiousstarttime = gettime();
		self namespace_979752dc::set_patrol_react(target.origin, "small");
	}
}

/*
	Name: updatesightstate
	Namespace: namespace_77fd5d41
	Checksum: 0xC6894050
	Offset: 0x2250
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
*/
function updatesightstate(sightstate)
{
	/#
		assert(!iscombating());
	#/
	if(level flag::get("stealth_spotted"))
	{
		sightstate = "hunt";
	}
	var_839ed558 = !isdefined(self.stealth.threat_sight_state);
	if(!var_839ed558)
	{
		switch(self.stealth.threat_sight_state)
		{
			case "hash_4b55a59a56c4bdb3":
			{
				var_839ed558 = sightstate != "hunt" && sightstate != "combat_hunt";
				break;
			}
			case "spotted":
			{
				var_839ed558 = sightstate != "combat" && sightstate != "spotted";
				break;
			}
			case "hidden":
			{
				var_839ed558 = sightstate != "idle" && sightstate != "unaware" && sightstate != "hidden";
				break;
			}
			default:
			{
				var_839ed558 = self.stealth.threat_sight_state != sightstate;
				break;
			}
		}
	}
	if(var_839ed558)
	{
		self namespace_f1f700ac::set_sight_state(sightstate);
	}
}

/*
	Name: idle_init
	Namespace: namespace_77fd5d41
	Checksum: 0xF4D5A0D9
	Offset: 0x2410
	Size: 0x31A
	Parameters: 1
	Flags: Linked
*/
function idle_init(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(1, "idle");
	self.bt.instancedata[taskid] = spawnstruct();
	self.favoriteenemy = undefined;
	self.dontattackme = 1;
	self.shootposoverride = undefined;
	self.stealth.reachedinvestigate = 0;
	self thread stealth_corpse::corpse_clear();
	idle_updatestyle(self.bt.instancedata[taskid]);
	self.combatmode = "no_cover";
	foreach(player in getplayers())
	{
		if(!isdefined(player.stealth))
		{
			continue;
		}
		if(!isdefined(player.stealth.spotted_list))
		{
			continue;
		}
		player.stealth.spotted_list[self.unique_id] = undefined;
	}
	self.diequietly = 1;
	self clearenemy();
	self.stealth.bidlecurious = 0;
	self.bt.instancedata[taskid].curiousstarttime = -1;
	self thread namespace_f1f700ac::set_alert_level("reset");
	self stealth_event::event_escalation_clear();
	if(isdefined(self.stealth.funcs[#"hidden"]))
	{
		self namespace_b2b86d39::stealth_call_thread("hidden");
	}
	if(isdefined(self.stealth.last_goal))
	{
		if(isdefined(self.fnstealthgotonode) && isdefined(self.stealth.last_goal))
		{
			if(!isvec(self.stealth.last_goal))
			{
				self thread [[self.fnstealthgotonode]](self.stealth.last_goal);
			}
			else
			{
				self namespace_979752dc::set_goal(self.stealth.last_goal, undefined, 32);
			}
		}
	}
	self.gunposeoverride_internal = "gun_down";
}

/*
	Name: idle_update
	Namespace: namespace_77fd5d41
	Checksum: 0xEC4810DA
	Offset: 0x2738
	Size: 0x1E0
	Parameters: 1
	Flags: Linked
*/
function idle_update(behaviortreeentity)
{
	self endon(#"idle_terminate");
	taskid = behaviortreeentity function_db1c5a52(0, "idle");
	if(is_true(self.stealth.blind))
	{
		self updatesightstate("blind");
	}
	else
	{
		self updatesightstate("hidden");
	}
	if(isdefined(self.stealth.active_sense_funcs))
	{
		foreach(func in self.stealth.active_sense_funcs)
		{
			self [[func]]();
		}
	}
	curtime = gettime();
	if(curtime >= self.bt.instancedata[taskid].nextstylechecktime)
	{
		idle_updatestyle(self.bt.instancedata[taskid]);
	}
	idle_updatecurious(self.bt.instancedata[taskid]);
	self function_f7659f0d();
	return true;
}

/*
	Name: idle_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0xF3AE67A9
	Offset: 0x2920
	Size: 0x100
	Parameters: 1
	Flags: Linked
*/
function idle_terminate(behaviortreeentity)
{
	self notify(#"idle_terminate");
	taskid = behaviortreeentity function_db1c5a52(0, "idle");
	self.diequietly = 0;
	self.stealth.bidlecurious = undefined;
	self.stealth.idlecurioustarget = undefined;
	self.stealth.var_667f860f = undefined;
	self.stealth.var_46f4d537 = undefined;
	if(self.stealth.bsmstate != 1)
	{
		self.cqb_target = undefined;
	}
	self namespace_979752dc::save_last_goal();
	self.last_set_goalnode = undefined;
	self.last_set_goalent = undefined;
	self.moveplaybackrate = 1;
	self.bt.instancedata[taskid] = undefined;
}

/*
	Name: function_f7659f0d
	Namespace: namespace_77fd5d41
	Checksum: 0x4DA6BF06
	Offset: 0x2A28
	Size: 0x14A
	Parameters: 0
	Flags: Linked
*/
function function_f7659f0d()
{
	if(self.stealth.bidlecurious && isdefined(self.stealth.idlecurioustarget))
	{
		self.cqb_target = self lastknownpos(self.stealth.idlecurioustarget);
	}
	else
	{
		var_26b3b46a = 0;
		foreach(player in getplayers())
		{
			threat = self getthreatsight(player);
			if(threat > 0.1)
			{
				self.cqb_target = self lastknownpos(player);
				var_26b3b46a = 1;
				break;
			}
		}
		if(!var_26b3b46a)
		{
			self.cqb_target = undefined;
		}
	}
}

/*
	Name: stealth_shouldinvestigate
	Namespace: namespace_77fd5d41
	Checksum: 0xC7033AB3
	Offset: 0x2B80
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function stealth_shouldinvestigate(behaviortreeentity)
{
	if(self.stealth.bsmstate == 1)
	{
		return true;
	}
	return false;
}

/*
	Name: findclosestlospointwithin
	Namespace: namespace_77fd5d41
	Checksum: 0x8E1C9466
	Offset: 0x2BB8
	Size: 0x17A
	Parameters: 7
	Flags: Linked
*/
function findclosestlospointwithin(pod, var_72cc3c18, var_465a4fd5, vol, scriptgoalpos, var_f9817e78, var_caa9db69)
{
	if(isdefined(vol))
	{
		pos = namespace_206491b4::findclosestlospointwithinvolume(vol, var_72cc3c18, var_465a4fd5, (isdefined(pod) ? pod.usedpoints : undefined), 48);
		if(isdefined(pos) && isdefined(var_caa9db69) && var_caa9db69 && !investigate_sanitycheckinitialpos(var_72cc3c18, pos))
		{
			return undefined;
		}
		return pos;
	}
	if(var_f9817e78 > 64 && isdefined(scriptgoalpos))
	{
		pos = namespace_206491b4::findclosestlospointwithinradius(scriptgoalpos, var_f9817e78, var_72cc3c18, var_465a4fd5, (isdefined(pod) ? pod.usedpoints : undefined), 48);
		if(isdefined(pos) && isdefined(var_caa9db69) && var_caa9db69 && !investigate_sanitycheckinitialpos(var_72cc3c18, pos))
		{
			return undefined;
		}
		return pos;
	}
	return getrandomnavpoint(var_72cc3c18, 200);
}

/*
	Name: investigate_sanitycheckinitialpos
	Namespace: namespace_77fd5d41
	Checksum: 0x2939B23A
	Offset: 0x2D40
	Size: 0xB6
	Parameters: 2
	Flags: Linked
*/
function investigate_sanitycheckinitialpos(var_844650da, var_99400a59)
{
	var_f578e91a = vectornormalize(var_844650da - self.origin);
	var_ea982379 = var_99400a59 - self.origin;
	var_de013700 = length(var_ea982379);
	if(var_de013700 > 256)
	{
		var_ea982379 = var_ea982379 / var_de013700;
		if(vectordot(var_ea982379, var_f578e91a) < -0.5)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: investigate_getcorpseoffsetpos
	Namespace: namespace_77fd5d41
	Checksum: 0x5021959F
	Offset: 0x2E00
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function investigate_getcorpseoffsetpos(var_a6448663)
{
	var_c1edb9e5 = var_a6448663 - self.origin;
	offsetpos = var_a6448663 - (vectornormalize(var_c1edb9e5) * 32);
	offsetpos = getclosestpointonnavmesh(offsetpos, 500);
	return offsetpos;
}

/*
	Name: investigate_getinitialpos
	Namespace: namespace_77fd5d41
	Checksum: 0x6BEEABE4
	Offset: 0x2E80
	Size: 0x7BC
	Parameters: 0
	Flags: Linked
*/
function investigate_getinitialpos()
{
	var_8747f6cc = 1;
	event = self.stealth.investigateevent;
	if(isdefined(self.stealth.investigate_point))
	{
		if(isvec(self.stealth.investigate_point))
		{
			pos = getclosestpointonnavmesh(self.stealth.investigate_point, 500);
		}
		else
		{
			if(isdefined(self.stealth.investigate_point.origin))
			{
				pos = getclosestpointonnavmesh(self.stealth.investigate_point.origin, 500);
			}
			else
			{
				pos = self.origin;
			}
		}
		if(!isdefined(pos))
		{
			pos = self.stealth.investigate_point;
		}
		var_39725a4e = vectornormalize(self.goalpos - self.origin);
		dirfacing = anglestoforward(self.angles);
		var_93a2516c = vectornormalize(pos - self.origin);
		if(isplayer(event.entity) && !isplayer(self.stealth.investigate_entity))
		{
			var_8747f6cc = 1;
		}
		else
		{
			if(vectordot(var_39725a4e, var_93a2516c) < 0 && vectordot(dirfacing, var_93a2516c) < 0)
			{
				var_8747f6cc = 1;
			}
			else
			{
				if(event.typeorig == "saw_corpse")
				{
					var_8747f6cc = 1;
				}
				else if(var_8747f6cc && distancesquared(self.goalpos, pos) < sqr(300))
				{
					var_8747f6cc = 0;
				}
			}
		}
	}
	if(var_8747f6cc)
	{
		var_5f25f38e = level.stealth.investigate_volumes[self.script_stealthgroup];
		groupdata = stealth_group::getgroup(self.script_stealthgroup);
		pod = stealth_group::group_findpod(groupdata, self);
		/#
			assert(isdefined(pod));
		#/
		var_ca361e0e = 0;
		var_f6fb36e9 = 0;
		var_d5379974 = 0;
		if(isdefined(pod.investigateoriginguy) && pod.investigateoriginguy == self || pod.members[0] == self)
		{
			var_ca361e0e = 1;
		}
		else
		{
			if(distancesquared(self.origin, event.investigate_pos) < 16384)
			{
				var_d5379974 = 1;
			}
			else if(pod.members.size > 1 && pod.members[1] == self)
			{
				var_f6fb36e9 = 1;
			}
		}
		var_99400a59 = undefined;
		if(var_ca361e0e)
		{
			if(event.typeorig == "saw_corpse" || distance2dsquared(self.origin, event.investigate_pos) < 4096)
			{
				var_99400a59 = event.investigate_pos;
				if(event.typeorig == "saw_corpse")
				{
					var_99400a59 = investigate_getcorpseoffsetpos(var_99400a59);
				}
				if(isdefined(var_5f25f38e))
				{
					var_2279f286 = self findlastpointonpathwithinvolume(var_99400a59, var_5f25f38e);
					if(isdefined(var_2279f286))
					{
						var_99400a59 = var_2279f286;
					}
				}
			}
			if(event.typeorig == "sight" && isdefined(event.entity) && self cansee(event.entity))
			{
				var_99400a59 = event.entity.origin;
			}
			if(!isdefined(var_99400a59))
			{
				var_99400a59 = findclosestlospointwithin(pod, event.investigate_pos, event.investigate_pos, var_5f25f38e, self.scriptgoalpos, self.goalradius, 1);
				if(!isdefined(var_99400a59))
				{
					if(isdefined(var_5f25f38e))
					{
						var_99400a59 = self findlastpointonpathwithinvolume(event.investigate_pos, var_5f25f38e);
					}
					if(!isdefined(var_99400a59))
					{
						var_99400a59 = findclosestlospointwithin(pod, event.investigate_pos, self.origin, var_5f25f38e, self.scriptgoalpos, self.goalradius, 1);
					}
					if(!isdefined(var_99400a59))
					{
						var_99400a59 = self.origin;
					}
				}
			}
		}
		else
		{
			if(var_f6fb36e9)
			{
				f = randomfloatrange(0.7, 0.85);
				var_99400a59 = vectorlerp(self.origin, event.investigate_pos, f);
				var_99400a59 = findclosestlospointwithin(pod, var_99400a59, var_99400a59, var_5f25f38e, self.scriptgoalpos, self.goalradius);
			}
			else if(!var_d5379974)
			{
				var_99400a59 = findclosestlospointwithin(pod, event.investigate_pos, self.origin, var_5f25f38e, self.scriptgoalpos, self.goalradius);
			}
		}
		if(isdefined(var_99400a59) && !investigate_sanitycheckinitialpos(event.investigate_pos, var_99400a59))
		{
			var_99400a59 = undefined;
		}
		if(!isdefined(var_99400a59))
		{
			var_99400a59 = investigate_getuninvestigatedpos();
		}
		else
		{
			stealth_group::pod_addusedpoint(pod, var_99400a59);
		}
		if(isvec(var_99400a59))
		{
			var_99400a59 = util::ground_position(var_99400a59, 100);
		}
		else if(!smart_object::function_1631909f(var_99400a59))
		{
			var_99400a59.origin = util::ground_position(var_99400a59.origin, 100);
		}
		self.stealth.var_627b2039 = var_99400a59;
		return var_99400a59;
	}
}

/*
	Name: investigate_getuninvestigatedpos
	Namespace: namespace_77fd5d41
	Checksum: 0x95AD1A21
	Offset: 0x3648
	Size: 0x102
	Parameters: 0
	Flags: Linked
*/
function investigate_getuninvestigatedpos()
{
	groupdata = stealth_group::getgroup(self.script_stealthgroup);
	pod = stealth_group::group_findpod(groupdata, self);
	if(isdefined(pod.investigateoriginguy) && pod.investigateoriginguy == self)
	{
		var_99400a59 = undefined;
		if(isdefined(pod.volume))
		{
			var_99400a59 = self findlastpointonpathwithinvolume(pod.origin, pod.volume);
		}
		if(!isdefined(var_99400a59))
		{
			var_99400a59 = getclosestpointonnavmesh(pod.origin, 500);
		}
		pod.investigateoriginguy = undefined;
	}
	else
	{
		var_99400a59 = stealth_group::group_getinvestigatepoint(self);
	}
	return var_99400a59;
}

/*
	Name: setinvestigateendtime
	Namespace: namespace_77fd5d41
	Checksum: 0x9D9D4FAD
	Offset: 0x3758
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function setinvestigateendtime()
{
	investigatemintime = 15;
	investigatemaxtime = 20;
	if(isdefined(self.stealth.corpse))
	{
		investigatemintime = 25;
		investigatemaxtime = 35;
	}
	if(isdefined(self.stealth.investigatemintime))
	{
		investigatemintime = self.stealth.investigatemintime;
	}
	if(isdefined(self.stealth.investigatemaxtime))
	{
		investigatemaxtime = self.stealth.investigatemaxtime;
	}
	self.stealth.investigateendtime = gettime() + (randomintrange(investigatemintime, investigatemaxtime) * 1000);
	self.stealth.var_3bf603d9 = undefined;
}

/*
	Name: function_c8d4ba1
	Namespace: namespace_77fd5d41
	Checksum: 0x8DCD488C
	Offset: 0x3840
	Size: 0xB2
	Parameters: 0
	Flags: Linked
*/
function function_c8d4ba1()
{
	var_fec323b3 = 5;
	var_3af586f1 = 10;
	if(isdefined(self.stealth.var_fec323b3))
	{
		investigatemintime = self.stealth.var_fec323b3;
	}
	if(isdefined(self.stealth.var_3af586f1))
	{
		investigatemaxtime = self.stealth.var_3af586f1;
	}
	self.stealth.var_3bf603d9 = gettime() + (randomintrange(var_fec323b3, var_3af586f1) * 1000);
}

/*
	Name: investigate_shouldfacedecentdirectionwhenidle
	Namespace: namespace_77fd5d41
	Checksum: 0x44044268
	Offset: 0x3900
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function investigate_shouldfacedecentdirectionwhenidle()
{
	return !is_true(self.limitstealthturning);
}

/*
	Name: function_d004e2c7
	Namespace: namespace_77fd5d41
	Checksum: 0xE868EA48
	Offset: 0x3928
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_d004e2c7(event)
{
	self.stealth.investigateevent = event;
	self.stealth.investigateevent_time = gettime();
	self setinvestigateendtime();
	self.stealth.binitialinvestigate = 0;
	investigate_setreaction(event);
	if(!self isinscriptedstate())
	{
		if(is_true(self.stealthforcegundown))
		{
			self.gunposeoverride_internal = "gun_down";
		}
		else
		{
			self.gunposeoverride_internal = "ready";
		}
	}
	self.stealth.investigate_point = self investigate_getinitialpos();
	if(isdefined(self.stealth.investigate_point))
	{
		faceangles = self namespace_206491b4::function_24b5e32(self.stealth.investigate_point);
		self namespace_979752dc::set_goal(self.stealth.investigate_point, faceangles);
	}
}

/*
	Name: investigate_init
	Namespace: namespace_77fd5d41
	Checksum: 0xC6511BBE
	Offset: 0x3A80
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function investigate_init()
{
	/#
		assert(isdefined(self.stealth.investigateevent));
	#/
	event = self.stealth.investigateevent;
	self.stealth.investigate_severity = event.type;
	self.stealth.investigate_entity = event.entity;
	self smart_object::function_a59dc8a8(self.smart_object);
	self.script_forcegoal = 0;
	updatesightstate("investigate");
	self.diequietly = 1;
	investigate_setreaction(event);
	self setinvestigateendtime();
	self.stealth.binitialinvestigate = 1;
	if(!self isinscriptedstate())
	{
		if(is_true(self.stealthforcegundown))
		{
			self.gunposeoverride_internal = "gun_down";
		}
		else
		{
			self.gunposeoverride_internal = "ready";
		}
	}
	self.stealth.investigate_point = self investigate_getinitialpos();
	if(isdefined(self.stealth.investigate_point))
	{
		faceangles = self namespace_206491b4::function_24b5e32(self.stealth.investigate_point);
		self namespace_979752dc::set_goal(self.stealth.investigate_point, faceangles);
	}
}

/*
	Name: investigate_setreaction
	Namespace: namespace_77fd5d41
	Checksum: 0x18B30EBC
	Offset: 0x3C68
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function investigate_setreaction(event)
{
	var_7137846d = "small";
	if(event.typeorig == "bulletwhizby" || event.typeorig == "grenade danger")
	{
		var_7137846d = "medium";
	}
	else
	{
		if(event.typeorig == "footstep_sprint")
		{
			if(isdefined(event.entity) && isplayer(event.entity) && event.entity namespace_6c0cd084::player_is_sprinting_at_me(self))
			{
				var_7137846d = "medium";
			}
		}
		else if(event.typeorig == "sight" && self.alertlevel == "high_alert" && self namespace_979752dc::function_d58e1c1c())
		{
			var_7137846d = "small_medium";
		}
	}
	self namespace_979752dc::set_patrol_react(event.investigate_pos, var_7137846d);
}

/*
	Name: function_2640a26c
	Namespace: namespace_77fd5d41
	Checksum: 0xE03E33F4
	Offset: 0x3DB0
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_2640a26c(forced)
{
	if(is_true(forced) || (isdefined(self.stealth.var_3bf603d9) && gettime() >= self.stealth.var_3bf603d9))
	{
		if(!is_true(forced) && isdefined(self.smart_object))
		{
			if(distancesquared(self.smart_object.origin, self.goalpos) > sqr(self.goalradius))
			{
				goal = self.smart_object smart_object::get_goal();
				self namespace_979752dc::set_goal(goal, undefined, goal.goalradius);
			}
			else
			{
				return false;
			}
		}
		if(self.stealth.bsmstate == 2)
		{
			self hunt_getpos();
		}
		else if(!self function_76431493())
		{
			self function_11ad9ad4();
		}
	}
}

/*
	Name: function_76431493
	Namespace: namespace_77fd5d41
	Checksum: 0xC12A868A
	Offset: 0x3F28
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_76431493()
{
	if(isdefined(self.stealth.investigateendtime) && gettime() >= self.stealth.investigateendtime)
	{
		self util::delay(0.05, undefined, &setstealthstate, "idle");
		return true;
	}
	return false;
}

/*
	Name: investigate_updateeveryframe
	Namespace: namespace_77fd5d41
	Checksum: 0xB502359B
	Offset: 0x3FA0
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function investigate_updateeveryframe(behaviortreeentity)
{
	self updatesightstate("investigate");
	if(isdefined(self.stealth.active_sense_funcs))
	{
		foreach(func in self.stealth.active_sense_funcs)
		{
			self [[func]]();
		}
	}
	self function_2640a26c();
	return true;
}

/*
	Name: investigate_setupruntocorpse
	Namespace: namespace_77fd5d41
	Checksum: 0xF422DE86
	Offset: 0x4088
	Size: 0x6E
	Parameters: 3
	Flags: Linked
*/
function investigate_setupruntocorpse(instancedata, pos, var_5fda80c8)
{
	self namespace_979752dc::set_patrol_style("combat", var_5fda80c8, pos, "medium");
	instancedata.nextstylecheck = gettime() + 100;
	instancedata.nextstylecheckdist = 256;
	instancedata.nextstylecheckinterval = 100;
}

/*
	Name: investigate_move_init
	Namespace: namespace_77fd5d41
	Checksum: 0x71C7D1DA
	Offset: 0x4100
	Size: 0x27E
	Parameters: 1
	Flags: Linked
*/
function investigate_move_init(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(1);
	self.fovforward = self.alertlevelint <= 2;
	curtime = gettime();
	instancedata = spawnstruct();
	instancedata.starttime = curtime;
	instancedata.cqbtargetnexttwitchtime = curtime + randomintrange(2000, 4000);
	self.bt.instancedata[taskid] = instancedata;
	typeorig = self.stealth.investigateevent.typeorig;
	var_1d1f100 = hash(self.stealth.investigateevent.type);
	switch(var_1d1f100)
	{
		case "investigate":
		{
			style = (self.awarenesslevelcurrent == "unaware" ? "patrol" : "alert");
			self namespace_979752dc::set_patrol_style(style);
			break;
		}
		default:
		{
			self namespace_979752dc::set_patrol_style("alert");
			break;
		}
	}
	if(typeorig == "saw_corpse")
	{
		if(isdefined(self.stealth.corpse.ent))
		{
			instancedata.nextcorpsechecktime = curtime + 200;
		}
	}
	else if(typeorig == "grenade danger")
	{
		self.grenadeawareness = 1;
		self.grenadereturnthrowchance = 0;
		return;
	}
	if(!isdefined(self.stealth.var_627b2039))
	{
		self function_11ad9ad4(self.bt.instancedata[taskid]);
	}
	self.disablelookdownpath = 1;
	instancedata.enablelookdownpathtime = curtime + 2000;
}

/*
	Name: investigate_move_setaimtarget
	Namespace: namespace_77fd5d41
	Checksum: 0x589A8546
	Offset: 0x4388
	Size: 0xC6
	Parameters: 3
	Flags: Linked
*/
function investigate_move_setaimtarget(instancedata, targetpos, eventtype)
{
	/#
		assert(isdefined(targetpos));
	#/
	t = 5000;
	if(isdefined(eventtype))
	{
		switch(eventtype)
		{
			case "sight":
			{
				t = 1000;
				break;
			}
			case "hash_266bce382f322b51":
			case "glass_destroyed":
			{
				t = 3000;
				break;
			}
		}
	}
	self.cqb_target = targetpos;
	instancedata.cqbtargetendtime = gettime() + t;
}

/*
	Name: function_11ad9ad4
	Namespace: namespace_77fd5d41
	Checksum: 0xFD769853
	Offset: 0x4458
	Size: 0x394
	Parameters: 1
	Flags: Linked
*/
function function_11ad9ad4(instancedata)
{
	self.stealth.var_3bf603d9 = undefined;
	groupdata = stealth_group::getgroup(self.script_stealthgroup);
	pod = stealth_group::group_findpod(groupdata, self);
	if(is_true(self.stealth.binitialinvestigate))
	{
		goalpos = investigate_getinitialpos();
	}
	else
	{
		goalpos = investigate_getuninvestigatedpos();
		groupdata = stealth_group::getgroup(self.script_stealthgroup);
		pod = stealth_group::group_findpod(groupdata, self);
		if(isdefined(pod.needsupdate))
		{
			arrayremovevalue(pod.needsupdate, self);
		}
	}
	if(isdefined(pod.needsupdate))
	{
		arrayremovevalue(pod.needsupdate, self);
	}
	if(isdefined(pod.investigateoriginguy) && pod.investigateoriginguy == self)
	{
		pod.investigateoriginguy = undefined;
	}
	if(isdefined(goalpos))
	{
		self.stealth.investigate_point = goalpos;
		faceangles = undefined;
		self.stealth.var_627b2039 = goalpos;
		if(self.stealth.binitialinvestigate && isdefined(instancedata))
		{
			instancedata.numfails = 0;
			typeorig = self.stealth.investigateevent.typeorig;
			if(typeorig == "saw_corpse" || typeorig == "found_corpse")
			{
				investigate_setupruntocorpse(instancedata, goalpos, 1);
			}
			else
			{
				if(typeorig == "bulletwhizby" || typeorig == "grenade danger")
				{
					self namespace_979752dc::set_patrol_style("cqb");
					faceangles = self namespace_206491b4::function_24b5e32(goalpos);
				}
				else
				{
					self namespace_979752dc::set_patrol_style("alert");
					lookpos = self.stealth.investigateevent.look_pos;
					if(!isdefined(lookpos))
					{
						lookpos = self.stealth.investigateevent.investigate_pos;
					}
					investigate_move_setaimtarget(instancedata, lookpos, typeorig);
					faceangles = self namespace_206491b4::function_24b5e32(goalpos);
				}
			}
		}
		else
		{
			self namespace_979752dc::set_patrol_style("alert");
			self.moveplaybackrate = 1;
			faceangles = self namespace_206491b4::function_24b5e32(goalpos);
		}
		self namespace_979752dc::set_goal(goalpos, faceangles, 24);
	}
}

/*
	Name: setuprandomlooktarget
	Namespace: namespace_77fd5d41
	Checksum: 0xF326812D
	Offset: 0x47F8
	Size: 0x7A
	Parameters: 1
	Flags: None
*/
function setuprandomlooktarget(instancedata)
{
	var_c43fd60f = 400;
	instancedata.cqbtwitching = 1;
	instancedata.cqbtwitchend = gettime() + var_c43fd60f;
	instancedata.cqbtwitchstate = 0;
	if(math::cointoss())
	{
		instancedata.cqbtwitchdir = 1;
	}
	else
	{
		instancedata.cqbtwitchdir = -1;
	}
}

/*
	Name: resetcqbtwitch
	Namespace: namespace_77fd5d41
	Checksum: 0x14CC3F45
	Offset: 0x4880
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function resetcqbtwitch(instancedata)
{
	instancedata.cqbtargetnexttwitchtime = gettime() + randomintrange(2000, 4000);
	instancedata.cqbtwitching = undefined;
	instancedata.cqbtwitchend = undefined;
	instancedata.cqbtwitchstate = undefined;
	instancedata.cqbtwitchdir = undefined;
}

/*
	Name: updaterandomlooktarget
	Namespace: namespace_77fd5d41
	Checksum: 0x223FFAB8
	Offset: 0x48F0
	Size: 0x2B2
	Parameters: 2
	Flags: Linked
*/
function updaterandomlooktarget(instancedata, targetdist)
{
	var_c43fd60f = 400;
	var_78075333 = 1000;
	var_51efeda2 = 20;
	facingdir = anglestoforward(self.angles);
	curtime = gettime();
	/#
		assert(isdefined(instancedata.cqbtwitchstate));
	#/
	switch(instancedata.cqbtwitchstate)
	{
		case 0:
		{
			t = (instancedata.cqbtwitchend - curtime) / var_c43fd60f;
			if(t > 0)
			{
				angle = (var_51efeda2 * (1 - (sin(t * 90)))) * instancedata.cqbtwitchdir;
				self.cqb_target = self.origin + (rotatepoint(facingdir, (0, angle, 0)) * targetdist);
				break;
			}
			else
			{
				instancedata.cqbtwitchend = curtime + var_78075333;
				instancedata.cqbtwitchstate++;
			}
		}
		case 1:
		{
			if(curtime < instancedata.cqbtwitchend)
			{
				self.cqb_target = self.origin + ((rotatepoint(facingdir, (0, var_51efeda2 * instancedata.cqbtwitchdir, 0))) * targetdist);
				break;
			}
			else
			{
				instancedata.cqbtwitchend = curtime + var_c43fd60f;
				instancedata.cqbtwitchstate++;
			}
		}
		case 2:
		{
			t = (instancedata.cqbtwitchend - curtime) / var_c43fd60f;
			if(t > 0)
			{
				angle = (var_51efeda2 * (sin(t * 90))) * instancedata.cqbtwitchdir;
				self.cqb_target = self.origin + (rotatepoint(facingdir, (0, angle, 0)) * targetdist);
			}
			else
			{
				resetcqbtwitch(instancedata);
			}
			break;
		}
	}
}

/*
	Name: investigate_move_updateaimtarget
	Namespace: namespace_77fd5d41
	Checksum: 0xB4F54BED
	Offset: 0x4BB0
	Size: 0x36A
	Parameters: 1
	Flags: Linked
*/
function investigate_move_updateaimtarget(instancedata)
{
	curtime = gettime();
	if(isdefined(instancedata.cqbtargetendtime))
	{
		if(isdefined(self.cqb_target))
		{
			metotarget = self.cqb_target - self.origin;
			var_40b6f5f3 = isdefined(self.stealth.patrol_react_magnitude) || isdefined(self.stealth.breacting);
			if(curtime > instancedata.cqbtargetendtime || (!var_40b6f5f3 && (abs(self.angles[1] - vectortoyaw(metotarget))) > 50))
			{
				self.cqb_target = undefined;
				instancedata.cqbtargetendtime = undefined;
				instancedata.cqbtargetnexttwitchtime = curtime + randomintrange(2000, 4000);
			}
		}
		else
		{
			instancedata.cqbtargetendtime = undefined;
			instancedata.cqbtargetnexttwitchtime = curtime + randomintrange(2000, 4000);
		}
	}
	if(!isdefined(instancedata.cqbtargetendtime))
	{
		facingdir = anglestoforward(self.angles);
		var_4b9400c1 = 0;
		foreach(player in getplayers())
		{
			if(self getthreatsight(player) > 0)
			{
				var_4b9400c1 = 1;
				resetcqbtwitch(instancedata);
				self.cqb_target = self lastknownpos(player);
				break;
			}
		}
		if(!var_4b9400c1)
		{
			var_c43fd60f = 400;
			var_78075333 = 1000;
			var_51efeda2 = 20;
			if(isdefined(instancedata.cqbtwitching))
			{
				updaterandomlooktarget(instancedata, 500);
			}
			else
			{
				if(isdefined(instancedata.cqbtargetnexttwitchtime) && curtime > instancedata.cqbtargetnexttwitchtime)
				{
					instancedata.cqbtwitching = 1;
					instancedata.cqbtwitchend = curtime + var_c43fd60f;
					instancedata.cqbtwitchstate = 0;
					if(math::cointoss())
					{
						instancedata.cqbtwitchdir = 1;
					}
					else
					{
						instancedata.cqbtwitchdir = -1;
					}
					updaterandomlooktarget(instancedata, 500);
				}
				else
				{
					self.cqb_target = undefined;
				}
			}
		}
	}
}

/*
	Name: function_d6c9b118
	Namespace: namespace_77fd5d41
	Checksum: 0x2D9D365F
	Offset: 0x4F28
	Size: 0x1B4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d6c9b118()
{
	if(isdefined(level.stealth.var_f67fe42c))
	{
		return;
	}
	level.stealth.var_f67fe42c = [];
	level.stealth.var_f67fe42c[0] = [2:&aiutility::function_865ea8e6, 1:&aiutility::function_865ea8e6, 0:&aiutility::function_865ea8e6];
	level.stealth.var_f67fe42c[2] = [2:&hunt_move_terminate, 1:&hunt_move, 0:&hunt_move_init];
	level.stealth.var_f67fe42c[1] = [2:&investigate_move_terminate, 1:&investigate_move, 0:&investigate_move_init];
	level.stealth.var_f67fe42c[3] = [2:&aiutility::function_865ea8e6, 1:&aiutility::function_865ea8e6, 0:&aiutility::function_865ea8e6];
}

/*
	Name: function_36915a04
	Namespace: namespace_77fd5d41
	Checksum: 0x4C96A4EC
	Offset: 0x50E8
	Size: 0x178
	Parameters: 1
	Flags: Linked
*/
function function_36915a04(behaviortreeentity)
{
	behaviortreeentity function_ed7c3705("stealth");
	if(namespace_ae9b2918::function_30579259(behaviortreeentity))
	{
		var_24a76e36 = behaviortreeentity function_f206a7f(1);
		behaviortreeentity.var_4f6f8942 = !var_24a76e36;
	}
	if(!isdefined(self.stealth))
	{
		return true;
	}
	/#
		assert(!isdefined(self.bt.var_98919459));
	#/
	self.bt.var_98919459 = behaviortreeentity function_db1c5a52(1, "move");
	self.bt.instancedata[self.bt.var_98919459] = self.stealth.bsmstate;
	function_d6c9b118();
	[[level.stealth.var_f67fe42c[self.stealth.bsmstate][0]]](behaviortreeentity);
	behaviortreeentity ai::function_fc7bd6c7();
	return true;
}

/*
	Name: function_7653ca27
	Namespace: namespace_77fd5d41
	Checksum: 0xE58F1B8F
	Offset: 0x5268
	Size: 0x1C8
	Parameters: 1
	Flags: Linked
*/
function function_7653ca27(behaviortreeentity)
{
	if(self flag::get("in_action"))
	{
		return 1;
	}
	if(!isdefined(self.stealth))
	{
		namespace_2dd2c4d8::function_3b9e6ead(behaviortreeentity, "turn@stealth");
		return 1;
	}
	/#
		assert(isdefined(self.bt.var_98919459));
	#/
	if(self.bt.instancedata[self.bt.var_98919459] != self.stealth.bsmstate)
	{
		[[level.stealth.var_f67fe42c[self.bt.instancedata[self.bt.var_98919459]][2]]](behaviortreeentity);
		[[level.stealth.var_f67fe42c[self.stealth.bsmstate][0]]](behaviortreeentity);
		self.bt.instancedata[self.bt.var_98919459] = self.stealth.bsmstate;
	}
	var_1dc434b4 = [[level.stealth.var_f67fe42c[self.stealth.bsmstate][1]]](behaviortreeentity);
	if(var_1dc434b4)
	{
		namespace_2dd2c4d8::function_3b9e6ead(behaviortreeentity, "turn@stealth");
	}
	return var_1dc434b4;
}

/*
	Name: function_bf263c90
	Namespace: namespace_77fd5d41
	Checksum: 0x7D702539
	Offset: 0x5438
	Size: 0x108
	Parameters: 1
	Flags: Linked
*/
function function_bf263c90(behaviortreeentity)
{
	behaviortreeentity function_ed7c3705("none");
	if(!isdefined(self.stealth))
	{
		behaviortreeentity ai::function_f6060793();
		return true;
	}
	/#
		assert(isdefined(self.bt.var_98919459));
	#/
	[[level.stealth.var_f67fe42c[self.bt.instancedata[self.bt.var_98919459]][2]]](behaviortreeentity);
	self.bt.instancedata[self.bt.var_98919459] = undefined;
	self.bt.var_98919459 = undefined;
	behaviortreeentity ai::function_f6060793();
	return true;
}

/*
	Name: function_445c5acf
	Namespace: namespace_77fd5d41
	Checksum: 0x8EED2532
	Offset: 0x5548
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function function_445c5acf(behaviortreeentity)
{
	behaviortreeentity function_f206a7f(0, behaviortreeentity.var_4f6f8942);
	behaviortreeentity.var_4f6f8942 = undefined;
	if(!isdefined(self.stealth))
	{
		return true;
	}
	self.stealth.bexaminerequested = undefined;
	self stealth_corpse::corpse_clear();
	return true;
}

/*
	Name: investigate_move
	Namespace: namespace_77fd5d41
	Checksum: 0x4F7601B
	Offset: 0x55C0
	Size: 0x6AA
	Parameters: 1
	Flags: Linked
*/
function investigate_move(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52();
	if(isdefined(self getlinkedent()))
	{
		return true;
	}
	if(self.stealth.investigateevent.typeorig == "grenade danger")
	{
		return true;
	}
	curtime = gettime();
	instancedata = self.bt.instancedata[taskid];
	groupdata = stealth_group::getgroup(self.script_stealthgroup);
	pod = stealth_group::group_findpod(groupdata, self);
	/#
		assert(isdefined(pod));
	#/
	if(isdefined(pod.needsupdate) && array::contains(pod.needsupdate, self))
	{
		goalpos = investigate_getuninvestigatedpos();
		goalorigin = goalpos;
		if(isdefined(goalpos))
		{
			if(!isvec(goalorigin))
			{
				goalorigin = goalorigin.origin;
			}
			arrayremovevalue(pod.needsupdate, self);
			faceangles = undefined;
			var_16721ebf = self.stealth.investigateevent.typeorig;
			if(var_16721ebf == "saw_corpse" || var_16721ebf == "found_corpse")
			{
				investigate_setupruntocorpse(instancedata, goalorigin, 0);
			}
			else
			{
				var_ff42b0fb = gettime() > instancedata.starttime;
				demeanor = "alert";
				reaction = "small";
				if(var_16721ebf == "bulletwhizby" || self ai::get_behavior_attribute("demeanor") == "combat")
				{
					demeanor = "cqb";
					reaction = "medium";
				}
				if(is_true(self.stealth.binitialinvestigate) && isdefined(self.pathgoalpos) && distancesquared(self.pathgoalpos, goalorigin) < 576)
				{
					var_ff42b0fb = 0;
				}
				namespace_979752dc::set_patrol_style(demeanor, var_ff42b0fb, goalorigin, reaction);
				lookpos = self.stealth.investigateevent.look_pos;
				if(!isdefined(lookpos))
				{
					lookpos = self.stealth.investigateevent.investigate_pos;
				}
				investigate_move_setaimtarget(instancedata, lookpos, var_16721ebf);
				faceangles = namespace_206491b4::function_24b5e32(goalorigin);
				instancedata.nextcorpsechecktime = undefined;
			}
			self namespace_979752dc::set_goal(goalpos, faceangles);
		}
	}
	if(isdefined(instancedata.nextcorpsechecktime) && curtime > instancedata.nextcorpsechecktime)
	{
		if(isdefined(self.stealth.corpse.ent))
		{
			var_a6448663 = self.stealth.corpse.ent namespace_979752dc::getcorpseorigin();
			var_a6448663 = self investigate_getcorpseoffsetpos(var_a6448663);
			self namespace_979752dc::set_goal(var_a6448663);
			instancedata.nextcorpsechecktime = curtime + 200;
		}
		else
		{
			instancedata.nextcorpsechecktime = undefined;
		}
	}
	if(isdefined(instancedata.enablelookdownpathtime) && curtime > instancedata.enablelookdownpathtime)
	{
		self.disablelookdownpath = undefined;
		instancedata.enablelookdownpathtime = undefined;
	}
	if(isalive(getplayers()[0]))
	{
		target = getplayers()[0];
		if(self cansee(target))
		{
			/#
				assert(issentient(target));
			#/
			investigate_move_setaimtarget(instancedata, self lastknownpos(target) + vectorscale((0, 0, 1), 32), "sight");
		}
	}
	investigate_move_updateaimtarget(instancedata);
	if(isdonewithsearchmove(instancedata))
	{
		return true;
	}
	if(isdefined(instancedata.nextstylecheck) && curtime >= instancedata.nextstylecheck)
	{
		checkdist = 512;
		if(isdefined(instancedata.nextstylecheckdist))
		{
			checkdist = instancedata.nextstylecheckdist;
		}
		if(self getpathlength() > checkdist)
		{
			interval = 1000;
			if(isdefined(instancedata.nextstylecheckinterval))
			{
				interval = instancedata.nextstylecheckinterval;
			}
			instancedata.nextstylecheck = gettime() + interval;
		}
		else
		{
			self namespace_979752dc::set_patrol_style("alert");
			instancedata.nextstylecheck = undefined;
		}
	}
	return true;
}

/*
	Name: investigate_move_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0x925FAF14
	Offset: 0x5C78
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function investigate_move_terminate(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52();
	self.fovforward = 0;
	if(is_true(self.stealth.binitialinvestigate))
	{
		self.stealth.binitialinvestigate = 0;
		self.stealth.investigateendtime = undefined;
	}
	self.bt.instancedata[taskid] = undefined;
	self.cqb_target = undefined;
	self.disablelookdownpath = undefined;
	function_cb942647();
}

/*
	Name: function_cb942647
	Namespace: namespace_77fd5d41
	Checksum: 0xCE2472FA
	Offset: 0x5D40
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function function_cb942647()
{
	if(!isdefined(self.stealth.investigateevent) || !isdefined(self.stealth.investigateevent.investigate_pos))
	{
		return;
	}
	heightdifference = self.stealth.investigateevent.investigate_pos[2] - self.origin[2];
	if(heightdifference > 75)
	{
		self.var_920617c1 = "stealth_investigate_height_high";
	}
	else
	{
		self.var_920617c1 = "stealth_investigate_height_default";
	}
}

/*
	Name: investigate_lookaround_init
	Namespace: namespace_77fd5d41
	Checksum: 0x5781DB86
	Offset: 0x5DF8
	Size: 0x1B8
	Parameters: 1
	Flags: Linked
*/
function investigate_lookaround_init(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(1);
	data = spawnstruct();
	data.failsafetimeout = gettime() + 8000;
	if(isdefined(self.stealth.scriptedinitialinvestigatedelay))
	{
		data.initialinvestigatetime = gettime() + (self.stealth.scriptedinitialinvestigatedelay * 1000);
		self.stealth.scriptedinitialinvestigatedelay = undefined;
	}
	self.bt.instancedata[taskid] = data;
	timeout = 8000;
	self namespace_979752dc::set_goal(self namespace_979752dc::function_133b86af());
	self namespace_979752dc::set_patrol_style("alert");
	self.stealth.binvestigatelookaround = 1;
	if(!is_true(self.stealth.binitialinvestigate) && !isdefined(self.stealth.investigateendtime))
	{
		setinvestigateendtime();
	}
	if(!isdefined(self.stealth.var_3bf603d9) || gettime() > self.stealth.var_3bf603d9)
	{
		function_c8d4ba1();
	}
	return true;
}

/*
	Name: investigate_lookaround
	Namespace: namespace_77fd5d41
	Checksum: 0xDDE0DF6D
	Offset: 0x5FB8
	Size: 0x25C
	Parameters: 1
	Flags: Linked
*/
function investigate_lookaround(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52();
	if(!isdefined(self.bt.instancedata[taskid].failsafetimeout) || gettime() > self.bt.instancedata[taskid].failsafetimeout)
	{
		return false;
	}
	if(is_true(self.stealth.binitialinvestigate))
	{
		if(isdefined(self.bt.instancedata[taskid].initialinvestigatetime) && gettime() < self.bt.instancedata[taskid].initialinvestigatetime)
		{
			return true;
		}
	}
	groupdata = stealth_group::getgroup(self.script_stealthgroup);
	pod = stealth_group::group_findpod(groupdata, self);
	if(isdefined(pod) && isdefined(pod.needsupdate) && array::contains(pod.needsupdate, self))
	{
		arrayremovevalue(pod.needsupdate, self);
		return true;
	}
	foreach(player in getplayers())
	{
		if(self getthreatsight(player) > 0.05 && (self namespace_979752dc::function_d58e1c1c() && self.alertlevel != "high_alert"))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: investigate_lookaround_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0x5741E63F
	Offset: 0x6220
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function investigate_lookaround_terminate(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52();
	self.bt.instancedata[taskid] = undefined;
	self.stealth.binvestigatelookaround = 0;
	return true;
}

/*
	Name: investigate_targetedlookaround
	Namespace: namespace_77fd5d41
	Checksum: 0x5C9936B0
	Offset: 0x6288
	Size: 0x156
	Parameters: 1
	Flags: Linked
*/
function investigate_targetedlookaround(behaviortreeentity)
{
	var_26b3b46a = 0;
	foreach(player in getplayers())
	{
		if(self getthreatsight(player) > 0.05)
		{
			self.cqb_target = self lastknownpos(player);
			var_26b3b46a = 1;
			break;
		}
	}
	if(var_26b3b46a)
	{
		return true;
	}
	if(isdefined(self.cqb_target))
	{
		groupdata = stealth_group::getgroup(self.script_stealthgroup);
		pod = stealth_group::group_findpod(groupdata, self);
		pod stealth_group::pod_updateinvestigateorigin(self, self.cqb_target);
	}
	return false;
}

/*
	Name: investigate_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0x61979296
	Offset: 0x63E8
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function investigate_terminate()
{
	self namespace_979752dc::set_goal(self.origin);
	self.diequietly = 0;
	self.stealth.investigate_point = undefined;
	self.stealth.investigate_severity = undefined;
	self.stealth.investigate_entity = undefined;
	self.stealth.var_56d82ea8 = undefined;
	self.stealth.investigateevent = undefined;
	self.stealth.binitialinvestigate = undefined;
	self.stealth.binvestigateoutofrange = undefined;
	self.stealth.investigateendtime = undefined;
	self.stealth.var_627b2039 = undefined;
	self.stealth.investigateevent_time = undefined;
	self.moveplaybackrate = 1;
	self.cqb_target = undefined;
	self function_f2887688();
	self stealth_corpse::corpse_clear();
	return true;
}

/*
	Name: stealth_shouldhunt
	Namespace: namespace_77fd5d41
	Checksum: 0x17565286
	Offset: 0x6500
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function stealth_shouldhunt(behaviortreeentity)
{
	if(self.stealth.bsmstate == 2)
	{
		return true;
	}
	return false;
}

/*
	Name: hunt_shouldinvestigateorigin
	Namespace: namespace_77fd5d41
	Checksum: 0xF59CA2DD
	Offset: 0x6538
	Size: 0x1AE
	Parameters: 2
	Flags: Linked
*/
function hunt_shouldinvestigateorigin(pod, guy)
{
	foreach(group in level.stealth.groupdata.groups)
	{
		foreach(var_dff5abf9 in group.pods)
		{
			if(var_dff5abf9 == pod)
			{
				continue;
			}
			if(var_dff5abf9.state == 2 && isdefined(var_dff5abf9.borigininvestigated) && distance2dsquared(pod.origin, var_dff5abf9.origin) < 576)
			{
				pod.borigininvestigated = 1;
				return 0;
			}
		}
	}
	closestguy = pod stealth_group::pod_getclosestguy(pod.origin);
	return isdefined(closestguy) && closestguy == guy;
}

/*
	Name: hunt_updateregiontoclear
	Namespace: namespace_77fd5d41
	Checksum: 0x5935CD55
	Offset: 0x66F0
	Size: 0x1C6
	Parameters: 0
	Flags: Linked
*/
function hunt_updateregiontoclear()
{
	if(!isdefined(self.stealth.cleardata) || !isdefined(self.stealth.cleardata.curregion))
	{
		if(!isdefined(self.script_stealth_region_group) || !isdefined(level.stealth.hunt_stealth_group_region_sets[self.script_stealth_region_group]) || level.stealth.hunt_stealth_group_region_sets[self.script_stealth_region_group].size == 0)
		{
			return;
		}
		region = self namespace_5cd4acd8::getregionforpos(self.origin);
		if(!isdefined(region))
		{
			return;
		}
		if(!isdefined(self.stealth.cleardata))
		{
			self.stealth.cleardata = spawnstruct();
		}
		cleardata = self.stealth.cleardata;
		cleardata.prevregion = [];
		cleardata.prevregion[0] = region;
		cleardata.prevregion[1] = region;
		cleardata.isinregion = 0;
		self namespace_5cd4acd8::huntassigntoregion(region);
		/#
			assert(isdefined(region.route_points));
		#/
		cleardata.curroutepoint = self namespace_5cd4acd8::findcurposonroute(self.origin, region.route_points);
		cleardata.brouteforward = 1;
	}
}

/*
	Name: hunt_clearroomdata
	Namespace: namespace_77fd5d41
	Checksum: 0x3EB6888F
	Offset: 0x68C0
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function hunt_clearroomdata()
{
	if(isdefined(self.stealth.cleardata))
	{
		if(isdefined(self.stealth.cleardata.curregion))
		{
			namespace_5cd4acd8::huntdecaiassignment(self.stealth.cleardata.curregion);
		}
		self.stealth.cleardata = undefined;
	}
}

/*
	Name: hunt_finddoorbetween
	Namespace: namespace_77fd5d41
	Checksum: 0x233B053F
	Offset: 0x6938
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function hunt_finddoorbetween(var_c27b6fd6, var_b034cb49)
{
	foreach(link in var_c27b6fd6.region_links)
	{
		if(link.region == var_b034cb49)
		{
			var_715a5cbd = link.transition_to_point.origin;
			for(i = 0; i < var_b034cb49.route_points.size; i++)
			{
				if(distancesquared(var_b034cb49.route_points[i].origin, var_715a5cbd) < 4)
				{
					return i;
				}
			}
		}
	}
}

/*
	Name: hunt_getnextclearpos
	Namespace: namespace_77fd5d41
	Checksum: 0x491B27F
	Offset: 0x6A50
	Size: 0x5A0
	Parameters: 0
	Flags: Linked
*/
function hunt_getnextclearpos()
{
	/#
		assert(isdefined(self.stealth.cleardata));
	#/
	cleardata = function_2e532eed(self.stealth.cleardata);
	var_355a0ab5 = cleardata.curroutepoint;
	var_22016eea = function_2e532eed(self.stealth.cleardata.curregion);
	var_6e87d6b2 = 0;
	var_9bf11123 = undefined;
	for(numtries = 0; numtries < 2; numtries++)
	{
		result = self namespace_5cd4acd8::findnextpointofinterest(self.origin, cleardata.curregion, cleardata.curroutepoint, cleardata.brouteforward);
		if(isdefined(result))
		{
			var_9bf11123 = result[0];
			cleardata.curroutepoint = result[1];
			if(var_6e87d6b2)
			{
				self namespace_5cd4acd8::huntunassignfromregion(var_22016eea);
				self.stealth.cleardata = function_2e532eed(cleardata);
				self namespace_5cd4acd8::huntassigntoregion(cleardata.curregion);
			}
			return self function_4efdd16b(var_9bf11123);
		}
		if(numtries == 1)
		{
			break;
		}
		curregion = cleardata.curregion;
		cleardata.curregion = self namespace_5cd4acd8::huntgetnextregion(cleardata.curregion);
		cleardata.curroutepoint = 0;
		cleardata.brouteforward = 1;
		if(curregion != cleardata.curregion)
		{
			var_3a454b3a = hunt_finddoorbetween(curregion, cleardata.curregion);
			if(isdefined(var_3a454b3a))
			{
				cleardata.curroutepoint = var_3a454b3a;
			}
			else
			{
				cleardata.curroutepoint = self namespace_5cd4acd8::findcurposonroute(self.origin, cleardata.curregion.route_points);
			}
			if(cleardata.curroutepoint > cleardata.curregion.route_points.size * 0.5)
			{
				cleardata.brouteforward = 0;
			}
			var_6e87d6b2 = 1;
		}
	}
	fallback = var_355a0ab5;
	var_5857f222 = var_355a0ab5 + 1;
	var_74350fc8 = self.stealth.cleardata.curregion.route_points.size;
	if(var_6e87d6b2)
	{
		self namespace_5cd4acd8::huntunassignfromregion(var_22016eea);
		self.stealth.cleardata = function_2e532eed(cleardata);
		self namespace_5cd4acd8::huntassigntoregion(cleardata.curregion);
		fallback = cleardata.curroutepoint;
		var_5857f222 = cleardata.curroutepoint + 1;
		var_74350fc8 = cleardata.curregion.route_points.size;
		if(cleardata.curroutepoint > var_74350fc8 * 0.5)
		{
			fallback = var_74350fc8 - 1;
			var_5857f222 = fallback - 1;
		}
	}
	cleardata = self.stealth.cleardata;
	if(cleardata.brouteforward)
	{
		cleardata.curroutepoint = cleardata.curroutepoint + 1;
		if(cleardata.curroutepoint >= cleardata.curregion.route_points.size)
		{
			cleardata.curroutepoint = 0;
		}
	}
	else
	{
		cleardata.curroutepoint = cleardata.curroutepoint - 1;
		if(cleardata.curroutepoint < 0)
		{
			cleardata.curroutepoint = cleardata.curregion.route_points.size - 1;
		}
	}
	cleardata.curregion.route_points[fallback].angles = undefined;
	if(var_5857f222 >= 0 && var_5857f222 < var_74350fc8)
	{
		cleardata.curregion.route_points[fallback].angles = vectortoangles(cleardata.curregion.route_points[var_5857f222].origin - cleardata.curregion.route_points[fallback].origin);
	}
	cleardata.curregion.route_points[fallback].var_4ff89bee = gettime() + 5000;
	return cleardata.curregion.route_points[fallback];
}

/*
	Name: hunt_getpos
	Namespace: namespace_77fd5d41
	Checksum: 0xE726F35A
	Offset: 0x6FF8
	Size: 0x310
	Parameters: 0
	Flags: Linked
*/
function hunt_getpos()
{
	if(isdefined(self.stealth.var_d4a1eb27) && isdefined(self.stealth.var_b997a50) && gettime() < self.stealth.var_d4a1eb27)
	{
		return self.stealth.var_b997a50;
	}
	groupdata = stealth_group::getgroup(self.script_stealthgroup);
	pod = stealth_group::group_findpod(groupdata, self);
	var_99400a59 = undefined;
	if(isdefined(self.stealth.script_nexthuntpos))
	{
		var_99400a59 = self.stealth.script_nexthuntpos;
		self.stealth.script_nexthuntpos = undefined;
		self hunt_clearroomdata();
	}
	if(!isdefined(var_99400a59) && (isdefined(pod) && isdefined(pod.origin)) && !isdefined(pod.borigininvestigated))
	{
		if(hunt_shouldinvestigateorigin(pod, self))
		{
			var_99400a59 = pod.origin;
			pod.borigininvestigated = 1;
			self hunt_clearroomdata();
		}
	}
	if(!isdefined(var_99400a59))
	{
		self hunt_updateregiontoclear();
		if(isdefined(self.stealth.cleardata))
		{
			var_99400a59 = self hunt_getnextclearpos();
		}
		else if(isdefined(pod) && isdefined(pod.investigatepoints))
		{
			var_99400a59 = stealth_group::group_getinvestigatepoint(self, level.stealth.hunt_volumes[self.script_stealthgroup]);
		}
	}
	if(!isdefined(var_99400a59) && getplayers().size > 0)
	{
		var_99400a59 = getplayers()[0].origin;
	}
	var_88427393 = (isvec(var_99400a59) ? var_99400a59 : var_99400a59.origin);
	var_ed142a01 = getclosestpointonnavmesh(var_88427393);
	if(isdefined(var_ed142a01))
	{
		self.stealth.var_b997a50 = var_ed142a01;
	}
	else
	{
		self.stealth.var_b997a50 = var_88427393;
	}
	self.stealth.var_d4a1eb27 = gettime() + 500;
	if(isdefined(var_99400a59))
	{
		self namespace_979752dc::set_goal(var_99400a59);
	}
	return var_99400a59;
}

/*
	Name: hunt_init
	Namespace: namespace_77fd5d41
	Checksum: 0x35491A04
	Offset: 0x7310
	Size: 0x272
	Parameters: 0
	Flags: Linked
*/
function hunt_init()
{
	self.combatmode = "no_cover";
	self namespace_f1f700ac::set_sight_state("hunt");
	self namespace_f1f700ac::set_alert_level("combat_hunt");
	self smart_object::function_a59dc8a8(self.smart_object);
	self namespace_979752dc::set_patrol_style("cqb");
	self namespace_979752dc::set_goal_radius(30);
	self flashlight::function_229440d2();
	self.stealth.binitialhunt = 1;
	self.diequietly = 1;
	self.allowturn45 = 1;
	self.last_set_goalnode = undefined;
	self.last_set_goalent = undefined;
	groupdata = stealth_group::getgroup(self.script_stealthgroup);
	pod = stealth_group::group_findpod(groupdata, self);
	/#
		assert(isdefined(pod));
	#/
	if(isdefined(pod.borigininvolume) && !pod.borigininvolume)
	{
		/#
			assert(isdefined(level.stealth.hunt_volumes[self.script_stealthgroup]));
		#/
		self namespace_979752dc::set_goal(level.stealth.hunt_volumes[self.script_stealthgroup]);
		if(isdefined(self.script_combatmode))
		{
			self.combatmode = self.script_combatmode;
		}
		else
		{
			self.combatmode = "cover";
		}
	}
	else
	{
		hunt_getpos();
	}
	if(!self isinscriptedstate())
	{
		if(is_true(self.stealthforcegundown))
		{
			self.gunposeoverride_internal = "gun_down";
		}
		else
		{
			self.gunposeoverride_internal = "ready";
		}
	}
}

/*
	Name: hunt_updateeveryframe
	Namespace: namespace_77fd5d41
	Checksum: 0x234921F7
	Offset: 0x7590
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function hunt_updateeveryframe(behaviortreeentity)
{
	return true;
}

/*
	Name: hunt_initialdelay_init
	Namespace: namespace_77fd5d41
	Checksum: 0x2CF0A1BA
	Offset: 0x75A8
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function hunt_initialdelay_init(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(1, "Hunt_Delay");
	self.bt.instancedata[taskid] = randomintrange(500, 1500);
}

/*
	Name: hunt_initialdelay
	Namespace: namespace_77fd5d41
	Checksum: 0xCF78041F
	Offset: 0x7618
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function hunt_initialdelay(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(0, "Hunt_Delay");
	if(!behaviortreeentity haspath() && isdefined(self.bt.instancedata[taskid]))
	{
		self.bt.instancedata[taskid] = self.bt.instancedata[taskid] - function_60d95f53();
		if(self.bt.instancedata[taskid] <= 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: hunt_initialdelay_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0x8D97B341
	Offset: 0x76F0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function hunt_initialdelay_terminate(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(0, "Hunt_Delay");
	self.bt.instancedata[taskid] = undefined;
}

/*
	Name: hunt_cqbtargetupdate
	Namespace: namespace_77fd5d41
	Checksum: 0xF9A2FACC
	Offset: 0x7748
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function hunt_cqbtargetupdate(instancedata)
{
	groupdata = stealth_group::getgroup(self.script_stealthgroup);
	pod = stealth_group::group_findpod(groupdata, self);
	if(isdefined(pod.target))
	{
		curtime = gettime();
		if(self cansee(pod.target) || self getthreatsight(pod.target) > 0.1)
		{
			self.cqb_target = pod.target.origin;
			instancedata.cqbtargettime = curtime;
			return true;
		}
		if(issentient(pod.target) && (isdefined(self.stealth.btargetlastknown) || (isdefined(instancedata.cqbtargettime) && (curtime - instancedata.cqbtargettime) < 2000)))
		{
			self.cqb_target = self lastknownpos(pod.target);
			return true;
		}
	}
	self.cqb_target = undefined;
	return false;
}

/*
	Name: hunt_shouldhunker
	Namespace: namespace_77fd5d41
	Checksum: 0x7BB953D4
	Offset: 0x78D0
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function hunt_shouldhunker(behaviortreeentity)
{
	groupdata = stealth_group::getgroup(self.script_stealthgroup);
	pod = stealth_group::group_findpod(groupdata, self);
	/#
		assert(isdefined(pod));
	#/
	if(is_true(pod.bhunkering))
	{
		return true;
	}
	return false;
}

/*
	Name: function_84d939b2
	Namespace: namespace_77fd5d41
	Checksum: 0xBEE2B0F5
	Offset: 0x7968
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_84d939b2(behaviortreeentity)
{
	if(hunt_shouldhunker(behaviortreeentity))
	{
		taskid = behaviortreeentity function_db1c5a52(0, "Hunt_Delay");
		if(!(isdefined(taskid) && isdefined(self.bt.instancedata[taskid])))
		{
			hunt_initialdelay_init(behaviortreeentity);
		}
		if(hunt_initialdelay(behaviortreeentity))
		{
			hunt_initialdelay_terminate(behaviortreeentity);
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_25281284
	Namespace: namespace_77fd5d41
	Checksum: 0xE1F7A4B3
	Offset: 0x7A38
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_25281284(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(0, "Hunt_Hunker");
	if(!(isdefined(taskid) && isdefined(self.bt.instancedata[taskid])))
	{
		hunt_hunker_init(behaviortreeentity);
	}
	hunt_hunker(behaviortreeentity);
	return true;
}

/*
	Name: hunt_hunker_init
	Namespace: namespace_77fd5d41
	Checksum: 0xCE0F39DD
	Offset: 0x7AC8
	Size: 0x234
	Parameters: 1
	Flags: Linked
*/
function hunt_hunker_init(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(1, "Hunt_Hunker");
	curtime = gettime();
	instancedata = spawnstruct();
	instancedata.nextcoverchecktime = curtime + randomintrange(4000, 6000);
	self.bt.instancedata[taskid] = instancedata;
	self.stealth.hunthunkerlastexposetime = curtime;
	self namespace_979752dc::set_patrol_style("cqb");
	var_1f2328d0 = behaviortreeentity function_4794d6a3();
	if(!isdefined(var_1f2328d0.node) && !isdefined(var_1f2328d0.goalvolume))
	{
		groupdata = stealth_group::getgroup(self.script_stealthgroup);
		pod = stealth_group::group_findpod(groupdata, self);
		if(isdefined(self.script_combatmode))
		{
			self.combatmode = self.script_combatmode;
		}
		else
		{
			self.combatmode = "cover";
		}
		if(isdefined(pod.origin))
		{
			node = self findcovernodeatlocation(pod.origin, 512, 80);
		}
		else
		{
			node = self findcovernodeatlocation(self.origin, 512, 80);
		}
		if(isdefined(node))
		{
			if(!isdefined(self.node) || self.node != node)
			{
				self namespace_979752dc::set_goal(node);
			}
		}
	}
}

/*
	Name: hunt_hunker
	Namespace: namespace_77fd5d41
	Checksum: 0x3AA59623
	Offset: 0x7D08
	Size: 0x270
	Parameters: 1
	Flags: Linked
*/
function hunt_hunker(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(0, "Hunt_Hunker");
	if(!isdefined(self.bt.instancedata[taskid]))
	{
		return;
	}
	curtime = gettime();
	if(curtime > self.bt.instancedata[taskid].nextcoverchecktime && !self haspath())
	{
		groupdata = stealth_group::getgroup(self.script_stealthgroup);
		pod = stealth_group::group_findpod(groupdata, self);
		var_caa00405 = randomint(3) < 1;
		node = self findcovernodeatlocation(pod.origin, 512, 80);
		if(isdefined(node))
		{
			var_1aeebe30 = 0;
			if(!isdefined(self.node) || self.node != node)
			{
				var_1aeebe30 = !self namespace_979752dc::set_goal(node);
			}
			if(var_1aeebe30)
			{
				self.bt.instancedata[taskid].nextcoverchecktime = curtime + 500;
			}
			else
			{
				self.bt.instancedata[taskid].nextcoverchecktime = curtime + randomintrange(4000, 6000);
			}
		}
		else
		{
			self.bt.instancedata[taskid].nextcoverchecktime = curtime + randomintrange(2000, 4000);
		}
	}
	hunt_cqbtargetupdate(self.bt.instancedata[taskid]);
	return true;
}

/*
	Name: hunt_hunker_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0xA6D0BB1C
	Offset: 0x7F80
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function hunt_hunker_terminate(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(0, "Hunt_Hunker");
	if(isdefined(taskid))
	{
		self.bt.instancedata[taskid] = undefined;
	}
}

/*
	Name: hunt_hunker_shouldexpose
	Namespace: namespace_77fd5d41
	Checksum: 0xBF1AF711
	Offset: 0x7FE0
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function hunt_hunker_shouldexpose(behaviortreeentity)
{
	var_f877c541 = 5000;
	/#
		assert(isdefined(self.stealth.hunthunkerlastexposetime));
	#/
	if(gettime() > self.stealth.hunthunkerlastexposetime + var_f877c541)
	{
		return true;
	}
	return false;
}

/*
	Name: hunt_hunker_expose_init
	Namespace: namespace_77fd5d41
	Checksum: 0xA28D8930
	Offset: 0x8050
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function hunt_hunker_expose_init(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(1);
	instancedata = spawnstruct();
	instancedata.endtime = gettime() + 4000;
	instancedata.nextpostime = 0;
	instancedata.nextposidx = 0;
	self.bt.instancedata[taskid] = instancedata;
	self.stealth.btargetlastknown = 1;
}

/*
	Name: hunt_hunker_expose
	Namespace: namespace_77fd5d41
	Checksum: 0x557A07F1
	Offset: 0x80F8
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function hunt_hunker_expose(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52();
	curtime = gettime();
	instancedata = self.bt.instancedata[taskid];
	if(curtime > instancedata.endtime)
	{
		return true;
	}
	return true;
}

/*
	Name: hunt_hunker_expose_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0x1B9C0FE7
	Offset: 0x8178
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function hunt_hunker_expose_terminate(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52();
	self.cqb_target = undefined;
	self.bt.instancedata[taskid] = undefined;
	self.stealth.btargetlastknown = undefined;
	self.stealth.hunthunkerlastexposetime = gettime();
}

/*
	Name: hunt_isincover
	Namespace: namespace_77fd5d41
	Checksum: 0xFAC9D197
	Offset: 0x81F0
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function hunt_isincover(behaviortreeentity)
{
	if(!isdefined(self.node))
	{
		return false;
	}
	var_f4bdb145 = 16;
	if(isdefined(self.pathgoalpos))
	{
		if(distancesquared(self.pathgoalpos, self.origin) > var_f4bdb145)
		{
			return false;
		}
	}
	else
	{
		if(self.keepclaimednodeifvalid)
		{
			var_f4bdb145 = 3600;
		}
		else
		{
			var_f4bdb145 = 225;
		}
	}
	if(distance2dsquared(self.node.origin, self.origin) > var_f4bdb145)
	{
		return false;
	}
	return true;
}

/*
	Name: hunt_active_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0xF2DD5AF
	Offset: 0x82C0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function hunt_active_terminate(behaviortreeentity)
{
	self function_f2887688();
}

/*
	Name: hunt_move_init
	Namespace: namespace_77fd5d41
	Checksum: 0x3DAF4BDD
	Offset: 0x82F0
	Size: 0x13E
	Parameters: 1
	Flags: Linked
*/
function hunt_move_init(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(1);
	curtime = gettime();
	instancedata = spawnstruct();
	self.bt.instancedata[taskid] = instancedata;
	instancedata.starttime = curtime;
	self.stealth.var_627b2039 = self.stealth.var_b997a50;
	instancedata.numfails = 0;
	var_9bf11123 = self.smart_object;
	if(isdefined(var_9bf11123))
	{
		self namespace_979752dc::set_goal_radius(12);
	}
	else
	{
		self namespace_979752dc::set_goal_radius(37);
	}
	self namespace_979752dc::set_patrol_style("cqb");
	self.disablelookdownpath = 1;
	instancedata.enablelookdownpathtime = curtime + 2000;
}

/*
	Name: hunt_sidechecks
	Namespace: namespace_77fd5d41
	Checksum: 0xAFF2830
	Offset: 0x8438
	Size: 0x742
	Parameters: 1
	Flags: Linked
*/
function hunt_sidechecks(instancedata)
{
	var_843ecdc0 = 36;
	var_2be49714 = 36;
	var_bea9b15e = 36;
	curtime = gettime();
	var_22766aeb = 2000;
	if(isdefined(instancedata.cornerchecknode) && curtime >= (instancedata.cornerchecknodestarttime + var_22766aeb))
	{
		instancedata.cornerchecknode = undefined;
		instancedata.cornerchecknodestarttime = undefined;
		self aimatposik(undefined);
		self namespace_979752dc::set_patrol_style("cqb");
		self.disablelookdownpath = undefined;
	}
	if(!isdefined(instancedata.cornerchecknode) && !is_true(self.isarriving) && self.lookaheaddist > 32 && self getpathlength() > 128)
	{
		var_bef4dbd7 = self getposonpath(var_843ecdc0);
		var_a0e80ff2 = anglestoforward(self.angles);
		var_273da0db = getnodesinradius(var_bef4dbd7, var_bea9b15e, 0, 60, "Cover");
		if(var_273da0db.size > 0)
		{
			foreach(node in var_273da0db)
			{
				if(!doesnodeallowstance(node, "stand"))
				{
					continue;
				}
				var_3456f49c = node.origin - self.origin;
				if(vectordot(var_3456f49c, var_a0e80ff2) < 0)
				{
					continue;
				}
				anglediff = angleclamp180(node.angles[1] - self.angles[1]);
				if(anglediff > 0 && node.type != "Cover Right")
				{
					continue;
				}
				else if(anglediff < 0 && node.type != "Cover Left")
				{
					continue;
				}
				nodedir = anglestoforward(node.angles);
				dot = vectordot(nodedir, var_a0e80ff2);
				if(dot > 0.5 || dot < -0.5)
				{
					continue;
				}
				/#
					if(stealth_debug::debug_enabled())
					{
						sidedir = anglestoforward(node.angles);
						circle(var_bef4dbd7, var_bea9b15e, (0, 1, 0), 1, 0, 1);
						box(node.origin, vectorscale((-1, -1, 0), 16), (16, 16, 8), node.angles[1], (1, 1, 0), 1, 0, 1);
						line(var_bef4dbd7, var_bef4dbd7 + (sidedir * var_2be49714), (0, 1, 1), 1, 0, 1);
					}
				#/
				if(abs(angleclamp180(self.angles[1] - node.angles[1])) < 45)
				{
					continue;
				}
				if(vectordot(self.lookaheaddir, var_3456f49c) > 32)
				{
					continue;
				}
				instancedata.cornerchecknode = node;
				instancedata.cornerchecknodestarttime = curtime;
				break;
			}
		}
	}
	if(isdefined(instancedata.cornerchecknode))
	{
		cornerchecknode = instancedata.cornerchecknode;
		/#
			if(stealth_debug::debug_enabled())
			{
				box(cornerchecknode.origin, vectorscale((-1, -1, 0), 16), (16, 16, 8), cornerchecknode.angles[1], (1, 1, 0), 1, 0, 1);
			}
		#/
		checkpos = undefined;
		var_ffe01b4a = anglestoaxis(cornerchecknode.angles);
		var_e531995e = var_ffe01b4a.right;
		if(cornerchecknode.type == "Cover Left")
		{
			var_e531995e = -1 * var_e531995e;
		}
		var_f74021a7 = 20;
		var_e96b9b = (cornerchecknode.origin + (var_f74021a7 * var_ffe01b4a.forward)) + (var_f74021a7 * var_e531995e);
		var_3dcee9ed = self.origin - cornerchecknode.origin;
		if(vectordot(var_3dcee9ed, var_e531995e) < var_f74021a7)
		{
			checkpos = var_e96b9b;
		}
		else
		{
			checkpos = self.origin + rotatepoint(vectorscale((1, 0, 0), 128), cornerchecknode.angles);
		}
		/#
			if(stealth_debug::debug_enabled())
			{
				line(cornerchecknode.origin, checkpos, (1, 1, 0), 1, 0, 1);
			}
		#/
		self aimatposik(checkpos);
		self namespace_979752dc::set_movement_speed(30);
		self.disablelookdownpath = 1;
	}
}

/*
	Name: hunt_move
	Namespace: namespace_77fd5d41
	Checksum: 0x81A240F8
	Offset: 0x8B88
	Size: 0x270
	Parameters: 1
	Flags: Linked
*/
function hunt_move(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52();
	instancedata = self.bt.instancedata[taskid];
	curtime = gettime();
	var_13e10c61 = isdefined(self.smart_object);
	if(var_13e10c61)
	{
		self function_4efdd16b(self.smart_object);
	}
	if(isdonewithsearchmove(instancedata))
	{
		return true;
	}
	if(hunt_shouldhunker() == 1 || self namespace_979752dc::function_b0c91323(1))
	{
		if(var_13e10c61)
		{
			self function_f2887688();
		}
		return true;
	}
	if(isdefined(instancedata.enablelookdownpathtime) && curtime > instancedata.enablelookdownpathtime)
	{
		self.disablelookdownpath = undefined;
		instancedata.enablelookdownpathtime = undefined;
	}
	if(isdefined(self.pathgoalpos) && var_13e10c61 && self getpathlength() < 56)
	{
		var_9bf11123 = self.smart_object;
		self aimatposik(var_9bf11123.origin + rotatepoint(vectorscale((1, 0, 0), 128), var_9bf11123.angles));
	}
	else
	{
		self hunt_sidechecks(instancedata);
	}
	if(isdefined(self.stealth.cleardata) && isdefined(self.stealth.cleardata.curregion))
	{
		self namespace_5cd4acd8::hunttrytoenterregionvolume(self.stealth.cleardata.curregion);
	}
	hunt_cqbtargetupdate(instancedata);
	return true;
}

/*
	Name: hunt_move_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0xFCDCE67F
	Offset: 0x8E00
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function hunt_move_terminate(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52();
	self.bt.instancedata[taskid] = undefined;
	if(isdefined(self.stealth.breacting))
	{
		self.stealth.binitialhunt = 1;
	}
	else
	{
		self.stealth.binitialhunt = undefined;
	}
	self.cqb_target = undefined;
	self.disablelookdownpath = undefined;
	self aimatposik(undefined);
}

/*
	Name: function_ea5fc830
	Namespace: namespace_77fd5d41
	Checksum: 0xBCB3A45E
	Offset: 0x8EB0
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_ea5fc830(behaviortreeentity)
{
	if(isdefined(self.stealth.var_fbfca183) && self.stealth.var_fbfca183 != self.stealth.bsmstate)
	{
		function_df9a9513(behaviortreeentity);
	}
	self.stealth.var_fbfca183 = self.stealth.bsmstate;
	switch(self.stealth.var_fbfca183)
	{
		case 1:
		{
			return investigate_lookaround_init(behaviortreeentity);
		}
		case 2:
		{
			return hunt_lookaround_init(behaviortreeentity);
		}
	}
	return 0;
}

/*
	Name: function_470c948e
	Namespace: namespace_77fd5d41
	Checksum: 0x23165D82
	Offset: 0x8FA0
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_470c948e(behaviortreeentity)
{
	if(isdefined(self.stealth.var_fbfca183) && self.stealth.var_fbfca183 != self.stealth.bsmstate)
	{
		function_df9a9513(behaviortreeentity);
	}
	if(!isdefined(self.stealth.var_fbfca183))
	{
		function_ea5fc830(behaviortreeentity);
	}
	switch(self.stealth.var_fbfca183)
	{
		case 1:
		{
			return investigate_lookaround(behaviortreeentity);
		}
		case 2:
		{
			return hunt_lookaround(behaviortreeentity);
		}
	}
	return 0;
}

/*
	Name: function_df9a9513
	Namespace: namespace_77fd5d41
	Checksum: 0xF43D361
	Offset: 0x9098
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_df9a9513(behaviortreeentity)
{
	switch(self.stealth.var_fbfca183)
	{
		case 1:
		{
			return investigate_lookaround_terminate(behaviortreeentity);
		}
		case 2:
		{
			return hunt_lookaround_terminate(behaviortreeentity);
		}
	}
	self.stealth.var_fbfca183 = undefined;
}

/*
	Name: hunt_lookaround_init
	Namespace: namespace_77fd5d41
	Checksum: 0xDB678D1A
	Offset: 0x9128
	Size: 0x13A
	Parameters: 1
	Flags: Linked
*/
function hunt_lookaround_init(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(1, "Hunt_LookAround");
	timeout = 8000;
	instancedata = spawnstruct();
	instancedata.endtime = gettime() + timeout;
	self.bt.instancedata[taskid] = instancedata;
	if(isdefined(self.stealth.script_huntlookaroundduration))
	{
		instancedata.endtime = gettime() + self.stealth.script_huntlookaroundduration;
	}
	self namespace_979752dc::set_goal_radius(36);
	if(is_true(self.stealth.script_skiplookaroundanim))
	{
		if(isdefined(self.stealth.script_huntlookaroundduration))
		{
			self.stealth.binvestigatelookaround = 0;
		}
	}
	else
	{
		self.stealth.binvestigatelookaround = 1;
	}
	return true;
}

/*
	Name: hunt_lookaround
	Namespace: namespace_77fd5d41
	Checksum: 0x3ACE906D
	Offset: 0x9270
	Size: 0x1C8
	Parameters: 1
	Flags: Linked
*/
function hunt_lookaround(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(0, "Hunt_LookAround");
	if(isdefined(self.stealth.binitialhunt))
	{
		return true;
	}
	if(gettime() > (isdefined(self.bt.instancedata[taskid].endtime) ? self.bt.instancedata[taskid].endtime : 0))
	{
		return false;
	}
	if(!isdefined(self.stealth.binvestigatelookaround))
	{
		return true;
	}
	if(self namespace_979752dc::function_b0c91323())
	{
		self namespace_979752dc::function_ab75abf3();
		return true;
	}
	var_b0938e0c = isdefined(self.cqb_target);
	var_f3541bde = hunt_cqbtargetupdate(self.bt.instancedata[taskid]);
	if(!var_b0938e0c && isdefined(self.cqb_target) && var_f3541bde)
	{
		self.stealth.binvestigatelookaround = undefined;
		targetpos = self.cqb_target;
		if(!isvec(self.cqb_target))
		{
			targetpos = self.cqb_target.origin;
		}
		self namespace_979752dc::set_patrol_react(targetpos, "small");
	}
	return true;
}

/*
	Name: hunt_lookaround_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0x24A35F20
	Offset: 0x9440
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function hunt_lookaround_terminate(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(0, "Hunt_LookAround");
	self.bt.instancedata[taskid] = undefined;
	self.stealth.binvestigatelookaround = undefined;
	if(!self haspath())
	{
		self hunt_getpos();
	}
	return true;
}

/*
	Name: hunt_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0xF765FBC0
	Offset: 0x94D0
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function hunt_terminate()
{
	self.stealth.binitialhunt = undefined;
	self.stealth.hunthunkerlastexposetime = undefined;
	self.stealth.var_627b2039 = undefined;
	self.diequietly = 0;
	self.moveplaybackrate = 1;
	self.allowturn45 = undefined;
	self hunt_clearroomdata();
	self.cqb_target = undefined;
	self namespace_979752dc::set_goal(self.origin);
	self flashlight::function_ac53d0fb();
	return true;
}

/*
	Name: function_4efdd16b
	Namespace: namespace_77fd5d41
	Checksum: 0x3E9A8A0F
	Offset: 0x9580
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_4efdd16b(var_9bf11123)
{
	if(var_9bf11123 === self.smart_object)
	{
		return;
	}
	self smart_object::set(var_9bf11123);
	self thread function_b927bc45(var_9bf11123);
	self namespace_979752dc::set_goal_radius(16);
	return var_9bf11123;
}

/*
	Name: function_b927bc45
	Namespace: namespace_77fd5d41
	Checksum: 0x9F938A9
	Offset: 0x95F0
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_b927bc45(var_9bf11123)
{
	self notify("458850aa791fb2ad");
	self endon("458850aa791fb2ad");
	self endon(#"death", #"hash_6b1e2ef3367a9c8b", #"hash_5eea84497843d6f7");
	self waittill(#"goal");
	waitframe(1);
	while(is_true(self.isarriving))
	{
		waitframe(1);
	}
	if(var_9bf11123 === self.smart_object && smart_object::can_use(self.smart_object) && distancesquared(self.origin, self.smart_object.origin) <= (sqr(self.goalradius + 1)))
	{
		self function_4adeb7ed(self.smart_object);
	}
}

/*
	Name: function_5bfdfc9d
	Namespace: namespace_77fd5d41
	Checksum: 0x644134DA
	Offset: 0x9730
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function function_5bfdfc9d()
{
	if(isdefined(self.var_3ed929ba) && !self ishunting())
	{
		if(self.var_3ed929ba != self flashlight::function_b8090745())
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_4adeb7ed
	Namespace: namespace_77fd5d41
	Checksum: 0x7B74E672
	Offset: 0x9788
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_4adeb7ed(var_9bf11123)
{
	self notify("20a47696d306d324");
	self endon("20a47696d306d324");
	self endon(#"death");
	self notify(#"hash_335827d811ed5f67");
	var_9bf11123 smart_object::play(self);
	if(self.stealth.bsmstate !== 3)
	{
		self function_2640a26c(1);
	}
	self function_f2887688();
}

/*
	Name: function_f2887688
	Namespace: namespace_77fd5d41
	Checksum: 0x80F290F2
	Offset: 0x9840
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function function_f2887688()
{
	self smart_object::function_bd54ea4c();
	self smart_object::function_a59dc8a8(self.smart_object);
	self notify(#"hash_6b1e2ef3367a9c8b");
}

/*
	Name: function_e6aa814a
	Namespace: namespace_77fd5d41
	Checksum: 0x95B51E6D
	Offset: 0x9898
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_e6aa814a()
{
	self endon(#"death");
	wait(0.5);
	while(is_true(self.stealth.reacting))
	{
		waitframe(1);
	}
	if(isdefined(self.fnstealthflashlightdetach))
	{
		self [[self.fnstealthflashlightdetach]]();
	}
}

/*
	Name: combat_init
	Namespace: namespace_77fd5d41
	Checksum: 0xAFE9AEC5
	Offset: 0x9910
	Size: 0x2C8
	Parameters: 0
	Flags: Linked
*/
function combat_init()
{
	self.dontattackme = 0;
	self.diequietly = 0;
	self.bisincombat = 1;
	if(self flashlight::function_3aec1b7())
	{
		self flashlight::function_ac53d0fb();
	}
	if(self flashlight::function_47df32b8())
	{
		self thread function_e6aa814a();
	}
	self ai::look_at(undefined);
	self namespace_979752dc::clear_movement_speed();
	self namespace_979752dc::set_goal_radius(undefined);
	self stealth_event::event_escalation_clear();
	self function_94575fdf();
	if(isdefined(self.script_combatmode))
	{
		self.combatmode = self.script_combatmode;
	}
	else
	{
		self.combatmode = "cover";
	}
	namespace_f1f700ac::set_sight_state("combat");
	enemypos = self.origin;
	goalvolume = level.stealth.combat_volumes[self.script_stealthgroup];
	if(isdefined(goalvolume))
	{
		self namespace_979752dc::set_goal(goalvolume, undefined, -1);
	}
	else if(isdefined(level.stealth.combat_goalradius) && isdefined(level.stealth.combat_goalradius[self.script_stealthgroup]))
	{
		self namespace_979752dc::set_goal(self.scriptgoalpos);
		self namespace_979752dc::set_goal_radius(level.stealth.combat_goalradius[self.script_stealthgroup]);
	}
	self forceupdategoalpos();
	if(isdefined(self.stealth.funcs[#"spotted"]))
	{
		self namespace_b2b86d39::stealth_call_thread("spotted");
	}
	self.grenadeawareness = self.var_13c8de0c;
	self.gunposeoverride_internal = undefined;
	if(self flashlight::function_47df32b8())
	{
		self flashlight::function_9b7441d1(0);
	}
	return true;
}

/*
	Name: combat_terminate
	Namespace: namespace_77fd5d41
	Checksum: 0x46BEF131
	Offset: 0x9BE0
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function combat_terminate()
{
	self namespace_979752dc::set_goal(self.origin);
	self namespace_979752dc::function_6a3b08d0();
	return true;
}

/*
	Name: clearstealthvolume
	Namespace: namespace_77fd5d41
	Checksum: 0xFFDCCB9
	Offset: 0x9C28
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function clearstealthvolume()
{
	if(isdefined(level.stealth.combat_volumes[self.script_stealthgroup]) && self iscombating() || (isdefined(level.stealth.hunt_volumes[self.script_stealthgroup]) && self ishunting()))
	{
		self namespace_979752dc::set_goal(self.origin);
	}
}

/*
	Name: function_e5b8ad1b
	Namespace: namespace_77fd5d41
	Checksum: 0x11933CCB
	Offset: 0x9CC0
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_e5b8ad1b()
{
	if(isdefined(self.script_stealthgroup))
	{
		groupdata = stealth_group::getgroup(self.script_stealthgroup);
		stealth_group::group_removefrompod(groupdata, self);
	}
}

/*
	Name: setstealthstate
	Namespace: namespace_77fd5d41
	Checksum: 0x65215233
	Offset: 0x9D18
	Size: 0xA4A
	Parameters: 2
	Flags: Linked
*/
function setstealthstate(statename, e)
{
	if(!level flag::get("stealth_enabled") || !isdefined(self.stealth))
	{
		return;
	}
	if(!isalive(self))
	{
		return;
	}
	switch(statename)
	{
		case "idle":
		{
			self.dontattackme = 1;
			self.diequietly = 1;
			if(is_true(self.stealth.blind))
			{
				self namespace_f1f700ac::set_sight_state("blind");
			}
			else
			{
				self namespace_f1f700ac::set_sight_state("hidden");
			}
			self function_e5b8ad1b();
			self enterstealthstate(0, e);
			self notify(#"hash_32b0a9d6ca03306f");
			break;
		}
		case "investigate":
		{
			if(e.type == "cover_blown")
			{
				self.stealth.bcoverhasbeenblown = 1;
			}
			if(self.stealth.bsmstate == 1)
			{
				if(self.alertlevel == "high_alert" && e.typeorig == "sight" && self namespace_979752dc::function_d58e1c1c())
				{
					function_d004e2c7(e);
				}
				else
				{
					if(isplayer(self.stealth.investigate_entity) && !isplayer(e.entity) && e.typeorig != "saw_corpse")
					{
						break;
					}
					if(isdefined(self.stealth.investigate_severity))
					{
						if(self.stealth.investigateevent.typeorig == "saw_corpse" && e.typeorig == "found_corpse" && e.entity == self.stealth.investigate_entity)
						{
							break;
						}
						var_fb4dd196 = stealth_event::event_severity_compare(self.stealth.investigate_severity, e.type);
						if(var_fb4dd196 >= 0)
						{
							self.stealth.investigate_severity = e.type;
							self.stealth.investigate_entity = e.entity;
							self.stealth.investigateevent = e;
						}
						curtime = gettime();
						var_32c29ad9 = var_fb4dd196 > 0 || curtime > self.stealth.investigateevent_time || distancesquared(e.investigate_pos, self.origin) < distancesquared(self.stealth.investigateevent.investigate_pos, self.origin);
						if(var_32c29ad9)
						{
							groupdata = stealth_group::getgroup(self.script_stealthgroup);
							pod = stealth_group::group_findpod(groupdata, self);
							var_3a13d151 = stealth_group::group_trytojoinexistingpod(groupdata, pod, 1, self, e.investigate_pos);
							if(isdefined(var_3a13d151))
							{
								pod = var_3a13d151;
							}
							/#
								assert(isdefined(pod));
							#/
							pod stealth_group::pod_updateinvestigateorigin(self, e.investigate_pos);
							self.stealth.investigateevent_time = curtime;
						}
						self.stealth.investigateendtime = undefined;
					}
				}
			}
			else
			{
				if(e.type == "cover_blown")
				{
					stealth_group::group_eventcoverblown(self.script_stealthgroup, self, e);
				}
				else
				{
					stealth_group::group_eventinvestigate(self.script_stealthgroup, self, e);
				}
				self.stealth.investigateevent = e;
				self.stealth.investigateevent_time = gettime();
				self enterstealthstate(1, e);
				self notify(#"hash_6d1907ea25e20b08");
			}
			break;
		}
		case "hunt":
		{
			self.stealth.bcoverhasbeenblown = 1;
			stealth_group::group_eventhunt(self.script_stealthgroup, self);
			self enterstealthstate(2, e);
			self notify(#"hash_2b54d5e1df815470");
			break;
		}
		case "combat":
		{
			if(self.stealth.bsmstate != 3)
			{
				var_d6b5966 = isdefined(e) && e.typeorig == "damage" && self.allowpain && !self isinscriptedstate();
				if(isdefined(e) && !var_d6b5966)
				{
					magnitude = "small";
					var_bed01a48 = hash(e.typeorig);
					switch(var_bed01a48)
					{
						case "proximity":
						{
							magnitude = "small_medium";
							break;
						}
						case "projectile_impact":
						case "ally_damaged":
						case "bulletwhizby":
						case "hash_60484d1d72fd4ce9":
						case "gunshot":
						{
							magnitude = "medium";
							break;
						}
						case "explode":
						case "hash_70bb20cec150f744":
						{
							magnitude = "large";
							break;
						}
						case "hash_266bce382f322b51":
						case "attack":
						case "combat":
						{
							if(distancesquared(e.investigate_pos, self.origin) < 40000)
							{
								magnitude = "medium";
							}
							break;
						}
					}
					enemy = self.enemy;
					if(!isdefined(enemy) && isdefined(e.entity) && issentient(e.entity))
					{
						enemy = e.entity;
					}
					if(magnitude == "small" && isdefined(enemy))
					{
						if(self cansee(enemy))
						{
							magnitude = "medium";
						}
						else if(e.typeorig == "sight")
						{
							magnitude = "small_medium";
						}
					}
					self namespace_979752dc::set_patrol_style("combat", 1, e.investigate_pos, magnitude);
				}
				else
				{
					self namespace_979752dc::set_patrol_style("combat");
				}
			}
			self.stealth.bcoverhasbeenblown = 1;
			enemy = undefined;
			if(isdefined(e) && isdefined(e.entity))
			{
				if(issentient(e.entity) && e.entity.team == self.team)
				{
					if(isdefined(e.entity.enemy) && issentient(e.entity.enemy))
					{
						self copyenemyinfo(e.entity);
					}
				}
				else
				{
					enemy = e.entity;
				}
			}
			stealth_group::group_eventcombat(self.script_stealthgroup, self, enemy);
			self enterstealthstate(3, e);
			self notify(#"stealth_combat", isdefined(e) && var_d6b5966 && self flashlight::function_b8090745());
			break;
		}
	}
}

/*
	Name: ifshoulddosmartobject
	Namespace: namespace_77fd5d41
	Checksum: 0x5D740855
	Offset: 0xA770
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function ifshoulddosmartobject(behaviortreeentity)
{
	var_9bf11123 = self.smart_object;
	if(!isdefined(var_9bf11123))
	{
		return false;
	}
	if(isdefined(self.disablesmartobjects))
	{
		return false;
	}
	if(is_true(self.isarriving))
	{
		return false;
	}
	zdiff = self.origin[2] - var_9bf11123.origin[2];
	if(zdiff * zdiff > 5184)
	{
		return false;
	}
	if(distance2dsquared(self.origin, var_9bf11123.origin) > 225)
	{
		return false;
	}
	return true;
}

/*
	Name: dosmartobject_init
	Namespace: namespace_77fd5d41
	Checksum: 0x4F087AFB
	Offset: 0xA848
	Size: 0x15E
	Parameters: 1
	Flags: Linked
*/
function dosmartobject_init(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(1, "smart_object");
	var_9bf11123 = self.smart_object;
	if(!isdefined(var_9bf11123))
	{
		return false;
	}
	if(!isdefined(self.bt.instancedata[taskid]))
	{
		self.bt.instancedata[taskid] = spawnstruct();
		self.bt.instancedata[taskid].disableautolookat = self.disableautolookat;
		self.bt.instancedata[taskid].smart_object = self.smart_object;
	}
	if(self.bt.instancedata[taskid].smart_object === self.smart_object && is_true(behaviortreeentity.var_c48f9f7d))
	{
		return true;
	}
	var_9bf11123 thread smart_object::play(behaviortreeentity);
	self.disableautolookat = 1;
	return true;
}

/*
	Name: dosmartobject
	Namespace: namespace_77fd5d41
	Checksum: 0xB6F99B0A
	Offset: 0xA9B0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function dosmartobject(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(0, "smart_object");
	if(self.bt.instancedata[taskid].smart_object !== self.smart_object || !isdefined(behaviortreeentity.var_c48f9f7d))
	{
		return false;
	}
	return true;
}

/*
	Name: dosmartobjectterminate
	Namespace: namespace_77fd5d41
	Checksum: 0x37972835
	Offset: 0xAA38
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function dosmartobjectterminate(behaviortreeentity)
{
	taskid = behaviortreeentity function_db1c5a52(0, "smart_object");
	self.disableautolookat = self.bt.instancedata[taskid].disableautolookat;
	self.bt.instancedata[taskid] = undefined;
	return true;
}

