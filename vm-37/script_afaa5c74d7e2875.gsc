#using scripts\weapons\weapons.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace sparrow;

/*
	Name: __init__system__
	Namespace: sparrow
	Checksum: 0xF5556A1E
	Offset: 0xD8
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
	Checksum: 0x908C37F7
	Offset: 0x128
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
	Checksum: 0xF2979607
	Offset: 0x160
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
	Checksum: 0x1B42D237
	Offset: 0x3E0
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
	Checksum: 0xD5039704
	Offset: 0x418
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
	Checksum: 0x6EF5FC8
	Offset: 0x4A0
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
	Checksum: 0xF47924BE
	Offset: 0x4F0
	Size: 0x20
	Parameters: 1
	Flags: Linked, Private
*/
function private function_119a2a90(weapon)
{
	return weapon.statname == "sig_bow_flame";
}

