#using script_1b2f6ef7778cf920;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace doa;

/*
	Name: main
	Namespace: doa
	Checksum: 0x9560BE31
	Offset: 0x90
	Size: 0x7C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level.var_30df1fad = "zombietron";
	level thread namespace_4dae815d::init();
	level.var_f18a6bd6 = &function_f18a6bd6;
	waittillframeend();
	level.var_f18a6bd6 = &function_f18a6bd6;
	util::waitforclient(0);
}

/*
	Name: function_f18a6bd6
	Namespace: doa
	Checksum: 0x31DD6F7A
	Offset: 0x118
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_f18a6bd6()
{
	system::function_c11b0642();
	level flag::set(#"load_main_complete");
}

