#using script_123facbef9b63a62;
#using script_8988fdbc78d6c53;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\placeables.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

class class_7b5e0861 
{
	var m_health;
	var m_name;

	/*
		Name: constructor
		Namespace: namespace_7b5e0861
		Checksum: 0x80F724D1
		Offset: 0x44E8
		Size: 0x4
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_7b5e0861
		Checksum: 0x8B8EEBEF
		Offset: 0x44F8
		Size: 0x4C
		Parameters: 0
		Flags: 128
	*/
	destructor()
	{
		/#
			if(is_true(level.var_d39c38bf))
			{
				iprintlnbold("" + m_name);
			}
		#/
	}

	/*
		Name: function_8df621c
		Namespace: namespace_7b5e0861
		Checksum: 0x8EF2994E
		Offset: 0x4550
		Size: 0x162
		Parameters: 2
		Flags: None
	*/
	function function_8df621c(bundle, var_a8539bf6)
	{
		self.m_type = bundle.trap_type;
		self.m_name = bundle.name;
		self.m_weapon = bundle.weapon;
		self.m_vehicle = bundle.vehicle;
		self.m_model = bundle.model;
		self.var_e84fc5dc = bundle.var_f495bc84;
		self.var_28f1ce55 = bundle.var_90f05429;
		self.var_a57ce660 = bundle.var_73b8c436;
		self.var_656cbe2d = bundle.var_28bb5240;
		self.m_timeout = bundle.timeout;
		self.m_health = bundle.health;
		if(isdefined(m_health))
		{
			self.var_c59ba447 = m_health - (int(m_health / 3));
		}
		self.var_cc95789e = bundle.empdamage;
		self.var_f81e0192 = bundle.var_980063fb;
		self.var_b4662b52 = bundle.var_6e2ae4a5;
		self.var_3882b68 = bundle.placeimmediately;
		self.var_31e7e66a = bundle.var_d6011052;
		self.var_3efa7c17 = var_a8539bf6;
	}

}

#namespace traps_deployable;

/*
	Name: function_6c857a49
	Namespace: traps_deployable
	Checksum: 0x5244DC26
	Offset: 0x270
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6c857a49()
{
	level notify(1115788898);
}

/*
	Name: function_89f2df9
	Namespace: traps_deployable
	Checksum: 0x9EB0B2E8
	Offset: 0x290
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"traps_deployable", &function_70a657d8, undefined, undefined, #"load");
}

/*
	Name: function_70a657d8
	Namespace: traps_deployable
	Checksum: 0xC5F0C1CB
	Offset: 0x2E0
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	callback::on_spawned(&on_player_spawned);
	thread init_traps();
}

/*
	Name: on_player_spawned
	Namespace: traps_deployable
	Checksum: 0x7E8C4EF3
	Offset: 0x320
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	if(!isdefined(level.var_5e7ffbf9))
	{
		return;
	}
	player = self;
	player owner_init();
}

/*
	Name: owner_init
	Namespace: traps_deployable
	Checksum: 0x2225F5ED
	Offset: 0x368
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function owner_init()
{
	owner = self;
	if(!isdefined(owner.var_5e7ffbf9))
	{
		owner.var_5e7ffbf9 = spawnstruct();
	}
	if(!isdefined(owner.var_5e7ffbf9.watchers_init))
	{
		owner.var_5e7ffbf9.watchers_init = [];
	}
}

/*
	Name: function_18bbaaf9
	Namespace: traps_deployable
	Checksum: 0xE2581D25
	Offset: 0x3D8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_18bbaaf9()
{
	return isdefined(self.var_5e7ffbf9) && is_true(self.var_5e7ffbf9.var_18bbaaf9);
}

/*
	Name: init_traps
	Namespace: traps_deployable
	Checksum: 0xA6778245
	Offset: 0x418
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function init_traps()
{
	function_5726a711();
	/#
		thread debug_init();
	#/
}

/*
	Name: function_5726a711
	Namespace: traps_deployable
	Checksum: 0xD914685
	Offset: 0x450
	Size: 0x348
	Parameters: 0
	Flags: None
*/
function function_5726a711()
{
	level flag::wait_till("all_players_spawned");
	var_59eaf9e1 = struct::get_script_bundle_instances("traps_deployable");
	foreach(var_5e63b00d in var_59eaf9e1)
	{
		if(isdefined(var_5e63b00d.scriptbundlename))
		{
			var_2d727ba0 = getscriptbundle(var_5e63b00d.scriptbundlename);
			if(isdefined(var_2d727ba0))
			{
				var_a8539bf6 = spawnstruct();
				if(isdefined(var_5e63b00d.script_team) && var_5e63b00d.script_team != #"none")
				{
					var_a8539bf6.team = var_5e63b00d.script_team;
				}
				else
				{
					var_a8539bf6.team = #"any";
				}
				var_a8539bf6.origin = var_5e63b00d.origin;
				var_a8539bf6.angles = var_5e63b00d.angles;
				var_a8539bf6.model = var_5e63b00d.model;
				gameobject = var_2d727ba0.gameobject;
				if(isdefined(var_5e63b00d.var_3b9b6b78))
				{
					gameobject = var_5e63b00d.var_3b9b6b78;
				}
				var_a8539bf6.var_5b026504 = var_5e63b00d.script_objective;
				var_a8539bf6.var_ef146db5 = var_5e63b00d.var_d513a1cb;
				var_a8539bf6.gameobject = gameobject;
				if(var_a8539bf6 register_trap(var_2d727ba0))
				{
					var_5e63b00d.var_a8539bf6 = var_a8539bf6;
					if(!is_true(var_5e63b00d.script_enable_on_start))
					{
						var_a8539bf6 gameobjects::disable_object(1);
					}
					if(is_true(var_5e63b00d.var_d1cae5f4))
					{
						if(isdefined(var_5e63b00d.script_waittill))
						{
							var_5e63b00d thread function_8ecf6615(var_a8539bf6.mdl_gameobject.var_3af54106);
						}
						var_5e63b00d thread function_69996073(var_a8539bf6.mdl_gameobject.var_3af54106);
					}
					level function_8f66239f(var_5e63b00d.var_d513a1cb);
					/#
						var_5e63b00d function_ef942626();
					#/
				}
			}
			else
			{
				/#
					function_50939dbe("" + var_5e63b00d.scriptbundlename);
				#/
			}
			continue;
		}
		/#
			function_50939dbe("");
		#/
	}
}

/*
	Name: register_trap
	Namespace: traps_deployable
	Checksum: 0xA24DF2F7
	Offset: 0x7A0
	Size: 0x3AE
	Parameters: 1
	Flags: None
*/
function register_trap(var_2d727ba0)
{
	var_a8539bf6 = self;
	if(isdefined(var_2d727ba0) && isdefined(var_2d727ba0.trap_type))
	{
		switch(var_2d727ba0.trap_type)
		{
			case "generic":
			{
				function_2ce21754(var_2d727ba0.trap_type, &function_c75a9937, &function_6ce6a400, &function_2b8baf6d, &function_a879466e, &function_efe68db2, &function_6ef47474, &function_a21e6a22);
				break;
			}
			case "fire_bomb":
			case "flash_disruptor":
			case "mine":
			case "claymore":
			{
				function_2ce21754(var_2d727ba0.trap_type, &function_3c3f30e3, &function_6ce6a400, &function_2b8baf6d, &function_a879466e, &function_4a401677, &function_6ef47474, &function_b501ff0b);
				break;
			}
			case "guardian":
			case "turret":
			{
				function_2ce21754(var_2d727ba0.trap_type, &function_a39b7bb6, &function_6ce6a400, &function_69efb3b0, &function_a879466e, &function_612e5ef9, &function_6ef47474, &function_b501ff0b);
				break;
			}
			case "vehicle":
			{
				function_2ce21754(var_2d727ba0.trap_type, &function_deb3cb22, &function_6ce6a400, &function_51d36222, &function_c66a11d0, &function_5c1d01, &function_6ef47474, &function_b501ff0b);
				break;
			}
			default:
			{
				/#
					assertmsg("" + var_2d727ba0.trap_type);
				#/
				/#
					function_50939dbe("");
				#/
				return;
			}
		}
		if(var_a8539bf6 function_cf4b6e75(var_2d727ba0))
		{
			return true;
		}
	}
	/#
		function_50939dbe("");
	#/
	return false;
}

/*
	Name: function_cf4b6e75
	Namespace: traps_deployable
	Checksum: 0x77B1097
	Offset: 0xB58
	Size: 0xC6
	Parameters: 1
	Flags: None
*/
function function_cf4b6e75(var_2d727ba0)
{
	var_a8539bf6 = self;
	if(isdefined(var_2d727ba0.gameobject))
	{
		var_3af54106 = new class_7b5e0861();
		[[ var_3af54106 ]]->function_8df621c(var_2d727ba0, var_a8539bf6);
		var_a8539bf6 function_19e12558(var_3af54106, var_a8539bf6.origin, var_a8539bf6.angles);
		/#
			function_1fefac6d("" + var_2d727ba0.name);
		#/
		return true;
	}
	/#
		function_50939dbe("");
	#/
	return false;
}

/*
	Name: function_19e12558
	Namespace: traps_deployable
	Checksum: 0x7E33FD63
	Offset: 0xC28
	Size: 0x1EC
	Parameters: 4
	Flags: None
*/
function function_19e12558(var_3af54106, origin, angles, var_563080be)
{
	if(!isdefined(var_563080be))
	{
		var_563080be = undefined;
	}
	var_a8539bf6 = self;
	model = var_3af54106.m_model;
	var_ed8e6d51 = undefined;
	if(isdefined(model))
	{
		var_ed8e6d51 = util::spawn_model(model, origin, angles);
	}
	if(isdefined(origin) && isdefined(angles))
	{
		var_a8539bf6.origin = origin;
		var_a8539bf6.angles = angles;
	}
	var_a8539bf6 gameobjects::init_game_objects(var_a8539bf6.gameobject, var_a8539bf6.team, 0, undefined, var_ed8e6d51);
	var_a8539bf6 gameobjects::set_onuse_event(&function_e191d35c);
	if(isdefined(var_a8539bf6.mdl_gameobject.trigger) && !is_true(var_a8539bf6.mdl_gameobject.trigger.var_a865c2cd))
	{
		var_a8539bf6.mdl_gameobject gameobjects::set_use_hint_text(var_3af54106.var_656cbe2d);
	}
	var_a8539bf6.mdl_gameobject.trigger usetriggerrequirelookat();
	if(isdefined(var_563080be))
	{
		var_a8539bf6.mdl_gameobject.b_reusable = 0;
	}
	var_a8539bf6.mdl_gameobject.var_3af54106 = var_3af54106;
	var_3af54106 function_94e3167b(var_a8539bf6.mdl_gameobject);
}

/*
	Name: function_2ce21754
	Namespace: traps_deployable
	Checksum: 0xF9F8609
	Offset: 0xE20
	Size: 0x144
	Parameters: 8
	Flags: None
*/
function function_2ce21754(type, onplacecallback, oncancelcallback, onmovecallback, var_11451882, var_f4ff98c9, ondamagecallback, damagewrapper)
{
	if(function_77a3b730(type))
	{
		return;
	}
	function_422733d9(type);
	function_1abc0efa(type, onplacecallback);
	function_b7d6919(type, oncancelcallback);
	function_8bcde666(type, onmovecallback);
	function_fe99979d(type, ondamagecallback);
	function_670497bc(type, var_11451882);
	function_51a2f229(type, var_f4ff98c9);
	function_f885ebd3(type, damagewrapper);
	/#
		function_1fefac6d("" + type);
	#/
}

/*
	Name: function_77a3b730
	Namespace: traps_deployable
	Checksum: 0x463393BF
	Offset: 0xF70
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function function_77a3b730(type)
{
	return isdefined(level.var_5e7ffbf9) && isdefined(level.var_5e7ffbf9.traptypes) && isdefined(level.var_5e7ffbf9.traptypes[type]);
}

/*
	Name: function_422733d9
	Namespace: traps_deployable
	Checksum: 0x7D12CFC4
	Offset: 0xFC8
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function function_422733d9(type)
{
	if(!isdefined(level.var_5e7ffbf9))
	{
		level.var_5e7ffbf9 = spawnstruct();
	}
	if(!isdefined(level.var_5e7ffbf9.traptypes))
	{
		level.var_5e7ffbf9.traptypes = [];
	}
	if(!isdefined(level.var_5e7ffbf9.traptypes[type]))
	{
		level.var_5e7ffbf9.traptypes[type] = spawnstruct();
	}
}

/*
	Name: add_callback
	Namespace: traps_deployable
	Checksum: 0x14D0D57E
	Offset: 0x1070
	Size: 0x6C
	Parameters: 3
	Flags: None
*/
function add_callback(type, callbackname, callbackfunc)
{
	if(function_77a3b730(type))
	{
		if(isdefined(callbackname) && isdefined(callbackfunc))
		{
			level.var_5e7ffbf9.traptypes[type].(callbackname) = callbackfunc;
		}
	}
}

/*
	Name: function_1abc0efa
	Namespace: traps_deployable
	Checksum: 0xF94761BF
	Offset: 0x10E8
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_1abc0efa(type, callback)
{
	add_callback(type, "onPlaceCallback", callback);
}

/*
	Name: function_b7d6919
	Namespace: traps_deployable
	Checksum: 0xC1B8891B
	Offset: 0x1128
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_b7d6919(type, callback)
{
	add_callback(type, "onCancelCallback", callback);
}

/*
	Name: function_8bcde666
	Namespace: traps_deployable
	Checksum: 0xB3113563
	Offset: 0x1168
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_8bcde666(type, callback)
{
	add_callback(type, "onMoveCallback", callback);
}

/*
	Name: function_670497bc
	Namespace: traps_deployable
	Checksum: 0x7EAB6954
	Offset: 0x11A8
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_670497bc(type, callback)
{
	add_callback(type, "onActivateTrap", callback);
}

/*
	Name: function_51a2f229
	Namespace: traps_deployable
	Checksum: 0xA26BCA95
	Offset: 0x11E8
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_51a2f229(type, callback)
{
	add_callback(type, "onAutoActivateTrap", callback);
}

/*
	Name: function_fe99979d
	Namespace: traps_deployable
	Checksum: 0x543C9217
	Offset: 0x1228
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_fe99979d(type, callback)
{
	add_callback(type, "onDamageCallback", callback);
}

/*
	Name: function_f885ebd3
	Namespace: traps_deployable
	Checksum: 0x7F907F5F
	Offset: 0x1268
	Size: 0x34
	Parameters: 2
	Flags: None
*/
function function_f885ebd3(type, callback)
{
	add_callback(type, "damageWrapper", callback);
}

/*
	Name: function_e191d35c
	Namespace: traps_deployable
	Checksum: 0x47B2299B
	Offset: 0x12A8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_e191d35c(e_player)
{
	e_gameobject = self;
	e_player thread activate_trap(e_gameobject.var_3af54106, e_gameobject.origin, e_gameobject.angles);
}

/*
	Name: function_51ca9c38
	Namespace: traps_deployable
	Checksum: 0x3DA90899
	Offset: 0x1300
	Size: 0x16A
	Parameters: 2
	Flags: None
*/
function function_51ca9c38(origin, team)
{
	var_5519c642 = team;
	if(var_5519c642 == #"any")
	{
		var_5519c642 = "all";
	}
	owners = getactorteamarray(var_5519c642);
	foreach(player in level.players)
	{
		if(player.team == team || team == #"any")
		{
			if(!isdefined(owners))
			{
				owners = [];
			}
			else if(!isarray(owners))
			{
				owners = array(owners);
			}
			owners[owners.size] = player;
		}
	}
	owner = arraygetclosest(origin, owners);
	return owner;
}

/*
	Name: function_6153484f
	Namespace: traps_deployable
	Checksum: 0x5E40F480
	Offset: 0x1478
	Size: 0xB8
	Parameters: 1
	Flags: None
*/
function function_6153484f(team)
{
	if(!isdefined(level.var_5e7ffbf9.var_c54d6e52))
	{
		level.var_5e7ffbf9.var_c54d6e52 = [];
	}
	if(!isdefined(level.var_5e7ffbf9.var_c54d6e52[team]))
	{
		level.var_5e7ffbf9.var_c54d6e52[team] = spawn("script_origin", (0, 0, 0));
	}
	level.var_5e7ffbf9.var_c54d6e52[team].team = team;
	return level.var_5e7ffbf9.var_c54d6e52[team];
}

/*
	Name: function_69996073
	Namespace: traps_deployable
	Checksum: 0xA5CB93E5
	Offset: 0x1538
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_69996073(var_3af54106)
{
	var_5e63b00d = self;
	var_5e63b00d.var_a8539bf6.mdl_gameobject endon(#"destroyed_complete", #"death");
	var_5e63b00d flag::function_5f02becb();
	var_40a32dae = undefined;
	team = util::get_team_mapping(var_5e63b00d.var_a8539bf6.team);
	if(team == #"any")
	{
		var_db4c606e = function_51ca9c38(var_5e63b00d.var_a8539bf6.origin, team);
		team = var_db4c606e.team;
	}
	var_40a32dae = function_6153484f(team);
	var_5e63b00d.var_a8539bf6 thread function_186e3cc4(var_3af54106, var_40a32dae, team);
}

/*
	Name: function_8ecf6615
	Namespace: traps_deployable
	Checksum: 0xBF1F4E06
	Offset: 0x1668
	Size: 0x174
	Parameters: 1
	Flags: None
*/
function function_8ecf6615(var_3af54106)
{
	var_5e63b00d = self;
	var_5e63b00d.var_a8539bf6.mdl_gameobject endon(#"destroyed_complete", #"death");
	waitresult = undefined;
	waitresult = level waittill(var_5e63b00d.script_waittill);
	var_40a32dae = waitresult.owner;
	team = waitresult.team;
	if(!isdefined(var_40a32dae) || !isplayer(var_40a32dae))
	{
		if(!isdefined(team))
		{
			team = util::get_team_mapping(var_5e63b00d.var_a8539bf6.team);
		}
		if(team == #"any")
		{
			var_db4c606e = function_51ca9c38(var_5e63b00d.var_a8539bf6.origin, team);
			team = var_db4c606e.team;
		}
		var_40a32dae = function_6153484f(team);
	}
	var_5e63b00d.var_a8539bf6 thread function_186e3cc4(var_3af54106, var_40a32dae, team);
}

/*
	Name: function_186e3cc4
	Namespace: traps_deployable
	Checksum: 0x634AE485
	Offset: 0x17E8
	Size: 0x1CC
	Parameters: 3
	Flags: None
*/
function function_186e3cc4(var_3af54106, owner, team)
{
	var_a8539bf6 = self;
	type = var_3af54106.m_type;
	if(isdefined(owner))
	{
		owner owner_init();
		time = gettime();
		if(isdefined(owner.var_5e7ffbf9.var_1b518274))
		{
			while(owner.var_5e7ffbf9.var_1b518274 == time)
			{
				waitframe(1);
				if(!isdefined(owner))
				{
					/#
						function_50939dbe(("" + var_3af54106.m_name) + "");
					#/
					return;
				}
				time = gettime();
			}
		}
		owner.var_5e7ffbf9.var_1b518274 = time;
		if(function_77a3b730(type) && isdefined(level.var_5e7ffbf9.traptypes[type].onautoactivatetrap))
		{
			var_4888c7a2 = var_a8539bf6 [[level.var_5e7ffbf9.traptypes[type].onautoactivatetrap]](var_3af54106, owner, team);
		}
		waitframe(1);
		if(isdefined(var_a8539bf6.mdl_gameobject))
		{
			var_a8539bf6.mdl_gameobject thread gameobjects::check_gameobject_reenable();
		}
	}
	else
	{
		/#
			function_50939dbe(("" + var_3af54106.m_name) + "");
		#/
	}
}

/*
	Name: activate_trap
	Namespace: traps_deployable
	Checksum: 0x67BE5059
	Offset: 0x19C0
	Size: 0x104
	Parameters: 3
	Flags: None
*/
function activate_trap(var_3af54106, origin, angles)
{
	player = self;
	type = var_3af54106.m_type;
	player owner_init();
	self.var_5e7ffbf9.var_18bbaaf9 = 1;
	if(function_77a3b730(type) && isdefined(level.var_5e7ffbf9.traptypes[type].onactivatetrap))
	{
		player [[level.var_5e7ffbf9.traptypes[type].onactivatetrap]](var_3af54106, origin, angles);
	}
	else
	{
		/#
			function_50939dbe(("" + var_3af54106.m_name) + "");
		#/
	}
}

/*
	Name: function_6e082c55
	Namespace: traps_deployable
	Checksum: 0x5979E58D
	Offset: 0x1AD0
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_6e082c55(var_3c8e8a80)
{
	var_3af54106 = self;
	if(!isdefined(level.var_5e7ffbf9.var_1d76a8c4))
	{
		level.var_5e7ffbf9.var_1d76a8c4 = [];
	}
	if(isdefined(var_3c8e8a80))
	{
		if(isdefined(var_3af54106.var_3efa7c17.var_5b026504))
		{
			var_3c8e8a80.var_5b026504 = var_3af54106.var_3efa7c17.var_5b026504;
		}
		if(isdefined(var_3af54106.var_3efa7c17.var_ef146db5))
		{
			var_3c8e8a80.var_ef146db5 = var_3af54106.var_3efa7c17.var_ef146db5;
		}
		if(!isdefined(level.var_5e7ffbf9.var_1d76a8c4))
		{
			level.var_5e7ffbf9.var_1d76a8c4 = [];
		}
		else if(!isarray(level.var_5e7ffbf9.var_1d76a8c4))
		{
			level.var_5e7ffbf9.var_1d76a8c4 = array(level.var_5e7ffbf9.var_1d76a8c4);
		}
		level.var_5e7ffbf9.var_1d76a8c4[level.var_5e7ffbf9.var_1d76a8c4.size] = var_3c8e8a80;
	}
}

/*
	Name: function_94e3167b
	Namespace: traps_deployable
	Checksum: 0x1E414A3
	Offset: 0x1C38
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_94e3167b(mdl_gameobject)
{
	var_3af54106 = self;
	if(!isdefined(level.var_5e7ffbf9.var_9afef5eb))
	{
		level.var_5e7ffbf9.var_9afef5eb = [];
	}
	if(isdefined(mdl_gameobject))
	{
		if(isdefined(var_3af54106.var_3efa7c17.var_5b026504))
		{
			mdl_gameobject.var_5b026504 = var_3af54106.var_3efa7c17.var_5b026504;
		}
		if(isdefined(var_3af54106.var_3efa7c17.var_ef146db5))
		{
			mdl_gameobject.var_ef146db5 = var_3af54106.var_3efa7c17.var_ef146db5;
		}
		if(!isdefined(level.var_5e7ffbf9.var_9afef5eb))
		{
			level.var_5e7ffbf9.var_9afef5eb = [];
		}
		else if(!isarray(level.var_5e7ffbf9.var_9afef5eb))
		{
			level.var_5e7ffbf9.var_9afef5eb = array(level.var_5e7ffbf9.var_9afef5eb);
		}
		level.var_5e7ffbf9.var_9afef5eb[level.var_5e7ffbf9.var_9afef5eb.size] = mdl_gameobject;
	}
}

/*
	Name: function_c26db3e
	Namespace: traps_deployable
	Checksum: 0x9F6C75C8
	Offset: 0x1DA0
	Size: 0x20
	Parameters: 3
	Flags: None
*/
function function_c26db3e(origin, angles, player)
{
	return true;
}

/*
	Name: function_e4fd9a4c
	Namespace: traps_deployable
	Checksum: 0x3756C338
	Offset: 0x1DC8
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function function_e4fd9a4c(var_3af54106)
{
}

/*
	Name: function_df4e6283
	Namespace: traps_deployable
	Checksum: 0x5A813DD8
	Offset: 0x1DE0
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function function_df4e6283(var_3af54106)
{
}

/*
	Name: function_a879466e
	Namespace: traps_deployable
	Checksum: 0xC4D38725
	Offset: 0x1DF8
	Size: 0x3D4
	Parameters: 3
	Flags: None
*/
function function_a879466e(var_3af54106, origin, angles)
{
	player = self;
	type = angles.m_type;
	if(function_77a3b730(type))
	{
		onmovecallback = level.var_5e7ffbf9.traptypes[type].onmovecallback;
		if(angles.var_31e7e66a === 1)
		{
			onmovecallback = undefined;
		}
		if(isdefined(angles.m_weapon) && angles.m_weapon.deployable)
		{
			player function_e4fd9a4c(angles);
			placeable = player placeables::function_f872b831(level.var_5e7ffbf9.traptypes[type].onplacecallback, level.var_5e7ffbf9.traptypes[type].oncancelcallback, onmovecallback, level.var_5e7ffbf9.traptypes[type].onshutdowncallback, level.var_5e7ffbf9.traptypes[type].ondeathcallback, level.var_5e7ffbf9.traptypes[type].onempcallback, level.var_5e7ffbf9.traptypes[type].ondamagecallback, level.var_5e7ffbf9.traptypes[type].var_d0dd7e76, &function_c26db3e, angles.m_weapon, angles.var_656cbe2d, angles.var_f81e0192, angles.var_b4662b52, angles.m_timeout);
			placeable.var_3af54106 = angles;
			placeable.is_placeable = 1;
			placeable.var_25404db4 = 1;
			placeable placeables::function_613a226a(1);
		}
		else
		{
			placeable = player placeables::spawnplaceable(level.var_5e7ffbf9.traptypes[type].onplacecallback, level.var_5e7ffbf9.traptypes[type].oncancelcallback, onmovecallback, level.var_5e7ffbf9.traptypes[type].onshutdowncallback, level.var_5e7ffbf9.traptypes[type].ondeathcallback, level.var_5e7ffbf9.traptypes[type].onempcallback, level.var_5e7ffbf9.traptypes[type].ondamagecallback, level.var_5e7ffbf9.traptypes[type].var_d0dd7e76, angles.m_model, angles.var_e84fc5dc, angles.var_28f1ce55, angles.var_a57ce660, angles.var_656cbe2d, angles.m_timeout, angles.m_health, angles.var_cc95789e, angles.var_f81e0192, angles.var_b4662b52, angles.var_3882b68, level.var_5e7ffbf9.traptypes[type].damagewrapper);
			placeable.var_3af54106 = angles;
			placeable.is_placeable = 1;
			placeable.var_25404db4 = 1;
			placeable placeables::function_613a226a(1);
			placeable notsolid();
		}
	}
}

/*
	Name: function_c75a9937
	Namespace: traps_deployable
	Checksum: 0xDE50E66B
	Offset: 0x21D8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_c75a9937(placeable)
{
	player = self;
	var_3af54106 = placeable.var_3af54106;
	player function_df4e6283(var_3af54106);
}

/*
	Name: function_6ce6a400
	Namespace: traps_deployable
	Checksum: 0xDF04D382
	Offset: 0x2228
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_6ce6a400(placeable)
{
	player = self;
	var_3af54106 = placeable.var_3af54106;
	player function_df4e6283(var_3af54106);
	placeable.var_3af54106.var_3efa7c17 function_19e12558(placeable.var_3af54106, placeable.origin, placeable.angles, 1);
}

/*
	Name: function_2b8baf6d
	Namespace: traps_deployable
	Checksum: 0xC9DD752
	Offset: 0x22B8
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_2b8baf6d(placeable)
{
	player = self;
	var_3af54106 = placeable.var_3af54106;
	player function_e4fd9a4c(var_3af54106);
	placeable.cancelable = 1;
}

/*
	Name: function_efe68db2
	Namespace: traps_deployable
	Checksum: 0x15A3F908
	Offset: 0x2318
	Size: 0x58
	Parameters: 3
	Flags: None
*/
function function_efe68db2(var_3af54106, owner, team)
{
	var_a8539bf6 = self;
	/#
		function_50939dbe("" + var_a8539bf6.scriptbundlename);
	#/
	return team;
}

/*
	Name: function_6ef47474
	Namespace: traps_deployable
	Checksum: 0x80F724D1
	Offset: 0x2378
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_6ef47474()
{
}

/*
	Name: function_a21e6a22
	Namespace: traps_deployable
	Checksum: 0x6DE3D910
	Offset: 0x2388
	Size: 0x74
	Parameters: 4
	Flags: None
*/
function function_a21e6a22(damagecallback, var_b6f10e7c, var_1891d3cd, var_2053fdc6)
{
	placeable = self;
	placeable function_b501ff0b(damagecallback, var_b6f10e7c, var_1891d3cd, var_2053fdc6);
	placeable thread function_59a79a68(placeable.var_3af54106, damagecallback, var_b6f10e7c, var_1891d3cd, var_2053fdc6);
}

/*
	Name: function_b501ff0b
	Namespace: traps_deployable
	Checksum: 0xD804704D
	Offset: 0x2408
	Size: 0x8C
	Parameters: 4
	Flags: None
*/
function function_b501ff0b(damagecallback, var_b6f10e7c, var_1891d3cd, var_2053fdc6)
{
	waitframe(1);
	placeable = self;
	placeable.health = 9999999;
	placeable.damagetaken = 0;
	placeable function_6253b65f(placeable.var_3af54106.m_health, placeable.var_3af54106.var_c59ba447);
}

/*
	Name: function_59a79a68
	Namespace: traps_deployable
	Checksum: 0xD95AAFBC
	Offset: 0x24A0
	Size: 0x44E
	Parameters: 5
	Flags: None
*/
function function_59a79a68(var_3af54106, var_ab5af093, destroyed_callback, emp_damage, emp_callback)
{
	self endon(#"death", #"delete");
	/#
		assert(!isvehicle(self) || !issentient(self), "");
	#/
	while(true)
	{
		weapon_damage = undefined;
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		attacker = waitresult.attacker;
		inflictor = waitresult.inflictor;
		damage = waitresult.amount;
		type = waitresult.mod;
		weapon = waitresult.weapon;
		if(is_true(self.invulnerable))
		{
			continue;
		}
		if(!isdefined(attacker))
		{
			continue;
		}
		friendlyfire = damage::friendlyfirecheck(self.owner, attacker);
		if(!friendlyfire)
		{
			continue;
		}
		isvalidattacker = 1;
		if(level.teambased)
		{
			isvalidattacker = isdefined(attacker.team) && attacker.team != self.team;
		}
		if(weapon.isemp && type == "MOD_GRENADE_SPLASH")
		{
			emp_damage_to_apply = var_ab5af093.var_cc95789e;
			if(!isdefined(emp_damage_to_apply))
			{
				emp_damage_to_apply = (isdefined(emp_damage) ? emp_damage : 1);
			}
			if(isdefined(emp_callback) && emp_damage_to_apply > 0)
			{
				self [[emp_callback]](attacker);
			}
			weapon_damage = emp_damage_to_apply;
		}
		if(is_true(self.selfdestruct))
		{
			weapon_damage = self.maxhealth + 1;
		}
		if(!isdefined(weapon_damage))
		{
			weapon_damage = damage;
		}
		if(weapon_damage > 0)
		{
			if(damagefeedback::dodamagefeedback(weapon, inflictor, weapon_damage, type))
			{
				attacker damagefeedback::update();
			}
			self challenges::trackassists(attacker, weapon_damage, 0);
		}
		self.damagetaken = self.damagetaken + weapon_damage;
		if(!issentient(self) && weapon_damage > 0)
		{
			self.attacker = attacker;
		}
		if(self.damagetaken > self.maxhealth)
		{
			weaponstatname = "destroyed";
			switch(weapon.name)
			{
				case "tow_turret":
				case "tow_turret_drop":
				case "auto_tow":
				{
					weaponstatname = "kills";
					break;
				}
			}
			if(isdefined(destroyed_callback))
			{
				self thread [[destroyed_callback]](attacker, weapon);
			}
			return;
		}
		remaining_health = self.maxhealth - self.damagetaken;
		if(remaining_health < self.lowhealth && weapon_damage > 0)
		{
			self.currentstate = "damaged";
		}
	}
}

/*
	Name: function_6253b65f
	Namespace: traps_deployable
	Checksum: 0x5E8C9534
	Offset: 0x28F8
	Size: 0x3E
	Parameters: 2
	Flags: None
*/
function function_6253b65f(max_health, low_health)
{
	self.maxhealth = max_health;
	self.lowhealth = low_health;
	self.hackedhealth = self.maxhealth;
}

/*
	Name: function_da421875
	Namespace: traps_deployable
	Checksum: 0xF5500BBB
	Offset: 0x2940
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_da421875(placeable)
{
	self waittill(#"death");
	if(isdefined(placeable) && is_true(placeable.is_placeable))
	{
		placeable placeables::forceshutdown();
	}
}

/*
	Name: watcher_init
	Namespace: traps_deployable
	Checksum: 0x1AF32B35
	Offset: 0x29A8
	Size: 0x1C8
	Parameters: 1
	Flags: None
*/
function watcher_init(var_3af54106)
{
	owner = self;
	var_c29551e1 = var_3af54106.m_weapon.name;
	var_c98531e5 = undefined;
	if(!is_true(owner.var_5e7ffbf9.watchers_init[var_c29551e1]))
	{
		type = var_3af54106.m_type;
		if(type == "claymore")
		{
			var_c98531e5 = owner weaponobjects::function_9d7ae85f(var_c29551e1, &namespace_9bf1b425::function_ae7e49da, 0);
		}
		else
		{
			if(type == "flash_disruptor")
			{
				var_c98531e5 = owner weaponobjects::function_9d7ae85f(var_c29551e1, &namespace_9bf1b425::function_d8d3b49b, 0);
			}
			else
			{
				if(type == "fire_bomb")
				{
					var_c98531e5 = owner weaponobjects::function_9d7ae85f(var_c29551e1, &namespace_9bf1b425::function_518130e, 0);
				}
				else
				{
					var_c98531e5 = owner weaponobjects::function_9d7ae85f(var_c29551e1, &namespace_9bf1b425::function_1daa29fc, 0);
				}
			}
		}
		owner.var_5e7ffbf9.watchers_init[var_c29551e1] = 1;
	}
	else
	{
		var_c98531e5 = owner weaponobjects::getweaponobjectwatcher(var_c29551e1);
	}
	if(!isplayer(owner))
	{
		owner thread weaponobjects::watchweaponobjectspawn("grenade_fire", "death");
	}
	return var_c98531e5;
}

/*
	Name: function_3c3f30e3
	Namespace: traps_deployable
	Checksum: 0x84647221
	Offset: 0x2B78
	Size: 0x148
	Parameters: 1
	Flags: None
*/
function function_3c3f30e3(placeable)
{
	player = self;
	var_3af54106 = placeable.var_3af54106;
	if(isplayer(player))
	{
		var_c98531e5 = player watcher_init(var_3af54106);
		placeable.weapon_instance = player magicgrenadeplayer(var_3af54106.m_weapon, placeable.origin, (0, 0, -1));
		if(isdefined(placeable.weapon_instance))
		{
			placeable.weapon_instance.angles = placeable.angles;
			placeable.weapon_instance.var_cea6a2fb = placeable;
			var_3c8e8a80 = spawnstruct();
			var_3c8e8a80.var_c98531e5 = var_c98531e5;
			var_3c8e8a80.weapon_instance = placeable.weapon_instance;
			var_3af54106 function_6e082c55(var_3c8e8a80);
			player function_c75a9937(placeable);
		}
	}
	return var_3af54106;
}

/*
	Name: function_4a401677
	Namespace: traps_deployable
	Checksum: 0xAF207BC8
	Offset: 0x2CC8
	Size: 0x218
	Parameters: 3
	Flags: None
*/
function function_4a401677(var_3af54106, owner, team)
{
	var_a8539bf6 = self;
	if(isdefined(team))
	{
		weapon_instance = undefined;
		var_c98531e5 = team watcher_init(owner);
		if(isplayer(team))
		{
			weapon_instance = team magicgrenadeplayer(owner.m_weapon, var_a8539bf6.origin, (0, 0, -1));
		}
		else
		{
			weapon_instance = team magicgrenadetype(owner.m_weapon, var_a8539bf6.origin, (0, 0, -1));
		}
		if(isdefined(weapon_instance))
		{
			weapon_instance.angles = var_a8539bf6.angles;
			var_3c8e8a80 = spawnstruct();
			var_3c8e8a80.weapon_instance = weapon_instance;
			var_3c8e8a80.var_c98531e5 = var_c98531e5;
			owner function_6e082c55(var_3c8e8a80);
			if(!isdefined(var_a8539bf6.var_6a698b3c))
			{
				var_a8539bf6.var_6a698b3c = [];
			}
			else if(!isarray(var_a8539bf6.var_6a698b3c))
			{
				var_a8539bf6.var_6a698b3c = array(var_a8539bf6.var_6a698b3c);
			}
			var_a8539bf6.var_6a698b3c[var_a8539bf6.var_6a698b3c.size] = weapon_instance;
			arrayremovevalue(var_a8539bf6.var_6a698b3c, undefined);
		}
	}
	else
	{
		/#
			function_50939dbe(("" + owner.m_name) + "");
		#/
	}
	return owner;
}

/*
	Name: function_612e5ef9
	Namespace: traps_deployable
	Checksum: 0xB5026CCB
	Offset: 0x2EE8
	Size: 0xB8
	Parameters: 3
	Flags: None
*/
function function_612e5ef9(var_3af54106, owner, team)
{
	var_a8539bf6 = self;
	vehicle = turret_activate(var_3af54106, owner, team, undefined, var_a8539bf6.origin, var_a8539bf6.angles, undefined);
	if(isdefined(vehicle))
	{
		var_3c8e8a80 = spawnstruct();
		var_3c8e8a80.var_71676691 = vehicle;
		var_3af54106 function_6e082c55(var_3c8e8a80);
	}
	return var_3af54106;
}

/*
	Name: function_a39b7bb6
	Namespace: traps_deployable
	Checksum: 0x79090D70
	Offset: 0x2FA8
	Size: 0xF8
	Parameters: 1
	Flags: None
*/
function function_a39b7bb6(placeable)
{
	player = self;
	var_3af54106 = placeable.var_3af54106;
	placeable.vehicle = player turret_activate(var_3af54106, player, player.team, placeable.vehicle, placeable.origin, placeable.angles, placeable);
	if(isdefined(placeable.vehicle))
	{
		placeable.vehicle thread util::ghost_wait_show(0.05);
		var_3c8e8a80 = spawnstruct();
		var_3c8e8a80.var_71676691 = placeable.vehicle;
		var_3c8e8a80.var_cea6a2fb = placeable;
		var_3af54106 function_6e082c55(var_3c8e8a80);
	}
	return var_3af54106;
}

/*
	Name: turret_activate
	Namespace: traps_deployable
	Checksum: 0x1F0BBE2B
	Offset: 0x30A8
	Size: 0x3F0
	Parameters: 7
	Flags: None
*/
function turret_activate(var_3af54106, owner, team, vehicle, origin, angles, parent)
{
	if(isdefined(vehicle))
	{
		vehicle.origin = origin;
		vehicle.angles = angles;
		if(vehicle vehicle_ai::has_state("unaware"))
		{
			vehicle vehicle_ai::set_state("unaware");
		}
	}
	else
	{
		vehicle = spawnvehicle(var_3af54106.m_vehicle, origin, angles, "dynamic_spawn_ai");
		if(isdefined(owner))
		{
			ownerteam = owner.team;
			vehicle.owner = owner;
			vehicle.ownerentnum = owner.entnum;
			if(isplayer(owner))
			{
				vehicle setowner(owner);
			}
		}
		if(!isdefined(team))
		{
			team = ownerteam;
		}
		if(isdefined(team))
		{
			vehicle.team = team;
			vehicle setteam(team);
		}
		vehicle.parentstruct = parent;
		vehicle.controlled = 0;
		vehicle.treat_owner_damage_as_friendly_fire = 1;
		vehicle.ignore_team_kills = 1;
		vehicle.deal_no_crush_damage = 1;
		if(isdefined(vehicle.parentstruct) && is_true(vehicle.parentstruct.is_placeable))
		{
			vehicle thread function_da421875(vehicle.parentstruct);
		}
	}
	if(is_true(vehicle.settings.var_d3cc01c7) && !is_true(vehicle.var_fcb567c8))
	{
		if(!isdefined(level.var_c70c6768))
		{
			level.var_c70c6768 = 0;
		}
		else
		{
			level.var_c70c6768 = level.var_c70c6768 + 1;
		}
		vehicle.turret_id = string(level.var_c70c6768);
		badplace_cylinder("turret_bad_place_" + vehicle.turret_id, 0, vehicle.origin, vehicle.settings.var_9493f6dc, vehicle.settings.var_c9c01aa4, #"axis", #"allies", #"neutral");
		vehicle.var_fcb567c8 = 1;
	}
	vehicle unlink();
	targetoffset = ((isdefined(vehicle.settings.lockon_offsetx) ? vehicle.settings.lockon_offsetx : 0), (isdefined(vehicle.settings.lockon_offsety) ? vehicle.settings.lockon_offsety : 0), (isdefined(vehicle.settings.lockon_offsetz) ? vehicle.settings.lockon_offsetz : 36));
	vehicle::make_targetable(vehicle, targetoffset);
	return vehicle;
}

/*
	Name: function_69efb3b0
	Namespace: traps_deployable
	Checksum: 0xCB561CFB
	Offset: 0x34A0
	Size: 0x12E
	Parameters: 1
	Flags: None
*/
function function_69efb3b0(placeable)
{
	player = self;
	if(isdefined(placeable.vehicle))
	{
		placeable.cancelable = 1;
		placeable.vehicle ghost();
		if(placeable.vehicle vehicle_ai::has_state("off"))
		{
			placeable.vehicle vehicle_ai::set_state("off");
		}
		placeable.vehicle linkto(placeable);
		target_remove(placeable.vehicle);
		if(is_true(placeable.vehicle.var_fcb567c8))
		{
			badplace_delete("turret_bad_place_" + placeable.vehicle.turret_id);
			placeable.vehicle.var_fcb567c8 = 0;
		}
	}
}

/*
	Name: function_5c1d01
	Namespace: traps_deployable
	Checksum: 0x4302CEF2
	Offset: 0x35D8
	Size: 0xB8
	Parameters: 3
	Flags: None
*/
function function_5c1d01(var_3af54106, owner, team)
{
	var_a8539bf6 = self;
	vehicle = vehicle_activate(var_3af54106, owner, team, undefined, var_a8539bf6.origin, var_a8539bf6.angles, undefined);
	if(isdefined(vehicle))
	{
		var_3c8e8a80 = spawnstruct();
		var_3c8e8a80.var_71676691 = vehicle;
		var_3af54106 function_6e082c55(var_3c8e8a80);
	}
	return var_3af54106;
}

/*
	Name: function_c66a11d0
	Namespace: traps_deployable
	Checksum: 0x78E60A06
	Offset: 0x3698
	Size: 0xD8
	Parameters: 3
	Flags: None
*/
function function_c66a11d0(var_3af54106, origin, angles)
{
	player = self;
	if(!isdefined(origin))
	{
		origin = player.origin;
	}
	if(!isdefined(angles))
	{
		angles = player.angles;
	}
	vehicle = vehicle_activate(var_3af54106, player, player.team, undefined, origin, angles, undefined);
	if(isdefined(vehicle))
	{
		var_3c8e8a80 = spawnstruct();
		var_3c8e8a80.var_71676691 = vehicle;
		var_3af54106 function_6e082c55(var_3c8e8a80);
	}
	return var_3af54106;
}

/*
	Name: vehicle_activate
	Namespace: traps_deployable
	Checksum: 0x510CBE7B
	Offset: 0x3778
	Size: 0x290
	Parameters: 7
	Flags: None
*/
function vehicle_activate(var_3af54106, owner, team, vehicle, origin, angles, parent)
{
	if(isdefined(vehicle))
	{
		vehicle.origin = origin;
		vehicle.angles = angles;
	}
	else
	{
		vehicle = spawnvehicle(var_3af54106.m_vehicle, origin, angles, "dynamic_spawn_ai");
		if(isdefined(owner))
		{
			ownerteam = owner.team;
			vehicle.owner = owner;
			vehicle.ownerentnum = owner.entnum;
			if(isplayer(owner))
			{
				vehicle setowner(owner);
			}
		}
		if(!isdefined(team))
		{
			team = ownerteam;
		}
		if(isdefined(team))
		{
			vehicle.team = team;
			vehicle setteam(team);
		}
		vehicle.parentstruct = parent;
		vehicle.controlled = 0;
		vehicle.treat_owner_damage_as_friendly_fire = 1;
		vehicle.ignore_team_kills = 1;
		vehicle.deal_no_crush_damage = 1;
		if(isdefined(vehicle.parentstruct) && is_true(vehicle.parentstruct.is_placeable))
		{
			vehicle thread function_da421875(vehicle.parentstruct);
		}
	}
	vehicle unlink();
	targetoffset = ((isdefined(vehicle.settings.lockon_offsetx) ? vehicle.settings.lockon_offsetx : 0), (isdefined(vehicle.settings.lockon_offsety) ? vehicle.settings.lockon_offsety : 0), (isdefined(vehicle.settings.lockon_offsetz) ? vehicle.settings.lockon_offsetz : 0));
	vehicle::make_targetable(vehicle, targetoffset);
	return vehicle;
}

/*
	Name: function_deb3cb22
	Namespace: traps_deployable
	Checksum: 0x80F724D1
	Offset: 0x3A10
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_deb3cb22()
{
}

/*
	Name: function_51d36222
	Namespace: traps_deployable
	Checksum: 0x80F724D1
	Offset: 0x3A20
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_51d36222()
{
}

/*
	Name: function_ad3a08af
	Namespace: traps_deployable
	Checksum: 0x96A768CC
	Offset: 0x3A30
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_ad3a08af()
{
	var_3c8e8a80 = self;
	if(!isdefined(var_3c8e8a80))
	{
		return;
	}
	if(isdefined(var_3c8e8a80.weapon_instance))
	{
		if(isdefined(var_3c8e8a80.var_c98531e5))
		{
			var_3c8e8a80.var_c98531e5 weaponobjects::waitandfizzleout(var_3c8e8a80.weapon_instance, 0.1);
		}
		else
		{
			var_3c8e8a80.weapon_instance delete();
		}
	}
	if(isdefined(var_3c8e8a80.var_71676691))
	{
		var_3c8e8a80.var_71676691 delete();
	}
	if(isdefined(var_3c8e8a80.var_cea6a2fb))
	{
		var_3c8e8a80.var_cea6a2fb placeables::forceshutdown();
	}
}

/*
	Name: function_96155e4f
	Namespace: traps_deployable
	Checksum: 0x2813FC7D
	Offset: 0x3B10
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_96155e4f()
{
	mdl_gameobject = self;
	if(!isdefined(mdl_gameobject))
	{
		return;
	}
	mdl_gameobject gameobjects::destroy_object(1, 1);
}

/*
	Name: function_64590698
	Namespace: traps_deployable
	Checksum: 0x73DE860D
	Offset: 0x3B58
	Size: 0x30C
	Parameters: 3
	Flags: None
*/
function function_64590698(all, skipto, flag)
{
	if(!isdefined(skipto))
	{
		skipto = undefined;
	}
	if(!isdefined(flag))
	{
		flag = undefined;
	}
	if(all)
	{
		level notify(#"hash_6bd910abadea6345");
	}
	if(isdefined(skipto))
	{
		players = getplayers();
		foreach(player in players)
		{
			if(isdefined(player.var_5e7ffbf9))
			{
				player.var_5e7ffbf9.var_18bbaaf9 = undefined;
			}
		}
	}
	if(isdefined(level.var_5e7ffbf9) && isdefined(level.var_5e7ffbf9.var_1d76a8c4))
	{
		var_1d76a8c4 = level.var_5e7ffbf9.var_1d76a8c4;
		for(i = var_1d76a8c4.size - 1; i >= 0; i--)
		{
			if(isdefined(var_1d76a8c4[i]))
			{
				var_3c8e8a80 = var_1d76a8c4[i];
				if(all || (isdefined(skipto) && var_3c8e8a80.var_5b026504 === skipto) || (isdefined(flag) && var_3c8e8a80.var_ef146db5 === flag))
				{
					var_3c8e8a80 function_ad3a08af();
					arrayremoveindex(var_1d76a8c4, i);
				}
			}
		}
	}
	if(isdefined(level.var_5e7ffbf9) && isdefined(level.var_5e7ffbf9.var_9afef5eb))
	{
		var_18d5323c = level.var_5e7ffbf9.var_9afef5eb;
		for(i = var_18d5323c.size - 1; i >= 0; i--)
		{
			if(isdefined(var_18d5323c[i]))
			{
				mdl_gameobject = var_18d5323c[i];
				if(all || (isdefined(skipto) && mdl_gameobject.var_5b026504 === skipto) || (isdefined(flag) && mdl_gameobject.var_ef146db5 === flag))
				{
					mdl_gameobject function_96155e4f();
					arrayremoveindex(var_18d5323c, i);
				}
			}
		}
	}
}

/*
	Name: function_8f66239f
	Namespace: traps_deployable
	Checksum: 0x97A273A3
	Offset: 0x3E70
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_8f66239f(flags)
{
	if(isdefined(flags) && flags != "")
	{
		var_bb7aa074 = util::create_flags_and_return_tokens(flags);
		for(i = 0; i < var_bb7aa074.size; i++)
		{
			flag = var_bb7aa074[i];
			level thread function_f6ea9af9(flag);
		}
	}
}

/*
	Name: function_f6ea9af9
	Namespace: traps_deployable
	Checksum: 0x209A89B6
	Offset: 0x3F10
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function function_f6ea9af9(flag)
{
	level endon(#"hash_6bd910abadea6345");
	level notify(("traps_clean" + "_") + flag);
	level endon(("traps_clean" + "_") + flag);
	level flag::wait_till(flag);
	function_64590698(0, undefined, flag);
}

/*
	Name: function_50939dbe
	Namespace: traps_deployable
	Checksum: 0x2BE54C9D
	Offset: 0x3FA8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_50939dbe(message)
{
	/#
		println("", message);
	#/
}

/*
	Name: function_1fefac6d
	Namespace: traps_deployable
	Checksum: 0x5DD660CB
	Offset: 0x3FE0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_1fefac6d(message)
{
	/#
		println("", message);
	#/
}

/*
	Name: function_ef942626
	Namespace: traps_deployable
	Checksum: 0x341BEDFF
	Offset: 0x4018
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function function_ef942626()
{
	/#
		if(is_true(level.var_d39c38bf))
		{
			var_a8539bf6 = self;
			if(!isdefined(level.var_d56d2937))
			{
				level.var_d56d2937 = spawnstruct();
			}
			if(!isdefined(level.var_d56d2937.var_59eaf9e1))
			{
				level.var_d56d2937.var_59eaf9e1 = [];
			}
			if(!isdefined(level.var_d56d2937.var_59eaf9e1))
			{
				level.var_d56d2937.var_59eaf9e1 = [];
			}
			else if(!isarray(level.var_d56d2937.var_59eaf9e1))
			{
				level.var_d56d2937.var_59eaf9e1 = array(level.var_d56d2937.var_59eaf9e1);
			}
			level.var_d56d2937.var_59eaf9e1[level.var_d56d2937.var_59eaf9e1.size] = var_a8539bf6;
		}
	#/
}

/*
	Name: function_3b7cb719
	Namespace: traps_deployable
	Checksum: 0x921B8CB
	Offset: 0x4158
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_3b7cb719()
{
	/#
		level.var_d39c38bf = getdvarint(#"hash_419d8c0b944095dd", 0);
		while(true)
		{
			var_d39c38bf = level.var_d39c38bf;
			level.var_d39c38bf = getdvarint(#"hash_419d8c0b944095dd", 0);
			if(!var_d39c38bf === level.var_d39c38bf)
			{
				function_ea252b49();
				waitframe(1);
				function_5726a711();
			}
			wait(1);
		}
	#/
}

/*
	Name: function_ea252b49
	Namespace: traps_deployable
	Checksum: 0xCC1BD9F8
	Offset: 0x4228
	Size: 0x19C
	Parameters: 0
	Flags: None
*/
function function_ea252b49()
{
	/#
		if(isdefined(level.var_d56d2937) && isdefined(level.var_d56d2937.var_59eaf9e1))
		{
			var_59eaf9e1 = level.var_d56d2937.var_59eaf9e1;
			for(i = var_59eaf9e1.size - 1; i >= 0; i--)
			{
				if(isdefined(var_59eaf9e1[i]))
				{
					var_5e63b00d = var_59eaf9e1[i];
					if(isdefined(var_5e63b00d.script_flag_true))
					{
						tokens = util::create_flags_and_return_tokens(var_5e63b00d.script_flag_true);
						for(j = 0; j < tokens.size; j++)
						{
							level flag::clear(tokens[j]);
						}
					}
					if(isdefined(var_5e63b00d.script_flag_false))
					{
						tokens = util::create_flags_and_return_tokens(var_5e63b00d.script_flag_false);
						for(j = 0; j < tokens.size; j++)
						{
							level flag::clear(tokens[j]);
						}
					}
				}
				arrayremoveindex(var_59eaf9e1, i);
			}
		}
		function_64590698(1);
	#/
}

/*
	Name: debug_init
	Namespace: traps_deployable
	Checksum: 0x80C0CCBE
	Offset: 0x43D0
	Size: 0x10C
	Parameters: 0
	Flags: None
*/
function debug_init()
{
	/#
		thread function_3b7cb719();
		while(true)
		{
			var_44bbbbaa = getdvarint(#"hash_55b539be24d96c53", 0);
			if(var_44bbbbaa)
			{
				switch(var_44bbbbaa)
				{
					case 1:
					{
						if(is_true(level.var_d39c38bf))
						{
							function_ea252b49();
							waitframe(1);
							function_5726a711();
						}
						break;
					}
				}
				setdvar(#"hash_55b539be24d96c53", 0);
			}
			wait(1);
		}
		thread debug_init();
	#/
}

