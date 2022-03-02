#using script_4e261fd4bc49e992;
#using script_78825cbb1ab9f493;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_2938acdc;

/*
	Name: init
	Namespace: namespace_2938acdc
	Checksum: 0xFEAB3796
	Offset: 0xA0
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

