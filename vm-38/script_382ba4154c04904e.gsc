#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_fasttravel.csc;
#using scripts\zm_common\zm.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_ff7e490;

/*
	Name: function_cf87a0b7
	Namespace: namespace_ff7e490
	Checksum: 0x4E897034
	Offset: 0x250
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cf87a0b7()
{
	level notify(1329726591);
}

/*
	Name: init
	Namespace: namespace_ff7e490
	Checksum: 0x9B1769D
	Offset: 0x270
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hash_666ad912cb4541f1", 28000, 1, "int", &function_7d467651, 0, 0);
	clientfield::register("world", "" + #"hash_6601c584f23761c4", 28000, 1, "int", &function_e746b148, 0, 0);
}

/*
	Name: function_7d467651
	Namespace: namespace_ff7e490
	Checksum: 0x4E8F53E2
	Offset: 0x330
	Size: 0x2EC
	Parameters: 7
	Flags: Linked
*/
function function_7d467651(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		function_833e4b72(fieldname, getent(fieldname, "portal_fx_main_street_to_helipads", "targetname"), #"hash_1ba53d51579f933d");
		function_833e4b72(fieldname, getent(fieldname, "portal_fx_main_street_to_anytown_usa", "targetname"));
		function_833e4b72(fieldname, getent(fieldname, "portal_fx_anytown_usa_to_main_street", "targetname"));
		function_833e4b72(fieldname, getent(fieldname, "portal_fx_bunker_to_anytown_usa", "targetname"));
		function_833e4b72(fieldname, getent(fieldname, "portal_fx_observation_to_bunker", "targetname"));
		function_833e4b72(fieldname, getent(fieldname, "portal_fx_helipads_to_observation", "targetname"));
	}
	else
	{
		function_60381056(fieldname, getent(fieldname, "portal_fx_main_street_to_helipads", "targetname"));
		function_60381056(fieldname, getent(fieldname, "portal_fx_main_street_to_anytown_usa", "targetname"));
		function_60381056(fieldname, getent(fieldname, "portal_fx_anytown_usa_to_main_street", "targetname"));
		function_60381056(fieldname, getent(fieldname, "portal_fx_bunker_to_anytown_usa", "targetname"));
		function_60381056(fieldname, getent(fieldname, "portal_fx_observation_to_bunker", "targetname"));
		function_60381056(fieldname, getent(fieldname, "portal_fx_helipads_to_observation", "targetname"));
	}
}

/*
	Name: function_833e4b72
	Namespace: namespace_ff7e490
	Checksum: 0x186CE437
	Offset: 0x628
	Size: 0x134
	Parameters: 3
	Flags: Linked
*/
function function_833e4b72(localclientnum, e_portal, str_fx)
{
	if(!isdefined(str_fx))
	{
		str_fx = #"hash_46483584aaecbb44";
	}
	if(!isdefined(e_portal.fx_portal))
	{
		e_portal.fx_portal = playfx(localclientnum, str_fx, e_portal.origin, anglestoforward(e_portal.angles), anglestoup(e_portal.angles));
	}
	if(!isdefined(e_portal.var_a3b04735))
	{
		e_portal.var_a3b04735 = e_portal playloopsound(#"hash_5682401a5f2d6875");
	}
	if(isdefined(e_portal.var_d79ee076) && e_portal.var_d79ee076 ishidden())
	{
		e_portal.var_d79ee076 show();
		e_portal.var_d79ee076 function_619a5c20();
	}
}

/*
	Name: function_60381056
	Namespace: namespace_ff7e490
	Checksum: 0x590C3CF3
	Offset: 0x768
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function function_60381056(localclientnum, e_portal)
{
	if(isdefined(e_portal.fx_portal))
	{
		stopfx(localclientnum, e_portal.fx_portal);
		e_portal.fx_portal = undefined;
	}
	if(isdefined(e_portal.var_a3b04735))
	{
		e_portal stoploopsound(e_portal.var_a3b04735);
		e_portal.var_a3b04735 = undefined;
	}
	if(isdefined(e_portal.var_d79ee076) && !e_portal.var_d79ee076 ishidden())
	{
		e_portal.var_d79ee076 hide();
		e_portal.var_d79ee076 function_23a29590();
	}
}

/*
	Name: function_e746b148
	Namespace: namespace_ff7e490
	Checksum: 0x319CF2A6
	Offset: 0x858
	Size: 0x4EC
	Parameters: 7
	Flags: Linked
*/
function function_e746b148(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(newval)
	{
		function_98acc92b(localclientnum, getent(localclientnum, "portal_fx_helipads_to_main_street", "targetname"), #"hash_76dd4f827daef371", 1);
		function_98acc92b(localclientnum, getent(localclientnum, "portal_fx_main_street_to_helipads", "targetname"), #"hash_5c35207bb157a661");
		function_98acc92b(localclientnum, getent(localclientnum, "portal_fx_main_street_to_anytown_usa", "targetname"), #"hash_2f9ea46c29003241");
		function_98acc92b(localclientnum, getent(localclientnum, "portal_fx_anytown_usa_to_main_street", "targetname"), #"hash_5d6f46eb355ec1cb");
		function_98acc92b(localclientnum, getent(localclientnum, "portal_fx_anytown_usa_to_bunker", "targetname"), #"hash_62e92c3479ce24e2", 1);
		function_98acc92b(localclientnum, getent(localclientnum, "portal_fx_bunker_to_anytown_usa", "targetname"), #"hash_7689d161576092c2");
		function_98acc92b(localclientnum, getent(localclientnum, "portal_fx_bunker_to_observation", "targetname"), #"p9_fxp_zm_portal_aether_modular_dest_amerika_to_observation_from_under", 0, 1);
		function_98acc92b(localclientnum, getent(localclientnum, "portal_fx_observation_to_bunker", "targetname"), #"hash_1d67a5d0f60e1ea");
		function_98acc92b(localclientnum, getent(localclientnum, "portal_fx_observation_to_helipads", "targetname"), #"hash_697445b9607e9d53", 1);
		function_98acc92b(localclientnum, getent(localclientnum, "portal_fx_helipads_to_observation", "targetname"), #"hash_72d2ae42e9973cad");
		var_68a04830 = getentarray(localclientnum, "tungsten_teleporter", "targetname");
		foreach(portal in var_68a04830)
		{
			portal function_619a5c20();
			portal zm_utility::set_compass_icon(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump);
		}
		portal = getent(localclientnum, "anytown_usa_teleporter", "targetname");
		portal function_619a5c20();
		portal thread zm_utility::function_a1290dca(localclientnum, #"hash_48c296f58e75bbc7");
		portal = getent(localclientnum, "portal_fx_bunker_to_observation", "targetname");
		portal.var_cc1c5020 = util::spawn_model(localclientnum, #"p9_zm_gold_teleporter_b", portal.origin - (-29, 0, 65.078), portal.angles);
		portal.var_cc1c5020 hide();
		portal.var_cc1c5020 function_619a5c20();
		portal.var_cc1c5020 zm_utility::set_compass_icon(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump);
	}
}

/*
	Name: function_98acc92b
	Namespace: namespace_ff7e490
	Checksum: 0x576CF55D
	Offset: 0xD50
	Size: 0xB4
	Parameters: 5
	Flags: Linked
*/
function function_98acc92b(localclientnum, e_portal, var_6c81b9c0, b_hide, var_9e9fd78d)
{
	if(!isdefined(b_hide))
	{
		b_hide = 0;
	}
	if(!isdefined(var_9e9fd78d))
	{
		var_9e9fd78d = 0;
	}
	e_portal.var_d79ee076 = util::spawn_model(localclientnum, var_6c81b9c0, e_portal.origin, e_portal.angles);
	if(var_9e9fd78d)
	{
		e_portal.var_d79ee076 function_619a5c20();
	}
	if(b_hide)
	{
		e_portal.var_d79ee076 hide();
	}
}

