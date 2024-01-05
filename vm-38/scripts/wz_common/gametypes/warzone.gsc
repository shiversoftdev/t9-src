#using scripts\wz_common\wz_ignore_systems.gsc;
#using scripts\wz_common\wz_rat.gsc;
#using scripts\wz_common\player.gsc;
#using scripts\wz_common\vehicle.gsc;
#using scripts\wz_common\hud.gsc;
#using scripts\wz_common\wz_loadouts.gsc;
#using script_5495f0bb06045dc7;
#using scripts\core_common\item_inventory.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\gametype.gsc;
#using scripts\core_common\player\player_free_fall.gsc;
#using script_335d0650ed05d36d;
#using script_4108035fe400ce67;
#using scripts\core_common\callbacks_shared.gsc;

#namespace warzone;

/*
	Name: function_ef3b6def
	Namespace: warzone
	Checksum: 0x2693DAFB
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ef3b6def()
{
	level notify(685419667);
}

/*
	Name: main
	Namespace: warzone
	Checksum: 0x947C0898
	Offset: 0x100
	Size: 0xEC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_17baa64d::init();
	spawning::addsupportedspawnpointtype("tdm");
	callback::on_game_playing(&start_warzone);
	callback::on_spawned(&on_player_spawned);
	level.onstartgametype = &on_start_game_type;
	level.onroundswitch = &on_round_switch;
	level.givecustomloadout = &give_custom_loadout;
	level.var_c4dc9178 = &function_f81c3cc9;
	level.var_5c14d2e6 = &function_b82fbeb8;
}

/*
	Name: function_b82fbeb8
	Namespace: warzone
	Checksum: 0x39CA1141
	Offset: 0x1F8
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
	self wz_loadouts::give_weapon(#"hash_2099525166a32b52");
	self wz_loadouts::function_52df229a(#"hash_837a6ea0c2864a8");
}

/*
	Name: on_start_game_type
	Namespace: warzone
	Checksum: 0xDB2A9CBA
	Offset: 0x2E8
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function on_start_game_type()
{
	namespace_17baa64d::on_start_game_type();
}

/*
	Name: start_warzone
	Namespace: warzone
	Checksum: 0x80F724D1
	Offset: 0x308
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function start_warzone()
{
}

/*
	Name: on_player_spawned
	Namespace: warzone
	Checksum: 0x4B366FFB
	Offset: 0x318
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
		self player_free_fall::function_7705a7fc(0);
	}
}

/*
	Name: on_spawn_player
	Namespace: warzone
	Checksum: 0xF1871EEF
	Offset: 0x358
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
	Checksum: 0xD8888DCF
	Offset: 0x388
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
	Name: give_custom_loadout
	Namespace: warzone
	Checksum: 0x7E5C19FB
	Offset: 0x3B8
	Size: 0x390
	Parameters: 1
	Flags: None
*/
function give_custom_loadout(takeoldweapon)
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
	nullprimary = getweapon(#"null_offhand_primary");
	self giveweapon(nullprimary);
	self setweaponammoclip(nullprimary, 0);
	self switchtooffhand(nullprimary);
	if(self.firstspawn !== 0)
	{
		hud::function_2f66bc37();
	}
	healthgadget = getweapon(#"hash_5a7fd1af4a1d5c9");
	self giveweapon(healthgadget);
	self setweaponammoclip(healthgadget, 0);
	self switchtooffhand(healthgadget);
	level.var_ef61b4b5 = healthgadget;
	var_fb6490c8 = self gadgetgetslot(healthgadget);
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
	Checksum: 0xDD1FE7A1
	Offset: 0x750
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
	item_inventory::reset_inventory(0);
}

/*
	Name: function_fd19a11c
	Namespace: warzone
	Checksum: 0x7CF5E90B
	Offset: 0x7D0
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
	item_inventory::reset_inventory(0);
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
	Checksum: 0x64167CA
	Offset: 0x938
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_6541c917()
{
	wz_loadouts::give_weapon(#"hash_2099525166a32b52");
	wz_loadouts::give_weapon(#"hash_40c99434f20db4ce");
	wz_loadouts::function_52df229a(#"hash_29548403dc2ff36d");
	wz_loadouts::function_52df229a(#"hash_37c187ff34a0dde1");
}

/*
	Name: function_ae5cdb4c
	Namespace: warzone
	Checksum: 0x76DA1A5C
	Offset: 0x9C8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_ae5cdb4c()
{
	wz_loadouts::give_weapon(#"hash_2099525166a32b52");
	wz_loadouts::give_weapon(#"hash_64d8fd8f660f9ab5");
	wz_loadouts::function_52df229a(#"hash_29548403dc2ff36d");
	wz_loadouts::function_52df229a(#"hash_37c187ff34a0dde1");
}

/*
	Name: function_a0a43fdb
	Namespace: warzone
	Checksum: 0xC78CA715
	Offset: 0xA58
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_a0a43fdb()
{
	wz_loadouts::give_weapon(#"hash_2099525166a32b52");
	wz_loadouts::give_weapon(#"hash_baa4e2b9bab7d92");
	wz_loadouts::function_52df229a(#"hash_29548403dc2ff36d");
	wz_loadouts::function_52df229a(#"hash_37c187ff34a0dde1");
}

/*
	Name: function_343266f9
	Namespace: warzone
	Checksum: 0x591F68DB
	Offset: 0xAE8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_343266f9()
{
	wz_loadouts::give_weapon(#"hash_2099525166a32b52");
	wz_loadouts::give_weapon(#"hash_433072676a469971");
	wz_loadouts::function_52df229a(#"hash_29548403dc2ff36d");
	wz_loadouts::function_52df229a(#"hash_37c187ff34a0dde1");
}

/*
	Name: function_2e725b79
	Namespace: warzone
	Checksum: 0xE0D6B23F
	Offset: 0xB78
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_2e725b79()
{
	wz_loadouts::give_weapon(#"hash_2099525166a32b52");
	wz_loadouts::give_weapon(#"hash_4daa744408fbf246");
	wz_loadouts::function_52df229a(#"hash_29548403dc2ff36d");
	wz_loadouts::function_52df229a(#"hash_37c187ff34a0dde1");
}

/*
	Name: give_max_ammo
	Namespace: warzone
	Checksum: 0xF1B9D799
	Offset: 0xC08
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function give_max_ammo()
{
	ammoitems = array(#"hash_837a6ea0c2864a8", #"hash_1cdb9172a79b9080", #"hash_54f3f08c1d7d45d3", #"hash_4ab594460fa1627b", #"hash_f9e29721ba5715e", #"hash_75bef4d329c1080b");
	foreach(item in ammoitems)
	{
		wz_loadouts::function_52df229a(item, 4);
	}
}

/*
	Name: function_f81c3cc9
	Namespace: warzone
	Checksum: 0xAC67C33D
	Offset: 0xD18
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

