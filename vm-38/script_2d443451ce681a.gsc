#using script_4ab78e327b76395f;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\colors_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\load.gsc;
#using scripts\cp_common\util.gsc;

#namespace utility;

/*
	Name: function_9ef963b1
	Namespace: utility
	Checksum: 0xBE5E610B
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9ef963b1()
{
	level notify(1161021694);
}

#namespace ai;

/*
	Name: function_18c4ff86
	Namespace: ai
	Checksum: 0x9AC21FDE
	Offset: 0x170
	Size: 0x8A
	Parameters: 2
	Flags: None
*/
function function_18c4ff86(var_86318e49, str_species)
{
	if(!isdefined(var_86318e49))
	{
		str_team = "all";
	}
	if(!isdefined(str_species))
	{
		str_species = "all";
	}
	ateam = getaispeciesarray(var_86318e49, str_species);
	aguystouchingvolume = self function_10919848(ateam);
	return aguystouchingvolume;
}

/*
	Name: function_41bdfd53
	Namespace: ai
	Checksum: 0xC131146D
	Offset: 0x208
	Size: 0x7A
	Parameters: 1
	Flags: None
*/
function function_41bdfd53(str_group_name)
{
	if(!isdefined(str_group_name))
	{
		/#
			assertmsg("");
		#/
	}
	agroup = spawner::get_ai_group_ai(str_group_name);
	aguystouchingvolume = self function_10919848(agroup);
	return aguystouchingvolume;
}

/*
	Name: function_ac1dee40
	Namespace: ai
	Checksum: 0xEF3AB841
	Offset: 0x290
	Size: 0x7A
	Parameters: 1
	Flags: None
*/
function function_ac1dee40(var_cd0c8024)
{
	if(isdefined(var_cd0c8024))
	{
		var_8564fb5f = getaiarray(var_cd0c8024, "targetname");
	}
	else
	{
		var_8564fb5f = getaiarray();
	}
	aguystouchingvolume = self function_10919848(var_8564fb5f);
	return aguystouchingvolume;
}

/*
	Name: function_10919848
	Namespace: ai
	Checksum: 0x30CA7641
	Offset: 0x318
	Size: 0x112
	Parameters: 1
	Flags: Linked, Private
*/
function private function_10919848(array)
{
	aguystouchingvolume = array();
	foreach(guy in array)
	{
		if(guy istouching(self) && isalive(guy))
		{
			if(!isdefined(aguystouchingvolume))
			{
				aguystouchingvolume = [];
			}
			else if(!isarray(aguystouchingvolume))
			{
				aguystouchingvolume = array(aguystouchingvolume);
			}
			aguystouchingvolume[aguystouchingvolume.size] = guy;
		}
	}
	return aguystouchingvolume;
}

/*
	Name: function_a45f8c64
	Namespace: ai
	Checksum: 0xD33B59AD
	Offset: 0x438
	Size: 0x14C
	Parameters: 7
	Flags: None
*/
function function_a45f8c64(var_86318e49, str_species, var_69747751, var_7b2eb76f, var_89c6f2db, n_timeout, var_371cea52)
{
	if(!isdefined(var_86318e49))
	{
		var_86318e49 = "all";
	}
	if(!isdefined(str_species))
	{
		str_species = "all";
	}
	if(!isdefined(var_69747751))
	{
		/#
			assertmsg("");
		#/
	}
	var_8564fb5f = getaispeciesarray(var_86318e49, str_species);
	level thread function_d72eb8b7(var_8564fb5f, var_89c6f2db, n_timeout);
	level thread function_a57f6629(var_371cea52);
	if(isdefined(var_89c6f2db) || isdefined(var_371cea52))
	{
		level waittill(array("aGuys_kill_count", "aGuys_flag_hit"));
	}
	function_1eaaceab(var_8564fb5f);
	level thread function_8e158d78(var_8564fb5f, var_69747751, var_7b2eb76f);
}

/*
	Name: function_bb79f1ad
	Namespace: ai
	Checksum: 0x5CD7717A
	Offset: 0x590
	Size: 0x14C
	Parameters: 6
	Flags: None
*/
function function_bb79f1ad(str_group_name, var_69747751, var_7b2eb76f, var_89c6f2db, n_timeout, var_371cea52)
{
	if(!isdefined(str_group_name))
	{
		/#
			assertmsg("");
		#/
	}
	if(!isdefined(var_69747751))
	{
		/#
			assertmsg("");
		#/
	}
	var_8564fb5f = spawner::get_ai_group_ai(str_group_name);
	level thread function_d72eb8b7(var_8564fb5f, var_89c6f2db, n_timeout);
	level thread function_a57f6629(var_371cea52);
	if(isdefined(var_89c6f2db) || isdefined(var_371cea52))
	{
		level waittill(array("aGuys_kill_count", "aGuys_flag_hit"));
	}
	function_1eaaceab(var_8564fb5f);
	level thread function_8e158d78(var_8564fb5f, var_69747751, var_7b2eb76f);
}

/*
	Name: function_eb9f3f65
	Namespace: ai
	Checksum: 0x9D1A3BBD
	Offset: 0x6E8
	Size: 0x1D0
	Parameters: 7
	Flags: None
*/
function function_eb9f3f65(str_group_name, var_69747751, var_7b2eb76f, var_89c6f2db, n_timeout, var_371cea52, var_216aaeec)
{
	if(!isdefined(var_216aaeec))
	{
		var_216aaeec = 2;
	}
	if(!isdefined(str_group_name))
	{
		/#
			assertmsg("");
		#/
	}
	if(!isdefined(var_69747751))
	{
		/#
			assertmsg("");
		#/
	}
	var_8564fb5f = spawner::get_ai_group_ai(str_group_name);
	level thread function_d72eb8b7(var_8564fb5f, var_89c6f2db, n_timeout);
	level thread function_a57f6629(var_371cea52);
	if(isdefined(var_89c6f2db) || isdefined(var_371cea52))
	{
		level waittill(array("aGuys_kill_count", "aGuys_flag_hit"));
	}
	function_1eaaceab(var_8564fb5f);
	foreach(e_ai in var_8564fb5f)
	{
		e_ai thread function_706516d4(var_69747751, var_7b2eb76f, var_216aaeec);
	}
}

/*
	Name: function_706516d4
	Namespace: ai
	Checksum: 0xC382D74A
	Offset: 0x8C0
	Size: 0x8C
	Parameters: 3
	Flags: Linked
*/
function function_706516d4(var_69747751, var_7b2eb76f, var_216aaeec)
{
	if(isdefined(var_216aaeec) && var_216aaeec > 0)
	{
		wait(randomfloatrange(1, var_216aaeec));
	}
	if(isalive(self))
	{
		self set_goal(var_69747751, "targetname", var_7b2eb76f);
	}
}

/*
	Name: function_d49a69a0
	Namespace: ai
	Checksum: 0x18E7AED5
	Offset: 0x958
	Size: 0x14C
	Parameters: 6
	Flags: None
*/
function function_d49a69a0(var_cd0c8024, var_69747751, var_7b2eb76f, var_89c6f2db, n_timeout, var_371cea52)
{
	if(isdefined(var_cd0c8024))
	{
		var_8564fb5f = getaiarray(var_cd0c8024, "targetname");
	}
	else
	{
		var_8564fb5f = getaiarray();
	}
	if(!isdefined(var_69747751))
	{
		/#
			assertmsg("");
		#/
	}
	level thread function_d72eb8b7(var_8564fb5f, var_89c6f2db, n_timeout);
	level thread function_a57f6629(var_371cea52);
	if(isdefined(var_89c6f2db) || isdefined(var_371cea52))
	{
		level waittill(array("aGuys_kill_count", "aGuys_flag_hit"));
	}
	function_1eaaceab(var_8564fb5f);
	level function_8e158d78(var_8564fb5f, var_69747751, var_7b2eb76f);
}

/*
	Name: function_8e158d78
	Namespace: ai
	Checksum: 0x348C9C04
	Offset: 0xAB0
	Size: 0x120
	Parameters: 3
	Flags: Linked, Private
*/
function private function_8e158d78(ai_array, var_69747751, var_7b2eb76f)
{
	if(!isdefined(ai_array))
	{
		/#
			assertmsg("");
		#/
	}
	if(!isdefined(var_69747751))
	{
		/#
			assertmsg("");
		#/
	}
	if(!isdefined(var_7b2eb76f))
	{
		var_7b2eb76f = 1;
	}
	foreach(e_ai in ai_array)
	{
		if(isalive(e_ai))
		{
			e_ai set_goal(var_69747751, "targetname", var_7b2eb76f);
		}
	}
}

/*
	Name: function_f28ee73
	Namespace: ai
	Checksum: 0xD1737A2D
	Offset: 0xBD8
	Size: 0x154
	Parameters: 8
	Flags: None
*/
function function_f28ee73(var_86318e49, str_species, var_69747751, var_7b2eb76f, var_89c6f2db, n_timeout, var_371cea52, b_shoot)
{
	if(!isdefined(var_86318e49))
	{
		var_86318e49 = "all";
	}
	if(!isdefined(str_species))
	{
		str_species = "all";
	}
	if(!isdefined(var_69747751))
	{
		/#
			assertmsg("");
		#/
	}
	var_8564fb5f = getaispeciesarray(var_86318e49, str_species);
	level thread function_d72eb8b7(var_8564fb5f, var_89c6f2db, n_timeout);
	level thread function_a57f6629(var_371cea52);
	if(isdefined(var_89c6f2db) || isdefined(var_371cea52))
	{
		level waittill(array("aGuys_kill_count", "aGuys_flag_hit"));
	}
	function_1eaaceab(var_8564fb5f);
	level thread function_6706a21c(var_8564fb5f, var_69747751, var_7b2eb76f, b_shoot);
}

/*
	Name: function_419b1881
	Namespace: ai
	Checksum: 0x3D22330
	Offset: 0xD38
	Size: 0x154
	Parameters: 7
	Flags: None
*/
function function_419b1881(str_group_name, var_69747751, var_7b2eb76f, var_89c6f2db, n_timeout, var_371cea52, b_shoot)
{
	if(!isdefined(str_group_name))
	{
		/#
			assertmsg("");
		#/
	}
	if(!isdefined(var_69747751))
	{
		/#
			assertmsg("");
		#/
	}
	var_8564fb5f = spawner::get_ai_group_ai(str_group_name);
	level thread function_d72eb8b7(var_8564fb5f, var_89c6f2db, n_timeout);
	level thread function_a57f6629(var_371cea52);
	if(isdefined(var_89c6f2db) || isdefined(var_371cea52))
	{
		level waittill(array("aGuys_kill_count", "aGuys_flag_hit"));
	}
	function_1eaaceab(var_8564fb5f);
	level thread function_6706a21c(var_8564fb5f, var_69747751, var_7b2eb76f, b_shoot);
}

/*
	Name: function_3ff06c1e
	Namespace: ai
	Checksum: 0x9CE1888B
	Offset: 0xE98
	Size: 0x154
	Parameters: 7
	Flags: None
*/
function function_3ff06c1e(var_cd0c8024, var_69747751, var_7b2eb76f, var_89c6f2db, n_timeout, var_371cea52, b_shoot)
{
	if(isdefined(var_cd0c8024))
	{
		var_8564fb5f = getaiarray(var_cd0c8024, "targetname");
	}
	else
	{
		var_8564fb5f = getaiarray();
	}
	if(!isdefined(var_69747751))
	{
		/#
			assertmsg("");
		#/
	}
	level thread function_d72eb8b7(var_8564fb5f, var_89c6f2db, n_timeout);
	level thread function_a57f6629(var_371cea52);
	if(isdefined(var_89c6f2db) || isdefined(var_371cea52))
	{
		level waittill(array("aGuys_kill_count", "aGuys_flag_hit"));
	}
	function_1eaaceab(var_8564fb5f);
	level function_6706a21c(var_8564fb5f, var_69747751, var_7b2eb76f, b_shoot);
}

/*
	Name: function_c3314131
	Namespace: ai
	Checksum: 0xC940B96E
	Offset: 0xFF8
	Size: 0x1B4
	Parameters: 8
	Flags: None
*/
function function_c3314131(var_2795777d, var_82706add, var_69747751, var_7b2eb76f, var_89c6f2db, n_timeout, var_371cea52, b_shoot)
{
	if(!isdefined(var_82706add))
	{
		var_82706add = "targetname";
	}
	e_goal = spawnstruct();
	if(isdefined(var_2795777d))
	{
		var_a2e909e9 = getaiarray(var_2795777d, var_82706add);
	}
	else
	{
		var_a2e909e9 = getaiarray();
	}
	if(!isdefined(var_69747751))
	{
		/#
			assertmsg("");
		#/
	}
	function_1eaaceab(var_a2e909e9);
	e_goal thread function_53f3fb5(var_a2e909e9, var_89c6f2db, n_timeout);
	e_goal thread function_b7bb4bb5(var_371cea52);
	if(isdefined(var_89c6f2db) || isdefined(var_371cea52))
	{
		e_goal waittill(array("aGuys_kill_count", "aGuys_flag_hit"));
	}
	function_1eaaceab(var_a2e909e9);
	level thread function_6706a21c(var_a2e909e9, var_69747751, var_7b2eb76f, b_shoot);
	e_goal struct::delete();
}

/*
	Name: function_6706a21c
	Namespace: ai
	Checksum: 0xD91BBC2A
	Offset: 0x11B8
	Size: 0x128
	Parameters: 4
	Flags: Linked
*/
function function_6706a21c(ai_array, var_69747751, var_7b2eb76f, b_shoot)
{
	if(!isdefined(ai_array))
	{
		/#
			assertmsg("");
		#/
	}
	if(!isdefined(var_69747751))
	{
		/#
			assertmsg("");
		#/
	}
	if(!isdefined(var_7b2eb76f))
	{
		var_7b2eb76f = 1;
	}
	foreach(e_ai in ai_array)
	{
		if(isalive(e_ai))
		{
			e_ai thread function_33d55665(var_69747751, var_7b2eb76f, b_shoot);
		}
	}
}

/*
	Name: function_33d55665
	Namespace: ai
	Checksum: 0xB895A4B5
	Offset: 0x12E8
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function function_33d55665(var_69747751, var_7b2eb76f, b_shoot)
{
	goal = self set_goal(var_69747751, "targetname", var_7b2eb76f);
	self force_goal(goal, b_shoot, undefined, 1, 1);
}

/*
	Name: function_d72eb8b7
	Namespace: ai
	Checksum: 0x22BEFD79
	Offset: 0x1360
	Size: 0x5E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d72eb8b7(var_8564fb5f, var_89c6f2db, n_timeout)
{
	if(isdefined(var_89c6f2db) && var_89c6f2db > 0)
	{
		level waittill_dead(var_8564fb5f, var_89c6f2db, n_timeout);
		self notify(#"aguys_kill_count");
	}
}

/*
	Name: function_a57f6629
	Namespace: ai
	Checksum: 0xE7814E70
	Offset: 0x13C8
	Size: 0x9E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a57f6629(var_371cea52)
{
	if(isdefined(var_371cea52))
	{
		if(isarray(var_371cea52))
		{
			level flag::wait_till_any(var_371cea52);
		}
		else
		{
			if(!level flag::exists(var_371cea52))
			{
				return;
			}
			level flag::wait_till_any(array(var_371cea52));
		}
		self notify(#"aguys_flag_hit");
	}
}

/*
	Name: function_53f3fb5
	Namespace: ai
	Checksum: 0x6EC8D914
	Offset: 0x1470
	Size: 0x76
	Parameters: 3
	Flags: Linked, Private
*/
function private function_53f3fb5(var_8564fb5f, var_89c6f2db, n_timeout)
{
	self endon(#"aguys_flag_hit");
	if(isdefined(var_89c6f2db) && var_89c6f2db > 0)
	{
		level waittill_dead(var_8564fb5f, var_89c6f2db, n_timeout);
		self notify(#"aguys_kill_count");
	}
}

/*
	Name: function_b7bb4bb5
	Namespace: ai
	Checksum: 0xE1702C0D
	Offset: 0x14F0
	Size: 0xAE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b7bb4bb5(var_371cea52)
{
	self endon(#"aguys_kill_count");
	if(isdefined(var_371cea52))
	{
		if(isarray(var_371cea52))
		{
			level flag::wait_till_any(var_371cea52);
		}
		else
		{
			if(!level flag::exists(var_371cea52))
			{
				return;
			}
			level flag::wait_till_any(array(var_371cea52));
		}
		self notify(#"aguys_flag_hit");
	}
}

/*
	Name: function_b0bd06fa
	Namespace: ai
	Checksum: 0x1A0ABD83
	Offset: 0x15A8
	Size: 0x6C
	Parameters: 3
	Flags: None
*/
function function_b0bd06fa(ai_group, n_count, var_371cea52)
{
	if(!level flag::exists(var_371cea52))
	{
		return;
	}
	spawner::waittill_ai_group_ai_count(ai_group, n_count);
	level flag::set(var_371cea52);
}

/*
	Name: array_spawn
	Namespace: ai
	Checksum: 0x32E7BCE6
	Offset: 0x1620
	Size: 0x13A
	Parameters: 1
	Flags: Linked
*/
function array_spawn(str_targetname)
{
	var_523ed269 = getspawnerarray(str_targetname, "targetname");
	aiarray = array();
	foreach(spawner in var_523ed269)
	{
		guy = spawner spawnfromspawner(str_targetname, 1);
		if(!isdefined(aiarray))
		{
			aiarray = [];
		}
		else if(!isarray(aiarray))
		{
			aiarray = array(aiarray);
		}
		aiarray[aiarray.size] = guy;
	}
	return aiarray;
}

/*
	Name: set_corpse_entity
	Namespace: ai
	Checksum: 0x497E7878
	Offset: 0x1768
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function set_corpse_entity(var_2ad1c8aa)
{
	/#
		assert(isentity(self));
	#/
	level.additional_corpse[self getentitynumber()] = self;
	self thread namespace_5f6e61d9::function_c74e98cb(1, var_2ad1c8aa);
}

/*
	Name: function_4f84c3ed
	Namespace: ai
	Checksum: 0xAA4FA190
	Offset: 0x17E0
	Size: 0x154
	Parameters: 2
	Flags: Linked
*/
function function_4f84c3ed(origin, radius)
{
	result = [];
	if(!isdefined(radius))
	{
		radius = 0;
	}
	radiussq = sqr(radius);
	if(isdefined(origin))
	{
		result = getcorpsearray(origin, radius);
	}
	else
	{
		result = getcorpsearray();
	}
	if(isdefined(level.additional_corpse))
	{
		foreach(ent in level.additional_corpse)
		{
			if(isdefined(ent) && (!isdefined(origin) || distancesquared(ent.origin, origin) < radiussq))
			{
				result[result.size] = ent;
			}
		}
	}
	return result;
}

/*
	Name: function_11149e48
	Namespace: ai
	Checksum: 0x657DF229
	Offset: 0x1940
	Size: 0x2D4
	Parameters: 4
	Flags: None
*/
function function_11149e48(var_c62e2503, var_d9530aee, goal, stop_notify)
{
	/#
		assert(issentient(self));
	#/
	/#
		assert(!isplayer(self));
	#/
	self notify(#"hash_6a866dd840198982");
	if(!isdefined(var_c62e2503))
	{
		var_c62e2503 = [];
	}
	else if(!isarray(var_c62e2503))
	{
		var_c62e2503 = array(var_c62e2503);
	}
	if(!isdefined(var_d9530aee))
	{
		var_d9530aee = [];
	}
	else if(!isarray(var_d9530aee))
	{
		var_d9530aee = array(var_d9530aee);
	}
	self.var_11149e48 = spawnstruct();
	self.var_11149e48.move = var_c62e2503;
	self.var_11149e48.idle = var_d9530aee;
	self.var_11149e48.goal = goal;
	self.var_11149e48.face_angle = self.angles[1];
	self.var_11149e48.stop_notify = stop_notify;
	if(!isdefined(self.var_11149e48.goal))
	{
		self.var_11149e48.goal = self.origin;
	}
	else if(!isvec(self.var_11149e48.goal))
	{
		self.var_11149e48.goal = self.var_11149e48.goal.origin;
	}
	self.var_11149e48.path = generatenavmeshpath(self.origin, self.var_11149e48.goal, self);
	if(!isdefined(self.var_11149e48.path))
	{
		self.var_11149e48.path = generatenavmeshpath(self.origin, self.origin, self);
	}
	self.var_11149e48.path.index = 0;
	self animcustom(&function_66d43d96, &function_6e4a9c24);
}

/*
	Name: function_66d43d96
	Namespace: ai
	Checksum: 0x1A0B39EE
	Offset: 0x1C20
	Size: 0x430
	Parameters: 0
	Flags: Linked, Private
*/
function private function_66d43d96()
{
	/#
		assert(isdefined(self.var_11149e48));
	#/
	self endon(#"death", #"killanimscript", #"hash_6a866dd840198982", self.var_11149e48.stop_notify);
	var_cd6d7e01 = undefined;
	var_bee8f197 = float(function_60d95f53()) / 1000;
	lastangle = undefined;
	self animmode("gravity");
	while(true)
	{
		while(self.var_11149e48.path.pathpoints.size > self.var_11149e48.path.index)
		{
			var_436b8c8c = self.var_11149e48.path.pathpoints[self.var_11149e48.path.index];
			var_436b8c8c = (var_436b8c8c[0], var_436b8c8c[1], self.origin[2]);
			if(distancesquared(var_436b8c8c, self.origin) < sqr(16))
			{
				self.var_11149e48.path.index = self.var_11149e48.path.index + 1;
			}
			else
			{
				break;
			}
		}
		self.var_11149e48.moving = self.var_11149e48.path.pathpoints.size > self.var_11149e48.path.index;
		if(self.var_11149e48.moving)
		{
			var_436b8c8c = self.var_11149e48.path.pathpoints[self.var_11149e48.path.index];
			var_436b8c8c = (var_436b8c8c[0], var_436b8c8c[1], self.origin[2]);
			delta = vectornormalize(var_436b8c8c - self.origin);
			self.var_11149e48.face_angle = vectortoyaw(delta);
		}
		if(lastangle !== self.var_11149e48.face_angle)
		{
			self orientmode("face angle", self.var_11149e48.face_angle);
			lastangle = self.var_11149e48.face_angle;
		}
		if(self.var_11149e48.moving !== var_cd6d7e01)
		{
			if(self.var_11149e48.moving)
			{
				self thread function_f3a8861e(self.var_11149e48.move, 1);
				var_bee8f197 = float(function_60d95f53()) / 1000;
			}
			else
			{
				self thread function_f3a8861e(self.var_11149e48.idle, 1);
				self notify(#"hash_14c8785c81be82ac");
				var_bee8f197 = 1;
			}
			var_cd6d7e01 = self.var_11149e48.moving;
		}
		wait(var_bee8f197);
	}
}

/*
	Name: function_f3a8861e
	Namespace: ai
	Checksum: 0x42F92DF8
	Offset: 0x2058
	Size: 0xEC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_f3a8861e(anims, loop, mode)
{
	if(!isdefined(mode))
	{
		mode = "custom";
	}
	self notify("15ea8c5841d3bd17");
	self endon("15ea8c5841d3bd17");
	while(anims.size > 0)
	{
		animation = array::random(anims);
		self animscripted(animation, self.origin, self.angles, animation, mode, undefined, 1, 0.2);
		wait(getanimlength(animation));
		if(!is_true(loop))
		{
			return;
		}
	}
}

/*
	Name: function_6e4a9c24
	Namespace: ai
	Checksum: 0x304A9C7F
	Offset: 0x2150
	Size: 0x3E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6e4a9c24()
{
	if(!isalive(self))
	{
		self startragdoll();
	}
	self.var_11149e48 = undefined;
}

