#using script_16b1b77a76492c6a;
#using script_34ab99a4ca1a43d;
#using script_789f2367a00401d8;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_340a2e805e35f7a2;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_780aaec4;

/*
	Name: function_c0520079
	Namespace: namespace_780aaec4
	Checksum: 0xF48EF326
	Offset: 0x1F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c0520079()
{
	level notify(-944115389);
}

/*
	Name: __init__system__
	Namespace: namespace_780aaec4
	Checksum: 0xD46540B
	Offset: 0x218
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4d08eeea0f720e8d", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_780aaec4
	Checksum: 0xEDAA9DAA
	Offset: 0x268
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_24d18e3942c82edb")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	namespace_8b6a9d79::function_b3464a7c(#"demented_echo", &function_4ba28b7e);
	clientfield::register("scriptmover", "sr_demented_echo_fx", 1, 2, "int");
}

/*
	Name: function_4ba28b7e
	Namespace: namespace_780aaec4
	Checksum: 0x31513B00
	Offset: 0x350
	Size: 0x40C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4ba28b7e(s_instance)
{
	s_instance endon(#"cleanup");
	if(level.var_b48509f9 < 2 || !isdefined(s_instance.targetname) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	s_instance flag::clear("cleanup");
	s_instance callback::function_d8abfc3d(#"hash_345e9169ebba28fb", &function_7ee520f8);
	while(!isdefined(level.var_41dd92fd[#"hash_7cba8a05511ceedf"]))
	{
		wait(1);
	}
	s_spawn = s_instance.var_fe2612fe[#"hash_3aaf33985d01ab9c"][0];
	s_instance.var_85c920d0 = namespace_8b6a9d79::spawn_script_model(s_spawn, #"hash_7c38d5db2819b6f8");
	var_85c920d0 = s_instance.var_85c920d0;
	playsoundatposition(#"hash_45cee0561a5b0142", var_85c920d0.origin);
	var_85c920d0 playloopsound(#"hash_6e9b8f3f3b006d28");
	var_85c920d0 thread scene::play(#"hash_10ecaabb2993aa0f", "idle", var_85c920d0);
	var_85c920d0 clientfield::set("sr_demented_echo_fx", 1);
	var_3d014474 = level.var_41dd92fd[#"hash_7cba8a05511ceedf"].health;
	var_85c920d0.health = int(var_3d014474 * 1.75);
	var_85c920d0.instance = s_instance;
	var_85c920d0 val::set(#"demented_echo", "takedamage", 1);
	var_85c920d0 val::set(#"demented_echo", "allowdeath", 0);
	level thread function_a1ce8017(var_85c920d0);
	trigger = getent(s_instance.targetname, "target");
	if(!isdefined(trigger))
	{
		if(!isdefined(s_spawn.radius))
		{
			s_spawn.radius = 512;
		}
		if(!isdefined(s_spawn.height))
		{
			s_spawn.height = 128;
		}
		v_offset = (0, 0, (int(s_spawn.height) * -1) / 2);
		trigger = spawn("trigger_radius", s_spawn.origin + v_offset, 0, int(s_spawn.radius), int(s_spawn.height));
	}
	trigger.var_85c920d0 = var_85c920d0;
	trigger callback::on_trigger(&function_6b6377f8);
	level callback::add_callback(#"hash_594217387367ebb4", &function_7ee520f8, s_instance);
}

/*
	Name: function_6b6377f8
	Namespace: namespace_780aaec4
	Checksum: 0x18A4CEE6
	Offset: 0x768
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6b6377f8(eventstruct)
{
	player = eventstruct.activator;
	if(!isplayer(player) || isdefined(level.var_fdcaf3a6))
	{
		return;
	}
	if(isdefined(self.var_85c920d0))
	{
		self.var_85c920d0 thread function_6f4653fd(player);
	}
	self delete();
}

/*
	Name: function_6f4653fd
	Namespace: namespace_780aaec4
	Checksum: 0xC2FB0B42
	Offset: 0x800
	Size: 0x4F4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6f4653fd(player)
{
	self endon(#"death", #"hash_3bbde9a70c753c13");
	if(is_true(self.var_297b821a))
	{
		return;
	}
	self.var_297b821a = 1;
	self.var_a0322480 = 1;
	var_55e11aa9 = util::spawn_model("tag_origin", self.origin, self.angles);
	/#
		iprintlnbold("");
	#/
	self clientfield::set("sr_demented_echo_fx", 2);
	self playsound(#"hash_28c76bd90c939842");
	earthquake(0.2, 0.5, self.origin, 1024);
	self thread function_6003bca8(var_55e11aa9, player.origin);
	wait(0.666);
	self clientfield::set("sr_demented_echo_fx", 3);
	n_time = 1.2;
	var_ea405096 = sqr(48);
	self linkto(var_55e11aa9);
	while(isalive(player) && distance2dsquared(var_55e11aa9.origin, player.origin) > var_ea405096)
	{
		v_facing = vectortoangles(player.origin - var_55e11aa9.origin);
		var_55e11aa9 moveto(player.origin, n_time);
		var_55e11aa9 rotateto(v_facing, n_time);
		wait(0.2);
		n_time = max(n_time - 0.1, 0.2);
	}
	self notify(#"hash_1a42ae1b66d06a7d");
	self val::reset(#"demented_echo", "takedamage");
	self val::reset(#"demented_echo", "allowdeath");
	/#
		iprintlnbold("");
	#/
	if(isdefined(player))
	{
		self linkto(var_55e11aa9);
		v_facing = vectortoangles(player.origin - self.origin);
		var_55e11aa9 rotateto(v_facing, 0.3);
		player namespace_68a80213::damageinfirearea(player.origin, undefined, undefined, getweapon(#"molotov_fire"), self, undefined, getscriptbundle("molotov_custom_settings"));
	}
	level thread function_491bb6b7(self.instance, self.origin);
	self playsound(#"hash_1c9b23a03a1c2367");
	earthquake(0.5, 1.25, self.origin, 1024);
	self scene::play(#"hash_10ecaabb2993aa0f", "gotcha", self);
	self clientfield::set("sr_demented_echo_fx", 0);
	util::wait_network_frame();
	var_55e11aa9 delete();
	self deletedelay();
}

/*
	Name: function_6003bca8
	Namespace: namespace_780aaec4
	Checksum: 0xE2508C10
	Offset: 0xD00
	Size: 0x17C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6003bca8(var_55e11aa9, v_player)
{
	self endon(#"death", #"hash_1a42ae1b66d06a7d");
	self thread scene::play(#"hash_10ecaabb2993aa0f", "react", self);
	self linkto(var_55e11aa9);
	s_move_to = self.instance.var_fe2612fe[#"hash_4e469ee1df801af0"][0];
	if(isdefined(s_move_to))
	{
		var_55e11aa9 moveto(s_move_to.origin, 0.333);
	}
	v_facing = vectortoangles(v_player - self.origin);
	var_55e11aa9 rotateto(v_facing, 0.3);
	level flag::wait_till(#"hash_437a8fa2063abd31");
	self thread scene::play(#"hash_10ecaabb2993aa0f", "chase", self);
	self linkto(var_55e11aa9);
}

/*
	Name: function_491bb6b7
	Namespace: namespace_780aaec4
	Checksum: 0x5A4DC05F
	Offset: 0xE88
	Size: 0x19C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_491bb6b7(instance, var_cf21a49f)
{
	instance endon(#"cleanup");
	wait(1.5);
	var_18d554fc = int(max(2, min(5, level.var_15d17eb2)));
	var_e7c0ea90 = #"hash_3f4bb6758c283d17" + var_18d554fc;
	if(isdefined(getscriptbundle(var_e7c0ea90)))
	{
		level.var_ed7e8fdd = #"hash_7f6d176eb7cc63dc";
		level thread namespace_2c949ef8::do_ambush(var_cf21a49f, var_e7c0ea90, 64, 256, undefined, undefined, 0);
	}
	wait(3.5);
	level.var_ed7e8fdd = undefined;
	n_variant = function_21a3a673(1, 3);
	var_aa19ae = ((#"hash_247b96224cbaafaf" + var_18d554fc) + "_variant_") + n_variant;
	if(isdefined(getscriptbundle(var_aa19ae)))
	{
		namespace_2c949ef8::do_ambush(var_cf21a49f, var_aa19ae, 512, 2048);
	}
}

/*
	Name: function_a1ce8017
	Namespace: namespace_780aaec4
	Checksum: 0xF0945250
	Offset: 0x1030
	Size: 0x3C8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a1ce8017(var_85c920d0)
{
	var_85c920d0 endon(#"hash_1a42ae1b66d06a7d");
	while(isdefined(var_85c920d0))
	{
		s_result = undefined;
		s_result = var_85c920d0 waittill(#"damage", #"death");
		if(!isdefined(var_85c920d0) || s_result._notify === #"death")
		{
			return;
		}
		if(!isplayer(s_result.attacker))
		{
			var_85c920d0.health = var_85c920d0.health + s_result.amount;
			continue;
		}
		n_damage = s_result.amount;
		n_damage_type = 1;
		if(s_result.part_name === "j_head")
		{
			n_damage = n_damage * 2.2;
			var_570564b8 = int(n_damage - s_result.amount);
			n_damage_type = 2;
		}
		if(isdefined(var_570564b8))
		{
			var_85c920d0.health = var_85c920d0.health - var_570564b8;
		}
		hud::function_c9800094(s_result.attacker, s_result.position, int(n_damage), n_damage_type);
		if(var_85c920d0.health <= 1)
		{
			/#
				iprintlnbold("");
			#/
			var_85c920d0 notify(#"hash_3bbde9a70c753c13");
			if(!is_true(var_85c920d0.var_8d4e1338) && isplayer(s_result.attacker))
			{
				level scoreevents::doscoreeventcallback("scoreEventSR", {#attacker:s_result.attacker, #scoreevent:"demented_echo_kill_before_shriek_zm"});
			}
			playfx(#"hash_55ac30dd21addebb", var_85c920d0 gettagorigin("j_spineupper"));
			playsoundatposition(#"hash_70cca8a3d457a438", var_85c920d0.origin);
			var_ec6368f9 = namespace_58949729::function_257d7203(#"elite");
			dropstruct = {#hash_738dfc81:3, #angles:var_85c920d0.angles, #origin:var_85c920d0 gettagorigin("j_spineupper")};
			dropstruct thread namespace_65181344::function_fd87c780(var_ec6368f9, 3, 2);
			waitframe(1);
			var_85c920d0 delete();
			return;
		}
		var_85c920d0 thread function_6f4653fd(s_result.attacker);
	}
}

/*
	Name: function_7ee520f8
	Namespace: namespace_780aaec4
	Checksum: 0xB6E6B602
	Offset: 0x1400
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7ee520f8(var_273eefec)
{
	self flag::set("cleanup");
}

