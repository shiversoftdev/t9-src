#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_a6ddb172;

/*
	Name: function_14cb7022
	Namespace: namespace_a6ddb172
	Checksum: 0x92EADD07
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_14cb7022()
{
	level notify(854451761);
}

/*
	Name: init
	Namespace: namespace_a6ddb172
	Checksum: 0x6B2F0871
	Offset: 0x108
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "banner_event", 1, 6, "int");
	clientfield::register("world", "banner_eventplayer", 1, 6, "int");
}

/*
	Name: function_7a0e5387
	Namespace: namespace_a6ddb172
	Checksum: 0x196244C6
	Offset: 0x178
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_7a0e5387(event)
{
	if(!isdefined(event))
	{
		event = 63;
	}
	level clientfield::set("banner_event", 0);
	util::wait_network_frame();
	level clientfield::set("banner_event", event);
}

