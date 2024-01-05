#using script_39ee47b0c71ab0f1;
#using script_13ba67412d79c7f;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_trial.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_trial_util;

/*
	Name: function_e64b9334
	Namespace: zm_trial_util
	Checksum: 0x4A475E9F
	Offset: 0x430
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e64b9334()
{
	level notify(-88262849);
}

/*
	Name: __init__system__
	Namespace: zm_trial_util
	Checksum: 0x7DDB897B
	Offset: 0x450
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_util", &function_70a657d8, &finalize_clientfields, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_util
	Checksum: 0x7D5B276A
	Offset: 0x4A8
	Size: 0xFC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_940b67bb = getuimodel(function_5f72e972(#"zm_trials"), "roundTitle");
	level.var_63e5f17c = getuimodel(function_5f72e972(#"zm_trials"), "roundDescription");
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	callback::on_localclient_connect(&on_localplayer_connect);
	level.var_a2859227 = 0;
	level.var_f995ece6 = zm_trial_timer::register();
	level.var_e7295382 = zm_trial_weapon_locked::register_clientside();
}

/*
	Name: on_localplayer_connect
	Namespace: zm_trial_util
	Checksum: 0x3B98E827
	Offset: 0x5B0
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private on_localplayer_connect(localclientnum)
{
	timer_model = function_c8b7588d(localclientnum);
	setuimodelvalue(timer_model, 0);
}

/*
	Name: finalize_clientfields
	Namespace: zm_trial_util
	Checksum: 0xE5854129
	Offset: 0x600
	Size: 0x984
	Parameters: 1
	Flags: Linked, Private
*/
function private finalize_clientfields(localclientnum)
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	clientfield::register("world", "ZMHudGlobal.trials.trialIndex", 1, getminbitcountfornum(15), "int", &function_741dae5b, 0, 0);
	clientfield::register("toplayer", "" + #"hash_6536ca4fb2858a9f", 16000, 1, "int", &function_ff287922, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.roundNumber", #"zm_trials", #"roundnumber", 1, getminbitcountfornum(30), "int", &function_88806df3, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.roundSuccess", #"zm_trials", #"hash_3b7f05fe05dce5e6", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.strikes", #"zm_trials", #"strikes", 1, getminbitcountfornum(3), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.disableGun", #"zm_trials", #"hash_121100bede030e4f", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.disableEquip", #"zm_trials", #"hash_3f350b9f24137025", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.disableSpecial", #"zm_trials", #"hash_6627206e68f6e85a", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.disablePerks", #"zm_trials", #"hash_2c36699ed141ee48", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.disableAbilities", #"zm_trials", #"hash_1a2530c4fe94e577", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
	clientfield::register("toplayer", "zm_trials_timer", 1, getminbitcountfornum(540), "int", &function_bb753058, 0, 1);
	clientfield::register("toplayer", "zm_trials_weapon_locked", 1, 1, "counter", &function_4b6a4a84, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.playerCounterMax", #"zm_trials", #"hash_6ec8cc3d808f0872", 1, getminbitcountfornum(1000), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.gameState", #"zm_trials", #"gamestate", 1, 2, "int", &function_686840b2, 0, 1);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.failurePlayer", #"zm_trials", #"hash_637785e54dff107c", 1, 4, "int", undefined, 0, 0);
	clientfield::function_d89771ec("string", "ZMHudGlobal.trials.failureReason", #"zm_trials", #"hash_32c0f4516e34ccbd", 1, &function_b9a5a377, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.gameStartTime", #"zm_trials", #"gamestarttime", 1, 31, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.showScoreboard", #"zm_trials", #"showscoreboard", 1, getminbitcountfornum(1), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.globalCheckState", #"zm_trials", #"hash_5c4404da19676603", 1, getminbitcountfornum(2), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.globalCounterValue", #"zm_trials", #"hash_13183edb0d19f05f", 1, getminbitcountfornum(1000), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.globalCounterMax", #"zm_trials", #"hash_12ffdfd0c5746280", 1, getminbitcountfornum(1000), "int", undefined, 0, 0);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.hudDeactivated", #"zm_trials", #"hash_8eae759a6611660", 1, 1, "int", undefined, 0, 0);
	for(i = 0; i < 5; i++)
	{
		clientfield::function_5b7d846d((("PlayerList.client" + i) + ".") + "trialsCheckState", #"hash_97df1852304b867", [1:#"trialscheckstate", 0:hash((isdefined(i) ? "" + i : ""))], 1, 2, "int", undefined, 0, 0);
		clientfield::function_5b7d846d((("PlayerList.client" + i) + ".") + "trialsCounterValue", #"hash_97df1852304b867", [1:#"trialscountervalue", 0:hash((isdefined(i) ? "" + i : ""))], 1, getminbitcountfornum(1000), "int", undefined, 0, 0);
	}
}

/*
	Name: function_ff287922
	Namespace: zm_trial_util
	Checksum: 0xAED5D3CF
	Offset: 0xF90
	Size: 0x74
	Parameters: 7
	Flags: Linked, Private
*/
function private function_ff287922(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_3862d4bd(1);
	}
	else
	{
		self function_3862d4bd(0);
	}
}

/*
	Name: function_741dae5b
	Namespace: zm_trial_util
	Checksum: 0x3240606
	Offset: 0x1010
	Size: 0x5C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_741dae5b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.var_6d87ac05 = zm_trial::function_ce2fdd3b(bwastimejump);
}

/*
	Name: function_88806df3
	Namespace: zm_trial_util
	Checksum: 0x27B12AA5
	Offset: 0x1078
	Size: 0x104
	Parameters: 7
	Flags: Linked, Private
*/
function private function_88806df3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	round_index = bwastimejump - 1;
	if(isdefined(level.var_6d87ac05) && isdefined(level.var_6d87ac05.rounds[round_index]))
	{
		on_challenge_end(fieldname);
		level.var_1420e3f6 = level.var_6d87ac05.rounds[round_index];
		function_c3febfe1(fieldname);
	}
	else
	{
		on_challenge_end(fieldname);
		level.var_1420e3f6 = undefined;
	}
	function_d59810a5();
}

/*
	Name: function_686840b2
	Namespace: zm_trial_util
	Checksum: 0x722B6ED3
	Offset: 0x1188
	Size: 0x88
	Parameters: 7
	Flags: Linked, Private
*/
function private function_686840b2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.var_a2859227 = bwastimejump;
	function_d59810a5();
	if(level.var_a2859227 != 0)
	{
		waittillframeend();
		level notify(#"hash_7646638df88a3656");
	}
}

/*
	Name: function_b9a5a377
	Namespace: zm_trial_util
	Checksum: 0x7CF3D4EC
	Offset: 0x1218
	Size: 0x5C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_b9a5a377(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.var_411ba6f4 = bwastimejump;
	function_d59810a5();
}

/*
	Name: function_bb753058
	Namespace: zm_trial_util
	Checksum: 0xC8146791
	Offset: 0x1280
	Size: 0xC4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_bb753058(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!function_65b9eb0f(fieldname))
	{
		timer_model = function_c8b7588d(fieldname);
		duration_msec = bwastimejump * 1000;
		setuimodelvalue(timer_model, getservertime(fieldname, 1) + duration_msec);
	}
}

/*
	Name: function_4b6a4a84
	Namespace: zm_trial_util
	Checksum: 0xD0D5D1CD
	Offset: 0x1350
	Size: 0x54
	Parameters: 7
	Flags: Linked, Private
*/
function private function_4b6a4a84(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_97444b02(bwastimejump);
}

/*
	Name: function_c3febfe1
	Namespace: zm_trial_util
	Checksum: 0x8D0E1196
	Offset: 0x13B0
	Size: 0xD8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c3febfe1(local_client_num)
{
	if(isdefined(level.var_1420e3f6))
	{
		for(i = 0; i < level.var_1420e3f6.challenges.size; i++)
		{
			challenge = level.var_1420e3f6.challenges[i];
			if(isdefined(level.var_75e93a54[challenge.name]) && isdefined(level.var_75e93a54[challenge.name].var_c5dd8620))
			{
				[[level.var_75e93a54[challenge.name].var_c5dd8620]](local_client_num, challenge.params);
			}
		}
	}
}

/*
	Name: on_challenge_end
	Namespace: zm_trial_util
	Checksum: 0xBA0EB368
	Offset: 0x1490
	Size: 0xE0
	Parameters: 1
	Flags: Linked, Private
*/
function private on_challenge_end(local_client_num)
{
	if(isdefined(level.var_1420e3f6))
	{
		level notify(#"hash_7646638df88a3656");
		for(i = 0; i < level.var_1420e3f6.challenges.size; i++)
		{
			challenge = level.var_1420e3f6.challenges[i];
			if(isdefined(level.var_75e93a54[challenge.name]) && isdefined(level.var_75e93a54[challenge.name].var_bbcdbff5))
			{
				[[level.var_75e93a54[challenge.name].var_bbcdbff5]](local_client_num);
			}
		}
	}
}

/*
	Name: function_d59810a5
	Namespace: zm_trial_util
	Checksum: 0x1E8A94CE
	Offset: 0x1578
	Size: 0x102
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d59810a5()
{
	/#
		assert(isdefined(level.var_a2859227));
	#/
	setuimodelvalue(level.var_940b67bb, #"");
	setuimodelvalue(level.var_63e5f17c, #"");
	switch(level.var_a2859227)
	{
		case 0:
		{
			if(isdefined(level.var_1420e3f6))
			{
				setuimodelvalue(level.var_940b67bb, level.var_1420e3f6.name_str);
				setuimodelvalue(level.var_63e5f17c, level.var_1420e3f6.var_695d8fd1);
			}
			break;
		}
	}
}

/*
	Name: function_c8b7588d
	Namespace: zm_trial_util
	Checksum: 0xED460C0B
	Offset: 0x1688
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c8b7588d(localclientnum)
{
	return createuimodel(function_1df4c3b0(localclientnum, #"zm_hud"), "trialsTimer");
}

/*
	Name: function_97444b02
	Namespace: zm_trial_util
	Checksum: 0xF01C90FA
	Offset: 0x16D8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_97444b02(localclientnum)
{
	if(!level.var_e7295382 zm_trial_weapon_locked::is_open(localclientnum))
	{
		level.var_e7295382 zm_trial_weapon_locked::open(localclientnum);
	}
	level.var_e7295382 zm_trial_weapon_locked::function_1e74977(localclientnum);
	self playsound(localclientnum, #"hash_17c7895c4b5180ce");
}

