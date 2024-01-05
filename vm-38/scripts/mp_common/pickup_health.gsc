#using scripts\abilities\gadgets\gadget_health_regen.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace pickup_health;

/*
	Name: function_5adfce5a
	Namespace: pickup_health
	Checksum: 0x7F065F
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5adfce5a()
{
	level notify(-678819977);
}

/*
	Name: __init__system__
	Namespace: pickup_health
	Checksum: 0x99256FBF
	Offset: 0x130
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"pickup_health", &function_70a657d8, undefined, undefined, #"weapons");
}

/*
	Name: function_70a657d8
	Namespace: pickup_health
	Checksum: 0x90AC0A86
	Offset: 0x180
	Size: 0x12C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_connect(&onconnect);
	callback::on_spawned(&onspawned);
	ability_player::register_gadget_activation_callbacks(23, &onhealthregen, &offhealthregen);
	level.healingdisabled = &offhealthregen;
	level.var_99a34951 = getgametypesetting(#"hash_712f4c2a96bca56e");
	level.var_33a3ef40 = getgametypesetting(#"hash_647310a2fe3554f7");
	level.var_aff59367 = getgametypesetting(#"hash_44533f4f290c5e77");
	level.pickup_respawn_time = getgametypesetting(#"hash_6a2434c947c86b9b");
}

/*
	Name: function_e963e37d
	Namespace: pickup_health
	Checksum: 0x853B551
	Offset: 0x2B8
	Size: 0x22E
	Parameters: 0
	Flags: None
*/
function function_e963e37d()
{
	var_7a23c03b = getentarray("pickup_health", "targetname");
	foreach(pickup in var_7a23c03b)
	{
		pickup.trigger = spawn("trigger_radius_use", pickup.origin + vectorscale((0, 0, 1), 15), 0, 120, 100);
		pickup.trigger setcursorhint("HINT_INTERACTIVE_PROMPT");
		pickup.trigger triggerignoreteam();
		pickup.gameobject = gameobjects::create_use_object(#"neutral", pickup.trigger, [], (0, 0, 0), "pickup_health");
		pickup.gameobject gameobjects::set_objective_entity(pickup.gameobject);
		pickup.gameobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
		pickup.gameobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
		pickup.gameobject gameobjects::set_use_time(0);
		pickup.gameobject.usecount = 0;
		pickup.gameobject.var_5ecd70 = pickup;
		pickup.gameobject.onuse = &function_5bb13b48;
	}
}

/*
	Name: function_dd4bf8ac
	Namespace: pickup_health
	Checksum: 0x612BE3EA
	Offset: 0x4F0
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_dd4bf8ac(num)
{
	if(self.pers[#"pickup_health"] < level.var_99a34951)
	{
		self.pers[#"pickup_health"] = self.pers[#"pickup_health"] + num;
		self function_2bcfabea();
		return true;
	}
	return false;
}

/*
	Name: onconnect
	Namespace: pickup_health
	Checksum: 0x63EAEA61
	Offset: 0x588
	Size: 0x3C
	Parameters: 0
	Flags: Private
*/
function private onconnect()
{
	if(!isdefined(self.pers[#"pickup_health"]))
	{
		self.pers[#"pickup_health"] = 0;
	}
}

/*
	Name: onspawned
	Namespace: pickup_health
	Checksum: 0x61902198
	Offset: 0x5D0
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private onspawned()
{
	self function_3fbb0e22();
}

/*
	Name: function_3fbb0e22
	Namespace: pickup_health
	Checksum: 0x22355900
	Offset: 0x5F8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_3fbb0e22()
{
	waitframe(1);
	self function_2bcfabea();
}

/*
	Name: onhealthregen
	Namespace: pickup_health
	Checksum: 0x3B1B4F05
	Offset: 0x620
	Size: 0x2E
	Parameters: 2
	Flags: Private
*/
function private onhealthregen(slot, weapon)
{
	self.pers[#"pickup_health"]--;
}

/*
	Name: offhealthregen
	Namespace: pickup_health
	Checksum: 0x90A3A2D6
	Offset: 0x658
	Size: 0x4C
	Parameters: 2
	Flags: Private
*/
function private offhealthregen(slot, weapon)
{
	self gadgetdeactivate(self.gadget_health_regen_slot, self.gadget_health_regen_weapon);
	thread healingdone();
}

/*
	Name: healingdone
	Namespace: pickup_health
	Checksum: 0x2139A104
	Offset: 0x6B0
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private healingdone()
{
	wait(0.5);
	self function_2bcfabea();
}

/*
	Name: function_5bb13b48
	Namespace: pickup_health
	Checksum: 0x9787642E
	Offset: 0x6E0
	Size: 0x1CC
	Parameters: 1
	Flags: Private
*/
function private function_5bb13b48(player)
{
	if(isdefined(player) && isplayer(player))
	{
		if(player function_dd4bf8ac(1))
		{
			if(isdefined(self.objectiveid))
			{
				objective_setinvisibletoplayer(self.objectiveid, player);
			}
			self.var_5ecd70 setinvisibletoplayer(player);
			self.trigger setinvisibletoplayer(player);
			player playsoundtoplayer(#"hash_8a4d3f134fa94d7", player);
			self.usecount++;
			player gestures::function_56e00fbf(#"gestable_grab", undefined, 0);
			if(is_true(level.var_aff59367))
			{
				self thread function_7a80944d(player);
			}
		}
		else
		{
			player iprintlnbold(#"hash_5a11b7ef0cd7e33b");
			player playsoundtoplayer(#"uin_default_action_denied", player);
		}
	}
	if(!is_true(level.var_aff59367) && self.usecount >= level.var_ad9d03e7)
	{
		self.var_5ecd70 delete();
		self gameobjects::disable_object(1);
	}
}

/*
	Name: function_7a80944d
	Namespace: pickup_health
	Checksum: 0x81508CA6
	Offset: 0x8B8
	Size: 0xC4
	Parameters: 1
	Flags: Private
*/
function private function_7a80944d(player)
{
	level endon(#"game_ended");
	self endon(#"death");
	player endon(#"disconnect");
	wait((isdefined(level.pickup_respawn_time) ? level.pickup_respawn_time : 0));
	if(isdefined(self.objectiveid))
	{
		objective_setvisibletoplayer(self.objectiveid, player);
	}
	self.var_5ecd70 setvisibletoplayer(player);
	self.trigger setvisibletoplayer(player);
}

/*
	Name: function_2bcfabea
	Namespace: pickup_health
	Checksum: 0x2E7561BA
	Offset: 0x988
	Size: 0x15C
	Parameters: 0
	Flags: Private
*/
function private function_2bcfabea()
{
	if(!isdefined(self) || !isdefined(self.pers[#"pickup_health"]))
	{
		return;
	}
	if(self.pers[#"pickup_health"] <= 0)
	{
		self gadget_health_regen::power_off();
		if(isdefined(self.gadget_health_regen_slot))
		{
			self function_19ed70ca(self.gadget_health_regen_slot, 1);
		}
		if(self.pers[#"pickup_health"] < 0)
		{
			self.pers[#"pickup_health"] = 0;
		}
	}
	else
	{
		self gadget_health_regen::power_on();
		if(self.pers[#"pickup_health"] > level.var_99a34951)
		{
			self.pers[#"pickup_health"] = level.var_99a34951;
		}
	}
	self clientfield::set_player_uimodel("hudItems.numHealthPickups", self.pers[#"pickup_health"]);
}

