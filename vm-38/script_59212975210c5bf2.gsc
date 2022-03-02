#using script_19367cd29a4485db;
#using script_340a2e805e35f7a2;
#using script_3411bb48d41bd3b;
#using script_34ab99a4ca1a43d;
#using script_7e59d7bba853fe4b;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_ac4c291d;

/*
	Name: function_787fb99d
	Namespace: namespace_ac4c291d
	Checksum: 0xDD8054AE
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_787fb99d()
{
	level notify(1302096796);
}

/*
	Name: function_89f2df9
	Namespace: namespace_ac4c291d
	Checksum: 0x8457FD92
	Offset: 0x178
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1c2f845f6ae4ceb2", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_ac4c291d
	Checksum: 0xBB1481B8
	Offset: 0x1C8
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_67a7a1b18751c7b4")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	namespace_8b6a9d79::function_b3464a7c(#"hash_64333b9f066daefa", &function_cc775529, 1);
}

/*
	Name: function_cc775529
	Namespace: namespace_ac4c291d
	Checksum: 0x67EE6C29
	Offset: 0x288
	Size: 0xD94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cc775529(s_instance)
{
	s_instance endon(#"cleanup");
	s_instance flag::clear("cleanup");
	s_instance callback::function_d8abfc3d(#"hash_345e9169ebba28fb", &function_eda98f63);
	level callback::add_callback(#"hash_594217387367ebb4", &function_eda98f63, s_instance);
	s_start = s_instance.var_fe2612fe[#"hash_1c8503ea56f80cf7"][0];
	s_mid = s_instance.var_fe2612fe[#"hash_1c8504ea56f80eaa"][0];
	s_end = s_instance.var_fe2612fe[#"hash_1c8505ea56f8105d"][0];
	var_b7eee573 = namespace_8b6a9d79::spawn_script_model(s_start, #"hash_53079af25eecf35b");
	var_b7eee573 setscale(0.5);
	var_b7eee573 playsound(#"hash_55b5e35f7d261fee");
	var_b7eee573 playloopsound(#"hash_5dc7884f02e73776");
	s_instance.var_b7eee573 = var_b7eee573;
	s_instance.n_obj_id = zm_utility::function_f5a222a8(#"hash_2d6eaf696a019fa3", var_b7eee573);
	var_b7eee573.aitype = #"hash_1aff4b71635bda08";
	var_b7eee573.var_ae8ec545 = #"hash_5eaef6da3bb64b9a";
	var_3d014474 = function_9ad12bee(var_b7eee573.aitype);
	var_b7eee573.maxhealth = var_b7eee573 namespace_e0710ee6::function_f7014c3d(var_3d014474);
	var_b7eee573.health = var_b7eee573.maxhealth;
	var_b7eee573 val::set(#"hash_1592629a5ec5c8a", "takedamage", 1);
	var_b7eee573 val::set(#"hash_1592629a5ec5c8a", "allowdeath", 0);
	v_fx_offset = vectorscale((0, 0, 1), 22);
	var_a758131a = vectorscale((0, 0, 1), 22);
	var_b7eee573 fx::play(#"hash_c36745220550934", var_b7eee573.origin + v_fx_offset, var_b7eee573.angles, #"hash_4aa1201cb1b6cb04");
	var_b7eee573 ghost();
	var_63ef2885 = undefined;
	n_damage_total = 0;
	var_e81e0492 = 0;
	var_1a8b690d = 0;
	var_31eda780 = 8;
	var_edcf865 = var_b7eee573.maxhealth / (var_31eda780 + zm_utility::function_e3025ca5());
	var_d6cf3f65 = 1;
	var_1b519b48 = s_mid;
	var_b7eee573 endon(#"death");
	while(true)
	{
		s_result = undefined;
		s_result = var_b7eee573 waittill(#"damage", #"hash_5261a9b309eef309", #"hash_13c4c7440825676a");
		if(s_result._notify === #"hash_13c4c7440825676a")
		{
			/#
				iprintlnbold("");
			#/
			level thread fx::play(#"hash_779e4e163c8d0dae", var_b7eee573.origin + v_fx_offset, var_b7eee573.angles);
			playsoundatposition(#"hash_76169abd873150fa", var_b7eee573.origin);
			var_b7eee573 stoploopsound();
			s_instance thread function_eda98f63();
			break;
		}
		if(s_result._notify === "damage")
		{
			if(!isplayer(s_result.attacker) || s_result.mod === "MOD_CRUSH")
			{
				continue;
			}
			var_b7eee573 notify(#"hash_d1228bf1661c95");
			var_b7eee573 thread function_7d88cc57();
			if(var_d6cf3f65 == 1)
			{
				if(!isdefined(var_63ef2885))
				{
					var_63ef2885 = gettime();
					var_b7eee573 util::delay_notify(float(5000) / 1000, #"hash_5261a9b309eef309");
					var_b7eee573 notify(#"hash_4aa1201cb1b6cb04");
					var_b7eee573 playsound(#"hash_641d6edcbf8111c1");
					var_b7eee573 fx::play(#"hash_3d9456f797f0eeff", var_b7eee573.origin + v_fx_offset, var_b7eee573.angles, "movedone", 1);
				}
				else
				{
					var_b7eee573 playsound(#"hash_641d6edcbf8111c1");
				}
				n_damage_total = n_damage_total + s_result.amount;
				var_4a6e5d8a = int(n_damage_total / var_edcf865);
				if(var_4a6e5d8a > 12 - var_e81e0492)
				{
					var_4a6e5d8a = 12 - var_e81e0492;
				}
				if(var_4a6e5d8a > 0)
				{
					n_damage_total = int(n_damage_total - (var_edcf865 * var_4a6e5d8a));
					level thread fx::play(#"hash_3955925eb5e7de1f", var_b7eee573.origin + v_fx_offset, var_b7eee573.angles);
					dropstruct = {#hash_738dfc81:var_4a6e5d8a, #angles:var_b7eee573.angles, #origin:var_b7eee573.origin + var_a758131a};
					dropstruct thread namespace_65181344::function_fd87c780(#"hash_bd0d579ff12f6d", var_4a6e5d8a, 2, #"hash_3b44370452dc91f8");
					var_e81e0492 = var_e81e0492 + var_4a6e5d8a;
					if(!isdefined(var_1b519b48))
					{
						var_1a8b690d = var_1a8b690d + var_4a6e5d8a;
					}
					/#
						iprintlnbold("" + var_e81e0492);
					#/
					if(var_e81e0492 == 12)
					{
						var_d6cf3f65 = 0;
						if(!isdefined(var_1b519b48))
						{
							var_206de304 = int(min(getplayers().size, 2));
							dropstruct = {#hash_738dfc81:var_206de304, #angles:var_b7eee573.angles, #origin:var_b7eee573.origin};
							dropstruct thread namespace_65181344::function_fd87c780(#"hash_1b1c96a3d03b6415", var_206de304, 2);
							level scoreevents::doscoreeventcallback("scoreEventSR", {#allplayers:1, #scoreevent:"destroy_aether_orb_zm"});
						}
					}
				}
			}
		}
		if(s_result._notify === #"hash_5261a9b309eef309" || var_d6cf3f65 === 0 || (isdefined(var_63ef2885) && (var_63ef2885 + 5000) < gettime()))
		{
			var_b7eee573 notify(#"hash_4588a3de47c44f6f");
			var_b7eee573.var_b8477436 = 0;
			if(!isdefined(var_1b519b48))
			{
				var_b7eee573 notsolid();
				if(var_1a8b690d > 0)
				{
					dropstruct.origin = dropstruct.origin - var_a758131a;
					dropstruct thread namespace_65181344::function_fd87c780(namespace_58949729::function_fd5e77fa(#"large"), var_1a8b690d, 2);
				}
				if(isdefined(var_206de304))
				{
					level thread fx::play(#"hash_1b9b90f45278a5ae", var_b7eee573.origin + v_fx_offset, var_b7eee573.angles);
				}
				else
				{
					level thread fx::play(#"hash_779e4e163c8d0dae", var_b7eee573.origin + v_fx_offset, var_b7eee573.angles);
				}
				playsoundatposition(#"hash_4e565c316ea5ada2", var_b7eee573.origin);
				s_instance thread function_eda98f63();
				break;
			}
			n_dist = distance(var_b7eee573.origin, var_1b519b48.origin);
			if(!isdefined(var_1b519b48.var_67700391))
			{
				var_1b519b48.var_67700391 = 0;
			}
			n_timeout = (max(30, 90 * (n_dist / 10000))) + float(var_1b519b48.var_67700391);
			var_b7eee573 util::delay_notify(n_timeout, #"hash_13c4c7440825676a", #"hash_d1228bf1661c95");
			var_b7eee573 fx::play(#"hash_1746736d1c3b2acc", var_b7eee573.origin + v_fx_offset, var_b7eee573.angles, #"hash_4708ec2a663db459", 1);
			/#
				iprintlnbold("" + n_timeout);
			#/
			n_move_time = n_dist / 300;
			var_b7eee573 playsound(#"hash_3bd4a77bc51dfb52");
			var_b7eee573 playloopsound(#"hash_5455d7addafa1122");
			var_b7eee573 moveto(var_1b519b48.origin, n_move_time);
			var_b7eee573 waittill(#"movedone");
			var_b7eee573 playsound(#"hash_55b5e35f7d261fee");
			var_b7eee573 playloopsound(#"hash_5dc7884f02e73776");
			var_b7eee573 notify(#"hash_4708ec2a663db459");
			var_b7eee573.health = var_b7eee573.maxhealth;
			var_63ef2885 = undefined;
			n_damage_total = 0;
			var_e81e0492 = 0;
			var_d6cf3f65 = 1;
			var_31eda780 = var_31eda780 + (2 * zm_utility::function_e3025ca5());
			var_edcf865 = var_b7eee573.maxhealth / var_31eda780;
			var_b7eee573 fx::play(#"hash_c36745220550934", var_b7eee573.origin + v_fx_offset, var_b7eee573.angles, #"hash_4aa1201cb1b6cb04", 1);
			if(var_1b519b48 == s_mid)
			{
				var_1b519b48 = s_end;
			}
			else
			{
				var_1b519b48 = undefined;
			}
		}
	}
}

/*
	Name: function_7d88cc57
	Namespace: namespace_ac4c291d
	Checksum: 0xAA5ED58D
	Offset: 0x1028
	Size: 0x128
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7d88cc57()
{
	self endon(#"death", #"hash_4588a3de47c44f6f");
	if(is_true(self.var_b8477436))
	{
		return;
	}
	self.var_b8477436 = 1;
	while(true)
	{
		self bobbing((randomfloatrange(-0.5, 0.5), randomfloatrange(-0.5, 0.5), randomfloatrange(-0.5, 0.5)), 10, 0.3);
		wait(randomfloatrange(0.3, 0.3 * 4));
	}
}

/*
	Name: function_eda98f63
	Namespace: namespace_ac4c291d
	Checksum: 0xC2C175AA
	Offset: 0x1158
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_eda98f63(var_273eefec)
{
	self flag::set("cleanup");
	if(isdefined(self.n_obj_id))
	{
		objective_clearentity(self.n_obj_id);
		zm_utility::function_bc5a54a8(self.n_obj_id);
		self.n_obj_id = undefined;
	}
	if(isdefined(self.var_b7eee573))
	{
		self.var_b7eee573 deletedelay();
	}
}

