#using script_184abbae9afad370;
#using script_18f0d22c75b141a7;
#using script_1cc417743d7c262d;
#using script_2c49ae69cd8ce30c;
#using script_2c74a7b5eea1ec89;
#using script_2dc48f46bfeac894;
#using script_32c8b5b0eb2854f3;
#using script_35b5ff21c2a0960f;
#using script_3f27a7b2232674db;
#using script_3f9e54c7a9a7e1e2;
#using script_47fb62300ac0bd60;
#using script_5399f402045d7abd;
#using script_545a0bac37bda541;
#using script_6167e26342be354b;
#using script_66052559f4fc2bf9;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_70a43d6ba27cff6a;
#using script_7133a4d461308099;
#using script_725554a59d6a75b9;
#using script_7a8059ca02b7b09e;
#using script_7bafaa95bb1b427e;
#using script_7f6cd71c43c45c57;
#using script_caab14e8a60767c;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\medals_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\mp_common\gametypes\deathicons.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\userspawnselection.gsc;
#using scripts\mp_common\util.gsc;

#namespace player_killed;

/*
	Name: function_5c8aacf6
	Namespace: player_killed
	Checksum: 0x6669153F
	Offset: 0x780
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5c8aacf6()
{
	level notify(858581791);
}

#namespace player;

/*
	Name: function_df36a02d
	Namespace: player
	Checksum: 0xC6D53934
	Offset: 0x7A0
	Size: 0x2A4
	Parameters: 3
	Flags: Linked
*/
function function_df36a02d(attacker, weapon, mod)
{
	if(isdefined(weapon))
	{
		var_2f9ea2b9 = weapons::getbaseweapon(weapon);
		baseweaponindex = getbaseweaponitemindex(var_2f9ea2b9);
		self clientfield::set_player_uimodel("huditems.killedByItemIndex", baseweaponindex);
	}
	else
	{
		self clientfield::set_player_uimodel("huditems.killedByItemIndex", 0);
	}
	if(isdefined(attacker))
	{
		self clientfield::set_player_uimodel("huditems.killedByEntNum", attacker getentitynumber());
	}
	else
	{
		self clientfield::set_player_uimodel("huditems.killedByEntNum", 15);
	}
	if(isdefined(mod))
	{
		var_19b57d54 = function_4a856ead(mod);
		if(mod != "MOD_META")
		{
			if(attacker === self)
			{
				var_19b57d54 = function_4a856ead("MOD_SUICIDE");
			}
			else if(weapon === level.weaponnone)
			{
				var_19b57d54 = function_4a856ead("MOD_UNKNOWN");
				self clientfield::set_player_uimodel("huditems.killedByEntNum", self getentitynumber());
			}
		}
		self clientfield::set_player_uimodel("huditems.killedByMOD", var_19b57d54);
	}
	else
	{
		self clientfield::set_player_uimodel("huditems.killedByEntNum", 15);
	}
	attachments = function_30d57f0e(weapon);
	self clientfield::set_player_uimodel("huditems.killedByAttachmentCount", attachments.size);
	for(var_20d65af5 = 0; var_20d65af5 < attachments.size && var_20d65af5 < 5; var_20d65af5++)
	{
		self clientfield::set_player_uimodel("huditems.killedByAttachment" + var_20d65af5, attachments[var_20d65af5]);
	}
}

/*
	Name: function_7622d447
	Namespace: player
	Checksum: 0x4CBFA8AA
	Offset: 0xA50
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_7622d447(attacker)
{
	if(isdefined(self.attackers))
	{
		for(j = 0; j < self.attackers.size; j++)
		{
			player = self.attackers[j];
			if(self function_ca27b62b(attacker, player))
			{
				damage_done = self.attackerdamage[player.clientid].damage;
				einflictor = self.attackerdamage[player.clientid].einflictor;
				weapon = self.attackerdamage[player.clientid].weapon;
				player function_b8871aa2(einflictor, self, damage_done, weapon);
			}
		}
	}
}

/*
	Name: function_7eea9ada
	Namespace: player
	Checksum: 0x12B8BDEC
	Offset: 0xB60
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_7eea9ada(player)
{
	var_1119082e = gettime();
	if(isdefined(self.laststandparams.laststandstarttime))
	{
		var_1119082e = self.laststandparams.laststandstarttime;
	}
	if(isdefined(level.var_c77de7d6) && level.var_c77de7d6 > 0 && var_1119082e > ((int(level.var_c77de7d6 * 1000)) + self.attackerdamage[player.clientid].lastdamagetime))
	{
		return false;
	}
	return true;
}

/*
	Name: function_ca27b62b
	Namespace: player
	Checksum: 0xA7890D69
	Offset: 0xC20
	Size: 0xEE
	Parameters: 2
	Flags: Linked
*/
function function_ca27b62b(attacker, player)
{
	if(!isdefined(player))
	{
		return false;
	}
	if(isdefined(attacker) && player util::isenemyteam(attacker.team))
	{
		return false;
	}
	if(self.attackerdamage[player.clientid].damage == 0)
	{
		return false;
	}
	if(is_true(level.var_f68b214e) && isdefined(player.deathtime) && player.deathtime > self.attackerdamage[player.clientid].lastdamagetime)
	{
		return false;
	}
	if(!self function_7eea9ada(player))
	{
		return false;
	}
	return true;
}

/*
	Name: function_284c61bd
	Namespace: player
	Checksum: 0xA2C12012
	Offset: 0xD18
	Size: 0x204
	Parameters: 3
	Flags: Linked
*/
function function_284c61bd(attacker, meansofdeath, bledout)
{
	if(!isdefined(bledout))
	{
		bledout = 0;
	}
	if(isdefined(self.attackers) && isdefined(attacker))
	{
		for(j = 0; j < self.attackers.size; j++)
		{
			player = self.attackers[j];
			if(!isdefined(player))
			{
				continue;
			}
			if(self.team == player.team)
			{
				continue;
			}
			if(self.attackerdamage[player.clientid].damage == 0)
			{
				continue;
			}
			if(is_true(level.var_f68b214e) && isdefined(player.deathtime) && player.deathtime > self.attackerdamage[player.clientid].lastdamagetime)
			{
				continue;
			}
			if(!self function_7eea9ada(player) && !bledout)
			{
				continue;
			}
			if(isdefined(self.laststandparams.attacker))
			{
				attacker = self.laststandparams.attacker;
			}
			einflictor = self.attackerdamage[player.clientid].einflictor;
			weapon = self.attackerdamage[player.clientid].weapon;
			if(player != attacker)
			{
				meansofdeath = self.attackerdamage[player.clientid].meansofdeath;
			}
			self function_4e3e8bee(einflictor, player, meansofdeath, weapon, attacker);
		}
	}
}

/*
	Name: function_66cec679
	Namespace: player
	Checksum: 0xC3E43C47
	Offset: 0xF28
	Size: 0xE6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_66cec679()
{
	team = self.team;
	teammates = getplayers(team);
	foreach(player in teammates)
	{
		if(player == self)
		{
			continue;
		}
		if(player.sessionstate == "spectator")
		{
			player.spectatorclient = self getentitynumber();
		}
	}
}

/*
	Name: function_448f7ed2
	Namespace: player
	Checksum: 0x53963F5C
	Offset: 0x1018
	Size: 0x1AE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_448f7ed2()
{
	if(!is_true(level.var_3e5fe4d1))
	{
		return false;
	}
	if(level.var_f2814a96 !== 0 && level.var_f2814a96 !== 2)
	{
		return false;
	}
	if(is_true(level.wave_spawn))
	{
		time = gettime();
		team = self.pers[#"team"];
		if(isdefined(team) && isdefined(level.lastwave) && isdefined(level.lastwave[team]) && isdefined(level.wavedelay) && isdefined(level.wavedelay[team]))
		{
			wavedelay = int(level.wavedelay[team] * 1000);
			lasttime = time - level.lastwave[team];
			timediff = wavedelay - lasttime;
			var_4e7f2872 = isdefined(level.var_75db41a7) && time >= level.var_75db41a7;
			if(timediff > 5000 && !var_4e7f2872)
			{
				return true;
			}
		}
	}
	else
	{
		return true;
	}
	return false;
}

/*
	Name: callback_playerkilled
	Namespace: player
	Checksum: 0xC8F64ADD
	Offset: 0x11D0
	Size: 0xCCC
	Parameters: 11
	Flags: Linked
*/
function callback_playerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration, enteredresurrect)
{
	if(!isdefined(enteredresurrect))
	{
		enteredresurrect = 0;
	}
	profilelog_begintiming(7, "ship");
	self endon(#"spawned");
	self.var_4ef33446 = smeansofdeath == "MOD_META";
	/#
		if(getdvarint(#"hash_2517ca1e8454c3c8", 0) == 1)
		{
			self.var_4ef33446 = 1;
		}
	#/
	if(gamestate::is_game_over())
	{
		post_game_death(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
		return;
	}
	if(self.sessionteam == #"spectator")
	{
		return;
	}
	util::function_1ea0b2ce();
	level.var_445b1bca = gettime();
	self needsrevive(0);
	if(isdefined(self.burning) && self.burning == 1)
	{
		self setburn(0);
	}
	self.cur_kill_streak = 0;
	self.suicide = 0;
	self.teamkilled = 0;
	countdeath = !is_true(self.var_cee93f5) && !self.var_4ef33446;
	if(countdeath)
	{
		if(!isdefined(self.var_a7d7e50a))
		{
			self.var_a7d7e50a = 0;
		}
		level.deaths[self.team]++;
		self.var_a7d7e50a++;
		start_generator_captureshouldshowpain();
	}
	attacker callback::callback(#"hash_1c99870b7a855dd0");
	self thread globallogic_audio::flush_leader_dialog_key_on_player("equipmentDestroyed");
	weapon = update_weapon(einflictor, weapon);
	pixbeginevent();
	self thread audio::function_30d4f8c4(attacker, smeansofdeath, weapon);
	wasinlaststand = 0;
	bledout = 0;
	deathtimeoffset = 0;
	attackerstance = undefined;
	self.laststandthislife = undefined;
	self.vattackerorigin = undefined;
	self.spawn.response = undefined;
	self function_df36a02d(attacker, weapon, smeansofdeath);
	weapon_at_time_of_death = self getcurrentweapon();
	var_8efc9727 = isplayer(attacker) && self util::isenemyplayer(attacker) == 0;
	var_41c4d474 = isplayer(attacker) && self == attacker;
	var_f90950bd = (isdefined(attacker) ? attacker : self);
	var_a44c7fd8 = {#hash_10d87328:function_f8d53445(), #shitloc:shitloc, #vdir:vdir, #hash_fd90b0bb:var_fd90b0bb, #weapon:weapon, #smeansofdeath:smeansofdeath, #idamage:idamage, #hash_83634238:(isplayer(var_f90950bd) ? var_f90950bd getplayerangles() : var_f90950bd.angles), #attackerorigin:var_f90950bd.origin, #attacker:attacker, #einflictor:einflictor, #victimweapon:self.currentweapon, #hash_5fceefd4:self getplayerangles(), #victimorigin:self.origin};
	if(isdefined(self.uselaststandparams) && enteredresurrect == 0)
	{
		self.uselaststandparams = undefined;
		/#
			assert(isdefined(self.laststandparams));
		#/
		if(isdefined(self.laststandparams) && (!level.teambased || (!isdefined(attacker) || !isplayer(attacker) || !var_8efc9727 || var_41c4d474)))
		{
			einflictor = self.laststandparams.einflictor;
			attacker = self.laststandparams.attacker;
			attackerstance = self.laststandparams.attackerstance;
			idamage = self.laststandparams.idamage;
			smeansofdeath = self.laststandparams.smeansofdeath;
			/#
				assert(isdefined(smeansofdeath));
			#/
			weapon = self.laststandparams.weapon;
			var_fd90b0bb = self.laststandparams.var_fd90b0bb;
			vdir = self.laststandparams.vdir;
			shitloc = self.laststandparams.shitloc;
			self.vattackerorigin = self.laststandparams.vattackerorigin;
			self.killcam_entity_info_cached = self.laststandparams.killcam_entity_info_cached;
			if(!is_true(self.laststandparams.var_59b19c1b))
			{
				deathtimeoffset = (float(gettime() - self.laststandparams.laststandstarttime)) / 1000;
			}
			bledout = self.laststandparams.bledout;
			wasinlaststand = 1;
			var_8efc9727 = isplayer(attacker) && self util::isenemyplayer(attacker) == 0;
			var_41c4d474 = isplayer(attacker) && self == attacker;
		}
	}
	self stopsounds();
	var_c391d0a8 = self function_fc51dcf8(attacker, weapon, smeansofdeath, shitloc, var_41c4d474 || var_8efc9727);
	params = {#hash_c0577970:var_c391d0a8.assisted_suicide, #laststandparams:self.laststandparams, #deathanimduration:deathanimduration, #psoffsettime:psoffsettime, #shitloc:shitloc, #vdir:vdir, #hash_fd90b0bb:var_fd90b0bb, #weapon:weapon, #smeansofdeath:smeansofdeath, #idamage:idamage, #eattacker:attacker, #einflictor:einflictor, #victim:self};
	self callback::callback(#"on_player_killed", params);
	if(isdefined(var_c391d0a8.attacker))
	{
		attacker = var_c391d0a8.attacker;
		smeansofdeath = var_c391d0a8.smeansofdeath;
		shitloc = var_c391d0a8.shitloc;
		weapon = var_c391d0a8.weapon;
	}
	self function_5f6cde96(var_41c4d474, var_8efc9727);
	var_c391d0a8.attacker = function_4ac2aefc(attacker, weapon);
	attacker = var_c391d0a8.attacker;
	function_813829e3(einflictor);
	self thread function_8826f676();
	self function_a3030357(var_c391d0a8.var_23da26bf, einflictor, var_c391d0a8.var_60851fcf, var_c391d0a8.var_4b5379af, bledout);
	self function_c2c4d6e9(var_c391d0a8, bledout, enteredresurrect, countdeath);
	pixendevent();
	var_a35e901f = var_a44c7fd8;
	if(isdefined(self.var_5b73c96a))
	{
		self.var_5b73c96a = undefined;
		var_a35e901f = self.laststandparams;
	}
	self function_4a762be0(var_c391d0a8, var_a35e901f, weapon_at_time_of_death, attackerstance, countdeath, var_41c4d474, var_8efc9727, wasinlaststand, bledout, enteredresurrect);
	self function_c220950f(var_c391d0a8, idamage, weapon_at_time_of_death);
	level thread globallogic::updateteamstatus();
	level thread globallogic::updatealivetimes(self.team);
	self thread function_395ef176();
	self weapons::detach_carry_object_model();
	self function_7804764f(var_a35e901f, deathanimduration, psoffsettime, enteredresurrect);
	if(enteredresurrect)
	{
		thread globallogic_spawn::spawnqueuedclient(self.team, attacker);
	}
	self function_ff3ec0d4(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration);
	self function_7622d447();
	self.laststandparams = undefined;
	self.var_a1d415ee = undefined;
	if(isdefined(self.attackers))
	{
		self.attackers = [];
	}
	if(!isdefined(self.killstreak_delay_killcam))
	{
		self thread [[level.spawnplayerprediction]]();
	}
	if(self.currentspectatingclient != -1 && (level.spectatetype == 4 || level.spectatetype == 5) && self.pers[#"team"] != #"spectator")
	{
		function_39a7df61(self);
	}
	profilelog_endtiming(7, "gs=" + game.state);
	self function_42862f77(var_a35e901f, var_c391d0a8.attacker, deathtimeoffset, psoffsettime, deathanimduration, var_8efc9727, var_41c4d474, var_c391d0a8.assisted_suicide, enteredresurrect);
	function_93115f65(enteredresurrect);
}

/*
	Name: should_do_killcam
	Namespace: player
	Checksum: 0x1757A381
	Offset: 0x1EA8
	Size: 0xDC
	Parameters: 4
	Flags: Linked, Private
*/
function private should_do_killcam(attacker, einflictor, var_41c4d474, assistedsuicide)
{
	/#
		if(getdvarint(#"scr_forcekillcam", 0) != 0)
		{
			return true;
		}
	#/
	if(isdefined(self.killstreak_delay_killcam))
	{
		return false;
	}
	if(var_41c4d474)
	{
		return false;
	}
	if(assistedsuicide)
	{
		return false;
	}
	if(level.killcammode == 2)
	{
		return false;
	}
	if(self.var_4ef33446)
	{
		return false;
	}
	if(isplayer(attacker))
	{
		return true;
	}
	if(isdefined(einflictor.killcament))
	{
		return true;
	}
	return false;
}

/*
	Name: function_388d8a53
	Namespace: player
	Checksum: 0xF9A9C617
	Offset: 0x1F90
	Size: 0x10A
	Parameters: 4
	Flags: Linked, Private
*/
function private function_388d8a53(attacker, einflictor, var_41c4d474, assistedsuicide)
{
	var_c547267e = -1;
	if(!var_41c4d474 && !assistedsuicide && isplayer(attacker))
	{
		var_c547267e = attacker getentitynumber();
	}
	if(isdefined(einflictor.killcament) && !isplayer(attacker))
	{
		var_c547267e = self getentitynumber();
	}
	/#
		if(getdvarint(#"scr_forcekillcam", 0) != 0 && var_c547267e < 0)
		{
			var_c547267e = self getentitynumber();
		}
	#/
	return var_c547267e;
}

/*
	Name: function_42862f77
	Namespace: player
	Checksum: 0xB42647C6
	Offset: 0x20A8
	Size: 0xADC
	Parameters: 9
	Flags: Linked, Private
*/
function private function_42862f77(var_a2f12b49, attacker, deathtimeoffset, psoffsettime, deathanimduration, var_8efc9727, var_41c4d474, assistedsuicide, enteredresurrect)
{
	if(isdefined(self.killcam_entity_info_cached))
	{
		killcam_entity_info = self.killcam_entity_info_cached;
		self.killcam_entity_info_cached = undefined;
	}
	else
	{
		killcam_entity_info = killcam::get_killcam_entity_info(var_a2f12b49.attacker, var_a2f12b49.einflictor, var_a2f12b49.weapon);
	}
	perks = [];
	killstreaks = globallogic::getkillstreaks(var_a2f12b49.attacker);
	var_c547267e = function_388d8a53(attacker, var_a2f12b49.einflictor, var_41c4d474, assistedsuicide);
	self thread killcam::function_eb3deeec(var_c547267e, self getentitynumber(), killcam_entity_info, var_a2f12b49.weapon, var_a2f12b49.smeansofdeath, self.deathtime, deathtimeoffset, psoffsettime, perks, killstreaks, var_a2f12b49.attacker);
	wasteamkill = var_8efc9727 && (!(var_41c4d474 || assistedsuicide));
	if(wasteamkill == 0 && assistedsuicide == 0 && var_a2f12b49.smeansofdeath != "MOD_SUICIDE" && (!(!isdefined(var_a2f12b49.attacker) || var_a2f12b49.attacker.classname == "trigger_hurt" || var_a2f12b49.attacker.classname == "worldspawn" || var_41c4d474 || isdefined(var_a2f12b49.attacker.disablefinalkillcam))))
	{
		level thread killcam::record_settings(var_c547267e, self getentitynumber(), killcam_entity_info, var_a2f12b49.weapon, var_a2f12b49.smeansofdeath, self.deathtime, deathtimeoffset, psoffsettime, perks, killstreaks, var_a2f12b49.attacker);
		var_c8fa9c41 = (isplayer(var_a2f12b49.attacker) ? var_a2f12b49.attacker getxuid() : 0);
		level thread potm::function_5523a49a(#"kill", var_c547267e, var_c8fa9c41, self, killcam_entity_info, var_a2f12b49.weapon, var_a2f12b49.smeansofdeath, self.deathtime, deathtimeoffset, psoffsettime, perks, killstreaks, var_a2f12b49.attacker, var_a2f12b49.einflictor);
	}
	if(enteredresurrect)
	{
		return;
	}
	livesleft = !(level.numlives && !self.pers[#"lives"]) && (!(level.numteamlives && !game.lives[self.team]));
	timeuntilspawn = globallogic_spawn::timeuntilspawn(1);
	if(livesleft)
	{
		self function_6bf621ea(#"hash_4dd5ff66125d2a91", 2, int((timeuntilspawn + deathanimduration) + (level.playerrespawndelay * 1000) - 250), self getentitynumber());
	}
	if(!self.var_4ef33446)
	{
		if(is_true(self.var_342564dd) && self == var_a2f12b49.attacker)
		{
			waitframe(1);
		}
		else
		{
			wait(0.25);
		}
	}
	self.cancelkillcam = 0;
	if(!userspawnselection::isspawnselectenabled())
	{
		self thread killcam::cancel_on_use();
	}
	if(!self.var_4ef33446)
	{
		self watch_death(var_a2f12b49.weapon, var_a2f12b49.attacker, var_a2f12b49.smeansofdeath, deathanimduration);
	}
	self.respawntimerstarttime = gettime();
	keep_deathcam = 0;
	if(level.killcammode == 2)
	{
		self.var_686890d5 = undefined;
		function_fcaec253();
		self.sessionstate = "dead";
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self.spectatekillcam = 0;
		livesleft = !(level.numlives && !self.pers[#"lives"]) && (!(level.numteamlives && !game.lives[self.team]));
		if(livesleft)
		{
			if(is_true(level.spawnsystem.var_f220c297))
			{
				self thread [[level.spawnspectator]](self.origin + vectorscale((0, 0, 1), 60), self.angles);
			}
			else
			{
				function_93115f65();
			}
		}
		else if(!is_true(self.var_686890d5))
		{
			self thread [[level.spawnspectator]](self.origin + vectorscale((0, 0, 1), 60), self.angles);
		}
		return;
	}
	if(game.state != #"playing")
	{
		return;
	}
	if(isdefined(self.overrideplayerdeadstatus))
	{
		keep_deathcam = self [[self.overrideplayerdeadstatus]]();
	}
	dokillcam = self should_do_killcam(attacker, var_a2f12b49.einflictor, var_41c4d474, assistedsuicide);
	if(!self.cancelkillcam && dokillcam && level.killcammode == 1 && wasteamkill == 0)
	{
		self clientfield::set_player_uimodel("hudItems.killcamActive", 1);
		livesleft = !(level.numlives && !self.pers[#"lives"]) && (!(level.numteamlives && !game.lives[self.team]));
		timeuntilspawn = globallogic_spawn::timeuntilspawn(1);
		willrespawnimmediately = livesleft && timeuntilspawn <= 0 && !level.playerqueuedrespawn && !userspawnselection::isspawnselectenabled();
		self killcam::killcam(var_c547267e, self getentitynumber(), killcam_entity_info, var_a2f12b49.weapon, var_a2f12b49.smeansofdeath, self.deathtime, deathtimeoffset, psoffsettime, willrespawnimmediately, globallogic_utils::timeuntilroundend(), perks, killstreaks, var_a2f12b49.attacker, keep_deathcam);
		if(function_f99d2668())
		{
			self luinotifyevent(#"hash_5b2d65a026de792d", 0);
		}
	}
	else if(self.cancelkillcam)
	{
		if(isdefined(self.killcamsskipped))
		{
			self.killcamsskipped++;
		}
		else
		{
			self.killcamsskipped = 1;
		}
	}
	self clientfield::set_player_uimodel("hudItems.killcamActive", 0);
	self function_7b0f4389();
	if(self.var_4ef33446)
	{
		waitframe(1);
	}
	secondary_deathcam = 0;
	timeuntilspawn = globallogic_spawn::timeuntilspawn(1);
	shoulddoseconddeathcam = timeuntilspawn > 0;
	if(shoulddoseconddeathcam && isdefined(self.secondarydeathcamtime))
	{
		secondary_deathcam = self [[self.secondarydeathcamtime]]();
	}
	if(secondary_deathcam > 0 && !self.cancelkillcam)
	{
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self.spectatekillcam = 0;
		globallogic_utils::waitfortimeornotify(secondary_deathcam, "end_death_delay");
		self notify(#"death_delay_finished");
	}
	if(!self.cancelkillcam && dokillcam && level.killcammode == 1 && keep_deathcam)
	{
		self.sessionstate = "dead";
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self.spectatekillcam = 0;
	}
	function_fcaec253();
}

/*
	Name: function_fcaec253
	Namespace: player
	Checksum: 0xE60F2D7D
	Offset: 0x2B90
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function function_fcaec253()
{
	if(!isdefined(level.var_d1455682.var_87a42f09) || level.var_d1455682.var_87a42f09.size == 0)
	{
		return;
	}
	if(!gamestate::is_state(#"pregame") && !gamestate::is_game_over())
	{
		if(teams::is_all_dead(self.team))
		{
			self function_66cec679();
			self thread namespace_81c567a8::function_1caf5c87(self.team);
		}
		else
		{
			if(function_21695e86())
			{
				if(self function_448f7ed2())
				{
					self thread namespace_81c567a8::function_b3964dc9();
				}
			}
			else
			{
				self thread namespace_81c567a8::function_9b2bd02c();
			}
		}
	}
}

/*
	Name: function_7804764f
	Namespace: player
	Checksum: 0xC28EADF2
	Offset: 0x2CC8
	Size: 0x286
	Parameters: 4
	Flags: Linked, Private
*/
function private function_7804764f(var_a2f12b49, deathanimduration, psoffsettime, enteredresurrect)
{
	pixbeginevent();
	if(enteredresurrect == 0)
	{
		var_86825274 = var_a2f12b49.weapon;
		if(weapons::ismeleemod(var_a2f12b49.smeansofdeath) && var_86825274.type != "melee")
		{
			var_86825274 = level.weaponnone;
		}
		body = self cloneplayer(deathanimduration, var_86825274, var_a2f12b49.attacker, var_a2f12b49.vdir);
		if(isdefined(body) && !level.inprematchperiod)
		{
			if(is_true(self.var_6f9e9dc9))
			{
				body.var_6f9e9dc9 = 1;
			}
			vattackerorigin = undefined;
			if(isdefined(var_a2f12b49.attacker))
			{
				vattackerorigin = var_a2f12b49.attacker.origin;
			}
			self function_10f480f(var_a2f12b49, vattackerorigin, deathanimduration, body);
			self battlechatter::play_death_vox(body, var_a2f12b49.attacker, var_a2f12b49.weapon, var_a2f12b49.smeansofdeath);
			var_a1d415ee = self.var_a1d415ee;
			if(isdefined(var_a1d415ee))
			{
				globallogic::doweaponspecificcorpseeffects(body, var_a1d415ee.einflictor, var_a1d415ee.attacker, var_a1d415ee.idamage, var_a1d415ee.smeansofdeath, var_a1d415ee.weapon, var_a1d415ee.var_fd90b0bb, var_a1d415ee.vdir, var_a1d415ee.shitloc, psoffsettime);
			}
			else if(!isdefined(self.laststandparams) || !is_true(self.laststandparams.bledout))
			{
				globallogic::doweaponspecificcorpseeffects(body, var_a2f12b49.einflictor, var_a2f12b49.attacker, var_a2f12b49.idamage, var_a2f12b49.smeansofdeath, var_a2f12b49.weapon, var_a2f12b49.var_fd90b0bb, var_a2f12b49.vdir, var_a2f12b49.shitloc, psoffsettime);
			}
		}
	}
	pixendevent();
}

/*
	Name: function_c220950f
	Namespace: player
	Checksum: 0x9CF3CA5F
	Offset: 0x2F58
	Size: 0x7AC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_c220950f(var_c391d0a8, idamage, weapon_at_time_of_death)
{
	killer = undefined;
	killerloadoutindex = -1;
	killerwasads = 0;
	killerinvictimfov = 0;
	victiminkillerfov = 0;
	weapon = var_c391d0a8.weapon;
	var_76d450bd = function_b14806c6(self player_role::get(), currentsessionmode());
	if(isplayer(var_c391d0a8.attacker))
	{
		var_a48b1a67 = function_b14806c6(var_c391d0a8.attacker player_role::get(), currentsessionmode());
		killer = var_c391d0a8.attacker;
		killerloadoutindex = var_c391d0a8.attacker.class_num;
		killerwasads = var_c391d0a8.attacker playerads() >= 1;
		killerinvictimfov = util::within_fov(self.origin, self.angles, killer.origin, self.fovcosine);
		victiminkillerfov = util::within_fov(killer.origin, killer.angles, self.origin, killer.fovcosine);
		var_c144d535 = (isdefined(self.currentweapon) ? self.currentweapon.name : "");
		var_db4add2b = (isplayer(killer) ? killer.origin : (0, 0, 0));
		if(killstreaks::is_killstreak_weapon(weapon))
		{
			killstreak = killstreaks::get_killstreak_for_weapon_for_stats(weapon);
			bb::function_c3b9e07f(var_c391d0a8.attacker, var_db4add2b, var_a48b1a67, weapon.name, self, self.origin, var_76d450bd, var_c144d535, idamage, var_c391d0a8.smeansofdeath, var_c391d0a8.shitloc, 1, killstreak);
		}
		else
		{
			bb::function_c3b9e07f(var_c391d0a8.attacker, var_db4add2b, var_a48b1a67, weapon.name, self, self.origin, var_76d450bd, var_c144d535, idamage, var_c391d0a8.smeansofdeath, var_c391d0a8.shitloc, 1, undefined);
		}
	}
	else
	{
		bb::function_c3b9e07f(undefined, undefined, undefined, weapon.name, self, self.origin, var_76d450bd, undefined, idamage, var_c391d0a8.smeansofdeath, var_c391d0a8.shitloc, 1, undefined);
	}
	victimweapon = undefined;
	victimweaponpickedup = 0;
	victimkillstreakweaponindex = 0;
	var_8926cc9f = 0;
	if(isdefined(weapon_at_time_of_death))
	{
		victimweapon = weapon_at_time_of_death;
		if(isdefined(self.pickedupweapons) && isdefined(self.pickedupweapons[victimweapon]))
		{
			victimweaponpickedup = 1;
		}
		if(killstreaks::is_killstreak_weapon(victimweapon))
		{
			killstreak = killstreaks::get_killstreak_for_weapon_for_stats(victimweapon);
			if(isdefined(level.killstreaks[killstreak].menuname))
			{
				var_8926cc9f = 1;
				victimkillstreakweaponindex = level.killstreakindices[level.killstreaks[killstreak].menuname];
				if(!isdefined(victimkillstreakweaponindex))
				{
					var_8926cc9f = 0;
					victimkillstreakweaponindex = 0;
				}
			}
		}
	}
	victimwasads = self playerads() >= 1;
	killerweaponpickedup = 0;
	killerkillstreakweaponindex = 0;
	var_28af8061 = 0;
	if(isdefined(weapon))
	{
		if(isdefined(killer) && isdefined(killer.pickedupweapons) && isdefined(killer.pickedupweapons[weapon]))
		{
			killerweaponpickedup = 1;
		}
		if(killstreaks::is_killstreak_weapon(weapon))
		{
			killstreak = killstreaks::get_killstreak_for_weapon_for_stats(weapon);
			if(isdefined(level.killstreaks[killstreak].menuname))
			{
				var_28af8061 = 1;
				killerkillstreakweaponindex = level.killstreakindices[level.killstreaks[killstreak].menuname];
				if(!isdefined(killerkillstreakweaponindex))
				{
					var_28af8061 = 0;
					killerkillstreakweaponindex = 0;
				}
			}
		}
	}
	var_989983f4 = spawnstruct();
	var_989983f4.var_b4b63e47 = self.class_num;
	var_989983f4.victimweaponpickedup = victimweaponpickedup;
	var_989983f4.victimwasads = victimwasads;
	var_989983f4.killerloadoutindex = killerloadoutindex;
	var_989983f4.killerweaponpickedup = killerweaponpickedup;
	var_989983f4.killerwasads = killerwasads;
	var_989983f4.victiminkillerfov = victiminkillerfov;
	var_989983f4.killerinvictimfov = killerinvictimfov;
	var_989983f4.killerkillstreakweaponindex = killerkillstreakweaponindex;
	var_989983f4.victimkillstreakweaponindex = victimkillstreakweaponindex;
	var_989983f4.var_28af8061 = var_28af8061;
	var_989983f4.var_8926cc9f = var_8926cc9f;
	matchrecordlogadditionaldeathinfo(self, killer, victimweapon, weapon, var_989983f4);
	self namespace_42fe87d::record_special_move_data_for_life(killer);
	/#
		attackerstring = "";
		if(isdefined(killer))
		{
			attackerstring = ((killer getxuid() + "") + killer.name) + "";
		}
		print(((((((((((("" + var_c391d0a8.smeansofdeath) + "") + weapon.name) + "") + attackerstring) + "") + idamage) + "") + (isdefined(var_c391d0a8.shitloc) ? var_c391d0a8.shitloc : "") + "") + int(self.origin[0]) + "") + int(self.origin[1]) + "") + int(self.origin[2]));
	#/
}

/*
	Name: function_4a762be0
	Namespace: player
	Checksum: 0xD7583CEB
	Offset: 0x3710
	Size: 0xBCE
	Parameters: 10
	Flags: Linked, Private
*/
function private function_4a762be0(var_c391d0a8, var_a44c7fd8, weapon_at_time_of_death, attackerstance, countdeath, var_41c4d474, var_8efc9727, wasinlaststand, bledout, enteredresurrect)
{
	pixbeginevent();
	awardassists = 0;
	wasteamkill = 0;
	wassuicide = 0;
	if(wasinlaststand)
	{
		function_caabcf70(self, var_a44c7fd8, self.laststandparams, self.var_a1d415ee);
	}
	if(!self.var_4ef33446)
	{
		self function_abbc84ad(var_c391d0a8.attacker, var_c391d0a8.weapon, var_c391d0a8.smeansofdeath, var_a44c7fd8.einflictor);
	}
	if(var_c391d0a8.assisted_suicide)
	{
		scoreevents::processscoreevent(#"assisted_suicide", var_c391d0a8.attacker, self, var_c391d0a8.weapon);
		level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#hash_bdc4bbd2:#"assistedsuicide", #player:self});
	}
	if(countdeath)
	{
		scoreevents::processscoreevent(#"death", self, self, var_c391d0a8.weapon);
	}
	if(isplayer(var_c391d0a8.attacker))
	{
		if(var_41c4d474 || var_c391d0a8.assisted_suicide == 1)
		{
			if(countdeath)
			{
				wassuicide = 1;
				awardassists = self player_suicide(var_a44c7fd8.einflictor, var_c391d0a8.attacker, var_c391d0a8.smeansofdeath, var_c391d0a8.weapon, var_c391d0a8.shitloc);
				if(var_c391d0a8.assisted_suicide == 1)
				{
					self function_284c61bd(var_c391d0a8.attacker, var_c391d0a8.smeansofdeath);
				}
				if(self.friendlydamage === 1 && level.friendlyfire === 4)
				{
					self team_kill(var_a44c7fd8.einflictor, var_c391d0a8.attacker, var_c391d0a8.smeansofdeath, var_c391d0a8.weapon, var_c391d0a8.shitloc);
				}
			}
		}
		else
		{
			pixbeginevent();
			if(var_8efc9727 && var_c391d0a8.smeansofdeath == "MOD_GRENADE" && level.friendlyfire == 0)
			{
			}
			else
			{
				if(var_8efc9727)
				{
					wasteamkill = 1;
					self team_kill(var_a44c7fd8.einflictor, var_c391d0a8.attacker, var_c391d0a8.smeansofdeath, var_c391d0a8.weapon, var_c391d0a8.shitloc);
				}
				else
				{
					function_ed2725ad(var_a44c7fd8.einflictor, var_c391d0a8.attacker, var_c391d0a8.weapon);
					self kill(var_a44c7fd8.einflictor, var_c391d0a8.attacker, var_c391d0a8.smeansofdeath, var_c391d0a8.weapon, var_c391d0a8.shitloc);
					self function_284c61bd(var_c391d0a8.attacker, var_c391d0a8.smeansofdeath, bledout);
					if(level.teambased)
					{
						awardassists = 1;
					}
				}
			}
			if(var_c391d0a8.smeansofdeath == "MOD_HEAD_SHOT" && !wasteamkill && !isdefined(killstreaks::get_killstreak_for_weapon(var_c391d0a8.weapon)))
			{
				scoreevents::processscoreevent(#"headshot", var_c391d0a8.attacker, self, var_c391d0a8.weapon);
				var_c391d0a8.attacker contracts::player_contract_event(#"headshot", var_c391d0a8.weapon);
			}
			var_c391d0a8.prevlastkilltime = var_c391d0a8.lastkilltime;
			var_c391d0a8.attacker.lastkilltime = gettime();
			var_c391d0a8.attacker.var_e03e3ae5 = gettime();
			pixendevent();
		}
		if(!var_41c4d474 && !var_8efc9727)
		{
			var_c391d0a8.attacker notify(#"killed_enemy_player", {#time:gettime(), #weapon:var_c391d0a8.weapon, #victim:self});
			if(isdefined(self.laststandparams.var_5eb847d5))
			{
				self thread challenges::function_ee74d44(self.laststandparams.var_5eb847d5, bledout);
				if(var_a44c7fd8.smeansofdeath === "MOD_EXECUTION")
				{
					executioner = var_a44c7fd8.einflictor;
					if(isplayer(executioner))
					{
						var_bd3665a5 = executioner challenges::function_1123ffd1();
						var_ff83a430 = executioner challenges::function_3d9dbb3a();
						self globallogic_score::function_706caaf3(var_a44c7fd8.smeansofdeath, executioner, self, var_bd3665a5, var_ff83a430);
					}
				}
			}
			else
			{
				self thread challenges::playerkilled(var_a44c7fd8.einflictor, var_c391d0a8.attacker, var_a44c7fd8.idamage, var_c391d0a8.smeansofdeath, var_c391d0a8.weapon, var_c391d0a8.shitloc, attackerstance, bledout);
			}
		}
		else
		{
			if(var_41c4d474)
			{
				self thread challenges::function_c3b411f6(var_c391d0a8.smeansofdeath);
			}
			else if(var_8efc9727)
			{
				self thread challenges::function_cbfdab8f(var_a44c7fd8.einflictor, var_c391d0a8.attacker, var_a44c7fd8.idamage, var_c391d0a8.smeansofdeath, var_c391d0a8.weapon, var_c391d0a8.shitloc, attackerstance, bledout);
			}
		}
		if(isdefined(var_c391d0a8.attacker.pers))
		{
			if(var_c391d0a8.attacker.pers[#"hash_49e7469988944ecf"] === 1)
			{
				if(var_c391d0a8.weapon.statindex == level.var_bb448b5f.statindex)
				{
					scoreevents::processscoreevent(#"hash_39926f44fa76b382", var_c391d0a8.attacker, self, var_c391d0a8.weapon);
					var_c391d0a8.attacker.pers[#"hash_49e7469988944ecf"] = undefined;
				}
			}
		}
	}
	else
	{
		if(isdefined(var_c391d0a8.attacker) && (var_c391d0a8.attacker.classname == "trigger_hurt" || var_c391d0a8.attacker.classname == "worldspawn"))
		{
			scoreevents::processscoreevent(#"suicide", self, undefined, undefined);
			self globallogic_score::incpersstat(#"suicides", 1);
			self.suicides = self globallogic_score::getpersstat(#"suicides");
			self.suicide = 1;
			awardassists = 1;
			self function_284c61bd(undefined, var_c391d0a8.smeansofdeath);
			if(level.maxsuicidesbeforekick > 0 && level.maxsuicidesbeforekick <= self.suicides)
			{
				self notify(#"teamkillkicked");
				self function_3c238bc5();
			}
			self thread challenges::function_c3b411f6(var_c391d0a8.smeansofdeath);
		}
		else
		{
			wassuicide = 1;
			if(isdefined(var_a44c7fd8.einflictor.killcament))
			{
				wassuicide = 0;
			}
			if(isdefined(var_c391d0a8.attacker) && isdefined(var_c391d0a8.attacker.team) && isdefined(level.teams[var_c391d0a8.attacker.team]))
			{
				if(self util::isenemyteam(var_c391d0a8.attacker.team))
				{
					if(level.teambased)
					{
						if(!isdefined(killstreaks::get_killstreak_for_weapon(var_c391d0a8.weapon)) || is_true(level.killstreaksgivegamescore))
						{
							globallogic_score::giveteamscore("kill", var_c391d0a8.attacker.team);
						}
					}
					wassuicide = 0;
				}
			}
			awardassists = 1;
			self function_284c61bd(undefined, var_c391d0a8.smeansofdeath);
			if(wassuicide)
			{
				self thread challenges::function_c3b411f6(var_c391d0a8.smeansofdeath);
			}
		}
	}
	if(!level.ingraceperiod && enteredresurrect == 0)
	{
		if(var_c391d0a8.smeansofdeath != "MOD_FALLING")
		{
			if(var_c391d0a8.weapon.name != "incendiary_fire")
			{
				self weapons::drop_scavenger_for_death(var_c391d0a8.attacker);
			}
		}
		if(should_drop_weapon_on_death(wasteamkill, wassuicide, weapon_at_time_of_death, var_c391d0a8.smeansofdeath))
		{
			self weapons::drop_for_death(var_c391d0a8.attacker, var_c391d0a8.weapon, var_c391d0a8.smeansofdeath, var_a44c7fd8.idamage, 0);
		}
	}
	if(awardassists)
	{
		self function_48a1200f(var_a44c7fd8.einflictor, var_c391d0a8.attacker, var_c391d0a8.weapon);
	}
	pixendevent();
}

/*
	Name: function_c2c4d6e9
	Namespace: player
	Checksum: 0xB4968DE9
	Offset: 0x42E8
	Size: 0x164
	Parameters: 4
	Flags: Linked, Private
*/
function private function_c2c4d6e9(var_c391d0a8, bledout, enteredresurrect, countdeath)
{
	self function_4e516ee6(bledout.attacker, bledout.weapon);
	if(enteredresurrect == 0)
	{
		self.sessionstate = "dead";
		self.statusicon = "hud_status_dead";
	}
	self.hasriotshield = 0;
	self.hasriotshieldequipped = 0;
	self.pers[#"weapon"] = undefined;
	self.killedplayerscurrent = [];
	self.lastattacker = bledout.attacker;
	self.lastdeathpos = self.origin;
	self.pickedupweapons = [];
	self.switching_teams = undefined;
	self.joining_team = undefined;
	self.leaving_team = undefined;
	self.wantsafespawn = 0;
	if(countdeath)
	{
		if(!isdefined(self.deathcount))
		{
			self.deathcount = 0;
		}
		self.deathcount++;
	}
	/#
		println((("" + self.clientid) + "") + self.deathcount);
	#/
}

/*
	Name: function_fc51dcf8
	Namespace: player
	Checksum: 0xA683184E
	Offset: 0x4458
	Size: 0x486
	Parameters: 5
	Flags: Linked, Private
*/
function private function_fc51dcf8(attacker, weapon, smeansofdeath, shitloc, var_20227168)
{
	var_3a41c58c = {#assisted_suicide:0, #shitloc:shitloc, #smeansofdeath:smeansofdeath, #weapon:weapon, #attacker:undefined};
	if(isdefined(self.attackers) && (!isdefined(attacker) || attacker.classname === "trigger_hurt" || attacker.classname === "worldspawn" || is_true(attacker.ismagicbullet) || attacker == self))
	{
		if(!var_20227168)
		{
			foreach(player in self.attackers)
			{
				if(!isdefined(player))
				{
					continue;
				}
				if(!isdefined(self.attackerdamage[player.clientid]) || !isdefined(self.attackerdamage[player.clientid].damage))
				{
					continue;
				}
				if(player == self)
				{
					continue;
				}
				if(!self function_7eea9ada(player))
				{
					continue;
				}
				if(!globallogic_player::allowedassistweapon(self.attackerdamage[player.clientid].weapon))
				{
					continue;
				}
				attacker_damage = self.attackerdamage[player.clientid];
				if(attacker_damage.damage > 1 && !isdefined(var_3a41c58c.attacker))
				{
					var_3a41c58c.attacker = player;
					var_3a41c58c.smeansofdeath = attacker_damage.meansofdeath;
					var_3a41c58c.weapon = attacker_damage.weapon;
					var_3a41c58c.shitloc = attacker_damage.shitloc;
					continue;
				}
				if(isdefined(var_3a41c58c.attacker) && self.attackerdamage[player.clientid].damage > self.attackerdamage[var_3a41c58c.attacker.clientid].damage)
				{
					var_3a41c58c.attacker = player;
					var_3a41c58c.smeansofdeath = attacker_damage.meansofdeath;
					var_3a41c58c.weapon = attacker_damage.weapon;
					var_3a41c58c.shitloc = attacker_damage.shitloc;
				}
			}
		}
		if(isdefined(var_3a41c58c.attacker))
		{
			var_3a41c58c.assisted_suicide = 1;
		}
	}
	if(!isdefined(var_3a41c58c.attacker))
	{
		var_3a41c58c.attacker = attacker;
	}
	var_3a41c58c.smeansofdeath = self function_b029639e(var_3a41c58c.attacker, var_3a41c58c.weapon, var_3a41c58c.smeansofdeath, var_3a41c58c.shitloc);
	if(isdefined(self.var_a1d415ee) && isplayer(self.var_a1d415ee.attacker))
	{
		var_3a41c58c.var_23da26bf = self.var_a1d415ee.attacker;
		var_3a41c58c.var_60851fcf = self.var_a1d415ee.weapon;
		var_3a41c58c.var_4b5379af = self.var_a1d415ee.smeansofdeath;
		var_3a41c58c.var_6613188 = self.var_a1d415ee.shitloc;
	}
	else
	{
		var_3a41c58c.var_23da26bf = var_3a41c58c.attacker;
		var_3a41c58c.var_4b5379af = var_3a41c58c.smeansofdeath;
		var_3a41c58c.var_60851fcf = var_3a41c58c.weapon;
		var_3a41c58c.var_6613188 = var_3a41c58c.shitloc;
	}
	return var_3a41c58c;
}

/*
	Name: function_5f6cde96
	Namespace: player
	Checksum: 0x38C95379
	Offset: 0x48E8
	Size: 0xF2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_5f6cde96(var_41c4d474, var_8efc9727)
{
	self.deathtime = gettime();
	self.pers[#"deathtime"] = self.deathtime;
	if(!var_41c4d474 && !var_8efc9727)
	{
		/#
			assert(isdefined(self.lastspawntime));
		#/
		if(!isdefined(self.alivetimecurrentindex))
		{
			self.alivetimecurrentindex = 0;
		}
		if(isdefined(self.lastspawntime))
		{
			self.alivetimes[self.alivetimecurrentindex] = self.deathtime - self.lastspawntime;
		}
		else
		{
			self.alivetimes[self.alivetimecurrentindex] = 0;
		}
		self.alivetimecurrentindex = (self.alivetimecurrentindex + 1) % level.alivetimemaxcount;
	}
}

/*
	Name: function_e3d34c3b
	Namespace: player
	Checksum: 0x28B7471
	Offset: 0x49E8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_e3d34c3b()
{
	wait(20);
	function_93115f65();
}

/*
	Name: function_6faccb24
	Namespace: player
	Checksum: 0x67CAE89E
	Offset: 0x4A10
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_6faccb24()
{
	var_3db6ed91 = level.var_fb91af8.size - 2;
	if(var_3db6ed91 < 0)
	{
		return 0;
	}
	if(level.var_52b56362 === var_3db6ed91)
	{
		return is_true(level.deathcircle.var_8663a20d.scaling) || level.deathcircle.var_8663a20d.radius <= 0;
	}
	return 0;
}

/*
	Name: function_9956f107
	Namespace: player
	Checksum: 0x8BFB6D56
	Offset: 0x4AA8
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function function_9956f107()
{
	if(isdefined(level.deathcircle.var_8663a20d) && !isdefined(level.deathcircle.var_7aec140c))
	{
		return true;
	}
	return false;
}

/*
	Name: function_21695e86
	Namespace: player
	Checksum: 0x23E369CE
	Offset: 0x4AF0
	Size: 0x132
	Parameters: 0
	Flags: Linked
*/
function function_21695e86()
{
	if(game.state != #"pregame" && game.state != #"playing")
	{
		return 0;
	}
	if(is_true(level.deathcircle.enabled))
	{
		if(is_true(level.var_d91ebbf4))
		{
			if(function_6faccb24())
			{
				return 0;
			}
			if(isdefined(level.var_78442886) && isdefined(level.var_245d4af9) && level.var_78442886 >= level.var_245d4af9)
			{
				return 0;
			}
		}
		if(is_true(level.wave_spawn) && function_9956f107())
		{
			return 0;
		}
	}
	return spawning::function_29b859d1();
}

/*
	Name: function_93115f65
	Namespace: player
	Checksum: 0x7544B580
	Offset: 0x4C30
	Size: 0x18E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_93115f65(enteredresurrect)
{
	if(is_true(enteredresurrect))
	{
		return;
	}
	if(game.state != #"playing")
	{
		self.sessionstate = "dead";
		self.spectatorclient = -1;
		self.killcamtargetentity = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self.spectatekillcam = 0;
		return;
	}
	function_f9dc085a();
	userespawntime = 1;
	if(isdefined(level.hostmigrationtimer))
	{
		userespawntime = 0;
	}
	hostmigration::waittillhostmigrationcountdown();
	if(globallogic_utils::isvalidclass(self.curclass) || !loadout::function_87bcb1b())
	{
		timepassed = undefined;
		if(isdefined(self.respawntimerstarttime) && userespawntime)
		{
			timepassed = (float(gettime() - self.respawntimerstarttime)) / 1000;
		}
		self thread [[level.spawnclient]](timepassed);
		self.respawntimerstarttime = undefined;
	}
}

/*
	Name: function_caabcf70
	Namespace: player
	Checksum: 0x11876ED9
	Offset: 0x4DC8
	Size: 0x33C
	Parameters: 4
	Flags: Linked, Private
*/
function private function_caabcf70(victim, var_aedb48f4, laststandparams, var_a1d415ee)
{
	/#
		assert(isdefined(victim));
	#/
	/#
		assert(isdefined(var_aedb48f4));
	#/
	if(!isdefined(victim) || !isdefined(var_aedb48f4))
	{
		return;
	}
	var_f53d817d = (isdefined(laststandparams) ? laststandparams : var_aedb48f4);
	var_ee2f4691 = (isdefined(var_a1d415ee) ? var_a1d415ee : var_aedb48f4);
	function_ad11630f(victim, var_f53d817d.victimorigin, var_f53d817d.var_5fceefd4, var_f53d817d.victimweapon, var_f53d817d.attacker, var_f53d817d.attackerorigin, var_f53d817d.var_83634238, var_f53d817d.weapon, var_f53d817d.var_10d87328, var_f53d817d.shitloc, var_f53d817d.smeansofdeath, var_ee2f4691.attacker, var_ee2f4691.attackerorigin, var_ee2f4691.var_83634238, var_ee2f4691.weapon, var_ee2f4691.var_10d87328, var_ee2f4691.shitloc, var_ee2f4691.smeansofdeath);
	lifeindex = victim match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
	if(isdefined(lifeindex) && isdefined(victim) && isplayer(victim))
	{
		var_6c7269e = victim match_record::get_player_index();
		if(isdefined(var_6c7269e))
		{
			match_record::set_stat(#"lives", lifeindex, #"player_index", var_6c7269e);
		}
		if(isdefined(var_f53d817d) && isdefined(var_f53d817d.attacker) && isplayer(var_f53d817d.attacker))
		{
			var_7d5350e1 = var_f53d817d.attacker match_record::get_player_index();
			if(isdefined(var_7d5350e1))
			{
				match_record::set_stat(#"lives", lifeindex, #"hash_bc364c8d078a4b9", var_7d5350e1);
			}
		}
		if(isdefined(var_ee2f4691) && isdefined(var_ee2f4691.attacker) && isplayer(var_ee2f4691.attacker))
		{
			var_f913202b = var_ee2f4691.attacker match_record::get_player_index();
			if(isdefined(var_f913202b))
			{
				match_record::set_stat(#"lives", lifeindex, #"hash_6adf5918df7d307d", var_f913202b);
			}
		}
	}
}

/*
	Name: function_7b0f4389
	Namespace: player
	Checksum: 0x842B4A9C
	Offset: 0x5110
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7b0f4389()
{
	self.var_eca4c67f = 0;
	if(userspawnselection::isspawnselectenabled() && !is_true(self.switching_teams) && self globallogic_spawn::mayspawn())
	{
		while(!self function_d1be915f())
		{
			waitframe(1);
		}
		showmenu = self userspawnselection::shouldshowspawnselectionmenu();
		if(showmenu)
		{
			if(isdefined(self.predicted_spawn_point))
			{
				self setorigin(self.predicted_spawn_point.origin);
				self setplayerangles(self.predicted_spawn_point.angles);
			}
			specialistindex = self player_role::get();
			if(player_role::is_valid(specialistindex))
			{
				self.var_eca4c67f = 1;
				self userspawnselection::function_b55c5868();
				self userspawnselection::waitforspawnselection();
			}
		}
		else
		{
			self userspawnselection::activatespawnselectionmenu();
		}
	}
}

/*
	Name: function_d1be915f
	Namespace: player
	Checksum: 0x72E789C1
	Offset: 0x52A0
	Size: 0x38
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d1be915f()
{
	if(self isremotecontrolling())
	{
		return false;
	}
	if(isdefined(self.killstreak_delay_killcam))
	{
		return false;
	}
	return true;
}

/*
	Name: watch_death
	Namespace: player
	Checksum: 0xC3E09463
	Offset: 0x52E0
	Size: 0x15E
	Parameters: 4
	Flags: Linked, Private
*/
function private watch_death(weapon, attacker, smeansofdeath, deathanimduration)
{
	defaultplayerdeathwatchtime = 1.75;
	if(smeansofdeath == "MOD_MELEE_ASSASSINATE" || 0 > weapon.deathcamtime)
	{
		defaultplayerdeathwatchtime = (deathanimduration * 0.001) + 0.5;
	}
	else if(0 < weapon.deathcamtime)
	{
		defaultplayerdeathwatchtime = weapon.deathcamtime;
	}
	if(isdefined(level.overrideplayerdeathwatchtimer))
	{
		defaultplayerdeathwatchtime = [[level.overrideplayerdeathwatchtimer]](defaultplayerdeathwatchtime);
	}
	/#
		if((getdvarfloat(#"hash_8138dbf7b9de085", -1)) >= 0)
		{
			defaultplayerdeathwatchtime = getdvarfloat(#"hash_8138dbf7b9de085", -1);
		}
	#/
	if(!(is_true(self.var_342564dd) && self == attacker))
	{
		globallogic_utils::waitfortimeornotify(defaultplayerdeathwatchtime, "end_death_delay");
	}
	self notify(#"death_delay_finished");
}

/*
	Name: function_b029639e
	Namespace: player
	Checksum: 0x83EA5032
	Offset: 0x5448
	Size: 0xEE
	Parameters: 4
	Flags: Linked, Private
*/
function private function_b029639e(attacker, weapon, smeansofdeath, shitloc)
{
	/#
		assert(isdefined(smeansofdeath));
	#/
	if(weapons::isheadshot(weapon, shitloc, smeansofdeath) && isplayer(attacker))
	{
		return "MOD_HEAD_SHOT";
	}
	switch(weapon.name)
	{
		case "dog_bite":
		{
			return "MOD_PISTOL_BULLET";
			break;
		}
		case "destructible_car":
		{
			return "MOD_EXPLOSIVE";
			break;
		}
		case "explodable_barrel":
		{
			return "MOD_EXPLOSIVE";
			break;
		}
	}
	return smeansofdeath;
}

/*
	Name: function_4e516ee6
	Namespace: player
	Checksum: 0xA48CFE63
	Offset: 0x5540
	Size: 0x578
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4e516ee6(attacker, weapon)
{
	if(!isdefined(self.switching_teams) && !self.var_4ef33446)
	{
		if(isplayer(attacker) && level.teambased && attacker != self && !self util::isenemyteam(attacker.team))
		{
			self.pers[#"cur_kill_streak"] = 0;
			self.pers[#"cur_total_kill_streak"] = 0;
			self.pers[#"totalkillstreakcount"] = 0;
			self.pers[#"killstreaksearnedthiskillstreak"] = 0;
			self setplayercurrentstreak(0);
		}
		else
		{
			if(!is_true(self.var_cee93f5))
			{
				self globallogic_score::incpersstat(#"deaths", 1, 1, 1);
			}
			self.deaths = self globallogic_score::getpersstat(#"deaths");
			self updatestatratio("kdratio", "kills", "deaths");
			if(level.hardcoremode === 1)
			{
				if(!is_true(self.var_cee93f5))
				{
					self globallogic_score::incpersstat(#"deaths_hc", 1, 1, 1);
				}
				self updatestatratio("kdratio_hc", "kills_hc", "deaths_hc");
			}
			if(self.pers[#"cur_kill_streak"] > self.pers[#"best_kill_streak"])
			{
				self.pers[#"best_kill_streak"] = self.pers[#"cur_kill_streak"];
				if(level.var_268c70a7 === 1 && isdefined(self.var_a504287b.highest_killstreak))
				{
					var_c6267937 = self.pers[#"cur_kill_streak"];
					var_3e5f5126 = isdefined(self.var_a504287b) && isdefined(self.var_a504287b.highest_killstreak);
					if(var_3e5f5126 && var_c6267937 > self.var_a504287b.highest_killstreak)
					{
						self.var_a504287b.highest_killstreak = var_c6267937;
					}
				}
			}
			self.pers[#"kill_streak_before_death"] = self.pers[#"cur_kill_streak"];
			if(isdefined(self.pers[#"hash_33112f192fb3c234"]) && isdefined(self.pers[#"hash_33112f192fb3c234"][#"current"]))
			{
				self.pers[#"hash_33112f192fb3c234"][#"current"][#"highestkillstreak"] = 0;
			}
			self.pers[#"cur_kill_streak"] = 0;
			self.pers[#"cur_total_kill_streak"] = 0;
			self.pers[#"totalkillstreakcount"] = 0;
			self.pers[#"killstreaksearnedthiskillstreak"] = 0;
			self setplayercurrentstreak(0);
			if(isdefined(self.cur_death_streak))
			{
				self.cur_death_streak++;
				if(self.cur_death_streak >= getdvarint(#"perk_deathstreakcountrequired", 0))
				{
					self enabledeathstreak();
				}
			}
		}
	}
	else
	{
		self.pers[#"cur_kill_streak"] = 0;
		self.pers[#"cur_total_kill_streak"] = 0;
		self.pers[#"totalkillstreakcount"] = 0;
		self.pers[#"killstreaksearnedthiskillstreak"] = 0;
		self setplayercurrentstreak(0);
	}
	if(killstreaks::is_killstreak_weapon(weapon))
	{
		level.globalkillstreaksdeathsfrom++;
	}
}

/*
	Name: function_abbc84ad
	Namespace: player
	Checksum: 0x52B04958
	Offset: 0x5AC0
	Size: 0x614
	Parameters: 4
	Flags: Linked, Private
*/
function private function_abbc84ad(attacker, weapon, smeansofdeath, inflictor)
{
	if(isplayer(attacker) && attacker != self && (!level.teambased || self util::isenemyteam(attacker.team)))
	{
		attackerweaponpickedup = 0;
		if(isdefined(attacker.pickedupweapons) && isdefined(attacker.pickedupweapons[weapon]))
		{
			attackerweaponpickedup = 1;
		}
		self stats::function_eec52333(weapon, #"deaths", 1, self.class_num, attackerweaponpickedup);
		var_bb166c5e = stats::function_3f64434(weapon);
		self stats::function_622feb0d(var_bb166c5e, #"deaths", 1);
		victim_weapon = self.lastdroppableweapon;
		if(isdefined(victim_weapon))
		{
			victimweaponpickedup = 0;
			if(isdefined(self.pickedupweapons) && isdefined(self.pickedupweapons[victim_weapon]))
			{
				victimweaponpickedup = 1;
			}
			self stats::function_eec52333(victim_weapon, #"deathsduringuse", 1, self.class_num, victimweaponpickedup);
			level thread telemetry::function_18135b72(#"hash_b88b6d2e0028e13", {#weaponpickedup:victimweaponpickedup, #value:1, #statname:#"deathsduringuse", #weapon:victim_weapon, #player:self});
		}
		recordweaponstatkills = 1;
		if(attacker.isthief === 1 && isdefined(weapon) && weapon.isheroweapon === 1)
		{
			recordweaponstatkills = 0;
		}
		if(smeansofdeath != "MOD_FALLING" && recordweaponstatkills)
		{
			if(weapon.name == #"explosive_bolt" && isdefined(inflictor) && isdefined(inflictor.ownerweaponatlaunch) && inflictor.owneradsatlaunch)
			{
				inflictorownerweaponatlaunchpickedup = 0;
				if(isdefined(attacker.pickedupweapons) && isdefined(attacker.pickedupweapons[inflictor.ownerweaponatlaunch]))
				{
					inflictorownerweaponatlaunchpickedup = 1;
				}
				attacker stats::function_eec52333(inflictor.ownerweaponatlaunch, #"kills", 1, attacker.class_num, inflictorownerweaponatlaunchpickedup, 1);
				level thread telemetry::function_18135b72(#"hash_b88b6d2e0028e13", {#weaponpickedup:inflictorownerweaponatlaunchpickedup, #value:1, #statname:#"kills", #weapon:inflictor.ownerweaponatlaunch, #player:attacker});
			}
			else
			{
				attacker stats::function_eec52333(weapon, #"kills", 1, attacker.class_num, attackerweaponpickedup);
				attacker stats::function_80099ca1(weapon.name, #"best_kills");
				attacker stats::function_e24eec31(weapon, #"hash_49b586d05aaa0209", 1);
				level thread telemetry::function_18135b72(#"hash_b88b6d2e0028e13", {#weaponpickedup:attackerweaponpickedup, #value:1, #statname:#"kills", #weapon:weapon, #player:attacker});
			}
		}
		if(smeansofdeath == "MOD_HEAD_SHOT")
		{
			attacker stats::function_eec52333(weapon, #"headshots", 1, attacker.class_num, attackerweaponpickedup);
			level thread telemetry::function_18135b72(#"hash_b88b6d2e0028e13", {#weaponpickedup:attackerweaponpickedup, #value:1, #statname:#"headshots", #weapon:weapon, #player:attacker});
		}
		if(smeansofdeath == "MOD_PROJECTILE")
		{
			attacker stats::function_e24eec31(weapon, #"direct_hit_kills", 1);
		}
	}
}

/*
	Name: function_a3030357
	Namespace: player
	Checksum: 0xD5B5AD55
	Offset: 0x60E0
	Size: 0x3C4
	Parameters: 6
	Flags: Linked
*/
function function_a3030357(attacker, einflictor, weapon, smeansofdeath, bledout, var_bee367e6)
{
	if(self.var_4ef33446)
	{
		return;
	}
	if(!isplayer(einflictor) || self util::isenemyplayer(einflictor) == 0 || (isdefined(smeansofdeath) && killstreaks::is_killstreak_weapon(smeansofdeath)))
	{
		level notify(#"reset_obituary_count");
		level.lastobituaryplayercount = 0;
		level.lastobituaryplayer = undefined;
	}
	else
	{
		if(isdefined(level.lastobituaryplayer) && level.lastobituaryplayer == einflictor)
		{
			level.lastobituaryplayercount++;
		}
		else
		{
			level notify(#"reset_obituary_count");
			level.lastobituaryplayer = einflictor;
			level.lastobituaryplayercount = 1;
		}
		level thread scoreevents::decrementlastobituaryplayercountafterfade();
		if(level.lastobituaryplayercount >= 4)
		{
			level notify(#"reset_obituary_count");
			level.lastobituaryplayercount = 0;
			level.lastobituaryplayer = undefined;
			self thread scoreevents::uninterruptedobitfeedkills(einflictor, smeansofdeath);
		}
	}
	overrideentitycamera = function_c0f28ff9(einflictor, smeansofdeath);
	var_50d1e41a = potm::function_775b9ad1(smeansofdeath, bledout);
	var_e9d49a33 = function_faf77690(smeansofdeath, weapon, einflictor);
	if(isdefined(weapon) && weapon.archetype === "robot")
	{
		if(bledout == "MOD_HIT_BY_OBJECT")
		{
			smeansofdeath = getweapon(#"combat_robot_marker");
		}
		bledout = "MOD_RIFLE_BULLET";
	}
	if(var_bee367e6)
	{
		bledout = "MOD_BLED_OUT";
	}
	var_f87dccb5 = self util::isenemyteam(einflictor.team);
	if(level.teambased && isdefined(einflictor.pers) && !var_f87dccb5 && bledout == "MOD_GRENADE" && level.friendlyfire == 0)
	{
		obituary(self, self, smeansofdeath, bledout);
		demo::function_ae3420ca(self, self, weapon, var_50d1e41a, overrideentitycamera);
		if(!var_e9d49a33)
		{
			potm::function_ae3420ca(self, self, weapon, var_50d1e41a, overrideentitycamera);
		}
	}
	else
	{
		obituary(self, einflictor, smeansofdeath, bledout);
		demo::function_ae3420ca(einflictor, self, weapon, var_50d1e41a, overrideentitycamera);
		if(!var_e9d49a33)
		{
			potm::function_ae3420ca(einflictor, self, weapon, var_50d1e41a, overrideentitycamera);
		}
	}
}

/*
	Name: function_faf77690
	Namespace: player
	Checksum: 0xE7BC82BE
	Offset: 0x64B0
	Size: 0x102
	Parameters: 3
	Flags: Linked
*/
function function_faf77690(weapon, einflictor, attacker)
{
	var_e9d49a33 = 0;
	if(isdefined(weapon) && killstreaks::is_killstreak_weapon(weapon))
	{
		var_e9d49a33 = 1;
	}
	if(isdefined(einflictor) && (is_true(einflictor.var_e9d49a33) || (isdefined(einflictor.owner) && is_true(einflictor.owner.var_e9d49a33))))
	{
		var_e9d49a33 = 1;
	}
	var_f87dccb5 = self util::isenemyteam(attacker.team);
	if(self != attacker && !var_f87dccb5)
	{
		var_e9d49a33 = 1;
	}
	return var_e9d49a33;
}

/*
	Name: function_c0f28ff9
	Namespace: player
	Checksum: 0xF4609E62
	Offset: 0x65C0
	Size: 0x62
	Parameters: 2
	Flags: Linked
*/
function function_c0f28ff9(attacker, weapon)
{
	overrideentitycamera = 0;
	if(!isdefined(weapon))
	{
		return overrideentitycamera;
	}
	if(killstreaks::is_killstreak_weapon(weapon))
	{
		overrideentitycamera = killstreaks::should_override_entity_camera_in_demo(attacker, weapon);
	}
	return overrideentitycamera;
}

/*
	Name: player_suicide
	Namespace: player
	Checksum: 0x60CF70E8
	Offset: 0x6630
	Size: 0x348
	Parameters: 5
	Flags: Linked, Private
*/
function private player_suicide(einflictor, attacker, smeansofdeath, weapon, shitloc)
{
	awardassists = 0;
	self.suicide = 0;
	if(isdefined(self.switching_teams))
	{
		if(!level.teambased && (isdefined(level.teams[self.leaving_team]) && isdefined(level.teams[self.joining_team]) && level.teams[self.leaving_team] != level.teams[self.joining_team]))
		{
			playercounts = self teams::count_players();
			playercounts[self.leaving_team]--;
			playercounts[self.joining_team]++;
			if(playercounts[self.joining_team] - playercounts[self.leaving_team] > 1)
			{
				scoreevents::processscoreevent(#"suicide", self, undefined, undefined);
				self globallogic_score::incpersstat(#"suicides", 1);
				self.suicides = self globallogic_score::getpersstat(#"suicides");
				self.suicide = 1;
			}
		}
	}
	else
	{
		scoreevents::processscoreevent(#"suicide", self);
		self globallogic_score::incpersstat(#"suicides", 1);
		self.suicides = self globallogic_score::getpersstat(#"suicides");
		if(smeansofdeath === "MOD_SUICIDE" && shitloc === "none" && is_true(self.throwinggrenade))
		{
			self.lastgrenadesuicidetime = gettime();
		}
		if(level.maxsuicidesbeforekick > 0 && level.maxsuicidesbeforekick <= self.suicides)
		{
			self notify(#"teamkillkicked");
			self function_3c238bc5();
		}
		awardassists = 1;
		self.suicide = 1;
	}
	if(isdefined(self.friendlydamage))
	{
		self iprintln(#"hash_7d1a0e5bd191fce");
		if(level.teamkillpointloss)
		{
			scoresub = self [[level.getteamkillscore]](einflictor, attacker, smeansofdeath, weapon);
			globallogic_score::function_17a678b7(attacker, scoresub);
		}
	}
	return awardassists;
}

/*
	Name: team_kill
	Namespace: player
	Checksum: 0x190A3C62
	Offset: 0x6980
	Size: 0x2F4
	Parameters: 5
	Flags: Linked, Private
*/
function private team_kill(einflictor, attacker, smeansofdeath, weapon, shitloc)
{
	scoreevents::processscoreevent(#"team_kill", smeansofdeath, undefined, shitloc);
	self.teamkilled = 1;
	if(!ignore_team_kills(shitloc, weapon, attacker))
	{
		teamkill_penalty = self [[level.getteamkillpenalty]](attacker, smeansofdeath, weapon, shitloc);
		smeansofdeath globallogic_score::incpersstat(#"teamkills_nostats", teamkill_penalty, 0);
		smeansofdeath globallogic_score::incpersstat(#"teamkills", 1);
		if(!isdefined(smeansofdeath.teamkillsthisround))
		{
			smeansofdeath.teamkillsthisround = 0;
		}
		smeansofdeath.teamkillsthisround++;
		if(level.friendlyfire == 4 && smeansofdeath.pers[#"teamkills_nostats"] == level.var_fe3ff9c1)
		{
			smeansofdeath.var_e03ca8a5 = 1;
		}
		if(level.teamkillpointloss)
		{
			scoresub = self [[level.getteamkillscore]](attacker, smeansofdeath, weapon, shitloc);
			globallogic_score::function_17a678b7(smeansofdeath, scoresub);
		}
		if(globallogic_utils::gettimepassed() < 5000)
		{
			var_821200bb = 1;
		}
		else
		{
			if(smeansofdeath.pers[#"teamkills_nostats"] > 1 && globallogic_utils::gettimepassed() < (int((8 + smeansofdeath.pers[#"teamkills_nostats"]) * 1000)))
			{
				var_821200bb = 1;
			}
			else
			{
				var_821200bb = smeansofdeath function_821200bb();
			}
		}
		if(var_821200bb > 0)
		{
			smeansofdeath.teamkillpunish = 1;
			smeansofdeath thread wait_and_suicide();
			if(smeansofdeath function_78a6af2d(var_821200bb))
			{
				smeansofdeath notify(#"teamkillkicked");
				smeansofdeath thread function_dd602974();
			}
			smeansofdeath thread function_a932bf9c();
		}
	}
}

/*
	Name: wait_and_suicide
	Namespace: player
	Checksum: 0xA35B8D46
	Offset: 0x6C80
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private wait_and_suicide()
{
	self endon(#"disconnect");
	self val::set(#"wait_and_suicide", "freezecontrols");
	wait(0.25);
	self val::reset(#"wait_and_suicide", "freezecontrols");
	self suicide();
}

/*
	Name: function_48a1200f
	Namespace: player
	Checksum: 0xAB8173DE
	Offset: 0x6D18
	Size: 0x2C6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_48a1200f(einflictor, attacker, weapon)
{
	pixbeginevent();
	if(isdefined(self.attackers))
	{
		for(j = 0; j < self.attackers.size; j++)
		{
			player = self.attackers[j];
			if(!isdefined(player))
			{
				continue;
			}
			if(player == attacker)
			{
				continue;
			}
			if(player util::isenemyteam(attacker.team))
			{
				continue;
			}
			damage_done = self.attackerdamage[player.clientid].damage;
			if(sessionmodeismultiplayergame() && isdefined(player.currentweapon))
			{
				function_92d1707f(#"hash_d1357992f4715f0", {#hash_c47a74de:player.currentweapon.name, #hash_fc39645f:function_b14806c6(player player_role::get(), currentsessionmode()), #hash_a322a945:getplayerspawnid(player), #gametime:function_f8d53445()});
			}
			player thread globallogic_score::processassist(self, damage_done, self.attackerdamage[player.clientid].weapon, self.attackerdamage[player.clientid].time, self.attackerdamage[player.clientid].smeansofdeath);
		}
	}
	if(level.teambased)
	{
		self globallogic_score::function_c2ea00b2(attacker, einflictor, weapon);
	}
	if(isdefined(self.lastattackedshieldplayer) && isdefined(self.lastattackedshieldtime) && self.lastattackedshieldplayer != attacker)
	{
		if(gettime() - self.lastattackedshieldtime < 4000)
		{
			self.lastattackedshieldplayer thread globallogic_score::processshieldassist(self);
		}
	}
	pixendevent();
}

/*
	Name: function_f632c17e
	Namespace: player
	Checksum: 0xEE198D1A
	Offset: 0x6FE8
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_f632c17e(weapon)
{
	if(isdefined(weapon) && isdefined(level.iskillstreakweapon) && [[level.iskillstreakweapon]](weapon))
	{
		return true;
	}
	if(isdefined(weapon) && isdefined(weapon.statname) && isdefined(level.iskillstreakweapon) && [[level.iskillstreakweapon]](getweapon(weapon.statname)))
	{
		return true;
	}
	switch(weapon.name)
	{
		case "hash_216eeca7a4295e4":
		case "hash_17df39d53492b0bf":
		case "tank_robot_launcher_turret":
		case "hash_721bd01efec90239":
		case "hash_7b24d0d0d2823bca":
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_4e3e8bee
	Namespace: player
	Checksum: 0x8D73155B
	Offset: 0x7100
	Size: 0x60C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_4e3e8bee(einflictor, attacker, smeansofdeath, weapon, var_e7a369ea)
{
	attacker thread globallogic_score::givekillstats(smeansofdeath, weapon, self, var_e7a369ea);
	killstreak = killstreaks::get_killstreak_for_weapon(weapon);
	var_7414b854 = self function_63aa4562();
	if(isdefined(killstreak))
	{
		if(scoreevents::isregisteredevent(killstreak))
		{
			scoreevents::processscoreevent(killstreak, attacker, self, weapon);
		}
		if(isdefined(einflictor))
		{
			bundle = einflictor killstreak_bundles::function_48e9536e();
			if(isdefined(bundle) && is_true(bundle.var_ad1e41b))
			{
				scoreevents::processscoreevent(#"ekia", attacker, self, weapon);
			}
			if(killstreak == "dart" || killstreak == "inventory_dart")
			{
				einflictor notify(#"veh_collision");
				callback::callback(#"veh_collision", {#normal:(0, 0, 1)});
			}
		}
		if(weapon.iscarriedkillstreak === 1)
		{
			if(!isdefined(attacker.var_8e94d71c))
			{
				attacker.var_8e94d71c = [];
			}
			if(!isdefined(attacker.var_8e94d71c[weapon]))
			{
				attacker.var_8e94d71c[weapon] = 0;
			}
			attacker.var_8e94d71c[weapon]++;
			attacker contracts::function_a54e2068(#"hash_1c65fc76b2b14014");
			if(isdefined(attacker.var_63fa6458[killstreak]))
			{
				attacker.var_63fa6458[killstreak].kills++;
			}
			if(var_e7a369ea != attacker)
			{
				scoreevents::processscoreevent(#"ekia", attacker, self, weapon);
			}
		}
		else if(isdefined(einflictor.killstreakid))
		{
			if(!isdefined(level.var_72df16fd[einflictor.killstreakid]))
			{
				level.var_72df16fd[einflictor.killstreakid] = 0;
			}
			level.var_72df16fd[einflictor.killstreakid]++;
			if(isdefined(attacker.var_9fa3bd36[einflictor.killstreakid]))
			{
				attacker.var_9fa3bd36[einflictor.killstreakid].kills++;
			}
		}
	}
	else if(!function_f632c17e(weapon))
	{
		if(var_e7a369ea == attacker)
		{
			if(isdefined(self.laststandparams))
			{
				if(isdefined(self.var_a1d415ee) && self.laststandparams.attacker !== self.var_a1d415ee.attacker)
				{
					scoreevents::processscoreevent(#"kill", self.laststandparams.attacker, self, self.laststandparams.weapon);
					scoreevents::processscoreevent(#"hash_65fff1a096fb1d2d", self.var_a1d415ee.attacker, self, self.var_a1d415ee.weapon);
					scoreevents::processscoreevent(#"hash_3a4044777bf1a070", self.var_a1d415ee.attacker, self, self.var_a1d415ee.weapon);
				}
				else
				{
					scoreevents::processscoreevent(#"kill", attacker, self, weapon);
				}
			}
			else
			{
				scoreevents::processscoreevent(#"kill", attacker, self, weapon);
			}
		}
		else
		{
			scoreevents::processscoreevent(#"ekia", attacker, self, weapon);
		}
	}
	damage = self function_40c6c42d(attacker);
	if(var_7414b854 && is_true(getgametypesetting(#"hash_1d4b880b345fe1ac")))
	{
		function_f887b191(self, attacker, damage, 4);
	}
	else
	{
		function_f887b191(self, attacker, damage);
	}
	attacker thread globallogic_score::trackattackerkill(self.name, self.pers[#"rank"], self.pers[#"rankxp"], self.pers[#"prestige"], self getxuid(), weapon);
	attacker thread globallogic_score::inckillstreaktracker(weapon);
}

/*
	Name: function_63aa4562
	Namespace: player
	Checksum: 0xEC4A1BC5
	Offset: 0x7718
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function function_63aa4562()
{
	teammates = getplayers(self.team);
	foreach(teammate in teammates)
	{
		if(isalive(teammate) && !teammate laststand::player_is_in_laststand())
		{
			return false;
		}
	}
	return true;
}

/*
	Name: kill
	Namespace: player
	Checksum: 0xDEFBFD6B
	Offset: 0x77F0
	Size: 0x21C
	Parameters: 5
	Flags: Linked, Private
*/
function private kill(einflictor, attacker, smeansofdeath, weapon, shitloc)
{
	if(!isdefined(killstreaks::get_killstreak_for_weapon(shitloc)) || is_true(level.killstreaksgivegamescore))
	{
		globallogic_score::inctotalkills(smeansofdeath.team);
	}
	attackername = smeansofdeath.name;
	self thread globallogic_score::trackattackeedeath(attackername, smeansofdeath.pers[#"rank"], smeansofdeath.pers[#"rankxp"], smeansofdeath.pers[#"prestige"], smeansofdeath getxuid());
	self thread medals::setlastkilledby(smeansofdeath, attacker);
	if(level.teambased && smeansofdeath.team != #"spectator")
	{
		killstreak = killstreaks::get_killstreak_for_weapon(shitloc);
		if(!isdefined(killstreak) || is_true(level.killstreaksgivegamescore))
		{
			globallogic_score::giveteamscore("kill", smeansofdeath.team);
		}
	}
	scoresub = level.deathpointloss;
	if(scoresub != 0)
	{
		globallogic_score::function_17a678b7(self, scoresub);
	}
	level thread function_e8decd0b(smeansofdeath, shitloc, self, attacker, weapon);
}

/*
	Name: should_allow_postgame_death
	Namespace: player
	Checksum: 0x934C0300
	Offset: 0x7A18
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private should_allow_postgame_death(smeansofdeath)
{
	if(smeansofdeath == "MOD_POST_GAME")
	{
		return true;
	}
	return false;
}

/*
	Name: post_game_death
	Namespace: player
	Checksum: 0x17D15CDA
	Offset: 0x7A48
	Size: 0x2D4
	Parameters: 9
	Flags: Linked, Private
*/
function private post_game_death(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(!should_allow_postgame_death(weapon))
	{
		return;
	}
	self weapons::detach_carry_object_model();
	self.sessionstate = "dead";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	clone_weapon = vdir;
	if(weapons::ismeleemod(weapon) && clone_weapon.type != "melee")
	{
		clone_weapon = level.weaponnone;
	}
	body = self cloneplayer(deathanimduration, clone_weapon, idamage, shitloc);
	if(isdefined(body))
	{
		var_f90950bd = (isdefined(idamage) ? idamage : self);
		var_a2f12b49 = {#hash_10d87328:function_f8d53445(), #shitloc:psoffsettime, #vdir:shitloc, #weapon:vdir, #smeansofdeath:weapon, #idamage:smeansofdeath, #hash_83634238:(isplayer(var_f90950bd) ? var_f90950bd getplayerangles() : var_f90950bd.angles), #attackerorigin:var_f90950bd.origin, #attacker:idamage, #einflictor:attacker, #victimweapon:self.currentweapon, #hash_5fceefd4:self getplayerangles(), #victimorigin:self.origin};
		self function_10f480f(var_a2f12b49, (0, 0, 0), deathanimduration, body);
	}
}

/*
	Name: function_395ef176
	Namespace: player
	Checksum: 0xBB5D316A
	Offset: 0x7D28
	Size: 0x660
	Parameters: 0
	Flags: Linked, Private
*/
function private function_395ef176()
{
	self endon(#"disconnect");
	var_8f42b3ff = 10 - getplayers(self.team).size;
	var_65671d4a = level.numteamlives - var_8f42b3ff;
	if(is_true(level.teambased) && is_true(level.takelivesondeath) && level.numteamlives > 0)
	{
		enemy_team = util::getotherteam(self.team);
		teamarray = getplayers(self.team);
		if(game.lives[self.team] == 0 && !level.var_61952d8b[self.team])
		{
			level.var_61952d8b[self.team] = 1;
			level.var_a236b703[self.team] = 1;
			thread globallogic_audio::leader_dialog("controlNoLives", self.team);
			thread globallogic_audio::leader_dialog("controlNoLivesEnemy", enemy_team);
			clientfield::set_world_uimodel(("hudItems.team" + level.teamindex[self.team]) + ".noRespawnsLeft", 1);
			level notify(#"hash_15b8b6edc4ed3032", {#hash_7090bf53:1});
			game.lives[self.team] = 0;
			level.var_9161927e[self.team] = teamarray.size;
			teammates = function_a1ef346b(self.team);
			foreach(player in teammates)
			{
				player luinotifyevent(#"hash_6b67aa04e378d681", 1, 7);
			}
			util::function_a3f7de13(24, self.team);
		}
		if(level.deaths[self.team] >= var_65671d4a && !level.var_a236b703[self.team])
		{
			level.var_a236b703[self.team] = 1;
			thread globallogic_audio::leader_dialog("controlLowLives", self.team);
			thread globallogic_audio::leader_dialog("controlLowLivesEnemy", enemy_team);
		}
		if(isdefined(level.var_9161927e) && isdefined(level.var_9161927e[self.team]))
		{
			if(level.var_9161927e[self.team] > 0)
			{
				teammates = function_a1ef346b(self.team);
				foreach(player in teammates)
				{
					player luinotifyevent(#"hash_6b67aa04e378d681", 2, 1, level.var_9161927e[self.team]);
				}
			}
			if(level.var_9161927e[self.team] == 1)
			{
				thread globallogic_audio::leader_dialog("roundEncourageLastPlayer", self.team);
				thread globallogic_audio::leader_dialog("roundEncourageLastPlayerEnemy", enemy_team);
			}
			level.var_9161927e[self.team]--;
		}
		function_c49fc862(self.team);
	}
	else
	{
		clientfield::set_player_uimodel("hudItems.playerLivesCount", level.numlives - self.var_a7d7e50a);
		if(is_true(level.var_4348a050))
		{
			var_e6caaa48 = level.playerlives[#"allies"];
			var_5724b72f = level.playerlives[#"axis"];
			if(level.gametype == "sd" && userspawnselection::function_127864f2(self))
			{
				return;
			}
			if(var_e6caaa48 > 0 && var_5724b72f > 0)
			{
				foreach(player in function_a1ef346b())
				{
					if(!isdefined(player))
					{
						continue;
					}
					player luinotifyevent(#"hash_6b67aa04e378d681", 3, 2, var_e6caaa48, var_5724b72f);
				}
			}
		}
	}
}

/*
	Name: function_5c5a8dad
	Namespace: player
	Checksum: 0x6D6DA3B4
	Offset: 0x8390
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5c5a8dad(lives)
{
	if(lives == 0)
	{
		level notify(#"player_eliminated");
		self notify(#"player_eliminated");
	}
}

/*
	Name: start_generator_captureshouldshowpain
	Namespace: player
	Checksum: 0x944E46F
	Offset: 0x83E0
	Size: 0x25C
	Parameters: 0
	Flags: Linked, Private
*/
function private start_generator_captureshouldshowpain()
{
	if(!is_true(level.takelivesondeath))
	{
		self function_5c5a8dad(self.pers[#"lives"]);
		return;
	}
	if(is_true(self.var_cee93f5))
	{
		return;
	}
	if(game.lives[self.team] > 0)
	{
		if(is_true(level.competitiveteamlives))
		{
		}
		else
		{
			if(self.attackers.size < 1)
			{
				return;
			}
			foreach(attacker in self.attackers)
			{
				if(!isdefined(attacker))
				{
					continue;
				}
				if(attacker.team != self.team)
				{
					removelives = 1;
					break;
				}
			}
			if(!is_true(removelives))
			{
				return;
			}
		}
		game.lives[self.team]--;
		if(self.pers[#"lives"] == 0)
		{
			self function_5c5a8dad(game.lives[self.team]);
		}
	}
	else if(self.pers[#"lives"])
	{
		self.pers[#"lives"]--;
		level callback::callback(#"hash_e702d557e24bb6", {#player:self});
		self function_5c5a8dad(self.pers[#"lives"]);
	}
}

/*
	Name: function_10f480f
	Namespace: player
	Checksum: 0x6929B226
	Offset: 0x8648
	Size: 0x414
	Parameters: 4
	Flags: Linked, Private
*/
function private function_10f480f(var_a2f12b49, vattackerorigin, deathanimduration, body)
{
	if(var_a2f12b49.smeansofdeath == "MOD_HIT_BY_OBJECT" && self getstance() == "prone")
	{
		self.body = body;
		if(!isdefined(self.switching_teams))
		{
			thread deathicons::add(body, self, self.team);
		}
		return;
	}
	if(isdefined(level.ragdoll_override) && self [[level.ragdoll_override]](var_a2f12b49.idamage, var_a2f12b49.smeansofdeath, var_a2f12b49.weapon, var_a2f12b49.shitloc, var_a2f12b49.vdir, vattackerorigin, deathanimduration, var_a2f12b49.einflictor, 0, body))
	{
		return;
	}
	if(self isonladder() || self function_b4813488() || self function_e128a831() || self ismantling() || var_a2f12b49.smeansofdeath == "MOD_CRUSH" || var_a2f12b49.smeansofdeath == "MOD_HIT_BY_OBJECT")
	{
		body startragdoll();
	}
	if(!self isonground() && var_a2f12b49.smeansofdeath != "MOD_FALLING")
	{
		if(getdvarint(#"scr_disable_air_death_ragdoll", 0) == 0)
		{
			body startragdoll();
		}
	}
	if(var_a2f12b49.smeansofdeath == "MOD_MELEE_ASSASSINATE" && !var_a2f12b49.attacker isonground())
	{
		body start_death_from_above_ragdoll(var_a2f12b49.vdir);
	}
	if(self is_explosive_ragdoll(var_a2f12b49.weapon, var_a2f12b49.einflictor))
	{
		body start_explosive_ragdoll(var_a2f12b49.vdir, var_a2f12b49.weapon);
	}
	thread delayed_ragdoll(body, var_a2f12b49.shitloc, var_a2f12b49.vdir, var_a2f12b49.weapon, var_a2f12b49.einflictor, var_a2f12b49.smeansofdeath);
	if(var_a2f12b49.smeansofdeath == "MOD_CRUSH")
	{
		body globallogic_vehicle::vehiclecrush(var_a2f12b49.attacker, var_a2f12b49.einflictor);
	}
	hidedeathicon = isplayer(var_a2f12b49.attacker) && var_a2f12b49.attacker hasperk(#"hash_67340eb8c5d0f17f");
	self.body = body;
	if(!isdefined(self.switching_teams) && !hidedeathicon)
	{
		thread deathicons::add(body, self, self.team);
	}
	body.player = self;
	body.iscorpse = 1;
	self.body callback::callback(#"on_player_corpse", var_a2f12b49);
}

/*
	Name: should_drop_weapon_on_death
	Namespace: player
	Checksum: 0x7CA87672
	Offset: 0x8A68
	Size: 0x8C
	Parameters: 4
	Flags: Linked, Private
*/
function private should_drop_weapon_on_death(wasteamkill, wassuicide, current_weapon, smeansofdeath)
{
	if(wasteamkill)
	{
		return false;
	}
	if(wassuicide)
	{
		return false;
	}
	if(smeansofdeath == "MOD_TRIGGER_HURT" && !self isonground())
	{
		return false;
	}
	if(isdefined(current_weapon) && current_weapon.isheavyweapon)
	{
		return false;
	}
	return true;
}

/*
	Name: function_8826f676
	Namespace: player
	Checksum: 0x5878CCC6
	Offset: 0x8B00
	Size: 0x28
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8826f676()
{
	if(isbot(self))
	{
		level.globallarryskilled++;
	}
}

/*
	Name: function_f9dc085a
	Namespace: player
	Checksum: 0x859B879F
	Offset: 0x8B30
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f9dc085a()
{
	if(isdefined(self.killstreak_delay_killcam))
	{
		while(isdefined(self.killstreak_delay_killcam))
		{
			wait(0.1);
		}
		wait(2);
		self killstreaks::reset_killstreak_delay_killcam();
	}
}

/*
	Name: function_3c238bc5
	Namespace: player
	Checksum: 0x9D464C40
	Offset: 0x8B80
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3c238bc5()
{
	self globallogic_score::incpersstat(#"sessionbans", 1);
	self endon(#"disconnect");
	waittillframeend();
	globallogic::gamehistoryplayerkicked();
	ban(self getentitynumber());
	globallogic_audio::leader_dialog("gamePlayerKicked");
}

/*
	Name: function_dd602974
	Namespace: player
	Checksum: 0xDB973CFF
	Offset: 0x8C20
	Size: 0x1F4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_dd602974()
{
	self globallogic_score::incpersstat(#"sessionbans", 1);
	self endon(#"disconnect");
	waittillframeend();
	playlistbanquantum = tweakables::gettweakablevalue("team", "teamkillerplaylistbanquantum");
	playlistbanpenalty = tweakables::gettweakablevalue("team", "teamkillerplaylistbanpenalty");
	if(playlistbanquantum > 0 && playlistbanpenalty > 0)
	{
		timeplayedtotal = self stats::function_441050ca(#"time_played_total");
		minutesplayed = timeplayedtotal / 60;
		freebees = 2;
		banallowance = (int(floor(minutesplayed / playlistbanquantum))) + freebees;
		if(self globallogic_score::getpersstat(#"sessionbans") > banallowance)
		{
			self stats::function_4db3fba1(#"gametypeban", timeplayedtotal + (playlistbanpenalty * 60));
		}
	}
	globallogic::gamehistoryplayerkicked();
	ban(self getentitynumber(), "EXE/PLAYERKICK_TEAM_KILL");
	globallogic_audio::leader_dialog("gamePlayerKicked");
}

/*
	Name: function_821200bb
	Namespace: player
	Checksum: 0x36ACFB04
	Offset: 0x8E20
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function function_821200bb()
{
	teamkills = self.pers[#"teamkills_nostats"];
	if(level.friendlyfire == 4)
	{
		if(teamkills < level.var_fe3ff9c1)
		{
			return 0;
		}
		exceeded = (teamkills - level.var_fe3ff9c1) - 1;
		return level.var_ca1c5097 + (level.var_2c3d094b * exceeded);
	}
	if(level.minimumallowedteamkills < 0 || teamkills <= level.minimumallowedteamkills)
	{
		return 0;
	}
	exceeded = teamkills - level.minimumallowedteamkills;
	return level.teamkillspawndelay * exceeded;
}

/*
	Name: function_78a6af2d
	Namespace: player
	Checksum: 0x4B1301E5
	Offset: 0x8F10
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_78a6af2d(var_821200bb)
{
	if(isbot(self))
	{
		return false;
	}
	if(level.friendlyfire == 4)
	{
		if(self.pers[#"teamkills_nostats"] >= (level.var_fe3ff9c1 + level.var_3297fce5))
		{
			return true;
		}
		return false;
	}
	if(var_821200bb && level.minimumallowedteamkills >= 0)
	{
		if(globallogic_utils::gettimepassed() >= 5000)
		{
			return true;
		}
		if(self.pers[#"teamkills_nostats"] > 1)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a932bf9c
	Namespace: player
	Checksum: 0x465C6683
	Offset: 0x8FF8
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_a932bf9c()
{
	if(level.friendlyfire == 4)
	{
		return;
	}
	timeperoneteamkillreduction = 20;
	reductionpersecond = 1 / timeperoneteamkillreduction;
	while(true)
	{
		if(isalive(self))
		{
			self.pers[#"teamkills_nostats"] = self.pers[#"teamkills_nostats"] - reductionpersecond;
			if(self.pers[#"teamkills_nostats"] < level.minimumallowedteamkills)
			{
				self.pers[#"teamkills_nostats"] = level.minimumallowedteamkills;
				break;
			}
		}
		wait(1);
	}
}

/*
	Name: ignore_team_kills
	Namespace: player
	Checksum: 0x14377AA3
	Offset: 0x90F8
	Size: 0xFE
	Parameters: 3
	Flags: Linked, Private
*/
function private ignore_team_kills(weapon, smeansofdeath, einflictor)
{
	if(weapons::ismeleemod(smeansofdeath))
	{
		return false;
	}
	if(weapon.ignore_team_kills === 1 || weapon.ignoreteamkills === 1)
	{
		return true;
	}
	if(isdefined(einflictor) && einflictor.ignore_team_kills === 1)
	{
		return true;
	}
	if(isdefined(einflictor) && isdefined(einflictor.destroyedby) && isdefined(einflictor.owner) && einflictor.destroyedby != einflictor.owner)
	{
		return true;
	}
	if(isdefined(einflictor) && einflictor.classname == "worldspawn")
	{
		return true;
	}
	return false;
}

/*
	Name: is_explosive_ragdoll
	Namespace: player
	Checksum: 0x2A90812E
	Offset: 0x9200
	Size: 0xB2
	Parameters: 2
	Flags: Linked, Private
*/
function private is_explosive_ragdoll(weapon, inflictor)
{
	if(!isdefined(weapon))
	{
		return false;
	}
	if(weapon.name == #"destructible_car" || weapon.name == #"explodable_barrel")
	{
		return true;
	}
	if(weapon.projexplosiontype == "grenade")
	{
		if(isdefined(inflictor) && isdefined(inflictor.stucktoplayer))
		{
			if(inflictor.stucktoplayer == self)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: start_explosive_ragdoll
	Namespace: player
	Checksum: 0xE7549CC0
	Offset: 0x92C0
	Size: 0x1A4
	Parameters: 2
	Flags: Linked, Private
*/
function private start_explosive_ragdoll(dir, weapon)
{
	if(!isdefined(self))
	{
		return;
	}
	x = randomintrange(50, 100);
	y = randomintrange(50, 100);
	z = randomintrange(10, 20);
	if(isdefined(weapon) && (weapon.name == #"sticky_grenade" || weapon.name == #"explosive_bolt"))
	{
		if(isdefined(dir) && lengthsquared(dir) > 0)
		{
			x = dir[0] * x;
			y = dir[1] * y;
		}
	}
	else
	{
		if(math::cointoss())
		{
			x = x * -1;
		}
		if(math::cointoss())
		{
			y = y * -1;
		}
	}
	self startragdoll();
	self launchragdoll((x, y, z));
}

/*
	Name: start_death_from_above_ragdoll
	Namespace: player
	Checksum: 0x288D9173
	Offset: 0x9470
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private start_death_from_above_ragdoll(dir)
{
	if(!isdefined(self))
	{
		return;
	}
	self startragdoll();
	self launchragdoll(vectorscale((0, 0, -1), 100));
}

/*
	Name: delayed_ragdoll
	Namespace: player
	Checksum: 0x9A684A88
	Offset: 0x94C8
	Size: 0x1FC
	Parameters: 6
	Flags: Linked, Private
*/
function private delayed_ragdoll(ent, shitloc, vdir, weapon, einflictor, smeansofdeath)
{
	if(isdefined(smeansofdeath))
	{
		if(is_true(smeansofdeath.var_6f9e9dc9))
		{
			if(!smeansofdeath isragdoll())
			{
				smeansofdeath startragdoll();
			}
			return;
		}
		deathanim = smeansofdeath getcorpseanim();
		if(isdefined(deathanim) && animhasnotetrack(deathanim, "ignore_ragdoll"))
		{
			return;
		}
	}
	waittillframeend();
	if(!isdefined(smeansofdeath))
	{
		return;
	}
	if(smeansofdeath isragdoll())
	{
		return;
	}
	deathanim = smeansofdeath getcorpseanim();
	if(!isdefined(deathanim) || animhasnotetrack(deathanim, "ignore_ragdoll"))
	{
		return;
	}
	startfrac = 0.35;
	if(animhasnotetrack(deathanim, "start_ragdoll"))
	{
		times = getnotetracktimes(deathanim, "start_ragdoll");
		if(isdefined(times))
		{
			startfrac = times[0];
		}
	}
	waittime = startfrac * getanimlength(deathanim);
	if(waittime > 0)
	{
		wait(waittime);
	}
	if(isdefined(smeansofdeath))
	{
		smeansofdeath startragdoll();
	}
}

/*
	Name: function_4ac2aefc
	Namespace: player
	Checksum: 0xA7D1FC2B
	Offset: 0x96D0
	Size: 0x364
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4ac2aefc(attacker, weapon)
{
	if(isai(attacker) && isdefined(attacker.script_owner))
	{
		if(!level.teambased || self util::isenemyteam(attacker.script_owner.team))
		{
			attacker = attacker.script_owner;
		}
	}
	if(attacker.classname == "script_vehicle" && isdefined(attacker.owner))
	{
		attacker notify(#"killed", {#victim:self});
		attacker = attacker.owner;
	}
	if(isai(attacker))
	{
		attacker notify(#"killed", {#victim:self});
	}
	if(isdefined(self.capturinglastflag) && self.capturinglastflag == 1)
	{
		attacker.lastcapkiller = 1;
	}
	if(isdefined(attacker) && attacker != self && isdefined(weapon))
	{
		if(weapon.statname == #"planemortar")
		{
			if(!isdefined(attacker.planemortarbda))
			{
				attacker.planemortarbda = 0;
			}
			attacker.planemortarbda++;
		}
		else
		{
			if(weapon.statname == #"dart" || weapon.statname == #"dart_turret")
			{
				if(!isdefined(attacker.dartbda))
				{
					attacker.dartbda = 0;
				}
				attacker.dartbda++;
			}
			else
			{
				if(weapon.name == #"straferun_rockets" || weapon.name == #"straferun_gun")
				{
					if(isdefined(attacker.straferunbda))
					{
						attacker.straferunbda++;
					}
				}
				else if(weapon.statname == #"remote_missile" || weapon.statname == #"remote_missile_missile" || weapon.name == #"remote_missile_bomblet")
				{
					if(!isdefined(attacker.remotemissilebda))
					{
						attacker.remotemissilebda = 0;
					}
					attacker.remotemissilebda++;
				}
			}
		}
	}
	if(isdefined(attacker) && isplayer(attacker) && isdefined(self.clientid))
	{
		if(!isdefined(attacker.damagedplayers))
		{
			attacker.damagedplayers = [];
		}
		attacker.damagedplayers[self.clientid] = undefined;
	}
	return attacker;
}

/*
	Name: function_813829e3
	Namespace: player
	Checksum: 0xF98A1943
	Offset: 0x9A40
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_813829e3(einflictor)
{
	if(isdefined(einflictor) && einflictor.classname == "script_vehicle")
	{
		einflictor notify(#"killed", {#victim:self});
		if(isdefined(einflictor.bda))
		{
			einflictor.bda++;
		}
	}
}

/*
	Name: update_weapon
	Namespace: player
	Checksum: 0xFEBD4488
	Offset: 0x9AC0
	Size: 0xE2
	Parameters: 2
	Flags: Linked, Private
*/
function private update_weapon(einflictor, weapon)
{
	if(weapon == level.weaponnone && isdefined(einflictor))
	{
		if(isdefined(einflictor.targetname) && einflictor.targetname == "explodable_barrel")
		{
			weapon = getweapon(#"explodable_barrel");
		}
		else if(isdefined(einflictor.destructible_type) && issubstr(einflictor.destructible_type, "vehicle_"))
		{
			weapon = getweapon(#"destructible_car");
		}
	}
	return weapon;
}

/*
	Name: function_e8decd0b
	Namespace: player
	Checksum: 0xC9130496
	Offset: 0x9BB0
	Size: 0x1E0
	Parameters: 5
	Flags: Linked, Private
*/
function private function_e8decd0b(attacker, weapon, victim, einflictor, smeansofdeath)
{
	if(isplayer(attacker) && smeansofdeath !== "MOD_EXECUTION")
	{
		if(!killstreaks::is_killstreak_weapon(weapon) || killstreaks::function_e3a30c69(weapon))
		{
			attackerentnum = attacker getentitynumber();
			var_46604f00 = level.var_648e79b7[attackerentnum];
			if(attacker.var_d853c1af === 1 || !isdefined(var_46604f00))
			{
				statname = #"hash_23e04a595aa862a";
				var_46604f00 = {#inflictor:einflictor, #victim:victim, #weapon:weapon, #timestamp:gettime() + level.var_42648a02[statname][3], #statname:statname};
				level.var_648e79b7[attackerentnum] = var_46604f00;
			}
		}
	}
	if(isdefined(einflictor))
	{
		function_6eac4ca1(einflictor, "attack_kill");
		einflictor notify(#"bhtn_action_notify", {#action:"attack_kill"});
	}
	level notify(#"hash_6c17824062de93e5");
}

/*
	Name: function_ed2725ad
	Namespace: player
	Checksum: 0x3E75B0DB
	Offset: 0x9D98
	Size: 0x856
	Parameters: 3
	Flags: Linked
*/
function function_ed2725ad(einflictor, attacker, weapon)
{
	if(isalive(attacker))
	{
		pixbeginevent();
		if(!isdefined(einflictor) || !isdefined(einflictor.requireddeathcount) || attacker.deathcount == einflictor.requireddeathcount)
		{
			shouldgivekillstreak = killstreaks::should_give_killstreak(weapon);
			shouldgivekillstreak = shouldgivekillstreak & !attacker isinvehicle();
			if(shouldgivekillstreak)
			{
				attacker killstreaks::add_to_killstreak_count(weapon);
			}
			attacker.pers[#"cur_total_kill_streak"]++;
			attacker setplayercurrentstreak(attacker.pers[#"cur_total_kill_streak"]);
			if(isdefined(level.killstreaks) && shouldgivekillstreak)
			{
				attacker.pers[#"cur_kill_streak"]++;
				var_6456e8ec = attacker.pers[#"cur_kill_streak"];
				if(attacker.pers[#"cur_kill_streak"] > attacker.pers[#"hash_763287bc117e302f"])
				{
					attacker.pers[#"hash_763287bc117e302f"] = attacker.pers[#"cur_kill_streak"];
					if(level.onlinegame)
					{
						var_49174772 = ((attacker.pers[#"hash_6f1b3f108570635b"] * attacker.pers[#"hash_20893916fb58d59f"]) + attacker.pers[#"hash_763287bc117e302f"]) / (attacker.pers[#"hash_20893916fb58d59f"] + 1);
						attacker stats::function_baa25a23(#"hash_28eb9f07121bf4e8", int(var_49174772 + 0.5));
						attacker.pers[#"hash_222259801297f7c3"] = var_49174772;
					}
				}
				if(var_6456e8ec >= 2)
				{
					if((var_6456e8ec % 3) == 0)
					{
						attacker contracts::function_a54e2068(#"hash_7421121f0a9bbb59");
						attacker contracts::function_a54e2068(#"hash_5dbc64ebf45c8ee3");
						attacker stats::function_dad108fa(#"hash_1e44ac63ebde7a17", 1);
					}
					var_c874a8ab = 0;
					if((var_6456e8ec % 5) == 0)
					{
						attacker activecamo::function_896ac347(weapon, #"killstreak_5", 1);
						attacker challenges::function_38ad2427(#"hash_6f392a12f973aea5", 1);
						attacker stats::function_dad108fa(#"hash_4dd8ba4e6feef49", 1);
						attacker stats::function_dad108fa(#"hash_9a724d151675675", 1);
						attacker stats::function_dad108fa(#"hash_5e6403da30069b30", 1);
						attacker contracts::function_a54e2068(#"hash_4c15367eed618401");
						attacker contracts::function_a54e2068(#"hash_28f8bfd8c472ba9b");
						var_c874a8ab = int(min(floor(var_c874a8ab / 5), 6));
					}
					if((var_6456e8ec % 10) == 0)
					{
						attacker challenges::killstreakten();
						attacker contracts::function_a54e2068(#"hash_73a8663654fdba0b");
					}
					var_dbaa74e2 = {#hash_c874a8ab:var_c874a8ab, #notificationtype:#"streak"};
					if(var_6456e8ec <= 30)
					{
						var_f952d0b8 = #"killstreak_" + attacker.pers[#"cur_kill_streak"];
						scoreevents::processscoreevent(var_f952d0b8, attacker, self, weapon, undefined, var_dbaa74e2);
						if(var_6456e8ec == 30)
						{
							attacker challenges::killstreak_30_noscorestreaks();
						}
						if((var_6456e8ec % 5) == 0)
						{
							attacker stats::function_cc215323(var_f952d0b8 + "_for_medal_spotlight", 1);
						}
					}
					else
					{
						scoreevents::processscoreevent(#"killstreak_more_than_30", attacker, self, weapon, undefined, var_dbaa74e2);
					}
					if(isdefined(attacker.var_ea1458aa))
					{
						if(attacker.pers[#"cur_kill_streak"] >= 5 && attacker.pers[#"cur_kill_streak"] % 5 && attacker.pers[#"cur_kill_streak"] < 30 || attacker.pers[#"cur_kill_streak"] > 30)
						{
							if(!isdefined(attacker.var_ea1458aa.var_2bad4cbb))
							{
								attacker.var_ea1458aa.var_2bad4cbb = 0;
							}
							attacker.var_ea1458aa.var_2bad4cbb++;
							attacker challenges::function_a4db0a4c();
						}
					}
				}
				if(!isdefined(level.usingmomentum) || !level.usingmomentum)
				{
					attacker thread killstreaks::give_for_streak();
				}
			}
		}
		pixendevent();
	}
	if(isdefined(attacker.gametype_kill_streak) && attacker.pers[#"cur_kill_streak"] > attacker.gametype_kill_streak)
	{
		attacker stats::function_baa25a23(#"kill_streak", attacker.pers[#"cur_kill_streak"]);
		attacker.gametype_kill_streak = attacker.pers[#"cur_kill_streak"];
	}
	if(isdefined(attacker.var_b6f732c0) && attacker.pers[#"cur_kill_streak"] > attacker.var_b6f732c0)
	{
		attacker stats::function_4db3fba1(#"hash_5ef976b050e0aa48", attacker.pers[#"cur_kill_streak"]);
		attacker.var_b6f732c0 = attacker.pers[#"cur_kill_streak"];
	}
}

/*
	Name: function_ff3ec0d4
	Namespace: player
	Checksum: 0xC90B60D5
	Offset: 0xA5F8
	Size: 0x126
	Parameters: 10
	Flags: Linked
*/
function function_ff3ec0d4(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration)
{
	foreach(callback in level.var_da2045d0)
	{
		if(callback.threaded)
		{
			self thread [[callback.callback]](attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration);
			continue;
		}
		self [[callback.callback]](attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration);
	}
}

/*
	Name: function_b8871aa2
	Namespace: player
	Checksum: 0xC8FFA8F7
	Offset: 0xA728
	Size: 0xE6
	Parameters: 4
	Flags: Linked
*/
function function_b8871aa2(einflictor, victim, idamage, weapon)
{
	foreach(callback in level.var_fa66fada)
	{
		if(callback.threaded)
		{
			self thread [[callback.callback]](einflictor, victim, idamage, weapon);
			continue;
		}
		self [[callback.callback]](einflictor, victim, idamage, weapon);
	}
}

