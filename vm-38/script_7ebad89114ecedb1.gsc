#using scripts\core_common\system_shared.csc;
#using script_3d0f36632dad12df;
#using script_2d142c6d365a90a3;
#using script_713f934fea43e1fc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_6615ea91;

/*
	Name: function_4c2e017a
	Namespace: namespace_6615ea91
	Checksum: 0xF67768F5
	Offset: 0x1C8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4c2e017a()
{
	level notify(977779937);
}

/*
	Name: __init__system__
	Namespace: namespace_6615ea91
	Checksum: 0x985078E
	Offset: 0x1E8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_53f69893eea352cb", &function_70a657d8, undefined, undefined, #"radiation");
}

/*
	Name: function_70a657d8
	Namespace: namespace_6615ea91
	Checksum: 0x6F182620
	Offset: 0x238
	Size: 0x190
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	clientfield::register_clientuimodel("hudItems.incursion.radiationDamage", #"hash_4f154d6820b7e836", [0:#"radiationdamage"], 1, 5, "float", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.incursion.radiationProtection", #"hash_4f154d6820b7e836", [0:#"hash_6a2df23dda50fd53"], 1, 5, "float", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.incursion.radiationHealth", #"hash_4f154d6820b7e836", [0:#"hash_1ea71fd40691443e"], 1, 5, "float", undefined, 0, 0);
	clientfield::register("toplayer", "radiation", 1, 10, "int", &radiation, 0, 1);
	callback::on_localclient_connect(&function_5cb7f849);
	level.var_6d29a25e = [];
}

/*
	Name: function_9cc6a162
	Namespace: namespace_6615ea91
	Checksum: 0x1B0DB344
	Offset: 0x3D0
	Size: 0x284
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9cc6a162(localclientnum, sickness, var_46bdb64c)
{
	/#
		assert(ishash(sickness) || isstring(sickness));
	#/
	/#
		assert(isdefined(var_46bdb64c));
	#/
	var_5e7fb773 = function_1df4c3b0(localclientnum, #"hash_4f154d6820b7e836");
	var_9ad901c3 = createuimodel(var_5e7fb773, "sickness");
	var_a60a2640 = level.radiation.sickness.size;
	itemuimodel = createuimodel(var_9ad901c3, "item" + var_a60a2640);
	var_1c254c7e = createuimodel(itemuimodel, "endStartFraction");
	setuimodelvalue(var_1c254c7e, 1);
	var_43df2991 = createuimodel(itemuimodel, "info");
	setuimodelvalue(var_43df2991, var_46bdb64c.var_4bd5611f);
	var_8e2253bd = {};
	var_8e2253bd.var_a2c3987d = sickness;
	var_8e2253bd.var_3a94cbe6 = gettime();
	var_8e2253bd.var_cb9fc1f3 = gettime() + var_46bdb64c.duration;
	var_8e2253bd.var_4bd5611f = var_46bdb64c.var_4bd5611f;
	var_8e2253bd.itemuimodel = itemuimodel;
	level.var_96929d7f[localclientnum].sickness[level.var_96929d7f[localclientnum].sickness.size] = var_8e2253bd;
	var_a25538fb = createuimodel(var_9ad901c3, "count");
	setuimodelvalue(var_a25538fb, level.var_96929d7f[localclientnum].sickness.size);
}

/*
	Name: function_e352066c
	Namespace: namespace_6615ea91
	Checksum: 0xD25382D7
	Offset: 0x660
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e352066c(localclientnum)
{
	var_5e7fb773 = function_1df4c3b0(localclientnum, #"hash_4f154d6820b7e836");
	var_9ad901c3 = createuimodel(var_5e7fb773, "sickness");
	level.var_96929d7f[localclientnum].sickness = [];
	var_a25538fb = createuimodel(var_9ad901c3, "count");
	setuimodelvalue(var_a25538fb, 0);
}

/*
	Name: function_b200b0ea
	Namespace: namespace_6615ea91
	Checksum: 0x803864F
	Offset: 0x720
	Size: 0xF4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_b200b0ea(localclientnum, sickness, var_46bdb64c)
{
	/#
		assert(ishash(sickness) || isstring(sickness));
	#/
	/#
		assert(isdefined(var_46bdb64c));
	#/
	for(index = 0; index < level.var_96929d7f[localclientnum].sickness.size; index++)
	{
		if(level.var_96929d7f[localclientnum].sickness[index].var_a2c3987d == sickness)
		{
			arrayremoveindex(level.var_96929d7f[localclientnum].sickness, index, 0);
		}
	}
}

/*
	Name: function_162db916
	Namespace: namespace_6615ea91
	Checksum: 0x5CFBB12F
	Offset: 0x820
	Size: 0x1DC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_162db916(localclientnum)
{
	if(!isdefined(level.var_96929d7f[localclientnum]) || !isdefined(level.var_96929d7f[localclientnum].sickness))
	{
		return;
	}
	var_5e7fb773 = function_1df4c3b0(localclientnum, #"hash_4f154d6820b7e836");
	var_9ad901c3 = createuimodel(var_5e7fb773, "sickness");
	for(var_a60a2640 = 0; var_a60a2640 < level.var_96929d7f[localclientnum].sickness.size; var_a60a2640++)
	{
		var_8e2253bd = level.var_96929d7f[localclientnum].sickness[var_a60a2640];
		itemuimodel = createuimodel(var_9ad901c3, "item" + var_a60a2640);
		var_43df2991 = createuimodel(itemuimodel, "info");
		setuimodelvalue(var_43df2991, var_8e2253bd.var_4bd5611f);
		var_8e2253bd.itemuimodel = itemuimodel;
	}
	var_a25538fb = createuimodel(var_9ad901c3, "count");
	setuimodelvalue(var_a25538fb, level.var_96929d7f[localclientnum].sickness.size);
	function_5cb7f849(localclientnum);
}

/*
	Name: radiation
	Namespace: namespace_6615ea91
	Checksum: 0x6EB4C62C
	Offset: 0xA08
	Size: 0x46C
	Parameters: 7
	Flags: Linked, Private
*/
function private radiation(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	if(!isdefined(level.var_96929d7f[binitialsnap]))
	{
		radiation::function_f45ee99d(binitialsnap);
		function_162db916(binitialsnap);
	}
	var_5e7fb773 = function_1df4c3b0(binitialsnap, #"hash_4f154d6820b7e836");
	var_11a4b47f = createuimodel(var_5e7fb773, "radiationLevel");
	var_66bba724 = bwastimejump & (8 - 1);
	radiationlevel = var_66bba724;
	if(radiationlevel < 0)
	{
		/#
			assert(0);
		#/
		radiationlevel = 0;
	}
	setuimodelvalue(var_11a4b47f, var_66bba724);
	var_6efc5d3e = 0;
	if(level.var_96929d7f[binitialsnap].var_32adf91d != radiationlevel)
	{
		var_6efc5d3e = 1;
	}
	var_50cd907d = radiationlevel > level.var_96929d7f[binitialsnap].var_32adf91d;
	level.var_96929d7f[binitialsnap].var_32adf91d = radiationlevel;
	var_ab5cd23a = fieldname >> 3;
	var_374bf850 = bwastimejump >> 3;
	if(var_6efc5d3e)
	{
		function_e352066c(binitialsnap);
	}
	if(function_8b3f3a7d(binitialsnap))
	{
		function_ec3bfba7(binitialsnap, radiationlevel, var_50cd907d);
	}
	if(var_ab5cd23a == var_374bf850 && !is_true(is_true(level.var_d91da973)))
	{
		return;
	}
	var_9ad901c3 = createuimodel(var_5e7fb773, "sickness");
	var_7720923c = level.radiation.levels[radiationlevel];
	keys = getarraykeys(var_7720923c.sickness);
	var_8bbfff89 = (var_6efc5d3e ? 0 : var_ab5cd23a & (~var_374bf850));
	for(var_a60a2640 = 0; var_8bbfff89 && var_a60a2640 < 7; var_a60a2640++)
	{
		if(!var_8bbfff89 & (1 << var_a60a2640))
		{
			continue;
		}
		var_63e3e25f = keys[var_a60a2640];
		if(!isdefined(var_63e3e25f))
		{
			continue;
		}
		var_46bdb64c = var_7720923c.sickness[var_63e3e25f];
		function_b200b0ea(binitialsnap, var_63e3e25f, var_46bdb64c);
	}
	if(!var_6efc5d3e && var_8bbfff89)
	{
		function_162db916(binitialsnap);
	}
	var_82b1c6a8 = (var_6efc5d3e ? var_374bf850 : (~var_ab5cd23a) & var_374bf850);
	for(var_a60a2640 = 0; var_82b1c6a8 && var_a60a2640 < 7; var_a60a2640++)
	{
		if(!var_82b1c6a8 & (1 << var_a60a2640))
		{
			continue;
		}
		var_63e3e25f = keys[var_a60a2640];
		if(isdefined(var_63e3e25f))
		{
			var_46bdb64c = var_7720923c.sickness[var_63e3e25f];
			function_9cc6a162(binitialsnap, var_63e3e25f, var_46bdb64c);
		}
	}
}

/*
	Name: function_8b3f3a7d
	Namespace: namespace_6615ea91
	Checksum: 0x6C548EE4
	Offset: 0xE80
	Size: 0x7E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8b3f3a7d(localclientnum)
{
	if(!self isplayer())
	{
		return false;
	}
	if(!isalive(self))
	{
		return false;
	}
	if(self isremotecontrolling(localclientnum))
	{
		return false;
	}
	if(squad_spawn::function_21b773d5(localclientnum))
	{
		return false;
	}
	return true;
}

/*
	Name: function_ec3bfba7
	Namespace: namespace_6615ea91
	Checksum: 0x434D5091
	Offset: 0xF08
	Size: 0x2FA
	Parameters: 3
	Flags: Linked, Private
*/
function private function_ec3bfba7(localclientnum, radiationlevel, var_50cd907d)
{
	if(!self isplayer())
	{
		return;
	}
	switch(var_50cd907d)
	{
		case 0:
		{
			var_ef12093e = undefined;
			break;
		}
		case 1:
		{
			var_ef12093e = #"hash_595f62c3706d32ab";
			break;
		}
		case 2:
		{
			var_ef12093e = #"hash_527718c36d03591f";
			break;
		}
		case 3:
		{
			var_ef12093e = #"hash_62105b9a2192156";
			break;
		}
		default:
		{
			var_ef12093e = undefined;
			break;
		}
	}
	if(isdefined(level.var_6d29a25e[radiationlevel]) && (!isdefined(var_ef12093e) || var_ef12093e != level.var_6d29a25e[radiationlevel]) && function_148ccc79(radiationlevel, level.var_6d29a25e[radiationlevel]))
	{
		if(var_50cd907d <= 0)
		{
			function_24cd4cfb(radiationlevel, level.var_6d29a25e[radiationlevel]);
		}
		else
		{
			codestoppostfxbundlelocal(radiationlevel, level.var_6d29a25e[radiationlevel]);
		}
	}
	if(isdefined(var_ef12093e) && (!isdefined(level.var_6d29a25e[radiationlevel]) || var_ef12093e != level.var_6d29a25e[radiationlevel]))
	{
		function_a837926b(radiationlevel, var_ef12093e);
	}
	level.var_6d29a25e[radiationlevel] = var_ef12093e;
	if(is_true(level.var_d91da973))
	{
		switch(var_50cd907d)
		{
			case 0:
			{
				function_f80b3e83(radiationlevel);
				break;
			}
			case 1:
			{
				function_f80b3e83(radiationlevel, "evt_radiation_dmg_1");
				break;
			}
			case 2:
			{
				function_f80b3e83(radiationlevel, "evt_radiation_dmg_2");
				break;
			}
			case 3:
			{
				function_f80b3e83(radiationlevel, "evt_radiation_dmg_3");
				break;
			}
		}
	}
}

/*
	Name: function_f80b3e83
	Namespace: namespace_6615ea91
	Checksum: 0x4BE8B238
	Offset: 0x1210
	Size: 0xDA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f80b3e83(localclientnum, alias)
{
	if(!isdefined(alias))
	{
		alias = undefined;
	}
	if(isdefined(alias) && self isplayingloopsound(alias))
	{
		return;
	}
	var_1155a6d7 = level.var_96929d7f[localclientnum].loopsound;
	if(isdefined(var_1155a6d7))
	{
		function_d48752e(localclientnum, var_1155a6d7);
		level.var_96929d7f[localclientnum].loopsound = undefined;
	}
	if(isdefined(alias))
	{
		level.var_96929d7f[localclientnum].loopsound = function_604c9983(localclientnum, alias);
	}
}

/*
	Name: function_5cb7f849
	Namespace: namespace_6615ea91
	Checksum: 0x29B13908
	Offset: 0x12F8
	Size: 0xD6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5cb7f849(localclientnum)
{
	if(!namespace_956bd4dd::function_ab99e60c())
	{
		return;
	}
	while(true)
	{
		localplayer = function_5c10bd79(localclientnum);
		if(localplayer function_8b3f3a7d(localclientnum))
		{
			radiationlevel = localplayer clientfield::get_to_player("radiation") & (8 - 1);
			localplayer function_ec3bfba7(localclientnum, radiationlevel);
		}
		else
		{
			localplayer function_ec3bfba7(localclientnum, 0);
		}
		waitframe(1);
	}
}

