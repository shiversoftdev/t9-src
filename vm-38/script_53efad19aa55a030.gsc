#using script_5ab658148b984423;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_progress;

/*
	Name: function_f84673b1
	Namespace: zm_progress
	Checksum: 0x916D345D
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f84673b1()
{
	level notify(922135173);
}

/*
	Name: main
	Namespace: zm_progress
	Checksum: 0xC437C28A
	Offset: 0x140
	Size: 0x24
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.zm_build_progress = zm_build_progress::register();
}

/*
	Name: function_53a680b8
	Namespace: zm_progress
	Checksum: 0x58F97391
	Offset: 0x170
	Size: 0x132
	Parameters: 6
	Flags: Linked
*/
function function_53a680b8(var_deac51dd, var_5301f4f1, var_13c55557, var_4737bddd, var_ac28bd17, var_3e17832)
{
	params = spawnstruct();
	params.var_e2ae1db1 = 1;
	params.var_2b18af9d = 0.76;
	params.var_8dfc1be0 = int(3000);
	params.var_69681160 = getweapon(#"zombie_builder");
	params.fx_name = level._effect[#"building_dust"];
	params.fx_loop = 0.5;
	params.var_deac51dd = var_deac51dd;
	params.var_5301f4f1 = var_5301f4f1;
	params.var_13c55557 = var_13c55557;
	params.var_4737bddd = var_4737bddd;
	params.var_ac28bd17 = var_ac28bd17;
	params.var_3e17832 = var_3e17832;
	return params;
}

/*
	Name: function_163442cb
	Namespace: zm_progress
	Checksum: 0x23E18AF
	Offset: 0x2B0
	Size: 0x22
	Parameters: 2
	Flags: Linked
*/
function function_163442cb(params, w_weapon)
{
	params.var_69681160 = w_weapon;
}

/*
	Name: function_89769800
	Namespace: zm_progress
	Checksum: 0x712FFD3D
	Offset: 0x2E0
	Size: 0x26A
	Parameters: 4
	Flags: Linked, Private
*/
function private function_89769800(params, unitrigger, b_start, var_c060d2c8)
{
	if(!isdefined(self))
	{
		return false;
	}
	if(!zm_utility::is_player_valid(self))
	{
		return false;
	}
	if(self laststand::player_is_in_laststand() || self zm_utility::in_revive_trigger())
	{
		return false;
	}
	if(!self usebuttonpressed())
	{
		return false;
	}
	trigger = unitrigger zm_unitrigger::unitrigger_trigger(self);
	if(!isdefined(trigger))
	{
		return false;
	}
	if(b_start)
	{
		if(isdefined(params.var_deac51dd) && ![[params.var_deac51dd]](self, unitrigger))
		{
			return false;
		}
	}
	else if(isdefined(params.var_5301f4f1) && ![[params.var_5301f4f1]](self, unitrigger))
	{
		return false;
	}
	if(is_true(params.var_e2ae1db1) && !self util::is_player_looking_at(trigger.origin, params.var_2b18af9d, var_c060d2c8))
	{
		return false;
	}
	if(unitrigger.script_unitrigger_type == "unitrigger_radius_use")
	{
		torigin = unitrigger zm_unitrigger::unitrigger_origin();
		porigin = self geteye();
		radius_sq = (2.25 * unitrigger.radius) * unitrigger.radius;
		if(distance2dsquared(torigin, porigin) > radius_sq)
		{
			return false;
		}
	}
	else if(!isdefined(trigger) || !trigger istouching(self, vectorscale((1, 1, 1), 10)))
	{
		return false;
	}
	return true;
}

/*
	Name: function_1b125050
	Namespace: zm_progress
	Checksum: 0x919A07E0
	Offset: 0x558
	Size: 0x3A
	Parameters: 3
	Flags: Linked, Private
*/
function private function_1b125050(params, unitrigger, var_c060d2c8)
{
	return function_89769800(params, unitrigger, 1, var_c060d2c8);
}

/*
	Name: function_a82534d
	Namespace: zm_progress
	Checksum: 0xEF5A14C8
	Offset: 0x5A0
	Size: 0x32
	Parameters: 3
	Flags: Linked, Private
*/
function private function_a82534d(params, unitrigger, var_c060d2c8)
{
	return function_89769800(params, unitrigger, 0, var_c060d2c8);
}

/*
	Name: player_progress_bar_update
	Namespace: zm_progress
	Checksum: 0xB529E8FA
	Offset: 0x5E0
	Size: 0xCE
	Parameters: 2
	Flags: Linked, Private
*/
function private player_progress_bar_update(start_time, use_time)
{
	self endon(#"entering_last_stand", #"death", #"hash_17d245ea00b65b48");
	while(isdefined(self) && (gettime() - start_time) < use_time)
	{
		progress = (gettime() - start_time) / use_time;
		if(progress < 0)
		{
			progress = 0;
		}
		if(progress > 1)
		{
			progress = 1;
		}
		level.zm_build_progress zm_build_progress::function_affe8f61(self, progress);
		waitframe(1);
	}
}

/*
	Name: player_progress_bar
	Namespace: zm_progress
	Checksum: 0x683485A2
	Offset: 0x6B8
	Size: 0xA4
	Parameters: 2
	Flags: Linked, Private
*/
function private player_progress_bar(start_time, use_time)
{
	if(level.zm_build_progress zm_build_progress::is_open(self) || !isdefined(start_time) || !isdefined(use_time))
	{
		return;
	}
	level.zm_build_progress zm_build_progress::open(self);
	self player_progress_bar_update(start_time, use_time);
	level.zm_build_progress zm_build_progress::close(self);
}

/*
	Name: function_48098d30
	Namespace: zm_progress
	Checksum: 0xABB3AD1B
	Offset: 0x768
	Size: 0xF2
	Parameters: 2
	Flags: Linked
*/
function function_48098d30(player, params)
{
	self endon(#"kill_trigger", #"progress_succeed", #"progress_failed");
	while(isdefined(params.fx_name))
	{
		angles = player getplayerangles();
		forwarddir = anglestoforward(angles);
		playfx(params.fx_name, player getplayercamerapos(), forwarddir, (0, 1, 0));
		if(params.fx_loop > 0)
		{
			wait(params.fx_loop);
		}
		else
		{
			return;
		}
	}
}

/*
	Name: function_f8b39299
	Namespace: zm_progress
	Checksum: 0x46D9A8CF
	Offset: 0x868
	Size: 0x476
	Parameters: 3
	Flags: Linked, Private
*/
function private function_f8b39299(player, params, var_c060d2c8)
{
	b_waited = 0;
	if(!isdefined(self))
	{
		/#
			assertmsg("");
		#/
		if(!is_true(b_waited))
		{
			b_waited = 1;
			waitframe(1);
		}
		return;
	}
	if(isdefined(params.var_13c55557))
	{
		thread [[params.var_13c55557]](player, self);
	}
	self.use_time = params.var_8dfc1be0;
	self.var_46bb2c21 = gettime();
	use_time = self.use_time;
	var_46bb2c21 = self.var_46bb2c21;
	_from_temple_geyser = params.var_69681160 != level.weaponnone;
	if(use_time > 0)
	{
		player zm_utility::disable_player_move_states(1);
		player.var_1f8802c9 = 1;
		player zm_utility::increment_is_drinking();
		if(_from_temple_geyser)
		{
			orgweapon = player getcurrentweapon();
			build_weapon = params.var_69681160;
			player giveweapon(build_weapon);
			player switchtoweapon(build_weapon);
		}
		player thread player_progress_bar(var_46bb2c21, use_time);
		while(isdefined(self) && player function_a82534d(params, self, var_c060d2c8) && (gettime() - self.var_46bb2c21) < self.use_time)
		{
			b_waited = 1;
			waitframe(1);
			if(!isdefined(self))
			{
				/#
					assertmsg("");
				#/
				if(!is_true(b_waited))
				{
					b_waited = 1;
					waitframe(1);
				}
				return;
			}
		}
		if(isdefined(player))
		{
			player notify(#"hash_17d245ea00b65b48");
			if(_from_temple_geyser)
			{
				player zm_weapons::switch_back_primary_weapon(orgweapon);
				player takeweapon(build_weapon);
			}
			if(is_true(player.is_drinking))
			{
				player zm_utility::decrement_is_drinking();
			}
			player.var_1f8802c9 = 0;
			player zm_utility::enable_player_move_states();
		}
	}
	result = "progress_failed";
	if(isdefined(self) && player function_a82534d(params, self, var_c060d2c8) && (self.use_time <= 0 || (gettime() - self.var_46bb2c21) >= self.use_time))
	{
		if(isdefined(params.var_ac28bd17))
		{
			thread [[params.var_ac28bd17]](player, self);
		}
		result = "progress_succeed";
	}
	else
	{
		if(isdefined(params.var_4737bddd))
		{
			thread [[params.var_4737bddd]](player, self);
		}
		result = "progress_failed";
	}
	if(isdefined(params.var_3e17832))
	{
		thread [[params.var_3e17832]](player, self);
	}
	if(!is_true(b_waited))
	{
		b_waited = 1;
		waitframe(1);
	}
	if(!isdefined(self))
	{
		/#
			assertmsg("");
		#/
		if(!is_true(b_waited))
		{
			b_waited = 1;
			waitframe(1);
		}
		return;
	}
	self notify(result);
}

/*
	Name: function_4335011a
	Namespace: zm_progress
	Checksum: 0x6186CFCE
	Offset: 0xCE8
	Size: 0xA4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_4335011a(player, params, var_c060d2c8)
{
	self thread function_48098d30(player, params);
	self thread function_f8b39299(player, params, var_c060d2c8);
	retval = undefined;
	retval = self waittill(#"progress_succeed", #"progress_failed");
	if(retval._notify == "progress_succeed")
	{
		return true;
	}
	return false;
}

/*
	Name: progress_think
	Namespace: zm_progress
	Checksum: 0xEEAF845C
	Offset: 0xD98
	Size: 0xB2
	Parameters: 3
	Flags: Linked
*/
function progress_think(player, params, var_c060d2c8)
{
	status = player function_1b125050(params, self.stub, var_c060d2c8);
	if(!status)
	{
		self.stub.hint_string = "";
		self sethintstring(self.stub.hint_string);
		return 0;
	}
	return self.stub function_4335011a(player, params, var_c060d2c8);
}

