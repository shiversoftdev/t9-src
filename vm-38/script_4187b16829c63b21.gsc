#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;

#namespace namespace_5ce39742;

/*
	Name: function_5a6298e2
	Namespace: namespace_5ce39742
	Checksum: 0xBF34B00C
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5a6298e2()
{
	level notify(960489365);
}

/*
	Name: init
	Namespace: namespace_5ce39742
	Checksum: 0xC9A21EF
	Offset: 0xF0
	Size: 0x160
	Parameters: 0
	Flags: Linked
*/
function init()
{
	var_bbad5c42 = struct::get_array("turret_trigger_pos", "targetname");
	if(isdefined(var_bbad5c42))
	{
		foreach(turret_pos in var_bbad5c42)
		{
			turret_pos.var_e12c4557 = 1;
			turret_pos.activate = 0;
			turret_pos.in_use = 0;
			turret_trigger = turret_pos zm_unitrigger::create(&function_a5680385, 64, &function_5b0907b8);
			turret_trigger.turret_pos = turret_pos;
			var_51c78859 = getent(turret_pos.target, "targetname");
			if(isdefined(var_51c78859))
			{
				turret_pos.var_51c78859 = var_51c78859;
				var_51c78859 function_619a5c20();
			}
		}
	}
}

/*
	Name: function_a5680385
	Namespace: namespace_5ce39742
	Checksum: 0xC97122BB
	Offset: 0x258
	Size: 0x224
	Parameters: 1
	Flags: Linked
*/
function function_a5680385(e_player)
{
	e_player globallogic::function_d96c031e();
	if(isplayer(e_player))
	{
		if(!level flag::get("power_on" + self.stub.turret_pos.script_int))
		{
			self sethintstringforplayer(e_player, #"hash_39f4be8dba832f61");
			return true;
		}
		if(is_true(self.stub.turret_pos.activate) && !is_true(self.stub.turret_pos.in_use))
		{
			self sethintstringforplayer(e_player, #"hash_fcbeeb83bef84fa");
			return true;
		}
		if(!is_true(self.stub.turret_pos.var_e12c4557))
		{
			self sethintstringforplayer(e_player, #"hash_44085f35e03f91c7");
			return true;
		}
		if(!is_true(self.stub.turret_pos.activate))
		{
			self sethintstringforplayer(e_player, #"hash_782f31c93c442bc6", 1000);
			if(!e_player zm_score::can_player_purchase(1000))
			{
				e_player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
			}
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_5b0907b8
	Namespace: namespace_5ce39742
	Checksum: 0x7C5C9555
	Offset: 0x488
	Size: 0x262
	Parameters: 0
	Flags: Linked
*/
function function_5b0907b8()
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		player = waitresult.activator;
		if(!is_true(self.stub.turret_pos.activate) && level flag::get("power_on" + self.stub.turret_pos.script_int))
		{
			if(player zm_score::can_player_purchase(1000) && is_true(self.stub.turret_pos.var_e12c4557))
			{
				self.stub.turret_pos.var_e12c4557 = 0;
				self.stub.turret_pos.activate = 1;
				self.stub.turret_pos.in_use = 1;
				player thread zm_score::minus_to_player_score(1000);
				self.stub.turret_pos thread function_bc566f03();
				self.stub.turret_pos thread function_2fbfe4fb(player);
			}
		}
		else if(!is_true(self.stub.turret_pos.in_use) && is_true(self.stub.turret_pos.activate))
		{
			self.stub.turret_pos thread function_2fbfe4fb(player);
			self.stub.turret_pos.in_use = 1;
		}
	}
}

/*
	Name: function_2fbfe4fb
	Namespace: namespace_5ce39742
	Checksum: 0x1227E52F
	Offset: 0x6F8
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_2fbfe4fb(player)
{
	player endon(#"player_down", #"death");
	self.var_51c78859 makevehicleusable();
	self.var_51c78859 usevehicle(player, 0);
	self.var_3c15443c = player;
	self.var_3c15443c thread zm_equipment::show_hint_text(#"hash_76a210962c3e24eb", 60);
	player waittill(#"exit_vehicle");
	self.in_use = 0;
	self.var_51c78859 makevehicleunusable();
	if(isdefined(self.var_3c15443c))
	{
		self.var_3c15443c notify(#"hide_equipment_hint_text");
		self.var_3c15443c = undefined;
	}
}

/*
	Name: function_bc566f03
	Namespace: namespace_5ce39742
	Checksum: 0x9E4B3FFC
	Offset: 0x810
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_bc566f03()
{
	wait(60);
	self notify(#"time_out");
	self.activate = 0;
	self thread function_6393ca3a();
	if(isdefined(self.var_3c15443c))
	{
		self.var_51c78859 usevehicle(self.var_3c15443c, 0);
		self.var_3c15443c = undefined;
	}
	self.var_51c78859 makevehicleunusable();
}

/*
	Name: function_6393ca3a
	Namespace: namespace_5ce39742
	Checksum: 0x7DD5685F
	Offset: 0x8A8
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function function_6393ca3a()
{
	wait(60);
	self.var_e12c4557 = 1;
}

