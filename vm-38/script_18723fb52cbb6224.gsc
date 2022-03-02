#using script_16b1b77a76492c6a;
#using script_19367cd29a4485db;
#using script_340a2e805e35f7a2;
#using script_34ab99a4ca1a43d;
#using script_7bacb32f8222fa3e;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_e7ab676d;

/*
	Name: function_de4bf239
	Namespace: namespace_e7ab676d
	Checksum: 0x8BB45E29
	Offset: 0x2B8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_de4bf239()
{
	level notify(91723494);
}

/*
	Name: function_89f2df9
	Namespace: namespace_e7ab676d
	Checksum: 0x7F485A7D
	Offset: 0x2D8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7811e7ce71e374d0", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_e7ab676d
	Checksum: 0x3A76DD71
	Offset: 0x328
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(is_true(getgametypesetting(#"hash_1e1a5ebefe2772ba")))
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_4e8a552c8b6dcbb2")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	namespace_8b6a9d79::function_b3464a7c(#"hash_9c101fd93022c18", &function_602f1c7e);
	callback::function_10a4dd0a(&function_97d03d85);
	util::registerclientsys("musicUnlock");
}

/*
	Name: function_602f1c7e
	Namespace: namespace_e7ab676d
	Checksum: 0xDE051DF4
	Offset: 0x450
	Size: 0x444
	Parameters: 1
	Flags: None
*/
function function_602f1c7e(instance)
{
	instance endon(#"cleanup");
	if(!is_true(instance.force_spawn) && randomintrange(0, 101) >= 25 && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	level flag::wait_till(#"gameplay_started");
	instance flag::clear("cleanup");
	instance callback::function_d8abfc3d(#"hash_345e9169ebba28fb", &function_a3780cd3);
	level callback::add_callback(#"hash_594217387367ebb4", &function_a3780cd3, instance);
	s_radio = instance.var_fe2612fe[#"radio"][0];
	var_364b8f56 = (isdefined(instance.var_fe2612fe[#"hash_2a62eb308e140655"]) ? instance.var_fe2612fe[#"hash_2a62eb308e140655"] : []);
	if(!is_true(instance.var_600aeeb9))
	{
		instance.var_74554a28 = zm_utility::function_f5a222a8(#"hash_496b373a4a051d25", s_radio.origin, &function_f128aae9);
	}
	instance.var_628c4a3a = namespace_8b6a9d79::spawn_script_model(s_radio, #"rus_radio_05");
	instance.var_628c4a3a fx::play(#"hash_6615a4858493260b", instance.var_628c4a3a.origin, instance.var_628c4a3a.angles, #"light_change");
	instance.var_364b8f56 = var_364b8f56;
	foreach(var_c42af4d6 in var_364b8f56)
	{
		var_c42af4d6.var_e43750de = namespace_8b6a9d79::spawn_script_model(var_c42af4d6, #"rus_radio_backpack_01_b");
	}
	s_start = instance.var_fe2612fe[#"start"][0];
	s_start.scriptmodel = instance.var_628c4a3a;
	instance.s_start = s_start;
	instance.trigger = namespace_8b6a9d79::function_214737c7(s_start, &function_1d6f6f32, #"hash_4f14ba599385295e", undefined, 64);
	instance.trigger.instance = instance;
	var_7f1aa846 = #"hash_2c156700f31bca97";
	if(instance.content_script_name === "amplify")
	{
		var_7f1aa846 = #"hash_47ed2b712bc3aa56";
	}
	instance.var_628c4a3a playloopsound(var_7f1aa846);
	instance.var_628c4a3a thread function_35bafcde(instance, "idle", "radio");
}

/*
	Name: function_f128aae9
	Namespace: namespace_e7ab676d
	Checksum: 0x58159B26
	Offset: 0x8A0
	Size: 0x3E
	Parameters: 2
	Flags: None
*/
function function_f128aae9(v_origin_or_ent, params)
{
	if(level flag::get(#"objective_locked"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_1d6f6f32
	Namespace: namespace_e7ab676d
	Checksum: 0xC1E33901
	Offset: 0x8E8
	Size: 0x144
	Parameters: 1
	Flags: Private
*/
function private function_1d6f6f32(eventstruct)
{
	self.instance endon(#"cleanup");
	if(is_true(self.b_activated))
	{
		return;
	}
	self.b_activated = 1;
	self callback::function_b74bf3e(&function_1d6f6f32);
	level thread function_ba971eed(self.instance);
	level thread function_556eed55(self);
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"trigger");
		if(self.instance flag::get("correct_frequencies"))
		{
			break;
		}
		wait(0.1);
	}
	self.instance flag::set("radio_tuning_success");
	wait(2);
	self delete();
}

/*
	Name: function_556eed55
	Namespace: namespace_e7ab676d
	Checksum: 0xE76EDE33
	Offset: 0xA38
	Size: 0x150
	Parameters: 1
	Flags: None
*/
function function_556eed55(trigger)
{
	trigger.instance endon(#"cleanup");
	trigger endon(#"death");
	trigger sethintstring("");
	trigger setinvisibletoall();
	trigger.instance flag::wait_till("first_ambush_complete");
	trigger sethintstring(#"hash_57baaa534c81e367");
	trigger setvisibletoall();
	while(true)
	{
		trigger.instance flag::wait_till("correct_frequencies");
		trigger sethintstring(#"hash_7c3a9502649aec15");
		trigger.instance flag::wait_till_clear("correct_frequencies");
		trigger sethintstring(#"hash_57baaa534c81e367");
	}
}

/*
	Name: function_ba971eed
	Namespace: namespace_e7ab676d
	Checksum: 0x408FC436
	Offset: 0xB90
	Size: 0x6D4
	Parameters: 1
	Flags: None
*/
function function_ba971eed(instance)
{
	instance endon(#"cleanup");
	instance.var_628c4a3a stoploopsound();
	var_a2f3927f = #"hash_7e7c603e2ee4fc35";
	if(instance.content_script_name === "amplify")
	{
		var_a2f3927f = #"hash_e5c05e974fad1d6";
	}
	instance.var_628c4a3a playsound(var_a2f3927f);
	instance.var_628c4a3a notify(#"light_change");
	instance.var_628c4a3a fx::play(#"hash_2461617b51991e17", instance.var_628c4a3a.origin, instance.var_628c4a3a.angles, #"light_change");
	wait(0.5);
	instance.var_628c4a3a playloopsound(#"hash_6f36df54622394e0");
	instance.var_628c4a3a thread function_35bafcde(instance, "feedback", "radio");
	instance.var_628c4a3a notify(#"light_change");
	instance.var_628c4a3a fx::play(#"hash_6615a4858493260b", instance.var_628c4a3a.origin, instance.var_628c4a3a.angles, #"light_change");
	var_571f5454 = instance.var_628c4a3a.origin;
	level function_334316f8(var_571f5454, 45);
	instance flag::set("first_ambush_complete");
	instance.var_628c4a3a notify(#"light_change");
	instance.var_628c4a3a fx::play(#"hash_2461617b51991e17", instance.var_628c4a3a.origin, instance.var_628c4a3a.angles, #"light_change");
	instance.var_628c4a3a playsound(#"hash_4d16320cccbd00fc");
	instance.var_3875a0bb = function_21a3a673(1, 8);
	instance.var_628c4a3a playloopsound(#"hash_15bd285132a5e267" + instance.var_3875a0bb);
	instance.var_628c4a3a thread function_35bafcde(instance, instance.var_3875a0bb, "radio");
	var_364b8f56 = (isdefined(instance.var_fe2612fe[#"hash_2a62eb308e140655"]) ? instance.var_fe2612fe[#"hash_2a62eb308e140655"] : []);
	foreach(var_c42af4d6 in var_364b8f56)
	{
		var_c42af4d6.var_e43750de thread function_42d1d544(instance);
	}
	level thread function_2c1d994f(instance);
	instance flag::wait_till("radio_tuning_success");
	instance.var_628c4a3a stoploopsound();
	var_84152d93 = #"hash_7395bde5c5f8e1b9";
	if(instance.content_script_name === "amplify")
	{
		var_84152d93 = #"hash_7306f4c002ca0976";
	}
	instance.var_628c4a3a playsound(var_84152d93);
	wait(1);
	dropstruct = {#hash_738dfc81:8, #angles:instance.s_start.angles + (vectorscale((0, -1, 0), 45)), #origin:instance.s_start.origin};
	dropstruct namespace_65181344::function_fd87c780(#"hash_bd0d579ff12f6d", 8, 3);
	if(!is_true(instance.var_8ba71ca4))
	{
		var_4d16dab7 = dropstruct namespace_65181344::function_fd87c780(#"hash_66c9f76a0a28f990", 1, 3);
		if(isdefined(var_4d16dab7) && isdefined(var_4d16dab7[0]))
		{
			var_976623c6 = var_4d16dab7[0].var_a6762160.name;
			level thread function_b1aee549(instance, var_976623c6);
		}
	}
	var_1c81dd7a = instance.var_a5bc8c2c;
	var_ef68496e = int((isdefined(instance.var_2b4467a7) ? instance.var_2b4467a7 : 1));
	if(isstring(var_1c81dd7a) && var_1c81dd7a != "")
	{
		dropstruct namespace_65181344::function_fd87c780(var_1c81dd7a, var_ef68496e, 3);
	}
	instance thread function_a3780cd3();
}

/*
	Name: function_42d1d544
	Namespace: namespace_e7ab676d
	Checksum: 0x481C0DB6
	Offset: 0x1270
	Size: 0x588
	Parameters: 1
	Flags: None
*/
function function_42d1d544(instance)
{
	instance endon(#"cleanup");
	instance endon(#"hash_5d368f3e3a642450");
	self endon(#"death");
	var_3875a0bb = instance.var_3875a0bb;
	var_b61e50f0 = function_21a3a673(1, 8);
	self.b_set = 0;
	self.var_cb78e59d = 0;
	self.var_e7606911 = 0;
	usetrigger = spawn("trigger_radius_use", self.origin, 0, 96, 96, 1);
	usetrigger triggerignoreteam();
	usetrigger setcursorhint("HINT_NOICON");
	usetrigger usetriggerrequirelookat();
	usetrigger sethintstring(#"hash_62ab4ca34f5b97d6");
	self.usetrigger = usetrigger;
	self playloopsound(#"hash_76a8c4dd7f9da5f3");
	self thread function_35bafcde(instance, "idle");
	self fx::play(#"hash_33d3573cec691428", self.origin, self.angles, #"light_change");
	while(true)
	{
		usetrigger waittill(#"trigger");
		var_b61e50f0 = var_b61e50f0 + 1;
		if(var_b61e50f0 > 8)
		{
			var_b61e50f0 = 1;
		}
		usetrigger sethintstring("");
		usetrigger setinvisibletoall();
		self stoploopsound();
		self playsound(#"hash_4d16320cccbd00fc");
		var_fb400364 = function_d3b57053(instance);
		if(is_true(var_fb400364) && !self.var_cb78e59d)
		{
			wait(0.5);
			if(self.var_e7606911)
			{
				self.var_e7606911 = 0;
				self notify(#"light_change");
				self fx::play(#"hash_33d3573cec691428", self.origin, self.angles, #"light_change");
			}
			self.var_cb78e59d = 1;
			self playloopsound(#"hash_3b453b7c6a3141d4");
			self thread function_35bafcde(instance, "feedback");
			level function_334316f8(self.origin, 30);
			self playsound(#"hash_4d16320cccbd00fc");
		}
		else
		{
			wait(0.5);
		}
		if(!self.var_e7606911)
		{
			self.var_e7606911 = 1;
			self notify(#"light_change");
			self fx::play(#"hash_447841d9ee8d6d38", self.origin, self.angles, #"light_change");
		}
		self playloopsound(#"hash_2f65077ad9554da3" + var_b61e50f0);
		self thread function_35bafcde(instance, var_b61e50f0);
		if(var_b61e50f0 === var_3875a0bb)
		{
			self.b_set = 1;
			instance notify(#"hash_2277cbc7a1c6b43", {#hash_e43750de:self, #increase:1});
		}
		else if(is_true(self.b_set))
		{
			self.b_set = 0;
			instance notify(#"hash_2277cbc7a1c6b43", {#hash_e43750de:self, #increase:0});
		}
		wait(0.5);
		usetrigger sethintstring(#"hash_62ab4ca34f5b97d6");
		usetrigger setvisibletoall();
	}
}

/*
	Name: function_35bafcde
	Namespace: namespace_e7ab676d
	Checksum: 0x56BFCA2F
	Offset: 0x1800
	Size: 0xD6
	Parameters: 3
	Flags: None
*/
function function_35bafcde(instance, str_suffix, str_type)
{
	if(!isdefined(str_type))
	{
		str_type = "amplifier";
	}
	self notify("515bb502b3a7f1c7");
	self endon("515bb502b3a7f1c7");
	instance endon(#"cleanup");
	instance endon(#"hash_5d368f3e3a642450");
	self endon(#"death");
	while(true)
	{
		self playsound(((#"hash_5025a103d5f8470" + str_type) + "_subtitle_") + str_suffix);
		wait(5);
	}
}

/*
	Name: function_2c1d994f
	Namespace: namespace_e7ab676d
	Checksum: 0x2CCAF639
	Offset: 0x18E0
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_2c1d994f(instance)
{
	instance endon(#"cleanup");
	instance endon(#"hash_5d368f3e3a642450");
	n_count = 0;
	while(true)
	{
		result = undefined;
		result = instance waittill(#"hash_2277cbc7a1c6b43");
		if(is_true(result.increase))
		{
			n_count++;
			if(n_count === 3)
			{
				instance flag::set("correct_frequencies");
			}
		}
		else
		{
			if(n_count === 3)
			{
				instance flag::clear("correct_frequencies");
			}
			n_count--;
		}
	}
}

/*
	Name: function_d3b57053
	Namespace: namespace_e7ab676d
	Checksum: 0x26DAC0DF
	Offset: 0x19E8
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function function_d3b57053(instance)
{
	if(!isdefined(instance.var_abe944bc))
	{
		instance.var_abe944bc = 10;
	}
	if(randomintrange(1, 101) <= instance.var_abe944bc)
	{
		instance.var_abe944bc = 1;
		return true;
	}
	instance.var_abe944bc = instance.var_abe944bc + 5;
	if(instance.var_abe944bc >= 50)
	{
		instance.var_abe944bc = 50;
	}
	return false;
}

/*
	Name: function_a3780cd3
	Namespace: namespace_e7ab676d
	Checksum: 0x919AC21E
	Offset: 0x1A90
	Size: 0x1AC
	Parameters: 0
	Flags: None
*/
function function_a3780cd3()
{
	self flag::set("cleanup");
	if(isdefined(self.var_74554a28))
	{
		objective_clearentity(self.var_74554a28);
		zm_utility::function_bc5a54a8(self.var_74554a28);
		self.var_74554a28 = undefined;
	}
	if(isdefined(self.var_364b8f56))
	{
		foreach(var_c42af4d6 in self.var_364b8f56)
		{
			var_c42af4d6.var_e43750de notify(#"light_change");
			var_c42af4d6.var_e43750de stoploopsound();
			if(isdefined(var_c42af4d6.var_e43750de.usetrigger))
			{
				var_c42af4d6.var_e43750de.usetrigger delete();
			}
		}
	}
	self.var_628c4a3a notify(#"light_change");
	self.var_628c4a3a stoploopsound();
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
}

/*
	Name: function_b1aee549
	Namespace: namespace_e7ab676d
	Checksum: 0x1FAD9E4E
	Offset: 0x1C48
	Size: 0x274
	Parameters: 2
	Flags: None
*/
function function_b1aee549(instance, var_976623c6)
{
	if(!isdefined(var_976623c6))
	{
		return;
	}
	str_soundalias = undefined;
	str_notify = undefined;
	switch(var_976623c6)
	{
		case "hash_21cd65c5d1f254be":
		{
			str_soundalias = #"hash_6755c177f50bb3fa";
			break;
		}
		case "hash_4b7cc96fc84ad4b1":
		{
			str_soundalias = #"hash_599e14c54d1ea19a";
			break;
		}
		case "hash_4b7cc86fc84ad2fe":
		{
			str_soundalias = #"hash_738f7006809f42c5";
			break;
		}
		case "hash_4b7ccb6fc84ad817":
		{
			str_soundalias = #"hash_37eada309854dffb";
			break;
		}
		case "hash_4b7cca6fc84ad664":
		{
			str_soundalias = #"hash_78c7fa9c089c9381";
			break;
		}
		case "hash_4b7ccd6fc84adb7d":
		{
			str_soundalias = #"hash_5e33c483e58b6702";
			break;
		}
		case "hash_4b7ccc6fc84ad9ca":
		{
			str_soundalias = #"hash_170ba2307aac7c2d";
			break;
		}
		case "hash_4b7cbf6fc84ac3b3":
		{
			str_soundalias = #"hash_45de3a102350938d";
			break;
		}
		case "hash_4b7cbe6fc84ac200":
		{
			str_soundalias = #"hash_35287d8d56302388";
			break;
		}
		case "hash_4b79c16fc8489142":
		{
			str_soundalias = #"hash_3eb6b923f3a43bff";
			break;
		}
		case "hash_4b79c26fc84892f5":
		{
			str_soundalias = #"hash_302e3a9e4c319483";
			break;
		}
		case "hash_4b79bf6fc8488ddc":
		{
			str_soundalias = #"hash_60495857d8fa7605";
			break;
		}
		case "hash_4b79c06fc8488f8f":
		{
			str_soundalias = #"hash_7cf9b86388acf946";
			break;
		}
	}
	if(isdefined(str_soundalias))
	{
		instance.var_628c4a3a playsound(str_soundalias);
	}
}

/*
	Name: function_97d03d85
	Namespace: namespace_e7ab676d
	Checksum: 0x291A6E0F
	Offset: 0x1EC8
	Size: 0x264
	Parameters: 1
	Flags: None
*/
function function_97d03d85(s_params)
{
	if(!isplayer(self))
	{
		return;
	}
	item = s_params.item;
	if(!isdefined(item.var_a6762160.name))
	{
		return;
	}
	item_name = item.var_a6762160.name;
	str_notify = undefined;
	switch(item_name)
	{
		case "hash_21cd65c5d1f254be":
		{
			str_notify = "unlockSRmus_01";
			break;
		}
		case "hash_4b7cc96fc84ad4b1":
		{
			str_notify = "unlockSRmus_02";
			break;
		}
		case "hash_4b7cc86fc84ad2fe":
		{
			str_notify = "unlockSRmus_03";
			break;
		}
		case "hash_4b7ccb6fc84ad817":
		{
			str_notify = "unlockSRmus_04";
			break;
		}
		case "hash_4b7cca6fc84ad664":
		{
			str_notify = "unlockSRmus_05";
			break;
		}
		case "hash_4b7ccd6fc84adb7d":
		{
			str_notify = "unlockSRmus_06";
			break;
		}
		case "hash_4b7ccc6fc84ad9ca":
		{
			str_notify = "unlockSRmus_07";
			break;
		}
		case "hash_4b7cbf6fc84ac3b3":
		{
			str_notify = "unlockSRmus_08";
			break;
		}
		case "hash_4b7cbe6fc84ac200":
		{
			str_notify = "unlockSRmus_09";
			break;
		}
		case "hash_4b79c16fc8489142":
		{
			str_notify = "unlockSRmus_10";
			break;
		}
		case "hash_4b79c26fc84892f5":
		{
			str_notify = "unlockSRmus_11";
			break;
		}
		case "hash_4b79bf6fc8488ddc":
		{
			str_notify = "unlockSRmus_12";
			break;
		}
		case "hash_4b79c06fc8488f8f":
		{
			str_notify = "unlockSRmus_13";
			break;
		}
		default:
		{
			return;
		}
	}
	if(isdefined(str_notify))
	{
		util::setclientsysstate("musicUnlock", str_notify);
	}
}

/*
	Name: function_334316f8
	Namespace: namespace_e7ab676d
	Checksum: 0x800BEA64
	Offset: 0x2138
	Size: 0x4A
	Parameters: 2
	Flags: None
*/
function function_334316f8(var_cefe6e34, n_time)
{
	level thread namespace_2c949ef8::do_ambush(var_cefe6e34, undefined, 500, 1500, undefined, n_time, 0);
	wait(n_time);
}

