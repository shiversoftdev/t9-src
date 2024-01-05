#using script_35ae72be7b4fec10;

#namespace namespace_d2183c1b;

/*
	Name: function_43bc76f7
	Namespace: namespace_d2183c1b
	Checksum: 0x7A019210
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_43bc76f7()
{
	level notify(1754230509);
}

#namespace namespace_ae270045;

/*
	Name: function_cfcd9b92
	Namespace: namespace_ae270045
	Checksum: 0x4332D3F3
	Offset: 0x88
	Size: 0x10C
	Parameters: 6
	Flags: None
*/
function function_cfcd9b92(var_5b36f17f, var_efccf092, var_b04adac9, var_8ab7d27b, var_c1c8f1d, var_ef1623ea)
{
	if(!isdefined(var_8ab7d27b))
	{
		var_8ab7d27b = 1;
	}
	if(!isdefined(var_ef1623ea))
	{
		var_ef1623ea = 20;
	}
	if(!namespace_61e6d095::exists(#"hash_57cba60410267bed"))
	{
		namespace_61e6d095::create(#"hash_57cba60410267bed", #"hash_16d65500e6bdc837");
		namespace_61e6d095::set_text(#"hash_57cba60410267bed", var_efccf092);
		if(isdefined(var_b04adac9))
		{
			namespace_61e6d095::function_309bf7c2(#"hash_57cba60410267bed", var_b04adac9);
		}
		function_e782b221(var_5b36f17f, var_8ab7d27b, var_c1c8f1d, var_ef1623ea);
	}
}

/*
	Name: function_9c8d2a44
	Namespace: namespace_ae270045
	Checksum: 0xC1D7F5BB
	Offset: 0x1A0
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_9c8d2a44(update_msg)
{
	if(namespace_61e6d095::exists(#"hash_57cba60410267bed"))
	{
		namespace_61e6d095::set_text(#"hash_57cba60410267bed", update_msg);
	}
}

/*
	Name: function_e782b221
	Namespace: namespace_ae270045
	Checksum: 0x109D9401
	Offset: 0x200
	Size: 0x292
	Parameters: 4
	Flags: Private
*/
function private function_e782b221(start_time, var_8ab7d27b, var_c1c8f1d, var_ef1623ea)
{
	level endon(#"hash_267bd9980f77d5f4", #"level_restarting", #"death");
	run_time = int(start_time * 1000);
	namespace_61e6d095::set_time(#"hash_57cba60410267bed", run_time);
	start_time = run_time;
	var_da7e097b = -1;
	var_469ff952 = 0;
	while(run_time >= 0)
	{
		run_time = max(run_time - function_60d95f53(), 0);
		namespace_61e6d095::set_time(#"hash_57cba60410267bed", run_time);
		if(var_8ab7d27b)
		{
			perc = (run_time / start_time) * 100;
			quarter = int(min(floor(perc / 25), 3));
			if(!var_469ff952 && perc <= var_ef1623ea && isdefined(var_c1c8f1d))
			{
				var_469ff952 = 1;
				namespace_61e6d095::set_text(#"hash_57cba60410267bed", var_c1c8f1d);
			}
			if(var_da7e097b != quarter)
			{
				var_da7e097b = quarter;
				if(quarter > 0 || perc <= 10)
				{
					namespace_61e6d095::set_state(#"hash_57cba60410267bed", quarter);
				}
				else
				{
					namespace_61e6d095::set_state(#"hash_57cba60410267bed", 0);
				}
			}
		}
		if(run_time <= 0)
		{
			level thread function_94505a0b();
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_94505a0b
	Namespace: namespace_ae270045
	Checksum: 0x18F5515B
	Offset: 0x4A0
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_94505a0b()
{
	level notify(#"hash_56a61cb4fe8b8e79");
	function_5e3101b2();
}

/*
	Name: function_5e3101b2
	Namespace: namespace_ae270045
	Checksum: 0x6253DD58
	Offset: 0x4D8
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_5e3101b2()
{
	level notify(#"hash_267bd9980f77d5f4");
	if(namespace_61e6d095::exists(#"hash_57cba60410267bed"))
	{
		namespace_61e6d095::remove(#"hash_57cba60410267bed");
	}
}

