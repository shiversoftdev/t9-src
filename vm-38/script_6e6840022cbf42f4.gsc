#using script_3c362258ff800237;
#using scripts\core_common\system_shared.csc;

#namespace namespace_497ab7da;

/*
	Name: function_5640562b
	Namespace: namespace_497ab7da
	Checksum: 0xCE49F572
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5640562b()
{
	level notify(449458947);
}

/*
	Name: function_89f2df9
	Namespace: namespace_497ab7da
	Checksum: 0xCC3028C
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_42f44652a16988d8", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_497ab7da
	Checksum: 0x3D858BCC
	Offset: 0xD8
	Size: 0x33C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_347b44dd26e1875", &function_d1de6a85, &function_9e7b3f4d);
	forcestreamxmodel(#"hash_4943e3162de8ef6e");
	forcestreamxmodel(#"hash_1472b36f2021eaca");
	forcestreamxmodel(#"hash_75ff026dd5e8cd1a");
	forcestreamxmodel(#"hash_5284370cc794177");
	forcestreamxmodel(#"hash_6af4a0ff3d4ea44c");
	forcestreamxmodel(#"hash_1d8e22348c4b45c9");
	forcestreamxmodel(#"hash_6160275248857912");
	forcestreamxmodel(#"hash_4bd467e0dabd5709");
	forcestreamxmodel(#"hash_304de1f0d4ad83b1");
	forcestreamxmodel(#"hash_2aa0030efc6a28e9");
	forcestreamxmodel(#"hash_37f7b4dd345c97a0");
	forcestreamxmodel(#"hash_5434d478b48918e");
	forcestreamxmodel(#"hash_689bec40e7ecdd78");
	forcestreamxmodel(#"hash_179a6a7859bb71a0");
	forcestreamxmodel(#"hash_86d8950616483eb");
	forcestreamxmodel(#"hash_1e826c91e070af89");
	forcestreamxmodel(#"hash_77da47a49c46d7cf");
	forcestreamxmodel(#"hash_2aaed6f517eedff1");
	forcestreamxmodel(#"hash_648f3e9c3b9bf102");
	forcestreamxmodel(#"p8_zm_wall_buy_symbol_01");
	forcestreamxmodel(#"p8_zm_wall_buy_symbol_01_middle");
	forcestreamxmodel(#"p8_zm_wall_buy_symbol_01_reverse");
	forcestreamxmodel(#"hash_38b107b1b645837d");
}

/*
	Name: function_d1de6a85
	Namespace: namespace_497ab7da
	Checksum: 0xF96AAAF7
	Offset: 0x420
	Size: 0x14
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(local_client_num, params)
{
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_497ab7da
	Checksum: 0xD84B4F6
	Offset: 0x440
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(local_client_num)
{
}

