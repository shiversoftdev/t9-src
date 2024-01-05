#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_531a6d61ee606513;
#using script_58087978e7d5a0fd;

#namespace namespace_5c4c9a39;

/*
	Name: function_99e973a1
	Namespace: namespace_5c4c9a39
	Checksum: 0xE9255247
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_99e973a1()
{
	level notify(-1417020361);
}

/*
	Name: init
	Namespace: namespace_5c4c9a39
	Checksum: 0xD534F328
	Offset: 0xD8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.zm_gold_hud = zm_gold_hud::register();
	level.zm_gold_align_satellite_hud = zm_gold_align_satellite_hud::register();
	/#
		level thread function_37597f29();
	#/
}

/*
	Name: function_1aeb4889
	Namespace: namespace_5c4c9a39
	Checksum: 0x50F0CB11
	Offset: 0x130
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_1aeb4889()
{
	if(!level.zm_gold_hud zm_gold_hud::is_open(self))
	{
		level.zm_gold_hud zm_gold_hud::open(self);
	}
}

/*
	Name: close_hud
	Namespace: namespace_5c4c9a39
	Checksum: 0x876F3782
	Offset: 0x180
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function close_hud()
{
	if(level.zm_gold_hud zm_gold_hud::is_open(self))
	{
		level.zm_gold_hud zm_gold_hud::close(self);
	}
}

/*
	Name: function_b488623
	Namespace: namespace_5c4c9a39
	Checksum: 0x7C8C83EA
	Offset: 0x1D0
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_b488623(b_show)
{
	if(is_true(b_show))
	{
		if(!level.zm_gold_align_satellite_hud zm_gold_align_satellite_hud::is_open(self))
		{
			level.zm_gold_align_satellite_hud zm_gold_align_satellite_hud::open(self);
		}
	}
	else if(level.zm_gold_align_satellite_hud zm_gold_align_satellite_hud::is_open(self))
	{
		level.zm_gold_align_satellite_hud zm_gold_align_satellite_hud::close(self);
	}
}

/*
	Name: function_13ebb331
	Namespace: namespace_5c4c9a39
	Checksum: 0xEFDF37E3
	Offset: 0x280
	Size: 0x68
	Parameters: 2
	Flags: Linked
*/
function function_13ebb331(v_origin_or_ent, str_targetname)
{
	volume = getent(str_targetname, "targetname");
	if(isdefined(volume) && self istouching(volume))
	{
		return true;
	}
	return false;
}

/*
	Name: function_37597f29
	Namespace: namespace_5c4c9a39
	Checksum: 0x2996E357
	Offset: 0x2F0
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_37597f29()
{
	/#
		adddebugcommand("");
		adddebugcommand("");
		level flag::wait_till("");
		zm_devgui::add_custom_devgui_callback(&function_72c803d3);
	#/
}

/*
	Name: function_e76968e1
	Namespace: namespace_5c4c9a39
	Checksum: 0x8E7562D1
	Offset: 0x378
	Size: 0xA0
	Parameters: 1
	Flags: None
*/
function function_e76968e1(show)
{
	/#
		foreach(player in function_a1ef346b())
		{
			player function_b488623(show);
		}
	#/
}

/*
	Name: function_72c803d3
	Namespace: namespace_5c4c9a39
	Checksum: 0x5373BD61
	Offset: 0x420
	Size: 0x8A
	Parameters: 1
	Flags: None
*/
function function_72c803d3(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_2c0a3e57a006c81d":
			{
				function_e76968e1(1);
				break;
			}
			case "hash_3a2f14069605556a":
			{
				function_e76968e1(0);
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

