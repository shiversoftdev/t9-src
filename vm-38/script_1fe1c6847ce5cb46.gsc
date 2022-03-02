#using script_382ba4154c04904e;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_e502fca8;

/*
	Name: function_ae2475cf
	Namespace: namespace_e502fca8
	Checksum: 0x239C7E53
	Offset: 0x170
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ae2475cf()
{
	level notify(2109915973);
}

/*
	Name: init
	Namespace: namespace_e502fca8
	Checksum: 0x8B330805
	Offset: 0x190
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hash_2c7fb1cc66c590a0", 28000, getminbitcountfornum(2), "int", &function_68bbfe, 0, 0);
	clientfield::register("world", "" + #"hash_18f96dcb4766fbe8", 28000, 1, "int", &function_34eb3249, 0, 0);
	clientfield::register("world", "" + #"hash_45c3013f063fe2c7", 28000, getminbitcountfornum(2), "int", &function_2d49baf, 0, 0);
	clientfield::register("world", "" + #"hash_3432d09ff93c9a0c", 28000, 1, "int", &function_794730f, 0, 0);
	clientfield::register("world", "" + #"hash_27308a7dd991ce8d", 28000, 1, "int", &function_8c88a649, 0, 0);
	clientfield::register("actor", "" + #"hash_54e2a4e02a26cc62", 28000, 1, "counter", &function_95190421, 0, 0);
}

/*
	Name: function_68bbfe
	Namespace: namespace_e502fca8
	Checksum: 0xB7D74A26
	Offset: 0x3D0
	Size: 0xF4
	Parameters: 7
	Flags: Linked
*/
function function_68bbfe(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	e_portal = getent(fieldname, "portal_fx_helipads_to_main_street", "targetname");
	if(bwasdemojump)
	{
		if(bwasdemojump == 1)
		{
			function_d93b0fff(fieldname, e_portal);
		}
		else
		{
			function_1f88d6(fieldname, e_portal);
			function_7e3966f(fieldname, e_portal);
		}
	}
	else
	{
		function_1f88d6(fieldname, e_portal);
	}
}

/*
	Name: function_34eb3249
	Namespace: namespace_e502fca8
	Checksum: 0x4B95DD14
	Offset: 0x4D0
	Size: 0x19C
	Parameters: 7
	Flags: Linked
*/
function function_34eb3249(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	level endon(#"end_game");
	e_portal = getent(fieldname, "portal_fx_anytown_usa_to_bunker", "targetname");
	if(bwasdemojump)
	{
		var_1da0aee8 = getent(fieldname, "anytown_usa_teleporter", "targetname");
		if(var_1da0aee8.model !== #"hash_45169d3166db3fb3")
		{
			var_1da0aee8 setmodel(#"hash_45169d3166db3fb3");
		}
		function_d93b0fff(fieldname, e_portal);
		wait(1.5);
		if(isdefined(e_portal.var_bd434ca))
		{
			stopfx(fieldname, e_portal.var_bd434ca);
			e_portal.var_bd434ca = undefined;
			namespace_ff7e490::function_60381056(fieldname, e_portal);
			function_7e3966f(fieldname, e_portal);
		}
	}
	else
	{
		function_1f88d6(fieldname, e_portal);
	}
}

/*
	Name: function_8c88a649
	Namespace: namespace_e502fca8
	Checksum: 0xEBF70F52
	Offset: 0x678
	Size: 0x126
	Parameters: 7
	Flags: Linked
*/
function function_8c88a649(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	e_portal = getent(fieldname, "portal_dmg_spark_fx", "targetname");
	if(bwasdemojump)
	{
		if(!isdefined(e_portal.fx_portal))
		{
			e_portal.fx_portal = playfx(fieldname, #"hash_532aade47be565ff", e_portal.origin, anglestoforward(e_portal.angles), anglestoup(e_portal.angles));
		}
	}
	else if(isdefined(e_portal.fx_portal))
	{
		stopfx(fieldname, e_portal.fx_portal);
		e_portal.fx_portal = undefined;
	}
}

/*
	Name: function_2d49baf
	Namespace: namespace_e502fca8
	Checksum: 0x463A536B
	Offset: 0x7A8
	Size: 0x1C4
	Parameters: 7
	Flags: Linked
*/
function function_2d49baf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	e_portal = getent(fieldname, "portal_fx_bunker_to_observation", "targetname");
	if(bwasdemojump)
	{
		if(bwasdemojump == 1)
		{
			namespace_ff7e490::function_60381056(fieldname, e_portal);
			e_portal playsound(fieldname, #"hash_347114806e46c42a");
			namespace_ff7e490::function_833e4b72(fieldname, e_portal);
		}
		else
		{
			namespace_ff7e490::function_60381056(fieldname, e_portal);
			e_portal.fx_portal = playfx(fieldname, #"hash_9d2f5030c333b16", e_portal.origin, anglestoforward(e_portal.angles), anglestoup(e_portal.angles));
			e_portal.var_a3b04735 = e_portal playloopsound(#"hash_83b5ecd7e3f8f29");
			e_portal playsound(fieldname, #"hash_740416d5474f1ce7");
		}
	}
	else
	{
		namespace_ff7e490::function_60381056(fieldname, e_portal);
	}
}

/*
	Name: function_794730f
	Namespace: namespace_e502fca8
	Checksum: 0xFA9EA084
	Offset: 0x978
	Size: 0x134
	Parameters: 7
	Flags: Linked
*/
function function_794730f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	level endon(#"end_game");
	e_portal = getent(fieldname, "portal_fx_observation_to_helipads", "targetname");
	if(bwasdemojump == 1)
	{
		function_d93b0fff(fieldname, e_portal);
		wait(1.5);
		if(isdefined(e_portal.var_bd434ca))
		{
			stopfx(fieldname, e_portal.var_bd434ca);
			e_portal.var_bd434ca = undefined;
			namespace_ff7e490::function_60381056(fieldname, e_portal);
			function_7e3966f(fieldname, e_portal);
		}
	}
	else
	{
		function_1f88d6(fieldname, e_portal);
	}
}

/*
	Name: function_d93b0fff
	Namespace: namespace_e502fca8
	Checksum: 0xD305521E
	Offset: 0xAB8
	Size: 0x152
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d93b0fff(localclientnum, e_portal)
{
	if(!isdefined(e_portal.fx_portal))
	{
		e_portal.fx_portal = playfx(localclientnum, #"hash_42ec8f4ec8bcc91b", e_portal.origin, anglestoforward(e_portal.angles), anglestoup(e_portal.angles));
	}
	if(!isdefined(e_portal.var_bd434ca))
	{
		e_portal.var_bd434ca = playfx(localclientnum, #"hash_22568d89d3063dec", e_portal.origin, anglestoforward(e_portal.angles), anglestoup(e_portal.angles));
	}
	if(!isdefined(e_portal.var_a3b04735))
	{
		e_portal playsound(localclientnum, #"hash_c2c4f6486acdcd6");
		e_portal.var_a3b04735 = e_portal playloopsound(#"hash_3a1b6a329b7e308f");
	}
}

/*
	Name: function_7e3966f
	Namespace: namespace_e502fca8
	Checksum: 0xE1C5606F
	Offset: 0xC18
	Size: 0xEC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_7e3966f(localclientnum, e_portal, str_fx)
{
	level endon(#"end_game");
	playfx(localclientnum, #"hash_139f53aac7315984", e_portal.origin, anglestoforward(e_portal.angles), anglestoup(e_portal.angles));
	e_portal playsound(localclientnum, #"hash_29c5f5ba6e81488c");
	wait(0.45);
	e_portal playsound(localclientnum, #"hash_1d48a1b077c9670b");
	namespace_ff7e490::function_833e4b72(localclientnum, e_portal, str_fx);
}

/*
	Name: function_1f88d6
	Namespace: namespace_e502fca8
	Checksum: 0xC7279BAD
	Offset: 0xD10
	Size: 0x64
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1f88d6(localclientnum, e_portal)
{
	if(isdefined(e_portal.var_bd434ca))
	{
		stopfx(localclientnum, e_portal.var_bd434ca);
		e_portal.var_bd434ca = undefined;
	}
	namespace_ff7e490::function_60381056(localclientnum, e_portal);
}

/*
	Name: function_95190421
	Namespace: namespace_e502fca8
	Checksum: 0xB44BCF00
	Offset: 0xD80
	Size: 0x9C
	Parameters: 7
	Flags: Linked
*/
function function_95190421(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	playfx(bwastimejump, #"zombie/fx9_onslaught_spawn_sm", self.origin);
	playsound(bwastimejump, #"hash_10605de886d51283", self.origin + vectorscale((0, 0, 1), 35));
}

