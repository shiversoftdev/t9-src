#using scripts\core_common\system_shared.gsc;

#namespace namespace_13fefac0;

/*
	Name: function_3bc12c07
	Namespace: namespace_13fefac0
	Checksum: 0x3B2B53EC
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3bc12c07()
{
	level notify(1288769846);
}

/*
	Name: init
	Namespace: namespace_13fefac0
	Checksum: 0xDA396F2D
	Offset: 0xB0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function init()
{
	level thread function_26ecdeeb();
	level thread function_8e536d77();
}

/*
	Name: function_26ecdeeb
	Namespace: namespace_13fefac0
	Checksum: 0xB411A5FE
	Offset: 0xF0
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_26ecdeeb()
{
	self notify("212b7d231d6b3cd0");
	self endon("212b7d231d6b3cd0");
	count = 0;
	while(true)
	{
		wait(randomfloatrange(5, 35));
		if(gettimescale() > 1.1)
		{
			count++;
			if(count >= 5)
			{
				function_17cf7de1(1);
				return;
			}
		}
		else
		{
			count = 0;
		}
	}
}

/*
	Name: function_8e536d77
	Namespace: namespace_13fefac0
	Checksum: 0xA64DBA62
	Offset: 0x1A0
	Size: 0xA7A
	Parameters: 0
	Flags: None
*/
function function_8e536d77()
{
	self notify("32ea0cfc9b38b143");
	self endon("32ea0cfc9b38b143");
	var_7db82908 = [18:{#hash_9e17efc1:4, #trace:21, #threshold:5.5, #key:#"hash_164e590374876a39"}, 17:{#hash_9e17efc1:4, #trace:20, #threshold:5.5, #key:#"hash_5873106a43bbf0a9"}, 16:{#hash_9e17efc1:4, #trace:19, #threshold:5.5, #key:#"hash_2873049796893c2"}, 15:{#hash_9e17efc1:4, #trace:18, #threshold:5.5, #key:#"hash_71fab2192fa2537d"}, 14:{#hash_9e17efc1:4, #trace:17, #threshold:5.5, #key:#"hash_1f866ae0a3a62832"}, 13:{#hash_9e17efc1:4, #trace:16, #threshold:5.5, #key:#"hash_2aab2762450675b4"}, 12:{#hash_9e17efc1:4, #trace:15, #threshold:5.5, #key:#"hash_59e3029d696683fa"}, 11:{#hash_9e17efc1:4, #trace:14, #threshold:5.5, #key:#"hash_4cbba40de74aa531"}, 10:{#hash_9e17efc1:4, #trace:13, #threshold:5.5, #key:#"hash_31b5b9e273560fa9"}, 9:{#hash_9e17efc1:4, #trace:12, #threshold:5.5, #key:#"hash_6be8efea7e9a9b0f"}, 8:{#hash_9e17efc1:4, #trace:11, #threshold:5.5, #key:#"hash_15dc4c705c20e0db"}, 7:{#hash_9e17efc1:4, #trace:10, #threshold:5.5, #key:#"hash_16a3b3072a1b1e64"}, 6:{#hash_9e17efc1:3, #trace:9, #threshold:2.1, #key:#"hash_29745170b0d7f97"}, 5:{#hash_9e17efc1:3, #trace:8, #threshold:2.1, #key:#"hash_6767c669a9321f55"}, 4:{#hash_9e17efc1:3, #trace:7, #threshold:2.1, #key:#"hash_25b1fd96e365b875"}, 3:{#mode:0, #hash_9e17efc1:1, #trace:6, #threshold:2.1, #key:#"hash_4ad8c9ef00dd61c3"}, 2:{#mode:1, #hash_9e17efc1:1, #trace:5, #threshold:2.1, #key:#"hash_4a9ebeef00abd6cb"}, 1:{#mode:0, #hash_9e17efc1:2, #trace:4, #threshold:600, #key:#"hash_3f0689f4ecc2fbab"}, 0:{#mode:1, #hash_9e17efc1:2, #trace:3, #threshold:400, #key:#"hash_3cccb7d9e336696a"}];
	while(true)
	{
		wait(randomfloatrange(5, 35));
		var_760d7bc4 = 0;
		var_b4320b5b = function_7a2da789();
		foreach(item in var_7db82908)
		{
			if((isdefined(item.mode) ? item.mode : currentsessionmode()) != currentsessionmode())
			{
				continue;
			}
			val = 0;
			switch(item.var_9e17efc1)
			{
				case 1:
				{
					val = getdvarfloat(item.key, 0);
					break;
				}
				case 2:
				{
					val = getdvarint(item.key, 0);
					break;
				}
				case 3:
				{
					val = (isdefined(function_82c5e33d(item.key)) ? function_82c5e33d(item.key) : 0);
					break;
				}
				case 4:
				{
					if(isdefined(var_b4320b5b))
					{
						val = (isdefined(var_b4320b5b[item.key]) ? var_b4320b5b[item.key] : 0);
					}
					break;
				}
			}
			if(val >= item.threshold)
			{
				function_17cf7de1(item.trace);
				var_760d7bc4 = 1;
			}
		}
		if(var_760d7bc4)
		{
			return true;
		}
	}
}

