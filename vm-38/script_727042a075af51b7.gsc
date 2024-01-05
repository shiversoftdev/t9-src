#using script_618d6f5ff5d18933;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_7da6f8ca;

/*
	Name: function_7fbe581a
	Namespace: namespace_7da6f8ca
	Checksum: 0x5E92103A
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7fbe581a()
{
	level notify(1592482310);
}

/*
	Name: __init__system__
	Namespace: namespace_7da6f8ca
	Checksum: 0x3E49E344
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_40a4f03bb2983ee3", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_7da6f8ca
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_6ee35a0a
	Namespace: namespace_7da6f8ca
	Checksum: 0x7079633
	Offset: 0xF8
	Size: 0x102
	Parameters: 1
	Flags: None
*/
function function_6ee35a0a(rarity)
{
	switch(rarity)
	{
		case "resource":
		{
			return #"hash_20b3d352fb23155c";
			break;
		}
		case "common":
		{
			return #"hash_1c62f1903d03705a";
			break;
		}
		case "rare":
		{
			return #"hash_3e3f86ff3fc6055";
			break;
		}
		case "epic":
		{
			return #"hash_6c7840c9ca34f2a3";
			break;
		}
		case "legendary":
		{
			return #"hash_7f4c941a9564c78f";
			break;
		}
		case "ultra":
		{
			return #"hash_3dad79ca7ca879b5";
			break;
		}
		default:
		{
			return #"hash_20b3d352fb23155c";
			break;
		}
	}
}

