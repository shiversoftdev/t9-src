#using scripts\weapons\weapons.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace sparrow;

/*
	Name: function_b84675ee
	Namespace: sparrow
	Checksum: 0x1D4D4ED5
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b84675ee()
{
	level notify(-2101695413);
}

/*
	Name: __init__system__
	Namespace: sparrow
	Checksum: 0xE4E3E2C9
	Offset: 0xF8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"sparrow", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: sparrow
	Checksum: 0x966D44F0
	Offset: 0x148
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	killstreaks::register_killstreak("killstreak_sparrow", &killstreaks::function_fc82c544);
}

/*
	Name: function_8cd77cf6
	Namespace: sparrow
	Checksum: 0x53BD6291
	Offset: 0x180
	Size: 0x274
	Parameters: 1
	Flags: Event
*/
event function_8cd77cf6(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	missile = eventstruct.projectile;
	weapon = eventstruct.weapon;
	missile thread function_1bb4a86d();
	missile thread function_be16c377();
	if(function_119a2a90(weapon))
	{
		missile.soundmod = "player";
		missile thread weapons::check_stuck_to_player(1, 0, weapon);
		waitresult = undefined;
		waitresult = missile waittill(#"projectile_impact_explode", #"hash_4390b87a69abafe9");
		position = waitresult.position;
		if(waitresult._notify == "projectile_impact_explode")
		{
			if(!function_f4e48434(position))
			{
				normal = waitresult.normal;
				var_a0148c55 = bullettrace(position, position - vectorscale(normal, 4), 1, missile);
				if(isplayer(var_a0148c55[#"entity"]) || isactor(var_a0148c55[#"entity"]))
				{
					explosionfx = #"hash_68f22c5fa8133ec1";
				}
				else
				{
					explosionfx = #"hash_50f125069e98a03d";
				}
				velocity = vectornormalize(missile.var_59ba00f5) * -1;
				angles = vectortoangles(velocity);
				playfx(explosionfx, position, velocity, anglestoup(angles));
			}
		}
	}
}

/*
	Name: function_1bb4a86d
	Namespace: sparrow
	Checksum: 0x7F1CBE4A
	Offset: 0x400
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_1bb4a86d()
{
	self waittill(#"death");
	waittillframeend();
	self notify(#"hash_4390b87a69abafe9");
}

/*
	Name: function_be16c377
	Namespace: sparrow
	Checksum: 0x3CFC6CB5
	Offset: 0x438
	Size: 0x7A
	Parameters: 0
	Flags: Linked
*/
function function_be16c377()
{
	self endon(#"projectile_impact_explode", #"death");
	while(true)
	{
		self.var_59ba00f5 = self getvelocity();
		wait(float(function_60d95f53()) / 1000);
	}
}

/*
	Name: function_f4e48434
	Namespace: sparrow
	Checksum: 0x95321CB3
	Offset: 0x4C0
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_f4e48434(position)
{
	water_depth = getwaterheight(position) - position[2];
	return water_depth >= 24;
}

/*
	Name: function_119a2a90
	Namespace: sparrow
	Checksum: 0x679E62EF
	Offset: 0x510
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private function_119a2a90(weapon)
{
	return weapon.statname == "sig_bow_flame";
}

