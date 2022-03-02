#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace scriptmodels;

/*
	Name: function_89f2df9
	Namespace: scriptmodels
	Checksum: 0x7AAEE42A
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"scriptmodels", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: scriptmodels
	Checksum: 0x81036CD
	Offset: 0xE8
	Size: 0xA8
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	a_script_models = getentarraybytype(6);
	foreach(model in a_script_models)
	{
		function_9abee270(model);
	}
}

/*
	Name: function_9abee270
	Namespace: scriptmodels
	Checksum: 0xAAF1B2DF
	Offset: 0x198
	Size: 0x154
	Parameters: 1
	Flags: Private
*/
function private function_9abee270(model)
{
	/#
		assert(isdefined(model));
	#/
	if(model.classname != "script_model" && model.classname != "script_brushmodel")
	{
		return;
	}
	if(isdefined(model.script_health))
	{
		model.health = model.script_health;
		model.maxhealth = model.script_health;
		model.takedamage = 1;
	}
	if(is_true(model.var_3ee8e0e2))
	{
		model util::function_c596f193();
	}
	if(is_true(model.var_5d16ec51))
	{
		model function_619a5c20();
	}
	if(isdefined(model.script_team) && model.script_team != "none")
	{
		model.team = model.script_team;
		model setteam(model.script_team);
	}
}

