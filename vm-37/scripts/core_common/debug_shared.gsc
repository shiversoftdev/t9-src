#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace debug;

/*
	Name: __init__system__
	Namespace: debug
	Checksum: 0xF11182BF
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"debug", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: debug
	Checksum: 0xB1B9D87A
	Offset: 0xC8
	Size: 0xAC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		level thread debug_draw_tuning_sphere();
		level thread devgui_debug_key_value();
		level thread function_e648ca7c();
		callback::on_loadout(&on_loadout);
		/#
			if(getdvarint(#"hash_2bf322fc226fa167", 0))
			{
				adddebugcommand("");
			}
		#/
	#/
}

/*
	Name: function_ddca74dd
	Namespace: debug
	Checksum: 0xD5B1BE04
	Offset: 0x180
	Size: 0x23A
	Parameters: 0
	Flags: Private
*/
function private function_ddca74dd()
{
	/#
		weaponname = getdvar(#"hash_136a06446fceeaa5", "");
		if(weaponname != "")
		{
			waitframe(1);
			split = strtok(weaponname, "");
			switch(split.size)
			{
				case 1:
				default:
				{
					weapon = getweapon(split[0]);
					break;
				}
				case 2:
				{
					weapon = getweapon(split[0], split[1]);
					break;
				}
				case 3:
				{
					weapon = getweapon(split[0], split[1], split[2]);
					break;
				}
				case 4:
				{
					weapon = getweapon(split[0], split[1], split[2], split[3]);
					break;
				}
				case 5:
				{
					weapon = getweapon(split[0], split[1], split[2], split[3], split[4]);
					break;
				}
			}
			if(weapon != level.weaponnone)
			{
				self giveweapon(weapon);
				self switchtoweapon(weapon);
				self.spawnweapon = weapon;
			}
		}
	#/
}

/*
	Name: on_loadout
	Namespace: debug
	Checksum: 0x32E6F9BD
	Offset: 0x3C8
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private on_loadout()
{
	/#
		self function_ddca74dd();
	#/
}

/*
	Name: devgui_debug_key_value
	Namespace: debug
	Checksum: 0x4795940
	Offset: 0x3F0
	Size: 0x3F0
	Parameters: 0
	Flags: None
*/
function devgui_debug_key_value()
{
	/#
		a_keys = array("", "", "", "", "", "", "", "", "");
		setdvar(#"debug_key_value", 0);
		setdvar(#"debug_key_value_dist", 2000);
		adddebugcommand("");
		adddebugcommand("");
		foreach(str_key in a_keys)
		{
			adddebugcommand(((("" + str_key) + "") + str_key) + "");
		}
		while(!flag::exists(""))
		{
			util::wait_network_frame();
		}
		level flag::wait_till("");
		while(true)
		{
			debug_key_value = getdvar(#"debug_key_value", 0);
			if(debug_key_value != 0)
			{
				a_ents = getentarray();
				foreach(ent in a_ents)
				{
					n_draw_dist = getdvarint(#"debug_key_value_dist", 0);
					n_draw_dist_sq = n_draw_dist * n_draw_dist;
					n_dist_sq = distancesquared(ent.origin, level.players[0].origin);
					if(n_dist_sq <= n_draw_dist_sq)
					{
						n_scale = mapfloat(0, 6250000, 0.5, 5, n_dist_sq);
						ent thread debug_key_value(string(debug_key_value), undefined, n_scale);
						continue;
					}
					ent notify(#"debug_key_value");
				}
			}
			else
			{
				level notify(#"debug_key_value");
			}
			wait(randomfloatrange(0.1333333, 0.2666667));
		}
	#/
}

/*
	Name: debug_draw_tuning_sphere
	Namespace: debug
	Checksum: 0xB52BA1AE
	Offset: 0x7E8
	Size: 0x228
	Parameters: 0
	Flags: None
*/
function debug_draw_tuning_sphere()
{
	/#
		n_sphere_radius = 0;
		v_text_position = (0, 0, 0);
		n_text_scale = 1;
		while(true)
		{
			n_sphere_radius = getdvarfloat(#"debug_measure_sphere_radius", 0);
			while(n_sphere_radius >= 1)
			{
				players = getplayers();
				if(isdefined(players[0]))
				{
					n_sphere_radius = getdvarfloat(#"debug_measure_sphere_radius", 0);
					circle(players[0].origin, n_sphere_radius, (1, 0, 0), 0, 1, 16);
					n_text_scale = (sqrt(n_sphere_radius * 2.5)) / 2;
					vforward = anglestoforward(players[0].angles);
					v_text_position = players[0].origin + (vforward * n_sphere_radius);
					sides = int(10 * (1 + (int(n_text_scale) % 100)));
					sphere(v_text_position, n_text_scale, (1, 0, 0), 1, 1, sides, 16);
					print3d(v_text_position + vectorscale((0, 0, 1), 20), n_sphere_radius, (1, 0, 0), 1, n_text_scale / 14, 16);
				}
				waitframe(1);
			}
			wait(1);
		}
	#/
}

/*
	Name: debug_key_value
	Namespace: debug
	Checksum: 0xBBC655AC
	Offset: 0xA18
	Size: 0x14E
	Parameters: 3
	Flags: None
*/
function debug_key_value(str_key, n_time, n_scale)
{
	/#
		if(!isdefined(n_scale))
		{
			n_scale = 1;
		}
		level endon(#"debug_key_value");
		self notify(#"debug_key_value");
		self endon(#"debug_key_value", #"death");
		if(isdefined(str_key))
		{
			if(isdefined(n_time))
			{
				__s = spawnstruct();
				__s endon(#"timeout");
				__s util::delay_notify(n_time, "");
			}
			while(true)
			{
				value = self.(str_key);
				if(isdefined(value))
				{
					print3d(self.origin, (isdefined(value) ? "" + value : ""), (0, 0, 1), 1, n_scale, 1);
				}
				waitframe(1);
			}
		}
	#/
}

/*
	Name: drawdebuglineinternal
	Namespace: debug
	Checksum: 0x7EF3E383
	Offset: 0xB70
	Size: 0x62
	Parameters: 4
	Flags: None
*/
function drawdebuglineinternal(frompoint, topoint, color, durationframes)
{
	/#
		for(i = 0; i < durationframes; i++)
		{
			line(frompoint, topoint, color);
			waitframe(1);
		}
	#/
}

/*
	Name: drawdebugenttoentinternal
	Namespace: debug
	Checksum: 0x37C8BC
	Offset: 0xBE0
	Size: 0x8A
	Parameters: 4
	Flags: None
*/
function drawdebugenttoentinternal(ent1, ent2, color, durationframes)
{
	/#
		for(i = 0; i < durationframes; i++)
		{
			if(!isdefined(ent1) || !isdefined(ent2))
			{
				return;
			}
			line(ent1.origin, ent2.origin, color);
			waitframe(1);
		}
	#/
}

/*
	Name: drawdebugline
	Namespace: debug
	Checksum: 0x271C2A34
	Offset: 0xC78
	Size: 0x44
	Parameters: 4
	Flags: None
*/
function drawdebugline(frompoint, topoint, color, durationframes)
{
	/#
		thread drawdebuglineinternal(frompoint, topoint, color, durationframes);
	#/
}

/*
	Name: drawdebuglineenttoent
	Namespace: debug
	Checksum: 0x7DB6527A
	Offset: 0xCC8
	Size: 0x44
	Parameters: 4
	Flags: None
*/
function drawdebuglineenttoent(ent1, ent2, color, durationframes)
{
	/#
		thread drawdebugenttoentinternal(ent1, ent2, color, durationframes);
	#/
}

/*
	Name: function_e648ca7c
	Namespace: debug
	Checksum: 0x5CEF23CE
	Offset: 0xD18
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_e648ca7c()
{
	/#
		setdvar(#"hash_b8d10baa344fcbd", 0);
		function_cd140ee9(#"hash_b8d10baa344fcbd", &function_68f58e51);
	#/
}

/*
	Name: function_68f58e51
	Namespace: debug
	Checksum: 0xA25D6947
	Offset: 0xD80
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function function_68f58e51(params)
{
	/#
		level.var_77e1430c = params.value;
		function_c0767f67();
	#/
}

/*
	Name: function_1b531660
	Namespace: debug
	Checksum: 0xB38B705F
	Offset: 0xDC0
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_1b531660()
{
	/#
		if(!isdefined(level.var_77e1430c))
		{
			level.var_77e1430c = 0;
		}
		level.var_77e1430c = !level.var_77e1430c;
		function_c0767f67();
	#/
}

/*
	Name: function_c0767f67
	Namespace: debug
	Checksum: 0x1EF86A8B
	Offset: 0xE18
	Size: 0x13C
	Parameters: 0
	Flags: None
*/
function function_c0767f67()
{
	/#
		if(!isdefined(level.var_77e1430c))
		{
			level.var_77e1430c = 0;
		}
		if(level.var_77e1430c)
		{
			callback::on_player_damage(&function_e7321799);
			callback::on_actor_damage(&function_e7321799);
			callback::on_vehicle_damage(&function_e7321799);
			callback::function_9d78f548(&function_e7321799);
		}
		else
		{
			callback::remove_on_player_damage(&function_e7321799);
			callback::remove_on_actor_damage(&function_e7321799);
			callback::remove_on_vehicle_damage(&function_e7321799);
			callback::function_f125b93a(&function_e7321799);
		}
	#/
}

/*
	Name: function_e7321799
	Namespace: debug
	Checksum: 0x9D7680AD
	Offset: 0xF60
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_e7321799(params)
{
	/#
		damage = params.idamage;
		location = params.vpoint;
		target = self;
		smeansofdeath = params.smeansofdeath;
		if(smeansofdeath == "" || smeansofdeath == "")
		{
			location = self.origin + vectorscale((0, 0, 1), 60);
		}
		if(damage)
		{
			thread function_2cde0af9("" + damage, (1, 1, 1), location, (randomfloatrange(-1, 1), randomfloatrange(-1, 1), 2), 30);
		}
	#/
}

/*
	Name: function_2cde0af9
	Namespace: debug
	Checksum: 0x5046F72E
	Offset: 0x1078
	Size: 0xBE
	Parameters: 5
	Flags: None
*/
function function_2cde0af9(text, color, start, velocity, frames)
{
	/#
		location = start;
		alpha = 1;
		for(i = 0; i < frames; i++)
		{
			print3d(location, text, color, alpha, 0.6, 1);
			location = location + velocity;
			alpha = alpha - (1 / (frames * 2));
			waitframe(1);
		}
	#/
}

