#using scripts\cp_common\util.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_5443b356;

/*
	Name: main
	Namespace: namespace_5443b356
	Checksum: 0x873A78D3
	Offset: 0x1F0
	Size: 0x94
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	clientfield::register("toplayer", "player_cam_blur", 1, 1, "int");
	clientfield::register("toplayer", "player_cam_bubbles", 1, 1, "int");
	clientfield::register("toplayer", "player_cam_fire", 1, 1, "int");
}

/*
	Name: function_906e8496
	Namespace: namespace_5443b356
	Checksum: 0x69452854
	Offset: 0x290
	Size: 0x3AC
	Parameters: 9
	Flags: None
*/
function function_906e8496(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	self endon(#"disconnect");
	while(self util::isusingremote())
	{
		wait(0.1);
	}
	if(getdvarint(#"hash_1488e143f883c47d", 0) > 0)
	{
		value = getdvarint(#"hash_1488e143f883c47d", 0);
		if(value == 1)
		{
			vdir = "MOD_BULLET";
		}
		else
		{
			if(value == 2)
			{
				vdir = "MOD_EXPLOSIVE";
			}
			else
			{
				if(value == 3)
				{
					vdir = "MOD_BURNED";
				}
				else
				{
					if(value == 4)
					{
						vdir = "MOD_DROWN";
					}
					else if(value == 5)
					{
						self thread function_3f6f166(idamage, smeansofdeath, weapon, shitloc, psoffsettime, deathanimduration);
						return;
					}
				}
			}
		}
	}
	if(vdir === "MOD_EXPLOSIVE" || vdir === "MOD_PROJECTILE" || vdir === "MOD_PROJECTILE_SPLASH" || vdir === "MOD_GRENADE" || vdir === "MOD_GRENADE_SPLASH")
	{
		self thread function_16679050(idamage, smeansofdeath, weapon, shitloc, psoffsettime, deathanimduration);
	}
	else
	{
		if(vdir === "MOD_BULLET" || vdir === "MOD_RIFLE_BULLET" || vdir === "MOD_PISTOL_BULLET")
		{
			self thread function_feefffe4(idamage, smeansofdeath, weapon, shitloc, psoffsettime, deathanimduration);
		}
		else
		{
			if(vdir === "MOD_BURNED")
			{
				self thread function_49f83e8a(idamage, smeansofdeath, weapon, shitloc, psoffsettime, deathanimduration);
			}
			else
			{
				if(vdir === "MOD_DROWN")
				{
					self thread function_f4d74d85(idamage, smeansofdeath, weapon, shitloc, psoffsettime, deathanimduration);
				}
				else
				{
					if(isdefined(smeansofdeath) && smeansofdeath.classname == "trigger_hurt" && isdefined(smeansofdeath.script_noteworthy) && smeansofdeath.script_noteworthy == "fall_death")
					{
						self thread function_3f6f166(idamage, smeansofdeath, weapon, shitloc, psoffsettime, deathanimduration);
					}
					else
					{
						if(vdir === "MOD_MELEE" || vdir === "MOD_MELEE_WEAPON_BUTT")
						{
							self thread function_f8c107(idamage, smeansofdeath, weapon, shitloc, psoffsettime, deathanimduration);
						}
						else
						{
							self thread function_6b51f704(idamage, smeansofdeath, weapon, shitloc, undefined, deathanimduration);
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_c6491fb8
	Namespace: namespace_5443b356
	Checksum: 0x2B0D11F0
	Offset: 0x648
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_c6491fb8()
{
	self endon(#"disconnect");
	self thread function_f73fe25f();
}

/*
	Name: function_6f822dd3
	Namespace: namespace_5443b356
	Checksum: 0x64A56C9
	Offset: 0x680
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_6f822dd3()
{
	/#
		self endon(#"disconnect");
		self thread util::screen_message_create_client("", undefined, undefined, 200, 10000);
		wait(3);
		self thread util::screen_message_delete_client();
	#/
}

/*
	Name: get_trace
	Namespace: namespace_5443b356
	Checksum: 0x9812A017
	Offset: 0x6E8
	Size: 0xA2
	Parameters: 2
	Flags: None
*/
function get_trace(old_position, new_position)
{
	size = 10;
	height = size * 2;
	mins = (-1 * size, -1 * size, 0);
	maxs = (size, size, height);
	trace = physicstrace(old_position, new_position, mins, maxs, self);
	return trace;
}

/*
	Name: function_26d91402
	Namespace: namespace_5443b356
	Checksum: 0xEDAF4A9B
	Offset: 0x798
	Size: 0x46
	Parameters: 2
	Flags: None
*/
function function_26d91402(old_position, new_position)
{
	trace = get_trace(old_position, new_position);
	return trace[#"position"];
}

/*
	Name: function_b7f367ed
	Namespace: namespace_5443b356
	Checksum: 0xDB539B74
	Offset: 0x7E8
	Size: 0x56
	Parameters: 2
	Flags: None
*/
function function_b7f367ed(old_position, new_position)
{
	trace = get_trace(old_position, new_position);
	if(trace[#"fraction"] < 1)
	{
		return false;
	}
	return true;
}

/*
	Name: is_falling
	Namespace: namespace_5443b356
	Checksum: 0xE5B761E2
	Offset: 0x848
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function is_falling(position)
{
	return function_b7f367ed(position, position + (vectorscale((0, 0, -1), 500)));
}

/*
	Name: function_33141024
	Namespace: namespace_5443b356
	Checksum: 0x7CE272E8
	Offset: 0x888
	Size: 0x8C4
	Parameters: 11
	Flags: None
*/
function function_33141024(vdir, var_78efa1b4, var_c69fe125, var_eebc8ec0, var_3cbc1198, var_d7e15204, var_f2499291, var_dda415f2, lookdir, var_a571008b, var_eea7b52e)
{
	self endon(#"disconnect", #"hash_eb0317ca3976bf9");
	epsilon = getdvarint(#"hash_7dce5a6d3fbfa376", 2);
	original_position = self getplayercamerapos();
	position = original_position;
	angles = self getplayerangles();
	angles = (0, absangleclamp360(angles[1]), absangleclamp360(angles[2]));
	forwarddir = anglestoforward(angles);
	vector = position + forwarddir;
	if(isdefined(vdir))
	{
		vdir = vdir * -1;
		target_angles = vectortoangles(vdir);
	}
	else
	{
		vdir = (forwarddir[0], forwarddir[1], forwarddir[2]);
		target_angles = vectortoangles(vdir);
		vdir = (forwarddir[0], forwarddir[1], -1);
		vdir = vectornormalize(vdir);
	}
	if(isdefined(lookdir))
	{
		target_angles = vectortoangles(lookdir);
	}
	if(!isdefined(var_f2499291))
	{
		var_f2499291 = absangleclamp360(target_angles[0]);
	}
	if(!isdefined(var_dda415f2))
	{
		var_dda415f2 = absangleclamp360(target_angles[2]);
	}
	target_angles = (var_f2499291, absangleclamp360(target_angles[1]), var_dda415f2);
	angles = (absangleclamp360(target_angles[0]), absangleclamp360(target_angles[1]), angleclamp180(target_angles[2]));
	if(isdefined(var_c69fe125) && vdir[0] != 0)
	{
		var_8abc8992 = 0;
	}
	else
	{
		var_c69fe125 = 0;
		var_3cbc1198 = 0;
		var_8abc8992 = 1;
	}
	if(isdefined(var_eebc8ec0) && vdir[2] != 0)
	{
		var_39a26763 = 0;
	}
	else
	{
		var_eebc8ec0 = 0;
		var_d7e15204 = 0;
		var_39a26763 = 1;
	}
	forwardvec = (vdir[0], vdir[1], 0);
	forwardvec = vectornormalize(forwardvec);
	while(!(is_true(var_8abc8992) && is_true(var_39a26763)))
	{
		if(!is_true(var_8abc8992))
		{
			var_a2384064 = vectorscale(forwardvec, var_3cbc1198);
			var_fdb8844a = length(var_a2384064);
			var_5b945107 = position - original_position;
			var_c028b81a = length((var_5b945107[0], var_5b945107[1], 0));
			if((var_c028b81a + var_fdb8844a) >= var_c69fe125)
			{
				var_fdb8844a = var_c69fe125 - var_c028b81a;
				var_8abc8992 = 1;
			}
			new_position = position - vectorscale(forwardvec, var_fdb8844a);
			var_d2ca9e9b = position - (vectorscale(forwardvec, var_fdb8844a + epsilon));
			if(function_b7f367ed(position, var_d2ca9e9b))
			{
				position = new_position;
			}
			else
			{
				var_8abc8992 = 1;
			}
		}
		if(!is_true(var_39a26763))
		{
			var_35187b11 = var_d7e15204;
			var_d8ef58d1 = abs(original_position[2] - position[2]);
			if((var_d8ef58d1 + var_35187b11) >= var_eebc8ec0)
			{
				var_35187b11 = var_eebc8ec0 - var_d8ef58d1;
				var_39a26763 = 1;
			}
			new_position = (position[0], position[1], position[2] - var_35187b11);
			var_d2ca9e9b = (position[0], position[1], (position[2] - var_35187b11) - epsilon);
			if(function_b7f367ed(position, var_d2ca9e9b))
			{
				position = new_position;
			}
			else
			{
				var_39a26763 = 1;
			}
		}
	}
	if(!function_b7f367ed(original_position, position))
	{
		position = function_26d91402(original_position, position);
	}
	self cameraactivate(1);
	is_falling = is_falling(position);
	if(is_true(var_a571008b) || !is_true(is_falling))
	{
		if(var_78efa1b4 > 0)
		{
			self startcameratween(var_78efa1b4, 1);
			self camerasetposition(position, angles);
			wait(var_78efa1b4);
		}
		else
		{
			thread function_992fb1fd(position, angles, var_eea7b52e);
		}
	}
	if(is_true(is_falling))
	{
		player_speed = self getvelocity()[2];
		var_eb5d6347 = length(position - original_position);
		var_40fa243f = var_eb5d6347 * var_78efa1b4;
		player_speed = max(player_speed, var_40fa243f);
		var_63bee101 = getdvarint(#"hash_382786cbe040485d", -2000);
		var_abbbc8f5 = getdvarint(#"hash_348a9bee991e8abf", 500);
		var_4cd4f3fd = function_26d91402(position, position + (0, 0, var_63bee101));
		var_3cd7b116 = length(var_4cd4f3fd - position);
		var_80600e54 = (-88, absangleclamp360(angles[1]), 0);
		var_74a88e20 = max(player_speed, var_abbbc8f5);
		var_8c8446ec = var_3cd7b116 / var_74a88e20;
		self camerasetposition(var_4cd4f3fd, var_80600e54);
		self startcameratween(var_8c8446ec, 1);
		wait(var_8c8446ec);
		function_eea7b52e(var_4cd4f3fd);
	}
}

/*
	Name: function_eea7b52e
	Namespace: namespace_5443b356
	Checksum: 0x7ADE26C6
	Offset: 0x1158
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function function_eea7b52e(position)
{
	var_ca72a18a = getdvarfloat(#"hash_37a43469da3f24c3", 0.4);
	var_1da018a5 = getdvarfloat(#"hash_60702fda0f15330f", 0.1);
	var_13c80859 = getdvarfloat(#"hash_6bc3c7f0011db1a9", 5);
	earthquake(var_ca72a18a, var_1da018a5, position, var_13c80859);
}

/*
	Name: function_992fb1fd
	Namespace: namespace_5443b356
	Checksum: 0xEB6F968B
	Offset: 0x1220
	Size: 0x13C
	Parameters: 3
	Flags: None
*/
function function_992fb1fd(position, angles, var_eea7b52e)
{
	self endon(#"disconnect");
	var_85817a90 = getdvarfloat(#"hash_34ede8fbda967c29", 10);
	var_6328d523 = position + (0, 0, var_85817a90);
	self camerasetposition(var_6328d523, angles);
	waitframe(1);
	var_be296d93 = getdvarfloat(#"hash_161f389ff9e2a549", 0.1);
	self camerasetposition(position, angles);
	self startcameratween(var_be296d93, 1);
	wait(var_be296d93);
	if(is_true(var_eea7b52e))
	{
		function_eea7b52e(position);
	}
}

/*
	Name: function_e9de215e
	Namespace: namespace_5443b356
	Checksum: 0x400F0A85
	Offset: 0x1368
	Size: 0x5A
	Parameters: 0
	Flags: None
*/
function function_e9de215e()
{
	dot = vectordot(self getvelocity(), anglestoright(self.angles));
	if(dot > 0)
	{
		return 1;
	}
	return -1;
}

/*
	Name: function_feefffe4
	Namespace: namespace_5443b356
	Checksum: 0xA8952968
	Offset: 0x13D0
	Size: 0x1EE
	Parameters: 6
	Flags: None
*/
function function_feefffe4(einflictor, attacker, idamage, weapon, vdir, shitloc)
{
	self endon(#"disconnect");
	self clientfield::set_to_player("player_cam_blur", 1);
	var_d7e15204 = getdvarfloat(#"hash_165efe9d47c44db0", 20);
	var_3cbc1198 = getdvarfloat(#"hash_27d49da325083574", 20);
	var_eebc8ec0 = getdvarfloat(#"hash_5e4bfece8a54504a", 50);
	var_c69fe125 = getdvarfloat(#"hash_3a46da3b6f33171e", 50);
	end_wait = getdvarfloat(#"hash_6261c9b56ae2db5d", 2.75);
	sign = self function_e9de215e();
	thread function_33141024(shitloc, 0, var_c69fe125, var_eebc8ec0, var_3cbc1198, var_d7e15204, undefined, 60 * sign, undefined, undefined, 1);
	self playrumbleonentity("damage_heavy");
	wait(end_wait);
	self notify(#"hash_eb0317ca3976bf9");
}

/*
	Name: function_f8c107
	Namespace: namespace_5443b356
	Checksum: 0xE313CD78
	Offset: 0x15C8
	Size: 0x1E6
	Parameters: 6
	Flags: None
*/
function function_f8c107(einflictor, attacker, idamage, weapon, vdir, shitloc)
{
	self endon(#"disconnect");
	self clientfield::set_to_player("player_cam_blur", 1);
	var_d7e15204 = getdvarfloat(#"hash_165efe9d47c44db0", 20);
	var_3cbc1198 = getdvarfloat(#"hash_27d49da325083574", 20);
	var_eebc8ec0 = getdvarfloat(#"hash_5e4bfece8a54504a", 50);
	var_c69fe125 = getdvarfloat(#"hash_3a46da3b6f33171e", 50);
	end_wait = getdvarfloat(#"hash_6261c9b56ae2db5d", 2.75);
	sign = self function_e9de215e();
	self playrumbleonentity("damage_heavy");
	thread function_33141024(shitloc, 0, var_c69fe125, var_eebc8ec0, var_3cbc1198, var_d7e15204, undefined, 60 * sign);
	wait(end_wait);
	self notify(#"hash_eb0317ca3976bf9");
}

/*
	Name: function_6b51f704
	Namespace: namespace_5443b356
	Checksum: 0x2005991C
	Offset: 0x17B8
	Size: 0x1EE
	Parameters: 6
	Flags: None
*/
function function_6b51f704(einflictor, attacker, idamage, weapon, vdir, shitloc)
{
	self endon(#"disconnect");
	self clientfield::set_to_player("player_cam_blur", 1);
	sign = self function_e9de215e();
	var_d7e15204 = getdvarfloat(#"hash_165efe9d47c44db0", 8);
	var_3cbc1198 = getdvarfloat(#"hash_27d49da325083574", 10);
	var_eebc8ec0 = getdvarfloat(#"hash_5e4bfece8a54504a", 50);
	var_c69fe125 = getdvarfloat(#"hash_3a46da3b6f33171e", 50);
	end_wait = getdvarfloat(#"hash_6261c9b56ae2db5d", 2.75);
	thread function_33141024(undefined, 0, var_c69fe125, var_eebc8ec0, var_3cbc1198, var_d7e15204, undefined, 60 * sign, undefined, undefined, 1);
	self playrumbleonentity("damage_heavy");
	wait(end_wait);
	self notify(#"hash_eb0317ca3976bf9");
}

/*
	Name: function_16679050
	Namespace: namespace_5443b356
	Checksum: 0x45D97B37
	Offset: 0x19B0
	Size: 0x35E
	Parameters: 6
	Flags: None
*/
function function_16679050(einflictor, attacker, idamage, weapon, vdir, shitloc)
{
	self endon(#"disconnect");
	self clientfield::set_to_player("player_cam_blur", 1);
	var_d7e15204 = getdvarfloat(#"hash_30765f3cd8aff8ef", 8);
	var_3cbc1198 = getdvarfloat(#"hash_6f30d762a2b77323", 10);
	var_eebc8ec0 = getdvarfloat(#"hash_1a9f5eeb3f4a4361", 50);
	var_c69fe125 = getdvarfloat(#"hash_3501bf4ef71770d5", 100);
	var_2296fd89 = getdvarfloat(#"hash_6f6d4d410a6ad5c", 1);
	lookdir = undefined;
	if(isdefined(vdir) && vdir != self)
	{
		var_dca1ac5c = (vdir getabsmins() + vdir getabsmaxs()) * 0.5;
		lookdir = var_dca1ac5c - self.origin;
		lookdir = vectornormalize(lookdir);
	}
	var_3f9ef4b0 = getdvarfloat(#"hash_7fcc94875235d5d9", 0);
	var_25234855 = getdvarfloat(#"hash_3b48f7d2de097c94", 0.4);
	var_7f7a879b = getdvarfloat(#"hash_35f372e3d66c138", 0.4);
	var_2323c739 = getdvarfloat(#"hash_2cc1c3972b8ab6b3", 0.8);
	var_c80c7a11 = getdvarfloat(#"hash_17b036b05dba5077", 2);
	sign = self function_e9de215e();
	thread function_33141024(shitloc, 0, var_c69fe125, var_eebc8ec0, var_3cbc1198, var_d7e15204, undefined, 60 * sign, lookdir, undefined, 1);
	self playrumbleonentity("damage_heavy");
	wait(var_c80c7a11);
	self notify(#"hash_eb0317ca3976bf9");
}

/*
	Name: function_49f83e8a
	Namespace: namespace_5443b356
	Checksum: 0x63D26261
	Offset: 0x1D18
	Size: 0x1B6
	Parameters: 6
	Flags: None
*/
function function_49f83e8a(einflictor, attacker, idamage, weapon, vdir, shitloc)
{
	self endon(#"disconnect");
	self clientfield::set_to_player("player_cam_fire", 1);
	angles = self getplayerangles();
	forwarddir = anglestoforward(angles);
	var_eebc8ec0 = getdvarfloat(#"hash_1a9f5eeb3f4a4361", 50);
	var_d7e15204 = getdvarfloat(#"hash_30765f3cd8aff8ef", 10);
	sign = self function_e9de215e();
	thread function_33141024(undefined, 0.2, 0, var_eebc8ec0, 0, var_d7e15204, undefined, 50 * sign, forwarddir);
	wait(2);
	self.var_f0f3daef = 1;
	self thread lui::screen_fade(1, 1, 0, "white", 0);
	wait(1);
	self notify(#"hash_eb0317ca3976bf9");
}

/*
	Name: function_f4d74d85
	Namespace: namespace_5443b356
	Checksum: 0xDF1F6994
	Offset: 0x1ED8
	Size: 0x1A6
	Parameters: 6
	Flags: None
*/
function function_f4d74d85(einflictor, attacker, idamage, weapon, vdir, shitloc)
{
	self endon(#"disconnect");
	self clientfield::set_to_player("player_cam_bubbles", 1);
	angles = self getplayerangles();
	forwarddir = anglestoforward(angles);
	var_eebc8ec0 = getdvarfloat(#"hash_1a9f5eeb3f4a4361", 50);
	var_d7e15204 = getdvarfloat(#"hash_30765f3cd8aff8ef", 10);
	thread function_33141024(undefined, 3, 0, var_eebc8ec0, 0, var_d7e15204, undefined, undefined, forwarddir);
	var_94a9de4b = getdvarfloat(#"hash_227fa8da13da6e00", 3);
	wait(var_94a9de4b);
	self clientfield::set_to_player("player_cam_bubbles", 0);
	self notify(#"hash_eb0317ca3976bf9");
}

/*
	Name: function_3f6f166
	Namespace: namespace_5443b356
	Checksum: 0x72D41110
	Offset: 0x2088
	Size: 0x186
	Parameters: 6
	Flags: None
*/
function function_3f6f166(einflictor, attacker, idamage, weapon, vdir, shitloc)
{
	self endon(#"disconnect");
	var_d7e15204 = getdvarfloat(#"hash_4d3288e8d44e7297", 500);
	var_3cbc1198 = getdvarfloat(#"hash_6e3b3c6f29e0589b", 0);
	var_eebc8ec0 = getdvarfloat(#"hash_24bd9fbf9d33d209", 500);
	var_c69fe125 = getdvarfloat(#"hash_61031e6aea993ad", 0);
	end_wait = getdvarfloat(#"hash_319ec6563198ff7a", 2);
	thread function_33141024(undefined, 1, undefined, var_eebc8ec0, 0, var_d7e15204, -88, 1, undefined, 1, 1);
	wait(end_wait);
	self notify(#"hash_eb0317ca3976bf9");
}

/*
	Name: function_f73fe25f
	Namespace: namespace_5443b356
	Checksum: 0x47D313AF
	Offset: 0x2218
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function function_f73fe25f()
{
	self endon(#"disconnect");
	waitframe(1);
	self notify(#"hash_eb0317ca3976bf9");
}

