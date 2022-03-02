#using script_184abbae9afad370;
#using script_57f7003580bb15e0;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_ui.gsc;

#namespace namespace_9fd956a6;

/*
	Name: function_96808cd7
	Namespace: namespace_9fd956a6
	Checksum: 0x960A05EC
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_96808cd7()
{
	level notify(1062963159);
}

#namespace player;

/*
	Name: callback_playermelee
	Namespace: player
	Checksum: 0xC8AD0438
	Offset: 0xC8
	Size: 0xC4
	Parameters: 8
	Flags: Linked
*/
function callback_playermelee(eattacker, idamage, weapon, vorigin, vdir, boneindex, shieldhit, frombehind)
{
	hit = 1;
	if(level.teambased && !self util::isenemyteam(idamage.team))
	{
		if(level.friendlyfire == 0)
		{
			hit = 0;
		}
	}
	self finishmeleehit(idamage, weapon, vorigin, vdir, boneindex, shieldhit, hit, frombehind);
}

/*
	Name: function_74b6d714
	Namespace: player
	Checksum: 0x3FF1E3B3
	Offset: 0x198
	Size: 0x174
	Parameters: 5
	Flags: Linked
*/
function function_74b6d714(attacker, effectname, var_894859a2, var_ab5b905e, weapon)
{
	var_20df3f41 = function_1115bceb(effectname);
	if(isdefined(var_ab5b905e) && var_ab5b905e > 0)
	{
		duration = var_ab5b905e;
	}
	else
	{
		duration = undefined;
	}
	attackerishittingteammate = isplayer(attacker) && self util::isenemyplayer(attacker) == 0 && self != attacker;
	attackerishittingself = isplayer(attacker) && self == attacker;
	if(attackerishittingself && weapon.var_50d2316b)
	{
		return;
	}
	if(attackerishittingteammate && !function_1727a023(0, attacker))
	{
		return;
	}
	if(is_true(self.var_9a9c6a96))
	{
		return;
	}
	self status_effect::status_effect_apply(var_20df3f41, weapon, attacker, undefined, duration, var_894859a2);
}

/*
	Name: function_452827de
	Namespace: player
	Checksum: 0xA99B538B
	Offset: 0x318
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_452827de(damage)
{
	previous_shield_damage = self.shielddamageblocked;
	self.shielddamageblocked = self.shielddamageblocked + damage;
	if(self.shielddamageblocked % 200 < previous_shield_damage % 200)
	{
		score_event = "shield_blocked_damage";
		scoreevents::processscoreevent(score_event, self, undefined, self.currentweapon);
	}
}

/*
	Name: callback_playermigrated
	Namespace: player
	Checksum: 0xE08C4367
	Offset: 0x3A8
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function callback_playermigrated()
{
	/#
		println((("" + self.name) + "") + gettime());
	#/
	if(isdefined(self.connected) && self.connected)
	{
		self globallogic_ui::updateobjectivetext();
	}
	level.hostmigrationreturnedplayercount++;
	if(level.hostmigrationreturnedplayercount >= ((level.players.size * 2) / 3))
	{
		/#
			println("");
		#/
		level notify(#"hostmigration_enoughplayers");
	}
}

/*
	Name: callback_playerlaststand
	Namespace: player
	Checksum: 0x751414BE
	Offset: 0x480
	Size: 0x8C
	Parameters: 10
	Flags: Linked
*/
function callback_playerlaststand(einflictor, eattacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(isdefined(level.var_97c6ee7c))
	{
		[[level.var_97c6ee7c]](einflictor, eattacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration);
	}
}

