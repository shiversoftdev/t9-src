#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_trial_restrict_controls;

/*
	Name: function_76a7c4e9
	Namespace: zm_trial_restrict_controls
	Checksum: 0x66DBC77
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_76a7c4e9()
{
	level notify(-1548034785);
}

/*
	Name: __init__system__
	Namespace: zm_trial_restrict_controls
	Checksum: 0x9CD6A8A7
	Offset: 0x118
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_restrict_controls", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_restrict_controls
	Checksum: 0xD7AD8933
	Offset: 0x160
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"restrict_controls", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_restrict_controls
	Checksum: 0x3372C59D
	Offset: 0x1C8
	Size: 0x32A
	Parameters: 1
	Flags: Private
*/
function private on_begin(var_bd9d962)
{
	if(!isdefined(var_bd9d962))
	{
		var_bd9d962 = #"invert";
	}
	level endon(#"hash_7646638df88a3656");
	wait(5);
	level.var_2439365b = var_bd9d962;
	switch(level.var_2439365b)
	{
		case "invert":
		{
			foreach(player in getplayers())
			{
				player clientfield::set_to_player("" + #"hash_6536ca4fb2858a9f", 1);
			}
			break;
		}
		case "turret":
		{
			foreach(player in getplayers())
			{
				player bgb_pack::function_59004002(#"zm_bgb_anywhere_but_here", 1);
				player bgb_pack::function_59004002(#"zm_bgb_nowhere_but_there", 1);
				player thread function_3d8fa20a();
			}
			callback::on_ai_spawned(&function_a5b02a07);
			callback::on_spawned(&function_eaba7c6f);
			break;
		}
		case "half_speed":
		{
			foreach(player in getplayers())
			{
				player setmovespeedscale(0.5);
				player allowsprint(0);
				player allowslide(0);
			}
			break;
		}
	}
}

/*
	Name: on_end
	Namespace: zm_trial_restrict_controls
	Checksum: 0x9C6E91D4
	Offset: 0x500
	Size: 0x336
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	switch(level.var_2439365b)
	{
		case "invert":
		{
			foreach(player in getplayers())
			{
				player clientfield::set_to_player("" + #"hash_6536ca4fb2858a9f", 0);
			}
			break;
		}
		case "turret":
		{
			foreach(player in getplayers())
			{
				player bgb_pack::function_59004002(#"zm_bgb_anywhere_but_here", 0);
				player bgb_pack::function_59004002(#"zm_bgb_nowhere_but_there", 0);
				player setmovespeedscale(1);
				player allowjump(1);
				player allowprone(1);
				player allowsprint(1);
			}
			callback::remove_on_ai_spawned(&function_a5b02a07);
			callback::remove_on_spawned(&function_eaba7c6f);
			break;
		}
		case "half_speed":
		{
			foreach(player in getplayers())
			{
				player setmovespeedscale(1);
				player allowsprint(1);
				player allowslide(1);
			}
			break;
		}
	}
	level.var_2439365b = undefined;
}

/*
	Name: function_eaba7c6f
	Namespace: zm_trial_restrict_controls
	Checksum: 0xE7354711
	Offset: 0x840
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_eaba7c6f()
{
	self thread function_3d8fa20a();
}

/*
	Name: function_3d8fa20a
	Namespace: zm_trial_restrict_controls
	Checksum: 0x46C0F4EB
	Offset: 0x868
	Size: 0x108
	Parameters: 0
	Flags: Private
*/
function private function_3d8fa20a()
{
	self notify("63943c3872eb77bc");
	self endon("63943c3872eb77bc");
	self endon(#"death");
	level endon(#"hash_7646638df88a3656");
	wait(5);
	while(self zm_utility::is_jumping())
	{
		waitframe(1);
	}
	self setmovespeedscale(0);
	self thread function_dc856fd8();
	while(true)
	{
		self waittill(#"player_downed");
		self setmovespeedscale(1);
		self waittill(#"player_revived");
		self setmovespeedscale(0);
	}
}

/*
	Name: function_dc856fd8
	Namespace: zm_trial_restrict_controls
	Checksum: 0x56A309F1
	Offset: 0x978
	Size: 0x128
	Parameters: 0
	Flags: Private
*/
function private function_dc856fd8()
{
	self notify("4becff0e4eba900e");
	self endon("4becff0e4eba900e");
	level endon(#"hash_7646638df88a3656");
	self endon(#"disconnect");
	self allowjump(0);
	self allowprone(0);
	self allowsprint(0);
	while(true)
	{
		self waittill(#"crafting_fail", #"crafting_success", #"bgb_update");
		if(isalive(self))
		{
			self allowjump(0);
			self allowprone(0);
			self allowsprint(0);
		}
	}
}

/*
	Name: function_a5b02a07
	Namespace: zm_trial_restrict_controls
	Checksum: 0xDE3DCF6F
	Offset: 0xAA8
	Size: 0x184
	Parameters: 0
	Flags: Private
*/
function private function_a5b02a07()
{
	self endon(#"death");
	wait(0.5);
	n_players = getplayers().size;
	switch(n_players)
	{
		case 1:
		{
			var_e0e5e1ab = 0;
			break;
		}
		case 2:
		{
			var_e0e5e1ab = 40;
			break;
		}
		case 3:
		{
			var_e0e5e1ab = 75;
			break;
		}
		case 4:
		{
			var_e0e5e1ab = 100;
			break;
		}
	}
	if(math::cointoss(var_e0e5e1ab))
	{
		self zombie_utility::set_zombie_run_cycle("sprint");
	}
	else
	{
		if(n_players > 1)
		{
			self zombie_utility::set_zombie_run_cycle("run");
		}
		else
		{
			if(math::cointoss())
			{
				self zombie_utility::set_zombie_run_cycle("run");
			}
			else
			{
				self zombie_utility::set_zombie_run_cycle("walk");
			}
		}
	}
}

