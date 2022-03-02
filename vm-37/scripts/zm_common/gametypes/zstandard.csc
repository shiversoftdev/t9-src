#using script_13ba67412d79c7f;
#using script_151cd5772fe546db;
#using script_2f226180773b89b9;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zstandard;

/*
	Name: main
	Namespace: zstandard
	Checksum: 0xC3B9C87E
	Offset: 0x140
	Size: 0x214
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	callback::on_localclient_connect(&on_localplayer_connect);
	finalize_clientfields();
	level.var_f5682bb8 = zm_arcade_timer::register();
	level.var_f995ece6 = zm_trial_timer::register();
	level.var_b9f167ba = self_revive_visuals_rush::register();
	level._zombie_gamemodeprecache = &onprecachegametype;
	level._zombie_gamemodemain = &onstartgametype;
	for(i = 0; i < 5; i++)
	{
		clientfield::function_5b7d846d(("PlayerList.client" + i) + ".multiplier_count", #"hash_97df1852304b867", [1:#"hash_7c40e95279165a6a", 0:hash((isdefined(i) ? "" + i : ""))], 1, 12, "int", undefined, 0, 0);
		clientfield::function_5b7d846d(("PlayerList.client" + i) + ".multiplier_blink", #"hash_97df1852304b867", [1:#"hash_5b76ed50c5e3a0ff", 0:hash((isdefined(i) ? "" + i : ""))], 1, 1, "int", undefined, 0, 0);
	}
}

/*
	Name: finalize_clientfields
	Namespace: zstandard
	Checksum: 0x2796CF5B
	Offset: 0x360
	Size: 0xB4
	Parameters: 1
	Flags: Private
*/
function private finalize_clientfields(localclientnum)
{
	clientfield::register("toplayer", "zm_trials_timer", 1, getminbitcountfornum(540), "int", &function_bb753058, 0, 1);
	clientfield::function_5b7d846d("ZMHudGlobal.trials.gameStartTime", #"hash_21ac7bf03dae9888", #"gamestarttime", 1, 31, "int", undefined, 0, 0);
}

/*
	Name: onprecachegametype
	Namespace: zstandard
	Checksum: 0x80F724D1
	Offset: 0x420
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function onprecachegametype()
{
}

/*
	Name: onstartgametype
	Namespace: zstandard
	Checksum: 0x80F724D1
	Offset: 0x430
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function onstartgametype()
{
}

/*
	Name: on_localplayer_connect
	Namespace: zstandard
	Checksum: 0x11AFDA5B
	Offset: 0x440
	Size: 0x44
	Parameters: 1
	Flags: Private
*/
function private on_localplayer_connect(localclientnum)
{
	timer_model = function_c8b7588d(localclientnum);
	setuimodelvalue(timer_model, 0);
}

/*
	Name: function_c8b7588d
	Namespace: zstandard
	Checksum: 0xBF3BCDCF
	Offset: 0x490
	Size: 0x42
	Parameters: 1
	Flags: Private
*/
function private function_c8b7588d(localclientnum)
{
	return createuimodel(function_1df4c3b0(localclientnum, #"zm_hud"), "trialsTimer");
}

/*
	Name: function_bb753058
	Namespace: zstandard
	Checksum: 0xAC6AA065
	Offset: 0x4E0
	Size: 0xC4
	Parameters: 7
	Flags: Private
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

