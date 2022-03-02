#using script_35ae72be7b4fec10;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_4ea0b0e1;

/*
	Name: function_2d78a0d7
	Namespace: namespace_4ea0b0e1
	Checksum: 0xDDE4F73A
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2d78a0d7()
{
	level notify(11066741);
}

/*
	Name: function_89f2df9
	Namespace: namespace_4ea0b0e1
	Checksum: 0xEEC774B3
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3092c343f49326ae", &function_c7f33cce, undefined, undefined, undefined);
}

/*
	Name: function_c7f33cce
	Namespace: namespace_4ea0b0e1
	Checksum: 0x68E94B8A
	Offset: 0x140
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c7f33cce()
{
	function_bc948200();
	callback::add_callback(#"hash_75edd53ff899cd30", &function_83c9fd20);
}

/*
	Name: function_bc948200
	Namespace: namespace_4ea0b0e1
	Checksum: 0x1FEB771E
	Offset: 0x190
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bc948200()
{
	clientfield::register("toplayer", "return_to_combat_postfx", 1, 1, "int");
}

/*
	Name: function_83c9fd20
	Namespace: namespace_4ea0b0e1
	Checksum: 0x4B390B29
	Offset: 0x1D0
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_83c9fd20(params)
{
	var_21a143e = params.countdowntime;
	player = getplayers()[0];
	if(var_21a143e > 0)
	{
		level notify(#"hash_722cff0020f34cd4");
		set(var_21a143e * 0.001);
	}
	else
	{
		level thread close();
	}
}

/*
	Name: set
	Namespace: namespace_4ea0b0e1
	Checksum: 0xA50E9E2C
	Offset: 0x270
	Size: 0x14C
	Parameters: 2
	Flags: Linked, Private
*/
function private set(var_5b36f17f, override_msg)
{
	level.player = (isdefined(level.player) ? level.player : getplayers()[0]);
	if(!namespace_61e6d095::exists(#"hash_1a9d78f69978a1f3"))
	{
		namespace_61e6d095::create(#"hash_1a9d78f69978a1f3", #"hash_41ca08e341520d88");
	}
	if(!isdefined(var_5b36f17f))
	{
		var_5b36f17f = 0;
	}
	if(!isdefined(override_msg))
	{
		override_msg = #"hash_623eff21ed033aec";
	}
	namespace_61e6d095::function_9ade1d9b(#"hash_1a9d78f69978a1f3", "time", var_5b36f17f);
	namespace_61e6d095::function_9ade1d9b(#"hash_1a9d78f69978a1f3", "text", override_msg);
	level.player clientfield::set_to_player("return_to_combat_postfx", 1);
}

/*
	Name: close
	Namespace: namespace_4ea0b0e1
	Checksum: 0xD2459AEB
	Offset: 0x3C8
	Size: 0xEC
	Parameters: 1
	Flags: Linked, Private
*/
function private close(var_67df10fb)
{
	if(!isdefined(var_67df10fb))
	{
		var_67df10fb = 1;
	}
	self notify("5bbf1d550b1ef164");
	self endon("5bbf1d550b1ef164");
	level endon(#"hash_722cff0020f34cd4");
	if(var_67df10fb >= (float(function_60d95f53()) / 1000))
	{
		wait(var_67df10fb);
	}
	if(namespace_61e6d095::exists(#"hash_1a9d78f69978a1f3"))
	{
		namespace_61e6d095::remove(#"hash_1a9d78f69978a1f3");
	}
	level.player clientfield::set_to_player("return_to_combat_postfx", 0);
}

