#using script_3ddf84b7bb3bf47d;
#using script_3751b21462a54a7d;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using script_1287f54612f9bfce;
#using script_7fc996fe8678852;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_c71c7ca5;

/*
	Name: __init__system__
	Namespace: namespace_c71c7ca5
	Checksum: 0x5077041A
	Offset: 0x198
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_59fd15f8f403c8b", &function_70a657d8, &function_8ac3bea9, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_c71c7ca5
	Checksum: 0x17571D01
	Offset: 0x1F8
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	level.var_291ed71 = array(#"hash_25c21c498472d468", #"hash_4b717fb97cdcb15a", #"hash_cb1cfbaf811242");
	namespace_52c8f34d::function_70a657d8();
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_c71c7ca5
	Checksum: 0xC215C6AF
	Offset: 0x260
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_8ac3bea9()
{
	var_f5ae494f = struct::get_array(#"hash_313be7fccc870cdd", "variantname");
	if(zm_utility::is_classic() && isdefined(var_f5ae494f) && var_f5ae494f.size > 0)
	{
		level thread function_f72d912(var_f5ae494f[0]);
	}
}

/*
	Name: function_1142ba4a
	Namespace: namespace_c71c7ca5
	Checksum: 0x1B071104
	Offset: 0x2F0
	Size: 0xC8
	Parameters: 3
	Flags: None
*/
function function_1142ba4a(var_beee4994, hint_string, model)
{
	if(!isdefined(model))
	{
		return;
	}
	foreach(var_7d0e37f8 in model)
	{
		function_5be7e51b(var_7d0e37f8, "p9_fxanim_zm_gp_dac_xmodel", #"hash_545a7fa1ec400c83", &function_18aca533);
	}
}

/*
	Name: function_5be7e51b
	Namespace: namespace_c71c7ca5
	Checksum: 0xE2E6D565
	Offset: 0x3C0
	Size: 0x284
	Parameters: 4
	Flags: None
*/
function function_5be7e51b(struct, modelname, hint_string, callbackfunction)
{
	/#
		assert(isstruct(struct), "");
	#/
	/#
		assert(isfunctionptr(callbackfunction), "");
	#/
	/#
		assert(isdefined(modelname), "");
	#/
	/#
		assert(isdefined(hint_string), "");
	#/
	scriptmodel = namespace_8b6a9d79::spawn_script_model(struct, modelname);
	objid = zm_utility::function_f5a222a8(#"hash_3632525bd692cfc8", scriptmodel);
	struct.objectiveid = objid;
	scriptmodel.objectiveid = objid;
	if(!isdefined(level.var_6bf8ee58))
	{
		level.var_6bf8ee58 = [];
	}
	else if(!isarray(level.var_6bf8ee58))
	{
		level.var_6bf8ee58 = array(level.var_6bf8ee58);
	}
	level.var_6bf8ee58[level.var_6bf8ee58.size] = objid;
	trigger = namespace_8b6a9d79::function_214737c7(struct, callbackfunction, hint_string, undefined, 128, 128, undefined, vectorscale((0, 0, 1), 50));
	trigger.scriptmodel = scriptmodel;
	scriptmodel.trigger = trigger;
	scriptmodel clientfield::set("item_machine_spawn_rob", 1);
	scriptmodel playloopsound(#"hash_5f690620ca8d62bc");
	playsoundatposition(#"hash_5c2fc4437449ddb4", struct.origin);
	playfx("sr/fx9_safehouse_mchn_wonderfizz_spawn", struct.origin);
}

/*
	Name: function_18aca533
	Namespace: namespace_c71c7ca5
	Checksum: 0x908A9630
	Offset: 0x650
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_18aca533(eventstruct)
{
	if(isdefined(level.var_291ed71) && level.var_291ed71.size > 0)
	{
		scriptmodel = self.scriptmodel;
		if(isdefined(scriptmodel))
		{
			scriptmodel thread scene::play("p9_fxanim_zm_gp_dac_bundle", scriptmodel);
			playsoundatposition(#"hash_2306bc49a7e85ea2", scriptmodel.origin);
			playsoundatposition(level.var_291ed71[0], scriptmodel.origin);
			arrayremoveindex(level.var_291ed71, 0);
			if(isdefined(scriptmodel.objectiveid))
			{
				zm_utility::function_bc5a54a8(scriptmodel.objectiveid);
				scriptmodel.objectiveid = undefined;
			}
		}
		waittillframeend();
		util::wait_network_frame();
		if(isentity(self))
		{
			self delete();
		}
	}
}

/*
	Name: function_f72d912
	Namespace: namespace_c71c7ca5
	Checksum: 0xC60D3AE8
	Offset: 0x7B0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_f72d912(destination)
{
	level flag::wait_till("start_zombie_round_logic");
	waittillframeend();
	function_399aa551(destination);
}

/*
	Name: function_399aa551
	Namespace: namespace_c71c7ca5
	Checksum: 0x890B68C1
	Offset: 0x800
	Size: 0x16C
	Parameters: 1
	Flags: None
*/
function function_399aa551(destination)
{
	foreach(location in destination.locations)
	{
		var_ac97a756 = location.instances[#"hash_5aa51584db09513"];
		if(isdefined(var_ac97a756))
		{
			children = namespace_8b6a9d79::function_f703a5a(var_ac97a756);
			foreach(child in children)
			{
				function_5be7e51b(child, "p9_fxanim_zm_gp_dac_xmodel", #"hash_545a7fa1ec400c83", &function_18aca533);
			}
		}
	}
}

