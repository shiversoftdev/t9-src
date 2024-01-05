#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_4ce4e65e;

/*
	Name: function_85ff460f
	Namespace: namespace_4ce4e65e
	Checksum: 0xFA0DDF75
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_85ff460f()
{
	level notify(435618841);
}

/*
	Name: init
	Namespace: namespace_4ce4e65e
	Checksum: 0xC83A804C
	Offset: 0x140
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_a353323e = &function_cb5a4b1a;
	level.var_ae2fe3bd = &function_613a7ccc;
}

/*
	Name: function_cb5a4b1a
	Namespace: namespace_4ce4e65e
	Checksum: 0x888BDD23
	Offset: 0x180
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_cb5a4b1a()
{
	music::setmusicstate("common_exfil");
}

/*
	Name: function_613a7ccc
	Namespace: namespace_4ce4e65e
	Checksum: 0xB4256453
	Offset: 0x1A8
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_613a7ccc(b_success)
{
	if(!isdefined(b_success))
	{
		b_success = 0;
	}
	if(b_success)
	{
		music::setmusicstate("common_exfil_success");
	}
	else
	{
		music::setmusicstate("common_exfil_fail");
	}
}

/*
	Name: function_4f292ffc
	Namespace: namespace_4ce4e65e
	Checksum: 0x5A3072F9
	Offset: 0x210
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_4f292ffc()
{
	wait(1);
	function_dd9efc4();
}

/*
	Name: function_453254ee
	Namespace: namespace_4ce4e65e
	Checksum: 0xB1812267
	Offset: 0x238
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_453254ee()
{
	function_c383014f();
}

/*
	Name: function_dd9efc4
	Namespace: namespace_4ce4e65e
	Checksum: 0xA586F467
	Offset: 0x258
	Size: 0xD2
	Parameters: 0
	Flags: Linked
*/
function function_dd9efc4()
{
	if(!isdefined(level.var_8c5cb77b))
	{
		level.var_8c5cb77b = [2:"assault_round_02", 1:"assault_round_01", 0:"assault_round_00"];
		level.var_8c5cb77b = array::randomize(level.var_8c5cb77b);
	}
	level.var_b8089dfc = array::pop_front(level.var_8c5cb77b);
	level thread zm_audio::function_b36aeaf6(level.var_b8089dfc);
	if(level.var_8c5cb77b.size == 0)
	{
		level.var_8c5cb77b = undefined;
	}
}

/*
	Name: function_c383014f
	Namespace: namespace_4ce4e65e
	Checksum: 0x2D97709C
	Offset: 0x338
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_c383014f()
{
	if(isdefined(level.var_b8089dfc))
	{
		level thread zm_audio::function_2354b945(level.var_b8089dfc);
	}
}

