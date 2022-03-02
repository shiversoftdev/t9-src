#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_4d85e8de54b02198;
#using script_caf007e2a98afa2;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace zipline;

/*
	Name: function_89f2df9
	Namespace: zipline
	Checksum: 0x5554DC07
	Offset: 0x200
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zipline", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zipline
	Checksum: 0xB32F1544
	Offset: 0x248
	Size: 0x44
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"human", &function_c4306be2);
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: zipline
	Checksum: 0x763C9788
	Offset: 0x298
	Size: 0x6A4
	Parameters: 0
	Flags: Private
*/
function private registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_e128a831));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4a9c28a0a5de2181", &function_e128a831);
	/#
		assert(!isdefined(&function_8de15fec) || isscriptfunctionptr(&function_8de15fec));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_49592f95dd588bd6", &function_8de15fec, undefined, undefined);
	/#
		assert(isscriptfunctionptr(&function_dedfe444));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7a881cd7648d875a", &function_dedfe444);
	/#
		assert(!isdefined(&function_54e23559) || isscriptfunctionptr(&function_54e23559));
	#/
	/#
		assert(!isdefined(&function_f5e4c85b) || isscriptfunctionptr(&function_f5e4c85b));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_7ce06449bd45e2fb", &function_54e23559, &function_f5e4c85b, undefined);
	/#
		assert(!isdefined(&function_8956c060) || isscriptfunctionptr(&function_8956c060));
	#/
	/#
		assert(!isdefined(&function_c7c70177) || isscriptfunctionptr(&function_c7c70177));
	#/
	/#
		assert(!isdefined(&function_11b30321) || isscriptfunctionptr(&function_11b30321));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_4bf47859e6047df4", &function_8956c060, &function_c7c70177, &function_11b30321);
	/#
		assert(!isdefined(&function_dd8aadf1) || isscriptfunctionptr(&function_dd8aadf1));
	#/
	/#
		assert(!isdefined(&function_28c69db4) || isscriptfunctionptr(&function_28c69db4));
	#/
	/#
		assert(!isdefined(&function_97a75ffc) || isscriptfunctionptr(&function_97a75ffc));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_267af6f7a7ece24f", &function_dd8aadf1, &function_28c69db4, &function_97a75ffc);
	/#
		assert(!isdefined(&function_574f0280) || isscriptfunctionptr(&function_574f0280));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_c0a3f837) || isscriptfunctionptr(&function_c0a3f837));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_666c4b85dd04d173", &function_574f0280, undefined, &function_c0a3f837);
	animationstatenetwork::registernotetrackhandlerfunction("zipline_attach_adjust_begin", &function_daabc8cc);
}

/*
	Name: function_c4306be2
	Namespace: zipline
	Checksum: 0xB1AE963F
	Offset: 0x948
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_c4306be2()
{
	aiutility::addaioverridekilledcallback(self, &function_d271a025);
}

/*
	Name: function_d271a025
	Namespace: zipline
	Checksum: 0x812267E
	Offset: 0x978
	Size: 0x2A4
	Parameters: 8
	Flags: Private
*/
function private function_d271a025(inflictor, attacker, damage, meansofdeath, weapon, vdir, hitloc, offsettime)
{
	if(function_e128a831(self) && isdefined(offsettime) && offsettime != (0, 0, 0))
	{
		if(is_true(self.is_ziplining))
		{
			if(isdefined(self.var_b30ec151) && lengthsquared(self.var_b30ec151) > sqr(150))
			{
				var_d07dd667 = "ZIPLINE_DEATH_BACK";
				if(isdefined(self.var_662e279c))
				{
					var_b5785e55 = vectornormalize(anglestoforward(self.angles) * (1, 1, 0));
					var_f5509951 = offsettime * (1, 1, 0);
					var_b7cd5898 = vectordot(var_f5509951, var_b5785e55);
					if(var_b7cd5898 < 0)
					{
						var_d07dd667 = "ZIPLINE_DEATH_FORWARD";
					}
				}
				self setblackboardattribute("_zipline_state", var_d07dd667);
			}
			if(isdefined(level.var_ebc8a996))
			{
				self [[level.var_ebc8a996]]();
			}
		}
	}
	if(isdefined(self.var_a4d91a0d))
	{
		if(self islinkedto(self.var_a4d91a0d))
		{
			self unlink();
		}
		self.var_a4d91a0d delete();
	}
	if(isdefined(self.var_b20b0960))
	{
		if(self islinkedto(self.var_b20b0960))
		{
			self unlink();
		}
		self.var_b20b0960 delete();
	}
	if(isdefined(self.var_c6b02ec0))
	{
		self.var_c6b02ec0 delete();
	}
}

/*
	Name: function_e128a831
	Namespace: zipline
	Checksum: 0x9B8B94CD
	Offset: 0xC28
	Size: 0x44
	Parameters: 1
	Flags: Private
*/
function private function_e128a831(entity)
{
	return is_true(entity.is_ziplining) || is_true(entity.var_39601f96);
}

/*
	Name: function_8de15fec
	Namespace: zipline
	Checksum: 0x4B43E2D4
	Offset: 0xC78
	Size: 0x30
	Parameters: 2
	Flags: Private
*/
function private function_8de15fec(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	return 5;
}

/*
	Name: function_dedfe444
	Namespace: zipline
	Checksum: 0x5CE4944E
	Offset: 0xCB0
	Size: 0x90
	Parameters: 1
	Flags: Private
*/
function private function_dedfe444(entity)
{
	if(isdefined(entity.traversestartnode) && isdefined(entity.traversestartnode.script_noteworthy) && entity.traversestartnode.script_noteworthy == "zipline_traversal" && isdefined(entity.traversestartnode.var_9a26509a) && entity shouldstarttraversal())
	{
		return true;
	}
	return false;
}

/*
	Name: function_536ff6cf
	Namespace: zipline
	Checksum: 0x40C9F9B6
	Offset: 0xD48
	Size: 0x52
	Parameters: 0
	Flags: Private
*/
function private function_536ff6cf()
{
	self endon(#"death");
	self.var_a4d91a0d = util::spawn_model(#"tag_origin", self.origin, self.angles);
}

/*
	Name: function_11a51c07
	Namespace: zipline
	Checksum: 0x521FA237
	Offset: 0xDA8
	Size: 0x36
	Parameters: 0
	Flags: Private
*/
function private function_11a51c07()
{
	self endon(#"death");
	self waittill(#"movedone");
	self.var_4901b7db = 1;
}

/*
	Name: function_54e23559
	Namespace: zipline
	Checksum: 0x860C4928
	Offset: 0xDE8
	Size: 0x98
	Parameters: 2
	Flags: Private
*/
function private function_54e23559(entity, asmstatename)
{
	entity.allowpain = 0;
	entity.blockingpain = 1;
	if(!isdefined(entity.var_660aa59f))
	{
		entity setblackboardattribute("_zipline_state", "ZIPLINE_ATTACH");
		animationstatenetworkutility::requeststate(entity, asmstatename);
		entity.var_a4d91a0d = undefined;
		entity thread function_536ff6cf();
	}
	return 5;
}

/*
	Name: function_6d7d599e
	Namespace: zipline
	Checksum: 0x114CCC75
	Offset: 0xE88
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_6d7d599e()
{
	var_4fa6735c = function_4fa6735c();
	var_2e0bd94f = rotatepoint(vectorscale((0, 0, -1), 72), var_4fa6735c);
	return self.zipline_start.origin + var_2e0bd94f;
}

/*
	Name: function_4fa6735c
	Namespace: zipline
	Checksum: 0x3B8A0F81
	Offset: 0xEF8
	Size: 0x72
	Parameters: 0
	Flags: Private
*/
function private function_4fa6735c()
{
	var_9f9bac58 = getvehiclenode(self.zipline_start.target, "targetname");
	var_8bb667c1 = var_9f9bac58.origin - self.zipline_start.origin;
	return vectortoangles(var_8bb667c1);
}

/*
	Name: function_daabc8cc
	Namespace: zipline
	Checksum: 0xE7D307AE
	Offset: 0xF78
	Size: 0x2BC
	Parameters: 1
	Flags: Private
*/
function private function_daabc8cc(entity)
{
	if(isdefined(entity.var_a4d91a0d))
	{
		var_2ef73c01 = animationstatenetworkutility::searchanimationmap(entity, "anim_zipline_attach");
		var_a02589c1 = getanimlength(var_2ef73c01);
		var_e03d49ae = getnotetracktimes(var_2ef73c01, "zipline_attach_adjust_begin");
		var_aae5bcce = getnotetracktimes(var_2ef73c01, "zipline_attach_adjust_end");
		if(var_e03d49ae.size > 0 && var_aae5bcce.size > 0)
		{
			var_bcb2d560 = var_a02589c1 * var_e03d49ae[0];
			var_2b699b1b = var_a02589c1 * var_aae5bcce[0];
			move_time = var_2b699b1b - var_bcb2d560;
			var_6d7d599e = entity function_6d7d599e();
			var_4fa6735c = entity function_4fa6735c();
			/#
				record3dtext("", var_6d7d599e, (0, 1, 0));
				recordsphere(var_6d7d599e, 5, (0, 1, 0));
				recordline(var_6d7d599e, var_6d7d599e + (anglestoforward(entity.zipline_start.angles) * 30), (0, 1, 0));
				recordsphere(entity.var_a4d91a0d.origin, 5, (1, 0, 0));
				recordline(entity.origin, entity.var_a4d91a0d.origin, (1, 0, 0));
				recordline(entity.var_a4d91a0d.origin, var_6d7d599e, (1, 1, 0));
			#/
			entity.var_a4d91a0d moveto(var_6d7d599e, move_time);
			entity.var_a4d91a0d rotateto(var_4fa6735c, move_time);
			entity.var_a4d91a0d thread function_11a51c07();
		}
	}
}

/*
	Name: function_f5e4c85b
	Namespace: zipline
	Checksum: 0xE284F5A2
	Offset: 0x1240
	Size: 0x234
	Parameters: 2
	Flags: Private
*/
function private function_f5e4c85b(entity, asmstatename)
{
	result = 5;
	asmstatename notify(#"hash_4c1bc0b351b4a76f");
	if(isdefined(asmstatename.var_660aa59f))
	{
		asmstatename.zipline_start = getvehiclenode(asmstatename.traversestartnode.var_9a26509a, "targetname");
		asmstatename.var_4be77411 = asmstatename.zipline_start.var_cf56bb8f.var_afbab71e;
		result = 4;
	}
	else if(isdefined(asmstatename.var_a4d91a0d) && !is_true(asmstatename.var_a4d91a0d.var_14e53eac))
	{
		asmstatename.zipline_start = getvehiclenode(asmstatename.traversestartnode.var_9a26509a, "targetname");
		var_cf56bb8f = asmstatename.zipline_start.var_cf56bb8f;
		if(is_true(var_cf56bb8f.var_1b1aded2) && isdefined(var_cf56bb8f.var_d9c9a508) && var_cf56bb8f.var_d9c9a508.size > 2)
		{
			var_cf56bb8f function_63d01c33();
		}
		asmstatename.var_a4d91a0d.origin = self.origin;
		/#
			record3dtext("", self.origin, (1, 0.5, 0), "");
		#/
		asmstatename linkto(asmstatename.var_a4d91a0d);
		asmstatename.var_a4d91a0d.var_14e53eac = 1;
	}
	if(asmstatename asmgetstatus() == "asm_status_complete")
	{
		result = 4;
	}
	return result;
}

/*
	Name: function_3564615d
	Namespace: zipline
	Checksum: 0x57A77797
	Offset: 0x1480
	Size: 0x6E
	Parameters: 1
	Flags: Private
*/
function private function_3564615d(zipline_start)
{
	var_7c4f1420 = getvehiclenode(zipline_start.target, "targetname");
	while(isdefined(var_7c4f1420.target))
	{
		var_7c4f1420 = getvehiclenode(var_7c4f1420.target, "targetname");
	}
	return var_7c4f1420;
}

/*
	Name: function_85ce22b4
	Namespace: zipline
	Checksum: 0x38987427
	Offset: 0x14F8
	Size: 0x21C
	Parameters: 0
	Flags: Private
*/
function private function_85ce22b4()
{
	self endon(#"death");
	self.var_b20b0960 = spawner::simple_spawn_single(getent("veh_zipline", "targetname"));
	self.var_b20b0960.origin = self.zipline_start.origin;
	var_9f9bac58 = function_3564615d(self.zipline_start);
	var_8bb667c1 = var_9f9bac58.origin - self.zipline_start.origin;
	self.var_b20b0960.angles = vectortoangles(var_8bb667c1);
	if(isdefined(self.var_e8f98e9d))
	{
		var_a7a79831 = length(var_8bb667c1);
		var_b00e3ead = vectornormalize(var_8bb667c1);
		self.var_b20b0960.var_da287758 = self.zipline_start.origin + ((var_b00e3ead * var_a7a79831) * self.var_e8f98e9d);
		self.var_e8f98e9d = undefined;
	}
	/#
		record3dtext("", self.var_b20b0960.origin, (1, 0, 0));
		recordsphere(self.var_b20b0960.origin, 5, (1, 0, 0));
		recordline(self.var_b20b0960.origin, self.var_b20b0960.origin + (anglestoforward(self.var_b20b0960.angles) * 100), (1, 0, 0));
	#/
}

/*
	Name: function_8956c060
	Namespace: zipline
	Checksum: 0x97B01DE3
	Offset: 0x1720
	Size: 0xB0
	Parameters: 2
	Flags: Private
*/
function private function_8956c060(entity, asmstatename)
{
	entity setblackboardattribute("_zipline_state", "ZIPLINE_IDLE");
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity.is_ziplining = 1;
	entity.var_c681e4c1 = 1;
	entity notify(#"hash_65134449cd95c3cb");
	entity.var_b30ec151 = (0, 0, 0);
	entity.var_b20b0960 = undefined;
	entity thread function_85ce22b4();
	return 5;
}

/*
	Name: function_55f3b1df
	Namespace: zipline
	Checksum: 0xCFCA8726
	Offset: 0x17D8
	Size: 0xC4
	Parameters: 3
	Flags: Private
*/
function private function_55f3b1df(zipline_vehicle, zipline_start, normalized_distance)
{
	if(normalized_distance < 0)
	{
		normalized_distance = 0;
	}
	else if(normalized_distance > 1)
	{
		normalized_distance = 1;
	}
	var_4be77411 = zipline_start.var_cf56bb8f.var_afbab71e;
	var_a7a79831 = length(var_4be77411.origin - zipline_start.origin);
	distance = var_a7a79831 * normalized_distance;
	zipline_vehicle function_ded6dd2e(zipline_start, distance);
}

/*
	Name: function_c7c70177
	Namespace: zipline
	Checksum: 0x9B06E7B6
	Offset: 0x18A8
	Size: 0x292
	Parameters: 2
	Flags: Private
*/
function private function_c7c70177(entity, asmstatename)
{
	result = 5;
	if(isdefined(asmstatename.var_b20b0960))
	{
		if(!is_true(asmstatename.var_b20b0960.var_2cb0aa8e))
		{
			asmstatename function_aeb6539c();
			var_3229ed5d = 6.5;
			if(isdefined(asmstatename.zipline_start.var_cf56bb8f))
			{
				var_cf56bb8f = asmstatename.zipline_start.var_cf56bb8f;
				var_3229ed5d = var_cf56bb8f.var_aff2bad6 * var_cf56bb8f.var_dc6e66ea;
			}
			var_3c5c113f = (asmstatename.team == #"allies" ? 35 : 25);
			if(var_3229ed5d < 1)
			{
				var_3229ed5d = 1;
			}
			else if(var_3229ed5d > var_3c5c113f)
			{
				var_3229ed5d = var_3c5c113f;
			}
			asmstatename.var_b20b0960 setspeed(1);
			asmstatename thread function_25f7c630();
			asmstatename.var_b20b0960 thread vehicle::get_on_and_go_path(asmstatename.zipline_start);
			if(isdefined(level.var_7428aa92))
			{
				asmstatename [[level.var_7428aa92]]();
			}
			asmstatename.var_b20b0960.var_2cb0aa8e = 1;
			if(isdefined(asmstatename.var_660aa59f))
			{
				function_55f3b1df(asmstatename.var_b20b0960, asmstatename.zipline_start, asmstatename.var_660aa59f);
				asmstatename.var_660aa59f = undefined;
			}
			if(isdefined(asmstatename.var_b20b0960.var_da287758))
			{
				asmstatename thread function_9dac9d34();
			}
			asmstatename thread function_56e443d9();
			asmstatename.var_b20b0960 setspeed(var_3c5c113f, var_3229ed5d);
		}
		else if(is_true(asmstatename.var_b20b0960.reached_dynamic_path_end))
		{
			result = 4;
		}
	}
	return result;
}

/*
	Name: function_aeb6539c
	Namespace: zipline
	Checksum: 0xE160F197
	Offset: 0x1B48
	Size: 0x8C
	Parameters: 0
	Flags: Private
*/
function private function_aeb6539c()
{
	self endon(#"disconnect");
	if(isdefined(self.var_a4d91a0d))
	{
		self.var_a4d91a0d delete();
	}
	self.var_f22c83f5 = 1;
	self.var_e75517b1 = 1;
	self linkto(self.var_b20b0960, "tag_origin", (0, 0, 72 * -1));
}

/*
	Name: function_25f7c630
	Namespace: zipline
	Checksum: 0x5AC63A41
	Offset: 0x1BE0
	Size: 0xAE
	Parameters: 0
	Flags: Private
*/
function private function_25f7c630()
{
	self.var_b20b0960 endon(#"death", #"reached_end_node", #"zipline_start_disconnect");
	while(true)
	{
		waitframe(1);
		velocity = self.var_b20b0960 getvelocity();
		if(lengthsquared(velocity) > lengthsquared(self.var_b30ec151))
		{
			self.var_b30ec151 = velocity;
		}
	}
}

/*
	Name: function_9dac9d34
	Namespace: zipline
	Checksum: 0x3BD75DCD
	Offset: 0x1C98
	Size: 0x11C
	Parameters: 0
	Flags: Private
*/
function private function_9dac9d34()
{
	self.var_b20b0960 endon(#"death");
	var_9f9bac58 = getvehiclenode(self.zipline_start.target, "targetname");
	var_8bb667c1 = var_9f9bac58.origin - self.zipline_start.origin;
	var_b00e3ead = vectornormalize(var_8bb667c1);
	while(true)
	{
		waitframe(1);
		_attack_barrier_sprint = self.var_b20b0960.var_da287758 - self.var_b20b0960.origin;
		var_55ee4999 = vectordot(var_b00e3ead, _attack_barrier_sprint);
		if(var_55ee4999 <= 0)
		{
			break;
		}
	}
	function_c4cfe0f5();
}

/*
	Name: function_56e443d9
	Namespace: zipline
	Checksum: 0x3FBC19F5
	Offset: 0x1DC0
	Size: 0xAC
	Parameters: 0
	Flags: Private
*/
function private function_56e443d9()
{
	self.var_b20b0960 endon(#"death");
	var_adea2587 = undefined;
	var_adea2587 = self.var_b20b0960 waittill(#"reached_end_node", #"zipline_start_disconnect");
	if(var_adea2587._notify === "zipline_start_disconnect")
	{
		var_adea2587 = undefined;
		var_adea2587 = self.var_b20b0960 waittilltimeout(0.35, #"reached_end_node");
	}
	function_c4cfe0f5();
}

/*
	Name: function_c4cfe0f5
	Namespace: zipline
	Checksum: 0xF8D0A5A3
	Offset: 0x1E78
	Size: 0x38
	Parameters: 0
	Flags: Private
*/
function private function_c4cfe0f5()
{
	self.var_b20b0960.reached_dynamic_path_end = 1;
	if(isdefined(level.var_42da2b06))
	{
		self [[level.var_42da2b06]]();
	}
}

/*
	Name: function_11b30321
	Namespace: zipline
	Checksum: 0x645BB867
	Offset: 0x1EB8
	Size: 0x80
	Parameters: 2
	Flags: Private
*/
function private function_11b30321(entity, asmstatename)
{
	asmstatename unlink();
	asmstatename.var_c681e4c1 = 0;
	asmstatename.is_ziplining = 0;
	asmstatename notify(#"hash_4c7ded9d08b15793");
	if(isdefined(self.var_b20b0960))
	{
		asmstatename.var_b20b0960 delete();
	}
	return 4;
}

/*
	Name: function_dd8aadf1
	Namespace: zipline
	Checksum: 0x62D6CE94
	Offset: 0x1F40
	Size: 0x96
	Parameters: 2
	Flags: Private
*/
function private function_dd8aadf1(entity, asmstatename)
{
	entity setblackboardattribute("_zipline_state", "ZIPLINE_FALL");
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity.var_39601f96 = 1;
	var_50588787 = (entity.var_b30ec151 * (1, 1, 0)) * 0.4;
	entity.var_b30ec151 = var_50588787;
	return 5;
}

/*
	Name: function_28c69db4
	Namespace: zipline
	Checksum: 0xFACED1FB
	Offset: 0x1FE0
	Size: 0x240
	Parameters: 2
	Flags: Private
*/
function private function_28c69db4(entity, asmstatename)
{
	result = 5;
	if(asmstatename isonground())
	{
		if(isdefined(level.var_4b3860d7))
		{
			asmstatename [[level.var_4b3860d7]]();
		}
		result = 4;
	}
	else
	{
		gravity = vectorscale((0, 0, -1), 980);
		forward = anglestoforward(asmstatename.angles);
		velocity = asmstatename.var_b30ec151 + (gravity * (float(function_60d95f53()) / 1000));
		position = (asmstatename.origin + (asmstatename.var_b30ec151 * (float(function_60d95f53()) / 1000))) + (0.5 * gravity) * (sqr(float(function_60d95f53()) / 1000));
		asmstatename.var_b30ec151 = velocity;
		a_trace = bullettrace(asmstatename.origin, position, 0, asmstatename, 0, 1);
		if(a_trace[#"fraction"] < 1)
		{
			asmstatename forceteleport(a_trace[#"position"], asmstatename.angles, 0, 0);
		}
		else
		{
			asmstatename forceteleport(position, asmstatename.angles, 0, 0);
		}
	}
	return result;
}

/*
	Name: function_97a75ffc
	Namespace: zipline
	Checksum: 0x440AA27
	Offset: 0x2228
	Size: 0x22
	Parameters: 2
	Flags: Private
*/
function private function_97a75ffc(entity, asmstatename)
{
	asmstatename.var_39601f96 = 0;
	return 4;
}

/*
	Name: function_63d01c33
	Namespace: zipline
	Checksum: 0xA211966C
	Offset: 0x2258
	Size: 0x1FC
	Parameters: 0
	Flags: None
*/
function function_63d01c33()
{
	var_de68568b = 1;
	var_4794d60e = 0;
	var_398bbe57 = -1;
	var_eb102f19 = -1;
	if(math::cointoss(50))
	{
		var_eb102f19 = 1;
	}
	var_dd2b8b96 = randomfloatrange(0, 1);
	n_pitch = 3.5 - var_dd2b8b96;
	n_roll = 3.5 - var_dd2b8b96;
	foreach(var_9681c147 in self.var_d9c9a508)
	{
		if(var_de68568b)
		{
			var_de68568b = 0;
			continue;
		}
		var_9681c147.angles = (var_398bbe57 * n_pitch, var_9681c147.angles[1], var_eb102f19 * n_roll);
		if(n_pitch > 1)
		{
			n_pitch = n_pitch - 0.5;
		}
		if(n_roll > 1)
		{
			n_roll = n_roll - 0.5;
		}
		var_eb102f19 = var_eb102f19 * -1;
		if(!var_4794d60e)
		{
			if(math::cointoss(50))
			{
				var_398bbe57 = var_398bbe57 * -1;
			}
			else
			{
				var_4794d60e = 1;
			}
			continue;
		}
		var_398bbe57 = var_398bbe57 * -1;
		var_4794d60e = 0;
	}
}

/*
	Name: function_574f0280
	Namespace: zipline
	Checksum: 0x30A6235E
	Offset: 0x2460
	Size: 0x58
	Parameters: 2
	Flags: Private
*/
function private function_574f0280(entity, asmstatename)
{
	entity setblackboardattribute("_zipline_state", "ZIPLINE_LAND");
	animationstatenetworkutility::requeststate(entity, asmstatename);
	return 5;
}

/*
	Name: function_c0a3f837
	Namespace: zipline
	Checksum: 0x497E6F6D
	Offset: 0x24C0
	Size: 0x32
	Parameters: 2
	Flags: Private
*/
function private function_c0a3f837(entity, asmstatename)
{
	asmstatename.allowpain = 1;
	asmstatename.blockingpain = 0;
	return 4;
}

/*
	Name: function_61418721
	Namespace: zipline
	Checksum: 0xC7EDA542
	Offset: 0x2500
	Size: 0x92
	Parameters: 3
	Flags: None
*/
function function_61418721(point, line_start, line_end)
{
	var_13d62e0a = point - line_start;
	var_1ad356b8 = vectornormalize(line_end - line_start);
	var_f6451fc1 = vectordot(var_13d62e0a, var_1ad356b8);
	closest_point = line_start + (var_1ad356b8 * var_f6451fc1);
	return closest_point;
}

/*
	Name: number_b_
	Namespace: zipline
	Checksum: 0xCFB9152D
	Offset: 0x25A0
	Size: 0xD8
	Parameters: 4
	Flags: None
*/
function number_b_(var_5c57c958, var_f3e138f3, var_3800dad7, plane_normal)
{
	var_a979e3a2 = vectordot(plane_normal, var_f3e138f3);
	result = undefined;
	if(abs(var_a979e3a2) > 0.001)
	{
		var_fa608360 = var_3800dad7 - var_5c57c958;
		var_bc4566f4 = vectordot(var_fa608360, plane_normal);
		var_c7ca84dc = var_bc4566f4 / var_a979e3a2;
		if(var_c7ca84dc >= 0)
		{
			result = var_c7ca84dc;
		}
	}
	return result;
}

/*
	Name: function_a8c07396
	Namespace: zipline
	Checksum: 0x48A0FC9E
	Offset: 0x2680
	Size: 0x110
	Parameters: 3
	Flags: None
*/
function function_a8c07396(zipline_start, var_4be77411, var_8f2ded8e)
{
	self endon(#"death");
	while(true)
	{
		waitframe(1);
		/#
			sphere(zipline_start, 2, (0, 1, 0), 0.3, 0, 8, 1);
			line(zipline_start, var_4be77411, (1, 1, 0));
			sphere(var_4be77411, 2, (0, 1, 0), 0.3, 0, 8, 1);
			line(var_8f2ded8e, zipline_start, (1, 1, 0));
			sphere(var_8f2ded8e, 2, (1, 0.5, 0), 0.3, 0, 8, 1);
		#/
	}
}

/*
	Name: function_5ddff7e3
	Namespace: zipline
	Checksum: 0x38A48BF1
	Offset: 0x2798
	Size: 0xF8
	Parameters: 0
	Flags: None
*/
function function_5ddff7e3()
{
	self endon(#"death");
	self.var_b20b0960 endon(#"death");
	while(true)
	{
		waitframe(1);
		enabled = getdvarint(#"hash_6e0cbdce6b2104a3", 0);
		if(enabled)
		{
			/#
				sphere(self.var_b20b0960.origin, 2, (0, 1, 0), 0.3, 0, 8, 1);
				line(self.var_b20b0960.origin, self.var_b20b0960.origin + vectorscale((0, 0, 1), 72), (1, 1, 0));
			#/
		}
	}
}

