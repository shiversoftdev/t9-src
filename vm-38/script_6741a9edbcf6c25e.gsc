#using script_2b1dbe0f618068f7;
#using script_6a72d858ff1942eb;
#using script_713f934fea43e1fc;
#using script_78825cbb1ab9f493;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_2938acdc;

/*
	Name: function_b0322328
	Namespace: namespace_2938acdc
	Checksum: 0x86231968
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b0322328()
{
	level notify(2005153130);
}

/*
	Name: init
	Namespace: namespace_2938acdc
	Checksum: 0x12C2586B
	Offset: 0xD0
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_db91e97c = 1;
	namespace_17baa64d::init();
	if(is_true(getgametypesetting(#"hash_6eef7868c4f5ddbc")))
	{
		clientfield::function_a8bbc967("squad_wipe_tokens.count", #"hash_8155b36904833e4", #"count", 1, 4, "int", undefined, 0, 0);
	}
}

