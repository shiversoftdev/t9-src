#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\map.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_98521e8b;

/*
	Name: function_9347830c
	Namespace: namespace_98521e8b
	Checksum: 0x7CCC2701
	Offset: 0xC0
	Size: 0x3C
	Parameters: 1
	Flags: Event
*/
event function_9347830c(eventstruct)
{
	var_b3160934 = function_1ead85cd();
	if(isdefined(var_b3160934))
	{
		level.var_98c11047 = 1;
	}
}

/*
	Name: function_3143d817
	Namespace: namespace_98521e8b
	Checksum: 0xAED15AA2
	Offset: 0x108
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_3143d817()
{
	var_65792f8b = map::get_script_bundle();
	if(!isdefined(var_65792f8b.var_6bb20a3))
	{
		return undefined;
	}
	return getscriptbundle(var_65792f8b.var_6bb20a3);
}

/*
	Name: function_f7961c39
	Namespace: namespace_98521e8b
	Checksum: 0x80F724D1
	Offset: 0x160
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_f7961c39()
{
}

/*
	Name: function_d6b2318a
	Namespace: namespace_98521e8b
	Checksum: 0x64479040
	Offset: 0x170
	Size: 0x394
	Parameters: 0
	Flags: None
*/
function function_d6b2318a()
{
	var_4680e491 = function_3143d817();
	if(!isdefined(var_4680e491.var_d74b6b9c))
	{
		return;
	}
	level util::function_f6847a11();
	if(isdefined(level.var_ecb89926))
	{
		var_abb4b791 = getentitiesinradius(level.var_ecb89926, 1000, 12);
		var_abb4b791 = arraycombine(var_abb4b791, getentitiesinradius(level.var_ecb89926, 1000, 14), 0, 0);
		array::run_all(var_abb4b791, &hide);
	}
	var_46fa8f90 = (isdefined(var_4680e491.var_3545b69a) ? var_4680e491.var_3545b69a : 0);
	var_c418a170 = (isdefined(var_4680e491.var_73a4076) ? var_4680e491.var_73a4076 : 0);
	level lui::screen_fade_out(0);
	if(isarray(level.var_3eada96b) && level.var_3eada96b.size)
	{
		foreach(var_35762664 in level.var_3eada96b)
		{
			var_35762664 show();
			var_35762664 solid();
			var_35762664 sethighdetail(1);
		}
	}
	wait(var_46fa8f90);
	level thread util::delay(float(function_60d95f53()) / 1000, undefined, &lui::screen_fade_in, var_c418a170);
	if(isarray(level.var_3eada96b) && level.var_3eada96b.size)
	{
		foreach(var_35762664 in level.var_3eada96b)
		{
			var_35762664 show();
			var_35762664 solid();
		}
		level.var_c30e610f = 1;
		level thread function_9cc2688d(var_4680e491.var_d74b6b9c);
		level scene::play(var_4680e491.var_d74b6b9c, level.var_3eada96b);
	}
}

/*
	Name: function_9cc2688d
	Namespace: namespace_98521e8b
	Checksum: 0x72F968E1
	Offset: 0x510
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_9cc2688d(str_scene)
{
	var_9d90ef8b = scene::function_12479eba(str_scene);
	n_delay = min(var_9d90ef8b, 3);
	wait(n_delay);
	if(is_true(level.var_98c11047))
	{
		util::preload_frontend();
	}
}

/*
	Name: function_364bc19c
	Namespace: namespace_98521e8b
	Checksum: 0x9298FC98
	Offset: 0x5A8
	Size: 0x6E4
	Parameters: 1
	Flags: None
*/
function function_364bc19c(outcome)
{
	level.var_3eada96b = [];
	var_b3160934 = function_1ead85cd();
	if(isdefined(var_b3160934))
	{
		var_f4bbfe3d = struct::get(var_b3160934, "scriptbundlename");
		if(isdefined(var_f4bbfe3d.origin))
		{
			level.var_ecb89926 = var_f4bbfe3d.origin;
		}
	}
	if(isdefined(outcome.team) && isinarray(getarraykeys(level.teams), hash(outcome.team)))
	{
		a_players = getplayers(outcome.team);
	}
	else
	{
		a_players = outcome.players;
	}
	if(isarray(a_players))
	{
		/#
			if(outcome.var_c1e98979 === 9 && !a_players.size && getdvarint(#"hash_767fdbb79f0c1368", 1))
			{
				if(!isdefined(a_players))
				{
					a_players = [];
				}
				else if(!isarray(a_players))
				{
					a_players = array(a_players);
				}
				if(!isinarray(a_players, getplayers()[0]))
				{
					a_players[a_players.size] = getplayers()[0];
				}
				if(!isdefined(a_players))
				{
					a_players = [];
				}
				else if(!isarray(a_players))
				{
					a_players = array(a_players);
				}
				if(!isinarray(a_players, getplayers()[1]))
				{
					a_players[a_players.size] = getplayers()[1];
				}
				if(!isdefined(a_players))
				{
					a_players = [];
				}
				else if(!isarray(a_players))
				{
					a_players = array(a_players);
				}
				if(!isinarray(a_players, getplayers()[2]))
				{
					a_players[a_players.size] = getplayers()[2];
				}
				if(!isdefined(a_players))
				{
					a_players = [];
				}
				else if(!isarray(a_players))
				{
					a_players = array(a_players);
				}
				if(!isinarray(a_players, getplayers()[3]))
				{
					a_players[a_players.size] = getplayers()[3];
				}
				arrayremovevalue(a_players, undefined);
			}
		#/
		foreach(n_index, player in a_players)
		{
			if(n_index >= 4)
			{
				break;
			}
			if(isdefined(player))
			{
				var_bb497eb0 = util::spawn_player_clone(player, undefined, undefined, 1);
				weapon = player getcurrentweapon();
				if(weapon == level.weaponnone || !weapon.isprimary && isdefined(player.class_num))
				{
					weapon = player getloadoutweapon(player.class_num, "primary");
					var_d71dafc1 = player function_ade49959(weapon);
					var_f34a225e = player function_8cbd254d(weapon);
					var_c071948 = player function_f0655be3(weapon);
					var_bb497eb0 animation::attach_weapon(weapon);
					var_bb497eb0 function_44adade0(var_d71dafc1);
					var_bb497eb0 function_9affc544(var_f34a225e);
					var_bb497eb0 function_cda62355(var_c071948);
				}
				var_bb497eb0.var_777951c = weapon;
				if(isdefined(level.var_ecb89926))
				{
					var_bb497eb0 dontinterpolate();
					var_bb497eb0.origin = level.var_ecb89926;
				}
				var_bb497eb0 sethighdetail(1);
				var_bb497eb0 ghost();
				var_bb497eb0 notsolid();
				var_bb497eb0.var_e7622b1 = player getentitynumber();
				if(!isdefined(level.var_3eada96b))
				{
					level.var_3eada96b = [];
				}
				else if(!isarray(level.var_3eada96b))
				{
					level.var_3eada96b = array(level.var_3eada96b);
				}
				level.var_3eada96b[level.var_3eada96b.size] = var_bb497eb0;
			}
		}
	}
}

/*
	Name: function_29597300
	Namespace: namespace_98521e8b
	Checksum: 0x83938077
	Offset: 0xC98
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function function_29597300()
{
	var_b3160934 = function_1ead85cd();
	if(isdefined(var_b3160934))
	{
		level thread scene::init_streamer(var_b3160934, getplayers());
	}
}

/*
	Name: function_1ead85cd
	Namespace: namespace_98521e8b
	Checksum: 0x408A2209
	Offset: 0xCF8
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function function_1ead85cd()
{
	var_4680e491 = function_3143d817();
	return var_4680e491.var_d74b6b9c;
}

