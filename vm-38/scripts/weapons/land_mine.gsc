#using scripts\weapons\weaponobjects.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\entityheadicons_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\battlechatter.gsc;

#namespace land_mine;

/*
	Name: function_3d53c53f
	Namespace: land_mine
	Checksum: 0xDC0B1B6E
	Offset: 0x180
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3d53c53f()
{
	level notify(425073558);
}

/*
	Name: __init__system__
	Namespace: land_mine
	Checksum: 0x6632B5F6
	Offset: 0x1A0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"land_mine", &function_70a657d8, undefined, &finalize, undefined);
}

/*
	Name: function_70a657d8
	Namespace: land_mine
	Checksum: 0x2B3217EE
	Offset: 0x1F0
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!isdefined(level.var_261f640c))
	{
		level.var_261f640c = spawnstruct();
	}
	level.var_261f640c.var_9e2c9bc2 = [];
	weaponobjects::function_e6400478(#"land_mine", &function_14428e95, 0);
	if(sessionmodeiscampaigngame())
	{
		weaponobjects::function_e6400478(#"hash_675e85b293a65c14", &function_14428e95, 0);
	}
	callback::on_player_killed(&onplayerkilled);
}

/*
	Name: finalize
	Namespace: land_mine
	Checksum: 0x65E963EA
	Offset: 0x2D8
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function finalize()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon(#"land_mine"), &function_bff5c062);
	}
}

/*
	Name: function_14428e95
	Namespace: land_mine
	Checksum: 0xE61F14EE
	Offset: 0x330
	Size: 0x24E
	Parameters: 1
	Flags: Linked
*/
function function_14428e95(var_cd03ffa)
{
	var_cd03ffa.watchforfire = 1;
	var_cd03ffa.ownergetsassist = 1;
	var_cd03ffa.ignoredirection = 1;
	var_cd03ffa.immediatedetonation = 1;
	var_cd03ffa.immunespecialty = "specialty_landminetrigger";
	var_cd03ffa.var_8eda8949 = (0, 0, 0);
	var_cd03ffa.detectiongraceperiod = 0;
	var_cd03ffa.stuntime = 1;
	var_cd03ffa.var_10efd558 = "switched_field_upgrade";
	if(isdefined(var_cd03ffa.weapon.customsettings))
	{
		var_6f1c6122 = getscriptbundle(var_cd03ffa.weapon.customsettings);
		/#
			assert(isdefined(var_6f1c6122));
		#/
		level.var_261f640c.var_a74161cc = var_6f1c6122;
		var_cd03ffa.activationdelay = (isdefined(level.var_261f640c.var_a74161cc.var_a3fd61e7) ? level.var_261f640c.var_a74161cc.var_a3fd61e7 : 0);
		var_cd03ffa.timeout = (isdefined(level.var_261f640c.var_a74161cc.var_bd063370) ? level.var_261f640c.var_a74161cc.var_bd063370 : 3000);
	}
	var_cd03ffa.ondetonatecallback = &function_3bcaeef4;
	var_cd03ffa.onspawn = &function_6392cd30;
	var_cd03ffa.ondamage = &function_6d1a12d3;
	var_cd03ffa.stun = &weaponobjects::weaponstun;
	var_cd03ffa.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	var_cd03ffa.ontimeout = &weaponobjects::weaponobjectfizzleout;
	var_cd03ffa.var_994b472b = &function_fb1ccfa6;
	level.var_261f640c.var_74ac4720 = var_cd03ffa;
}

/*
	Name: function_80b82a4d
	Namespace: land_mine
	Checksum: 0xF2FB273D
	Offset: 0x588
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function function_80b82a4d()
{
	return (self flag::get(#"hash_5f2dea08efab6bbc") ? (isdefined(self.var_396b2ca4.origin) ? self.var_396b2ca4.origin : self.origin) : self.origin);
}

/*
	Name: function_fe8abb3
	Namespace: land_mine
	Checksum: 0xFCE89E51
	Offset: 0x5F8
	Size: 0xEC
	Parameters: 4
	Flags: Linked
*/
function function_fe8abb3(asurfacefxtable, vposition, vforward, vup)
{
	if(isdefined(asurfacefxtable))
	{
		var_54d68ee6 = (isdefined(vposition) ? vposition : function_80b82a4d());
		var_bec4f825 = groundtrace(var_54d68ee6 + vectorscale((0, 0, 1), 70), var_54d68ee6 + (vectorscale((0, 0, -1), 100)), 0, self);
		var_4be8e019 = self getfxfromsurfacetable(asurfacefxtable, var_bec4f825[#"surfacetype"]);
		playfx(var_4be8e019, var_54d68ee6, vforward, vup);
	}
}

/*
	Name: function_c2111ea5
	Namespace: land_mine
	Checksum: 0x624609CD
	Offset: 0x6F0
	Size: 0xD2
	Parameters: 0
	Flags: Linked
*/
function function_c2111ea5()
{
	var_396b2ca4 = spawn("script_model", self.origin);
	var_396b2ca4.angles = self.angles;
	var_396b2ca4.owner = self.owner;
	var_396b2ca4 setowner(self.owner);
	var_396b2ca4.team = self.team;
	var_396b2ca4 setteam(self.team);
	var_396b2ca4 enablelinkto();
	var_396b2ca4 linkto(self);
	self.var_396b2ca4 = var_396b2ca4;
}

/*
	Name: function_b0bc024c
	Namespace: land_mine
	Checksum: 0xE41757C2
	Offset: 0x7D0
	Size: 0x190
	Parameters: 0
	Flags: Linked
*/
function function_b0bc024c()
{
	var_2624b6bd = (isdefined(level.var_261f640c.var_a74161cc.var_2a7507d) ? level.var_261f640c.var_a74161cc.var_2a7507d : 0);
	if(var_2624b6bd > 0)
	{
		var_54d68ee6 = function_80b82a4d();
		foreach(entity in getentitiesinradius(var_54d68ee6, 0))
		{
			if(function_512af0bb(entity))
			{
				entity dodamage(var_2624b6bd, var_54d68ee6, self.owner, self, undefined, "MOD_EXPLOSIVE", 0, self.weapon);
			}
		}
	}
}

/*
	Name: function_3bcaeef4
	Namespace: land_mine
	Checksum: 0x81ABE760
	Offset: 0x968
	Size: 0x5C
	Parameters: 3
	Flags: Linked
*/
function function_3bcaeef4(attacker, weapon, target)
{
	function_fe8abb3(level.var_261f640c.var_a74161cc.var_f374e513);
	weaponobjects::proximitydetonate(attacker, weapon, target);
}

/*
	Name: function_f7f83267
	Namespace: land_mine
	Checksum: 0x309B188
	Offset: 0x9D0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_f7f83267()
{
	function_fe8abb3(level.var_261f640c.var_a74161cc.var_4699084d);
	if(isdefined(self.weapon.projexplosionsound))
	{
		self playsound(self.weapon.projexplosionsound);
	}
	self delete();
}

/*
	Name: function_338f99f5
	Namespace: land_mine
	Checksum: 0x3182ABA4
	Offset: 0xA58
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_338f99f5()
{
	self endon(#"death", #"detonating");
	if(self.var_83cc2c9 !== 1)
	{
		self playsound((isdefined(level.var_261f640c.var_a74161cc.var_a021aadb) ? level.var_261f640c.var_a74161cc.var_a021aadb : ""));
		self.var_83cc2c9 = 1;
	}
	wait((isdefined(level.var_261f640c.var_a74161cc.var_4c3ef8d4) ? level.var_261f640c.var_a74161cc.var_4c3ef8d4 : 0));
	function_b0bc024c();
	weaponobjects::proximityweaponobject_dodetonation(level.var_261f640c.var_74ac4720, undefined, function_80b82a4d());
}

/*
	Name: function_b6dde12d
	Namespace: land_mine
	Checksum: 0x2D1C829B
	Offset: 0xB98
	Size: 0x394
	Parameters: 0
	Flags: Linked
*/
function function_b6dde12d()
{
	self endon(#"death");
	if(isdefined(self.var_396b2ca4))
	{
		waitframe(1);
		/#
			function_bb195195("");
		#/
		if(level.var_261f640c.var_a74161cc.var_69ff03c3 === 1)
		{
			var_a883d625 = self.var_396b2ca4.var_f20af839;
		}
		else
		{
			var_a883d625 = (0, 0, 1);
		}
		playsoundatposition((isdefined(level.var_261f640c.var_a74161cc.var_df4a92e4) ? level.var_261f640c.var_a74161cc.var_df4a92e4 : ""), self.var_396b2ca4.origin);
		playrumbleonposition(#"hash_718ba886b3205e3f", self.var_396b2ca4.origin);
		function_fe8abb3(level.var_261f640c.var_a74161cc.var_d9aa8220, undefined, var_a883d625);
		var_36ef4af8 = (isdefined(level.var_261f640c.var_a74161cc.var_fc21999b) ? level.var_261f640c.var_a74161cc.var_fc21999b : 10);
		var_d9c1b66c = (isdefined(level.var_261f640c.var_a74161cc.var_54f4d94) ? level.var_261f640c.var_a74161cc.var_54f4d94 : 300);
		var_30d9899f = (isdefined(level.var_261f640c.var_a74161cc.var_4c600aeb) ? level.var_261f640c.var_a74161cc.var_4c600aeb : 200);
		var_118c0bbc = (isdefined(level.var_261f640c.var_a74161cc.var_34eaeabd) ? level.var_261f640c.var_a74161cc.var_34eaeabd : 100);
		var_d1e53dda = (isdefined(level.var_261f640c.var_a74161cc.var_b0b1c21b) ? level.var_261f640c.var_a74161cc.var_b0b1c21b : 100);
		if(isdefined(self.owner))
		{
			owner = self.owner;
		}
		else
		{
			owner = undefined;
		}
		self cylinderdamage(var_a883d625 * var_d1e53dda, self.var_396b2ca4.origin, var_36ef4af8, var_d9c1b66c, var_30d9899f, var_118c0bbc, owner, "MOD_EXPLOSIVE", self.weapon);
		/#
			self.var_396b2ca4 function_bdff0e71(var_a883d625, var_d1e53dda, var_36ef4af8, var_d9c1b66c);
		#/
		self delete();
	}
}

/*
	Name: function_cb491e62
	Namespace: land_mine
	Checksum: 0xC3B57969
	Offset: 0xF38
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_cb491e62(var_789c84fd)
{
	if(level.var_261f640c.var_a74161cc.var_69ff03c3 !== 1)
	{
		var_fade8670 = self.var_396b2ca4 getangles();
		var_506743ed = (0, var_fade8670[1], 0);
		self.var_396b2ca4 rotateto(var_506743ed, var_789c84fd, 0, 0);
	}
}

/*
	Name: function_6cbaafc6
	Namespace: land_mine
	Checksum: 0x2F9ADC7B
	Offset: 0xFD8
	Size: 0x4EC
	Parameters: 0
	Flags: Linked
*/
function function_6cbaafc6()
{
	self endon(#"death");
	self.canthack = 1;
	if(self.var_83cc2c9 !== 1)
	{
		self playsound((isdefined(level.var_261f640c.var_a74161cc.var_9a29cecd) ? level.var_261f640c.var_a74161cc.var_9a29cecd : ""));
		self.var_83cc2c9 = 1;
	}
	wait((isdefined(level.var_261f640c.var_a74161cc.var_88b0248b) ? level.var_261f640c.var_a74161cc.var_88b0248b : 0));
	/#
		function_bb195195("");
	#/
	self.var_396b2ca4 setmodel(self.model);
	self ghost();
	self notsolid();
	self.var_396b2ca4 unlink();
	if(level.var_261f640c.var_a74161cc.var_99f70df7 === 1)
	{
		self.var_396b2ca4.var_f20af839 = vectornormalize(anglestoup(self.var_396b2ca4.angles));
	}
	else
	{
		self.var_396b2ca4.var_f20af839 = (0, 0, 1);
	}
	var_f0efa00d = (isdefined(level.var_261f640c.var_a74161cc.var_1065654c) ? level.var_261f640c.var_a74161cc.var_1065654c : 25);
	self flag::set(#"hash_5f2dea08efab6bbc");
	var_78983824 = self.var_396b2ca4.origin + (self.var_396b2ca4.var_f20af839 * var_f0efa00d);
	var_7895a956 = (isdefined(level.var_261f640c.var_a74161cc.var_564c2203) ? level.var_261f640c.var_a74161cc.var_564c2203 : 1);
	playsoundatposition((isdefined(level.var_261f640c.var_a74161cc.var_69029368) ? level.var_261f640c.var_a74161cc.var_69029368 : ""), self.var_396b2ca4.origin);
	self.var_396b2ca4 moveto(var_78983824, var_7895a956, 0, var_7895a956);
	function_cb491e62(var_7895a956 * 0.25);
	function_fe8abb3(level.var_261f640c.var_a74161cc.var_5afd2a1d, undefined, self.var_396b2ca4.var_f20af839);
	self.var_396b2ca4 waittilltimeout(var_7895a956, #"movedone");
	var_b6bebc60 = (isdefined(level.var_261f640c.var_a74161cc.var_b140445d) ? level.var_261f640c.var_a74161cc.var_b140445d : 10);
	var_3503290a = (isdefined(level.var_261f640c.var_a74161cc.var_dfc89b2a) ? level.var_261f640c.var_a74161cc.var_dfc89b2a : 1);
	self.var_396b2ca4 moveto(self.var_396b2ca4.origin + ((0, 0, -1) * var_b6bebc60), var_3503290a, var_3503290a, 0);
	self.var_396b2ca4 waittilltimeout(var_3503290a, #"movedone");
	function_b6dde12d();
}

/*
	Name: function_4e2fe8ed
	Namespace: land_mine
	Checksum: 0x7FC4909C
	Offset: 0x14D0
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function function_4e2fe8ed()
{
	var_dfb72bf5 = self.var_d2318975;
	/#
		foreach(var_a58f4914 in getarraykeys(var_dfb72bf5))
		{
			function_bb195195(var_a58f4914 + "");
		}
	#/
	if(self.var_d235cef4.size == 0)
	{
		if(var_dfb72bf5.size > 0)
		{
			/#
				function_bb195195("");
			#/
			self.var_7e7d9d86 = gettime();
		}
	}
}

/*
	Name: function_bb441173
	Namespace: land_mine
	Checksum: 0x888FC879
	Offset: 0x15D0
	Size: 0x22E
	Parameters: 0
	Flags: Linked
*/
function function_bb441173()
{
	if(isdefined(self.var_7e7d9d86))
	{
		var_cc84da8f = (float(gettime() - self.var_7e7d9d86)) / 1000;
		var_39eb023 = (isdefined(level.var_261f640c.var_a74161cc.var_c367e5) ? level.var_261f640c.var_a74161cc.var_c367e5 : 0.25) - var_cc84da8f;
		if(var_39eb023 <= 0)
		{
			/#
				function_bb195195("");
			#/
			self.var_937978c9 = int((isdefined(level.var_261f640c.var_a74161cc.var_af22b5dc) ? level.var_261f640c.var_a74161cc.var_af22b5dc : 3) * 1000);
			self.var_9a25b7e0 = int((isdefined(level.var_261f640c.var_a74161cc.var_af22b5dc) ? level.var_261f640c.var_a74161cc.var_af22b5dc : 3) * 1000);
			self.var_5a64415f = int((isdefined(level.var_261f640c.var_a74161cc.var_98ba0e9b) ? level.var_261f640c.var_a74161cc.var_98ba0e9b : 0) * 1000);
		}
		else
		{
			/#
				function_bb195195("" + var_39eb023);
			#/
		}
		self.var_7e7d9d86 = undefined;
	}
}

/*
	Name: function_975a46a
	Namespace: land_mine
	Checksum: 0x95012741
	Offset: 0x1808
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function function_975a46a()
{
	if(!isvehicle(self))
	{
		return false;
	}
	var_c1d7860f = self getvehoccupants();
	if(isdefined(var_c1d7860f.size) && var_c1d7860f.size != 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_512af0bb
	Namespace: land_mine
	Checksum: 0xAE2E7753
	Offset: 0x1878
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function function_512af0bb(entity)
{
	return self != entity && weaponobjects::proximityweaponobject_validtriggerentity(level.var_261f640c.var_74ac4720, entity) && !weaponobjects::proximityweaponobject_isspawnprotected(level.var_261f640c.var_74ac4720, entity) && !weaponobjects::isjammed() && !entity function_975a46a();
}

/*
	Name: function_bf99f93f
	Namespace: land_mine
	Checksum: 0xB788280D
	Offset: 0x1918
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_bf99f93f(entity)
{
	var_a58f4914 = entity getentitynumber();
	if(!isdefined(self.var_d235cef4[var_a58f4914]))
	{
		self.var_d235cef4[var_a58f4914] = 0;
	}
	self.var_d235cef4[var_a58f4914]++;
	if(!isdefined(self.var_d2318975[var_a58f4914]))
	{
		/#
			self function_bb195195(var_a58f4914 + "");
		#/
		self function_bb441173();
	}
	else
	{
		arrayremoveindex(self.var_d2318975, var_a58f4914, 1);
	}
}

/*
	Name: function_53909c68
	Namespace: land_mine
	Checksum: 0x4C7B41E
	Offset: 0x1A00
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function function_53909c68()
{
	self.var_c65aa5bf = undefined;
	if(self.var_c3e7ab73 !== 1)
	{
		foreach(player in getplayers(undefined, function_80b82a4d(), 180))
		{
			if(self function_512af0bb(player) && !player isinvehicle())
			{
				self.var_c65aa5bf = 1;
				self function_bf99f93f(player);
			}
		}
	}
}

/*
	Name: function_6b505982
	Namespace: land_mine
	Checksum: 0x9DC2C075
	Offset: 0x1B50
	Size: 0x1D8
	Parameters: 0
	Flags: Linked
*/
function function_6b505982()
{
	self.var_e5845f1 = undefined;
	if(self.var_c3e7ab73 !== 1)
	{
		position = function_80b82a4d();
		foreach(actor in function_fd768835(self.team, position, 180))
		{
			if(!isactor(actor) || !isalive(actor))
			{
				continue;
			}
			if(self function_512af0bb(actor))
			{
				if(is_true(self.var_e5845f1) || sighttracepassed(actor geteyeapprox(), position + vectorscale((0, 0, 1), 30), 0, self))
				{
					self.var_e5845f1 = 1;
					self function_bf99f93f(actor);
				}
			}
		}
	}
}

/*
	Name: function_a5b5d269
	Namespace: land_mine
	Checksum: 0x296E80AD
	Offset: 0x1D30
	Size: 0x218
	Parameters: 1
	Flags: Linked
*/
function function_a5b5d269(vehicle)
{
	var_f37028af = (isdefined(level.var_261f640c.var_a74161cc.var_40e96f5e) ? level.var_261f640c.var_a74161cc.var_40e96f5e : 25);
	var_c174cf1 = anglestoup(self.angles);
	var_54d68ee6 = self function_80b82a4d();
	var_938b52b8 = self getboundsmidpoint();
	var_9080bd0b = (var_54d68ee6 + var_938b52b8) + (var_c174cf1 * (var_f37028af * -1));
	var_e5cf14da = vehicle.origin + rotatepoint(vehicle.mins, vehicle.angles);
	var_e945d0d7 = vehicle.origin + rotatepoint(vehicle.maxs, vehicle.angles);
	/#
		drawdebugline(var_9080bd0b, var_9080bd0b + ((var_c174cf1 * var_f37028af) * 2));
		drawdebugline(var_9080bd0b, var_e5cf14da);
		drawdebugline(var_9080bd0b, var_e945d0d7);
	#/
	var_c8846d83 = (vectordot(var_c174cf1, var_e5cf14da - var_9080bd0b)) > 0;
	var_afda0584 = (vectordot(var_c174cf1, var_e945d0d7 - var_9080bd0b)) > 0;
	return var_c8846d83 && var_afda0584;
}

/*
	Name: function_85f3cf29
	Namespace: land_mine
	Checksum: 0x975BF808
	Offset: 0x1F50
	Size: 0x152
	Parameters: 2
	Flags: Linked
*/
function function_85f3cf29(vehicle, var_ce282718)
{
	var_54d68ee6 = self function_80b82a4d();
	var_938b52b8 = self getboundsmidpoint();
	var_6f827f51 = (var_ce282718, var_ce282718, var_ce282718);
	var_302c9a00 = vehicle getboundsmidpoint();
	var_be6be396 = vehicle getboundshalfsize();
	/#
		function_f8d33ba4(var_54d68ee6 + var_938b52b8, var_6f827f51 * -1, var_6f827f51, self.angles);
		function_f8d33ba4(vehicle.origin + var_302c9a00, var_be6be396 * -1, var_be6be396, vehicle.angles);
	#/
	return function_ecdf9b24(var_54d68ee6 + var_938b52b8, self.angles, var_6f827f51, vehicle.origin + var_302c9a00, vehicle.angles, var_be6be396);
}

/*
	Name: function_372e295b
	Namespace: land_mine
	Checksum: 0x7BFB5617
	Offset: 0x20B0
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_372e295b(vehicle)
{
	return function_85f3cf29(vehicle, (isdefined(level.var_261f640c.var_a74161cc.var_40e96f5e) ? level.var_261f640c.var_a74161cc.var_40e96f5e : 25)) && function_a5b5d269(vehicle);
}

/*
	Name: function_e761fbc2
	Namespace: land_mine
	Checksum: 0xEF99A13A
	Offset: 0x2138
	Size: 0x148
	Parameters: 0
	Flags: Linked
*/
function function_e761fbc2()
{
	self.var_1096f0a1 = undefined;
	if(self.var_3c07863f !== 1)
	{
		foreach(vehicle in getentitiesinradius(function_80b82a4d(), 25, level.var_261f640c.var_a74161cc.var_40e96f5e))
		{
			if(self function_512af0bb(vehicle) && function_372e295b(vehicle))
			{
				self.var_1096f0a1 = 1;
				self function_bf99f93f(vehicle);
			}
		}
	}
}

/*
	Name: function_3e2ef4c6
	Namespace: land_mine
	Checksum: 0xCC335F5E
	Offset: 0x2288
	Size: 0x140
	Parameters: 0
	Flags: Linked
*/
function function_3e2ef4c6()
{
	foreach(var_f9982904 in level.var_261f640c.var_9e2c9bc2)
	{
		if(!isdefined(var_f9982904) || var_f9982904.var_3c07863f === 1)
		{
			continue;
		}
		var_f9982904.var_d2318975 = (isdefined(var_f9982904.var_d235cef4) ? var_f9982904.var_d235cef4 : []);
		var_f9982904.var_d235cef4 = [];
		var_f9982904 function_53909c68();
		var_f9982904 function_e761fbc2();
		if(sessionmodeiscampaigngame())
		{
			var_f9982904 function_6b505982();
		}
		var_f9982904 function_4e2fe8ed();
	}
}

/*
	Name: function_de00142b
	Namespace: land_mine
	Checksum: 0xEA23A301
	Offset: 0x23D0
	Size: 0x2C0
	Parameters: 1
	Flags: Linked
*/
function function_de00142b(var_659a9f4f)
{
	foreach(var_f9982904 in level.var_261f640c.var_9e2c9bc2)
	{
		if(isdefined(var_f9982904))
		{
			if(var_f9982904.var_c65aa5bf === 1)
			{
				var_f9982904.var_937978c9 = var_f9982904.var_937978c9 - var_659a9f4f;
				/#
					var_f9982904 function_bb195195("" + (float(var_f9982904.var_937978c9) / 1000));
				#/
				if(var_f9982904.var_937978c9 < 0)
				{
					var_f9982904.var_c3e7ab73 = 1;
					var_f9982904 thread function_6cbaafc6();
				}
			}
			if(var_f9982904.var_1096f0a1 === 1)
			{
				var_f9982904.var_5a64415f = var_f9982904.var_5a64415f - var_659a9f4f;
				/#
					var_f9982904 function_bb195195("" + (float(var_f9982904.var_5a64415f) / 1000));
				#/
				if(var_f9982904.var_5a64415f < 0)
				{
					var_f9982904.var_3c07863f = 1;
					if(flag::get(#"hash_5f2dea08efab6bbc"))
					{
						var_f9982904 thread function_b6dde12d();
					}
					else
					{
						var_f9982904 thread function_338f99f5();
					}
				}
			}
			if(var_f9982904.var_e5845f1 === 1)
			{
				var_f9982904.var_9a25b7e0 = var_f9982904.var_9a25b7e0 - var_659a9f4f;
				/#
					var_f9982904 function_bb195195("" + (float(var_f9982904.var_9a25b7e0) / 1000));
				#/
				if(var_f9982904.var_9a25b7e0 < 0)
				{
					var_f9982904.var_c3e7ab73 = 1;
					var_f9982904 thread function_6cbaafc6();
				}
			}
		}
	}
}

/*
	Name: function_63c13dff
	Namespace: land_mine
	Checksum: 0x2675EFD4
	Offset: 0x2698
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_63c13dff()
{
	self notify("727218002c901371");
	self endon("727218002c901371");
	if(!isdefined(level.var_261f640c.var_1270895))
	{
		level.var_261f640c.var_1270895 = gettime();
	}
	while(true)
	{
		var_77c4d94d = gettime();
		function_3e2ef4c6();
		function_de00142b(var_77c4d94d - level.var_261f640c.var_1270895);
		if(level.var_261f640c.var_9e2c9bc2.size == 0)
		{
			level.var_261f640c.var_1270895 = undefined;
			break;
		}
		level.var_261f640c.var_1270895 = var_77c4d94d;
		waitframe(1);
	}
}

/*
	Name: function_fb1ccfa6
	Namespace: land_mine
	Checksum: 0xC1633A0A
	Offset: 0x2790
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_fb1ccfa6(player)
{
	weaponobjects::weaponobjectfizzleout();
}

/*
	Name: function_6392cd30
	Namespace: land_mine
	Checksum: 0xA7C7DF8A
	Offset: 0x27B8
	Size: 0x32C
	Parameters: 2
	Flags: Linked
*/
function function_6392cd30(var_cd03ffa, owner)
{
	self endon(#"death");
	callback::function_d8abfc3d(#"on_entity_deleted", &function_ee5d9464);
	self.var_e744cea3 = &function_df5749e2;
	self.var_3f9bd15 = &onvehiclekilled;
	self.var_63be5750 = &function_7bc9fe48;
	self.delete_on_death = 1;
	self.var_48d842c3 = 1;
	self.var_515d6dda = 1;
	self function_619a5c20();
	self.var_937978c9 = int((isdefined(level.var_261f640c.var_a74161cc.var_af22b5dc) ? level.var_261f640c.var_a74161cc.var_af22b5dc : 3) * 1000);
	self.var_9a25b7e0 = int((isdefined(level.var_261f640c.var_a74161cc.var_af22b5dc) ? level.var_261f640c.var_a74161cc.var_af22b5dc : 3) * 1000);
	self.var_5a64415f = int((isdefined(level.var_261f640c.var_a74161cc.var_98ba0e9b) ? level.var_261f640c.var_a74161cc.var_98ba0e9b : 0) * 1000);
	self util::waittillnotmoving();
	if(self depthinwater() > 10)
	{
		weaponobjects::weaponobjectfizzleout();
	}
	if(var_cd03ffa.activationdelay)
	{
		wait(var_cd03ffa.activationdelay);
	}
	self playsound(#"hash_59ac94ba0cea7587");
	owner battlechatter::function_fc82b10(self.weapon, self.origin, self);
	function_c2111ea5();
	var_a58f4914 = self getentitynumber();
	level.var_261f640c.var_9e2c9bc2[var_a58f4914] = self;
	level thread function_63c13dff();
	/#
		self thread function_47ff3ce7();
	#/
}

/*
	Name: function_ee5d9464
	Namespace: land_mine
	Checksum: 0xDCB032DF
	Offset: 0x2AF0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_ee5d9464()
{
	if(isdefined(self.var_396b2ca4))
	{
		self.var_396b2ca4 deletedelay();
	}
	arrayremoveindex(level.var_261f640c.var_9e2c9bc2, self getentitynumber());
}

/*
	Name: function_6d1a12d3
	Namespace: land_mine
	Checksum: 0x710A525D
	Offset: 0x2B60
	Size: 0x5D4
	Parameters: 1
	Flags: Linked
*/
function function_6d1a12d3(var_cd03ffa)
{
	self endon(#"death");
	self setcandamage(1);
	self.maxhealth = 100000;
	self.health = self.maxhealth;
	self.damagetaken = 0;
	while(true)
	{
		var_cc5d20f7 = undefined;
		var_cc5d20f7 = self waittill(#"damage");
		eattacker = var_cc5d20f7.attacker;
		weapon = var_cc5d20f7.weapon;
		var_2e7ca408 = var_cc5d20f7.amount;
		type = var_cc5d20f7.mod;
		idflags = var_cc5d20f7.flags;
		inflictor = var_cc5d20f7.inflictor;
		eattacker = self [[level.figure_out_attacker]](eattacker);
		if(isvehicle(inflictor) && type === "MOD_CRUSH")
		{
			continue;
		}
		if(isdefined(weapon))
		{
			self weaponobjects::weapon_object_do_damagefeedback(weapon, eattacker, type, var_cc5d20f7.inflictor);
			if(var_cd03ffa.stuntime > 0 && weapon.dostun)
			{
				self thread weaponobjects::stunstart(var_cd03ffa, var_cd03ffa.stuntime);
				continue;
			}
		}
		if(!level.weaponobjectdebug && level.teambased && isplayer(eattacker) && isdefined(self.owner))
		{
			if(!level.hardcoremode && !util::function_fbce7263(self.owner.team, eattacker.pers[#"team"]) && self.owner != eattacker)
			{
				continue;
			}
		}
		if(!isvehicle(self) && !damage::friendlyfirecheck(self.owner, eattacker))
		{
			continue;
		}
		self.damagetaken = self.damagetaken + var_2e7ca408;
		if(self.damagetaken < (isdefined(level.var_261f640c.var_a74161cc.var_d56aa2d4) ? level.var_261f640c.var_a74161cc.var_d56aa2d4 : 15))
		{
			continue;
		}
		if(isdefined(var_cd03ffa.var_34400f36) && !self [[var_cd03ffa.var_34400f36]](var_cd03ffa, eattacker, weapon, var_2e7ca408))
		{
			continue;
		}
		if(util::function_fbce7263(eattacker.team, self.team))
		{
			killstreaks::function_e729ccee(eattacker, weapon);
		}
		break;
	}
	if(level.weaponobjectexplodethisframe)
	{
		wait(0.1 + randomfloat(0.4));
	}
	else
	{
		waitframe(1);
	}
	level.weaponobjectexplodethisframe = 1;
	thread weaponobjects::resetweaponobjectexplodethisframe();
	self entityheadicons::setentityheadicon("none");
	if(isdefined(type) && (issubstr(type, "MOD_GRENADE_SPLASH") || issubstr(type, "MOD_GRENADE") || issubstr(type, "MOD_EXPLOSIVE")))
	{
		self.waschained = 1;
	}
	if(isdefined(idflags) && idflags & 8)
	{
		self.wasdamagedfrombulletpenetration = 1;
	}
	self.wasdamaged = 1;
	if(isplayer(eattacker) && eattacker != self.owner && util::function_fbce7263(eattacker.team, self.team))
	{
		var_46aa2edd = self.owner weaponobjects::function_8481fc06(self.weapon) > 1;
		self.owner thread globallogic_audio::function_6daffa93(self.weapon, var_46aa2edd);
		eattacker challenges::destroyedequipment(weapon);
		self battlechatter::function_d2600afc(eattacker, self.owner, self.weapon);
		self.owner globallogic_score::function_5829abe3(eattacker, weapon, self.weapon);
	}
	function_f7f83267();
}

/*
	Name: function_bff5c062
	Namespace: land_mine
	Checksum: 0x29AE4064
	Offset: 0x3140
	Size: 0x1DC
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(var_80b21eea, attackingplayer)
{
	var_f3ab6571 = var_80b21eea.owner weaponobjects::function_8481fc06(var_80b21eea.weapon) > 1;
	var_80b21eea.owner thread globallogic_audio::function_a2cde53d(var_80b21eea.weapon, var_f3ab6571);
	var_80b21eea.owner weaponobjects::hackerremoveweapon(var_80b21eea);
	var_80b21eea weaponobjects::function_fb7b0024(var_80b21eea.owner);
	var_80b21eea.team = attackingplayer.team;
	var_80b21eea setteam(attackingplayer.team);
	var_80b21eea.owner = attackingplayer;
	var_80b21eea setowner(attackingplayer);
	var_80b21eea weaponobjects::function_386fa470(attackingplayer);
	var_80b21eea weaponobjects::function_931041f8(attackingplayer);
	if(isdefined(var_80b21eea) && isdefined(level.var_f1edf93f))
	{
		_station_up_to_detention_center_triggers = [[level.var_f1edf93f]]();
		if((isdefined(_station_up_to_detention_center_triggers) ? _station_up_to_detention_center_triggers : 0))
		{
			var_80b21eea notify(#"cancel_timeout");
			var_80b21eea thread weaponobjects::weapon_object_timeout(var_80b21eea.var_2d045452, _station_up_to_detention_center_triggers);
		}
	}
	var_80b21eea thread weaponobjects::function_6d8aa6a0(attackingplayer, var_80b21eea.var_2d045452);
}

/*
	Name: function_df5749e2
	Namespace: land_mine
	Checksum: 0x732C5B80
	Offset: 0x3328
	Size: 0xAE
	Parameters: 15
	Flags: Linked
*/
function function_df5749e2(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(isdefined(self.var_4f5edd7d))
	{
		return (self.maxhealth * self.var_4f5edd7d) * 0.01;
	}
	return self.maxhealth;
}

/*
	Name: onplayerkilled
	Namespace: land_mine
	Checksum: 0xBE1D6119
	Offset: 0x33E0
	Size: 0x17C
	Parameters: 1
	Flags: Linked
*/
function onplayerkilled(params)
{
	weapon = params.weapon;
	eattacker = params.eattacker;
	einflictor = params.einflictor;
	if(weapon.name == #"land_mine" && eattacker util::isenemyplayer(self) && self isinvehicle())
	{
		if(!isdefined(einflictor.var_3c0a7eef))
		{
			einflictor.var_3c0a7eef = [];
		}
		var_71f7928d = spawnstruct();
		var_71f7928d.player = self;
		var_71f7928d.vehicle = self getvehicleoccupied();
		var_71f7928d.var_33c9fbd5 = gettime();
		if(!isdefined(einflictor.var_3c0a7eef))
		{
			einflictor.var_3c0a7eef = [];
		}
		else if(!isarray(einflictor.var_3c0a7eef))
		{
			einflictor.var_3c0a7eef = array(einflictor.var_3c0a7eef);
		}
		einflictor.var_3c0a7eef[einflictor.var_3c0a7eef.size] = var_71f7928d;
	}
}

/*
	Name: function_7bc9fe48
	Namespace: land_mine
	Checksum: 0xEBD88FD9
	Offset: 0x3568
	Size: 0x54
	Parameters: 5
	Flags: Linked
*/
function function_7bc9fe48(eattacker, einflictor, weapon, smeansofdeath, damage)
{
	self shellshock(#"hash_160e95f6745dddf3", 0.5);
}

/*
	Name: onvehiclekilled
	Namespace: land_mine
	Checksum: 0xC5FB8D4D
	Offset: 0x35C8
	Size: 0x1D4
	Parameters: 9
	Flags: Linked
*/
function onvehiclekilled(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, occupants)
{
	if(isdefined(occupants.size) && occupants.size > 0)
	{
		foreach(occupant in occupants)
		{
			if(psoffsettime util::isenemyplayer(occupant))
			{
				shitloc function_af9b1762(psoffsettime);
				break;
			}
		}
	}
	else if(isdefined(shitloc.var_3c0a7eef))
	{
		foreach(var_71f7928d in shitloc.var_3c0a7eef)
		{
			if(self == var_71f7928d.vehicle && var_71f7928d.var_33c9fbd5 == gettime())
			{
				shitloc function_af9b1762(psoffsettime);
				break;
			}
		}
	}
}

/*
	Name: function_af9b1762
	Namespace: land_mine
	Checksum: 0xC32B9322
	Offset: 0x37A8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_af9b1762(eattacker)
{
	scoreevents = globallogic_score::function_3cbc4c6c(self.weapon.var_2e4a8800);
	if(isdefined(scoreevents.var_f8792376))
	{
		scoreevents::processscoreevent(scoreevents.var_f8792376, eattacker, undefined, self.weapon, undefined);
	}
}

/*
	Name: function_bb195195
	Namespace: land_mine
	Checksum: 0x2DC898B8
	Offset: 0x3820
	Size: 0xA4
	Parameters: 2
	Flags: None
*/
function function_bb195195(var_c208f27f, var_d71889f)
{
	/#
		if(!isdefined(var_d71889f))
		{
			var_d71889f = 2;
		}
		if(getdvarint(#"hash_3c54e6d747dd7a6d", 0) >= var_d71889f)
		{
			var_a58f4914 = self getentitynumber();
			println((("" + var_a58f4914) + "") + var_c208f27f);
		}
	#/
}

/*
	Name: function_47ff3ce7
	Namespace: land_mine
	Checksum: 0x7E0A1E89
	Offset: 0x38D0
	Size: 0x23E
	Parameters: 0
	Flags: None
*/
function function_47ff3ce7()
{
	/#
		self endon(#"death");
		if(getdvarint(#"hash_3c54e6d747dd7a6d", 0) >= 1)
		{
			while(true)
			{
				var_54d68ee6 = function_80b82a4d();
				dev::debug_sphere(var_54d68ee6, (isdefined(level.var_261f640c.var_a74161cc.var_29467698) ? level.var_261f640c.var_a74161cc.var_29467698 : 25), (1, 0.85, 0), 0.25, 1);
				dev::debug_sphere(var_54d68ee6, (isdefined(level.var_261f640c.var_a74161cc.var_40e96f5e) ? level.var_261f640c.var_a74161cc.var_40e96f5e : 180), (0, 1, 0), 0.25, 1);
				if(isdefined(self.weapon.explosioninnerradius))
				{
					dev::debug_sphere(var_54d68ee6, self.weapon.explosioninnerradius, (0, 0, 1), 0.25, 1);
				}
				if(isdefined(self.weapon.explosionradius))
				{
					dev::debug_sphere(var_54d68ee6, self.weapon.explosionradius, (1, 0, 0), 0.25, 1);
				}
				if(isdefined(level.var_261f640c.var_a74161cc.var_b922e118))
				{
					dev::debug_sphere(var_54d68ee6, level.var_261f640c.var_a74161cc.var_b922e118, (1, 0, 1), 0.25, 1);
				}
				waitframe(1);
			}
		}
	#/
}

/*
	Name: function_bdff0e71
	Namespace: land_mine
	Checksum: 0x75A63366
	Offset: 0x3B18
	Size: 0xC4
	Parameters: 4
	Flags: None
*/
function function_bdff0e71(var_a883d625, var_d1e53dda, var_36ef4af8, var_d9c1b66c)
{
	/#
		if(getdvarint(#"hash_3c54e6d747dd7a6d", 0) >= 1)
		{
			cylinder(self.origin, self.origin + (var_a883d625 * var_d1e53dda), var_36ef4af8, (0, 0, 1), 0, 200);
			cylinder(self.origin, self.origin + (var_a883d625 * var_d1e53dda), var_d9c1b66c, (1, 0, 0), 0, 200);
		}
	#/
}

/*
	Name: function_f8d33ba4
	Namespace: land_mine
	Checksum: 0x7EA4E895
	Offset: 0x3BE8
	Size: 0x84
	Parameters: 4
	Flags: None
*/
function function_f8d33ba4(pos, mins, maxs, angles)
{
	/#
		if(getdvarint(#"hash_3c54e6d747dd7a6d", 0) >= 1)
		{
			box(pos, mins, maxs, angles, (0, 1, 1), 1, 0, 25);
		}
	#/
}

/*
	Name: drawdebugline
	Namespace: land_mine
	Checksum: 0x742996F9
	Offset: 0x3C78
	Size: 0x6C
	Parameters: 2
	Flags: None
*/
function drawdebugline(start, end)
{
	/#
		if(getdvarint(#"hash_3c54e6d747dd7a6d", 0) >= 1)
		{
			line(start, end, (0, 1, 1), undefined, undefined, 200);
		}
	#/
}

