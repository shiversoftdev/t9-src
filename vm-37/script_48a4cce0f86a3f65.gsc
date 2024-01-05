#using script_35ae72be7b4fec10;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace entname;

/*
	Name: add
	Namespace: entname
	Checksum: 0xC96BDDCC
	Offset: 0x90
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
	if(ishash(team))
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
	Checksum: 0x63D84F89
	Offset: 0x1D0
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
	Checksum: 0xA333BABB
	Offset: 0x250
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
	Checksum: 0xA29AA43A
	Offset: 0x278
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
	Name: _think
	Namespace: entname
	Checksum: 0xDBD2193A
	Offset: 0x2D8
	Size: 0x2EC
	Parameters: 0
	Flags: Private
*/
function private _think()
{
	level endon(#"level_restarting");
	player = getplayers()[0];
	while(!isdefined(player))
	{
		waitframe(1);
		player = getplayers()[0];
	}
	player endon(#"death");
	level.var_435c3a22 = [];
	util::init_dvar("cg_maxActorNameDist", 500, &function_e65ba67);
	namespace_61e6d095::create(#"entname", #"hash_1624d8814bab0c71");
	name = #"";
	team = 0;
	namespace_61e6d095::set_text(#"entname", name);
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
			namespace_61e6d095::set_text(#"entname", name);
			namespace_61e6d095::set_state(#"entname", team);
		}
		waitframe(1);
	}
	namespace_61e6d095::remove(#"entname");
	level.var_435c3a22 = undefined;
	function_7a4ff65b("cg_maxActorNameDist", &function_e65ba67);
}

/*
	Name: function_e65ba67
	Namespace: entname
	Checksum: 0xCFF52786
	Offset: 0x5D0
	Size: 0x5C
	Parameters: 1
	Flags: Private
*/
function private function_e65ba67(dvar)
{
	if(dvar.name == "cg_maxActorNameDist")
	{
		dvar.value = dvar.value * dvar.value;
	}
	level.var_435c3a22[dvar.name] = dvar.value;
}

