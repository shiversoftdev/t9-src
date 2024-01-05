#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using script_19367cd29a4485db;
#using script_34ab99a4ca1a43d;
#using script_16b1b77a76492c6a;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_12a6a726;

/*
	Name: function_1687ba55
	Namespace: namespace_12a6a726
	Checksum: 0x32CEDA53
	Offset: 0x198
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1687ba55()
{
	level notify(767156340);
}

/*
	Name: __init__system__
	Namespace: namespace_12a6a726
	Checksum: 0xA5741E3B
	Offset: 0x1B8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_72a9f15f4124442", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_12a6a726
	Checksum: 0xADB27EA1
	Offset: 0x208
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_49c3a9d150ecbb16")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	namespace_8b6a9d79::function_b3464a7c(#"hash_6bbb00324d163e11", &function_8ba92985, 1);
	clientfield::register("scriptmover", "sr_supply_drop_chest_fx", 1, 2, "int");
	/#
		level thread namespace_420b39d3::function_2fab7a62("");
	#/
}

/*
	Name: function_8ba92985
	Namespace: namespace_12a6a726
	Checksum: 0x33F39B8F
	Offset: 0x318
	Size: 0x2F4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8ba92985(s_instance)
{
	s_instance endon(#"cleanup");
	level flag::wait_till(#"gameplay_started");
	s_instance flag::clear("cleanup");
	s_instance callback::function_d8abfc3d(#"hash_345e9169ebba28fb", &function_db97f0ee);
	s_chest = s_instance.var_fe2612fe[#"hash_6b1e5d8f9e70a70e"][0];
	var_3ba64fe9 = s_instance.var_fe2612fe[#"trigger_spawn"][0];
	s_instance.var_e234ef47 = zm_utility::function_f5a222a8(#"hash_3475619554ec3ac2", s_chest.origin, &function_a1ca0279);
	wait(10);
	if(!isdefined(var_3ba64fe9.height))
	{
		var_3ba64fe9.height = 5000;
	}
	if(!isdefined(var_3ba64fe9.radius))
	{
		var_3ba64fe9.radius = 10000;
	}
	var_8e27c3fd = spawn("trigger_radius", var_3ba64fe9.origin, 256, var_3ba64fe9.radius, var_3ba64fe9.height);
	s_instance.var_8e27c3fd = var_8e27c3fd;
	var_8e27c3fd.target = s_chest.targetname;
	var_69b86a0a = spawn("trigger_radius", s_chest.origin - (0, 0, var_3ba64fe9.height / 2), 0, 1000, var_3ba64fe9.height);
	var_69b86a0a thread function_4dccab86(var_8e27c3fd);
	while(true)
	{
		var_8e27c3fd waittill(#"trigger_look", #"proximity");
		if(level flag::get(#"objective_locked"))
		{
			level flag::wait_till_clear(#"objective_locked");
			continue;
		}
		else
		{
			break;
		}
	}
	var_8e27c3fd delete();
	var_69b86a0a delete();
	function_9212e29c(s_instance, s_chest);
}

/*
	Name: function_a1ca0279
	Namespace: namespace_12a6a726
	Checksum: 0x77A28AAF
	Offset: 0x618
	Size: 0x3E
	Parameters: 2
	Flags: Linked
*/
function function_a1ca0279(v_origin_or_ent, params)
{
	if(level flag::get(#"objective_locked"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_4dccab86
	Namespace: namespace_12a6a726
	Checksum: 0xB7B8C6F8
	Offset: 0x660
	Size: 0x62
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4dccab86(var_8e27c3fd)
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"trigger");
		if(isdefined(var_8e27c3fd))
		{
			var_8e27c3fd notify(#"proximity");
		}
		wait(1);
	}
}

/*
	Name: function_db97f0ee
	Namespace: namespace_12a6a726
	Checksum: 0xF4946FA
	Offset: 0x6D0
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_db97f0ee()
{
	self flag::set("cleanup");
	namespace_58949729::function_ccf9be41(self);
	if(isdefined(self.var_8e27c3fd))
	{
		self.var_8e27c3fd delete();
	}
	if(isdefined(self.ambush_trigger))
	{
		self.ambush_trigger delete();
	}
}

/*
	Name: function_b05e27da
	Namespace: namespace_12a6a726
	Checksum: 0xA52E208E
	Offset: 0x768
	Size: 0xC4
	Parameters: 3
	Flags: Linked
*/
function function_b05e27da(magnitude, duration, rumble)
{
	if(!isdefined(magnitude))
	{
		magnitude = 0.3;
	}
	if(!isdefined(duration))
	{
		duration = 2.5;
	}
	if(!isdefined(rumble))
	{
		rumble = "damage_heavy";
	}
	self endon(#"disconnect");
	earthquake(magnitude, duration, self.origin, 64);
	self playrumblelooponentity(rumble);
	wait(duration);
	self stoprumble(rumble);
}

/*
	Name: function_9212e29c
	Namespace: namespace_12a6a726
	Checksum: 0xC6214E71
	Offset: 0x838
	Size: 0x4A0
	Parameters: 2
	Flags: Linked
*/
function function_9212e29c(s_instance, s_chest)
{
	if(isdefined(level.var_fdcaf3a6) || (isdefined(s_instance) && s_instance flag::get("cleanup")))
	{
		return;
	}
	ex_elevator_overlight_indicator_ = vectorscale((1, 0, 0), 270);
	struct = spawnstruct();
	struct.origin = s_chest.origin + (0, 0, 5000);
	struct.angles = s_chest.angles;
	struct.instance = s_instance;
	array::thread_all(function_a1ef346b(), &function_b05e27da, 0.5, 6, "buzz_high");
	mdl_fx = util::spawn_model("tag_origin", s_chest.origin);
	mdl_fx fx::play(#"hash_2bfc50a526c67da3", mdl_fx.origin, mdl_fx.angles, 9.5 + 1);
	mdl_fx fx::play(#"hash_714bb51c21bb3c4", mdl_fx.origin + (0, 0, 5000), mdl_fx.angles, 9.5 + 1);
	mdl_fx playsound(#"hash_149945a98c1798a6");
	mdl_fx playloopsound(#"hash_3b2e8e212c9bfb8a");
	wait(1);
	s_chest.scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, #"hash_401a47741ffd646f", 1);
	s_chest.var_422ae63e = #"hash_473df02427c669ff";
	var_31919730 = s_chest.scriptmodel;
	var_31919730 function_619a5c20();
	var_31919730 moveto(s_chest.origin, 9.5);
	var_31919730 rotatevelocity((0, 1080 / 9.5, 0), 9.5);
	wait(9.5);
	var_31919730 clientfield::set("sr_supply_drop_chest_fx", 1);
	glassradiusdamage(var_31919730.origin, 600, 800, 400);
	mdl_fx stoploopsound();
	mdl_fx playsound(#"hash_6eca5f5eaa236ce3");
	mdl_fx util::deleteaftertime(3);
	trigger = namespace_8b6a9d79::function_214737c7(s_chest, &function_19490940, #"hash_409a53f32f7cae42", undefined, 96, undefined, undefined, vectorscale((0, 0, 1), 16));
	trigger.struct = s_chest;
	trigger.var_cc1fb2d0 = namespace_58949729::function_fd5e77fa(#"gold");
	var_31919730.trigger = trigger;
	if(!isdefined(s_instance.var_f46ace2))
	{
		s_instance.var_f46ace2 = [];
	}
	else if(!isarray(s_instance.var_f46ace2))
	{
		s_instance.var_f46ace2 = array(s_instance.var_f46ace2);
	}
	if(!isinarray(s_instance.var_f46ace2, struct))
	{
		s_instance.var_f46ace2[s_instance.var_f46ace2.size] = struct;
	}
}

/*
	Name: function_19490940
	Namespace: namespace_12a6a726
	Checksum: 0xF97CAE8A
	Offset: 0xCE0
	Size: 0x340
	Parameters: 1
	Flags: Linked
*/
function function_19490940(eventstruct)
{
	if(is_true(self.b_started))
	{
		return;
	}
	self endon(#"death");
	instance = self.struct.parent;
	var_31919730 = self.struct.scriptmodel;
	var_31919730 endon(#"death");
	self callback::remove_on_trigger(&function_19490940);
	var_571f5454 = self.origin;
	self.b_started = 1;
	self setinvisibletoall();
	var_31919730 clientfield::set("sr_supply_drop_chest_fx", 2);
	wait(2);
	namespace_2c949ef8::do_ambush(var_571f5454, function_873ab308(), 500, 1500);
	self sethintstring(#"hash_75724e383d531b42");
	self setvisibletoall();
	var_31919730 clientfield::set("sr_supply_drop_chest_fx", 3);
	var_31919730 clientfield::set("reward_chest_fx", 3);
	s_result = undefined;
	s_result = self waittill(#"trigger");
	self thread namespace_58949729::function_8665f666(s_result);
	var_31919730 thread namespace_58949729::function_1e2500f();
	namespace_58949729::function_a5d57202(instance);
	level scoreevents::doscoreeventcallback("scoreEventSR", {#location:self.origin, #hash_b0a57f8c:5000, #nearbyplayers:1, #scoreevent:"event_complete"});
	players = getplayers();
	foreach(player in players)
	{
		player zm_stats::function_945c7ce2(#"hash_165462f560a0538c", 1);
		player zm_stats::increment_challenge_stat(#"hash_4cecac797f35ee4");
	}
}

/*
	Name: function_873ab308
	Namespace: namespace_12a6a726
	Checksum: 0x95B66D23
	Offset: 0x1028
	Size: 0xA6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_873ab308()
{
	var_18d554fc = int(min(level.var_15d17eb2, 4));
	var_aa19ae = ((#"hash_31755cceac541303" + var_18d554fc) + "_variant_") + randomintrange(1, 4);
	if(isdefined(getscriptbundle(var_aa19ae)))
	{
		return var_aa19ae;
	}
}

