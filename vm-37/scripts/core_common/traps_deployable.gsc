#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\trapd.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\placeables.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

class class_7b5e0861 
{
	var m_health;
	var m_name;

	/*
		Name: constructor
		Namespace: namespace_7b5e0861
		Checksum: 0x80F724D1
		Offset: 0x44C8
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
		Checksum: 0x7295AA4D
		Offset: 0x44D8
		Size: 0x4C
		Parameters: 0
		Flags: 16
	*/
	destructor()
	{
		/#
			if(is_true(level.trapddebug))
			{
				iprintlnbold("" + m_name);
			}
		#/
	}

	/*
		Name: function_8df621c
		Namespace: namespace_7b5e0861
		Checksum: 0xD2DBCE64
		Offset: 0x4530
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
		self.m_spawnsentity = bundle.spawnsentity;
		self.var_656cbe2d = bundle.var_28bb5240;
		self.m_timeout = bundle.timeout;
		self.m_health = bundle.health;
		if(isdefined(m_health))
		{
			self.var_c59ba447 = m_health - (int(m_health / 3));
		}
		self.m_empdamage = bundle.empdamage;
		self.var_f81e0192 = bundle.var_980063fb;
		self.var_b4662b52 = bundle.var_6e2ae4a5;
		self.m_placeimmediately = bundle.placeimmediately;
		self.var_31e7e66a = bundle.var_d6011052;
		self.var_3efa7c17 = var_a8539bf6;
	}

}

#namespace traps_deployable;

/*
	Name: __init__system__
	Namespace: traps_deployable
	Checksum: 0x26ED949F
	Offset: 0x270
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"traps_deployable", &function_70a657d8, undefined, undefined, #"load");
}

/*
	Name: function_70a657d8
	Namespace: traps_deployable
	Checksum: 0xE0EB2D34
	Offset: 0x2C0
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
	Checksum: 0x36A83C2E
	Offset: 0x300
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	if(!isdefined(level._traps_deployable))
	{
		return;
	}
	player = self;
	player owner_init();
}

/*
	Name: owner_init
	Namespace: traps_deployable
	Checksum: 0xA4AFED3
	Offset: 0x348
	Size: 0x62
	Parameters: 0
	Flags: None
*/
function owner_init()
{
	owner = self;
	if(!isdefined(owner._traps_deployable))
	{
		owner._traps_deployable = spawnstruct();
	}
	if(!isdefined(owner._traps_deployable.watchers_init))
	{
		owner._traps_deployable.watchers_init = [];
	}
}

/*
	Name: function_18bbaaf9
	Namespace: traps_deployable
	Checksum: 0x3E34E797
	Offset: 0x3B8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_18bbaaf9()
{
	return isdefined(self._traps_deployable) && is_true(self._traps_deployable.var_18bbaaf9);
}

/*
	Name: init_traps
	Namespace: traps_deployable
	Checksum: 0x4FF4074C
	Offset: 0x3F8
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
	Checksum: 0x4BD1937F
	Offset: 0x430
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
					printerror("" + var_5e63b00d.scriptbundlename);
				#/
			}
			continue;
		}
		/#
			printerror("");
		#/
	}
}

/*
	Name: register_trap
	Namespace: traps_deployable
	Checksum: 0xC0207870
	Offset: 0x780
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
					printerror("");
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
		printerror("");
	#/
	return false;
}

/*
	Name: function_cf4b6e75
	Namespace: traps_deployable
	Checksum: 0x98DA3C7E
	Offset: 0xB38
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
			printinfo("" + var_2d727ba0.name);
		#/
		return true;
	}
	/#
		printerror("");
	#/
	return false;
}

/*
	Name: function_19e12558
	Namespace: traps_deployable
	Checksum: 0xDF7839D5
	Offset: 0xC08
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
	Checksum: 0x7DA7580F
	Offset: 0xE00
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
		printinfo("" + type);
	#/
}

/*
	Name: function_77a3b730
	Namespace: traps_deployable
	Checksum: 0x6B8FE2DF
	Offset: 0xF50
	Size: 0x50
	Parameters: 1
	Flags: None
*/
function function_77a3b730(type)
{
	return isdefined(level._traps_deployable) && isdefined(level._traps_deployable.traptypes) && isdefined(level._traps_deployable.traptypes[type]);
}

/*
	Name: function_422733d9
	Namespace: traps_deployable
	Checksum: 0xBB080FDA
	Offset: 0xFA8
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function function_422733d9(type)
{
	if(!isdefined(level._traps_deployable))
	{
		level._traps_deployable = spawnstruct();
	}
	if(!isdefined(level._traps_deployable.traptypes))
	{
		level._traps_deployable.traptypes = [];
	}
	if(!isdefined(level._traps_deployable.traptypes[type]))
	{
		level._traps_deployable.traptypes[type] = spawnstruct();
	}
}

/*
	Name: add_callback
	Namespace: traps_deployable
	Checksum: 0x478656FE
	Offset: 0x1050
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
			level._traps_deployable.traptypes[type].(callbackname) = callbackfunc;
		}
	}
}

/*
	Name: function_1abc0efa
	Namespace: traps_deployable
	Checksum: 0xBA760828
	Offset: 0x10C8
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
	Checksum: 0x59B17DD3
	Offset: 0x1108
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
	Checksum: 0xF00D2269
	Offset: 0x1148
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
	Checksum: 0x7D6DAA95
	Offset: 0x1188
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
	Checksum: 0x1AD93C88
	Offset: 0x11C8
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
	Checksum: 0xBCBC902D
	Offset: 0x1208
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
	Checksum: 0x61B49621
	Offset: 0x1248
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
	Checksum: 0xFD9301F7
	Offset: 0x1288
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
	Checksum: 0x2238AD73
	Offset: 0x12E0
	Size: 0x16A
	Parameters: 2
	Flags: None
*/
function function_51ca9c38(origin, team)
{
	actorteam = team;
	if(actorteam == #"any")
	{
		actorteam = "all";
	}
	owners = getactorteamarray(actorteam);
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
	Checksum: 0x74504C92
	Offset: 0x1458
	Size: 0xB8
	Parameters: 1
	Flags: None
*/
function function_6153484f(team)
{
	if(!isdefined(level._traps_deployable.team_owners))
	{
		level._traps_deployable.team_owners = [];
	}
	if(!isdefined(level._traps_deployable.team_owners[team]))
	{
		level._traps_deployable.team_owners[team] = spawn("script_origin", (0, 0, 0));
	}
	level._traps_deployable.team_owners[team].team = team;
	return level._traps_deployable.team_owners[team];
}

/*
	Name: function_69996073
	Namespace: traps_deployable
	Checksum: 0x7D1C8C02
	Offset: 0x1518
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_69996073(var_3af54106)
{
	var_5e63b00d = self;
	var_5e63b00d.var_a8539bf6.mdl_gameobject endon(#"destroyed_complete", #"death");
	var_5e63b00d flag::function_5f02becb();
	teamowner = undefined;
	team = util::get_team_mapping(var_5e63b00d.var_a8539bf6.team);
	if(team == #"any")
	{
		var_db4c606e = function_51ca9c38(var_5e63b00d.var_a8539bf6.origin, team);
		team = var_db4c606e.team;
	}
	teamowner = function_6153484f(team);
	var_5e63b00d.var_a8539bf6 thread function_186e3cc4(var_3af54106, teamowner, team);
}

/*
	Name: function_8ecf6615
	Namespace: traps_deployable
	Checksum: 0x1A085A96
	Offset: 0x1648
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
	teamowner = waitresult.owner;
	team = waitresult.team;
	if(!isdefined(teamowner) || !isplayer(teamowner))
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
		teamowner = function_6153484f(team);
	}
	var_5e63b00d.var_a8539bf6 thread function_186e3cc4(var_3af54106, teamowner, team);
}

/*
	Name: function_186e3cc4
	Namespace: traps_deployable
	Checksum: 0xE456767
	Offset: 0x17C8
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
		if(isdefined(owner._traps_deployable.var_1b518274))
		{
			while(owner._traps_deployable.var_1b518274 == time)
			{
				waitframe(1);
				if(!isdefined(owner))
				{
					/#
						printerror(("" + var_3af54106.m_name) + "");
					#/
					return;
				}
				time = gettime();
			}
		}
		owner._traps_deployable.var_1b518274 = time;
		if(function_77a3b730(type) && isdefined(level._traps_deployable.traptypes[type].onautoactivatetrap))
		{
			tracktrap = var_a8539bf6 [[level._traps_deployable.traptypes[type].onautoactivatetrap]](var_3af54106, owner, team);
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
			printerror(("" + var_3af54106.m_name) + "");
		#/
	}
}

/*
	Name: activate_trap
	Namespace: traps_deployable
	Checksum: 0x6E23BB
	Offset: 0x19A0
	Size: 0x104
	Parameters: 3
	Flags: None
*/
function activate_trap(var_3af54106, origin, angles)
{
	player = self;
	type = var_3af54106.m_type;
	player owner_init();
	self._traps_deployable.var_18bbaaf9 = 1;
	if(function_77a3b730(type) && isdefined(level._traps_deployable.traptypes[type].onactivatetrap))
	{
		player [[level._traps_deployable.traptypes[type].onactivatetrap]](var_3af54106, origin, angles);
	}
	else
	{
		/#
			printerror(("" + var_3af54106.m_name) + "");
		#/
	}
}

/*
	Name: track_trap
	Namespace: traps_deployable
	Checksum: 0x609934F1
	Offset: 0x1AB0
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function track_trap(trap_instance)
{
	var_3af54106 = self;
	if(!isdefined(level._traps_deployable.trap_instances))
	{
		level._traps_deployable.trap_instances = [];
	}
	if(isdefined(trap_instance))
	{
		if(isdefined(var_3af54106.var_3efa7c17.var_5b026504))
		{
			trap_instance.var_5b026504 = var_3af54106.var_3efa7c17.var_5b026504;
		}
		if(isdefined(var_3af54106.var_3efa7c17.var_ef146db5))
		{
			trap_instance.var_ef146db5 = var_3af54106.var_3efa7c17.var_ef146db5;
		}
		if(!isdefined(level._traps_deployable.trap_instances))
		{
			level._traps_deployable.trap_instances = [];
		}
		else if(!isarray(level._traps_deployable.trap_instances))
		{
			level._traps_deployable.trap_instances = array(level._traps_deployable.trap_instances);
		}
		level._traps_deployable.trap_instances[level._traps_deployable.trap_instances.size] = trap_instance;
	}
}

/*
	Name: function_94e3167b
	Namespace: traps_deployable
	Checksum: 0xFCB3DEE8
	Offset: 0x1C18
	Size: 0x15C
	Parameters: 1
	Flags: None
*/
function function_94e3167b(mdl_gameobject)
{
	var_3af54106 = self;
	if(!isdefined(level._traps_deployable.var_9afef5eb))
	{
		level._traps_deployable.var_9afef5eb = [];
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
		if(!isdefined(level._traps_deployable.var_9afef5eb))
		{
			level._traps_deployable.var_9afef5eb = [];
		}
		else if(!isarray(level._traps_deployable.var_9afef5eb))
		{
			level._traps_deployable.var_9afef5eb = array(level._traps_deployable.var_9afef5eb);
		}
		level._traps_deployable.var_9afef5eb[level._traps_deployable.var_9afef5eb.size] = mdl_gameobject;
	}
}

/*
	Name: function_c26db3e
	Namespace: traps_deployable
	Checksum: 0x9FC7C2FB
	Offset: 0x1D80
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
	Checksum: 0x3E9DE9C5
	Offset: 0x1DA8
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
	Checksum: 0xD79CEA9E
	Offset: 0x1DC0
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
	Checksum: 0xD34B4DC1
	Offset: 0x1DD8
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
		onmovecallback = level._traps_deployable.traptypes[type].onmovecallback;
		if(angles.var_31e7e66a === 1)
		{
			onmovecallback = undefined;
		}
		if(isdefined(angles.m_weapon) && angles.m_weapon.deployable)
		{
			player function_e4fd9a4c(angles);
			placeable = player placeables::function_f872b831(level._traps_deployable.traptypes[type].onplacecallback, level._traps_deployable.traptypes[type].oncancelcallback, onmovecallback, level._traps_deployable.traptypes[type].onshutdowncallback, level._traps_deployable.traptypes[type].ondeathcallback, level._traps_deployable.traptypes[type].onempcallback, level._traps_deployable.traptypes[type].ondamagecallback, level._traps_deployable.traptypes[type].var_d0dd7e76, &function_c26db3e, angles.m_weapon, angles.var_656cbe2d, angles.var_f81e0192, angles.var_b4662b52, angles.m_timeout);
			placeable.var_3af54106 = angles;
			placeable.is_placeable = 1;
			placeable.var_25404db4 = 1;
			placeable placeables::function_613a226a(1);
		}
		else
		{
			placeable = player placeables::spawnplaceable(level._traps_deployable.traptypes[type].onplacecallback, level._traps_deployable.traptypes[type].oncancelcallback, onmovecallback, level._traps_deployable.traptypes[type].onshutdowncallback, level._traps_deployable.traptypes[type].ondeathcallback, level._traps_deployable.traptypes[type].onempcallback, level._traps_deployable.traptypes[type].ondamagecallback, level._traps_deployable.traptypes[type].var_d0dd7e76, angles.m_model, angles.var_e84fc5dc, angles.var_28f1ce55, angles.m_spawnsentity, angles.var_656cbe2d, angles.m_timeout, angles.m_health, angles.m_empdamage, angles.var_f81e0192, angles.var_b4662b52, angles.m_placeimmediately, level._traps_deployable.traptypes[type].damagewrapper);
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
	Checksum: 0x7D8F2A0E
	Offset: 0x21B8
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
	Checksum: 0xBE266E71
	Offset: 0x2208
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
	Checksum: 0x27B3F2D
	Offset: 0x2298
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
	Checksum: 0x22D5B84
	Offset: 0x22F8
	Size: 0x58
	Parameters: 3
	Flags: None
*/
function function_efe68db2(var_3af54106, owner, team)
{
	var_a8539bf6 = self;
	/#
		printerror("" + var_a8539bf6.scriptbundlename);
	#/
	return team;
}

/*
	Name: function_6ef47474
	Namespace: traps_deployable
	Checksum: 0x80F724D1
	Offset: 0x2358
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
	Checksum: 0x37962734
	Offset: 0x2368
	Size: 0x74
	Parameters: 4
	Flags: None
*/
function function_a21e6a22(damagecallback, destroyedcallback, var_1891d3cd, var_2053fdc6)
{
	placeable = self;
	placeable function_b501ff0b(damagecallback, destroyedcallback, var_1891d3cd, var_2053fdc6);
	placeable thread function_59a79a68(placeable.var_3af54106, damagecallback, destroyedcallback, var_1891d3cd, var_2053fdc6);
}

/*
	Name: function_b501ff0b
	Namespace: traps_deployable
	Checksum: 0x37DD8B92
	Offset: 0x23E8
	Size: 0x8C
	Parameters: 4
	Flags: None
*/
function function_b501ff0b(damagecallback, destroyedcallback, var_1891d3cd, var_2053fdc6)
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
	Checksum: 0x49405D9D
	Offset: 0x2480
	Size: 0x44E
	Parameters: 5
	Flags: None
*/
function function_59a79a68(var_3af54106, damage_callback, destroyed_callback, emp_damage, emp_callback)
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
			emp_damage_to_apply = damage_callback.m_empdamage;
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
	Checksum: 0x1042FCAC
	Offset: 0x28D8
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
	Checksum: 0xE1AF3D17
	Offset: 0x2920
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
	Checksum: 0x5E3BF2B3
	Offset: 0x2988
	Size: 0x1C8
	Parameters: 1
	Flags: None
*/
function watcher_init(var_3af54106)
{
	owner = self;
	var_c29551e1 = var_3af54106.m_weapon.name;
	var_c98531e5 = undefined;
	if(!is_true(owner._traps_deployable.watchers_init[var_c29551e1]))
	{
		type = var_3af54106.m_type;
		if(type == "claymore")
		{
			var_c98531e5 = owner weaponobjects::createwatcher(var_c29551e1, &trapd::function_ae7e49da, 0);
		}
		else
		{
			if(type == "flash_disruptor")
			{
				var_c98531e5 = owner weaponobjects::createwatcher(var_c29551e1, &trapd::function_d8d3b49b, 0);
			}
			else
			{
				if(type == "fire_bomb")
				{
					var_c98531e5 = owner weaponobjects::createwatcher(var_c29551e1, &trapd::function_518130e, 0);
				}
				else
				{
					var_c98531e5 = owner weaponobjects::createwatcher(var_c29551e1, &trapd::function_1daa29fc, 0);
				}
			}
		}
		owner._traps_deployable.watchers_init[var_c29551e1] = 1;
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
	Checksum: 0x4A9896F5
	Offset: 0x2B58
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
			trap_instance = spawnstruct();
			trap_instance.var_c98531e5 = var_c98531e5;
			trap_instance.weapon_instance = placeable.weapon_instance;
			var_3af54106 track_trap(trap_instance);
			player function_c75a9937(placeable);
		}
	}
	return var_3af54106;
}

/*
	Name: function_4a401677
	Namespace: traps_deployable
	Checksum: 0x28DBF0B
	Offset: 0x2CA8
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
			trap_instance = spawnstruct();
			trap_instance.weapon_instance = weapon_instance;
			trap_instance.var_c98531e5 = var_c98531e5;
			owner track_trap(trap_instance);
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
			printerror(("" + owner.m_name) + "");
		#/
	}
	return owner;
}

/*
	Name: function_612e5ef9
	Namespace: traps_deployable
	Checksum: 0x2774BC2A
	Offset: 0x2EC8
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
		trap_instance = spawnstruct();
		trap_instance.var_71676691 = vehicle;
		var_3af54106 track_trap(trap_instance);
	}
	return var_3af54106;
}

/*
	Name: function_a39b7bb6
	Namespace: traps_deployable
	Checksum: 0x29EEE8E4
	Offset: 0x2F88
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
		trap_instance = spawnstruct();
		trap_instance.var_71676691 = placeable.vehicle;
		trap_instance.var_cea6a2fb = placeable;
		var_3af54106 track_trap(trap_instance);
	}
	return var_3af54106;
}

/*
	Name: turret_activate
	Namespace: traps_deployable
	Checksum: 0x9202AFDE
	Offset: 0x3088
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
	if(is_true(vehicle.settings.var_d3cc01c7) && !is_true(vehicle.has_bad_place))
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
		vehicle.has_bad_place = 1;
	}
	vehicle unlink();
	targetoffset = ((isdefined(vehicle.settings.lockon_offsetx) ? vehicle.settings.lockon_offsetx : 0), (isdefined(vehicle.settings.lockon_offsety) ? vehicle.settings.lockon_offsety : 0), (isdefined(vehicle.settings.lockon_offsetz) ? vehicle.settings.lockon_offsetz : 36));
	vehicle::make_targetable(vehicle, targetoffset);
	return vehicle;
}

/*
	Name: function_69efb3b0
	Namespace: traps_deployable
	Checksum: 0xADBFA66E
	Offset: 0x3480
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
		if(is_true(placeable.vehicle.has_bad_place))
		{
			badplace_delete("turret_bad_place_" + placeable.vehicle.turret_id);
			placeable.vehicle.has_bad_place = 0;
		}
	}
}

/*
	Name: function_5c1d01
	Namespace: traps_deployable
	Checksum: 0xDC46BEC9
	Offset: 0x35B8
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
		trap_instance = spawnstruct();
		trap_instance.var_71676691 = vehicle;
		var_3af54106 track_trap(trap_instance);
	}
	return var_3af54106;
}

/*
	Name: function_c66a11d0
	Namespace: traps_deployable
	Checksum: 0x469AD481
	Offset: 0x3678
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
		trap_instance = spawnstruct();
		trap_instance.var_71676691 = vehicle;
		var_3af54106 track_trap(trap_instance);
	}
	return var_3af54106;
}

/*
	Name: vehicle_activate
	Namespace: traps_deployable
	Checksum: 0xA102ED2A
	Offset: 0x3758
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
	Offset: 0x39F0
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
	Offset: 0x3A00
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
	Checksum: 0x7F37D0AA
	Offset: 0x3A10
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function function_ad3a08af()
{
	trap_instance = self;
	if(!isdefined(trap_instance))
	{
		return;
	}
	if(isdefined(trap_instance.weapon_instance))
	{
		if(isdefined(trap_instance.var_c98531e5))
		{
			trap_instance.var_c98531e5 weaponobjects::waitandfizzleout(trap_instance.weapon_instance, 0.1);
		}
		else
		{
			trap_instance.weapon_instance delete();
		}
	}
	if(isdefined(trap_instance.var_71676691))
	{
		trap_instance.var_71676691 delete();
	}
	if(isdefined(trap_instance.var_cea6a2fb))
	{
		trap_instance.var_cea6a2fb placeables::forceshutdown();
	}
}

/*
	Name: function_96155e4f
	Namespace: traps_deployable
	Checksum: 0x748ED8B1
	Offset: 0x3AF0
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
	Name: clean_traps
	Namespace: traps_deployable
	Checksum: 0x69196CBE
	Offset: 0x3B38
	Size: 0x30C
	Parameters: 3
	Flags: None
*/
function clean_traps(all, skipto, flag)
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
			if(isdefined(player._traps_deployable))
			{
				player._traps_deployable.var_18bbaaf9 = undefined;
			}
		}
	}
	if(isdefined(level._traps_deployable) && isdefined(level._traps_deployable.trap_instances))
	{
		trap_instances = level._traps_deployable.trap_instances;
		for(i = trap_instances.size - 1; i >= 0; i--)
		{
			if(isdefined(trap_instances[i]))
			{
				trap_instance = trap_instances[i];
				if(all || (isdefined(skipto) && trap_instance.var_5b026504 === skipto) || (isdefined(flag) && trap_instance.var_ef146db5 === flag))
				{
					trap_instance function_ad3a08af();
					arrayremoveindex(trap_instances, i);
				}
			}
		}
	}
	if(isdefined(level._traps_deployable) && isdefined(level._traps_deployable.var_9afef5eb))
	{
		var_18d5323c = level._traps_deployable.var_9afef5eb;
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
	Checksum: 0xD25EED15
	Offset: 0x3E50
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
	Checksum: 0x151CFF93
	Offset: 0x3EF0
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
	clean_traps(0, undefined, flag);
}

/*
	Name: printerror
	Namespace: traps_deployable
	Checksum: 0x3CAC1299
	Offset: 0x3F88
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function printerror(message)
{
	/#
		println("", message);
	#/
}

/*
	Name: printinfo
	Namespace: traps_deployable
	Checksum: 0x6213829A
	Offset: 0x3FC0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function printinfo(message)
{
	/#
		println("", message);
	#/
}

/*
	Name: function_ef942626
	Namespace: traps_deployable
	Checksum: 0x727F75A7
	Offset: 0x3FF8
	Size: 0x134
	Parameters: 0
	Flags: None
*/
function function_ef942626()
{
	/#
		if(is_true(level.trapddebug))
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
	Checksum: 0x1A3FE0FB
	Offset: 0x4138
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function function_3b7cb719()
{
	/#
		level.trapddebug = getdvarint(#"scr_trapd_debug", 0);
		while(true)
		{
			trapddebug = level.trapddebug;
			level.trapddebug = getdvarint(#"scr_trapd_debug", 0);
			if(!trapddebug === level.trapddebug)
			{
				destroy_traps();
				waitframe(1);
				function_5726a711();
			}
			wait(1);
		}
	#/
}

/*
	Name: destroy_traps
	Namespace: traps_deployable
	Checksum: 0x949600
	Offset: 0x4208
	Size: 0x19C
	Parameters: 0
	Flags: None
*/
function destroy_traps()
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
		clean_traps(1);
	#/
}

/*
	Name: debug_init
	Namespace: traps_deployable
	Checksum: 0x7ED3D1AF
	Offset: 0x43B0
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
			debugint = getdvarint(#"scr_trapd_int", 0);
			if(debugint)
			{
				switch(debugint)
				{
					case 1:
					{
						if(is_true(level.trapddebug))
						{
							destroy_traps();
							waitframe(1);
							function_5726a711();
						}
						break;
					}
				}
				setdvar(#"scr_trapd_int", 0);
			}
			wait(1);
		}
		thread debug_init();
	#/
}

