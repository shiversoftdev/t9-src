#using script_18309c5377e297c0;
#using script_1c65dbfc2f1c8d8f;
#using script_335d0650ed05d36d;
#using script_348ce871561476c9;
#using script_4108035fe400ce67;
#using script_5209c07c35771d12;
#using script_5495f0bb06045dc7;
#using script_5ebc70029e06b264;
#using script_788472602edbe3b9;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\wz_common\hud.gsc;
#using scripts\wz_common\player.gsc;
#using scripts\wz_common\vehicle.gsc;

#namespace warzone;

/*
	Name: main
	Namespace: warzone
	Checksum: 0x9F7D448C
	Offset: 0xE0
	Size: 0xEC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_17baa64d::init();
	spawning::addsupportedspawnpointtype("tdm");
	callback::function_98a0917d(&function_1bcd6e1e);
	callback::on_spawned(&on_player_spawned);
	level.onstartgametype = &function_d81f6eb7;
	level.onroundswitch = &on_round_switch;
	level.givecustomloadout = &function_511245ae;
	level.var_c4dc9178 = &function_f81c3cc9;
	level.var_5c14d2e6 = &function_b82fbeb8;
}

/*
	Name: function_b82fbeb8
	Namespace: warzone
	Checksum: 0x69985E5
	Offset: 0x1D8
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
	Name: function_d81f6eb7
	Namespace: warzone
	Checksum: 0x8414E3E
	Offset: 0x2C8
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function function_d81f6eb7()
{
	namespace_17baa64d::function_d81f6eb7();
}

/*
	Name: function_1bcd6e1e
	Namespace: warzone
	Checksum: 0x80F724D1
	Offset: 0x2E8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_1bcd6e1e()
{
}

/*
	Name: on_player_spawned
	Namespace: warzone
	Checksum: 0x30F1B1D0
	Offset: 0x2F8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	if(isdefined(self.var_b7cc4567))
	{
		self.var_b7cc4567 = undefined;
		waitframe(1);
		self namespace_4b76712::function_7705a7fc(0);
	}
}

/*
	Name: on_spawn_player
	Namespace: warzone
	Checksum: 0x36A2CD1D
	Offset: 0x338
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function on_spawn_player(predictedspawn)
{
	namespace_17baa64d::on_spawn_player(predictedspawn);
}

/*
	Name: on_round_switch
	Namespace: warzone
	Checksum: 0x96DDBF92
	Offset: 0x368
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function on_round_switch()
{
	gametype::on_round_switch();
	globallogic_score::function_9779ac61();
}

/*
	Name: function_511245ae
	Namespace: warzone
	Checksum: 0xAD3D7438
	Offset: 0x398
	Size: 0x390
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
	if(is_true(getdvarint(#"hash_702972cd357e76c9", 0)))
	{
		self thread function_fd19a11c();
	}
	else
	{
		self thread give_default_class();
	}
	return bare_hands;
}

/*
	Name: give_default_class
	Namespace: warzone
	Checksum: 0xA5FDCFFB
	Offset: 0x730
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function give_default_class()
{
	self endon(#"death");
	waitframe(1);
	item_world::function_1b11e73c();
	while(isdefined(self) && !isdefined(self.inventory))
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	namespace_b376ff3f::function_56a681fb(0);
}

/*
	Name: function_fd19a11c
	Namespace: warzone
	Checksum: 0xA848986E
	Offset: 0x7B0
	Size: 0x15C
	Parameters: 0
	Flags: None
*/
function function_fd19a11c()
{
	self endon(#"death");
	waitframe(1);
	while(!isdefined(self.inventory))
	{
		waitframe(1);
	}
	namespace_b376ff3f::function_56a681fb(0);
	var_3401351 = function_21a3a673(1, 5);
	switch(var_3401351)
	{
		case 1:
		{
			function_6541c917();
			break;
		}
		case 2:
		{
			function_ae5cdb4c();
			break;
		}
		case 3:
		{
			function_a0a43fdb();
			break;
		}
		case 4:
		{
			function_343266f9();
			break;
		}
		case 5:
		{
			function_2e725b79();
			break;
		}
	}
	give_max_ammo();
}

/*
	Name: function_6541c917
	Namespace: warzone
	Checksum: 0xE90BE284
	Offset: 0x918
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_6541c917()
{
	namespace_441c2f1c::give_weapon(#"hash_2099525166a32b52");
	namespace_441c2f1c::give_weapon(#"hash_40c99434f20db4ce");
	namespace_441c2f1c::function_52df229a(#"hash_29548403dc2ff36d");
	namespace_441c2f1c::function_52df229a(#"hash_37c187ff34a0dde1");
}

/*
	Name: function_ae5cdb4c
	Namespace: warzone
	Checksum: 0xB3B01649
	Offset: 0x9A8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_ae5cdb4c()
{
	namespace_441c2f1c::give_weapon(#"hash_2099525166a32b52");
	namespace_441c2f1c::give_weapon(#"hash_64d8fd8f660f9ab5");
	namespace_441c2f1c::function_52df229a(#"hash_29548403dc2ff36d");
	namespace_441c2f1c::function_52df229a(#"hash_37c187ff34a0dde1");
}

/*
	Name: function_a0a43fdb
	Namespace: warzone
	Checksum: 0xA0B9C06F
	Offset: 0xA38
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_a0a43fdb()
{
	namespace_441c2f1c::give_weapon(#"hash_2099525166a32b52");
	namespace_441c2f1c::give_weapon(#"hash_baa4e2b9bab7d92");
	namespace_441c2f1c::function_52df229a(#"hash_29548403dc2ff36d");
	namespace_441c2f1c::function_52df229a(#"hash_37c187ff34a0dde1");
}

/*
	Name: function_343266f9
	Namespace: warzone
	Checksum: 0xE77AD2A0
	Offset: 0xAC8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_343266f9()
{
	namespace_441c2f1c::give_weapon(#"hash_2099525166a32b52");
	namespace_441c2f1c::give_weapon(#"hash_433072676a469971");
	namespace_441c2f1c::function_52df229a(#"hash_29548403dc2ff36d");
	namespace_441c2f1c::function_52df229a(#"hash_37c187ff34a0dde1");
}

/*
	Name: function_2e725b79
	Namespace: warzone
	Checksum: 0x556F7269
	Offset: 0xB58
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_2e725b79()
{
	namespace_441c2f1c::give_weapon(#"hash_2099525166a32b52");
	namespace_441c2f1c::give_weapon(#"hash_4daa744408fbf246");
	namespace_441c2f1c::function_52df229a(#"hash_29548403dc2ff36d");
	namespace_441c2f1c::function_52df229a(#"hash_37c187ff34a0dde1");
}

/*
	Name: give_max_ammo
	Namespace: warzone
	Checksum: 0x25DAEECD
	Offset: 0xBE8
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function give_max_ammo()
{
	ammoitems = array(#"hash_837a6ea0c2864a8", #"hash_1cdb9172a79b9080", #"hash_54f3f08c1d7d45d3", #"hash_4ab594460fa1627b", #"hash_f9e29721ba5715e", #"hash_75bef4d329c1080b");
	foreach(item in ammoitems)
	{
		namespace_441c2f1c::function_52df229a(item, 4);
	}
}

/*
	Name: function_f81c3cc9
	Namespace: warzone
	Checksum: 0x1FA5C74F
	Offset: 0xCF8
	Size: 0x138
	Parameters: 1
	Flags: None
*/
function function_f81c3cc9(player)
{
	if(!is_true(level.droppedtagrespawn))
	{
		return;
	}
	victim = self.victim;
	if(player.pers[#"team"] == self.victimteam)
	{
		player.pers[#"rescues"]++;
		player.rescues = player.pers[#"rescues"];
		if(isdefined(victim))
		{
			if(!level.gameended)
			{
				victim.pers[#"lives"] = 1;
				victim.var_b7cc4567 = {#angles:player.angles, #origin:player.origin + vectorscale((0, 0, 1), 10000)};
				victim thread [[level.spawnclient]]();
				victim notify(#"force_spawn");
			}
		}
	}
}

