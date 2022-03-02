#using script_17a9d06bf819b2d3;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_e0b1e9f5;

/*
	Name: function_66460f50
	Namespace: namespace_e0b1e9f5
	Checksum: 0x25EED76
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_66460f50()
{
	level notify(1274566570);
}

/*
	Name: init
	Namespace: namespace_e0b1e9f5
	Checksum: 0x3274DD86
	Offset: 0xF0
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hash_666ad912cb4541f1", 16000, 1, "int", &function_7d467651, 0, 0);
	clientfield::register("world", "" + #"hash_18c31f1201f7c968", 16000, 1, "counter", &function_e4ea3f5f, 0, 0);
	clientfield::register("world", "" + #"hash_4d477a055c04e499", 16000, 1, "counter", &function_b35747a, 0, 0);
	namespace_5b1144e::function_5ae4a10c(undefined, "gold_teleporter", #"hash_4046a68ee9d717fc", undefined, #"hash_6416821107fc95b2");
}

/*
	Name: function_7d467651
	Namespace: namespace_e0b1e9f5
	Checksum: 0xD4A1619D
	Offset: 0x240
	Size: 0x26A
	Parameters: 7
	Flags: Linked
*/
function function_7d467651(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		var_73524bb4 = getentarray(fieldname, "portal_fx", "targetname");
		foreach(portal_pos in var_73524bb4)
		{
			portal_pos.fx_portal = playfx(fieldname, #"hash_3af1d592cda71a5c", portal_pos.origin, anglestoforward(portal_pos.angles), anglestoup(portal_pos.angles));
			if(!isdefined(portal_pos.var_a3b04735))
			{
				portal_pos.var_a3b04735 = portal_pos playloopsound(#"hash_722697efdfb3562f");
			}
		}
	}
	else
	{
		var_73524bb4 = getentarray(fieldname, "portal_fx", "targetname");
		foreach(portal_pos in var_73524bb4)
		{
			stopfx(fieldname, portal_pos.fx_portal);
			portal_pos.fx_portal = undefined;
			if(isdefined(portal_pos.var_a3b04735))
			{
				portal_pos stoploopsound(portal_pos.var_a3b04735);
				portal_pos.var_a3b04735 = undefined;
			}
		}
	}
}

/*
	Name: function_e4ea3f5f
	Namespace: namespace_e0b1e9f5
	Checksum: 0xB7027A8D
	Offset: 0x4B8
	Size: 0xFE
	Parameters: 7
	Flags: Linked
*/
function function_e4ea3f5f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	teleporters = getentarray(bwasdemojump, "gold_teleporter", "targetname");
	foreach(teleporter in teleporters)
	{
		teleporter function_619a5c20();
		teleporter.var_fc558e74 = "gold_teleporter";
	}
}

/*
	Name: function_b35747a
	Namespace: namespace_e0b1e9f5
	Checksum: 0xEBC02BE7
	Offset: 0x5C0
	Size: 0xF0
	Parameters: 7
	Flags: Linked
*/
function function_b35747a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	foreach(var_1da0aee8 in getentarray(localclientnum, "gold_teleporter", "targetname"))
	{
		var_1da0aee8 zm_utility::set_compass_icon(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump);
	}
}

