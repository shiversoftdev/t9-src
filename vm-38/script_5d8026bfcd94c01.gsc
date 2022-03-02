#using script_2c49ae69cd8ce30c;
#using script_335d0650ed05d36d;
#using script_44b0b8420eabacad;
#using script_68d2ee1489345a1d;
#using script_b9a55edd207e4ca;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\dogtags.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\util.gsc;

#namespace namespace_f2e23b4a;

/*
	Name: function_b970118
	Namespace: namespace_f2e23b4a
	Checksum: 0x65DF5E21
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b970118()
{
	level notify(1694745276);
}

/*
	Name: function_89f2df9
	Namespace: namespace_f2e23b4a
	Checksum: 0x8D4F2EFC
	Offset: 0x100
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_112a74f076cda31", &function_62730899, undefined, undefined, #"territory");
}

/*
	Name: main
	Namespace: namespace_f2e23b4a
	Checksum: 0x2D749AF9
	Offset: 0x150
	Size: 0x8C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_2938acdc::init();
	spawning::addsupportedspawnpointtype("tdm");
	callback::on_spawned(&on_player_spawned);
	level.var_61d4f517 = 1;
	level.var_febab1ea = #"conf_dogtags_hpc";
	level.var_e7b05b51 = 1;
}

/*
	Name: function_62730899
	Namespace: namespace_f2e23b4a
	Checksum: 0xA8AC6E40
	Offset: 0x1E8
	Size: 0xD4
	Parameters: 0
	Flags: Private
*/
function private function_62730899()
{
	if(isdefined(level.territory) && level.territory.name != "zoo")
	{
		namespace_2938acdc::function_4212369d();
	}
	level.onstartgametype = &onstartgametype;
	player::function_cf3aa03d(&onplayerkilled);
	level.teamscoreperkillconfirmed = getgametypesetting(#"teamscoreperkillconfirmed");
	level.teamscoreperkilldenied = getgametypesetting(#"teamscoreperkilldenied");
}

/*
	Name: onstartgametype
	Namespace: namespace_f2e23b4a
	Checksum: 0x41D7A230
	Offset: 0x2C8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
	dogtags::init();
	if(!util::isoneround())
	{
		level.displayroundendtext = 1;
	}
}

/*
	Name: function_79b13f76
	Namespace: namespace_f2e23b4a
	Checksum: 0x2B1B9A7D
	Offset: 0x308
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_79b13f76(attacker)
{
	/#
		if(abs(level.mapcenter[2] + self.origin[2]) > 100000)
		{
			return;
		}
	#/
	var_e60fd3b5 = 1;
	for(index = 0; index < var_e60fd3b5; index++)
	{
		var_2636e48 = (randomintrange(-20, 20), randomintrange(-20, 20), 0) * index;
		level thread dogtags::spawn_dog_tag(self, attacker, &onuse, 0, var_2636e48);
	}
}

/*
	Name: onplayerkilled
	Namespace: namespace_f2e23b4a
	Checksum: 0x9C711CB4
	Offset: 0x400
	Size: 0xFC
	Parameters: 9
	Flags: None
*/
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(!isplayer(psoffsettime) || psoffsettime.team == self.team)
	{
		return;
	}
	if(!isdefined(killstreaks::get_killstreak_for_weapon(deathanimduration)) || is_true(level.killstreaksgivegamescore))
	{
		psoffsettime globallogic_score::giveteamscoreforobjective(psoffsettime.team, level.teamscoreperkill);
	}
	function_79b13f76(psoffsettime);
}

/*
	Name: onuse
	Namespace: namespace_f2e23b4a
	Checksum: 0x5947773E
	Offset: 0x508
	Size: 0x302
	Parameters: 1
	Flags: None
*/
function onuse(player)
{
	tacinsertboost = 0;
	var_5f50a7ed = 0;
	player.pers[#"objectives"]++;
	player.objectives = player.pers[#"objectives"];
	if(!util::function_fbce7263(player.team, self.victimteam))
	{
		tacinsertboost = self.tacinsert;
		if(isdefined(self.attacker) && !util::function_fbce7263(self.attacker.team, self.attackerteam))
		{
			self.attacker luinotifyevent(#"player_callout", 2, #"hash_2645b0c08b8b19b9", player.entnum);
		}
		if(!tacinsertboost)
		{
			player globallogic_score::giveteamscoreforobjective(player.team, level.teamscoreperkilldenied);
		}
	}
	else
	{
		/#
			assert(isdefined(player.lastkillconfirmedtime));
			assert(isdefined(player.lastkillconfirmedcount));
		#/
		/#
		#/
		/#
		#/
		if(isdefined(self.attacker) && util::function_fbce7263(self.attacker.team, player.team))
		{
			self.attacker luinotifyevent(#"player_callout", 2, #"hash_75462478f6a06755", player.entnum);
		}
		player.pers[#"killsconfirmed"]++;
		player.killsconfirmed = player.pers[#"killsconfirmed"];
		player globallogic_score::giveteamscoreforobjective(player.team, level.teamscoreperkillconfirmed);
		if(!tacinsertboost)
		{
			currenttime = gettime();
			if(player.lastkillconfirmedtime + 4000 > currenttime)
			{
				player.lastkillconfirmedcount++;
				if(player.lastkillconfirmedcount >= 3)
				{
					scoreevents::processscoreevent(#"kill_confirmed_multi", player, undefined, undefined);
					player.lastkillconfirmedcount = 0;
				}
			}
			else
			{
				player.lastkillconfirmedcount = 1;
			}
			player.lastkillconfirmedtime = currenttime;
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_f2e23b4a
	Checksum: 0x84A40574
	Offset: 0x818
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self.usingobj = undefined;
	if(spawning::usestartspawns() && !level.ingraceperiod)
	{
		spawning::function_7a87efaa();
	}
	self.lastkillconfirmedtime = 0;
	self.lastkillconfirmedcount = 0;
}

