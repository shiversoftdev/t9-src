#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_4d214d02;

/*
	Name: function_89f2df9
	Namespace: namespace_4d214d02
	Checksum: 0xFA14C332
	Offset: 0x80
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_30f3aa1706b7cb3d", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_4d214d02
	Checksum: 0x8A4B3EB1
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		level thread function_2085db3b();
		callback::on_spawned(&function_7a47eaf);
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_4d214d02
	Checksum: 0x80F724D1
	Offset: 0x120
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: function_2085db3b
	Namespace: namespace_4d214d02
	Checksum: 0x2736643D
	Offset: 0x130
	Size: 0x1AC
	Parameters: 0
	Flags: None
*/
function function_2085db3b()
{
	/#
		while(!canadddebugcommand())
		{
			waitframe(1);
		}
		mapname = util::function_53bbf9d2();
		level.var_66e8da6c = 0;
		level.var_d1bab1c8 = 0;
		level.var_3330d3fd = 0;
		level.var_dd510bee = 0;
		level.var_78c9a347 = 0;
		level.var_1ec0ef7b = 0;
		level.var_7a47eaf = "";
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		level thread function_dd927421();
	#/
}

/*
	Name: function_7a47eaf
	Namespace: namespace_4d214d02
	Checksum: 0x93947401
	Offset: 0x2E8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_7a47eaf()
{
	/#
		level.var_7a47eaf = self getcharacterbodytype();
	#/
}

/*
	Name: function_dd927421
	Namespace: namespace_4d214d02
	Checksum: 0xF6DAE69D
	Offset: 0x318
	Size: 0x2CE
	Parameters: 0
	Flags: None
*/
function function_dd927421()
{
	/#
		level endon(#"game_ended");
		while(true)
		{
			var_7233ec1c = getdvarint(#"hash_53f36d1041d6911e", 0);
			var_cdaf835a = getdvarint(#"hash_7dba628e0e8b12f0", 0);
			var_a2313ba3 = getdvarint(#"hash_5fc452ea14251cdf", 0);
			var_486abc42 = getdvarint(#"hash_66a893ef035aec0c", 0);
			var_4df84b05 = getdvarint(#"hash_2f6539fb6a3cba3b", 0);
			var_84b18de6 = getdvarint(#"hash_48c67550105879a9", 0);
			if(var_7233ec1c)
			{
				setdvar(#"hash_53f36d1041d6911e", 0);
				level function_f178ffde();
			}
			if(var_cdaf835a)
			{
				setdvar(#"hash_7dba628e0e8b12f0", 0);
				level function_35b5321c();
			}
			if(var_a2313ba3)
			{
				setdvar(#"hash_5fc452ea14251cdf", 0);
				level function_1e1d709d();
			}
			if(var_486abc42)
			{
				setdvar(#"hash_66a893ef035aec0c", 0);
				level setup_zombie();
			}
			if(var_4df84b05)
			{
				setdvar(#"hash_2f6539fb6a3cba3b", 0);
				level function_3ce8783f();
			}
			if(var_84b18de6)
			{
				setdvar(#"hash_48c67550105879a9", 0);
				level function_29a9ed35();
			}
			waitframe(1);
		}
	#/
}

/*
	Name: reset_player
	Namespace: namespace_4d214d02
	Checksum: 0x861509DE
	Offset: 0x5F0
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function reset_player()
{
	/#
		players = getplayers();
		player = players[0];
		player takeallweapons();
		weapon = getweapon(#"bare_hands");
		player giveweapon(weapon);
		player switchtoweapon(weapon, 1);
		player setclientthirdperson(0);
		player setcharacterbodytype(level.var_7a47eaf);
		player function_8fd843dd(0);
	#/
}

/*
	Name: function_f178ffde
	Namespace: namespace_4d214d02
	Checksum: 0x29790E2C
	Offset: 0x6F0
	Size: 0x408
	Parameters: 0
	Flags: None
*/
function function_f178ffde()
{
	/#
		if(level.var_d1bab1c8 || level.var_dd510bee || level.var_3330d3fd)
		{
			level.var_d1bab1c8 = 0;
			level.var_dd510bee = 0;
			level.var_3330d3fd = 0;
			reset_player();
			waitframe(1);
		}
		if(level.var_1ec0ef7b)
		{
			if(isdefined(level.var_31adc03))
			{
				level.var_1ec0ef7b = 0;
				level.var_31adc03 delete();
			}
		}
		if(level.var_78c9a347)
		{
			if(isdefined(level.var_6de2049b))
			{
				level.var_78c9a347 = 0;
				level.var_6de2049b delete();
			}
		}
		if(!level.var_66e8da6c)
		{
			level.var_66e8da6c = 1;
			bodies = getallcharacterbodies(3);
			body_name = "";
			bodytype = "";
			foreach(playerbodytype in bodies)
			{
				body_name = (dev::function_2c6232e5(makelocalizedstring(getcharacterdisplayname(playerbodytype, 3))) + "") + function_9e72a96(getcharacterassetname(playerbodytype, 3));
				if(body_name === "")
				{
					bodytype = playerbodytype;
					break;
				}
			}
			players = getplayers();
			player = players[0];
			player setclientthirdperson(1);
			setdvar(#"cg_thirdpersonmode", 0);
			setdvar(#"cg_thirdpersonsideoffset", -36);
			setdvar(#"hash_1e667a2fdb87697e", 30);
			setdvar(#"cg_thirdpersonrange", 70);
			setdvar(#"ik_enable", 0);
			weapon = getweapon(#"hash_5b921175aa6e9c98");
			player giveweapon(weapon);
			player switchtoweapon(weapon, 1);
			player setcharacterbodytype(bodytype);
			player function_8fd843dd(0);
		}
		else
		{
			reset_player();
			level.var_66e8da6c = 0;
		}
	#/
}

/*
	Name: function_35b5321c
	Namespace: namespace_4d214d02
	Checksum: 0xCF0255EE
	Offset: 0xB00
	Size: 0x3E8
	Parameters: 0
	Flags: None
*/
function function_35b5321c()
{
	/#
		if(level.var_66e8da6c || level.var_dd510bee)
		{
			level.var_66e8da6c = 0;
			level.var_dd510bee = 0;
			reset_player();
			waitframe(1);
		}
		if(level.var_1ec0ef7b)
		{
			if(isdefined(level.var_31adc03))
			{
				level.var_1ec0ef7b = 0;
				level.var_31adc03 delete();
			}
		}
		if(level.var_78c9a347)
		{
			if(isdefined(level.var_6de2049b))
			{
				level.var_78c9a347 = 0;
				level.var_6de2049b delete();
			}
		}
		if(!level.var_d1bab1c8)
		{
			level.var_d1bab1c8 = 1;
			bodies = getallcharacterbodies(3);
			body_name = "";
			bodytype = "";
			foreach(playerbodytype in bodies)
			{
				body_name = (dev::function_2c6232e5(makelocalizedstring(getcharacterdisplayname(playerbodytype, 3))) + "") + function_9e72a96(getcharacterassetname(playerbodytype, 3));
				if(body_name === "")
				{
					bodytype = playerbodytype;
					break;
				}
			}
			players = getplayers();
			player = players[0];
			player setclientthirdperson(1);
			setdvar(#"cg_thirdpersonmode", 0);
			setdvar(#"cg_thirdpersonsideoffset", -20);
			setdvar(#"hash_1e667a2fdb87697e", 8.7);
			setdvar(#"cg_thirdpersonrange", 77.5);
			setdvar(#"ik_enable", 0);
			weapon = getweapon(#"hash_214037a3a08cdfb6");
			player giveweapon(weapon);
			player switchtoweapon(weapon, 1);
			player setcharacterbodytype(bodytype);
			player function_8fd843dd(0);
		}
		else
		{
			reset_player();
			level.var_d1bab1c8 = 0;
		}
	#/
}

/*
	Name: function_1e1d709d
	Namespace: namespace_4d214d02
	Checksum: 0x359CA4FB
	Offset: 0xEF0
	Size: 0x408
	Parameters: 0
	Flags: None
*/
function function_1e1d709d()
{
	/#
		if(level.var_66e8da6c || level.var_dd510bee || level.var_d1bab1c8)
		{
			level.var_66e8da6c = 0;
			level.var_dd510bee = 0;
			level.var_d1bab1c8 = 0;
			reset_player();
			waitframe(1);
		}
		if(level.var_1ec0ef7b)
		{
			if(isdefined(level.var_31adc03))
			{
				level.var_1ec0ef7b = 0;
				level.var_31adc03 delete();
			}
		}
		if(level.var_78c9a347)
		{
			if(isdefined(level.var_6de2049b))
			{
				level.var_78c9a347 = 0;
				level.var_6de2049b delete();
			}
		}
		if(!level.var_3330d3fd)
		{
			level.var_3330d3fd = 1;
			bodies = getallcharacterbodies(3);
			body_name = "";
			bodytype = "";
			foreach(playerbodytype in bodies)
			{
				body_name = (dev::function_2c6232e5(makelocalizedstring(getcharacterdisplayname(playerbodytype, 3))) + "") + function_9e72a96(getcharacterassetname(playerbodytype, 3));
				if(body_name === "")
				{
					bodytype = playerbodytype;
					break;
				}
			}
			players = getplayers();
			player = players[0];
			player setclientthirdperson(1);
			setdvar(#"cg_thirdpersonmode", 0);
			setdvar(#"cg_thirdpersonsideoffset", -40);
			setdvar(#"hash_1e667a2fdb87697e", 17);
			setdvar(#"cg_thirdpersonrange", 90);
			setdvar(#"ik_enable", 0);
			weapon = getweapon(#"hash_535cdab5f8357e8f");
			player giveweapon(weapon);
			player switchtoweapon(weapon, 1);
			player setcharacterbodytype(bodytype);
			player function_8fd843dd(0);
		}
		else
		{
			reset_player();
			level.var_3330d3fd = 0;
		}
	#/
}

/*
	Name: setup_zombie
	Namespace: namespace_4d214d02
	Checksum: 0x9DEC267A
	Offset: 0x1300
	Size: 0x408
	Parameters: 0
	Flags: None
*/
function setup_zombie()
{
	/#
		if(level.var_66e8da6c || level.var_d1bab1c8 || level.var_3330d3fd)
		{
			level.var_66e8da6c = 0;
			level.var_d1bab1c8 = 0;
			level.var_3330d3fd = 0;
			reset_player();
			waitframe(1);
		}
		if(level.var_1ec0ef7b)
		{
			if(isdefined(level.var_31adc03))
			{
				level.var_1ec0ef7b = 0;
				level.var_31adc03 delete();
			}
		}
		if(level.var_78c9a347)
		{
			if(isdefined(level.var_6de2049b))
			{
				level.var_78c9a347 = 0;
				level.var_6de2049b delete();
			}
		}
		if(!level.var_dd510bee)
		{
			level.var_dd510bee = 1;
			bodies = getallcharacterbodies(3);
			body_name = "";
			bodytype = "";
			foreach(playerbodytype in bodies)
			{
				body_name = (dev::function_2c6232e5(makelocalizedstring(getcharacterdisplayname(playerbodytype, 3))) + "") + function_9e72a96(getcharacterassetname(playerbodytype, 3));
				if(body_name === "")
				{
					bodytype = playerbodytype;
					break;
				}
			}
			players = getplayers();
			player = players[0];
			player setclientthirdperson(1);
			setdvar(#"cg_thirdpersonmode", 0);
			setdvar(#"cg_thirdpersonsideoffset", -8.45);
			setdvar(#"hash_1e667a2fdb87697e", 2.5);
			setdvar(#"cg_thirdpersonrange", 65);
			setdvar(#"ik_enable", 0);
			weapon = getweapon(#"hash_7d1de502c879c4b9");
			player giveweapon(weapon);
			player switchtoweapon(weapon, 1);
			player setcharacterbodytype(bodytype);
			player function_8fd843dd(0);
		}
		else
		{
			reset_player();
			level.var_dd510bee = 0;
		}
	#/
}

/*
	Name: function_3ce8783f
	Namespace: namespace_4d214d02
	Checksum: 0x3A3D00E7
	Offset: 0x1710
	Size: 0x1A4
	Parameters: 0
	Flags: None
*/
function function_3ce8783f()
{
	/#
		if(level.var_1ec0ef7b)
		{
			if(isdefined(level.var_31adc03))
			{
				level.var_1ec0ef7b = 0;
				level.var_31adc03 delete();
			}
			waitframe(1);
		}
		if(!level.var_78c9a347)
		{
			level.var_78c9a347 = 1;
			spawner = getent("", "");
			/#
				assert(isdefined(spawner), "");
			#/
			player = getplayers()[0];
			if(isdefined(player) && isdefined(spawner))
			{
				parasite = spawner spawnfromspawner("", 1);
				if(isdefined(parasite))
				{
					level.var_6de2049b = parasite;
					parasite makeusable();
					parasite usevehicle(player, 0);
				}
			}
		}
		else if(isdefined(level.var_6de2049b))
		{
			level.var_78c9a347 = 0;
			level.var_6de2049b delete();
			reset_player();
		}
	#/
}

/*
	Name: function_29a9ed35
	Namespace: namespace_4d214d02
	Checksum: 0xD4B39744
	Offset: 0x18C0
	Size: 0x184
	Parameters: 0
	Flags: None
*/
function function_29a9ed35()
{
	/#
		if(level.var_78c9a347)
		{
			if(isdefined(level.var_6de2049b))
			{
				level.var_78c9a347 = 0;
				level.var_6de2049b delete();
			}
			waitframe(1);
		}
		if(!level.var_1ec0ef7b)
		{
			level.var_1ec0ef7b = 1;
			spawner = getent("", "");
			player = getplayers()[0];
			if(isdefined(player) && isdefined(spawner))
			{
				dragon = spawner spawnfromspawner("", 1);
				if(isdefined(dragon))
				{
					level.var_31adc03 = dragon;
					dragon makeusable();
					dragon usevehicle(player, 0);
				}
			}
		}
		else if(isdefined(level.var_31adc03))
		{
			level.var_1ec0ef7b = 0;
			level.var_31adc03 delete();
			reset_player();
		}
	#/
}

