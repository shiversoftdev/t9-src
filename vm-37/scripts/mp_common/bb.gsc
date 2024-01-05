#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace bb;

/*
	Name: __init__system__
	Namespace: bb
	Checksum: 0x8783A90
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"bb", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bb
	Checksum: 0x2D55FDDD
	Offset: 0x140
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	callback::on_spawned(&on_player_spawned);
	callback::on_player_killed(&on_player_death);
}

/*
	Name: on_player_spawned
	Namespace: bb
	Checksum: 0xFD28C8A0
	Offset: 0x1A0
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self._bbdata = [];
	self._bbdata[#"score"] = 0;
	self._bbdata[#"momentum"] = 0;
	self._bbdata[#"spawntime"] = gettime();
	self._bbdata[#"shots"] = 0;
	self._bbdata[#"hits"] = 0;
}

/*
	Name: function_bf5cad4e
	Namespace: bb
	Checksum: 0x178C57DD
	Offset: 0x230
	Size: 0x2AC
	Parameters: 1
	Flags: Linked
*/
function function_bf5cad4e(var_1e866967)
{
	var_10d87328 = (isdefined(level.var_8a3a9ca4.roundend) ? level.var_8a3a9ca4.roundend : 0) - (isdefined(level.var_8a3a9ca4.roundstart) ? level.var_8a3a9ca4.roundstart : 0);
	firstblood = (isdefined(level.var_8a3a9ca4.firstblood) ? level.var_8a3a9ca4.firstblood : 0) - (isdefined(level.var_8a3a9ca4.roundstart) ? level.var_8a3a9ca4.roundstart : 0);
	alliesscore = (isdefined([[level._getteamscore]](#"allies")) ? [[level._getteamscore]](#"allies") : 0);
	axisscore = (isdefined([[level._getteamscore]](#"axis")) ? [[level._getteamscore]](#"axis") : 0);
	var_5e25b17b = abs(alliesscore - axisscore);
	var_1e866967 = {};
	var_1e866967.gamemode = level.gametype;
	var_1e866967.wintype = (isdefined(var_1e866967.wintype) ? var_1e866967.wintype : "NA");
	var_1e866967.var_10d87328 = var_10d87328;
	var_1e866967.firstblood = firstblood;
	var_1e866967.var_5e25b17b = var_5e25b17b;
	var_1e866967.timeremaining = (isdefined(var_1e866967.remainingtime) ? var_1e866967.remainingtime : 0);
	var_1e866967.var_20de6a02 = (isdefined(var_1e866967.var_20de6a02) ? var_1e866967.var_20de6a02 : 0);
	var_1e866967.var_be1de2ab = (isdefined(var_1e866967.var_be1de2ab) ? var_1e866967.var_be1de2ab : 0);
	function_92d1707f(#"hash_1a63efe7c6121b24", var_1e866967);
}

/*
	Name: function_95a5b5c2
	Namespace: bb
	Checksum: 0xBA730A84
	Offset: 0x4E8
	Size: 0x194
	Parameters: 5
	Flags: None
*/
function function_95a5b5c2(var_daec1817, label, team, origin, player)
{
	if(sessionmodeismultiplayergame())
	{
		var_cfad67d4 = (ishash(team) ? team : hash(team));
		if(isplayer(player))
		{
			clientid = (isdefined(player.clientid) ? player.clientid : -1);
			player function_678f57c8(#"hash_d424efe4db1dff7", {#clientid:clientid, #playerz:origin[2], #playery:origin[1], #playerx:origin[0], #team:var_cfad67d4, #label:label, #objtype:var_daec1817, #gametime:function_f8d53445()});
		}
	}
}

/*
	Name: function_c3b9e07f
	Namespace: bb
	Checksum: 0xEC283824
	Offset: 0x688
	Size: 0x1EC
	Parameters: 13
	Flags: Linked
*/
function function_c3b9e07f(eattacker, attackerorigin, var_a48b1a67, attackerweapon, evictim, victimorigin, var_76d450bd, victimweapon, idamage, smeansofdeath, shitloc, death, killstreak)
{
	if(!sessionmodeismultiplayergame())
	{
		return;
	}
	mpattacks = {};
	mpattacks.gametime = function_f8d53445();
	if(isdefined(eattacker))
	{
		mpattacks.attackerspawnid = getplayerspawnid(eattacker);
	}
	if(isdefined(attackerorigin))
	{
		mpattacks.attackerx = attackerorigin[0];
		mpattacks.attackery = attackerorigin[1];
		mpattacks.attackerz = attackerorigin[2];
	}
	mpattacks.var_a48b1a67 = var_a48b1a67;
	mpattacks.attackerweapon = attackerweapon;
	if(isdefined(evictim))
	{
		mpattacks.victimspawnid = getplayerspawnid(evictim);
	}
	if(isdefined(victimorigin))
	{
		mpattacks.victimx = victimorigin[0];
		mpattacks.victimy = victimorigin[1];
		mpattacks.victimz = victimorigin[2];
	}
	mpattacks.var_76d450bd = var_76d450bd;
	mpattacks.victimweapon = victimweapon;
	mpattacks.damage = idamage;
	mpattacks.damagetype = smeansofdeath;
	mpattacks.damagelocation = shitloc;
	mpattacks.death = death;
	mpattacks.killstreak = killstreak;
	function_92d1707f(#"hash_67e3a427b7ec1819", mpattacks);
}

/*
	Name: on_player_death
	Namespace: bb
	Checksum: 0x4073729
	Offset: 0x880
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function on_player_death(params)
{
	if(isbot(self))
	{
		return;
	}
	if(game.state == #"playing")
	{
		self commit_spawn_data();
	}
}

/*
	Name: function_6661621a
	Namespace: bb
	Checksum: 0x5F5849C9
	Offset: 0x8E8
	Size: 0x71C
	Parameters: 0
	Flags: Linked
*/
function function_6661621a()
{
	if(isbot(self))
	{
		return;
	}
	/#
		/#
			assert(isdefined(self._bbdata));
		#/
	#/
	if(!isdefined(self.class_num))
	{
		return;
	}
	if(!sessionmodeismultiplayergame())
	{
		return;
	}
	mploadout = spawnstruct();
	mploadout.gametime = function_f8d53445();
	mploadout.spawnid = getplayerspawnid(self);
	primaryweapon = self getloadoutweapon(self.class_num, "primary");
	mploadout.primary = primaryweapon.name;
	primaryattachments = function_285f8efd(primaryweapon);
	mploadout.primaryattachment1 = primaryattachments.attachment0;
	mploadout.primaryattachment2 = primaryattachments.attachment1;
	mploadout.primaryattachment3 = primaryattachments.attachment2;
	mploadout.primaryattachment4 = primaryattachments.attachment3;
	mploadout.primaryattachment5 = primaryattachments.attachment4;
	mploadout.primaryreticle = hash(self getweaponoptic(primaryweapon));
	mploadout.var_813fa3e2 = self function_a83d51c5(self.class_num, 1);
	secondaryweapon = self getloadoutweapon(self.class_num, "secondary");
	mploadout.secondary = secondaryweapon.name;
	secondaryattachments = function_285f8efd(secondaryweapon);
	mploadout.secondaryattachment1 = secondaryattachments.attachment0;
	mploadout.secondaryattachment2 = secondaryattachments.attachment1;
	mploadout.secondaryattachment3 = secondaryattachments.attachment2;
	mploadout.secondaryattachment4 = secondaryattachments.attachment3;
	mploadout.secondaryattachment5 = secondaryattachments.attachment4;
	mploadout.secondaryreticle = hash(self getweaponoptic(secondaryweapon));
	mploadout.var_69054e67 = self function_a83d51c5(self.class_num, 0);
	primarygrenade = self function_826ed2dd();
	mploadout.primarygrenade = primarygrenade.name;
	mploadout.primarygrenadecount = (self getloadoutitem(self.class_num, "primarygrenadecount") ? 2 : 1);
	mploadout.specialgrenade = self function_b958b70d(self.class_num, "secondarygrenade");
	mploadout.specialgrenadecount = (self getloadoutitem(self.class_num, "secondarygrenadecount") ? 2 : 1);
	fieldupgrade = self loadout::function_18a77b37("specialgrenade");
	mploadout.fieldupgrade = fieldupgrade.name;
	mploadout.tacticalgear = self function_d78e0e04(self.class_num);
	mploadout.killstreak1 = (self.killstreak.size > 0 ? hash(self.killstreak[0]) : 0);
	mploadout.killstreak2 = (self.killstreak.size > 1 ? hash(self.killstreak[1]) : 0);
	mploadout.killstreak3 = (self.killstreak.size > 2 ? hash(self.killstreak[2]) : 0);
	talents = self function_4a9f1384(self.class_num);
	mploadout.talent0 = (talents.size > 0 ? talents[0] : 0);
	mploadout.talent1 = (talents.size > 1 ? talents[1] : 0);
	mploadout.talent2 = (talents.size > 2 ? talents[2] : 0);
	mploadout.talent3 = (talents.size > 3 ? talents[3] : 0);
	mploadout.talent4 = (talents.size > 4 ? talents[4] : 0);
	mploadout.talent5 = (talents.size > 5 ? talents[5] : 0);
	wildcards = self function_6f2c0492(self.class_num);
	mploadout.wildcard0 = (wildcards.size > 0 ? wildcards[0] : 0);
	mploadout.wildcard1 = (wildcards.size > 1 ? wildcards[1] : 0);
	mploadout.wildcard2 = (wildcards.size > 2 ? wildcards[2] : 0);
	if(isdefined(self.playerrole) && isdefined(self.playerrole.var_c21d61e9))
	{
		var_c0f05cbb = getweapon((isdefined(self.playerrole.var_c21d61e9) ? self.playerrole.var_c21d61e9 : level.weaponnone));
	}
	else
	{
		var_c0f05cbb = level.weaponnone;
	}
	mploadout.var_9911e1f2 = var_c0f05cbb.name;
	mploadout.specialistindex = (isdefined(self getspecialistindex()) ? self getspecialistindex() : -1);
	function_92d1707f(#"hash_30b542620e21966d", #"mploadouts", mploadout);
}

/*
	Name: commit_spawn_data
	Namespace: bb
	Checksum: 0x6360929D
	Offset: 0x1010
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function commit_spawn_data()
{
	if(isbot(self))
	{
		return;
	}
	/#
		/#
			assert(isdefined(self._bbdata));
		#/
	#/
	if(!isdefined(self._bbdata))
	{
		return;
	}
	if(!sessionmodeismultiplayergame())
	{
		return;
	}
	specialistindex = (isdefined(self getspecialistindex()) ? self getspecialistindex() : -1);
	mpplayerlives = {#specialist:specialistindex, #name:self.name, #lifetime:gettime() - self._bbdata[#"spawntime"], #lifemomentum:self._bbdata[#"momentum"], #lifescore:self._bbdata[#"score"], #spawnid:getplayerspawnid(self), #gametime:function_f8d53445()};
	function_92d1707f(#"hash_6fc210ad5f081ce8", mpplayerlives);
	self function_6661621a();
}

/*
	Name: function_285f8efd
	Namespace: bb
	Checksum: 0x96CCBB10
	Offset: 0x11F8
	Size: 0x296
	Parameters: 1
	Flags: Linked
*/
function function_285f8efd(weapon)
{
	var_e38a0464 = spawnstruct();
	var_e38a0464.attachment0 = 0;
	var_e38a0464.attachment1 = 0;
	var_e38a0464.attachment2 = 0;
	var_e38a0464.attachment3 = 0;
	var_e38a0464.attachment4 = 0;
	var_e38a0464.attachment5 = 0;
	var_e38a0464.attachment6 = 0;
	var_e38a0464.attachment7 = 0;
	if(!isdefined(weapon) || weapon.attachments.size == 0)
	{
		return var_e38a0464;
	}
	var_e38a0464.attachment0 = hash(weapon.attachments[0]);
	if(weapon.attachments.size == 1)
	{
		return var_e38a0464;
	}
	var_e38a0464.attachment1 = hash(weapon.attachments[1]);
	if(weapon.attachments.size == 2)
	{
		return var_e38a0464;
	}
	var_e38a0464.attachment2 = hash(weapon.attachments[2]);
	if(weapon.attachments.size == 3)
	{
		return var_e38a0464;
	}
	var_e38a0464.attachment3 = hash(weapon.attachments[3]);
	if(weapon.attachments.size == 4)
	{
		return var_e38a0464;
	}
	var_e38a0464.attachment4 = hash(weapon.attachments[4]);
	if(weapon.attachments.size == 5)
	{
		return var_e38a0464;
	}
	var_e38a0464.attachment5 = hash(weapon.attachments[5]);
	if(weapon.attachments.size == 6)
	{
		return var_e38a0464;
	}
	var_e38a0464.attachment6 = hash(weapon.attachments[6]);
	if(weapon.attachments.size == 7)
	{
		return var_e38a0464;
	}
	var_e38a0464.attachment7 = hash(weapon.attachments[7]);
	return var_e38a0464;
}

