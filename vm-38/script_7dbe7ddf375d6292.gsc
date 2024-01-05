#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_7c1d0bac;

/*
	Name: function_754e60df
	Namespace: namespace_7c1d0bac
	Checksum: 0x41D4BE35
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_754e60df()
{
	level notify(-899117855);
}

/*
	Name: __init__system__
	Namespace: namespace_7c1d0bac
	Checksum: 0x7FC81668
	Offset: 0x108
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_5fe7a854b630ef02", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_7c1d0bac
	Checksum: 0x7DCA38F9
	Offset: 0x150
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "player_hit_freezing_snowball", 9000, 1, "int");
	clientfield::register("toplayer", "player_hit_snowball_direction", 9000, 4, "int");
	callback::on_player_damage(&function_c9509a9c);
	weaponobjects::function_e6400478(#"snowball", &creategrenadewatcher, 1);
}

/*
	Name: function_c9509a9c
	Namespace: namespace_7c1d0bac
	Checksum: 0x66F73B51
	Offset: 0x218
	Size: 0x434
	Parameters: 1
	Flags: Linked
*/
function function_c9509a9c(params)
{
	if(isalive(self) && isplayer(self))
	{
		if(params.weapon.name === #"snowball")
		{
			var_feafe576 = 0;
			var_cb01806c = 0;
			bleft = 0;
			bright = 0;
			var_4e1c6c81 = 1;
			var_9ed2938d = 1;
			attacker = params.eattacker;
			height_diff = attacker.origin[2] - self.origin[2];
			if(height_diff < -16)
			{
				var_feafe576 = 1;
				var_4e1c6c81 = 0;
			}
			if(height_diff > 16)
			{
				var_cb01806c = 1;
				var_4e1c6c81 = 0;
			}
			var_1f579e1d = attacker.origin - self.origin;
			var_1f579e1d = (var_1f579e1d[0], var_1f579e1d[1], 0);
			vec_right = anglestoright(self.angles);
			vec_right = vectornormalize(vec_right);
			vec_right = (vec_right[0], vec_right[1], 0);
			var_1f579e1d = vectornormalize(var_1f579e1d);
			vec_dot = vectordot(var_1f579e1d, vec_right);
			if(vec_dot > 0.2)
			{
				bright = 1;
				var_9ed2938d = 0;
			}
			else if(vec_dot < -0.2)
			{
				bleft = 1;
				var_9ed2938d = 0;
			}
			if(var_4e1c6c81 && var_9ed2938d)
			{
				self clientfield::set_to_player("player_hit_snowball_direction", 1);
			}
			else
			{
				if(var_4e1c6c81 && bleft)
				{
					self clientfield::set_to_player("player_hit_snowball_direction", 2);
				}
				else
				{
					if(var_4e1c6c81 && bright)
					{
						self clientfield::set_to_player("player_hit_snowball_direction", 3);
					}
					else
					{
						if(var_cb01806c && var_9ed2938d)
						{
							self clientfield::set_to_player("player_hit_snowball_direction", 5);
						}
						else
						{
							if(var_feafe576 && var_9ed2938d)
							{
								self clientfield::set_to_player("player_hit_snowball_direction", 4);
							}
							else
							{
								if(var_feafe576 && bleft)
								{
									self clientfield::set_to_player("player_hit_snowball_direction", 6);
								}
								else
								{
									if(var_feafe576 && bright)
									{
										self clientfield::set_to_player("player_hit_snowball_direction", 8);
									}
									else
									{
										if(var_cb01806c && bleft)
										{
											self clientfield::set_to_player("player_hit_snowball_direction", 9);
										}
										else if(var_cb01806c && bright)
										{
											self clientfield::set_to_player("player_hit_snowball_direction", 10);
										}
									}
								}
							}
						}
					}
				}
			}
			self thread function_4df181ef();
		}
	}
}

/*
	Name: function_4df181ef
	Namespace: namespace_7c1d0bac
	Checksum: 0xEC58A9F8
	Offset: 0x658
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_4df181ef()
{
	self endoncallback(&function_8407e8ae, #"death", #"game_ended");
	self clientfield::set_to_player("player_hit_freezing_snowball", 1);
	wait(2);
	self clientfield::set_to_player("player_hit_freezing_snowball", 0);
}

/*
	Name: function_8407e8ae
	Namespace: namespace_7c1d0bac
	Checksum: 0xC8A41E67
	Offset: 0x6E8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_8407e8ae(notifyhash)
{
	self clientfield::set_to_player("player_hit_freezing_snowball", 0);
}

/*
	Name: creategrenadewatcher
	Namespace: namespace_7c1d0bac
	Checksum: 0xCEAD7667
	Offset: 0x720
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function creategrenadewatcher(watcher)
{
	watcher.onspawn = &function_aa95d684;
}

/*
	Name: function_aa95d684
	Namespace: namespace_7c1d0bac
	Checksum: 0x79D2867C
	Offset: 0x750
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_aa95d684(watcher, player)
{
	self clientfield::set("enemyequip", 1);
	self thread function_5f86757d();
}

/*
	Name: function_5f86757d
	Namespace: namespace_7c1d0bac
	Checksum: 0x1A828FC4
	Offset: 0x7A8
	Size: 0x558
	Parameters: 0
	Flags: Linked
*/
function function_5f86757d()
{
	level endon(#"game_ended");
	var_7f729179 = undefined;
	var_7f729179 = self waittill(#"explode", #"death");
	if(isdefined(self) && isdefined(self.owner))
	{
		players = getentitiesinradius(self.origin, 64, 1);
		foreach(player in players)
		{
			if(isalive(player) && player !== self.owner)
			{
				dist2d = distance2dsquared(self.origin, player.origin);
				if(self.origin[2] < player.origin[2] || dist2d > 4096)
				{
					return;
				}
				var_feafe576 = 0;
				var_cb01806c = 0;
				bleft = 0;
				bright = 0;
				var_4e1c6c81 = 1;
				var_9ed2938d = 1;
				attacker = self.owner;
				height_diff = attacker.origin[2] - player.origin[2];
				if(height_diff < -16)
				{
					var_feafe576 = 1;
					var_4e1c6c81 = 0;
				}
				if(height_diff > 16)
				{
					var_cb01806c = 1;
					var_4e1c6c81 = 0;
				}
				var_1f579e1d = attacker.origin - player.origin;
				var_1f579e1d = (var_1f579e1d[0], var_1f579e1d[1], 0);
				vec_right = anglestoright(player.angles);
				vec_right = vectornormalize(vec_right);
				vec_right = (vec_right[0], vec_right[1], 0);
				var_1f579e1d = vectornormalize(var_1f579e1d);
				vec_dot = vectordot(var_1f579e1d, vec_right);
				if(vec_dot > 0.2)
				{
					bright = 1;
					var_9ed2938d = 0;
				}
				else if(vec_dot < -0.2)
				{
					bleft = 1;
					var_9ed2938d = 0;
				}
				if(var_4e1c6c81 && var_9ed2938d)
				{
					player clientfield::set_to_player("player_hit_snowball_direction", 1);
				}
				else
				{
					if(var_4e1c6c81 && bleft)
					{
						player clientfield::set_to_player("player_hit_snowball_direction", 2);
					}
					else
					{
						if(var_4e1c6c81 && bright)
						{
							player clientfield::set_to_player("player_hit_snowball_direction", 3);
						}
						else
						{
							if(var_cb01806c && var_9ed2938d)
							{
								player clientfield::set_to_player("player_hit_snowball_direction", 5);
							}
							else
							{
								if(var_feafe576 && var_9ed2938d)
								{
									player clientfield::set_to_player("player_hit_snowball_direction", 4);
								}
								else
								{
									if(var_feafe576 && bleft)
									{
										player clientfield::set_to_player("player_hit_snowball_direction", 6);
									}
									else
									{
										if(var_feafe576 && bright)
										{
											player clientfield::set_to_player("player_hit_snowball_direction", 8);
										}
										else
										{
											if(var_cb01806c && bleft)
											{
												player clientfield::set_to_player("player_hit_snowball_direction", 9);
											}
											else if(var_cb01806c && bright)
											{
												player clientfield::set_to_player("player_hit_snowball_direction", 10);
											}
										}
									}
								}
							}
						}
					}
				}
				player thread function_4df181ef();
			}
		}
	}
}

