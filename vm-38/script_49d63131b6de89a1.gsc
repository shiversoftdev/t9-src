#using scripts\core_common\exploder_shared.csc;

#namespace namespace_879a3794;

/*
	Name: function_84c8cf4
	Namespace: namespace_879a3794
	Checksum: 0x579E0818
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_84c8cf4()
{
	level notify(344141909);
}

#namespace namespace_cf4aa5f0;

/*
	Name: function_6dbaba52
	Namespace: namespace_cf4aa5f0
	Checksum: 0xF280A8F1
	Offset: 0x88
	Size: 0x174
	Parameters: 6
	Flags: Linked
*/
function function_6dbaba52(name, play_exploders, var_2f7c44e9, var_4601a968, var_50c0eadc, var_82e50bac)
{
	if(!isdefined(var_82e50bac))
	{
		var_82e50bac = undefined;
	}
	if(!isdefined(level.rule))
	{
		level.rule = [];
	}
	if(isdefined(level.rule[name]))
	{
		var_65e2dd7c = level.rule[name];
	}
	else
	{
		var_65e2dd7c = {#kill:[], #stop:[], #hash_e4474fe9:[], #play:[], #start_wait:var_82e50bac};
	}
	function_6e561a85(var_65e2dd7c.play, play_exploders);
	function_6e561a85(var_65e2dd7c.var_e4474fe9, var_2f7c44e9);
	function_6e561a85(var_65e2dd7c.stop, var_4601a968);
	function_6e561a85(var_65e2dd7c.kill, var_50c0eadc);
	level.rule[name] = var_65e2dd7c;
}

/*
	Name: function_6e561a85
	Namespace: namespace_cf4aa5f0
	Checksum: 0x42DE1743
	Offset: 0x208
	Size: 0x1CA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6e561a85(&var_c4d527a6, exploders)
{
	if(!isdefined(exploders))
	{
		return;
	}
	if(isarray(exploders))
	{
		foreach(exploder in exploders)
		{
			if(isstring(exploder) || function_7a600918(exploder))
			{
				if(!isdefined(var_c4d527a6))
				{
					var_c4d527a6 = [];
				}
				else if(!isarray(var_c4d527a6))
				{
					var_c4d527a6 = array(var_c4d527a6);
				}
				if(!isinarray(var_c4d527a6, exploder))
				{
					var_c4d527a6[var_c4d527a6.size] = exploder;
				}
			}
		}
	}
	else if(isstring(exploders) || function_7a600918(exploders))
	{
		if(!isdefined(var_c4d527a6))
		{
			var_c4d527a6 = [];
		}
		else if(!isarray(var_c4d527a6))
		{
			var_c4d527a6 = array(var_c4d527a6);
		}
		if(!isinarray(var_c4d527a6, exploders))
		{
			var_c4d527a6[var_c4d527a6.size] = exploders;
		}
	}
}

/*
	Name: function_fcfe0dbe
	Namespace: namespace_cf4aa5f0
	Checksum: 0x3D8A6E7A
	Offset: 0x3E0
	Size: 0x12E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fcfe0dbe(name)
{
	level endon(#"end_game");
	var_65e2dd7c = level.rule[name];
	/#
		assert(isdefined(var_65e2dd7c));
	#/
	if(isdefined(level.rule[name].start_wait))
	{
		[[level.rule[name].start_wait]]();
	}
	function_3c540c33(var_65e2dd7c.kill, &exploder::kill_exploder);
	function_3c540c33(var_65e2dd7c.stop, &exploder::stop_exploder);
	function_3c540c33(var_65e2dd7c.play, &exploder::exploder);
	function_3c540c33(var_65e2dd7c.var_e4474fe9, &exploder::function_993369d6);
}

/*
	Name: function_470d684a
	Namespace: namespace_cf4aa5f0
	Checksum: 0xC962E49C
	Offset: 0x518
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_470d684a(name)
{
	level thread function_fcfe0dbe(name);
}

/*
	Name: function_169b8acc
	Namespace: namespace_cf4aa5f0
	Checksum: 0x22A3AA55
	Offset: 0x548
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_169b8acc(name)
{
	level endon(#"end_game");
	while(true)
	{
		function_fcfe0dbe(name);
		waitframe(1);
	}
}

/*
	Name: function_25002e3
	Namespace: namespace_cf4aa5f0
	Checksum: 0xAC161581
	Offset: 0x598
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_25002e3(name)
{
	level thread function_169b8acc(name);
}

/*
	Name: function_3c540c33
	Namespace: namespace_cf4aa5f0
	Checksum: 0x3025ABD
	Offset: 0x5C8
	Size: 0x98
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3c540c33(var_c4d527a6, var_d9470764)
{
	if(!isdefined(var_c4d527a6))
	{
		return;
	}
	foreach(exploder in var_c4d527a6)
	{
		[[var_d9470764]](exploder);
	}
}

