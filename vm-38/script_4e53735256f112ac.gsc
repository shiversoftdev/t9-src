#using script_1e30f5109f6bf48c;
#using script_7c727635e50af640;
#using script_37560a24283a601;
#using script_68ae4d25b2c90f7d;
#using script_7b5224fe73522c;
#using scripts\zm_common\zm_utility.csc;
#using script_680dddbda86931fa;
#using script_618d6f5ff5d18933;
#using script_101d8280497ff416;
#using script_3d35e2ff167b3a82;
#using scripts\core_common\item_inventory.csc;
#using script_20055f2f97341caa;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_1b527536;

/*
	Name: function_17a0e6e
	Namespace: namespace_1b527536
	Checksum: 0xCF9AF991
	Offset: 0x1C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_17a0e6e()
{
	level notify(-1296168424);
}

/*
	Name: __init__system__
	Namespace: namespace_1b527536
	Checksum: 0xDB382261
	Offset: 0x1E0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_13a43d760497b54d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_1b527536
	Checksum: 0x5456C1A9
	Offset: 0x228
	Size: 0x3EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_9bff3a72 = getgametypesetting(#"hash_7dedd27bf994a9a9");
	if(!is_true(level.var_9bff3a72))
	{
		return;
	}
	level.var_1b527536 = array(#"hash_85edf3a63bb488c", #"frost_blast_1", #"frost_blast_2", #"frost_blast_3", #"frost_blast_4", #"frost_blast_5", #"heal_aoe", #"hash_379869d5b6da974b", #"hash_37986ad5b6da98fe", #"hash_37986bd5b6da9ab1", #"hash_37986cd5b6da9c64", #"hash_37986dd5b6da9e17", #"energy_mine", #"energy_mine_1", #"energy_mine_2", #"energy_mine_3", #"energy_mine_4", #"hash_4ac3fea4add2a2c9", #"aether_shroud", #"hash_164c43cbd0ee958", #"hash_164c73cbd0eee71", #"hash_164c63cbd0eecbe", #"hash_164c93cbd0ef1d7", #"hash_164c83cbd0ef024", #"ring_of_fire", #"hash_631a223758cd92a", #"hash_631a123758cd777", #"hash_631a023758cd5c4", #"hash_6319f23758cd411", #"hash_6319e23758cd25e", #"hash_55569355da0f0f68", #"hash_43e326396554e18c", #"hash_43e329396554e6a5", #"hash_43e328396554e4f2", #"hash_43e323396554dc73", #"hash_43e322396554dac0");
	clientfield::register_clientuimodel("hud_items.ammoCooldowns.fieldUpgrade", #"hud_items", [1:#"fieldupgrade", 0:#"hash_2f126bd99a74de8b"], 1, 5, "float", undefined, 0, 0);
	clientfield::register("toplayer", "field_upgrade_selected", 1, 5, "int", &function_473fedfd, 0, 0);
	clientfield::register("allplayers", "field_upgrade_fired", 1, 4, "counter", &function_1079747f, 0, 0);
	clientfield::function_91cd7763("material", "zm_field_upgrade_loadout.overrideImage", #"hash_282d81d9dcedf39f", #"hash_576024ecd35731c2", 16000, undefined, 0, 0);
}

/*
	Name: function_473fedfd
	Namespace: namespace_1b527536
	Checksum: 0x2B928DEF
	Offset: 0x620
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_473fedfd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_64774ae3 = undefined;
	if(bwastimejump > 0)
	{
		var_64774ae3 = level.var_1b527536[bwastimejump - 1];
	}
	if(!isdefined(var_64774ae3))
	{
		var_64774ae3 = #"";
	}
	model = function_1df4c3b0(fieldname, #"hash_282d81d9dcedf39f");
	setuimodelvalue(getuimodel(model, "count"), 0);
	setuimodelvalue(getuimodel(model, "id"), var_64774ae3);
}

/*
	Name: function_1079747f
	Namespace: namespace_1b527536
	Checksum: 0xB6E2D40C
	Offset: 0x738
	Size: 0x322
	Parameters: 7
	Flags: Linked
*/
function function_1079747f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	switch(bwastimejump)
	{
		case 1:
		{
			var_5f8075ff = #"hash_48008a3a2268e196";
			var_c785352b = #"hash_47f99e3a2262e4e4";
			break;
		}
		case 2:
		{
			var_5f8075ff = #"hash_6754f5f14b55f3ff";
			var_c785352b = #"hash_674f09f14b51aa4d";
			break;
		}
		case 3:
		{
			var_5f8075ff = #"hash_48e29537fcb81599";
			var_c785352b = #"hash_48e9a137fcbe48ab";
			break;
		}
		case 4:
		{
			var_5f8075ff = #"hash_7238cf4ee4d6c516";
			var_c785352b = #"hash_7231e34ee4d0c864";
			break;
		}
		case 5:
		{
			var_5f8075ff = #"hash_4c83572625d08ca";
			var_c785352b = #"hash_4c22972625888b8";
			break;
		}
		case 6:
		{
			var_5f8075ff = #"hash_79a0e1fa0ed24c50";
			var_c785352b = #"hash_79a6edfa0ed6cc62";
			break;
		}
		case 7:
		{
			break;
		}
		case 8:
		{
			break;
		}
	}
	if(isdefined(self.var_75fbe496))
	{
		stopfx(fieldname, self.var_75fbe496);
		self.var_75fbe496 = undefined;
	}
	if(isdefined(self.var_410de60b))
	{
		stopfx(fieldname, self.var_410de60b);
		self.var_410de60b = undefined;
	}
	if(isdefined(var_5f8075ff) && isdefined(var_c785352b))
	{
		if(zm_utility::function_f8796df3(fieldname))
		{
			if(viewmodelhastag(fieldname, "tag_fx_05"))
			{
				self.var_75fbe496 = playviewmodelfx(fieldname, var_5f8075ff, "tag_fx_05");
			}
		}
		else
		{
			self util::waittill_dobj(fieldname);
			if(self haspart(fieldname, "tag_fx_05"))
			{
				self.var_410de60b = util::playfxontag(fieldname, var_c785352b, self, "tag_fx_05");
			}
		}
	}
}

