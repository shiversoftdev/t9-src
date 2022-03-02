#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace item_drop;

/*
	Name: function_a24d9f27
	Namespace: item_drop
	Checksum: 0x728C8A96
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a24d9f27()
{
	level notify(649608170);
}

/*
	Name: main
	Namespace: item_drop
	Checksum: 0x38B8F181
	Offset: 0x118
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
	Checksum: 0x7AC7A827
	Offset: 0x180
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
	Checksum: 0xD2D23AD5
	Offset: 0x248
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
	Checksum: 0x4C77CE35
	Offset: 0x2F0
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
	Checksum: 0x32D32891
	Offset: 0x398
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
	Checksum: 0x1B53F753
	Offset: 0x5F0
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
	Checksum: 0xEC0BF457
	Offset: 0x6A8
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
	Checksum: 0x3B5F7A49
	Offset: 0x7B8
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
	Checksum: 0xB9AFB065
	Offset: 0x890
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
	Checksum: 0x117DBA00
	Offset: 0x938
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
	Checksum: 0xEA96F802
	Offset: 0x9F0
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

