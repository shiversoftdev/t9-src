#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_b0e844dd;

/*
	Name: function_922745a1
	Namespace: namespace_b0e844dd
	Checksum: 0x596398B7
	Offset: 0x200
	Size: 0x1F0
	Parameters: 1
	Flags: Linked
*/
function function_922745a1(player)
{
	self endon(#"death");
	self endon(#"hash_1e744934a54fe4bc");
	player endon(#"disconnect");
	weapon = getweapon("zombietron_sprinkler_grenade");
	top = self.origin + vectorscale((0, 0, 1), 32);
	while(true)
	{
		self rotateto(self.angles + vectorscale((0, 1, 0), 15), 0.2);
		wait(0.2);
		forward = anglestoforward(self.angles + vectorscale((0, 0, 1), 500));
		velocity = forward * (getdvarint(#"hash_6e23b1c0ac2fdd38", 150) + (randomintrange(-50, 50)));
		boost = sin(self.angles[1]);
		if(boost < 0)
		{
			boost = boost * -1;
		}
		up = mapfloat(0, 1, 300, 900, boost);
		velocity = velocity + (0, 0, up);
		player magicgrenadetype(weapon, top, velocity);
	}
}

/*
	Name: function_d275f769
	Namespace: namespace_b0e844dd
	Checksum: 0xE7A7D500
	Offset: 0x3F8
	Size: 0x2D4
	Parameters: 2
	Flags: Linked
*/
function function_d275f769(player, origin)
{
	dropspot = origin + vectorscale((0, 0, 1), 800);
	sprinkler = namespace_ec06fe4a::function_e22ae9b3(dropspot, "zombietron_sprinkler");
	if(!isdefined(sprinkler))
	{
		return;
	}
	sprinkler.targetname = "sprinkler";
	sprinkler notsolid();
	target = player.origin;
	if(isdefined(player.doa.vehicle))
	{
		target = namespace_ec06fe4a::function_65ee50ba(player.origin);
	}
	mark = target + vectorscale((0, 0, 1), 12);
	sprinkler moveto(mark, 0.5);
	sprinkler waittilltimeout(1, #"movedone");
	sprinkler namespace_e32bb68::function_3a59ec34("evt_doa_pickup_sprinkler_land");
	sprinkler namespace_83eb6304::function_3ecfde67("sprinkler_land");
	physicsexplosionsphere(mark, 200, 128, 2);
	playrumbleonposition("grenade_rumble", mark);
	wait(1);
	if(isdefined(player))
	{
		sprinkler namespace_83eb6304::function_3ecfde67("sprinkler_active");
		sprinkler thread function_922745a1(player);
		timeout = player doa_fate::function_4808b985(10);
		player waittilltimeout(timeout, #"disconnect");
	}
	sprinkler notify(#"hash_1e744934a54fe4bc");
	sprinkler namespace_83eb6304::turnofffx("sprinkler_active");
	wait(2);
	sprinkler namespace_e32bb68::function_3a59ec34("evt_doa_pickup_sprinkler_takeoff");
	sprinkler namespace_83eb6304::function_3ecfde67("sprinkler_takeoff");
	sprinkler moveto(dropspot, 0.5);
	sprinkler waittilltimeout(1, #"movedone");
	sprinkler delete();
}

