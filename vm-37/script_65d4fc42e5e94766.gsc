#using script_1d29de500c266470;
#using script_348ce871561476c9;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;

#namespace spawn;

/*
	Name: function_f468d9a5
	Namespace: spawn
	Checksum: 0xEC6778B6
	Offset: 0x170
	Size: 0x1C4
	Parameters: 1
	Flags: None
*/
function function_f468d9a5(spawnpoint)
{
	distance = getdvarfloat(#"hash_69b296d9dc607a9a", 4350);
	height = getdvarfloat(#"hash_73c6222ce96fa34a", 5000);
	velocity = getdvarfloat(#"hash_ae6b05a24ae0d2a", 1760);
	dir = anglestoforward(spawnpoint.angles);
	pos = spawnpoint.origin - (dir * distance);
	hold_origin = (pos[0], pos[1], spawnpoint.origin[2] + height);
	hold_angles = vectortoangles(vectornormalize(spawnpoint.origin - pos));
	vec = anglestoforward(hold_angles);
	vec = vectornormalize(vec);
	vec = vec * velocity;
	return {#freefall:vec, #angles:hold_angles, #origin:hold_origin};
}

/*
	Name: function_e93291ff
	Namespace: spawn
	Checksum: 0x8D2F7775
	Offset: 0x340
	Size: 0x3A8
	Parameters: 0
	Flags: None
*/
function function_e93291ff()
{
	if(isdefined(level.var_1710ced9))
	{
		destinations = [[level.var_1710ced9]]();
	}
	else
	{
		destinations = struct::get_array("destination_influencer");
	}
	if(destinations.size <= 0)
	{
		return;
	}
	destinations = arraysortclosest(destinations, (0, 0, 0));
	for(var_bae3dcae = 0; var_bae3dcae < destinations.size; var_bae3dcae++)
	{
		destinations[var_bae3dcae].var_343828ba = var_bae3dcae;
	}
	level.var_7767cea8 = [];
	/#
		if(getdvarint(#"hash_270a21a654a1a79f", 0))
		{
			level.var_94cbd997 = [];
			foreach(destination in destinations)
			{
				level.var_94cbd997 = arraycombine(level.var_94cbd997, struct::get_array(destination.target, ""), 0, 0);
			}
		}
	#/
	var_137456fd = getdvarint(#"hash_400f07203191574f", -1);
	if(var_137456fd >= 0 && var_137456fd < destinations.size)
	{
		level.var_7767cea8[0] = destinations[var_137456fd];
		arrayremoveindex(destinations, var_137456fd);
	}
	else
	{
		while(destinations.size > 0 && level.var_7767cea8.size < 5)
		{
			var_bae3dcae = randomint(destinations.size);
			level.var_7767cea8[level.var_7767cea8.size] = destinations[var_bae3dcae];
			arrayremoveindex(destinations, var_bae3dcae);
		}
	}
	foreach(dest in level.var_7767cea8)
	{
		dest.spawns = struct::get_array(dest.target, "targetname");
	}
	foreach(dest in destinations)
	{
		function_3b1d0553(dest);
	}
}

/*
	Name: function_cb5864fc
	Namespace: spawn
	Checksum: 0xD9035D34
	Offset: 0x6F0
	Size: 0x98
	Parameters: 0
	Flags: None
*/
function function_cb5864fc()
{
	if(isdefined(level.var_7767cea8))
	{
		foreach(dest in level.var_7767cea8)
		{
			function_3b1d0553(dest);
		}
	}
}

/*
	Name: on_spawn_player
	Namespace: spawn
	Checksum: 0x9F7B5EB7
	Offset: 0x790
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function on_spawn_player(predictedspawn)
{
	self.usingobj = undefined;
	if(!isdefined(self.var_63af7f75))
	{
		self.var_63af7f75 = -1;
	}
	if(isdefined(level.var_52b56362))
	{
		self.var_63af7f75 = level.var_52b56362;
	}
	self.var_c5134737 = 0;
	spawnstruct = spawning::onspawnplayer(predictedspawn);
	if(level.ingraceperiod)
	{
		self.var_b936d86b = spawnstruct;
	}
	if(self.pers[#"spawns"] == 1)
	{
		if(level.var_f2814a96 === 0)
		{
			self thread function_c263fd97();
		}
		else
		{
			self function_8cef1872();
		}
	}
	self function_ea62f5af();
}

/*
	Name: function_ea62f5af
	Namespace: spawn
	Checksum: 0x1A3D1AC
	Offset: 0x8A8
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function function_ea62f5af()
{
	var_a56604c5 = namespace_eb06e24d::function_4a22ec61().lootid;
	var_c9b1d229 = namespace_eb06e24d::function_4a39b434().lootid;
	var_42b02106 = namespace_eb06e24d::function_3c54cdb1().lootid;
	var_f8e6b703 = self match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
	if(isdefined(var_f8e6b703))
	{
		self match_record::set_stat(#"lives", var_f8e6b703, #"hash_4f557c87c0538129", var_a56604c5);
		self match_record::set_stat(#"lives", var_f8e6b703, #"hash_4b4bd85ab964d386", var_c9b1d229);
		self match_record::set_stat(#"lives", var_f8e6b703, #"hash_63862160f8335af2", var_42b02106);
	}
}

/*
	Name: function_8cef1872
	Namespace: spawn
	Checksum: 0xD660472D
	Offset: 0x9F0
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function function_8cef1872()
{
	self clientfield::set_player_uimodel("hudItems.wzLoadFinished", 1);
	self clientfield::set_player_uimodel("hudItems.streamerLoadFraction", 1);
	self val::reset(#"hash_5bb0dd6b277fc20c", "freezecontrols");
	self val::reset(#"hash_5bb0dd6b277fc20c", "disablegadgets");
}

/*
	Name: function_c263fd97
	Namespace: spawn
	Checksum: 0x30E0D8EB
	Offset: 0xA90
	Size: 0x42C
	Parameters: 0
	Flags: Private
*/
function private function_c263fd97()
{
	level endon(#"hash_1c605a92cc507414");
	self endon(#"disconnect");
	self ghost();
	self notsolid();
	self val::set(#"hash_5bb0dd6b277fc20c", "freezecontrols", 1);
	self val::set(#"hash_5bb0dd6b277fc20c", "disablegadgets", 1);
	var_80e2abb1 = getdvarfloat(#"hash_78198bd3a356f650", 0.5);
	starttime = gettime();
	var_ffa47239 = getdvarint(#"hash_24ce936622303dc1", 4000);
	var_2ee361bf = getdvarint(#"hash_6e24885f4fa8a2a2", 10000);
	/#
		println("");
	#/
	while(gettime() < starttime + var_ffa47239)
	{
		wait(0.5);
		now = gettime();
		self clientfield::set_player_uimodel("hudItems.streamerLoadFraction", (now - starttime) / (var_ffa47239 + var_2ee361bf));
	}
	/#
		println("");
	#/
	var_4fcc3493 = (starttime + var_ffa47239) + var_2ee361bf;
	var_8cd82180 = getdvarint(#"hash_723f28907e9e4cd0", 3);
	var_45d7d746 = 0;
	while(true)
	{
		wait(0.5);
		now = gettime();
		self clientfield::set_player_uimodel("hudItems.streamerLoadFraction", (now - starttime) / (var_ffa47239 + var_2ee361bf));
		if(now > var_4fcc3493)
		{
			/#
				println("");
			#/
			break;
		}
		stability = 1;
		if(isdefined(self.var_72d32640))
		{
			stability = self.var_72d32640;
		}
		if(self isstreamerready() && stability > var_80e2abb1)
		{
			var_45d7d746++;
		}
		else
		{
			var_45d7d746 = 0;
		}
		/#
			println("" + var_45d7d746);
		#/
		if(var_45d7d746 >= var_8cd82180)
		{
			/#
				println("");
			#/
			break;
		}
	}
	self function_8cef1872();
	self show();
	self solid();
	if(game.state == #"pregame")
	{
		if(isdefined(level.var_fd167bf6))
		{
			self luinotifyevent(#"create_prematch_timer", 2, level.var_fd167bf6, level.var_5654073f);
		}
		else
		{
			self luinotifyevent(#"hash_2a9f7ecda8e925f6", 0);
		}
	}
}

/*
	Name: function_3b1d0553
	Namespace: spawn
	Checksum: 0xB790ECC4
	Offset: 0xEC8
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_3b1d0553(dest)
{
	targets = struct::get_array(dest.target, "targetname");
	foreach(target in targets)
	{
		target struct::delete();
	}
	dest struct::delete();
}

/*
	Name: function_1390f875
	Namespace: spawn
	Checksum: 0x6FB6212C
	Offset: 0xFA0
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_1390f875(num_lives)
{
	var_c6328f73 = self.pers[#"lives"] - 1;
	if(var_c6328f73 < 0)
	{
		var_c6328f73 = 0;
	}
	self clientfield::set_player_uimodel("hudItems.playerLivesRemaining", var_c6328f73);
}

