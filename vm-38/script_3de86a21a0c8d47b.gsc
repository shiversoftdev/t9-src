#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using script_13114d8a31c6152a;
#using script_35ae72be7b4fec10;
#using script_4937c6974f43bb71;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_37f9ff47f340fbe8;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;

#namespace spy_camera;

/*
	Name: function_927937ca
	Namespace: spy_camera
	Checksum: 0xE5983A30
	Offset: 0x310
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_927937ca()
{
	level notify(-1093478414);
}

/*
	Name: __init__system__
	Namespace: spy_camera
	Checksum: 0x29B09891
	Offset: 0x330
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("spy_camera", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: spy_camera
	Checksum: 0xCAB31A7B
	Offset: 0x370
	Size: 0x20C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_weapon_change(&on_weapon_change);
	callback::on_spawned(&function_ab7ec803);
	clientfield::register("toplayer", "spy_camera_state", 1, 2, "int");
	clientfield::register("toplayer", "binoculars_overlay", 1, 1, "int");
	clientfield::register("toplayer", "spy_camera_tagging", 1, 1, "int");
	clientfield::register("actor", "spy_camera_remove_highlight", 1, 1, "int");
	var_1e935eba = array("actor", "scriptmover");
	foreach(str_type in var_1e935eba)
	{
		clientfield::register(str_type, "spy_camera_object_of_interest", 1, 2, "int");
	}
	level.var_e3f5eafc = getweapon("eq_spy_camera");
	level.var_42db149f = getweapon("eq_binoculars");
}

/*
	Name: function_f785d9e9
	Namespace: spy_camera
	Checksum: 0x15ACE8A2
	Offset: 0x588
	Size: 0x150
	Parameters: 3
	Flags: None
*/
function function_f785d9e9(objects, var_7eb1c6be, var_354b19f1)
{
	if(!isdefined(var_7eb1c6be))
	{
		var_7eb1c6be = 0;
	}
	if(!isdefined(objects))
	{
		objects = [];
	}
	else if(!isarray(objects))
	{
		objects = array(objects);
	}
	val = 1;
	if(var_7eb1c6be)
	{
		val = 2;
	}
	foreach(object in objects)
	{
		object clientfield::set("spy_camera_object_of_interest", val);
		object thread function_654fa552(var_354b19f1);
		if(var_7eb1c6be)
		{
			object thread function_a6928964(var_354b19f1);
		}
	}
}

/*
	Name: function_654fa552
	Namespace: spy_camera
	Checksum: 0xD8198ADB
	Offset: 0x6E0
	Size: 0x90
	Parameters: 1
	Flags: Linked, Private
*/
function private function_654fa552(var_57e553fd)
{
	self endon(#"death", #"hash_54e0f219fc10204a");
	self waittillmatch({#fieldvalue:1, #hash_aad36d51:0}, #"hash_72a5fe161eb7a0ce");
	self notify(#"hash_4e1642d862c17b5b");
	if(isdefined(var_57e553fd))
	{
		var_57e553fd notify(#"hash_4e1642d862c17b5b");
	}
}

/*
	Name: function_a6928964
	Namespace: spy_camera
	Checksum: 0xC3FEBA2F
	Offset: 0x778
	Size: 0xAC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a6928964(var_57e553fd)
{
	self endon(#"death", #"hash_4e1642d862c17b5b", #"hash_54e0f219fc10204a");
	while(true)
	{
		self waittillmatch({#fieldvalue:2, #hash_aad36d51:0}, #"hash_72a5fe161eb7a0ce");
		self notify(#"hash_54596dc066040d8c");
		if(isdefined(var_57e553fd))
		{
			var_57e553fd notify(#"hash_54596dc066040d8c");
		}
	}
}

/*
	Name: function_b28ab5a9
	Namespace: spy_camera
	Checksum: 0x6C69014
	Offset: 0x830
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function function_b28ab5a9(object)
{
	object clientfield::set("spy_camera_object_of_interest", 0);
	object notify(#"hash_54e0f219fc10204a");
}

/*
	Name: function_69190c4e
	Namespace: spy_camera
	Checksum: 0x91B1AC10
	Offset: 0x878
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_69190c4e()
{
	clientfield::set_to_player("spy_camera_tagging", 1);
}

/*
	Name: function_c11bdcc0
	Namespace: spy_camera
	Checksum: 0xE63F543D
	Offset: 0x8A8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_c11bdcc0()
{
	clientfield::set_to_player("spy_camera_tagging", 0);
}

/*
	Name: on_weapon_change
	Namespace: spy_camera
	Checksum: 0x68C7672A
	Offset: 0x8D0
	Size: 0x1BC
	Parameters: 1
	Flags: Linked
*/
function on_weapon_change(params)
{
	var_b67a0cc6 = is_true(self.var_340d4e74) || (params.last_weapon !== level.weaponnone && (params.last_weapon === level.var_e3f5eafc || params.last_weapon === level.var_42db149f));
	if(var_b67a0cc6 || (params.last_weapon === level.weaponnone && self clientfield::get_to_player("spy_camera_state") != 0))
	{
		self.var_340d4e74 = undefined;
		self thread function_d704edcd(params.last_weapon === level.var_42db149f);
	}
	var_d14812a6 = params.weapon !== level.weaponnone && (params.weapon === level.var_e3f5eafc || params.weapon === level.var_42db149f);
	if(var_d14812a6)
	{
		var_c5c03b2 = params.weapon === level.var_42db149f;
		var_e047216a = "ges_spy_camera_ads";
		self.var_340d4e74 = 1;
		if(var_c5c03b2)
		{
			var_e047216a = "ges_binoculars_ads";
		}
		self thread function_b917e313(params.weapon, var_e047216a, var_c5c03b2);
	}
}

/*
	Name: function_ab7ec803
	Namespace: spy_camera
	Checksum: 0xE0792B0E
	Offset: 0xA98
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_ab7ec803()
{
	level flag::delay_set(0.1, "flg_spy_cam_player_spawned");
}

/*
	Name: function_6de171e9
	Namespace: spy_camera
	Checksum: 0x1C209E09
	Offset: 0xAD0
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function function_6de171e9(slot)
{
	if(!isdefined(slot))
	{
		slot = 4;
	}
	/#
		assert(level.var_e3f5eafc != level.weaponnone);
	#/
	self giveweapon(level.var_e3f5eafc);
	self setactionslot(slot, "weapon", level.var_e3f5eafc);
	self.var_390003ff = slot;
}

/*
	Name: function_8606cd15
	Namespace: spy_camera
	Checksum: 0x21359364
	Offset: 0xB78
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function function_8606cd15(slot)
{
	if(!isdefined(slot))
	{
		slot = 4;
	}
	/#
		assert(level.var_42db149f != level.weaponnone);
	#/
	self giveweapon(level.var_42db149f);
	self setactionslot(slot, "weapon", level.var_42db149f);
	self.var_5915e3c5 = slot;
}

/*
	Name: function_b83af2a9
	Namespace: spy_camera
	Checksum: 0x24A82337
	Offset: 0xC20
	Size: 0xC6
	Parameters: 0
	Flags: None
*/
function function_b83af2a9()
{
	player = undefined;
	if(isplayer(self))
	{
		player = self;
	}
	else
	{
		player = getplayers()[0];
	}
	if(player hasweapon(level.var_e3f5eafc))
	{
		player takeweapon(level.var_e3f5eafc);
	}
	if(isdefined(player.var_390003ff))
	{
		player setactionslot(player.var_390003ff, "");
		player.var_390003ff = undefined;
	}
}

/*
	Name: remove_binoculars
	Namespace: spy_camera
	Checksum: 0xC438A072
	Offset: 0xCF0
	Size: 0xC6
	Parameters: 0
	Flags: None
*/
function remove_binoculars()
{
	player = undefined;
	if(isplayer(self))
	{
		player = self;
	}
	else
	{
		player = getplayers()[0];
	}
	if(player hasweapon(level.var_42db149f))
	{
		player takeweapon(level.var_42db149f);
	}
	if(isdefined(player.var_5915e3c5))
	{
		player setactionslot(player.var_5915e3c5, "");
		player.var_5915e3c5 = undefined;
	}
}

/*
	Name: function_f91a82ef
	Namespace: spy_camera
	Checksum: 0x3B629567
	Offset: 0xDC0
	Size: 0xFC
	Parameters: 4
	Flags: None
*/
function function_f91a82ef(b_enabled, var_b3649521, initial_delay, var_34487abc)
{
	if(!isdefined(b_enabled))
	{
		b_enabled = 1;
	}
	if(!isdefined(var_b3649521))
	{
		var_b3649521 = #"hash_12be6ba1327c64b1";
	}
	if(!isdefined(initial_delay))
	{
		initial_delay = 8000;
	}
	level.var_e3f5eafc.var_f91a82ef = b_enabled;
	level.var_e3f5eafc.var_7d598677 = var_b3649521;
	level.var_e3f5eafc.var_3a0d6cd6 = initial_delay;
	level.var_e3f5eafc.var_257480e5 = var_34487abc;
	if(b_enabled == 0)
	{
		level flag::wait_till("flg_spy_cam_player_spawned");
		getplayers()[0] thread util::hide_hint_text();
	}
}

/*
	Name: function_de6d9b74
	Namespace: spy_camera
	Checksum: 0x78928DF2
	Offset: 0xEC8
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function function_de6d9b74(prompts)
{
	/#
		assert(isarray(prompts) || ishash(prompts));
	#/
	level.var_af143f1d = [];
	if(isarray(prompts))
	{
		level.var_af143f1d = prompts;
	}
	else
	{
		if(!isdefined(level.var_af143f1d))
		{
			level.var_af143f1d = [];
		}
		else if(!isarray(level.var_af143f1d))
		{
			level.var_af143f1d = array(level.var_af143f1d);
		}
		level.var_af143f1d[level.var_af143f1d.size] = prompts;
	}
}

/*
	Name: function_b917e313
	Namespace: spy_camera
	Checksum: 0x5ED48C8B
	Offset: 0xFD0
	Size: 0xB20
	Parameters: 3
	Flags: Linked, Private
*/
function private function_b917e313(camera, var_e047216a, var_c5c03b2)
{
	self endon(#"death", #"hash_84ab457ebc19a5a");
	if(!isdefined(self.spy_camera))
	{
		self.spy_camera = spawnstruct();
	}
	var_f94537f6 = 0;
	var_d587d9d3 = 0;
	var_ff17ab00 = 0;
	var_697c5b2b = int(2 * 1000);
	var_a05f9c5f = 0;
	var_83cf950f = self getgesturestarttime(var_e047216a, "loop") * 1000;
	var_4308b3d8 = 0;
	var_a30db60b = 0;
	self val::set("spy_camera", "disable_weapon_fire", 1);
	self notify(#"hash_1f7aaeb7335319e5");
	if(!var_c5c03b2)
	{
		self notify(#"hash_2afde4f84491f78a");
		self thread function_2d8ba5c4();
		setuimodelvalue(getuimodel(function_90d058e8(#"spy_camera"), "stream"), 1);
	}
	else
	{
		setuimodelvalue(getuimodel(function_90d058e8(#"spy_camera"), "stream"), 2);
	}
	while(true)
	{
		if(!self isswitchingweapons() && !self isreloading() && self adsbuttonpressed())
		{
			if(!var_a30db60b)
			{
				var_a30db60b = 1;
				self playgestureviewmodel(var_e047216a, undefined, 1);
				var_4308b3d8 = var_83cf950f + gettime();
				var_d587d9d3 = 0;
				self notify(#"hash_19f1b179d8ebf1dd");
				self val::set("spy_camera", "freezecontrols_allowlook", 1);
				self val::set("spy_camera", "disable_weapon_cycling", 1);
			}
			else if(self isgestureplaying(var_e047216a) && gettime() > var_4308b3d8)
			{
				if(!var_f94537f6)
				{
					var_f94537f6 = 1;
					self notify(#"hash_59b80e9e535f9788");
				}
				if(var_a05f9c5f != 1)
				{
					var_a05f9c5f = 1;
					self clientfield::set_to_player("spy_camera_state", 1);
					namespace_82bfe441::fade(1, "FadeFast");
					if(var_c5c03b2)
					{
						self clientfield::set_to_player("binoculars_overlay", 1);
						namespace_61e6d095::create(#"binoculars", #"hash_1703896731dc6998");
					}
					self thread function_376f686f();
					self hideviewmodel();
					self val::reset("spy_camera", "disable_weapon_fire");
					namespace_c8e236da::function_c27f93d5();
					if(!isdefined(level.var_af143f1d) || level.var_af143f1d.size == 0)
					{
						level.var_af143f1d = [];
						if(self gamepadusedlast())
						{
							if(!isdefined(level.var_af143f1d))
							{
								level.var_af143f1d = [];
							}
							else if(!isarray(level.var_af143f1d))
							{
								level.var_af143f1d = array(level.var_af143f1d);
							}
							level.var_af143f1d[level.var_af143f1d.size] = #"hash_4d41512a9dd19c05";
						}
						else
						{
							if(!isdefined(level.var_af143f1d))
							{
								level.var_af143f1d = [];
							}
							else if(!isarray(level.var_af143f1d))
							{
								level.var_af143f1d = array(level.var_af143f1d);
							}
							level.var_af143f1d[level.var_af143f1d.size] = #"hash_d4008a2e030bdb1";
							if(!isdefined(level.var_af143f1d))
							{
								level.var_af143f1d = [];
							}
							else if(!isarray(level.var_af143f1d))
							{
								level.var_af143f1d = array(level.var_af143f1d);
							}
							level.var_af143f1d[level.var_af143f1d.size] = #"hash_2057dc2d69c5cb2";
						}
						if(!var_c5c03b2)
						{
							if(!isdefined(level.var_af143f1d))
							{
								level.var_af143f1d = [];
							}
							else if(!isarray(level.var_af143f1d))
							{
								level.var_af143f1d = array(level.var_af143f1d);
							}
							level.var_af143f1d[level.var_af143f1d.size] = #"hash_38a90a5154d5fa9a";
						}
					}
					foreach(item in level.var_af143f1d)
					{
						namespace_c8e236da::function_ebf737f8(item);
					}
				}
				else if(!var_c5c03b2 && self attackbuttonpressed() && gettime() > var_ff17ab00)
				{
					var_a05f9c5f = 2;
					var_ff17ab00 = var_697c5b2b + gettime();
					self clientfield::set_to_player("spy_camera_state", 2);
					namespace_c8e236da::function_f7362969(hash("spy_camera_photo_taken"));
					self notify(#"take_picture");
					self val::set("spy_camera", "disable_weapon_fire", 1);
					self util::delay((float(var_697c5b2b) / 1000) - 0.5, "death", &namespace_c8e236da::function_f7362969, hash("spy_camera_photo_taken"), 0);
					wait((float(var_697c5b2b) / 1000) - 0.25);
				}
			}
		}
		else if(var_a30db60b)
		{
			var_a30db60b = 0;
			if(var_f94537f6)
			{
				var_f94537f6 = 0;
				namespace_c8e236da::function_c27f93d5();
			}
			if(var_a05f9c5f != 0)
			{
				self lui::screen_fade_out(0.1);
				var_a05f9c5f = 0;
				self clientfield::set_to_player("spy_camera_state", 0);
				wait(0.1);
				namespace_82bfe441::fade(0, "FadeFast");
				if(var_c5c03b2)
				{
					self clientfield::set_to_player("binoculars_overlay", 0);
					namespace_61e6d095::remove(#"binoculars");
				}
				self lui::screen_fade_in(0.05);
				self showviewmodel();
				self val::set("spy_camera", "disable_weapon_fire", 1);
			}
			self stopgestureviewmodel(var_e047216a);
			self notifyonplayercommandremove("toggle_stance", "+stance");
			self notifyonplayercommandremove("go_stand", "+gostand");
			self notify(#"hash_5512f0799022267");
			self val::reset("spy_camera", "freezecontrols_allowlook");
			self val::reset("spy_camera", "disable_weapon_cycling");
			while(self isgestureplaying(var_e047216a))
			{
				waitframe(1);
			}
			self notify(#"hash_2c04af2e3bf6a169");
		}
		waitframe(1);
	}
}

/*
	Name: function_376f686f
	Namespace: spy_camera
	Checksum: 0x59105788
	Offset: 0x1AF8
	Size: 0x148
	Parameters: 0
	Flags: Linked, Private
*/
function private function_376f686f()
{
	self endon(#"hash_5512f0799022267", #"hash_84ab457ebc19a5a", #"death");
	self notifyonplayercommand("toggle_stance", "+stance");
	self notifyonplayercommand("go_stand", "+gostand");
	while(true)
	{
		ret = undefined;
		ret = self waittill(#"toggle_stance", #"go_stand");
		if(ret._notify == "go_stand" || self getstance() != "stand")
		{
			self setstance("stand");
		}
		else
		{
			self setstance("crouch");
		}
		wait(0.5);
	}
}

/*
	Name: function_d704edcd
	Namespace: spy_camera
	Checksum: 0x6A41F88A
	Offset: 0x1C48
	Size: 0x254
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d704edcd(var_c5c03b2)
{
	self notify(#"hash_84ab457ebc19a5a");
	namespace_c8e236da::function_c27f93d5();
	self val::reset("spy_camera", "freezecontrols_allowlook");
	self val::reset("spy_camera", "disable_weapon_cycling");
	self clientfield::set_to_player("spy_camera_state", 0);
	namespace_82bfe441::fade(0, "FadeFast");
	self lui::function_a6eb5334(0);
	if(namespace_61e6d095::exists(#"binoculars"))
	{
		self clientfield::set_to_player("binoculars_overlay", 0);
		namespace_61e6d095::remove(#"binoculars");
	}
	self notify(#"hash_2977cbecfddfcab6");
	self notify(#"hash_167fe97f3e95d4c2");
	self notify(#"hide_camera_unequip_hint");
	level.var_af143f1d = [];
	self showviewmodel();
	self val::reset_all("spy_camera");
	self notifyonplayercommandremove("toggle_stance", "+stance");
	self notifyonplayercommandremove("go_stand", "+gostand");
	setuimodelvalue(getuimodel(function_90d058e8(#"spy_camera"), "stream"), 0);
}

/*
	Name: function_2d8ba5c4
	Namespace: spy_camera
	Checksum: 0xCB122B39
	Offset: 0x1EA8
	Size: 0x2CC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2d8ba5c4()
{
	self notify(#"hash_2977cbecfddfcab6");
	self endon(#"hash_2977cbecfddfcab6", #"death");
	var_acca0715 = gettime();
	if(!isdefined(level.var_e3f5eafc.var_7d598677))
	{
		level.var_e3f5eafc.var_7d598677 = #"hash_12be6ba1327c64b1";
	}
	if(!isdefined(level.var_e3f5eafc.var_3a0d6cd6))
	{
		level.var_e3f5eafc.var_3a0d6cd6 = 8000;
	}
	if(!isdefined(level.var_e3f5eafc.var_f91a82ef))
	{
		level.var_e3f5eafc.var_f91a82ef = 1;
	}
	while(true)
	{
		var_b3fccd4b = gettime();
		var_496bb3bc = var_b3fccd4b - var_acca0715;
		if(is_true(level.var_e3f5eafc.var_f91a82ef) && var_496bb3bc >= level.var_e3f5eafc.var_3a0d6cd6 && !self scene::function_c935c42() && !self flag::get(#"lockpicking"))
		{
			var_34487abc = (isdefined(level.var_e3f5eafc.var_257480e5) ? level.var_e3f5eafc.var_257480e5 : "hide_camera_unequip_hint");
			self util::show_hint_text(level.var_e3f5eafc.var_7d598677, undefined, var_34487abc, 4000);
			self waittill(#"hash_19f1b179d8ebf1dd");
			self util::hide_hint_text(0);
		}
		else if(self scene::function_c935c42() || self flag::get(#"lockpicking"))
		{
			wait(1);
			var_acca0715 = gettime();
		}
		if(self isgestureplaying(#"ges_spy_camera_ads"))
		{
			self waittill(#"hash_2c04af2e3bf6a169");
			var_acca0715 = gettime();
		}
		wait(0.5);
	}
}

