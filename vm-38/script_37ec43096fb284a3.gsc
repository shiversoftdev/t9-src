#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_d0ab5955;

/*
	Name: function_a5f4007a
	Namespace: namespace_d0ab5955
	Checksum: 0x836EE3A
	Offset: 0x1B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a5f4007a()
{
	level notify(-918358352);
}

/*
	Name: __init__system__
	Namespace: namespace_d0ab5955
	Checksum: 0x70C00689
	Offset: 0x1D0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_d07e35f920d16a8", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d0ab5955
	Checksum: 0x85AC4BB4
	Offset: 0x228
	Size: 0x278
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	clientfield::register("scriptmover", "fogofwarflag", 1, 1, "int", &function_a380fe5, 0, 0);
	clientfield::register("toplayer", "fogofwareffects", 1, 2, "int", undefined, 0, 1);
	clientfield::register("toplayer", "fogofwartimer", 1, 1, "int", &function_947e99a9, 0, 1);
	clientfield::register("allplayers", "outsidetile", 1, 1, "int", undefined, 0, 0);
	clientfield::register("world", "tile_id", 1, 6, "int", &function_ec0b7087, 1, 0);
	if(!is_true(getgametypesetting(#"hash_59854c1f30538261")))
	{
		return;
	}
	level.var_7bd7bdc8 = [3:#"hash_54da2f2da5752d99", 2:#"hash_2964f82e2c05c8b8", 1:#"hash_6a04f899ab555f22"];
	level.var_6e62d281 = #"hash_289962ed0e76921d";
	var_ac22a760 = struct::get_array(#"hash_3460aae6bb799a99", "content_key");
	for(index = 1; index <= var_ac22a760.size; index++)
	{
		var_ac22a760[index - 1].id = index;
	}
	callback::on_localclient_connect(&on_localclient_connect);
	level.var_e9d75843 = [];
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_d0ab5955
	Checksum: 0x80F724D1
	Offset: 0x4A8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: function_a380fe5
	Namespace: namespace_d0ab5955
	Checksum: 0x7E30411B
	Offset: 0x4B8
	Size: 0x16C
	Parameters: 7
	Flags: Linked
*/
function function_a380fe5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(util::get_map_name() === "wz_sanatorium")
	{
		var_ee6bcd51 = #"hash_4a9cb80afea6f8cb" + "_sanatorium";
	}
	else
	{
		var_ee6bcd51 = #"hash_4a9cb80afea6f8cb";
	}
	var_fcd32b47 = array(#"hash_3a6936975102a2ad", #"hash_57b5acde2128e4b4", #"hash_70bad03d167e277e");
	if(isinarray(var_fcd32b47, self.model))
	{
		var_ee6bcd51 = #"hash_515a30ee41d5cb3c";
	}
	if(bwastimejump)
	{
		self playrenderoverridebundle(var_ee6bcd51);
		self function_78233d29(var_ee6bcd51, "", "Scale", 1);
	}
	else
	{
		self stoprenderoverridebundle(var_ee6bcd51);
	}
}

/*
	Name: function_ec0b7087
	Namespace: namespace_d0ab5955
	Checksum: 0x8C8D7688
	Offset: 0x630
	Size: 0x160
	Parameters: 7
	Flags: Linked
*/
function function_ec0b7087(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_ac22a760 = struct::get_array(#"hash_3460aae6bb799a99", "content_key");
	foreach(var_ea0ed69c in var_ac22a760)
	{
		var_f6b2bc6f = getent(fieldname, var_ea0ed69c.targetname, "target");
		if(isdefined(var_f6b2bc6f))
		{
			if(var_ea0ed69c.id == bwastimejump)
			{
				var_f6b2bc6f function_704c070e(fieldname);
				continue;
			}
			var_f6b2bc6f function_53a26ea0(fieldname);
		}
	}
}

/*
	Name: on_localclient_connect
	Namespace: namespace_d0ab5955
	Checksum: 0xF29FBE49
	Offset: 0x798
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function on_localclient_connect(localclientnum)
{
	level thread function_347f52dd(localclientnum);
	setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "outOfBoundsEndTime"), 0);
}

/*
	Name: function_347f52dd
	Namespace: namespace_d0ab5955
	Checksum: 0x3FE3F512
	Offset: 0x818
	Size: 0x114
	Parameters: 1
	Flags: Linked, Private
*/
function private function_347f52dd(localclientnum)
{
	self notify("5f0aae0b62f9428b");
	self endon("5f0aae0b62f9428b");
	var_ef2f4cec = spawnstruct();
	level.var_e9d75843[localclientnum] = var_ef2f4cec;
	while(true)
	{
		currentplayer = function_5c10bd79(localclientnum);
		if(!isdefined(currentplayer))
		{
			waitframe(1);
			continue;
		}
		intensity = currentplayer clientfield::get_to_player("fogofwareffects");
		if(var_ef2f4cec.var_6f2e5a2b !== intensity)
		{
			var_ef2f4cec notify(#"hash_387bb78db1d4d1be");
			var_ef2f4cec function_d45dd62(localclientnum, intensity, currentplayer);
			var_ef2f4cec.var_6f2e5a2b = intensity;
		}
		waitframe(1);
	}
}

/*
	Name: function_947e99a9
	Namespace: namespace_d0ab5955
	Checksum: 0x24D1F530
	Offset: 0x938
	Size: 0xE4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_947e99a9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	oobmodel = getuimodel(function_1df4c3b0(fieldname, #"hud_items"), "outOfBoundsEndTime");
	if(bwastimejump > 0)
	{
		setuimodelvalue(oobmodel, getservertime(0, 1) + level.oob_timelimit_ms);
	}
	else
	{
		setuimodelvalue(oobmodel, 0);
	}
}

/*
	Name: function_d45dd62
	Namespace: namespace_d0ab5955
	Checksum: 0xCDE0CA
	Offset: 0xA28
	Size: 0x21A
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d45dd62(localclientnum, intensity, currentplayer)
{
	if(!isdefined(intensity))
	{
		intensity = 0;
	}
	if(isdefined(self.var_7bd7bdc8))
	{
		function_24cd4cfb(localclientnum, self.var_7bd7bdc8);
		self.var_7bd7bdc8 = undefined;
		if(isdefined(self.var_6e62d281))
		{
			stopfx(localclientnum, self.var_6e62d281);
		}
		self.var_6e62d281 = undefined;
	}
	if(isdefined(currentplayer.var_103fdf58))
	{
		playsound(localclientnum, #"hash_37b1613c2cb4c8f3", (0, 0, 0));
		currentplayer stoploopsound(currentplayer.var_103fdf58);
		currentplayer.var_103fdf58 = undefined;
	}
	postfx = level.var_7bd7bdc8[intensity];
	if(isdefined(postfx))
	{
		if(function_148ccc79(localclientnum, postfx))
		{
			codestoppostfxbundlelocal(localclientnum, postfx);
		}
		function_a837926b(localclientnum, postfx);
		if(viewmodelhastag(localclientnum, "tag_torso"))
		{
			self.var_6e62d281 = playviewmodelfx(localclientnum, level.var_6e62d281, "tag_torso");
		}
		self.var_7bd7bdc8 = postfx;
		if(!isdefined(currentplayer.var_103fdf58))
		{
			playsound(localclientnum, #"hash_7b5289d48cc02d77", (0, 0, 0));
			currentplayer.var_103fdf58 = currentplayer playloopsound("evt_sr_phase_player_lp");
		}
	}
}

