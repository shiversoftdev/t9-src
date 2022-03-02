#using script_1292451e284848cc;
#using script_1361a24271e9db13;
#using script_18f0d22c75b141a7;
#using script_26850092de25d970;
#using script_2b1257dca3b9fd1e;
#using script_2c1348b5a72ac8cf;
#using script_2dc48f46bfeac894;
#using script_31786c2dc684e9b;
#using script_31e9b35aaacbbd93;
#using script_35e4637ff0faed7f;
#using script_3626f1b2cf51a99c;
#using script_387057e76430d4cf;
#using script_3dc93ca9902a9cda;
#using script_3f27a7b2232674db;
#using script_45e09f634c49fdba;
#using script_474bf596f5ecdb01;
#using script_499673e499d3dc1a;
#using script_4ab78e327b76395f;
#using script_51c03a543ea0ed19;
#using script_56ca01b3b31455b5;
#using script_61cfc2ab8e60625;
#using script_67c9a990c0db216c;
#using script_693a0b9bd751df83;
#using script_6a27f4a76e9218f0;
#using script_6b47294865dc34b5;
#using script_70b6424f429d140;
#using script_73e0d5e10c6348fa;
#using script_7cf3e180e994d17f;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\util.gsc;

#namespace cp_takedown;

/*
	Name: function_6144e41d
	Namespace: cp_takedown
	Checksum: 0xFD00F9AF
	Offset: 0x498
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6144e41d()
{
	level notify(1633417991);
}

#namespace namespace_45a40084;

/*
	Name: main
	Namespace: namespace_45a40084
	Checksum: 0x5BC61F08
	Offset: 0x4B8
	Size: 0x1C4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	setclearanceceiling(16);
	init_flags();
	init_clientfields();
	init_skiptos();
	level thread lui::function_b95a3ba5("full_screen_movie", &full_screen_movie::register);
	load::main();
	init_scenes();
	init_callbacks();
	thread function_7ea0ce5f();
	level thread namespace_47eaac63::function_70dd6f0e();
	level.player = getplayers()[0];
	level flag::set("no_corpse_pickup");
	setdvar(#"hash_76c0d7e6385ee6de", 0.3);
	setdvar(#"hash_4466b01c6d8d7307", 4);
	if(!function_72a9e321())
	{
		setdvar(#"r_maxspotshadowupdates", 12);
		setdvar(#"hash_6846956a9fb8374d", 2);
	}
}

/*
	Name: init_skiptos
	Namespace: namespace_45a40084
	Checksum: 0x8B9F969B
	Offset: 0x688
	Size: 0x6D4
	Parameters: 0
	Flags: Linked
*/
function init_skiptos()
{
	skipto::function_eb91535d("tkdn_raid_bar", &namespace_5df9d277::main, &namespace_5df9d277::starting, "Hit 2: Bar", &namespace_5df9d277::cleanup, [0:"amsterdam_intro"]);
	skipto::function_eb91535d("tkdn_raid_gearup", &namespace_c9f7b6af::main, &namespace_c9f7b6af::starting, "Hit 2: Gear Up", &namespace_c9f7b6af::cleanup, [1:"amsterdam_main", 0:"amsterdam_intro"]);
	skipto::function_eb91535d("tkdn_raid_apt", &namespace_b331012d::main, &namespace_b331012d::starting, "Hit 2: Apartment", &namespace_b331012d::cleanup, [1:"amsterdam_main", 0:"amsterdam_intro"]);
	skipto::function_eb91535d("tkdn_raid_rooftops", &namespace_e133827d::main, &namespace_e133827d::starting, "Hit 2: Rooftops", &namespace_e133827d::cleanup, [0:"amsterdam_main"]);
	skipto::function_eb91535d("tkdn_raid_slide", &namespace_53e86c1f::main, &namespace_53e86c1f::starting, "Hit 2: Slide", &namespace_53e86c1f::cleanup, [0:"amsterdam_main"]);
	skipto::function_eb91535d("tkdn_raid_capture", &namespace_b995dbff::main, &namespace_b995dbff::starting, "Hit 2: Capture", &namespace_b995dbff::cleanup, [0:"amsterdam_main"]);
	skipto::function_eb91535d("tkdn_af_intro", &namespace_4926d69e::main, &namespace_4926d69e::starting, "Hit 3: Intro", &namespace_4926d69e::cleanup, [1:"airfield_base", 0:"airfield_intro"]);
	skipto::function_eb91535d("tkdn_af_hill", &namespace_7d4dd7f0::main, &namespace_7d4dd7f0::starting, "Hit 3: Hill", &namespace_7d4dd7f0::cleanup, [1:"airfield_base", 0:"airfield_intro"]);
	skipto::add("tkdn_af_tarmac", &namespace_2fbde9a9::main, &namespace_2fbde9a9::starting, "Hit 3: Tarmac", &namespace_2fbde9a9::cleanup, [1:"airfield_base", 0:"airfield_intro"]);
	skipto::function_eb91535d("tkdn_af_chase", &namespace_38c39f5::main, &namespace_38c39f5::starting, "Hit 3: Chase", &namespace_38c39f5::cleanup, [1:"airfield_base", 0:"airfield_intro"]);
	skipto::function_eb91535d("tkdn_af_rc_chase", &namespace_38c39f5::function_2ccc781e, &namespace_38c39f5::function_614083bb, "Hit 3: RC Chase", &namespace_38c39f5::function_cca97e77, [0:"airfield_base"]);
	skipto::add("tkdn_af_skid", &namespace_38d05c38::main, &namespace_38d05c38::starting, "Hit 3: Skid", &namespace_38d05c38::cleanup, [0:"airfield_base"]);
	skipto::function_eb91535d("tkdn_af_wreck", &namespace_47eaac63::main, &namespace_47eaac63::starting, "Hit 3: Wreck", &namespace_47eaac63::cleanup, [0:"airfield_base"]);
	/#
		skipto::add_dev("", &namespace_5df9d277::main, &namespace_5df9d277::starting, "", &namespace_5df9d277::cleanup, undefined, undefined, [0:""]);
		skipto::add_dev("", &namespace_5df9d277::main, &namespace_5df9d277::starting, "", &namespace_5df9d277::cleanup, undefined, undefined, [3:"", 2:"", 1:"", 0:""]);
		skipto::add_dev("", &namespace_4926d69e::main, &namespace_4926d69e::starting, "", &namespace_4926d69e::cleanup, undefined, undefined, [0:""]);
		skipto::add_dev("", &function_5bef74d0);
	#/
}

/*
	Name: function_5bef74d0
	Namespace: namespace_45a40084
	Checksum: 0xF725E976
	Offset: 0xD68
	Size: 0x18
	Parameters: 2
	Flags: None
*/
function function_5bef74d0(str_skipto, b_starting)
{
	/#
	#/
}

/*
	Name: init_flags
	Namespace: namespace_45a40084
	Checksum: 0xA19742FC
	Offset: 0xD88
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function init_flags()
{
	namespace_e66dabaf::init_flags();
	namespace_cb0d537d::init_flags();
	namespace_29b42773::init_flags();
	namespace_5df9d277::init_flags();
	namespace_c9f7b6af::init_flags();
	namespace_b331012d::init_flags();
	namespace_b995dbff::init_flags();
	namespace_7d4dd7f0::init_flags();
	namespace_2fbde9a9::init_flags();
	namespace_38c39f5::init_flags();
	namespace_38d05c38::init_flags();
	namespace_47eaac63::init_flags();
}

/*
	Name: init_clientfields
	Namespace: namespace_45a40084
	Checksum: 0x1DAD651B
	Offset: 0xE58
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function init_clientfields()
{
	namespace_b100dd86::init_clientfields();
	namespace_e66dabaf::init_clientfields();
	namespace_cb0d537d::init_clientfields();
	namespace_29b42773::init_clientfields();
	namespace_5df9d277::init_clientfields();
	namespace_c9f7b6af::init_clientfields();
	namespace_b331012d::init_clientfields();
	namespace_b995dbff::init_clientfields();
	namespace_7d4dd7f0::init_clientfields();
	namespace_2fbde9a9::init_clientfields();
	namespace_38c39f5::init_clientfields();
	namespace_38d05c38::init_clientfields();
	namespace_47eaac63::init_clientfields();
}

/*
	Name: init_scenes
	Namespace: namespace_45a40084
	Checksum: 0xD33F6C87
	Offset: 0xF38
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function init_scenes()
{
	namespace_e66dabaf::init_scenes();
	namespace_cb0d537d::init_scenes();
	namespace_29b42773::init_scenes();
	namespace_5df9d277::init_scenes();
	namespace_c9f7b6af::init_scenes();
	namespace_b331012d::init_scenes();
	namespace_b995dbff::init_scenes();
	namespace_7d4dd7f0::init_scenes();
	namespace_2fbde9a9::init_scenes();
	namespace_38c39f5::init_scenes();
	namespace_38d05c38::init_scenes();
	namespace_47eaac63::init_scenes();
}

/*
	Name: init_callbacks
	Namespace: namespace_45a40084
	Checksum: 0xF37F5F02
	Offset: 0x1008
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function init_callbacks()
{
	callback::on_spawned(&function_8106e2e1);
	callback::on_connect(&on_player_connect);
}

/*
	Name: on_player_connect
	Namespace: namespace_45a40084
	Checksum: 0x61F1F653
	Offset: 0x1058
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	if(isdefined(level.skipto_current_objective) && array::contains(level.skipto_current_objective, "tkdn_raid_bar") || level.skipto_current_objective.size == 0)
	{
		util::set_player_start_flag("cp_takedown_player_ready");
		if(isdefined(level.str_player_start_flag) && !self flag::exists(level.str_player_start_flag))
		{
			self flag::init(level.str_player_start_flag);
		}
	}
}

/*
	Name: function_8106e2e1
	Namespace: namespace_45a40084
	Checksum: 0x3739E5BD
	Offset: 0x1120
	Size: 0x38A
	Parameters: 0
	Flags: Linked
*/
function function_8106e2e1()
{
	self setcharacterbodytype(1);
	if(strstartswith(level.skipto_current_objective[0], "tkdn_af_"))
	{
		self function_8fd843dd(9);
	}
	else
	{
		self function_8fd843dd(2);
	}
	thread namespace_b100dd86::setup_objectives(level.skipto_current_objective[0]);
	knife = getweapon(#"knife_held");
	player = getplayers()[0];
	if(player hasweapon(knife, 1))
	{
		player takeweapon(knife, 1);
	}
	switch(level.skipto_current_objective[0])
	{
		case "hash_43fda5a71e2cf1d9":
		{
			var_4f2ba130 = self getweaponslist();
			foreach(var_5f48185 in var_4f2ba130)
			{
				self takeweapon(var_5f48185);
			}
			break;
		}
		case "hash_512e8aab43df84ba":
		{
			var_4f2ba130 = self getweaponslist();
			foreach(var_5f48185 in var_4f2ba130)
			{
				self takeweapon(var_5f48185);
			}
			break;
		}
		case "hash_3ccd7ea71a859e23":
		{
			function_95b5afc9();
			break;
		}
		case "hash_284d0daaf024071e":
		{
			function_95b5afc9();
			break;
		}
		case "hash_c8e65be67e56b17":
		case "hash_12044e7569915825":
		case "hash_3131dfbc0ce5b7d9":
		case "hash_35cbe00e084c6cf2":
		case "hash_4582a1402b7d9111":
		case "hash_55356ede737cfa8e":
		{
			function_43593d7d();
			break;
		}
		default:
		{
			function_95b5afc9();
			break;
		}
	}
}

/*
	Name: function_95b5afc9
	Namespace: namespace_45a40084
	Checksum: 0x35DBC06F
	Offset: 0x14B8
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function function_95b5afc9()
{
	var_4f2ba130 = self getweaponslist();
	foreach(var_5f48185 in var_4f2ba130)
	{
		self takeweapon(var_5f48185);
	}
	var_9f43fd46 = getweapon(#"smg_standard_t9", "steadyaim", "elo2", "grip");
	pistol = getweapon(#"pistol_semiauto_t9", "steadyaim", "fastreload", "reflex_pistol");
	self namespace_c25eb016::function_2e7c81f6(var_9f43fd46, pistol, #"frag_grenade");
	self switchtoweapon(var_9f43fd46);
	self initialweaponraise(var_9f43fd46);
}

/*
	Name: function_6154e4c2
	Namespace: namespace_45a40084
	Checksum: 0xDCAACC66
	Offset: 0x1648
	Size: 0x1CC
	Parameters: 0
	Flags: None
*/
function function_6154e4c2()
{
	var_4f2ba130 = self getweaponslist();
	foreach(var_5f48185 in var_4f2ba130)
	{
		self takeweapon(var_5f48185);
	}
	primary_weapon = getweapon(#"smg_standard_t9", array("reflex", "fastreload"));
	primaryoffhand = getweapon(#"frag_grenade");
	secondary_weapon = getweapon(#"sniper_quickscope_t9");
	w_pistol = getweapon(#"pistol_semiauto_t9", "steadyaim", "fastreload", "reflex_pistol");
	self giveweapon(primary_weapon);
	self giveweapon(secondary_weapon);
	self switchtoweapon(primary_weapon);
}

/*
	Name: function_13f6e85
	Namespace: namespace_45a40084
	Checksum: 0x91CA3FE1
	Offset: 0x1820
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_13f6e85()
{
	secondaryoffhand = getweapon(#"gadget_health_regen");
	secondaryoffhandcount = 0;
	slot = "secondarygrenade";
	if(!self hasweapon(secondaryoffhand))
	{
		self giveweapon(secondaryoffhand);
		self setweaponammoclip(secondaryoffhand, secondaryoffhandcount);
		self switchtooffhand(secondaryoffhand);
		self.grenadetypesecondary = secondaryoffhand;
		self.grenadetypesecondarycount = secondaryoffhandcount;
		self ability_util::function_36a15b60(secondaryoffhand);
	}
}

/*
	Name: function_43593d7d
	Namespace: namespace_45a40084
	Checksum: 0x6A2C5D19
	Offset: 0x1908
	Size: 0x2A6
	Parameters: 0
	Flags: Linked
*/
function function_43593d7d()
{
	player = getplayers()[0];
	var_4f2ba130 = self getweaponslist();
	foreach(var_5f48185 in var_4f2ba130)
	{
		if(isdefined(var_5f48185) && var_5f48185 != getweapon(#"null_offhand_primary") && var_5f48185 != getweapon("gadget_health_regen"))
		{
			self takeweapon(var_5f48185);
		}
	}
	primary_weapon = getweapon(#"ar_standard_t9", array("holo", "steadyaim", "grip", "extclip"));
	secondary_weapon = getweapon(#"sniper_quickscope_t9");
	w_pistol = getweapon(#"pistol_semiauto_t9", "steadyaim", "fastreload", "reflex_pistol");
	self giveweapon(primary_weapon);
	player setweaponammoclip(primary_weapon, primary_weapon.clipsize);
	player givemaxammo(primary_weapon);
	self giveweapon(secondary_weapon);
	player setweaponammoclip(secondary_weapon, secondary_weapon.clipsize);
	self switchtoweapon(primary_weapon);
	weapons = player getweaponslist(1);
}

/*
	Name: function_acddd8f1
	Namespace: namespace_45a40084
	Checksum: 0x9AE0F653
	Offset: 0x1BB8
	Size: 0x2C0
	Parameters: 0
	Flags: None
*/
function function_acddd8f1()
{
	player = getplayers()[0];
	var_4f2ba130 = self getweaponslist();
	foreach(var_5f48185 in var_4f2ba130)
	{
		self takeweapon(var_5f48185);
	}
	level waittill(#"hash_47b9f42b49b80814");
	wait(1);
	primary_weapon = getweapon(#"ar_standard_t9", "steadyaim", "reflex");
	primaryoffhand = getweapon(#"frag_grenade");
	secondary_weapon = getweapon(#"sniper_quickscope_t9");
	w_pistol = getweapon(#"pistol_semiauto_t9", "steadyaim", "fastreload", "reflex_pistol");
	self giveweapon(primary_weapon);
	self giveweapon(secondary_weapon);
	self switchtoweapon(primary_weapon);
	weapons = player getweaponslist(1);
	foreach(weap in weapons)
	{
		player setweaponammoclip(weap, weap.clipsize);
		player setweaponammostock(weap, weap.maxammo);
	}
}

/*
	Name: function_7ea0ce5f
	Namespace: namespace_45a40084
	Checksum: 0x4EC929F3
	Offset: 0x1E80
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_7ea0ce5f()
{
	level flag::wait_till("oob_fail");
	level util::missionfailedwrapper(#"hash_32ab03edc2a4077d");
	level waittill(#"forever");
}

