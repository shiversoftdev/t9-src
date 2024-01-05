#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace oob;

/*
	Name: function_674331d0
	Namespace: oob
	Checksum: 0x6181C61E
	Offset: 0x1F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_674331d0()
{
	level notify(-1759775256);
}

/*
	Name: __init__system__
	Namespace: oob
	Checksum: 0xA4F42711
	Offset: 0x218
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"out_of_bounds", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: oob
	Checksum: 0x63702396
	Offset: 0x260
	Size: 0x5EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.oob_triggers = [];
	if(sessionmodeismultiplayergame())
	{
		level.oob_timekeep_ms = getdvarint(#"oob_timekeep_ms", 3000);
		level.oob_timelimit_ms = getdvarint(#"oob_timelimit_ms", 3000);
		level.oob_damage_interval_ms = getdvarint(#"oob_damage_interval_ms", 3000);
		level.oob_damage_per_interval = getdvarint(#"oob_damage_per_interval", 999);
		level.oob_max_distance_before_black = getdvarint(#"oob_max_distance_before_black", 100000);
		level.oob_time_remaining_before_black = getdvarint(#"oob_time_remaining_before_black", -1);
	}
	else
	{
		if(sessionmodeiswarzonegame())
		{
			level.oob_timekeep_ms = getdvarint(#"oob_timekeep_ms", 3000);
			level.oob_timelimit_ms = getdvarint(#"oob_timelimit_ms", 10000);
			level.oob_damage_interval_ms = getdvarint(#"oob_damage_interval_ms", 3000);
			level.oob_damage_per_interval = getdvarint(#"oob_damage_per_interval", 999);
			level.oob_max_distance_before_black = getdvarint(#"oob_max_distance_before_black", 100000);
			level.oob_time_remaining_before_black = getdvarint(#"oob_time_remaining_before_black", -1);
		}
		else
		{
			level.oob_timelimit_ms = getdvarint(#"oob_timelimit_ms", 6000);
			level.oob_damage_interval_ms = getdvarint(#"oob_damage_interval_ms", 1000);
			level.oob_damage_per_interval = getdvarint(#"oob_damage_per_interval", 5);
			level.oob_max_distance_before_black = getdvarint(#"oob_max_distance_before_black", 400);
			level.oob_time_remaining_before_black = getdvarint(#"oob_time_remaining_before_black", 1000);
		}
	}
	level.oob_damage_interval_sec = float(level.oob_damage_interval_ms) / 1000;
	level.var_8db0a45a = new throttle();
	[[ level.var_8db0a45a ]]->initialize(5, float(function_60d95f53()) / 1000);
	oobtriggers = getentarray("trigger_out_of_bounds", "classname");
	foreach(trigger in oobtriggers)
	{
		trigger thread run_oob_trigger();
		if(is_true(trigger.script_disconnectpaths))
		{
			trigger disconnectpaths();
		}
	}
	var_2734aa30 = getentarray("trigger_within_airspace", "classname");
	if(var_2734aa30.size > 0)
	{
		function_218b23a0(var_2734aa30);
	}
	val::register("disable_oob", 1, "$self", &disableplayeroob, "$value");
	val::default_value("disable_oob", 0);
	clientfield::register("toplayer", "out_of_bounds", 1, 5, "int");
	clientfield::register("toplayer", "nonplayer_oob_usage", 1, 1, "int");
	/#
		init_debug();
	#/
}

/*
	Name: init_debug
	Namespace: oob
	Checksum: 0xE9139B02
	Offset: 0x858
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private init_debug()
{
	/#
		adddebugcommand("");
	#/
}

/*
	Name: run_oob_trigger
	Namespace: oob
	Checksum: 0x261494E0
	Offset: 0x888
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function run_oob_trigger()
{
	self.oob_players = [];
	if(!isdefined(level.oob_triggers))
	{
		level.oob_triggers = [];
	}
	else if(!isarray(level.oob_triggers))
	{
		level.oob_triggers = array(level.oob_triggers);
	}
	level.oob_triggers[level.oob_triggers.size] = self;
	self callback::on_trigger(&function_637edff);
}

/*
	Name: function_5e18416d
	Namespace: oob
	Checksum: 0xC1610AC8
	Offset: 0x938
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_5e18416d(var_f90fc07b)
{
	level thread function_802adb65(var_f90fc07b);
}

/*
	Name: function_802adb65
	Namespace: oob
	Checksum: 0xB8A3E854
	Offset: 0x968
	Size: 0x19A
	Parameters: 1
	Flags: Linked
*/
function function_802adb65(var_f90fc07b)
{
	if(!isarray(var_f90fc07b))
	{
		/#
			assert(0);
		#/
		return;
	}
	arrayremovevalue(var_f90fc07b, undefined);
	level.var_f90fc07b = var_f90fc07b;
	while(true)
	{
		players = getplayers();
		foreach(player in players)
		{
			if(!isdefined(player))
			{
				continue;
			}
			[[ level.var_8db0a45a ]]->waitinqueue(player);
			if(!isdefined(player))
			{
				continue;
			}
			/#
				if(player isinmovemode("", ""))
				{
					continue;
				}
			#/
			if(player isoutofbounds())
			{
				continue;
			}
			if(!player function_323d32db())
			{
				player enter_oob(player);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_376ddafd
	Namespace: oob
	Checksum: 0x7800B4C8
	Offset: 0xB10
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function function_376ddafd(origin, radius)
{
	level thread function_c1e8a50a(origin, radius);
}

/*
	Name: function_c1e8a50a
	Namespace: oob
	Checksum: 0x3656652C
	Offset: 0xB50
	Size: 0x192
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c1e8a50a(origin, radius)
{
	radiussq = radius * radius;
	level.var_48f13f65 = {#radiussq:radiussq, #origin:origin};
	while(true)
	{
		players = getplayers();
		foreach(player in players)
		{
			if(!isdefined(player))
			{
				continue;
			}
			[[ level.var_8db0a45a ]]->waitinqueue(player);
			if(!isdefined(player))
			{
				continue;
			}
			/#
				if(player isinmovemode("", ""))
				{
					continue;
				}
			#/
			if(player isoutofbounds())
			{
				continue;
			}
			if(!player function_b347269d())
			{
				player enter_oob(player);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_c3f3c47f
	Namespace: oob
	Checksum: 0x54A260AB
	Offset: 0xCF0
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function function_c3f3c47f()
{
	level.var_f90fc07b = undefined;
}

/*
	Name: function_218b23a0
	Namespace: oob
	Checksum: 0x1FA24BF8
	Offset: 0xD08
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_218b23a0(var_f90fc07b)
{
	level thread function_d298702c(var_f90fc07b);
}

/*
	Name: function_d298702c
	Namespace: oob
	Checksum: 0x5249C63A
	Offset: 0xD38
	Size: 0x28C
	Parameters: 1
	Flags: Linked
*/
function function_d298702c(var_f90fc07b)
{
	if(!isarray(var_f90fc07b))
	{
		/#
			assert(0);
		#/
		return;
	}
	arrayremovevalue(var_f90fc07b, undefined);
	level.var_2734aa30 = var_f90fc07b;
	while(true)
	{
		if(isdefined(level.var_40225902))
		{
			arrayremovevalue(level.var_40225902, undefined);
			foreach(vehicle in level.var_40225902)
			{
				/#
					assert(isvehicle(vehicle), "");
				#/
				if(isalive(vehicle))
				{
					player = vehicle getseatoccupant(0);
					if(!isdefined(player) || !isplayer(player))
					{
						continue;
					}
					if(is_true(vehicle.var_206b039a))
					{
						continue;
					}
				}
				else
				{
					continue;
				}
				/#
					assert(isdefined(player));
				#/
				if(player function_65b20())
				{
					continue;
				}
				if(player isoutofbounds())
				{
					continue;
				}
				/#
					if(player isinmovemode("", ""))
					{
						continue;
					}
				#/
				if(!vehicle function_7aac4469())
				{
					player enter_oob(vehicle);
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: isoutofbounds
	Namespace: oob
	Checksum: 0xFE5E396F
	Offset: 0xFD0
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function isoutofbounds()
{
	if(!isdefined(self.oob_start_time))
	{
		return 0;
	}
	return self.oob_start_time != -1;
}

/*
	Name: function_323d32db
	Namespace: oob
	Checksum: 0x6019D5BC
	Offset: 0xFF8
	Size: 0x152
	Parameters: 0
	Flags: Linked
*/
function function_323d32db()
{
	if(getdvarint(#"hash_627b0c790443f8e5", 0))
	{
		return 1;
	}
	if(!isdefined(level.var_f90fc07b))
	{
		return 1;
	}
	if(isplayer(self) && function_65b20())
	{
		return 1;
	}
	if(self.var_e28b2990 === 1)
	{
		return 1;
	}
	result = 0;
	foreach(trigger in level.var_f90fc07b)
	{
		if(!trigger istriggerenabled())
		{
			continue;
		}
		if(self istouching(trigger))
		{
			result = 1;
			break;
		}
	}
	return result;
}

/*
	Name: function_7aac4469
	Namespace: oob
	Checksum: 0x5490EA4
	Offset: 0x1158
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_7aac4469()
{
	if(getdvarint(#"hash_627b0c790443f8e5", 0))
	{
		return true;
	}
	if(!isdefined(level.var_2734aa30))
	{
		return true;
	}
	foreach(trigger in level.var_2734aa30)
	{
		if(!trigger istriggerenabled())
		{
			continue;
		}
		if(self istouching(trigger))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: istouchinganyoobtrigger
	Namespace: oob
	Checksum: 0x543892F9
	Offset: 0x1258
	Size: 0x1BA
	Parameters: 0
	Flags: Linked
*/
function istouchinganyoobtrigger()
{
	result = 0;
	if(isplayer(self) && function_65b20())
	{
		return 0;
	}
	if(self.var_e28b2990 === 1)
	{
		return 0;
	}
	arrayremovevalue(level.oob_triggers, undefined);
	foreach(trigger in level.oob_triggers)
	{
		if(!trigger istriggerenabled())
		{
			continue;
		}
		n_flags = function_27f2ef17(trigger);
		if(trigger.classname == "trigger_out_of_bounds" && (self.team == #"axis" && !n_flags & 1) || (self.team == #"allies" && !n_flags & 2))
		{
			continue;
		}
		if(self istouching(trigger))
		{
			result = 1;
			break;
		}
	}
	return result;
}

/*
	Name: chr_party
	Namespace: oob
	Checksum: 0x8ECF7BF6
	Offset: 0x1420
	Size: 0x102
	Parameters: 2
	Flags: Linked
*/
function chr_party(point, var_b158c6d8)
{
	if(!isdefined(var_b158c6d8))
	{
		var_b158c6d8 = (0, 0, 0);
	}
	if(!isdefined(level.oob_triggers))
	{
		return false;
	}
	arrayremovevalue(level.oob_triggers, undefined);
	foreach(trigger in level.oob_triggers)
	{
		if(!trigger istriggerenabled())
		{
			continue;
		}
		if(istouching(point, trigger, var_b158c6d8))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_1a0f9f54
	Namespace: oob
	Checksum: 0x82C049D
	Offset: 0x1530
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_1a0f9f54(point)
{
	return chr_party(point, vectorscale((1, 1, 1), 15));
}

/*
	Name: function_b347269d
	Namespace: oob
	Checksum: 0x1A4D9DA4
	Offset: 0x1570
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_b347269d()
{
	if(getdvarint(#"hash_627b0c790443f8e5", 0))
	{
		return 1;
	}
	if(!isstruct(level.var_48f13f65))
	{
		return 1;
	}
	if(isplayer(self) && function_65b20())
	{
		return 1;
	}
	if(self.var_e28b2990 === 1)
	{
		return 1;
	}
	return distance2dsquared(self.origin, level.var_48f13f65.origin) < level.var_48f13f65.radiussq;
}

/*
	Name: resetoobtimer
	Namespace: oob
	Checksum: 0xB3ACFF34
	Offset: 0x1658
	Size: 0x18E
	Parameters: 2
	Flags: Linked
*/
function resetoobtimer(is_host_migrating, b_disable_timekeep)
{
	self.oob_lastvalidplayerloc = undefined;
	self.oob_lastvalidplayerdir = undefined;
	self clientfield::set_to_player("out_of_bounds", 0);
	self val::reset(#"oob", "show_hud");
	if(!getdvarint(#"hash_4f2471155144a80a", 0))
	{
		if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
		{
			self val::reset(#"oob", "disable_offhand_special");
		}
	}
	self.oob_start_time = -1;
	self function_20431d45(0);
	if(isdefined(level.oob_timekeep_ms))
	{
		if(is_true(b_disable_timekeep))
		{
			self.last_oob_timekeep_ms = undefined;
		}
		else
		{
			self.last_oob_timekeep_ms = gettime();
		}
	}
	if(!is_true(is_host_migrating))
	{
		self notify(#"oob_host_migration_exit");
	}
	self notify(#"oob_exit");
}

/*
	Name: getadjusedplayer
	Namespace: oob
	Checksum: 0x21A1F672
	Offset: 0x17F0
	Size: 0x48
	Parameters: 1
	Flags: None
*/
function getadjusedplayer(player)
{
	if(isdefined(player.hijacked_vehicle_entity) && isalive(player.hijacked_vehicle_entity))
	{
		return player.hijacked_vehicle_entity;
	}
	return player;
}

/*
	Name: function_637edff
	Namespace: oob
	Checksum: 0xF64723DB
	Offset: 0x1840
	Size: 0x1D6
	Parameters: 1
	Flags: Linked
*/
function function_637edff(trigger_struct)
{
	entity = trigger_struct.activator;
	var_890473a4 = 0;
	if(chr_party(entity.origin))
	{
		var_890473a4 = 1;
	}
	if(isplayer(entity))
	{
		player = entity;
	}
	else
	{
		if(isvehicle(entity) && isalive(entity))
		{
			player = entity getseatoccupant(0);
			if(!isdefined(player) || !isplayer(player))
			{
				return;
			}
			if(is_true(entity.var_50e3187f))
			{
				return;
			}
		}
		else
		{
			if(isactor(entity) && isdefined(entity.isaiclone) && entity.isaiclone && !entity isplayinganimscripted())
			{
				entity notify(#"clone_shutdown");
				return;
			}
			return;
		}
	}
	if(player function_65b20())
	{
		return;
	}
	if(player isoutofbounds())
	{
		return;
	}
	player enter_oob(entity);
}

/*
	Name: enter_oob
	Namespace: oob
	Checksum: 0xCF2D0292
	Offset: 0x1A20
	Size: 0x294
	Parameters: 1
	Flags: Linked
*/
function enter_oob(entity)
{
	player = self;
	player notify(#"oob_enter");
	if(isdefined(level.oob_timekeep_ms) && isdefined(player.last_oob_timekeep_ms) && isdefined(player.last_oob_duration_ms) && (gettime() - player.last_oob_timekeep_ms) < level.oob_timekeep_ms)
	{
		var_e09617 = player function_54e69ee4();
		player.oob_start_time = gettime() - (var_e09617 - player.last_oob_duration_ms);
	}
	else
	{
		player.oob_start_time = gettime();
	}
	player.oob_lastvalidplayerloc = entity.origin;
	player.oob_lastvalidplayerdir = vectornormalize(entity getvelocity());
	player clientfield::set_to_player("nonplayer_oob_usage", 0);
	player val::set(#"oob", "show_hud", 0);
	player thread watchforleave(entity);
	player thread watchfordeath(entity);
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		if(!getdvarint(#"hash_4f2471155144a80a", 0))
		{
			weapon = player loadout::function_18a77b37("specialgrenade");
			if(weapon.name === #"gadget_jammer" || weapon.name === #"listening_device" || weapon.name === #"tear_gas")
			{
				player val::set(#"oob", "disable_offhand_special", 1);
			}
		}
		player thread watchforhostmigration(entity);
	}
}

/*
	Name: function_65b20
	Namespace: oob
	Checksum: 0x37747585
	Offset: 0x1CC0
	Size: 0xC2
	Parameters: 0
	Flags: Linked
*/
function function_65b20()
{
	if(self scene::is_igc_active())
	{
		return true;
	}
	if(is_true(self.oobdisabled))
	{
		return true;
	}
	if(level flag::exists("draft_complete") && !level flag::get("draft_complete"))
	{
		return true;
	}
	/#
		if(getdvarint(#"hash_2b58bf75b6021e78", 0) != 0)
		{
			return true;
		}
	#/
	return false;
}

/*
	Name: getdistancefromlastvalidplayerloc
	Namespace: oob
	Checksum: 0x2DFEE0ED
	Offset: 0x1D90
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function getdistancefromlastvalidplayerloc(entity)
{
	if(isdefined(self.oob_lastvalidplayerdir) && self.oob_lastvalidplayerdir != (0, 0, 0))
	{
		vectoplayerlocfromorigin = entity.origin - self.oob_lastvalidplayerloc;
		distance = vectordot(vectoplayerlocfromorigin, self.oob_lastvalidplayerdir);
	}
	else
	{
		distance = distance(entity.origin, self.oob_lastvalidplayerloc);
	}
	if(distance < 0)
	{
		distance = 0;
	}
	if(distance > level.oob_max_distance_before_black)
	{
		distance = level.oob_max_distance_before_black;
	}
	return distance / level.oob_max_distance_before_black;
}

/*
	Name: function_f896a102
	Namespace: oob
	Checksum: 0x70AACDC6
	Offset: 0x1E68
	Size: 0x5E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f896a102()
{
	timeremaining = 0;
	var_e09617 = self function_54e69ee4();
	if(isdefined(var_e09617) && isdefined(self.oob_start_time))
	{
		timeremaining = var_e09617 - (gettime() - self.oob_start_time);
	}
	return timeremaining;
}

/*
	Name: updatevisualeffects
	Namespace: oob
	Checksum: 0xA74A150E
	Offset: 0x1ED0
	Size: 0x264
	Parameters: 1
	Flags: Linked
*/
function updatevisualeffects(entity)
{
	timeremaining = function_f896a102();
	if(entity.var_c5d65381 === 1 && isplayer(self) && !self isremotecontrolling() && isvehicle(entity))
	{
		self clientfield::set_to_player("out_of_bounds", 0);
		self val::reset(#"oob", "show_hud");
		self function_20431d45(0);
		return;
	}
	if(isdefined(level.oob_timekeep_ms))
	{
		self.last_oob_duration_ms = timeremaining;
	}
	oob_effectvalue = 0;
	if(timeremaining <= level.oob_time_remaining_before_black)
	{
		if(!isdefined(self.oob_lasteffectvalue))
		{
			self.oob_lasteffectvalue = getdistancefromlastvalidplayerloc(entity);
		}
		time_val = 1 - (timeremaining / level.oob_time_remaining_before_black);
		if(time_val > 1)
		{
			time_val = 1;
		}
		oob_effectvalue = self.oob_lasteffectvalue + ((1 - self.oob_lasteffectvalue) * time_val);
	}
	else
	{
		oob_effectvalue = getdistancefromlastvalidplayerloc(entity);
		if(oob_effectvalue > 0.9)
		{
			oob_effectvalue = 0.9;
		}
		else if(oob_effectvalue < 0.05)
		{
			oob_effectvalue = 0.05;
		}
		self.oob_lasteffectvalue = oob_effectvalue;
	}
	oob_effectvalue = ceil(oob_effectvalue * 31);
	self clientfield::set_to_player("out_of_bounds", int(oob_effectvalue));
	self function_20431d45(1);
}

/*
	Name: killentity
	Namespace: oob
	Checksum: 0xDE69F62D
	Offset: 0x2140
	Size: 0x274
	Parameters: 1
	Flags: Linked
*/
function killentity(entity)
{
	self resetoobtimer(0, 1);
	if(isdefined(level.var_bde3d03))
	{
		[[level.var_bde3d03]](entity);
		return;
	}
	entity val::set(#"oob", "takedamage", 1);
	if(isplayer(entity) && entity isinvehicle())
	{
		vehicle = entity getvehicleoccupied();
		vehicle val::set(#"oob", "takedamage", 1);
		occupants = vehicle getvehoccupants();
		foreach(occupant in occupants)
		{
			occupant unlink();
		}
		if(!is_false(vehicle.allowdeath))
		{
			vehicle dodamage(vehicle.health + 10000, vehicle.origin, undefined, undefined, "none", "MOD_EXPLOSIVE", 8192);
		}
	}
	entity dodamage(entity.health + 10000, entity.origin, undefined, undefined, "none", "MOD_TRIGGER_HURT", 8192 | 16384);
	if(isplayer(entity))
	{
		entity suicide();
	}
}

/*
	Name: watchforleave
	Namespace: oob
	Checksum: 0x44224F27
	Offset: 0x23C0
	Size: 0x278
	Parameters: 1
	Flags: Linked
*/
function watchforleave(entity)
{
	self endon(#"oob_exit", #"disconnect");
	entity endon(#"death");
	var_e09617 = self function_54e69ee4();
	while(true)
	{
		if(is_true(entity.var_e28b2990) && !entity function_7aac4469() || entity istouchinganyoobtrigger() || !entity function_323d32db() || !entity function_b347269d() && (isplayer(entity) || (isplayer(self) && self isremotecontrolling()) || entity.var_c5d65381 === 1))
		{
			updatevisualeffects(entity);
			cur_time = gettime();
			elapsed_time = cur_time - self.oob_start_time;
			if(elapsed_time > var_e09617)
			{
				if(isplayer(entity))
				{
					entity val::set(#"oob_touch", "ignoreme", 0);
					entity.laststand = undefined;
					if(isdefined(entity.revivetrigger))
					{
						entity.revivetrigger delete();
					}
				}
				if(self !== entity)
				{
					self.last_oob_duration_ms = var_e09617;
					self clientfield::set_to_player("nonplayer_oob_usage", 1);
				}
				self thread killentity(entity);
			}
		}
		else
		{
			self resetoobtimer();
		}
		wait(0.1);
	}
}

/*
	Name: watchfordeath
	Namespace: oob
	Checksum: 0xE5650756
	Offset: 0x2640
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function watchfordeath(entity)
{
	self endon(#"disconnect", #"oob_exit");
	util::waittill_any_ents_two(self, "death", entity, "death");
	self resetoobtimer(0, 1);
}

/*
	Name: watchforhostmigration
	Namespace: oob
	Checksum: 0x6D2BD981
	Offset: 0x26C0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function watchforhostmigration(entity)
{
	self endon(#"oob_host_migration_exit");
	level waittill(#"host_migration_begin");
	self resetoobtimer(1, 1);
}

/*
	Name: disableplayeroob
	Namespace: oob
	Checksum: 0xAF86B90B
	Offset: 0x2720
	Size: 0x4A
	Parameters: 1
	Flags: Linked, Private
*/
function private disableplayeroob(disabled)
{
	if(disabled)
	{
		self resetoobtimer();
		self.oobdisabled = 1;
	}
	else
	{
		self.oobdisabled = 0;
	}
}

/*
	Name: function_20431d45
	Namespace: oob
	Checksum: 0xD66D35A7
	Offset: 0x2778
	Size: 0x12C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_20431d45(var_952a24b5)
{
	player = self;
	if(!sessionmodeiscampaigngame())
	{
		return;
	}
	if(!is_true(player.var_fe73e6f8) && var_952a24b5)
	{
		player.var_fe73e6f8 = 1;
		timeremaining = player function_f896a102();
		callback::callback(#"hash_75edd53ff899cd30", {#countdowntime:timeremaining});
	}
	else if(is_true(player.var_fe73e6f8) && !var_952a24b5)
	{
		player.var_fe73e6f8 = undefined;
		callback::callback(#"hash_75edd53ff899cd30", {#countdowntime:0});
	}
}

/*
	Name: function_93bd17f6
	Namespace: oob
	Checksum: 0x3687B02A
	Offset: 0x28B0
	Size: 0x70
	Parameters: 2
	Flags: None
*/
function function_93bd17f6(id, time)
{
	if(!isdefined(self.var_2ae9ee7e))
	{
		self.var_2ae9ee7e = [];
	}
	else if(!isarray(self.var_2ae9ee7e))
	{
		self.var_2ae9ee7e = array(self.var_2ae9ee7e);
	}
	self.var_2ae9ee7e[id] = time;
}

/*
	Name: function_e2d18c01
	Namespace: oob
	Checksum: 0x4BBB0D17
	Offset: 0x2928
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_e2d18c01(id)
{
	if(isarray(self.var_2ae9ee7e))
	{
		arrayremoveindex(self.var_2ae9ee7e, id, 1);
	}
}

/*
	Name: function_54e69ee4
	Namespace: oob
	Checksum: 0x93A7E7C1
	Offset: 0x2978
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_54e69ee4()
{
	if(!isarray(self.var_2ae9ee7e) || !self.var_2ae9ee7e.size)
	{
		return level.oob_timelimit_ms;
	}
	var_56afe472 = undefined;
	foreach(time in self.var_2ae9ee7e)
	{
		if(!isdefined(var_56afe472) || time < var_56afe472)
		{
			var_56afe472 = time;
		}
	}
	return int(var_56afe472 * 1000);
}

