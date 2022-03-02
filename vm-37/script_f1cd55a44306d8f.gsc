#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace emp;

/*
	Name: init_shared
	Namespace: emp
	Checksum: 0xDC7EDDC0
	Offset: 0x110
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	if(!isdefined(level.var_2d56b64c))
	{
		level.var_2d56b64c = {};
		clientfield::register("scriptmover", "emp_turret_init", 1, 1, "int", &emp_turret_init, 0, 0);
		clientfield::register("vehicle", "emp_turret_deploy", 1, 1, "int", &emp_turret_deploy_start, 0, 0);
		thread monitor_emp_killstreaks();
	}
}

/*
	Name: monitor_emp_killstreaks
	Namespace: emp
	Checksum: 0x349479C8
	Offset: 0x1D8
	Size: 0x1A8
	Parameters: 0
	Flags: None
*/
function monitor_emp_killstreaks()
{
	level endon(#"disconnect");
	if(!isdefined(level.emp_killstreaks))
	{
		level.emp_killstreaks = [];
	}
	for(;;)
	{
		has_at_least_one_active_enemy_turret = 0;
		arrayremovevalue(level.emp_killstreaks, undefined);
		local_players = getlocalplayers();
		foreach(local_player in local_players)
		{
			if(local_player function_21c0fa55() == 0)
			{
				continue;
			}
			closest_enemy_emp = get_closest_enemy_emp_killstreak(local_player);
			if(isdefined(closest_enemy_emp))
			{
				has_at_least_one_active_enemy_turret = 1;
				localclientnum = local_player getlocalclientnumber();
				update_distance_to_closest_emp(localclientnum, distance(local_player.origin, closest_enemy_emp.origin));
			}
		}
		wait((has_at_least_one_active_enemy_turret ? 0.1 : 0.7));
	}
}

/*
	Name: get_closest_enemy_emp_killstreak
	Namespace: emp
	Checksum: 0x698D51E1
	Offset: 0x388
	Size: 0x126
	Parameters: 1
	Flags: None
*/
function get_closest_enemy_emp_killstreak(local_player)
{
	closest_emp = undefined;
	closest_emp_distance_squared = 99999999;
	foreach(emp in level.emp_killstreaks)
	{
		if(emp.owner == local_player || !local_player util::isenemyteam(emp.team))
		{
			continue;
		}
		distance_squared = distancesquared(local_player.origin, emp.origin);
		if(distance_squared < closest_emp_distance_squared)
		{
			closest_emp = emp;
			closest_emp_distance_squared = distance_squared;
		}
	}
	return closest_emp;
}

/*
	Name: update_distance_to_closest_emp
	Namespace: emp
	Checksum: 0x8AC4C8E7
	Offset: 0x4B8
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function update_distance_to_closest_emp(localclientnum, new_value)
{
	if(!isdefined(localclientnum))
	{
		return;
	}
	distance_to_closest_enemy_emp_ui_model = getuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "distanceToClosestEnemyEmpKillstreak");
	if(isdefined(distance_to_closest_enemy_emp_ui_model))
	{
		setuimodelvalue(distance_to_closest_enemy_emp_ui_model, new_value);
	}
}

/*
	Name: emp_turret_init
	Namespace: emp
	Checksum: 0x397095B7
	Offset: 0x540
	Size: 0xD4
	Parameters: 7
	Flags: None
*/
function emp_turret_init(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(!bwastimejump)
	{
		return;
	}
	self useanimtree("generic");
	self setanimrestart(#"o_turret_emp_core_deploy", 1, 0, 0);
	self setanimtime(#"o_turret_emp_core_deploy", 0);
}

/*
	Name: cleanup_fx_on_shutdown
	Namespace: emp
	Checksum: 0x3683B62E
	Offset: 0x620
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function cleanup_fx_on_shutdown(localclientnum, handle)
{
	self endon(#"kill_fx_cleanup");
	self waittill(#"death");
	stopfx(localclientnum, handle);
}

/*
	Name: emp_turret_deploy_start
	Namespace: emp
	Checksum: 0x28ED5F04
	Offset: 0x680
	Size: 0xDE
	Parameters: 7
	Flags: None
*/
function emp_turret_deploy_start(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		self thread emp_turret_deploy(fieldname);
	}
	else
	{
		self notify(#"kill_fx_cleanup");
		if(isdefined(self.fxhandle))
		{
			stopfx(fieldname, self.fxhandle);
			self.fxhandle = undefined;
		}
	}
}

/*
	Name: emp_turret_deploy
	Namespace: emp
	Checksum: 0xF4CAAC60
	Offset: 0x768
	Size: 0x19C
	Parameters: 1
	Flags: None
*/
function emp_turret_deploy(localclientnum)
{
	self endon(#"death");
	self useanimtree("generic");
	self setanimrestart(#"o_turret_emp_core_deploy", 1, 0, 1);
	length = getanimlength(#"o_turret_emp_core_deploy");
	wait(length * 0.75);
	self useanimtree("generic");
	self setanim(#"o_turret_emp_core_spin", 1);
	params = getscriptbundle("killstreak_bundle");
	self.fxhandle = util::playfxontag(localclientnum, params.var_98fba0f7, self, "tag_fx");
	self thread cleanup_fx_on_shutdown(localclientnum, self.fxhandle);
	wait(length * 0.25);
	self setanim(#"o_turret_emp_core_deploy", 0);
}

