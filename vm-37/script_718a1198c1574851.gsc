#using script_2da073d4aa78c206;
#using script_335d0650ed05d36d;
#using script_4108035fe400ce67;
#using script_44b0b8420eabacad;
#using script_471b31bd963b388e;
#using script_5209c07c35771d12;
#using script_5495f0bb06045dc7;
#using script_788472602edbe3b9;
#using script_7bacb32f8222fa3e;
#using script_9279a21b1e8b6c9;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\wz_common\hud.gsc;

#namespace namespace_bc2b656d;

/*
	Name: main
	Namespace: namespace_bc2b656d
	Checksum: 0x14E6DC97
	Offset: 0x100
	Size: 0x1EC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_17baa64d::init();
	spawning::function_32b97d1b(&spawning::function_90dee50d);
	spawning::function_adbbb58a(&spawning::function_c24e290c);
	spawning::addsupportedspawnpointtype("fireteam");
	callback::add_callback(#"hash_1019ab4b81d07b35", &function_6f72a4d);
	callback::add_callback(#"hash_7912e21750e4010d", &function_b057aee2);
	callback::on_player_killed(&on_player_killed);
	callback::on_disconnect(&on_player_disconnect);
	level.alwaysusestartspawns = 1;
	level.onstartgametype = &namespace_17baa64d::function_d81f6eb7;
	level.givecustomloadout = &function_511245ae;
	level.var_894b9d74 = 1;
	level.var_405a6738 = 25000;
	level.var_c7f8ccf6 = 50;
	level.var_5c14d2e6 = &function_b82fbeb8;
	level.var_317fb13c = &function_b82fbeb8;
	level.var_5cb948b1 = &function_6de0bb32;
	namespace_c2bb938a::function_b5ee47fa(&function_807b902);
}

/*
	Name: level_init
	Namespace: namespace_bc2b656d
	Checksum: 0x5393797F
	Offset: 0x2F8
	Size: 0x94
	Parameters: 1
	Flags: Event
*/
event level_init(eventstruct)
{
	if(!isstruct(level.territory) || !isstring(level.territory.var_bf5eb349))
	{
		return;
	}
	settings = getscriptbundle(level.territory.var_bf5eb349);
	death_circle::function_5e412e4a(settings);
}

/*
	Name: function_511245ae
	Namespace: namespace_bc2b656d
	Checksum: 0xB17907F2
	Offset: 0x398
	Size: 0x328
	Parameters: 1
	Flags: None
*/
function function_511245ae(takeoldweapon)
{
	if(!isdefined(takeoldweapon))
	{
		takeoldweapon = 0;
	}
	self loadout::init_player(!takeoldweapon);
	if(takeoldweapon)
	{
		oldweapon = self getcurrentweapon();
		weapons = self getweaponslist();
		foreach(weapon in weapons)
		{
			self takeweapon(weapon);
		}
	}
	var_43d69af6 = getweapon(#"null_offhand_primary");
	self giveweapon(var_43d69af6);
	self setweaponammoclip(var_43d69af6, 0);
	self switchtooffhand(var_43d69af6);
	if(self.firstspawn !== 0)
	{
		hud::function_2f66bc37();
	}
	var_2b15e2fe = getweapon(#"hash_5a7fd1af4a1d5c9");
	self giveweapon(var_2b15e2fe);
	self setweaponammoclip(var_2b15e2fe, 0);
	self switchtooffhand(var_2b15e2fe);
	level.var_ef61b4b5 = var_2b15e2fe;
	var_fb6490c8 = self gadgetgetslot(var_2b15e2fe);
	self gadgetpowerset(var_fb6490c8, 0);
	bare_hands = getweapon(#"bare_hands");
	self giveweapon(bare_hands);
	self function_c9a111a(bare_hands);
	self switchtoweapon(bare_hands, 1);
	if(self.firstspawn !== 0)
	{
		self setspawnweapon(bare_hands);
	}
	self.specialty = self getloadoutperks(0);
	self loadout::register_perks();
	return bare_hands;
}

/*
	Name: function_b82fbeb8
	Namespace: namespace_bc2b656d
	Checksum: 0x6FA28BE0
	Offset: 0x6C8
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_b82fbeb8()
{
	/#
		assert(isplayer(self));
	#/
	if(!isplayer(self) || !isalive(self))
	{
		return;
	}
	item_world::function_1b11e73c();
	while(isdefined(self) && !isdefined(self.inventory))
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	self namespace_441c2f1c::give_weapon(#"hash_2099525166a32b52");
	self namespace_441c2f1c::function_52df229a(#"hash_837a6ea0c2864a8");
}

/*
	Name: function_6de0bb32
	Namespace: namespace_bc2b656d
	Checksum: 0x7FE72F92
	Offset: 0x7B8
	Size: 0x2D8
	Parameters: 0
	Flags: None
*/
function function_6de0bb32()
{
	/#
		assert(isplayer(self));
	#/
	if(isdefined(self.inventory))
	{
		var_cc6ff6a1 = function_4ba8fde(#"hash_2099525166a32b52").id;
		var_122bdb78 = function_4ba8fde(#"hash_837a6ea0c2864a8").id;
		var_dd8041ff = 0;
		var_348a5219 = 1;
		foreach(var_b619c089 in self.inventory.items)
		{
			var_d8138db2 = var_b619c089.id;
			if(var_d8138db2 == 32767)
			{
				continue;
			}
			if(var_d8138db2 != var_cc6ff6a1)
			{
				var_348a5219 = 0;
				break;
			}
		}
		foreach(var_d8138db2 in self.inventory.ammo)
		{
			if(!var_348a5219)
			{
				break;
			}
			weapon = getweapon(var_95162a97);
			ammostock = self getweaponammostock(weapon);
			if(var_d8138db2 == var_122bdb78)
			{
				var_dd8041ff = ammostock;
				continue;
			}
			if(ammostock > 0)
			{
				var_348a5219 = 0;
				break;
			}
		}
		if(var_348a5219)
		{
			var_375298f3 = function_4ba8fde(#"hash_837a6ea0c2864a8");
			var_95162a97 = namespace_ad5a0cd6::function_f4a8d375(var_375298f3.id);
			item_drop::drop_item(0, var_95162a97, 1, var_dd8041ff, var_375298f3.id, self.origin);
		}
		return !var_348a5219;
	}
	return 1;
}

/*
	Name: function_6f72a4d
	Namespace: namespace_bc2b656d
	Checksum: 0x772D6D80
	Offset: 0xA98
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function function_6f72a4d(params)
{
	players = getplayers(params.team);
	foreach(player in players)
	{
		if(isdefined(player.reinsertionvehicle))
		{
			player.reinsertionvehicle delete();
		}
	}
}

/*
	Name: on_player_killed
	Namespace: namespace_bc2b656d
	Checksum: 0x3B6518BF
	Offset: 0xB60
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function on_player_killed(params)
{
	self.var_26074a5b = undefined;
	if(!isdefined(self.reinsertionvehicle))
	{
		vehicle = spawnvehicle(#"hash_3effd1dd89ee3d36", (0, 0, 0), (0, 0, 0));
		if(isdefined(vehicle))
		{
			vehicle.targetname = "reinsertionvehicle";
			vehicle ghost();
			vehicle notsolid();
			self.reinsertionvehicle = vehicle;
		}
	}
	self thread function_855ba783();
	self thread function_c3144b08();
}

/*
	Name: function_b057aee2
	Namespace: namespace_bc2b656d
	Checksum: 0x887426A9
	Offset: 0xC40
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function function_b057aee2()
{
	players = function_a1ef346b();
	foreach(player in players)
	{
		scoreevents::processscoreevent(#"hash_3f198e388e56ccf5", player);
	}
}

/*
	Name: function_855ba783
	Namespace: namespace_bc2b656d
	Checksum: 0xBE807ABE
	Offset: 0xCF8
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function function_855ba783()
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self waittill(#"spawned");
	if(self.currentspectatingclient > -1)
	{
		self.var_26074a5b = self.currentspectatingclient;
	}
}

/*
	Name: function_c3144b08
	Namespace: namespace_bc2b656d
	Checksum: 0xE806C93B
	Offset: 0xD68
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_c3144b08()
{
	self endon(#"disconnect", #"spawned", #"force_spawn");
	level endon(#"game_ended");
	waitresult = undefined;
	waitresult = self waittill(#"waitingtospawn");
	var_fa9f2461 = waitresult.timeuntilspawn + -0.5;
	if(var_fa9f2461 > 0)
	{
		wait(var_fa9f2461);
	}
	self luinotifyevent(#"hash_175f8739ed7a932", 0);
}

/*
	Name: on_player_disconnect
	Namespace: namespace_bc2b656d
	Checksum: 0x3BCCA6A6
	Offset: 0xE30
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function on_player_disconnect()
{
	if(isdefined(self.reinsertionvehicle))
	{
		self.reinsertionvehicle delete();
	}
}

/*
	Name: function_807b902
	Namespace: namespace_bc2b656d
	Checksum: 0x9F85C962
	Offset: 0xE68
	Size: 0x1D4
	Parameters: 0
	Flags: None
*/
function function_807b902()
{
	if(!isdefined(level.inprematchperiod) || level.inprematchperiod)
	{
		return;
	}
	self thread function_acdf637e();
	player = self function_70f1d702();
	if(isdefined(player))
	{
		if(isdefined(level.deathcircle.var_5c54ab33))
		{
			self function_2ec1bf5c(player.origin);
		}
		else
		{
			fwd = anglestoforward(player.angles);
			var_9f4f9dea = player.origin - (fwd * 1500);
			var_6b4313e9 = player.origin + (fwd * 1500);
			self function_b74c009d(var_9f4f9dea, var_6b4313e9);
		}
	}
	else if(isdefined(level.deathcircle.var_5c54ab33))
	{
		circle = level.deathcircle.var_5c54ab33;
		angle = randomint(360);
		origin = circle.origin + (cos(angle), sin(angle), 0);
		self function_2ec1bf5c(origin);
	}
}

/*
	Name: function_70f1d702
	Namespace: namespace_bc2b656d
	Checksum: 0x723D2A1A
	Offset: 0x1048
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function function_70f1d702()
{
	if(isdefined(self.var_26074a5b))
	{
		player = getentbynum(self.var_26074a5b);
		if(isalive(player) && player.team == self.team)
		{
			return player;
		}
	}
	players = function_a1cff525(self.squad);
	if(players.size > 0)
	{
		return players[randomint(players.size)];
	}
	return undefined;
}

/*
	Name: function_2ec1bf5c
	Namespace: namespace_bc2b656d
	Checksum: 0x52F962B6
	Offset: 0x1110
	Size: 0x36C
	Parameters: 1
	Flags: None
*/
function function_2ec1bf5c(origin)
{
	circle = level.deathcircle.var_5c54ab33;
	var_bab1ee6b = {#radius:circle.radius - 1500, #origin:circle.origin};
	var_d9100e0 = (isdefined(level.deathcircle.var_7aec140c) ? level.deathcircle.var_7aec140c.origin : circle.origin);
	dir = vectornormalize(origin - var_d9100e0);
	var_51c8b128 = death_circle::function_936b3f09(origin, dir, var_bab1ee6b);
	point = (var_51c8b128[0], var_51c8b128[1], 0);
	if(isdefined(level.territory) && isarray(level.territory.bounds) && level.territory.bounds.size > 0)
	{
		inbounds = 0;
		var_ddd29fdc = vectornormalize((var_d9100e0[0], var_d9100e0[1], 0) - point);
		while(!inbounds)
		{
			foreach(bound in level.territory.bounds)
			{
				var_fa52306b = (point[0], point[1], bound.origin[2]);
				if(istouching(var_fa52306b, bound))
				{
					inbounds = 1;
					break;
				}
			}
			if(!inbounds)
			{
				point = point + (var_ddd29fdc * 1000);
			}
		}
	}
	trace = groundtrace(point + vectorscale((0, 0, 1), 20000), point + (vectorscale((0, 0, -1), 10000)), 0, undefined);
	groundpoint = trace[#"position"];
	trace = groundtrace(var_d9100e0 + vectorscale((0, 0, 1), 20000), var_d9100e0 + (vectorscale((0, 0, -1), 10000)), 0, undefined);
	var_6b4313e9 = trace[#"position"];
	self function_b74c009d(groundpoint, var_6b4313e9);
}

/*
	Name: function_b74c009d
	Namespace: namespace_bc2b656d
	Checksum: 0xC6B2D460
	Offset: 0x1488
	Size: 0x18C
	Parameters: 2
	Flags: None
*/
function function_b74c009d(groundpoint, var_6b4313e9)
{
	players = function_c65231e2(self.squad);
	if(players.size <= 0)
	{
		return;
	}
	for(squadindex = 0; squadindex < players.size; squadindex++)
	{
		if(self == players[squadindex])
		{
			break;
		}
	}
	slice = 360 / players.size;
	angle = squadindex * slice;
	r = randomintrange(150, 200);
	xoffset = r * cos(angle);
	yoffset = r * sin(angle);
	zoffset = getdvarint(#"hash_1e5142ed6dd5c6a0", randomintrange(15000, 15100));
	origin = groundpoint + (xoffset, yoffset, zoffset);
	self thread function_2613549d(origin, var_6b4313e9);
}

/*
	Name: function_2613549d
	Namespace: namespace_bc2b656d
	Checksum: 0x5E114CC1
	Offset: 0x1620
	Size: 0x23C
	Parameters: 2
	Flags: None
*/
function function_2613549d(origin, var_6b4313e9)
{
	level endon(#"game_ended");
	self endon(#"disconnect", #"end_respawn");
	self setorigin(origin);
	fwd = var_6b4313e9 - origin;
	fwdangles = vectortoangles(fwd);
	launchvelocity = fwd;
	vehicle = self.reinsertionvehicle;
	if(isdefined(vehicle))
	{
		vehicle.origin = origin;
		vehicle.angles = fwdangles;
		self ghost();
		self notsolid();
		self dontinterpolate();
		self setclientthirdperson(1);
		self function_648c1f6(vehicle, undefined, 0, 180, 180, 180, 180, 0);
		self setplayerangles(fwdangles);
		wait(0);
		self setclientthirdperson(0);
		self startcameratween(0);
		self show();
		self solid();
		self unlink();
		launchvelocity = anglestoforward(self getplayerangles());
	}
	self namespace_67838d10::start_freefall(launchvelocity, 1);
}

/*
	Name: function_acdf637e
	Namespace: namespace_bc2b656d
	Checksum: 0xE83BA203
	Offset: 0x1868
	Size: 0x28
	Parameters: 0
	Flags: Private
*/
function private function_acdf637e()
{
	if(isdefined(level.var_317fb13c))
	{
		self thread [[level.var_317fb13c]]();
	}
}

/*
	Name: function_fd9dd4cc
	Namespace: namespace_bc2b656d
	Checksum: 0xB71D3282
	Offset: 0x1898
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_fd9dd4cc()
{
	players = function_c65231e2(self.squad);
	for(i = 0; i < players.size; i++)
	{
		if(self == players[i])
		{
			return i;
		}
	}
	return 0;
}

