#using scripts\core_common\values_shared.gsc;
#using script_35ae72be7b4fec10;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;

#namespace namespace_29a279dd;

/*
	Name: function_b934431c
	Namespace: namespace_29a279dd
	Checksum: 0xFE54272B
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b934431c()
{
	level notify(-1385011472);
}

/*
	Name: function_901ca209
	Namespace: namespace_29a279dd
	Checksum: 0x129A1D57
	Offset: 0xB0
	Size: 0x11C
	Parameters: 3
	Flags: Linked
*/
function function_901ca209(state, text, desc)
{
	getplayers()[0] val::set(#"hash_6420a4a05af52d6e", "show_crosshair", 0);
	if(!namespace_61e6d095::exists(#"hash_767355dc5e1cddfb"))
	{
		namespace_61e6d095::create(#"hash_767355dc5e1cddfb", #"hash_6420a4a05af52d6e");
	}
	if(isdefined(text))
	{
		namespace_61e6d095::set_text(#"hash_767355dc5e1cddfb", text);
	}
	if(isdefined(desc))
	{
		namespace_61e6d095::function_bfdab223(#"hash_767355dc5e1cddfb", desc);
	}
	waitframe(1);
	namespace_61e6d095::set_state(#"hash_767355dc5e1cddfb", state);
}

/*
	Name: remove
	Namespace: namespace_29a279dd
	Checksum: 0xB5973629
	Offset: 0x1D8
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function remove()
{
	if(namespace_61e6d095::exists(#"hash_767355dc5e1cddfb"))
	{
		namespace_61e6d095::remove(#"hash_767355dc5e1cddfb");
	}
	getplayers()[0] val::reset_all();
}

