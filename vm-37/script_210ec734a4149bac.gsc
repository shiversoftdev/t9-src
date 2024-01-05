#using script_3aa0f32b70d4f7cb;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai\archetype_civilian.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_f592a7b;

/*
	Name: __init__system__
	Namespace: namespace_f592a7b
	Checksum: 0x5480A4FE
	Offset: 0x2D8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2846a4f4bd094545", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_f592a7b
	Checksum: 0xBFCB4632
	Offset: 0x330
	Size: 0x10C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		assert(isscriptfunctionptr(&function_850bdbb2));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("civilianPanicCoverService", &function_850bdbb2, 1);
	level.var_ec54dc19 = &function_251c139d;
	callback::on_ai_killed(&on_ai_killed);
	spawner::add_archetype_spawn_function(#"civilian", &function_478f2963);
	level thread function_dcfd9c90();
	/#
		adddebugcommand("");
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_f592a7b
	Checksum: 0xD8166C64
	Offset: 0x448
	Size: 0x50
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level.__ai_interface[#"civilian"][#"hash_78e762abc4fbf1de"][#"callback"] = &function_e2953db0;
}

/*
	Name: function_478f2963
	Namespace: namespace_f592a7b
	Checksum: 0xB57B1C40
	Offset: 0x4A0
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_478f2963()
{
	self.var_702fecae = 0;
	self thread function_f1d19be1();
	self thread function_c96b0450();
	/#
		self thread function_a8f579e();
	#/
}

/*
	Name: function_9308c21b
	Namespace: namespace_f592a7b
	Checksum: 0xEAF6BA86
	Offset: 0x500
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9308c21b()
{
	result = 0;
	if(isdefined(self.node) && self.node.type == #"exposed" && self isatcovernode())
	{
		result = 1;
	}
	return result;
}

/*
	Name: function_c96b0450
	Namespace: namespace_f592a7b
	Checksum: 0x356A3915
	Offset: 0x570
	Size: 0x21A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c96b0450()
{
	level endon(#"game_ended");
	self endon(#"death");
	self.var_ce60d915 = 0;
	while(true)
	{
		waitframe(1);
		if(self getblackboardattribute(#"hash_78e762abc4fbf1de") == "panic")
		{
			if(isdefined(level.players) && level.players.size > 0 && function_9308c21b())
			{
				player = level.players[0];
				distance2dsq = distance2dsquared(self.origin, player.origin);
				if(distance2dsq < sqr(300))
				{
					player_angles = player getplayerangles();
					var_d8b07ab4 = anglestoforward(player_angles);
					var_3495bfe6 = self.origin - player.origin;
					if(vectordot(var_3495bfe6, var_d8b07ab4) > 0)
					{
						self.var_ce60d915 = self.var_ce60d915 + (float(function_60d95f53()) / 1000);
						if(self.var_ce60d915 > 1.5 && self.nextfindbestcovertime > gettime())
						{
							self.nextfindbestcovertime = gettime();
						}
					}
				}
				else
				{
					self.var_ce60d915 = 0;
				}
			}
		}
	}
}

/*
	Name: function_74f41e14
	Namespace: namespace_f592a7b
	Checksum: 0x63441B96
	Offset: 0x798
	Size: 0x2E8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_74f41e14(entity)
{
	var_1f2328d0 = entity function_4794d6a3();
	forcedgoal = is_true(var_1f2328d0.goalforced);
	itsbeenawhile = gettime() > entity.nextfindbestcovertime;
	var_1ebff8de = itsbeenawhile;
	if(forcedgoal || !var_1ebff8de)
	{
		return false;
	}
	if(isdefined(level.var_72b8905c))
	{
		var_be34b5c6 = entity [[level.var_72b8905c]]();
		entity function_387a6908(var_be34b5c6);
		entity.nextfindbestcovertime = 2147483647;
		return true;
	}
	pickedpoint = undefined;
	var_cab884f3 = randomfloat(1);
	if(is_true(entity.var_6fc509b9) || !function_9308c21b() && var_cab884f3 < 0.5)
	{
		if(is_true(entity.var_ac4fe74b))
		{
			pickedpoint = function_251c139d(entity, var_1f2328d0, "civilian_region_exposed_cover_tacquery");
		}
		else
		{
			pickedpoint = function_251c139d(entity, var_1f2328d0, "civilian_exposed_cover_tacquery");
		}
	}
	if(!isdefined(pickedpoint))
	{
		if(is_true(entity.var_ac4fe74b))
		{
			pickedpoint = function_251c139d(entity, var_1f2328d0, "civilian_region_cover_tacquery");
		}
		else
		{
			pickedpoint = function_251c139d(entity, var_1f2328d0, "civilian_cover_tacquery");
		}
	}
	if(isdefined(pickedpoint) && isdefined(pickedpoint.node))
	{
		entity function_387a6908(pickedpoint.node);
		entity.nextfindbestcovertime = gettime() + 9999999;
		if(isdefined(entity.var_5557ac4d))
		{
			entity [[entity.var_5557ac4d]]();
		}
		if(is_true(entity.var_6fc509b9))
		{
			entity.var_6fc509b9 = 0;
		}
		return true;
	}
	entity.nextfindbestcovertime = gettime() + 3000;
	return false;
}

/*
	Name: function_ddb1fd83
	Namespace: namespace_f592a7b
	Checksum: 0x5760A4DC
	Offset: 0xA88
	Size: 0x28C
	Parameters: 3
	Flags: Private
*/
function private function_ddb1fd83(nearestnode, tacpoints, pickedpoint)
{
	self notify("7fec587c06753641");
	self endon("7fec587c06753641");
	self endon(#"death");
	var_1f2328d0 = self function_4794d6a3();
	while(true)
	{
		waitframe(1);
		color = (1, 0.7529412, 0.7960784);
		var_f08d182b = " cover goalpos";
		if(pickedpoint.node.type == #"exposed")
		{
			color = (1, 0, 1);
			var_f08d182b = " exposed goalpos";
		}
		/#
			line(var_1f2328d0.goalpos, nearestnode.origin, (1, 0.5, 0), 1, 0, 1);
			print3d(var_1f2328d0.goalpos, ("" + self getentitynumber()) + var_f08d182b, color, 1, 1, 1);
		#/
		foreach(tacpoint in tacpoints)
		{
			if(tacpoint != pickedpoint)
			{
				/#
					line(var_1f2328d0.goalpos, tacpoint.origin, color, 1, 0, 1);
				#/
				continue;
			}
			/#
				print3d(tacpoint.origin, "", (0, 1, 0), 1, 1, 1);
				line(var_1f2328d0.goalpos, tacpoint.origin, (0, 1, 0), 1, 0, 1);
			#/
		}
	}
}

/*
	Name: function_251c139d
	Namespace: namespace_f592a7b
	Checksum: 0xB8B17D0C
	Offset: 0xD20
	Size: 0x240
	Parameters: 3
	Flags: Linked, Private
*/
function private function_251c139d(entity, var_1f2328d0, var_1fe38bcc)
{
	nearestnode = getnearestnode(var_1f2328d0.goalpos);
	tacpoints = undefined;
	pickedpoint = undefined;
	if(!isdefined(nearestnode))
	{
		nearestnode = getnearestnode(entity.origin);
	}
	if(isdefined(nearestnode))
	{
		pixbeginevent(var_1fe38bcc);
		aiprofile_beginentry(var_1fe38bcc);
		tacpoints = tacticalquery(var_1fe38bcc, entity.origin, entity, var_1f2328d0.goalpos, nearestnode);
		pixendevent();
		aiprofile_endentry();
	}
	if(isdefined(tacpoints))
	{
		foreach(tacpoint in tacpoints)
		{
			if(!entity isposinclaimedlocation(tacpoint.origin))
			{
				if(isdefined(entity.pathgoalpos) && entity.pathgoalpos == tacpoint.origin)
				{
					continue;
				}
				pickedpoint = tacpoint;
				break;
			}
		}
		/#
			enabled = getdvarint(#"hash_40c63080b0f73497", 0);
			if(enabled && isdefined(pickedpoint))
			{
				entity thread function_ddb1fd83(nearestnode, tacpoints, pickedpoint);
			}
		#/
	}
	return pickedpoint;
}

/*
	Name: function_387a6908
	Namespace: namespace_f592a7b
	Checksum: 0xFAA8FF43
	Offset: 0xF68
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_387a6908(node)
{
	self endon(#"death");
	aiutility::releaseclaimnode(self);
	aiutility::usecovernodewrapper(self, node);
}

/*
	Name: function_850bdbb2
	Namespace: namespace_f592a7b
	Checksum: 0xD1207768
	Offset: 0xFC0
	Size: 0x82
	Parameters: 1
	Flags: Linked, Private
*/
function private function_850bdbb2(entity)
{
	result = 0;
	if(entity getblackboardattribute(#"hash_78e762abc4fbf1de") == "panic")
	{
		result = function_74f41e14(entity);
		if(!result)
		{
			result = archetypecivilian::civilianpanicescapechooseposition(entity);
		}
	}
	return result;
}

/*
	Name: function_9cefbbde
	Namespace: namespace_f592a7b
	Checksum: 0xBF51091B
	Offset: 0x1050
	Size: 0x194
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9cefbbde(var_5f60ac6c)
{
	contact_point = var_5f60ac6c.origin;
	initial_force = (0, 0, -1);
	switch(var_5f60ac6c.var_2e23b67d)
	{
		case "hash_60c22b8bc17491b":
		{
			initial_force = (0, 0.25, 0.5);
			initial_force = rotatepoint(initial_force, self.angles);
			var_9fa53333 = (0, -10, 10);
			var_9fa53333 = rotatepoint(var_9fa53333, self.angles);
			contact_point = contact_point + var_9fa53333;
			break;
		}
		case "hash_60c2b887cb719ce4":
		{
			initial_force = (0, -0.25, 0.5);
			initial_force = rotatepoint(initial_force, self.angles);
			var_9fa53333 = (0, 10, 10);
			var_9fa53333 = rotatepoint(var_9fa53333, self.angles);
			contact_point = contact_point + var_9fa53333;
			break;
		}
		default:
		{
			break;
		}
	}
	var_5f60ac6c unlink();
	var_5f60ac6c physicslaunch(contact_point, initial_force);
}

/*
	Name: on_ai_killed
	Namespace: namespace_f592a7b
	Checksum: 0x1B2E0F4F
	Offset: 0x11F0
	Size: 0x110
	Parameters: 1
	Flags: Linked, Private
*/
function private on_ai_killed(params)
{
	if(self.archetype === #"civilian")
	{
		if(isdefined(self.civilian_props))
		{
			foreach(var_5f60ac6c in self.civilian_props)
			{
				function_9cefbbde(var_5f60ac6c);
			}
		}
		if(isdefined(params.eattacker) && isplayer(params.eattacker))
		{
			if(isdefined(level.var_f4ed1999))
			{
				level thread [[level.var_f4ed1999]](self, params);
			}
		}
	}
}

/*
	Name: function_dcfd9c90
	Namespace: namespace_f592a7b
	Checksum: 0x67FE0039
	Offset: 0x1308
	Size: 0x21C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_dcfd9c90()
{
	self notify("2e7cf0b3ed141929");
	self endon("2e7cf0b3ed141929");
	level endon(#"game_ended");
	level.var_2feffa6b = 0;
	while(true)
	{
		waitframe(1);
		if(isdefined(level.players) && level.players.size > 0 && gettime() > level.var_2feffa6b)
		{
			player = level.players[0];
			civilians = getaiarchetypearray(#"civilian");
			var_b88ec851 = arraysortclosest(civilians, player.origin);
			foreach(civilian in civilians)
			{
				if(isdefined(civilian) && is_true(civilian.var_c0321be9) && civilian getblackboardattribute(#"hash_78e762abc4fbf1de") != "panic")
				{
					civilian ai::set_behavior_attribute(#"hash_78e762abc4fbf1de", "panic");
					civilian.var_c0321be9 = undefined;
					level.var_2feffa6b = gettime() + function_60d95f53();
					break;
				}
			}
		}
	}
}

/*
	Name: function_8e430c8
	Namespace: namespace_f592a7b
	Checksum: 0x11AA5B60
	Offset: 0x1530
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_8e430c8(var_47b961dc)
{
	self.var_6fc509b9 = 1;
	self setgoal(var_47b961dc);
}

/*
	Name: function_e2953db0
	Namespace: namespace_f592a7b
	Checksum: 0x1D0820C5
	Offset: 0x1570
	Size: 0x13C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_e2953db0(entity, attribute, oldvalue, value)
{
	if(value != oldvalue && value == "panic")
	{
		if(isdefined(attribute.civilian_props))
		{
			foreach(var_5f60ac6c in self.civilian_props)
			{
				function_9cefbbde(var_5f60ac6c);
			}
		}
		var_47b961dc = attribute.origin;
		if(isdefined(attribute.var_5313e2e3))
		{
			var_47b961dc = attribute.var_5313e2e3;
		}
		function_8e430c8(var_47b961dc);
		attribute setblackboardattribute("_prop_overlay", "NONE");
	}
}

/*
	Name: function_7bd21c92
	Namespace: namespace_f592a7b
	Checksum: 0xBFEF283B
	Offset: 0x16B8
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_7bd21c92(value)
{
	oldvalue = self getblackboardattribute("_prop_overlay");
	if(value === oldvalue)
	{
		return;
	}
	self setblackboardattribute("_prop_overlay", value);
	function_b0876f77(value);
}

/*
	Name: function_5c56272f
	Namespace: namespace_f592a7b
	Checksum: 0x85D95D32
	Offset: 0x1740
	Size: 0x9C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_5c56272f(var_df71f499, var_c72571dd, var_2e23b67d)
{
	if(!isdefined(self.civilian_props))
	{
		self.civilian_props = [];
	}
	var_5f60ac6c = util::spawn_model(var_df71f499);
	var_5f60ac6c linkto(self, var_c72571dd, (0, 0, 0), (0, 0, 0));
	var_5f60ac6c.var_2e23b67d = var_2e23b67d;
	self.civilian_props[self.civilian_props.size] = var_5f60ac6c;
}

/*
	Name: function_b0876f77
	Namespace: namespace_f592a7b
	Checksum: 0x3BF4FAE
	Offset: 0x17E8
	Size: 0x1B2
	Parameters: 1
	Flags: Linked
*/
function function_b0876f77(value)
{
	if(isdefined(self.civilian_props))
	{
		array::delete_all(self.civilian_props);
		self.civilian_props = [];
	}
	var_df71f499 = undefined;
	var_c72571dd = undefined;
	switch(value)
	{
		case "hash_73e86238c271de95":
		{
			function_5c56272f("z_briefcase_01_closed", "tag_accessory_left", "BRIEFCASE_LEFT");
			break;
		}
		case "hash_60c22b8bc17491b":
		{
			function_5c56272f("par_umbrella_open_01", "tag_accessory_left", "UMBRELLA_LEFT");
			break;
		}
		case "hash_4ac48798a0be234b":
		{
			function_5c56272f("par_umbrella_open_01_anim", "tag_accessory_left", "UMBRELLA_LEFT");
			function_5c56272f("z_briefcase_01_closed", "tag_accessory_right", "BRIEFCASE_RIGHT");
			break;
		}
		case "hash_60c2b887cb719ce4":
		{
			function_5c56272f("par_umbrella_open_01", "tag_accessory_right", "UMBRELLA_RIGHT");
			break;
		}
		case "none":
		default:
		{
			break;
		}
	}
}

/*
	Name: function_f1d19be1
	Namespace: namespace_f592a7b
	Checksum: 0xFA23678A
	Offset: 0x19A8
	Size: 0x3DC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f1d19be1()
{
	self notify(#"hash_5048c5b7622d6841");
	self endon(#"hash_5048c5b7622d6841");
	level endon(#"game_ended");
	self endon(#"death");
	self addsentienteventlistener("bulletwhizby");
	self addsentienteventlistener("explode");
	self addsentienteventlistener("grenade danger");
	self addsentienteventlistener("gunshot");
	self addsentienteventlistener("grenade danger");
	self addsentienteventlistener("projectile_impact");
	while(true)
	{
		if(self getblackboardattribute(#"hash_78e762abc4fbf1de") != "panic")
		{
			waitframe(1);
			continue;
		}
		if(isdefined(self.node) && !self isatcovernode())
		{
			waitframe(1);
			continue;
		}
		var_7f729179 = undefined;
		var_7f729179 = self waittill(#"hash_6db2b95877884141");
		waittillframeend();
		if(self.ignoreall || self isragdoll())
		{
			continue;
		}
		foreach(event in var_7f729179.events)
		{
			if(!isdefined(event.entity))
			{
				continue;
			}
			if(event.type == "projectile_impact" && isdefined(event.entity.owner))
			{
				event.entity = event.entity.owner;
			}
			if(issentient(event.entity) && (event.entity.ignoreme || is_true(event.entity isnotarget())))
			{
				continue;
			}
			self.nextfindbestcovertime = gettime();
			/#
				enabled = getdvarint(#"hash_40c63080b0f73497", 0);
				if(enabled)
				{
					line(self getcentroid(), event.origin, (1, 0.5, 0), 1, 0, 500);
					print3d(event.origin, "" + event.type, (1, 0.5, 0), 1, 1, 500);
				}
			#/
		}
	}
}

/*
	Name: function_a8f579e
	Namespace: namespace_f592a7b
	Checksum: 0xB43C345
	Offset: 0x1D90
	Size: 0x108
	Parameters: 0
	Flags: Private
*/
function private function_a8f579e()
{
	level endon(#"game_ended");
	self endon(#"death");
	while(true)
	{
		waitframe(1);
		enabled = getdvarint(#"hash_40c63080b0f73497", 0);
		if(!enabled)
		{
			continue;
		}
		if(self getblackboardattribute(#"hash_78e762abc4fbf1de") != "panic")
		{
			continue;
		}
		if(self isatcovernode())
		{
			/#
				print3d(self getcentroid(), "", (1, 1, 0), 1, 1, 1);
			#/
		}
	}
}

