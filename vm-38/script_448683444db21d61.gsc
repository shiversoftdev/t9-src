#using script_1254ac024174d9c0;
#using script_14f4a3c583c77d4b;
#using script_340a2e805e35f7a2;
#using script_471b31bd963b388e;
#using script_5e96d104c70be5ac;
#using script_6e3c826b1814cab6;
#using script_7a8059ca02b7b09e;
#using script_7bacb32f8222fa3e;
#using script_7fc996fe8678852;
#using script_ab890501c40b73c;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_207ea311;

/*
	Name: function_8c17fa74
	Namespace: namespace_207ea311
	Checksum: 0x7C39A54F
	Offset: 0x1A0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8c17fa74()
{
	level notify(183829673);
}

/*
	Name: function_89f2df9
	Namespace: namespace_207ea311
	Checksum: 0xFD92F2F
	Offset: 0x1C0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_684573a459d68beb", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_207ea311
	Checksum: 0x2C89461A
	Offset: 0x218
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "" + #"hash_63af42145e260fb5", 1, 2, "int");
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_207ea311
	Checksum: 0xBD8DAFB3
	Offset: 0x268
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	callback::on_spawned(&on_player_spawned);
	callback::on_player_killed(&on_death);
}

/*
	Name: on_player_spawned
	Namespace: namespace_207ea311
	Checksum: 0x89CE437A
	Offset: 0x2B8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(isdefined(level.var_33833303))
	{
		self thread [[level.var_33833303]]();
	}
	else
	{
		self thread function_23c31b4e();
	}
}

/*
	Name: on_death
	Namespace: namespace_207ea311
	Checksum: 0xDB1BDA5F
	Offset: 0x308
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function on_death()
{
	self clientfield::set("" + #"hash_63af42145e260fb5", 0);
}

/*
	Name: function_31b6f21e
	Namespace: namespace_207ea311
	Checksum: 0xA6445CD5
	Offset: 0x340
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_31b6f21e(str_notify)
{
	self clientfield::set("" + #"hash_63af42145e260fb5", 0);
}

/*
	Name: function_23c31b4e
	Namespace: namespace_207ea311
	Checksum: 0x945ADB60
	Offset: 0x380
	Size: 0x1C2
	Parameters: 0
	Flags: Linked
*/
function function_23c31b4e()
{
	if(is_true(self.is_hotjoining) || self util::is_spectating())
	{
		return;
	}
	self endoncallback(&function_31b6f21e, #"death");
	while(true)
	{
		if(level flag::get(#"dark_aether_active"))
		{
			self clientfield::set("" + #"hash_63af42145e260fb5", 2);
		}
		else
		{
			if(level flag::get("power_on"))
			{
				self clientfield::set("" + #"hash_63af42145e260fb5", 0);
			}
			else
			{
				self thread function_3ba2978d();
			}
		}
		waitresult = undefined;
		waitresult = level waittill(#"dark_aether_active", #"power_on");
		if(waitresult._notify == "power_on")
		{
			wait(5);
		}
		if(waitresult._notify == "dark_aether_active" && level flag::get(#"dark_aether_active"))
		{
			wait(3);
		}
	}
}

/*
	Name: function_3ba2978d
	Namespace: namespace_207ea311
	Checksum: 0xB483450
	Offset: 0x550
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function function_3ba2978d()
{
	level endon(#"dark_aether_active", #"power_on");
	while(true)
	{
		if(self zm_zonemgr::is_player_in_zone(level.var_b80c4ecc))
		{
			self clientfield::set("" + #"hash_63af42145e260fb5", 1);
		}
		else
		{
			self clientfield::set("" + #"hash_63af42145e260fb5", 0);
		}
		self waittill(#"hash_2d4daa9e80b86b60");
	}
}

/*
	Name: function_57cc7ff7
	Namespace: namespace_207ea311
	Checksum: 0x1C710217
	Offset: 0x628
	Size: 0xC0
	Parameters: 0
	Flags: None
*/
function function_57cc7ff7()
{
	a_players = getplayers();
	foreach(player in a_players)
	{
		player clientfield::set("" + #"hash_63af42145e260fb5", 0);
	}
}

/*
	Name: function_c6b98f73
	Namespace: namespace_207ea311
	Checksum: 0x7B392FE4
	Offset: 0x6F0
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_c6b98f73(a_zones)
{
	if(!isdefined(a_zones))
	{
		a_zones = [];
	}
	else if(!isarray(a_zones))
	{
		a_zones = array(a_zones);
	}
	level.var_b80c4ecc = a_zones;
}

