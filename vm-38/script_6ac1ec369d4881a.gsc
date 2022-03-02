#using script_383a3b1bb18ba876;
#using script_6c8abe14025b47c4;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace armor;

/*
	Name: function_2ce57693
	Namespace: armor
	Checksum: 0x995CEC8D
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2ce57693()
{
	level notify(738977989);
}

#namespace weapon_armor;

/*
	Name: function_89f2df9
	Namespace: weapon_armor
	Checksum: 0x26080766
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"weapon_armor", &init_shared, undefined, undefined, undefined);
}

/*
	Name: init_shared
	Namespace: weapon_armor
	Checksum: 0x80E7847B
	Offset: 0x120
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	killstreaks::function_e4ef8390("weapon_armor", &use_armor);
	callback::on_player_killed(&on_player_killed);
}

/*
	Name: use_armor
	Namespace: weapon_armor
	Checksum: 0xE58E0839
	Offset: 0x178
	Size: 0x206
	Parameters: 1
	Flags: Linked
*/
function use_armor(killstreaktype)
{
	if(self killstreakrules::iskillstreakallowed("weapon_armor", self.team) == 0)
	{
		return false;
	}
	self.var_c79fb13d = self killstreakrules::killstreakstart("weapon_armor", self.team);
	if(self.var_c79fb13d == -1)
	{
		return false;
	}
	if(isdefined(self.var_f721af54))
	{
		self.var_f721af54 delete();
	}
	var_f721af54 = spawn("script_origin", self.origin);
	var_f721af54 linkto(self);
	self.var_f721af54 = var_f721af54;
	var_f721af54 killstreaks::configure_team("weapon_armor", self.var_c79fb13d, self);
	self playlocalsound(#"hash_1e84a47d66834c73");
	self armor::set_armor(150, 150, 2, 0.4, 1, 0.5, 0, 1, 1, 1);
	self.var_67f4fd41 = &function_b299c6ec;
	self waittill(#"weapon_change_complete", #"death", #"disconnect", #"joined_team", #"killstreak_done");
	return true;
}

/*
	Name: function_b299c6ec
	Namespace: weapon_armor
	Checksum: 0xB63A1424
	Offset: 0x388
	Size: 0xCC
	Parameters: 2
	Flags: Linked
*/
function function_b299c6ec(eattacker, weapon)
{
	if(!isdefined(self.var_c79fb13d))
	{
		return;
	}
	if(sessionmodeismultiplayergame())
	{
		killstreakrules::killstreakstop("weapon_armor", self.team, self.var_c79fb13d);
	}
	self.var_c79fb13d = undefined;
	if(isdefined(self.var_f721af54))
	{
		self.var_f721af54 delete();
	}
	if(isplayer(eattacker))
	{
		scoreevents::processscoreevent(#"hash_7b5132f56f758d9", eattacker, self, weapon);
	}
}

/*
	Name: on_player_killed
	Namespace: weapon_armor
	Checksum: 0xFFC24DA2
	Offset: 0x460
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function on_player_killed(params)
{
	if(armor::function_4f977182() > 0 && isdefined(self.var_c79fb13d))
	{
		if(sessionmodeismultiplayergame())
		{
			killstreakrules::killstreakstop("weapon_armor", self.team, self.var_c79fb13d);
		}
		self.var_c79fb13d = undefined;
		if(isdefined(self.var_f721af54))
		{
			self.var_f721af54 delete();
		}
		eattacker = params.eattacker;
		weapon = params.weapon;
		if(isplayer(eattacker) && eattacker != self)
		{
			scoreevents::processscoreevent(#"hash_7b5132f56f758d9", eattacker, self, weapon);
		}
	}
}

