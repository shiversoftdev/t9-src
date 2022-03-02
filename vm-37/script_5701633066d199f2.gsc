#using script_1510b5c03c279e8f;
#using script_15ddefec0f2c1a92;
#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ce46999727f2f2b;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_2c5daa95f8fec03c;
#using script_2c7754f0e88c7dd4;
#using script_35598499769dbb3d;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3bbf85ab4cb9f3c2;
#using script_3faf478d5b0850fe;
#using script_40eb62810357ba9b;
#using script_40f967ad5d18ea74;
#using script_44dc341d87a68571;
#using script_46777b16a6ea6667;
#using script_47851dbeea22fe66;
#using script_489b835a247c990e;
#using script_49adc60ba76a57c7;
#using script_4bf952f6ba31bb17;
#using script_4d748e58ce25b60c;
#using script_4d85e8de54b02198;
#using script_5133d88c555e460;
#using script_522aeb6ae906391e;
#using script_52608be2732b3c77;
#using script_5701633066d199f2;
#using script_57f7003580bb15e0;
#using script_59f07c660e6710a5;
#using script_5e8f7ecf981ad9a3;
#using script_5f20d3b434d24884;
#using script_6281e493de3ff80b;
#using script_6809bf766eba194a;
#using script_6dce1fe6a7dd35c7;
#using script_71971f45043d4dfe;
#using script_736b4607e813f2e5;
#using script_74a56359b7d02ab6;
#using script_761ab8de8f97d130;
#using script_774302f762d76254;
#using script_7857e1ad7dfdbc95;
#using script_79cafc73107dd980;
#using script_7a9e25472d14a1ff;
#using script_7b7ed6e4bc963a51;
#using script_bd2b8aaa388dcce;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace namespace_250e9486;

/*
	Name: init
	Namespace: namespace_250e9486
	Checksum: 0xA8F03224
	Offset: 0x7E0
	Size: 0x38C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("actor", "enable_on_radar", 1, 1, "int");
	clientfield::register("vehicle", "enable_on_radar", 1, 1, "int");
	level.callbackactordamage = &function_dab7edc;
	level.callbackactorkilled = &function_9b31d191;
	level.callbackvehicledamage = &function_c36e5cab;
	level.callbackvehiclekilled = &function_5800e038;
	level.doa.var_695258a5 = 0;
	level.doa.var_4eb7c3f0 = 0;
	namespace_81522b3c::init();
	namespace_df4fbf0::init();
	namespace_f6712ec9::init();
	namespace_be2ae534::init();
	namespace_2e61cc4b::init();
	namespace_514c8ebc::init();
	namespace_a204c0f4::init();
	namespace_a0fa2b5::init();
	namespace_d1abdcb5::init();
	namespace_58e19d6::init();
	namespace_6479037a::init();
	namespace_b5ca279a::init();
	namespace_2a445563::init();
	namespace_53a8fe5e::init();
	namespace_146875e::init();
	namespace_8c89a9e9::init();
	namespace_6e561646::init();
	namespace_7457b8d5::init();
	level.var_deb2145c = &function_52fd55a;
	registerbehaviorscriptfunctions();
	if(!isdefined(level.var_7d6449a0))
	{
		level.var_7d6449a0 = new class_c6c0e94();
		level.var_48894e85 = new class_c6c0e94();
		level.var_79a3ec93 = new class_c6c0e94();
		[[ level.var_7d6449a0 ]]->initialize("arenaThrottle", 4, float(function_60d95f53()) / 1000);
		[[ level.var_48894e85 ]]->initialize("wildThrottle", 6, float(function_60d95f53()) / 1000);
		[[ level.var_79a3ec93 ]]->initialize("dunegeonThrottle", 6, float(function_60d95f53()) / 1000);
	}
	/#
		level thread function_23f77d98();
	#/
}

/*
	Name: function_23f77d98
	Namespace: namespace_250e9486
	Checksum: 0xC57784A1
	Offset: 0xB78
	Size: 0x216
	Parameters: 0
	Flags: None
*/
function function_23f77d98()
{
	self notify("3eeeb5cb1b1b5d13");
	self endon("3eeeb5cb1b1b5d13");
	while(true)
	{
		allies = namespace_7f5aeb59::function_23e1f90f();
		zombies = getaiteamarray(#"axis");
		foreach(ally in allies)
		{
			ally.doa.var_ab338943 = 0;
		}
		foreach(zombie in zombies)
		{
			if(!is_true(zombie.basic))
			{
				continue;
			}
			foreach(ally in allies)
			{
				if(zombie.favoriteenemy === ally)
				{
					ally.doa.var_ab338943++;
					break;
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_250e9486
	Checksum: 0x68D483D
	Offset: 0xD98
	Size: 0xF84
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_33f06519));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_459fdfeaf87cae96", &function_33f06519);
	/#
		assert(isscriptfunctionptr(&function_dbce9550));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2aebaa8271a615b", &function_dbce9550);
	/#
		assert(isscriptfunctionptr(&function_b87b3fef));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_679244a65c4ac51f", &function_b87b3fef);
	/#
		assert(isscriptfunctionptr(&function_e90927b7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2e09996956de0a27", &function_e90927b7);
	/#
		assert(!isdefined(&function_9b6830c9) || isscriptfunctionptr(&function_9b6830c9));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_fbdc2cc4) || isscriptfunctionptr(&function_fbdc2cc4));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_1a0fd593ee4f4d13", &function_9b6830c9, undefined, &function_fbdc2cc4);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_73a2a53598a6f94c", undefined, undefined, undefined);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_3793e8ada1f18447", undefined, undefined, undefined);
	/#
		assert(!isdefined(&function_1f0241e) || isscriptfunctionptr(&function_1f0241e));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_2e49b8797978f93e", &function_1f0241e, undefined, undefined);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_16f749aefbd4ce23", undefined, undefined, undefined);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombieidleaction", undefined, undefined, undefined);
	/#
		assert(!isdefined(&zombietraverseaction) || isscriptfunctionptr(&zombietraverseaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&zombietraverseactionterminate) || isscriptfunctionptr(&zombietraverseactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"zombietraverseaction", &zombietraverseaction, undefined, &zombietraverseactionterminate);
	/#
		assert(isscriptfunctionptr(&function_abb6c18a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_70f5a4ae6dc526d3", &function_abb6c18a);
	/#
		assert(isscriptfunctionptr(&function_e5fc1f3c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_18eef53c3b7c9c68", &function_e5fc1f3c);
	/#
		assert(isscriptfunctionptr(&function_99ed5179));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5ceb7142be5709e8", &function_99ed5179);
	/#
		assert(isscriptfunctionptr(&function_50547dae));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6c4bbcf0db9f4832", &function_50547dae);
	/#
		assert(isscriptfunctionptr(&zombieshouldknockdown));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldknockdown", &zombieshouldknockdown);
	/#
		assert(isscriptfunctionptr(&zombieknockdownactionstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieknockdownactionstart", &zombieknockdownactionstart);
	/#
		assert(isscriptfunctionptr(&function_c8939973));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_a6273a84b4237ce", &function_c8939973);
	/#
		assert(isscriptfunctionptr(&zombiegetupactionterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombiegetupactionterminate", &zombiegetupactionterminate);
	/#
		assert(isscriptfunctionptr(&function_32353f6e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"zombieshouldstun", &function_32353f6e);
	/#
		assert(isscriptfunctionptr(&function_32353f6e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_ed5637600484f3c", &function_32353f6e);
	/#
		assert(!isdefined(&function_645230f8) || isscriptfunctionptr(&function_645230f8));
	#/
	/#
		assert(!isdefined(&function_83a9ca0f) || isscriptfunctionptr(&function_83a9ca0f));
	#/
	/#
		assert(!isdefined(&function_4bc5ddbb) || isscriptfunctionptr(&function_4bc5ddbb));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_38146c0a3e111cb3", &function_645230f8, &function_83a9ca0f, &function_4bc5ddbb);
	/#
		assert(isscriptfunctionptr(&stunstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6f551ce50701a441", &stunstart);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_83a9ca0f) || isscriptfunctionptr(&function_83a9ca0f));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_5ab8d15ff77f1b6f", undefined, &function_83a9ca0f, undefined);
	/#
		assert(isscriptfunctionptr(&function_de68bf47));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_e568b63ec039220", &function_de68bf47);
	/#
		assert(isscriptfunctionptr(&function_e2da0652));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2363b19a9d5f0aa8", &function_e2da0652);
}

/*
	Name: function_52fd55a
	Namespace: namespace_250e9486
	Checksum: 0x80F724D1
	Offset: 0x1D28
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_52fd55a()
{
}

/*
	Name: function_17d3b57
	Namespace: namespace_250e9486
	Checksum: 0xE73EF453
	Offset: 0x1D38
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function function_17d3b57()
{
	curcount = namespace_ec06fe4a::function_38de0ce8();
	if(isdefined(level.doa.var_39e3fa99) && namespace_4dae815d::function_59a9cf1d() == 0)
	{
		available = ([[ level.doa.var_39e3fa99 ]]->function_c892290a()) - curcount;
		return available;
	}
	if(namespace_4dae815d::function_59a9cf1d() == 5)
	{
		return 40 - curcount;
	}
	if(namespace_4dae815d::function_59a9cf1d() == 4)
	{
		return 40 - curcount;
	}
	/#
		assert(0);
	#/
	return 40 - curcount;
}

/*
	Name: function_60f6a9e
	Namespace: namespace_250e9486
	Checksum: 0xBA74E54F
	Offset: 0x1E38
	Size: 0xFA
	Parameters: 0
	Flags: Linked
*/
function function_60f6a9e()
{
	if(is_true(level.doa.var_1b8c7044))
	{
		return false;
	}
	curcount = namespace_ec06fe4a::function_38de0ce8();
	if(isdefined(level.doa.var_39e3fa99) && namespace_4dae815d::function_59a9cf1d() == 0)
	{
		if(curcount >= ([[ level.doa.var_39e3fa99 ]]->function_c892290a()))
		{
			return false;
		}
	}
	if(namespace_4dae815d::function_59a9cf1d() == 5)
	{
		if(curcount >= 40)
		{
			return false;
		}
	}
	else if(namespace_4dae815d::function_59a9cf1d() == 4)
	{
		if(curcount >= 40)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_252dff4d
	Namespace: namespace_250e9486
	Checksum: 0x4E07E3A8
	Offset: 0x1F40
	Size: 0x26C
	Parameters: 7
	Flags: Linked
*/
function function_252dff4d(name, aitype, var_d240d5de, var_41157a40, unlocklevel, var_c8ceaddf, chance)
{
	if(!isdefined(var_c8ceaddf))
	{
		var_c8ceaddf = undefined;
	}
	if(!isdefined(chance))
	{
		chance = 100;
	}
	if(!isdefined(level.doa.var_3a73503f))
	{
		level.doa.var_3a73503f = [];
	}
	/#
		assert(isdefined(aitype));
	#/
	struct = spawnstruct();
	struct.name = name;
	struct.type = aitype;
	struct.var_d240d5de = var_d240d5de;
	struct.var_41157a40 = var_41157a40;
	struct.var_c8ceaddf = var_c8ceaddf;
	struct.var_9f19fcb6 = chance;
	struct.unlocklevel = (isdefined(unlocklevel) ? unlocklevel : -1);
	struct.var_71e54e3a = [];
	if(aitype != -1 && aitype <= 29)
	{
		level.doa.var_695258a5 = level.doa.var_695258a5 | (1 << aitype);
		level.doa.var_4eb7c3f0++;
	}
	foreach(spawner in level.doa.var_3a73503f)
	{
		if(spawner.type == aitype && aitype != -1)
		{
			/#
				assert(0, "");
			#/
		}
	}
	level.doa.var_3a73503f[level.doa.var_3a73503f.size] = struct;
}

/*
	Name: function_d1bc3f11
	Namespace: namespace_250e9486
	Checksum: 0x26EAC477
	Offset: 0x21B8
	Size: 0x138
	Parameters: 2
	Flags: Linked
*/
function function_d1bc3f11(var_463f7b07, reset)
{
	if(!isdefined(reset))
	{
		reset = 0;
	}
	/#
		assert(var_463f7b07 >= 0, "");
	#/
	if(reset)
	{
		level.doa.var_329c97a3 = [];
	}
	foreach(entry in level.doa.var_3a73503f)
	{
		if(entry.unlocklevel == -1)
		{
			continue;
		}
		if(entry.unlocklevel <= var_463f7b07)
		{
			def = doa_enemy::function_251ee3bd(entry.name);
			[[ def ]]->function_7edd7727(6);
		}
	}
}

/*
	Name: function_2c6dd74c
	Namespace: namespace_250e9486
	Checksum: 0xD176C4E5
	Offset: 0x22F8
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_2c6dd74c(spawner)
{
	foreach(reg in level.doa.var_3a73503f)
	{
		if(reg.name === spawner.script_noteworthy)
		{
			return reg;
		}
	}
	return undefined;
}

/*
	Name: function_3dd94c25
	Namespace: namespace_250e9486
	Checksum: 0x3A697692
	Offset: 0x23A8
	Size: 0xA0
	Parameters: 1
	Flags: Linked
*/
function function_3dd94c25(name)
{
	foreach(reg in level.doa.var_3a73503f)
	{
		if(reg.name === name)
		{
			return reg;
		}
	}
	return undefined;
}

/*
	Name: function_fce39c7a
	Namespace: namespace_250e9486
	Checksum: 0xA26F52A3
	Offset: 0x2450
	Size: 0x20C
	Parameters: 0
	Flags: Linked
*/
function function_fce39c7a()
{
	self notify("15181d77001d2d59");
	self endon("15181d77001d2d59");
	self endon(#"death");
	self.var_968a296f = undefined;
	result = undefined;
	result = self waittill(#"bad_path");
	if(!isdefined(self.doa.var_baa2991d))
	{
		self.doa.var_baa2991d = 0;
	}
	self.doa.var_baa2991d++;
	self.var_968a296f = 1;
	nextpos = getclosestpointonnavmesh(result.position, 128, self getpathfindingradius());
	if(isdefined(nextpos))
	{
		namespace_1e25ad94::debugmsg((((((("Entity " + (isdefined(self.entnum) ? self.entnum : self getentitynumber())) + " got a bad path notification going to: ") + result.position) + ". Redirecting to: ") + nextpos) + " BP Count = ") + self.doa.var_baa2991d);
		self function_41354e51(nextpos, 1);
		self.var_72283e28 = gettime() + 10000;
		result = undefined;
		result = self waittilltimeout(10, #"goal");
		if(result._notify == "goal")
		{
			self.doa.var_baa2991d = 0;
			self.var_72283e28 = 0;
		}
	}
	self thread function_fce39c7a();
}

/*
	Name: function_472bf4
	Namespace: namespace_250e9486
	Checksum: 0x412707DD
	Offset: 0x2668
	Size: 0xE6
	Parameters: 0
	Flags: Linked
*/
function function_472bf4()
{
	/#
		if(!isactor(self))
		{
			return;
		}
		self endon(#"death");
		while(true)
		{
			level thread namespace_1e25ad94::debugline(self.origin, self.goalpos, 0.05, (self haspath() ? (0, 1, 0) : (1, 0, 0)));
			level thread namespace_1e25ad94::debugbox(self.goalpos, 0, 20, 20, 20, 0.05, (self isatgoal() ? (0, 1, 0) : (1, 0, 0)));
			waitframe(1);
		}
	#/
}

/*
	Name: function_d138afd9
	Namespace: namespace_250e9486
	Checksum: 0xCD728EDA
	Offset: 0x2758
	Size: 0x484
	Parameters: 0
	Flags: Linked
*/
function function_d138afd9()
{
	if(self.zombie_type === #"silverback")
	{
		return;
	}
	self endon(#"hash_717d9188a95b458f");
	self waittill(#"death");
	if(is_true(self.marked_for_death))
	{
		return;
	}
	spot = self.origin;
	roll = randomint(100);
	level doa_pickups::function_68442ee7(spot, 20, 128, 1);
	if(roll > 25)
	{
		level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_boots"), spot + (randomintrange(-40, 40), randomintrange(-40, 40), 0), undefined, undefined, 1);
	}
	if(roll > 35)
	{
		level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_boxing_glove"), spot + (randomintrange(-40, 40), randomintrange(-40, 40), 0), undefined, undefined, 1);
	}
	if(roll > 45)
	{
		level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_nuke"), spot + (randomintrange(-40, 40), randomintrange(-40, 40), 0), undefined, undefined, 1);
	}
	if(roll > 55)
	{
		level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_boost"), spot + (randomintrange(-40, 40), randomintrange(-40, 40), 0), undefined, undefined, 1);
	}
	if(roll > 65)
	{
		level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_gift_box"), spot + (randomintrange(-40, 40), randomintrange(-40, 40), 0), undefined, undefined, 1);
	}
	if(roll > 75)
	{
		level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_skeleton_key"), spot + (randomintrange(-40, 40), randomintrange(-40, 40), 0), undefined, undefined, 1);
	}
	if(roll > 85)
	{
		level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_umbrella"), spot + (randomintrange(-40, 40), randomintrange(-40, 40), 0), undefined, undefined, 1);
	}
	if(roll > 95)
	{
		level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_extra_life"), spot + (randomintrange(-40, 40), randomintrange(-40, 40), 0), undefined, undefined, 1);
	}
}

/*
	Name: function_db744d28
	Namespace: namespace_250e9486
	Checksum: 0x945B22D1
	Offset: 0x2BE8
	Size: 0xDA
	Parameters: 0
	Flags: Linked
*/
function function_db744d28()
{
	self thread function_d138afd9();
	self.boss = 1;
	self.var_2cdbba95 = 1;
	self.ignorevortices = 1;
	self.var_c7121c91 = 1;
	self.var_3505487 = 1;
	self.var_4dcf6637 = 1;
	self.var_b88e74c3 = 1;
	self.var_af545843 = 1;
	self.var_abe67a20 = 1;
	self.var_bbdaef90 = 1;
	self.var_d415ee14 = 1;
	self.var_47267079 = 1;
	self.var_2b989b2e = 1;
	self.var_9be3628d = array(0, 0, 0, 0);
}

/*
	Name: function_25b2c8a9
	Namespace: namespace_250e9486
	Checksum: 0x320578EB
	Offset: 0x2CD0
	Size: 0x54A
	Parameters: 3
	Flags: Linked
*/
function function_25b2c8a9(spawner, str_targetname, force_spawn)
{
	self function_166a9ab7();
	self clientfield::set("enable_on_radar", 1);
	self callback::function_d8abfc3d(#"hash_11aa32ad6d527054", &function_448dac71);
	self callback::function_d8abfc3d(#"on_ai_killed", &function_21ef174b);
	self thread function_fce39c7a();
	/#
		if(getdvarint(#"hash_207746eb90f92763", 0))
		{
			self thread namespace_1e25ad94::debugorigin(999, 20, (1, 0, 0));
		}
	#/
	self.doa = spawnstruct();
	self.doa.birthtime = gettime();
	self.doa.stunned = 0;
	self.doa.original_origin = self.origin;
	self.doa.var_ab338943 = 0;
	self.doa.thinkrate = 0.25;
	self.ignoreall = 0;
	self.ignoreme = 0;
	self.pacifist = 0;
	self.goalradius = 20;
	self.predict_time = 0.25;
	self.engagementdistance = 2400;
	self.var_a84a3d40 = sqr(self.engagementdistance);
	self.var_f578c3a2 = sqr(36);
	self.var_42abd8e = 1;
	self.var_c0bd8c06 = 0;
	self.var_f6b9e96d = 0;
	self.missinglegs = 0;
	self.var_f9d01c76 = 0;
	self.var_4bd563dd = 0;
	self.var_f95bc76f = 0;
	self.meleedistsq = 1764;
	self.updatesight = 0;
	self.doa.var_37d6fd5 = 0;
	self.var_1b2af7dc = 1;
	self.entnum = self getentitynumber();
	self.var_f7f65924 = (is_true(self.var_d55f22cb) ? 5 : 10);
	self.zombie_move_speed = (isdefined(level.doa.var_13e8f9c9) ? level.doa.var_13e8f9c9 : "walk");
	self.var_72283e28 = 0;
	self.health = level.doa.zombie_health;
	self.maxhealth = level.doa.zombie_health;
	self.lastposition = self.origin;
	self.lastknowntime = 0;
	self.var_2a85c480 = 0;
	self.startposition = self.origin;
	self.zombie_type = (isdefined(self.spawndef) ? [[ self.spawndef ]]->getname() : "unknown AI");
	if(isactor(self))
	{
		self pathmode("move allowed");
		self collidewithactors(1);
		self thread updatespeed();
	}
	self setavoidancemask("avoid none");
	self thread function_9ee1ee56();
	self thread function_60c093e1();
	self thread function_fc77d638();
	if(getdvarint(#"hash_44eeefdc002143f7", 0))
	{
		self thread function_472bf4();
	}
	gamestate = namespace_4dae815d::function_59a9cf1d();
	if(gamestate == 5)
	{
		self.var_9b6df834 = level.var_79a3ec93;
	}
	else
	{
		if(gamestate == 4)
		{
			self.var_9b6df834 = level.var_48894e85;
		}
		else if(gamestate == 0)
		{
			self.var_9b6df834 = level.var_7d6449a0;
		}
	}
}

/*
	Name: function_fc77d638
	Namespace: namespace_250e9486
	Checksum: 0xA19A9C2B
	Offset: 0x3228
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function function_fc77d638()
{
	self endon(#"death");
	self disableaimassist();
	waitframe(1);
	while(is_true(self.var_1f2d0447))
	{
		wait(1);
	}
	self enableaimassist();
}

/*
	Name: function_60c093e1
	Namespace: namespace_250e9486
	Checksum: 0x4E09414C
	Offset: 0x32A0
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_60c093e1()
{
	self endon(#"death", #"hash_2ca65c35156a24dc");
	var_8d747a1 = 1;
	while(var_8d747a1)
	{
		var_8d747a1 = !(level flag::get("doa_players_all_dead") || level flag::get("doa_game_is_over"));
		wait(5);
	}
	self thread namespace_ec06fe4a::function_570729f0(0.1);
}

/*
	Name: function_166a9ab7
	Namespace: namespace_250e9486
	Checksum: 0x321C364
	Offset: 0x3358
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_166a9ab7()
{
	self.__blackboard = undefined;
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &function_deb871fd;
	self.___archetypeonbehavecallback = &function_c61d79a9;
}

/*
	Name: function_c61d79a9
	Namespace: namespace_250e9486
	Checksum: 0xC8F0768E
	Offset: 0x33D0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c61d79a9(entity)
{
}

/*
	Name: function_deb871fd
	Namespace: namespace_250e9486
	Checksum: 0xA58C71D0
	Offset: 0x33E8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_deb871fd(entity)
{
	self.__blackboard = undefined;
	self function_166a9ab7();
}

/*
	Name: function_c1f37cab
	Namespace: namespace_250e9486
	Checksum: 0x71FB09F6
	Offset: 0x3420
	Size: 0x30C
	Parameters: 0
	Flags: Linked
*/
function function_c1f37cab()
{
	if(!isdefined(self))
	{
		return;
	}
	if(gettime() < self.var_f9d01c76)
	{
		return;
	}
	if(is_true(self.boss))
	{
		return;
	}
	if(is_true(self.var_76cb41b3))
	{
		return;
	}
	if(isdefined(self.var_28313669))
	{
		return;
	}
	if(isdefined(self.var_d1fac34a) && isactor(self) && self isatgoal())
	{
		return;
	}
	self.var_f9d01c76 = gettime() + 1000;
	dist = distancesquared(self.lastposition, self.origin);
	self.lastposition = self.origin;
	if(dist < sqr(12))
	{
		self.var_4bd563dd++;
	}
	else
	{
		self.var_4bd563dd = 0;
	}
	if(isdefined(self.var_c8b974fe))
	{
		distsq = distancesquared(self.origin, self.var_c8b974fe);
		if(distsq > self.var_32d07c96)
		{
			distsq = distancesquared(self.origin, self.goalpos);
			if(distsq < sqr(512))
			{
				self.var_4bd563dd++;
			}
			else
			{
				self.var_4bd563dd = self.var_f7f65924;
			}
		}
		if(gettime() - self.doa.birthtime > 30000)
		{
			self.var_4bd563dd = self.var_f7f65924;
		}
	}
	if(self.origin[2] < -2300)
	{
		self.var_4bd563dd = self.var_f7f65924;
	}
	if(self.var_4bd563dd >= self.var_f7f65924 && !is_true(self.var_227e7c79))
	{
		self.var_28313669 = gettime();
		self doa_enemy::function_c89f6305();
		if(isdefined(self.var_5603780))
		{
			[[self.var_5603780]]();
			return;
		}
		/#
			assert(!is_true(self.boss));
		#/
		self.var_c0bd8c06 = 1;
		self thread namespace_ec06fe4a::deletemeonnotify(#"hash_12b1eb419a23e3bd");
		self thread namespace_ec06fe4a::function_570729f0(5);
	}
}

/*
	Name: function_8f172270
	Namespace: namespace_250e9486
	Checksum: 0xB5D82E5F
	Offset: 0x3738
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_8f172270(target)
{
	if(is_true(self.var_1f2d0447))
	{
		return;
	}
	if(!isvehicle(self))
	{
		function_c1f37cab();
	}
	self.lastknownenemypos = self function_bd5a9fa6();
	if(isdefined(self.lastknownenemypos))
	{
		self function_41354e51(self.lastknownenemypos);
	}
}

/*
	Name: function_9ee1ee56
	Namespace: namespace_250e9486
	Checksum: 0x9BF97D0A
	Offset: 0x37E0
	Size: 0x2E8
	Parameters: 0
	Flags: Linked
*/
function function_9ee1ee56()
{
	self endon(#"death");
	if(!isdefined(level.doa.var_6f3d327) && level.doa.world_state == 0)
	{
		self.arena = level.doa.var_39e3fa99;
	}
	if(!isdefined(self.arena))
	{
		return;
	}
	center = [[ self.arena ]]->function_ffcf1d1();
	minz = center[2] - 1000;
	while(true)
	{
		if(self.arena !== level.doa.var_39e3fa99)
		{
			namespace_1e25ad94::debugmsg(((("Enemy " + (isdefined(self.aitype) ? self.aitype : self.classname)) + " at (") + self.origin) + ") was killed for not being in the active arena!", 1);
			self thread namespace_ec06fe4a::function_570729f0(0.5);
			return;
		}
		if(self.origin[2] < minz)
		{
			type = self.aitype;
			if(!isdefined(type))
			{
				if(isvehicle(self))
				{
					type = self.spawner.script_noteworthy;
				}
			}
			namespace_1e25ad94::debugmsg(((("Enemy " + type) + " at (") + self.origin) + ") was killed for being beneath the minZ value!", 1);
			self thread namespace_ec06fe4a::function_570729f0(0.5);
			return;
		}
		distsq = distancesquared(center, self.origin);
		if(distsq > sqr(2048))
		{
			namespace_1e25ad94::debugmsg((((((("Enemy " + (isdefined(self.aitype) ? self.aitype : self.classname)) + " at (") + self.origin) + ") was killed for being to far from center (") + center) + ") Dist:") + distsq, 1);
			self thread namespace_ec06fe4a::function_570729f0(0.5);
			return;
		}
		wait(1);
	}
}

/*
	Name: function_89c95270
	Namespace: namespace_250e9486
	Checksum: 0xBC33F669
	Offset: 0x3AD0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_89c95270()
{
	self endon(#"death");
	result = function_e00f51af(self);
	self function_4b49bf0d();
	if(result === 0)
	{
		function_8f172270(self.enemy);
	}
}

/*
	Name: function_8971bbb7
	Namespace: namespace_250e9486
	Checksum: 0x3CD95FA2
	Offset: 0x3B50
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_8971bbb7()
{
	self endon(#"death");
	waitframe(1);
	while(true)
	{
		if(self function_cf2c9af())
		{
			self function_89c95270();
		}
		wait(self.doa.thinkrate);
	}
}

/*
	Name: function_1bbf4511
	Namespace: namespace_250e9486
	Checksum: 0x6CF085B2
	Offset: 0x3BC0
	Size: 0x426
	Parameters: 3
	Flags: Linked
*/
function function_1bbf4511(origin, var_f1479aab, context)
{
	/#
		assert(isdefined(var_f1479aab));
	#/
	self endon(#"death");
	if(!is_true(self.boss) && isdefined(self.var_9b6df834))
	{
		[[ self.var_9b6df834 ]]->waitinqueue(self);
		if(context == 0)
		{
			var_f1479aab = self function_bd5a9fa6();
		}
	}
	if(context == 1 || context == 2)
	{
		adjustedorigin = var_f1479aab;
	}
	else if(context == 0)
	{
		adjustedorigin = var_f1479aab;
		if(isdefined(self.enemy))
		{
			if(is_true(self.var_968a296f) || self.var_f95bc76f === 10)
			{
				radius = self getpathfindingradius();
				adjustedorigin = getclosestpointonnavmesh(var_f1479aab, self.goalradius, radius);
				if(!isdefined(adjustedorigin))
				{
					adjustedorigin = self.enemy.origin;
				}
			}
		}
	}
	var_f1479aab = adjustedorigin;
	/#
		assert(isdefined(var_f1479aab));
	#/
	self setgoal(var_f1479aab);
	distsq = distancesquared(self.origin, var_f1479aab);
	frac = math::clamp(distsq / sqr(800), 0, 1);
	if(isdefined(self.zombie_move_speed))
	{
		if(self.zombie_move_speed == "walk" || is_true(self.missinglegs))
		{
			frac = frac + 0.2;
		}
		if(self.zombie_move_speed == "sprint")
		{
			frac = frac - 0.2;
		}
		if(frac < 0.1)
		{
			frac = 0.1;
		}
	}
	var_d1445ef9 = int(frac * 800);
	if(var_d1445ef9 < 50)
	{
		var_d1445ef9 = 50;
	}
	if(isdefined(self.doa.var_492aef80) && var_d1445ef9 > self.doa.var_492aef80)
	{
		var_d1445ef9 = self.doa.var_492aef80;
	}
	self.var_72283e28 = gettime() + var_d1445ef9;
	if(!self haspath() && (!isactor(self) || !self isatgoal()))
	{
		self.var_f95bc76f = math::clamp(self.var_f95bc76f + 1, 0, 10);
		self.var_72283e28 = self.var_72283e28 + (randomintrange(200 * self.var_f95bc76f, 500 * self.var_f95bc76f));
	}
	else
	{
		self.var_f95bc76f = 0;
	}
}

/*
	Name: function_41354e51
	Namespace: namespace_250e9486
	Checksum: 0x856B97B
	Offset: 0x3FF0
	Size: 0x34C
	Parameters: 3
	Flags: Linked
*/
function function_41354e51(origin, force, context)
{
	if(!isdefined(force))
	{
		force = 0;
	}
	if(!isdefined(context))
	{
		context = 0;
	}
	if(!isdefined(origin))
	{
		return;
	}
	distsq = distancesquared(origin, self.origin);
	if(distsq > sqr(2500))
	{
		if(!is_true(self.boss))
		{
			level thread namespace_1e25ad94::debugmsg((("Killing Entity: " + self getentitynumber()) + " for trying to path to target distance away: ") + int(distance(self.origin, origin)) + " units");
			self thread namespace_ec06fe4a::function_570729f0(1);
		}
		return;
	}
	/#
		if(isdefined(self.spawndef))
		{
			distsq = distancesquared(origin, self.spawndef.var_edee94ca.origin);
			/#
				assert(distsq > sqr(128), "");
			#/
			if(distsq < sqr(128))
			{
				origin = self.origin;
			}
		}
	#/
	if(is_true(self.boss) && !self haspath())
	{
		force = 1;
	}
	if(force || gettime() >= self.var_72283e28)
	{
		var_6acf79ac = 1;
	}
	else
	{
		var_6acf79ac = 0;
	}
	if(!var_6acf79ac)
	{
		distsq = distancesquared(origin, self.goalpos);
		mydistsq = distancesquared(self.origin, self.goalpos);
		scale = max(1, mydistsq / sqr(256));
		var_2773df6d = int(self.var_f578c3a2 * scale);
		if(distsq > var_2773df6d)
		{
			self.var_72283e28 = self.var_72283e28 - 150;
		}
	}
	else
	{
		self function_1bbf4511(origin, self haspath(), context);
	}
}

/*
	Name: function_622f5b91
	Namespace: namespace_250e9486
	Checksum: 0x350E7C01
	Offset: 0x4348
	Size: 0x32A
	Parameters: 1
	Flags: Linked
*/
function function_622f5b91(var_77cbeb28)
{
	i = 8;
	var_a8bd6ee9 = sqr(128);
	foreach(ally in var_77cbeb28)
	{
		ally.rank = i * 50;
		if(self.favoriteenemy === ally)
		{
			ally.rank = ally.rank + 100;
		}
		if(self.lastattacker === ally)
		{
			ally.rank = ally.rank + 40;
		}
		distsq = distancesquared(self.origin, ally.origin);
		if(distsq < var_a8bd6ee9)
		{
			amount = 300 - int(mapfloat(0, var_a8bd6ee9, 0, 300, distsq));
			ally.rank = ally.rank + amount;
		}
		i--;
	}
	myteam = getaiteamarray(self.team);
	foreach(guy in myteam)
	{
		if(!is_true(guy.basic) || guy == self)
		{
			continue;
		}
		foreach(ally in var_77cbeb28)
		{
			if(guy.favoriteenemy === ally)
			{
				ally.rank = ally.rank - 20;
			}
		}
	}
	var_86411b18 = array::quick_sort(var_77cbeb28, &function_8f915b47);
	return var_86411b18;
}

/*
	Name: function_8f915b47
	Namespace: namespace_250e9486
	Checksum: 0x5906C4E1
	Offset: 0x4680
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_8f915b47(a, b)
{
	return a.rank > b.rank;
}

/*
	Name: function_4b49bf0d
	Namespace: namespace_250e9486
	Checksum: 0x94109E93
	Offset: 0x46B0
	Size: 0x63E
	Parameters: 0
	Flags: Linked
*/
function function_4b49bf0d()
{
	if(self.birthtime === gettime())
	{
		return undefined;
	}
	if(is_true(self.ignoreall))
	{
		self clearenemy();
		self.favoriteenemy = undefined;
		return undefined;
	}
	if(isdefined(self.favoriteenemy) && isalive(self.favoriteenemy))
	{
		distsq = distancesquared(self.origin, self.favoriteenemy.origin);
		if(distsq > self.var_a84a3d40)
		{
			self.favoriteenemy = undefined;
		}
	}
	time = gettime();
	if(isdefined(self.favoriteenemy) && isalive(self.favoriteenemy))
	{
		if(is_true(self.var_4f1b8d2b) || time < self.doa.var_37d6fd5)
		{
			return self.favoriteenemy;
		}
	}
	if(self.team != #"allies")
	{
		time = gettime();
		validtargets = arraycombine(getaiteamarray("allies"), namespace_7f5aeb59::function_518c4c78(), 0, 0);
		targets = [];
		foreach(target in validtargets)
		{
			distsq = distancesquared(self.origin, target.origin);
			if(distsq >= sqr(2500))
			{
				continue;
			}
			if(!isdefined(level.doa.var_39e3fa99) && distsq >= self.var_a84a3d40)
			{
				continue;
			}
			if(isdefined(self.var_d04a8ee) && (abs(target.origin[2] - self.origin[2])) >= self.var_d04a8ee)
			{
				continue;
			}
			targets[targets.size] = target;
		}
		validtargets = targets;
		if(!isdefined(level.doa.var_39e3fa99) && isdefined(self.engagementdistance))
		{
			sorted = arraysortclosest(validtargets, self.origin, 8, 0, self.engagementdistance);
		}
		else
		{
			sorted = arraysortclosest(validtargets, self.origin, 8);
		}
		if(sorted.size > 1 && level.doa.world_state == 0)
		{
			sorted = function_622f5b91(sorted);
		}
	}
	else
	{
		sorted = arraysortclosest(getaiteamarray("axis"), self.origin);
	}
	foreach(target in sorted)
	{
		if(is_true(target.ignoreme))
		{
			continue;
		}
		if(target.birthtime == time || target.doa.birthtime === time)
		{
			continue;
		}
		if(is_true(self.basic))
		{
			if(isdefined(target.last_valid_position))
			{
				origin = target.last_valid_position;
			}
			else
			{
				origin = target.origin;
			}
			canpath = self findpath(self.origin, origin, 1, 0);
			if(!canpath)
			{
				continue;
			}
		}
		closest = target;
		break;
	}
	var_f65b257b = 99999999;
	if(isdefined(closest))
	{
		var_f65b257b = distancesquared(closest.origin, self.origin);
	}
	if(isdefined(closest))
	{
		if(closest !== self.favoriteenemy)
		{
			self setentitytarget(closest);
			self.favoriteenemy = closest;
			self.hasseenfavoriteenemy = 0;
		}
		self.doa.var_37d6fd5 = time + randomintrange(2000, 4000);
	}
	else
	{
		self clearenemy();
		self.favoriteenemy = undefined;
	}
	return self.favoriteenemy;
}

/*
	Name: function_e00f51af
	Namespace: namespace_250e9486
	Checksum: 0x3BBE41B2
	Offset: 0x4CF8
	Size: 0x220
	Parameters: 1
	Flags: Linked
*/
function function_e00f51af(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.doa))
	{
		return 2;
	}
	if(level flag::get("doa_game_is_over"))
	{
		behaviortreeentity function_41354e51(behaviortreeentity.origin, undefined, 2);
		return 2;
	}
	if(isdefined(behaviortreeentity.var_860a34b9))
	{
		behaviortreeentity function_41354e51(behaviortreeentity.var_860a34b9, undefined, 1);
		return 1;
	}
	if(isdefined(behaviortreeentity.doa) && behaviortreeentity.doa.stunned == 1)
	{
		self function_41354e51(self.doa.var_db417b61, undefined, self.doa.var_33b29baf);
		return self.doa.var_33b29baf;
	}
	if(!is_true(behaviortreeentity.var_1c8b76d3))
	{
		poi = namespace_ec06fe4a::getclosestpoi(behaviortreeentity.origin);
		if(isdefined(poi))
		{
			behaviortreeentity.doa.poi = poi;
			origin = poi.origin;
			behaviortreeentity function_41354e51(origin, undefined, 1);
			return 1;
		}
	}
	if(isdefined(behaviortreeentity.enemy) && (behaviortreeentity.enemy.team == behaviortreeentity.team || is_true(behaviortreeentity.enemy.laststand)))
	{
		behaviortreeentity clearenemy();
		behaviortreeentity.favoriteenemy = undefined;
	}
	return 0;
}

/*
	Name: function_bb0817aa
	Namespace: namespace_250e9486
	Checksum: 0x8FC70B91
	Offset: 0x4F20
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function function_bb0817aa(curspeed)
{
	if(curspeed == "walk")
	{
		return "run";
	}
	if(curspeed == "run")
	{
		return "sprint";
	}
	return "sprint";
}

/*
	Name: function_6caf68
	Namespace: namespace_250e9486
	Checksum: 0x99C93F54
	Offset: 0x4F70
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function function_6caf68(curspeed)
{
	if(curspeed == "run")
	{
		return "walk";
	}
	if(curspeed == "sprint")
	{
		return "run";
	}
	if(curspeed == "super_sprint")
	{
		return "sprint";
	}
	return "walk";
}

/*
	Name: function_16aba2a6
	Namespace: namespace_250e9486
	Checksum: 0xEBB5EB72
	Offset: 0x4FE0
	Size: 0x21A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_16aba2a6()
{
	self endon(#"death");
	self endon(#"hash_f7f7d6234100d72");
	while(level flag::get("doa_round_spawning"))
	{
		wait(1);
	}
	while(true)
	{
		wait(randomintrange(1, 4));
		if(self.team != #"axis")
		{
			continue;
		}
		speed = self.zombie_move_speed;
		if(is_true(self.var_bb68380c))
		{
			if(level flag::get("doa_round_spawning") == 0)
			{
				left = namespace_ec06fe4a::function_fb4eb048("axis");
				if(left <= 6)
				{
					if(is_true(self.missinglegs) && !is_true(self.var_c3ce559a))
					{
						self thread namespace_ec06fe4a::function_570729f0(randomfloatrange(1, 5));
					}
					self.zombie_move_speed = function_bb0817aa(self.zombie_move_speed);
				}
			}
		}
		if(!is_true(self.var_bb68380c) && isdefined(self.var_4bd563dd) && self.var_4bd563dd > 2)
		{
			self.zombie_move_speed = function_6caf68(self.zombie_move_speed);
		}
		if(speed != self.zombie_move_speed)
		{
			self notify(#"speed_change");
		}
	}
}

/*
	Name: updatespeed
	Namespace: namespace_250e9486
	Checksum: 0xE9A7DCA4
	Offset: 0x5208
	Size: 0x1A6
	Parameters: 0
	Flags: Linked
*/
function updatespeed()
{
	self thread function_16aba2a6();
	if(isdefined(level.doa.var_13e8f9c9))
	{
		self.zombie_move_speed = level.doa.var_13e8f9c9;
		return;
	}
	if(is_true(level.doa.world_state == 4))
	{
		self.sprintonly = 1;
	}
	if(isdefined(self.crawlonly))
	{
		self.zombie_move_speed = "crawl";
		return;
	}
	if(isdefined(self.walkonly))
	{
		self.zombie_move_speed = "walk";
		return;
	}
	if(isdefined(self.runonly))
	{
		self.zombie_move_speed = "run";
		return;
	}
	if(isdefined(self.sprintonly))
	{
		self.zombie_move_speed = "sprint";
		return;
	}
	if(level.doa.roundnumber == 1)
	{
		self.zombie_move_speed = "walk";
	}
	else
	{
		rand = randomintrange(level.doa.var_f4cf4e3 - 24, level.doa.var_f4cf4e3 + 24);
		if(rand <= 60)
		{
			self.zombie_move_speed = "run";
		}
		else
		{
			self.zombie_move_speed = "sprint";
		}
	}
}

/*
	Name: function_bd5a9fa6
	Namespace: namespace_250e9486
	Checksum: 0x5551C175
	Offset: 0x53B8
	Size: 0x162
	Parameters: 0
	Flags: Linked
*/
function function_bd5a9fa6()
{
	if(isdefined(self.enemy) && isdefined(self.enemy.birthtime) && gettime() > self.enemy.birthtime)
	{
		if(isdefined(self.enemy.doa) && isdefined(self.enemy.doa.vehicle))
		{
			if(isdefined(self.enemy.doa.var_baad518e))
			{
				return self.enemy.doa.var_baad518e;
			}
			return self.enemy.doa.vehicle.origin;
		}
		if(isdefined(self.enemy.last_valid_position))
		{
			return self.enemy.last_valid_position;
		}
		self.lastknowntime = gettime();
		return self.enemy.origin;
	}
	if(self.lastknowntime + 8000 < gettime())
	{
		self.lastknownenemypos = undefined;
	}
	if(isdefined(self.lastknownenemypos))
	{
		return self.lastknownenemypos;
	}
	if(namespace_4dae815d::function_59a9cf1d() == 0)
	{
		return self.origin;
	}
	return self.startposition;
}

/*
	Name: getyawtoenemy
	Namespace: namespace_250e9486
	Checksum: 0xB764D25F
	Offset: 0x5528
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function getyawtoenemy()
{
	pos = undefined;
	if(isdefined(self.enemy))
	{
		pos = self.enemy.origin;
	}
	else
	{
		forward = anglestoforward(self.angles);
		forward = vectorscale(forward, 150);
		pos = self.origin + forward;
	}
	yaw = self.angles[1] - getyaw(pos);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: getyaw
	Namespace: namespace_250e9486
	Checksum: 0xC01AE878
	Offset: 0x55F0
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function getyaw(org)
{
	angles = vectortoangles(org - self.origin);
	return angles[1];
}

/*
	Name: function_33f06519
	Namespace: namespace_250e9486
	Checksum: 0x45155FBA
	Offset: 0x5638
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_33f06519(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.enemy))
	{
		return false;
	}
	if(is_true(behaviortreeentity.enemy.ignoreme))
	{
		return false;
	}
	if(is_true(behaviortreeentity.ignoreall))
	{
		return false;
	}
	if(!isdefined(behaviortreeentity.meleedistsq))
	{
		return false;
	}
	targetorigin = behaviortreeentity.enemy.origin;
	if(distance2dsquared(behaviortreeentity.origin, targetorigin) > behaviortreeentity.meleedistsq)
	{
		return false;
	}
	yaw = abs(getyawtoenemy());
	if(yaw > 45)
	{
		behaviortreeentity orientmode("face point", targetorigin);
		return false;
	}
	return true;
}

/*
	Name: function_b87b3fef
	Namespace: namespace_250e9486
	Checksum: 0xEC5AE70F
	Offset: 0x5768
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_b87b3fef(behaviortreeentity)
{
	if(is_true(behaviortreeentity.tesla_death))
	{
		return true;
	}
	return false;
}

/*
	Name: function_21ef174b
	Namespace: namespace_250e9486
	Checksum: 0x7403266B
	Offset: 0x57A0
	Size: 0x2EC
	Parameters: 1
	Flags: Linked
*/
function function_21ef174b(s_params)
{
	self.var_cd8354e0 = undefined;
	if(!is_true(self.var_63f6a059))
	{
		roll = randomint(200);
		if(roll == 0)
		{
			doa_pickups::function_68442ee7(self.origin, 1, 12, 1, 1);
		}
	}
	level.doa.var_afae28e0++;
	attacker = s_params.eattacker;
	if(isdefined(attacker) && isdefined(attacker.owner))
	{
		attacker = attacker.owner;
	}
	if(isdefined(attacker))
	{
		if(!is_true(self.var_d55f22cb) && isplayer(attacker))
		{
			attacker namespace_eccff4fb::enemykill(self.var_22b748b);
		}
		if(!isdefined(self.var_22b748b) || self.var_22b748b == -1)
		{
			return;
		}
		if(isplayer(attacker) && isdefined(attacker.doa.var_9c66788e))
		{
			attacker [[attacker.doa.var_9c66788e]](self.var_22b748b);
		}
		if(is_true(self.boss))
		{
			foreach(player in getplayers())
			{
				if(isbot(player))
				{
					continue;
				}
				if(player === attacker)
				{
					continue;
				}
				entnum = player getentitynumber();
				if(entnum >= self.var_9be3628d.size)
				{
					continue;
				}
				if(self.var_9be3628d[entnum] > 0 && isdefined(player.doa.var_9c66788e))
				{
					player [[player.doa.var_9c66788e]](self.var_22b748b);
				}
			}
		}
	}
}

/*
	Name: function_448dac71
	Namespace: namespace_250e9486
	Checksum: 0x3FB14010
	Offset: 0x5A98
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function function_448dac71()
{
	self.var_4bd563dd = 0;
}

/*
	Name: function_9b6830c9
	Namespace: namespace_250e9486
	Checksum: 0x278BE6E7
	Offset: 0x5AB0
	Size: 0x50
	Parameters: 2
	Flags: Linked
*/
function function_9b6830c9(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity pathmode("dont move");
	return 5;
}

/*
	Name: function_fbdc2cc4
	Namespace: namespace_250e9486
	Checksum: 0xE9754365
	Offset: 0x5B08
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function function_fbdc2cc4(entity, asmstatename)
{
	asmstatename pathmode("move allowed");
	return 4;
}

/*
	Name: function_1f0241e
	Namespace: namespace_250e9486
	Checksum: 0x910F9231
	Offset: 0x5B48
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function function_1f0241e(behaviortreeentity, asmstatename)
{
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: function_6aac668f
	Namespace: namespace_250e9486
	Checksum: 0xB19867B9
	Offset: 0x5B80
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function function_6aac668f()
{
	if(is_true(self.var_e5ad72a0) || is_true(self.var_1f2d0447))
	{
		return true;
	}
	return false;
}

/*
	Name: function_cf2c9af
	Namespace: namespace_250e9486
	Checksum: 0xBB9EA8D4
	Offset: 0x5BC8
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function function_cf2c9af()
{
	if(is_true(self.var_834ad023))
	{
		return false;
	}
	if(self function_6aac668f())
	{
		return false;
	}
	return true;
}

/*
	Name: stunstart
	Namespace: namespace_250e9486
	Checksum: 0x4C710DF4
	Offset: 0x5C10
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function stunstart(behaviortreeentity)
{
	behaviortreeentity pathmode("dont move", 1);
	callback::callback(#"hash_1eda827ff5e6895b");
}

/*
	Name: function_de68bf47
	Namespace: namespace_250e9486
	Checksum: 0xD5B5C1E7
	Offset: 0x5C68
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_de68bf47(behaviortreeentity)
{
	behaviortreeentity pathmode("move allowed");
	callback::callback(#"hash_210adcf09e99fba1");
}

/*
	Name: function_645230f8
	Namespace: namespace_250e9486
	Checksum: 0x2A453E61
	Offset: 0x5CC0
	Size: 0x48
	Parameters: 2
	Flags: Linked
*/
function function_645230f8(behaviortreeentity, asmstatename)
{
	stunstart(behaviortreeentity);
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: function_83a9ca0f
	Namespace: namespace_250e9486
	Checksum: 0xBDBA3328
	Offset: 0x5D10
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function function_83a9ca0f(behaviortreeentity, asmstatename)
{
	if(asmstatename ai::is_stunned())
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_4bc5ddbb
	Namespace: namespace_250e9486
	Checksum: 0x5BF29E4F
	Offset: 0x5D50
	Size: 0x30
	Parameters: 2
	Flags: Linked
*/
function function_4bc5ddbb(behaviortreeentity, asmstatename)
{
	function_de68bf47(asmstatename);
	return 4;
}

/*
	Name: function_dbce9550
	Namespace: namespace_250e9486
	Checksum: 0x5985C28A
	Offset: 0x5D88
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_dbce9550(behaviortreeentity)
{
	if(self function_6aac668f())
	{
		return 0;
	}
	if(self isatgoal())
	{
		return 0;
	}
	return behaviortreeentity.allowoffnavmesh || behaviortreeentity haspath();
}

/*
	Name: function_e90927b7
	Namespace: namespace_250e9486
	Checksum: 0x36FC361E
	Offset: 0x5DF8
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e90927b7(entity)
{
	return entity.var_85c3882d === 1;
}

/*
	Name: function_32353f6e
	Namespace: namespace_250e9486
	Checksum: 0xB69A9A76
	Offset: 0x5E20
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_32353f6e(entity)
{
	return entity ai::is_stunned() && function_5c82fd66(entity);
}

/*
	Name: function_5c82fd66
	Namespace: namespace_250e9486
	Checksum: 0xCDA81273
	Offset: 0x5E68
	Size: 0x10
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5c82fd66(entity)
{
	return true;
}

/*
	Name: zombietraverseaction
	Namespace: namespace_250e9486
	Checksum: 0xC6383B62
	Offset: 0x5E80
	Size: 0x88
	Parameters: 2
	Flags: Linked
*/
function zombietraverseaction(behaviortreeentity, asmstatename)
{
	aiutility::traverseactionstart(behaviortreeentity, asmstatename);
	behaviortreeentity.var_9ed3cc11 = behaviortreeentity function_e827fc0e();
	behaviortreeentity pushplayer(1);
	behaviortreeentity callback::callback(#"hash_1518febf00439d5");
	return 5;
}

/*
	Name: zombietraverseactionterminate
	Namespace: namespace_250e9486
	Checksum: 0xE15F16FF
	Offset: 0x5F10
	Size: 0xF0
	Parameters: 2
	Flags: Linked
*/
function zombietraverseactionterminate(behaviortreeentity, asmstatename)
{
	aiutility::wpn_debug_bot_joinleave(behaviortreeentity, asmstatename);
	if(behaviortreeentity asmgetstatus() == "asm_status_complete")
	{
		if(!is_true(behaviortreeentity.missinglegs))
		{
			behaviortreeentity collidewithactors(0);
			behaviortreeentity.enablepushtime = gettime() + 1000;
		}
		if(isdefined(behaviortreeentity.var_9ed3cc11))
		{
			behaviortreeentity pushplayer(behaviortreeentity.var_9ed3cc11);
			behaviortreeentity.var_9ed3cc11 = undefined;
		}
	}
	behaviortreeentity callback::callback(#"hash_34b65342cbfdadac");
	return 4;
}

/*
	Name: function_abb6c18a
	Namespace: namespace_250e9486
	Checksum: 0x7D4691E2
	Offset: 0x6008
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_abb6c18a(entity)
{
	if(!is_true(entity.var_e5ad72a0))
	{
		if(isdefined(entity.var_d1bf288))
		{
			if(!isdefined(entity.var_9bf0b279))
			{
				entity.var_9bf0b279 = gettime() + entity.var_d1bf288;
			}
		}
		if(isdefined(entity.var_1038c5e0))
		{
			entity namespace_83eb6304::function_3ecfde67(entity.var_1038c5e0);
		}
		entity.var_c0bd8c06 = undefined;
		entity.var_e5ad72a0 = 1;
		entity pathmode("dont move", 1);
	}
	return 4;
}

/*
	Name: function_e5fc1f3c
	Namespace: namespace_250e9486
	Checksum: 0x61007C8
	Offset: 0x60D0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_e5fc1f3c(entity)
{
	if(isdefined(entity.var_9bf0b279))
	{
		if(gettime() < entity.var_9bf0b279)
		{
			return 5;
		}
	}
	return 4;
}

/*
	Name: function_99ed5179
	Namespace: namespace_250e9486
	Checksum: 0x82CC96C1
	Offset: 0x6110
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function function_99ed5179(entity)
{
	if(isdefined(entity.var_df416181))
	{
		entity namespace_83eb6304::function_3ecfde67(entity.var_df416181);
	}
	entity ghost();
	entity notsolid();
	entity notify(#"hash_12b1eb419a23e3bd");
	entity.var_e5ad72a0 = undefined;
	return 4;
}

/*
	Name: function_50547dae
	Namespace: namespace_250e9486
	Checksum: 0xB4776543
	Offset: 0x61A8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_50547dae(entity)
{
	return is_true(entity.var_c0bd8c06);
}

/*
	Name: function_dab7edc
	Namespace: namespace_250e9486
	Checksum: 0xB7BF818B
	Offset: 0x61D8
	Size: 0x98C
	Parameters: 16
	Flags: Linked
*/
function function_dab7edc(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, timeoffset, boneindex, modelindex, surfacetype, surfacenormal)
{
	self endon(#"death");
	time = gettime();
	if(is_true(self.boss) && self.birthtime > (time - 2000))
	{
		return;
	}
	if(isdefined(eattacker) && isdefined(eattacker.meleedamage))
	{
		idamage = eattacker.meleedamage;
	}
	if(self.team == "allies")
	{
		idamage = math::clamp(idamage, 100, self.health);
		/#
			namespace_1e25ad94::debugmsg((("" + self.archetype) + "") + idamage);
		#/
	}
	if(is_true(self.basic))
	{
		if(smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_PROJECTILE")
		{
			var_5ab6fbf = level.doa.zombie_health / 1000;
			var_2c320110 = max(var_5ab6fbf * 0.4, 1);
			idamage = int(idamage * var_2c320110);
		}
	}
	if(isdefined(self.allowdeath) && self.allowdeath == 0 && idamage >= self.health)
	{
		idamage = self.health - 1;
	}
	if(isdefined(einflictor) && einflictor.team == self.team || (isdefined(eattacker) && eattacker.team == self.team))
	{
		self finishactordamage(einflictor, eattacker, 10, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, timeoffset, boneindex, surfacetype, surfacenormal);
		return;
	}
	self.lastattacker = eattacker;
	if(isdefined(self.fx) && self.health <= idamage)
	{
		self namespace_83eb6304::turnofffx(self.fx);
		self.fx = undefined;
	}
	if(isdefined(weapon) && isdefined(level.doa.var_d7e090f7[weapon.name]))
	{
		var_36ee3765 = level [[level.doa.var_d7e090f7[weapon.name]]](self, idamage, eattacker, vdir, smeansofdeath, weapon);
		if(isdefined(var_36ee3765))
		{
			idamage = idamage + int(var_36ee3765);
		}
	}
	if(!is_true(self.boss))
	{
		self namespace_ed80aead::function_5e680689(eattacker, idamage, smeansofdeath, weapon, var_fd90b0bb, shitloc, vdir);
	}
	if(smeansofdeath == "MOD_BURNED")
	{
		/#
			namespace_1e25ad94::debugmsg(((("" + idamage) + "") + self.health) + (idamage > self.health ? "" : ""));
		#/
	}
	if(smeansofdeath == "MOD_CRUSH")
	{
		if(is_true(self.boss))
		{
			idamage = 0;
		}
		else
		{
			idamage = self.health;
		}
	}
	if(isdefined(self.overrideactordamage))
	{
		idamage = self [[self.overrideactordamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, timeoffset, boneindex, modelindex);
	}
	else if(isdefined(level.overrideactordamage))
	{
		idamage = self [[level.overrideactordamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, timeoffset, boneindex, modelindex);
	}
	if(isdefined(self.aioverridedamage))
	{
		if(isarray(self.aioverridedamage))
		{
			foreach(cb in self.aioverridedamage)
			{
				idamage = self [[cb]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, timeoffset, boneindex, modelindex);
			}
		}
		else
		{
			idamage = self [[self.aioverridedamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, timeoffset, boneindex, modelindex);
		}
	}
	if(isdefined(eattacker) && isdefined(eattacker.owner))
	{
		eattacker = eattacker.owner;
	}
	if(idamage >= self.health)
	{
		self zombie_eye_glow_stop();
	}
	var_5f32808d = 1;
	if(idamage >= 1000)
	{
		var_5f32808d = 2;
	}
	else if(idamage == 0)
	{
		var_5f32808d = 3;
		if(is_true(self.var_66d5e435))
		{
			var_5f32808d = 0;
		}
	}
	if(smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_HEAD_SHOT")
	{
		var_799e18e5 = vpoint;
	}
	else
	{
		var_799e18e5 = self.origin + vectorscale((0, 0, 1), 60);
	}
	if(var_5f32808d > 0)
	{
		damage = idamage;
		if(damage >= 10)
		{
			damage = int(damage / 10);
		}
		hud::function_c9800094(eattacker, var_799e18e5, damage, var_5f32808d);
	}
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = eattacker;
	params.idamage = idamage;
	params.idflags = idflags;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.var_fd90b0bb = var_fd90b0bb;
	params.vpoint = vpoint;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.vdamageorigin = vdamageorigin;
	params.psoffsettime = timeoffset;
	self.var_ce1aa55f = time;
	self callback::callback(#"on_ai_damage", params);
	if(is_true(self.boss) && idamage > 0 && isplayer(eattacker))
	{
		/#
			assert(isdefined(self.var_9be3628d));
		#/
		self.var_9be3628d[eattacker.entnum] = self.var_9be3628d[eattacker.entnum] + idamage;
	}
	/#
		if(is_true(level.doa.var_598305fe))
		{
			hud::function_c9800094(eattacker, vdamageorigin, idamage, (idamage > 1000 ? 2 : 1));
		}
	#/
	self finishactordamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, timeoffset, boneindex, surfacetype, surfacenormal);
}

/*
	Name: function_9b31d191
	Namespace: namespace_250e9486
	Checksum: 0x9728382C
	Offset: 0x6B70
	Size: 0x62C
	Parameters: 14
	Flags: Linked
*/
function function_9b31d191(einflictor, eattacker, idamage, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, timeoffset, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(isdefined(vdir))
	{
		self.damageinflictor = vdir;
	}
	self asmsetanimationrate(1);
	if(self.team == "allies")
	{
		/#
			namespace_1e25ad94::debugmsg("" + self.archetype);
		#/
	}
	if(isdefined(self.fx))
	{
		self namespace_83eb6304::turnofffx(self.fx);
	}
	if(randomint(100) < 50)
	{
		switch(randomint(3))
		{
			case 0:
			{
				self namespace_83eb6304::function_3ecfde67("headshot");
				break;
			}
			case 1:
			{
				self namespace_83eb6304::function_3ecfde67("headshot_nochunks");
				break;
			}
			default:
			{
				self namespace_83eb6304::function_3ecfde67("bloodspurt");
				break;
			}
		}
	}
	if(!is_true(self.var_4dcf6637) && is_true(self.annihilate) || is_true(self.interdimensional_gun_kill) || (isdefined(damagefromunderneath) && is_true(damagefromunderneath.bulletimpactexplode)))
	{
		self namespace_ed80aead::function_586ef822();
		self thread namespace_ec06fe4a::function_52afe5df(0.1);
		if(is_true(self.interdimensional_gun_kill))
		{
			doa_pickups::function_b8f6a8cd(level.doa.var_4b113826, self.origin + vectorscale((0, 0, 1), 40), 1, 1, 1, self.angles);
		}
	}
	if(isdefined(vdir))
	{
		if(is_true(vdir.var_7b9e42c2))
		{
			vdir.owner namespace_d2efac9a::function_6753bc5e();
		}
		else if(isvehicle(vdir) && isdefined(vdir.owner) && isplayer(vdir.owner))
		{
			if(is_true(vdir.var_b9bb0656))
			{
				vdir.owner namespace_d2efac9a::function_1bcac64f();
			}
		}
	}
	if(isdefined(shitloc))
	{
		if(isplayer(shitloc))
		{
			if(is_true(shitloc.doa.var_3e81d24c))
			{
				shitloc namespace_d2efac9a::function_dc4e1885();
			}
			if(is_true(self.var_eeaac918) || is_true(self.nukedeath))
			{
				shitloc namespace_d2efac9a::function_dd188769();
			}
		}
		if(isactor(shitloc) && isdefined(shitloc.owner) && isplayer(shitloc.owner))
		{
			shitloc = shitloc.owner;
		}
	}
	if(timeoffset == "MOD_CRUSH")
	{
		/#
			assert(!is_true(self.boss));
		#/
		self namespace_ed80aead::function_1f275794(undefined, shitloc);
		if(isdefined(shitloc))
		{
			shitloc notify(#"hash_6d92185248475f65");
		}
	}
	if(timeoffset == "MOD_ELECTROCUTED" && isdefined(vdir))
	{
		dir = self.origin - vdir.origin;
		self thread namespace_ec06fe4a::function_5678f0d(dir);
	}
	params = spawnstruct();
	params.einflictor = vdir;
	params.eattacker = shitloc;
	params.idamage = vdamageorigin;
	params.smeansofdeath = timeoffset;
	params.weapon = damagefromunderneath;
	params.vdir = modelindex;
	params.shitloc = partname;
	params.psoffsettime = vsurfacenormal;
	self callback::callback(#"on_ai_killed", params);
}

/*
	Name: function_c36e5cab
	Namespace: namespace_250e9486
	Checksum: 0xB6E6277F
	Offset: 0x71A8
	Size: 0x2C4
	Parameters: 16
	Flags: Linked
*/
function function_c36e5cab(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if(isdefined(eattacker) && eattacker.team == self.team)
	{
		idamage = 0;
	}
	if(isdefined(self.owner) && isplayer(self.owner) && is_true(self.playercontrolled))
	{
		idamage = 0;
	}
	if(isdefined(self.overridevehicledamage))
	{
		idamage = self [[self.overridevehicledamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
	}
	else if(isdefined(level.overridevehicledamage))
	{
		idamage = self [[level.overridevehicledamage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
	}
	if(idamage == 0)
	{
		return;
	}
	var_5f32808d = 1;
	if(idamage >= 1000)
	{
		var_5f32808d = 2;
	}
	if(smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_HEAD_SHOT")
	{
		var_799e18e5 = vpoint;
	}
	else
	{
		var_799e18e5 = self.origin + vectorscale((0, 0, 1), 60);
	}
	hud::function_c9800094(eattacker, var_799e18e5, int(idamage / 10), var_5f32808d);
	idamage = int(idamage);
	self finishvehicledamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, damagefromunderneath, modelindex, partname, 0);
}

/*
	Name: function_5800e038
	Namespace: namespace_250e9486
	Checksum: 0xED0D107A
	Offset: 0x7478
	Size: 0x14C
	Parameters: 8
	Flags: Linked
*/
function function_5800e038(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	if(isdefined(einflictor))
	{
		self.damageinflictor = einflictor;
	}
	params = spawnstruct();
	params.einflictor = einflictor;
	params.eattacker = eattacker;
	params.idamage = idamage;
	params.smeansofdeath = smeansofdeath;
	params.weapon = weapon;
	params.vdir = vdir;
	params.shitloc = shitloc;
	params.psoffsettime = psoffsettime;
	self callback::callback(#"on_vehicle_killed", params);
	self callback::callback(#"on_ai_killed", params);
	if(isdefined(self.overridevehiclekilled))
	{
		self [[self.overridevehiclekilled]](einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
	}
}

/*
	Name: zombie_eye_glow_stop
	Namespace: namespace_250e9486
	Checksum: 0xD9B9F033
	Offset: 0x75D0
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function zombie_eye_glow_stop()
{
	if(!isdefined(self))
	{
		return;
	}
}

/*
	Name: approximate_path_dist
	Namespace: namespace_250e9486
	Checksum: 0xEEE1C3ED
	Offset: 0x7608
	Size: 0x130
	Parameters: 1
	Flags: None
*/
function approximate_path_dist(player)
{
	aiprofile_beginentry("approximate_path_dist");
	goal_pos = player.origin;
	if(isdefined(player.last_valid_position))
	{
		goal_pos = player.last_valid_position;
	}
	if(is_true(player.b_teleporting))
	{
		if(isdefined(player.teleport_location))
		{
			goal_pos = player.teleport_location;
			if(!ispointonnavmesh(goal_pos, self))
			{
				position = getclosestpointonnavmesh(goal_pos, 100, 15);
				if(isdefined(position))
				{
					goal_pos = position;
				}
			}
		}
	}
	approx_dist = pathdistance(self.origin, goal_pos, 1, self);
	aiprofile_endentry();
	return approx_dist;
}

/*
	Name: zombieshouldknockdown
	Namespace: namespace_250e9486
	Checksum: 0xBA099720
	Offset: 0x7740
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function zombieshouldknockdown(behaviortreeentity)
{
	if(!zombiehaslegs(behaviortreeentity))
	{
		return false;
	}
	if(is_true(behaviortreeentity.knockdown))
	{
		return true;
	}
	return false;
}

/*
	Name: zombiehaslegs
	Namespace: namespace_250e9486
	Checksum: 0x3FA0145B
	Offset: 0x7798
	Size: 0x28
	Parameters: 1
	Flags: Linked
*/
function zombiehaslegs(entity)
{
	if(entity.missinglegs === 1)
	{
		return false;
	}
	return true;
}

/*
	Name: zombieknockdownactionstart
	Namespace: namespace_250e9486
	Checksum: 0x25D3801B
	Offset: 0x77C8
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function zombieknockdownactionstart(behaviortreeentity)
{
	behaviortreeentity setblackboardattribute("_knockdown_direction", behaviortreeentity.knockdown_direction);
	behaviortreeentity setblackboardattribute("_knockdown_type", behaviortreeentity.knockdown_type);
	behaviortreeentity setblackboardattribute("_getup_direction", behaviortreeentity.getup_direction);
	behaviortreeentity collidewithactors(0);
	behaviortreeentity.blockingpain = 1;
}

/*
	Name: function_c8939973
	Namespace: namespace_250e9486
	Checksum: 0x6C69E627
	Offset: 0x7880
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c8939973(behaviortreeentity)
{
	behaviortreeentity.knockdown = 0;
	behaviortreeentity collidewithactors(1);
	behaviortreeentity.blockingpain = 0;
}

/*
	Name: zombiegetupactionterminate
	Namespace: namespace_250e9486
	Checksum: 0xEBC77167
	Offset: 0x78C8
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private zombiegetupactionterminate(behaviortreeentity)
{
	behaviortreeentity.knockdown = 0;
	behaviortreeentity collidewithactors(1);
}

/*
	Name: function_e2da0652
	Namespace: namespace_250e9486
	Checksum: 0x2C8207DF
	Offset: 0x7908
	Size: 0x12E
	Parameters: 1
	Flags: Linked
*/
function function_e2da0652(entity)
{
	enemies = getaiarchetypearray(#"zombie");
	enemies = arraycombine(enemies, getaiarchetypearray(#"catalyst"), 0, 0);
	enemies = array::filter(enemies, 0, &function_3d752709, entity);
	foreach(enemy in enemies)
	{
		enemy setup_zombie_knockdown(entity);
		enemy.knockdown_type = "knockdown_shoved";
	}
}

/*
	Name: setup_zombie_knockdown
	Namespace: namespace_250e9486
	Checksum: 0xB62B9D2E
	Offset: 0x7A40
	Size: 0x342
	Parameters: 2
	Flags: Linked
*/
function setup_zombie_knockdown(var_5f02306b, var_43b3242)
{
	if(!isactor(self) || is_true(self.missinglegs) || is_true(self.var_5dd07a80) || is_true(self.isinmantleaction) || self isplayinganimscripted() || (self function_dd070839() && !is_true(var_43b3242)))
	{
		return;
	}
	if(!isdefined(var_5f02306b))
	{
		return;
	}
	self.knockdown = 1;
	if(isvec(var_5f02306b))
	{
		zombie_to_entity = var_5f02306b - self.origin;
	}
	else
	{
		zombie_to_entity = var_5f02306b.origin - self.origin;
	}
	zombie_to_entity_2d = vectornormalize((zombie_to_entity[0], zombie_to_entity[1], 0));
	zombie_forward = anglestoforward(self.angles);
	zombie_forward_2d = vectornormalize((zombie_forward[0], zombie_forward[1], 0));
	zombie_right = anglestoright(self.angles);
	zombie_right_2d = vectornormalize((zombie_right[0], zombie_right[1], 0));
	dot = vectordot(zombie_to_entity_2d, zombie_forward_2d);
	if(dot >= 0.5)
	{
		self.knockdown_direction = "front";
		self.getup_direction = "getup_back";
	}
	else
	{
		if(dot < 0.5 && dot > -0.5)
		{
			dot = vectordot(zombie_to_entity_2d, zombie_right_2d);
			if(dot > 0)
			{
				self.knockdown_direction = "right";
				if(math::cointoss())
				{
					self.getup_direction = "getup_back";
				}
				else
				{
					self.getup_direction = "getup_belly";
				}
			}
			else
			{
				self.knockdown_direction = "left";
				self.getup_direction = "getup_belly";
			}
		}
		else
		{
			self.knockdown_direction = "back";
			self.getup_direction = "getup_belly";
		}
	}
}

/*
	Name: function_3d752709
	Namespace: namespace_250e9486
	Checksum: 0x3530E932
	Offset: 0x7D90
	Size: 0x1B0
	Parameters: 2
	Flags: Linked
*/
function function_3d752709(enemy, var_bd97c6ae)
{
	if(!isdefined(enemy) || !isdefined(var_bd97c6ae))
	{
		return false;
	}
	if(is_true(enemy.knockdown) || is_true(enemy.var_6edab899))
	{
		return false;
	}
	if(gibserverutils::isgibbed(enemy, 384))
	{
		return false;
	}
	if(distancesquared(enemy.origin, var_bd97c6ae.origin) > sqr(60))
	{
		return false;
	}
	var_f2fb414f = anglestoforward(var_bd97c6ae.angles);
	var_9349139f = enemy.origin - var_bd97c6ae.origin;
	var_3e3c8075 = (var_9349139f[0], var_9349139f[1], 0);
	var_c2ee8451 = (var_f2fb414f[0], var_f2fb414f[1], 0);
	var_3e3c8075 = vectornormalize(var_3e3c8075);
	var_c2ee8451 = vectornormalize(var_c2ee8451);
	var_34e02165 = vectordot(var_c2ee8451, var_3e3c8075);
	if(var_34e02165 < 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_5a481a84
	Namespace: namespace_250e9486
	Checksum: 0x8FD12DE6
	Offset: 0x7F48
	Size: 0x15C
	Parameters: 2
	Flags: None
*/
function function_5a481a84(player, dist)
{
	if(!isdefined(dist))
	{
		dist = 100;
	}
	dist = distance(self.origin, player.origin);
	targetorigin = (player.origin[0], player.origin[1], self.origin[2]);
	var_a6470558 = vectornormalize(targetorigin - self.origin);
	var_d3cafde6 = self.meleeweapon.var_d3cafde6;
	var_32708f81 = dist + var_d3cafde6;
	var_8cf8f805 = mapfloat(0, var_d3cafde6, dist, var_32708f81, dist);
	player playerknockback(1);
	player applyknockback(int(var_8cf8f805), var_a6470558);
	player playerknockback(0);
}

/*
	Name: function_422fdfd4
	Namespace: namespace_250e9486
	Checksum: 0x7A3E631F
	Offset: 0x80B0
	Size: 0x1E4
	Parameters: 11
	Flags: Linked
*/
function function_422fdfd4(entity, attacker, weapon, var_5457dc44, hitloc, point, var_ebcb86d6, var_b85996d4, var_159ce525, var_ddd319d6, var_d2314927)
{
	var_8d3f5b7d = isalive(var_ebcb86d6) && isplayer(var_ebcb86d6);
	var_84ed9a13 = function_de3dda83(var_b85996d4, var_159ce525, var_ddd319d6, var_d2314927);
	registerzombie_bgb_used_reinforce = isdefined(var_84ed9a13) && namespace_81245006::function_f29756fe(var_84ed9a13) == 1;
	var_30362eca = registerzombie_bgb_used_reinforce && var_84ed9a13.type !== #"armor";
	var_b1c1c5cf = 1;
	if(var_8d3f5b7d)
	{
		var_38d1de41 = isdefined(namespace_81245006::function_fab3ee3e(self));
		if(var_30362eca && var_ebcb86d6 hasperk(#"hash_6afc24062d2515a2"))
		{
			if(var_b1c1c5cf < 1)
			{
				var_b1c1c5cf = var_b1c1c5cf + 0.2;
			}
			else
			{
				var_b1c1c5cf = var_b1c1c5cf * 1.2;
			}
		}
	}
	return {#registerzombie_bgb_used_reinforce:registerzombie_bgb_used_reinforce, #hash_84ed9a13:var_84ed9a13, #damage_scale:var_b1c1c5cf};
}

/*
	Name: function_de3dda83
	Namespace: namespace_250e9486
	Checksum: 0xEDE8A460
	Offset: 0x82A0
	Size: 0xAA
	Parameters: 4
	Flags: Linked
*/
function function_de3dda83(var_5457dc44, hitloc, point, var_ebcb86d6)
{
	if(isdefined(var_ebcb86d6))
	{
		var_84ed9a13 = var_ebcb86d6;
	}
	else
	{
		var_84ed9a13 = namespace_81245006::function_3131f5dd(self, hitloc, 1);
		if(!isdefined(var_84ed9a13))
		{
			var_84ed9a13 = namespace_81245006::function_37e3f011(self, var_5457dc44);
		}
		if(!isdefined(var_84ed9a13))
		{
			var_84ed9a13 = namespace_81245006::function_73ab4754(self, point, 1);
		}
	}
	return var_84ed9a13;
}

/*
	Name: function_e10af211
	Namespace: namespace_250e9486
	Checksum: 0x17CC3106
	Offset: 0x8358
	Size: 0x3EC
	Parameters: 5
	Flags: Linked
*/
function function_e10af211(var_a349a77f, trailfx, var_7b70989a, var_f635f46a, var_48f202a3)
{
	if(!isdefined(var_7b70989a))
	{
		var_7b70989a = "turret_impact";
	}
	if(!isdefined(var_f635f46a))
	{
		var_f635f46a = 1;
	}
	if(!isdefined(var_48f202a3))
	{
		var_48f202a3 = 0;
	}
	self endon(#"death");
	if(!isdefined(var_a349a77f))
	{
		if(namespace_4dae815d::function_59a9cf1d() == 0)
		{
			var_a349a77f = ([[ level.doa.var_39e3fa99 ]]->function_70fb5745().origin) + vectorscale((0, 0, 1), 2000);
		}
		else
		{
			/#
				assert(0, "");
			#/
		}
	}
	self.spawnloc = {#angles:self.angles, #origin:var_a349a77f};
	if(isactor(self))
	{
		self forceteleport(var_a349a77f, self.angles);
	}
	else
	{
		self.origin = var_a349a77f;
	}
	groundpos = namespace_ec06fe4a::function_65ee50ba(var_a349a77f, 32, -3000);
	if(is_true(var_f635f46a))
	{
		var_13aa549b = namespace_ec06fe4a::function_e22ae9b3(groundpos + vectorscale((0, 0, 1), 24), "tag_origin");
		if(isdefined(var_13aa549b))
		{
			var_13aa549b namespace_83eb6304::function_3ecfde67("incoming_impact");
			var_13aa549b thread namespace_ec06fe4a::function_d55f042c(self, "death");
			var_13aa549b thread namespace_ec06fe4a::function_d55f042c(self, "dropped");
			var_13aa549b thread namespace_ec06fe4a::function_52afe5df(5);
		}
	}
	if(isdefined(trailfx))
	{
		self namespace_83eb6304::function_3ecfde67(trailfx);
	}
	if(is_true(var_48f202a3))
	{
		self thread function_abec6179(groundpos, 32, "dropped");
		self waittill(#"dropped");
	}
	else
	{
		var_9159be43 = namespace_ec06fe4a::function_e22ae9b3(var_a349a77f, "tag_origin");
		if(isdefined(var_9159be43))
		{
			var_9159be43 thread namespace_ec06fe4a::function_d55f042c(self, "death");
			var_9159be43 thread namespace_ec06fe4a::function_52afe5df(2.5);
			self linkto(var_9159be43);
			var_9159be43 moveto(groundpos, 2);
			var_9159be43 waittill(#"movedone");
			self notify(#"dropped");
			self unlink();
			var_9159be43 namespace_83eb6304::function_3ecfde67(var_7b70989a);
		}
	}
	if(isdefined(trailfx))
	{
		self namespace_83eb6304::turnofffx(trailfx);
	}
}

/*
	Name: function_abec6179
	Namespace: namespace_250e9486
	Checksum: 0x2A8D5922
	Offset: 0x8750
	Size: 0xBA
	Parameters: 4
	Flags: Linked
*/
function function_abec6179(var_5a1d7118, proximity, note, timeout)
{
	if(!isdefined(timeout))
	{
		timeout = 5;
	}
	self endon(#"death");
	var_b235b0cb = sqr(proximity);
	timeout = gettime() + (timeout * 1000);
	while(gettime() < timeout)
	{
		if(distancesquared(self.origin, var_5a1d7118) <= var_b235b0cb)
		{
			break;
		}
		waitframe(1);
	}
	self notify(note);
}

/*
	Name: function_b5feb0bf
	Namespace: namespace_250e9486
	Checksum: 0x98C43A89
	Offset: 0x8818
	Size: 0x1EE
	Parameters: 0
	Flags: Linked
*/
function function_b5feb0bf()
{
	self notify("2b2d750547056f0d");
	self endon("2b2d750547056f0d");
	self endon(#"death");
	if(isvehicle(self))
	{
		return;
	}
	if(is_true(self.var_a592ffaa))
	{
		return;
	}
	self.var_4ee91a53 = gettime() + 5000;
	var_36313dca = (isdefined(self.animrate) ? self.animrate : 1);
	if(self.team == #"axis")
	{
		animrate = 1.17;
	}
	if(self.team == #"allies")
	{
		animrate = 0.65;
	}
	if(isplayer(self))
	{
		self thread namespace_7f5aeb59::function_ec9a307f(5, animrate);
		return;
	}
	if(!isdefined(self.var_26471e4b))
	{
		self.var_26471e4b = animrate;
		self asmsetanimationrate(animrate);
		self namespace_83eb6304::function_3ecfde67("nova_crawler_aura_fx");
	}
	while(gettime() < self.var_4ee91a53)
	{
		wait(0.5);
	}
	self.var_26471e4b = undefined;
	self asmsetanimationrate(var_36313dca);
	self namespace_83eb6304::turnofffx("nova_crawler_aura_fx");
	self.var_4ee91a53 = undefined;
}

