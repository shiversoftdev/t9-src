#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_9f2e6680;

/*
	Name: function_68ffd24a
	Namespace: namespace_9f2e6680
	Checksum: 0x61BDCB6A
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_68ffd24a()
{
	level notify(872643020);
}

/*
	Name: init
	Namespace: namespace_9f2e6680
	Checksum: 0x6A733441
	Offset: 0x150
	Size: 0x214
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hash_e3e178ca4bfed0a", 16000, 1, "int", &function_770151a9, 0, 0);
	clientfield::register("world", "" + #"hash_4bbd14acfb65a055", 16000, 1, "counter", &function_e9ae3d81, 0, 0);
	clientfield::register("world", "" + #"hash_6ad15545c118bf44", 16000, 6, "int", &function_9b54b294, 0, 0);
	clientfield::register("world", "" + #"play_charge_fx", 16000, 1, "int", &play_charge_fx, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_438f8800ecce6fba", 16000, 1, "int", &function_b5268151, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_631477f00832803c", 16000, 1, "int", &function_aa1d2bf6, 0, 0);
}

/*
	Name: play_charge_fx
	Namespace: namespace_9f2e6680
	Checksum: 0x2430C17
	Offset: 0x370
	Size: 0x122
	Parameters: 7
	Flags: Linked
*/
function play_charge_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_7f49111b = getent(fieldname, "power_cell_charge_base", "targetname");
	if(isdefined(var_7f49111b.var_d3c6a366))
	{
		stopfx(fieldname, var_7f49111b.var_d3c6a366);
		var_7f49111b.var_d3c6a366 = undefined;
	}
	if(bwasdemojump == 1 && isdefined(var_7f49111b))
	{
		var_7f49111b.var_d3c6a366 = playfx(fieldname, #"hash_7ac1bd398f0f3d90", var_7f49111b.origin, anglestoforward(var_7f49111b.angles), anglestoup(var_7f49111b.angles));
	}
}

/*
	Name: function_b5268151
	Namespace: namespace_9f2e6680
	Checksum: 0x20205BB7
	Offset: 0x4A0
	Size: 0xD2
	Parameters: 7
	Flags: Linked
*/
function function_b5268151(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		var_3e0b2cbd = self gettagorigin("tag_scanner");
		var_8946daad = vectorscale((1, 0, 0), 20);
		self.var_1e7bc717 = playfx(fieldname, #"hash_6dd20a5f232201ca", var_3e0b2cbd, anglestoforward(var_8946daad), anglestoup(var_8946daad));
	}
}

/*
	Name: function_770151a9
	Namespace: namespace_9f2e6680
	Checksum: 0x6D526315
	Offset: 0x580
	Size: 0x14C
	Parameters: 7
	Flags: Linked
*/
function function_770151a9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		forcestreamxmodel(#"hash_2316d83ec18a618d");
		forcestreamxmodel(#"hash_4b2a32bf16b6481d");
		forcestreamxmodel(#"hash_2316d53ec18a5c74");
		forcestreamxmodel(#"hash_2316d63ec18a5e27");
	}
	else
	{
		stopforcestreamingxmodel(#"hash_2316d83ec18a618d");
		stopforcestreamingxmodel(#"hash_4b2a32bf16b6481d");
		stopforcestreamingxmodel(#"hash_2316d53ec18a5c74");
		stopforcestreamingxmodel(#"hash_2316d63ec18a5e27");
	}
}

/*
	Name: function_e9ae3d81
	Namespace: namespace_9f2e6680
	Checksum: 0x107CFC3D
	Offset: 0x6D8
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_e9ae3d81(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_14db7cdb = getent(bwasdemojump, "ww_quest_computer_screen", "targetname");
	var_14db7cdb setmodel(#"hash_2316d83ec18a618d");
}

/*
	Name: function_9b54b294
	Namespace: namespace_9f2e6680
	Checksum: 0xF0261CCB
	Offset: 0x770
	Size: 0x1AC
	Parameters: 7
	Flags: Linked
*/
function function_9b54b294(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_14db7cdb = getent(fieldname, "ww_quest_computer_screen", "targetname");
	var_14db7cdb setmodel(#"hash_2316d83ec18a618d");
	waitframe(1);
	if(bwasdemojump)
	{
		b_clockwise = (bwasdemojump & 32) == 0;
		var_14db7cdb thread function_5d7d4dd0(fieldname, bwasdemojump & 31, b_clockwise);
	}
	else
	{
		var_14db7cdb notify(#"turn_off");
		level.var_4965c181[fieldname] = undefined;
		playsound(fieldname, #"hash_30c83800bc972d7a", var_14db7cdb gettagorigin("tag_screen_fx"));
		if(isdefined(level.var_838bf3b1[fieldname]))
		{
			level.var_838bf3b1[fieldname] delete();
		}
		if(isdefined(level.var_3e560871[fieldname]))
		{
			level.var_3e560871[fieldname] delete();
		}
	}
}

/*
	Name: function_5d7d4dd0
	Namespace: namespace_9f2e6680
	Checksum: 0x96E68360
	Offset: 0x928
	Size: 0x16C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_5d7d4dd0(localclientnum, var_76f1881e, b_clockwise)
{
	if(!isdefined(b_clockwise))
	{
		b_clockwise = 1;
	}
	/#
		assert(var_76f1881e > 0 && var_76f1881e <= 20);
	#/
	v_center = self gettagorigin("tag_screen_fx");
	if(!isdefined(level.var_838bf3b1[localclientnum]))
	{
		level.var_838bf3b1[localclientnum] = util::spawn_model(localclientnum, #"hash_2316d53ec18a5c74", v_center);
	}
	if(!isdefined(level.var_3e560871[localclientnum]))
	{
		level.var_3e560871[localclientnum] = util::spawn_model(localclientnum, #"hash_2316d63ec18a5e27", v_center);
	}
	if(!isdefined(level.var_4965c181[localclientnum]))
	{
		level.var_4965c181[localclientnum] = 0;
		level function_b2061f2f(1, localclientnum);
	}
	self function_5824b6e(var_76f1881e, b_clockwise, localclientnum);
}

/*
	Name: function_5824b6e
	Namespace: namespace_9f2e6680
	Checksum: 0x65744642
	Offset: 0xAA0
	Size: 0xC4
	Parameters: 3
	Flags: Linked
*/
function function_5824b6e(var_76f1881e, b_clockwise, localclientnum)
{
	level endon(#"end_game");
	self endon(#"death", #"turn_off");
	do
	{
		wait(0.5);
		level function_b2061f2f(b_clockwise, localclientnum);
	}
	while(level.var_4965c181[localclientnum] != var_76f1881e);
	level.var_838bf3b1[localclientnum] playsound(localclientnum, #"hash_b1ecaea59103899");
}

/*
	Name: function_b2061f2f
	Namespace: namespace_9f2e6680
	Checksum: 0x23589214
	Offset: 0xB70
	Size: 0x204
	Parameters: 2
	Flags: Linked
*/
function function_b2061f2f(b_clockwise, localclientnum)
{
	if(b_clockwise)
	{
		level.var_4965c181[localclientnum]++;
		if(level.var_4965c181[localclientnum] > 20)
		{
			level.var_4965c181[localclientnum] = level.var_4965c181[localclientnum] - 20;
		}
	}
	else
	{
		level.var_4965c181[localclientnum]--;
		if(level.var_4965c181[localclientnum] <= 0)
		{
			level.var_4965c181[localclientnum] = level.var_4965c181[localclientnum] + 20;
		}
	}
	var_9085056e = level.var_838bf3b1[localclientnum];
	var_f6f1e92e = level.var_3e560871[localclientnum];
	var_9085056e playsound(localclientnum, #"hash_3d0cf473b49c2cb3");
	n_angle = ((level.var_4965c181[localclientnum] - 1) * -1) * 18;
	if(level.var_4965c181[localclientnum] % 2)
	{
		var_f6f1e92e.angles = (var_f6f1e92e.angles[0], var_f6f1e92e.angles[1], n_angle);
		var_f6f1e92e show();
		var_9085056e hide();
	}
	else
	{
		var_9085056e.angles = (var_9085056e.angles[0], var_9085056e.angles[1], n_angle);
		var_9085056e show();
		var_f6f1e92e hide();
	}
}

/*
	Name: function_aa1d2bf6
	Namespace: namespace_9f2e6680
	Checksum: 0xFACC7B08
	Offset: 0xD80
	Size: 0x12C
	Parameters: 7
	Flags: Linked
*/
function function_aa1d2bf6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	level endon(#"end_game");
	if(bwasdemojump)
	{
		var_79bb44c5 = util::spawn_model(fieldname, #"hash_130813d3a3ab8977", self.origin, self.angles);
		board_rotate_origin = getent(fieldname, "board_rotate_origin", "targetname");
		var_79bb44c5 linkto(board_rotate_origin);
		board_rotate_origin rotateto(board_rotate_origin.angles + vectorscale((0, 1, 0), 90), 3);
		var_79bb44c5 playsound(fieldname, #"hash_1500984cecfd6a57");
	}
}

