#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_4914de7c;

/*
	Name: function_52cbff6e
	Namespace: namespace_4914de7c
	Checksum: 0xC23F8DC5
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_52cbff6e()
{
	level notify(-441037074);
}

/*
	Name: main
	Namespace: namespace_4914de7c
	Checksum: 0x20E49AA3
	Offset: 0xD0
	Size: 0x8C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	if(util::get_map_name() !== "wz_russia")
	{
		return;
	}
	callback::add_callback(#"objective_started", &function_386821d6);
	callback::add_callback(#"objective_ended", &function_b1eb7f05);
}

/*
	Name: function_386821d6
	Namespace: namespace_4914de7c
	Checksum: 0x1AAC2CCC
	Offset: 0x168
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_386821d6(eventstruct)
{
	if(level.var_7d45d0d4.var_3385b421.content_script_name === "holdout")
	{
		clientfield::set("set_objective_fog", 2);
	}
}

/*
	Name: function_b1eb7f05
	Namespace: namespace_4914de7c
	Checksum: 0x5F3152
	Offset: 0x1C8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_b1eb7f05(eventstruct)
{
	clientfield::set("set_objective_fog", 0);
}

