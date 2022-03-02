#using script_35ae72be7b4fec10;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;

#namespace ent_name;

/*
	Name: function_16a84369
	Namespace: ent_name
	Checksum: 0xC6AE418E
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_16a84369()
{
	level notify(439832996);
}

#namespace entname;

/*
	Name: add
	Namespace: entname
	Checksum: 0x512F45B
	Offset: 0xB0
	Size: 0x134
	Parameters: 2
	Flags: None
*/
function add(name, team)
{
	if(!isdefined(team))
	{
		team = 1;
	}
	if(!isdefined(level.var_479cdca1))
	{
		level.var_479cdca1 = [];
	}
	start_think = level.var_479cdca1.size == 0;
	if(function_7a600918(team))
	{
		if(team == #"axis" || team == #"enemy")
		{
			team = 2;
		}
		else
		{
			team = 1;
		}
	}
	level.var_479cdca1[self getentitynumber()] = {#team:team, #name:name};
	if(start_think)
	{
		thread _think();
	}
	self thread function_ef33f38e();
}

/*
	Name: remove
	Namespace: entname
	Checksum: 0xE8863206
	Offset: 0x1F0
	Size: 0x72
	Parameters: 0
	Flags: None
*/
function remove()
{
	if(isdefined(level.var_479cdca1[self getentitynumber()]))
	{
		level.var_479cdca1[self getentitynumber()] = undefined;
		self notify(#"hash_3e2d8e6c2f824c2e");
		if(level.var_479cdca1.size == 0)
		{
			level.var_479cdca1 = undefined;
		}
	}
}

/*
	Name: remove_all
	Namespace: entname
	Checksum: 0xBD8CFD5C
	Offset: 0x270
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function remove_all()
{
	level.var_479cdca1 = undefined;
	level notify(#"hash_5c4bc066a7176a66");
}

/*
	Name: function_ef33f38e
	Namespace: entname
	Checksum: 0xDFE1A5F7
	Offset: 0x298
	Size: 0x54
	Parameters: 0
	Flags: Private
*/
function private function_ef33f38e()
{
	level endon(#"hash_5c4bc066a7176a66");
	self endon(#"hash_3e2d8e6c2f824c2e");
	self waittill(#"death");
	self thread remove();
}

/*
	Name: _cleanup
	Namespace: entname
	Checksum: 0x5EF7A039
	Offset: 0x2F8
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private _cleanup(eventstruct)
{
	level.var_435c3a22 = undefined;
	function_7a4ff65b("cg_maxActorNameDist", &function_e65ba67);
}

/*
	Name: _think
	Namespace: entname
	Checksum: 0xA2924B39
	Offset: 0x340
	Size: 0x2EC
	Parameters: 0
	Flags: Private
*/
function private _think()
{
	level endoncallback(&_cleanup, #"level_restarting");
	player = getplayers()[0];
	while(!isdefined(player))
	{
		waitframe(1);
		player = getplayers()[0];
	}
	player endoncallback(&_cleanup, #"death");
	level.var_435c3a22 = [];
	util::init_dvar("cg_maxActorNameDist", 500, &function_e65ba67);
	namespace_61e6d095::create(#"entname", #"hash_1624d8814bab0c71");
	name = #"";
	team = 0;
	namespace_61e6d095::function_d5ea17f0(#"entname", name);
	namespace_61e6d095::set_state(#"entname", team);
	while(isdefined(level.var_479cdca1))
	{
		var_a1da1699 = #"";
		var_5002c793 = 0;
		if(isdefined(player.lookatent) && distancesquared(player.origin, player.lookatent.origin) <= level.var_435c3a22[#"cg_maxactornamedist"])
		{
			ent_num = player.lookatent getentitynumber();
			ent_name = level.var_479cdca1[ent_num];
			if(isdefined(ent_name))
			{
				var_a1da1699 = ent_name.name;
				var_5002c793 = ent_name.team;
			}
		}
		if(name != var_a1da1699)
		{
			name = var_a1da1699;
			team = var_5002c793;
			namespace_61e6d095::function_d5ea17f0(#"entname", name);
			namespace_61e6d095::set_state(#"entname", team);
		}
		waitframe(1);
	}
	namespace_61e6d095::remove(#"entname");
	_cleanup();
}

/*
	Name: function_e65ba67
	Namespace: entname
	Checksum: 0xD3BE33B0
	Offset: 0x638
	Size: 0x60
	Parameters: 1
	Flags: Private
*/
function private function_e65ba67(dvar)
{
	if(dvar.name == #"cg_maxactornamedist")
	{
		dvar.value = dvar.value * dvar.value;
	}
	level.var_435c3a22[dvar.name] = dvar.value;
}

