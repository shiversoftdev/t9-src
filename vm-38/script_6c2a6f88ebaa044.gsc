#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_345fff71;

/*
	Name: function_451cd7c5
	Namespace: namespace_345fff71
	Checksum: 0x67A4BC4E
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_451cd7c5()
{
	level notify(1144380444);
}

#namespace cinematicmotion;

/*
	Name: __init__system__
	Namespace: cinematicmotion
	Checksum: 0x8E0289CD
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"cinematicmotion", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: cinematicmotion
	Checksum: 0x3D1D7EFD
	Offset: 0x108
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	n_bits = getminbitcountfornum(11);
	clientfield::register("toplayer", "cinematicMotion", 1, n_bits, "int");
}

/*
	Name: function_92dd9a20
	Namespace: cinematicmotion
	Checksum: 0xAFC99488
	Offset: 0x168
	Size: 0x2EA
	Parameters: 1
	Flags: Linked
*/
function function_92dd9a20(param)
{
	if(!isplayer(self))
	{
		return;
	}
	switch(param)
	{
		case "hash_5a4e4aa2a78f38a5":
		{
			self clientfield::set_to_player("cinematicMotion", 0);
			break;
		}
		case "hash_5a4e49a2a78f36f2":
		{
			self clientfield::set_to_player("cinematicMotion", 1);
			break;
		}
		case "hash_5a4e48a2a78f353f":
		{
			self clientfield::set_to_player("cinematicMotion", 2);
			break;
		}
		case "hash_5a4e47a2a78f338c":
		{
			self clientfield::set_to_player("cinematicMotion", 3);
			break;
		}
		case "hash_5a4e46a2a78f31d9":
		{
			self clientfield::set_to_player("cinematicMotion", 4);
			break;
		}
		case "hash_5a4e45a2a78f3026":
		{
			self clientfield::set_to_player("cinematicMotion", 5);
			break;
		}
		case "hash_1f2696a2ce6d028b":
		{
			self clientfield::set_to_player("cinematicMotion", 6);
			break;
		}
		case "hash_1f2695a2ce6d00d8":
		{
			self clientfield::set_to_player("cinematicMotion", 7);
			break;
		}
		case "hash_1f2698a2ce6d05f1":
		{
			self clientfield::set_to_player("cinematicMotion", 8);
			break;
		}
		case "hash_1f2697a2ce6d043e":
		{
			self clientfield::set_to_player("cinematicMotion", 9);
			break;
		}
		case "hash_1f269aa2ce6d0957":
		{
			self clientfield::set_to_player("cinematicMotion", 10);
			break;
		}
		case "hash_1f2699a2ce6d07a4":
		{
			self clientfield::set_to_player("cinematicMotion", 11);
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_bbf6e778
	Namespace: cinematicmotion
	Checksum: 0xC2291672
	Offset: 0x460
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_bbf6e778(param)
{
	if(!isplayer(self))
	{
		return;
	}
	if(param != "")
	{
		self setcinematicmotionoverride(param);
	}
	else
	{
		self setcinematicmotionoverride();
	}
}

