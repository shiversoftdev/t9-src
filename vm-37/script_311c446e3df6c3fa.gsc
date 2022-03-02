#using script_359683f0ff3b3fbb;
#using script_74e3c3cd261ec799;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace objective_manager;

/*
	Name: function_89f2df9
	Namespace: objective_manager
	Checksum: 0xF599A347
	Offset: 0x180
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"objective_manager", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: objective_manager
	Checksum: 0x702D4724
	Offset: 0x1C8
	Size: 0x2BC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "" + #"hash_501374858f77990b", 1, 1, "int", &function_95190421, 0, 0);
	clientfield::register("actor", "objective_cf_callout_rob", 1, 2, "int", &function_b8c3e9f4, 0, 0);
	clientfield::register("toplayer", "sr_defend_timer", 18000, getminbitcountfornum(540), "int", &function_bb753058, 0, 1);
	clientfield::register("scriptmover", "" + #"hash_501374858f77990b", 1, 1, "int", &function_95190421, 0, 0);
	clientfield::register("scriptmover", "objective_cf_callout_rob", 1, 2, "int", &function_b8c3e9f4, 0, 0);
	clientfield::register("vehicle", "objective_cf_callout_rob", 1, 2, "int", &function_b8c3e9f4, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.objectiveTotal", #"hash_593f03dd48d5bc1f", #"objectivetotal", 1, 5, "int", undefined, 0, 0);
	clientfield::function_5b7d846d("hudItems.warzone.objectivesCompleted", #"hash_593f03dd48d5bc1f", #"hash_46ad7187ceb8287e", 1, 5, "int", undefined, 0, 0);
	callback::on_localclient_connect(&on_localplayer_connect);
	level.var_4f12f6d0 = sr_objective_timer::register();
}

/*
	Name: function_95190421
	Namespace: objective_manager
	Checksum: 0x9DCA9705
	Offset: 0x490
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_95190421(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		function_239993de(fieldname, "sr/fx9_zmb_spawn_portal", self, "tag_origin");
	}
}

/*
	Name: function_b8c3e9f4
	Namespace: objective_manager
	Checksum: 0xF2FD8CF
	Offset: 0x508
	Size: 0xF4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_b8c3e9f4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self function_dd2493cc(#"hash_67ab6fd22ae1e4ac", #"rob_sonar_set_friendly_zm_ls");
	}
	else
	{
		if(bwastimejump == 2)
		{
			self function_dd2493cc(#"rob_sonar_set_friendly_zm_ls", #"hash_67ab6fd22ae1e4ac");
		}
		else
		{
			self function_dd2493cc(undefined, #"hash_67ab6fd22ae1e4ac", #"rob_sonar_set_friendly_zm_ls");
		}
	}
}

/*
	Name: function_dd2493cc
	Namespace: objective_manager
	Checksum: 0x3EE9AD4B
	Offset: 0x608
	Size: 0xF0
	Parameters: 2
	Flags: Linked, Private, Variadic
*/
function private function_dd2493cc(var_c5dfdae0, ...)
{
	if(isdefined(var_c5dfdae0) && !self function_d2503806(var_c5dfdae0))
	{
		self function_bf9d3071(var_c5dfdae0);
	}
	foreach(rob in vararg)
	{
		if(self function_d2503806(rob))
		{
			self function_5d482e78(rob);
		}
	}
}

/*
	Name: function_bb753058
	Namespace: objective_manager
	Checksum: 0x58CB3B81
	Offset: 0x700
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
	Name: on_localplayer_connect
	Namespace: objective_manager
	Checksum: 0xF59B8CDB
	Offset: 0x7D0
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
	Name: function_c8b7588d
	Namespace: objective_manager
	Checksum: 0x93FDFB25
	Offset: 0x820
	Size: 0x52
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c8b7588d(localclientnum)
{
	var_4fa1ce7b = getuimodel(function_5f72e972(#"hash_593f03dd48d5bc1f"), "srProtoTimer");
	return var_4fa1ce7b;
}

