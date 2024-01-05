#using scripts\zm_common\zm_utility.gsc;
#using script_19367cd29a4485db;
#using script_3411bb48d41bd3b;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_7fc996fe8678852;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_a2a34bbc;

/*
	Name: function_7699909f
	Namespace: namespace_a2a34bbc
	Checksum: 0xFFBB1EAB
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7699909f()
{
	level notify(1881044340);
}

/*
	Name: __init__system__
	Namespace: namespace_a2a34bbc
	Checksum: 0xE4A8E2A2
	Offset: 0xF0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_1613437b4759eb4a", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_a2a34bbc
	Checksum: 0xA183DC60
	Offset: 0x140
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_759fe9a9853a9b36")) && !getdvarint(#"hash_730311c63805303a", 0))
	{
		return;
	}
	namespace_8b6a9d79::function_b3464a7c(#"hash_525786f66bf65b72", &function_6ef31de9, 1);
	/#
		level thread namespace_420b39d3::function_2fab7a62("");
	#/
}

/*
	Name: function_c2d5498d
	Namespace: namespace_a2a34bbc
	Checksum: 0x11A7EA
	Offset: 0x220
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_c2d5498d()
{
	self flag::set("cleanup");
	if(isdefined(self.var_a0b59f75))
	{
		self.var_a0b59f75 delete();
	}
}

/*
	Name: function_6ef31de9
	Namespace: namespace_a2a34bbc
	Checksum: 0x750A726B
	Offset: 0x278
	Size: 0x1DC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6ef31de9(s_instance)
{
	s_instance endon(#"cleanup");
	s_instance flag::clear("cleanup");
	s_instance callback::function_d8abfc3d(#"hash_345e9169ebba28fb", &function_c2d5498d);
	var_c088f113 = s_instance.var_fe2612fe[#"trigger_spawn"][0];
	var_7af625c6 = s_instance.var_fe2612fe[#"hash_11421144b772dcdf"][0];
	var_8c80285c = spawn("trigger_radius", var_c088f113.origin, 0, var_c088f113.radius, var_c088f113.height);
	s_instance.var_8c80285c = var_8c80285c;
	while(true)
	{
		var_8c80285c waittill(#"trigger");
		if(level flag::get(#"objective_locked"))
		{
			level flag::wait_till_clear(#"objective_locked");
			continue;
		}
		else
		{
			break;
		}
	}
	while(!isdefined(s_instance.var_a0b59f75))
	{
		s_instance.var_a0b59f75 = namespace_85745671::function_9d3ad056(#"hash_21f3d5d40d72e08d", var_7af625c6.origin, var_7af625c6.angles, #"hash_7f951f9c9843eb2b");
		wait(1);
	}
}

