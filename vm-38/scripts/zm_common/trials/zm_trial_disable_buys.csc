#using scripts\zm_common\zm_trial.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_trial_disable_buys;

/*
	Name: function_5640562b
	Namespace: zm_trial_disable_buys
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
	Name: __init__system__
	Namespace: zm_trial_disable_buys
	Checksum: 0xCC3028C
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_disable_buys", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_disable_buys
	Checksum: 0x3D858BCC
	Offset: 0xD8
	Size: 0x33C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"disable_buys", &on_begin, &on_end);
	forcestreamxmodel(#"p8_zm_wall_buy_ar_accurate");
	forcestreamxmodel(#"p8_zm_wall_buy_ar_fastfire");
	forcestreamxmodel(#"p8_zm_wall_buy_ar_modular");
	forcestreamxmodel(#"p8_zm_wall_buy_ar_stealth");
	forcestreamxmodel(#"hash_6af4a0ff3d4ea44c");
	forcestreamxmodel(#"p8_zm_wall_buy_lmg_titan");
	forcestreamxmodel(#"p8_zm_wall_buy_pistol_burst");
	forcestreamxmodel(#"p8_zm_wall_buy_pistol_standard");
	forcestreamxmodel(#"p8_zm_wall_buy_shotgun_pump");
	forcestreamxmodel(#"p8_zm_wall_buy_shotgun_trenchgun");
	forcestreamxmodel(#"p8_zm_wall_buy_smg_accurate");
	forcestreamxmodel(#"hash_5434d478b48918e");
	forcestreamxmodel(#"p8_zm_wall_buy_smg_drum_pistol");
	forcestreamxmodel(#"p8_zm_wall_buy_smg_fastfire");
	forcestreamxmodel(#"p8_zm_wall_buy_smg_handling");
	forcestreamxmodel(#"hash_1e826c91e070af89");
	forcestreamxmodel(#"p8_zm_wall_buy_tr_leveraction");
	forcestreamxmodel(#"p8_zm_wall_buy_tr_longburst");
	forcestreamxmodel(#"p8_zm_wall_buy_tr_powersemi");
	forcestreamxmodel(#"p8_zm_wall_buy_symbol_01");
	forcestreamxmodel(#"p8_zm_wall_buy_symbol_01_middle");
	forcestreamxmodel(#"p8_zm_wall_buy_symbol_01_reverse");
	forcestreamxmodel(#"hash_38b107b1b645837d");
}

/*
	Name: on_begin
	Namespace: zm_trial_disable_buys
	Checksum: 0xF96AAAF7
	Offset: 0x420
	Size: 0x14
	Parameters: 2
	Flags: Private
*/
function private on_begin(local_client_num, params)
{
}

/*
	Name: on_end
	Namespace: zm_trial_disable_buys
	Checksum: 0xD84B4F6
	Offset: 0x440
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private on_end(local_client_num)
{
}

