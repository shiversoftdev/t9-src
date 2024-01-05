#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace item_drop;

/*
	Name: main
	Namespace: item_drop
	Checksum: 0x321D7466
	Offset: 0xF8
	Size: 0x5C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	if(!isdefined(level.item_drops))
	{
		level.item_drops = [];
	}
	level thread watch_level_drops();
	waitframe(1);
	callback::on_actor_killed(&actor_killed_check_drops);
}

/*
	Name: add_drop
	Namespace: item_drop
	Checksum: 0x5738CF6D
	Offset: 0x160
	Size: 0xBA
	Parameters: 3
	Flags: None
*/
function add_drop(name, model, callback)
{
	if(!isdefined(level.item_drops))
	{
		level.item_drops = [];
	}
	if(!isdefined(level.item_drops[name]))
	{
		level.item_drops[name] = spawnstruct();
	}
	level.item_drops[name].name = name;
	level.item_drops[name].model = model;
	level.item_drops[name].callback = callback;
}

/*
	Name: add_drop_onaikilled
	Namespace: item_drop
	Checksum: 0x28A5E40F
	Offset: 0x228
	Size: 0x9A
	Parameters: 2
	Flags: None
*/
function add_drop_onaikilled(name, dropchance)
{
	if(!isdefined(level.item_drops))
	{
		level.item_drops = [];
	}
	if(!isdefined(level.item_drops[name]))
	{
		level.item_drops[name] = spawnstruct();
	}
	level.item_drops[name].name = name;
	level.item_drops[name].onaikilled = dropchance;
}

/*
	Name: add_drop_spawnpoints
	Namespace: item_drop
	Checksum: 0xB2227706
	Offset: 0x2D0
	Size: 0x9A
	Parameters: 2
	Flags: None
*/
function add_drop_spawnpoints(name, spawnpoints)
{
	if(!isdefined(level.item_drops))
	{
		level.item_drops = [];
	}
	if(!isdefined(level.item_drops[name]))
	{
		level.item_drops[name] = spawnstruct();
	}
	level.item_drops[name].name = name;
	level.item_drops[name].spawnpoints = spawnpoints;
}

/*
	Name: actor_killed_check_drops
	Namespace: item_drop
	Checksum: 0x9808B000
	Offset: 0x378
	Size: 0x24C
	Parameters: 1
	Flags: None
*/
function actor_killed_check_drops(params)
{
	if(level.script != "sp_proto_characters" && level.script != "challenge_bloodbath")
	{
		return;
	}
	if(is_true(self.item_drops_checked))
	{
		return;
	}
	self.item_drops_checked = 1;
	drop = array::random(level.item_drops);
	/#
		if(isdefined(drop.onaikilled))
		{
			drop.onaikilled = getdvarfloat("" + drop.name, 0);
		}
	#/
	if(getdvarint(#"scr_drop_autorecover", 0))
	{
		killer = self.dds_dmg_attacker;
		if(isdefined(killer))
		{
			if(isdefined(drop.callback))
			{
				multiplier = self actor_drop_multiplier();
				if(!killer [[drop.callback]](multiplier))
				{
					return;
				}
			}
			playsoundatposition(#"fly_supply_bag_pick_up", killer.origin);
		}
	}
	else if(isdefined(drop.onaikilled) && randomfloat(1) < drop.onaikilled)
	{
		origin = self.origin + vectorscale((0, 0, 1), 30);
		newdrop = spawn_drop(drop, origin);
		newdrop.multiplier = self actor_drop_multiplier();
		level.item_drops_current[level.item_drops_current.size] = newdrop;
		newdrop thread watch_player_pickup();
	}
}

/*
	Name: actor_drop_multiplier
	Namespace: item_drop
	Checksum: 0xA82C5A13
	Offset: 0x5D0
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function actor_drop_multiplier()
{
	min_mult = getdvarfloat(#"scr_drop_default_min", 0);
	if(isdefined(self.drop_min_multiplier))
	{
		min_mult = self.drop_min_multiplier;
	}
	max_mult = getdvarfloat(#"scr_drop_default_max", 0);
	if(isdefined(self.drop_max_multiplier))
	{
		max_mult = self.drop_max_multiplier;
	}
	if(min_mult < max_mult)
	{
		return randomfloatrange(min_mult, max_mult);
	}
	return min_mult;
}

/*
	Name: watch_level_drops
	Namespace: item_drop
	Checksum: 0x32B7D4E5
	Offset: 0x688
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function watch_level_drops()
{
	level.item_drops_current = [];
	level flag::wait_till("all_players_spawned");
	while(true)
	{
		wait(15);
		if(level.item_drops_current.size < 1 && level.item_drops.size > 0)
		{
			drop = array::random(level.item_drops);
			if(isdefined(drop.spawnpoints))
			{
				origin = array::random(drop.spawnpoints);
				newdrop = spawn_drop(drop, origin);
				level.item_drops_current[level.item_drops_current.size] = newdrop;
				newdrop thread watch_player_pickup();
			}
		}
	}
}

/*
	Name: spawn_drop
	Namespace: item_drop
	Checksum: 0xDCE5AD13
	Offset: 0x798
	Size: 0xD0
	Parameters: 2
	Flags: None
*/
function spawn_drop(drop, origin)
{
	nd = spawnstruct();
	nd.drop = drop;
	nd.origin = origin;
	nd.model = spawn("script_model", nd.origin);
	nd.model setmodel(drop.model);
	nd.model thread spin_it();
	playsoundatposition(#"fly_supply_bag_drop", origin);
	return nd;
}

/*
	Name: spin_it
	Namespace: item_drop
	Checksum: 0x74C14534
	Offset: 0x870
	Size: 0x9E
	Parameters: 0
	Flags: None
*/
function spin_it()
{
	angle = 0;
	time = 0;
	self endon(#"death");
	while(isdefined(self))
	{
		angle = time * 90;
		self.angles = (0, angle, 0);
		waitframe(1);
		time = time + (float(function_60d95f53()) / 1000);
	}
}

/*
	Name: watch_player_pickup
	Namespace: item_drop
	Checksum: 0x88A7CEF8
	Offset: 0x918
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function watch_player_pickup()
{
	trigger = spawn("trigger_radius", self.origin, 0, 60, 60);
	self.pickuptrigger = trigger;
	while(isdefined(self))
	{
		waitresult = undefined;
		waitresult = trigger waittill(#"trigger");
		if(waitresult.activator thread pickup(self))
		{
			break;
		}
	}
	trigger delete();
}

/*
	Name: pickup
	Namespace: item_drop
	Checksum: 0xF77C5A1A
	Offset: 0x9D0
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function pickup(drop)
{
	if(isdefined(drop.drop.callback))
	{
		multiplier = 1;
		if(isdefined(drop.multiplier))
		{
			multiplier = drop.multiplier;
		}
		if(!self [[drop.drop.callback]](multiplier))
		{
			return false;
		}
	}
	playsoundatposition(#"fly_supply_bag_pick_up", self.origin);
	drop.model delete();
	arrayremovevalue(level.item_drops_current, drop);
	return true;
}

