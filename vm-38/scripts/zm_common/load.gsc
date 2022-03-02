#using script_165beea08a63a243;
#using script_16f6e32fce786c0d;
#using script_1c65dbfc2f1c8d8f;
#using script_2a30ac7aa0ee8988;
#using script_3f9e0dc8454d98e1;
#using script_4108035fe400ce67;
#using script_42f9a645e203120c;
#using script_47495939f228e438;
#using script_53f13b381cd4251d;
#using script_54f593f5beb1464a;
#using script_5e96d104c70be5ac;
#using script_655e1025200f4d5b;
#using script_6a9de48d8cd7ee4b;
#using script_7bacb32f8222fa3e;
#using script_bf0c2c69ce5745e;
#using script_d5e47f3a0e95613;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\zm_common\art.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\gametypes\clientids.gsc;
#using scripts\zm_common\gametypes\serversettings.gsc;
#using scripts\zm_common\gametypes\shellshock.gsc;
#using scripts\zm_common\gametypes\spawnlogic.gsc;
#using scripts\zm_common\gametypes\spectating.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_clone.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace load;

/*
	Name: function_2e3abd52
	Namespace: load
	Checksum: 0x1F57D7E8
	Offset: 0x298
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2e3abd52()
{
	level notify(787957941);
}

/*
	Name: function_e0a8e4ba
	Namespace: load
	Checksum: 0xF0614EB2
	Offset: 0x2B8
	Size: 0x25C
	Parameters: 1
	Flags: Linked, Private, Event
*/
event private function_e0a8e4ba(struct)
{
	foreach(k in [3:"script_unitrigger_type", 2:"zombie_weapon_upgrade", 1:"content_key", 0:"content_script_name"])
	{
		if(!isdefined(level.var_41204f29))
		{
			level.var_41204f29 = [];
		}
		else if(!isarray(level.var_41204f29))
		{
			level.var_41204f29 = array(level.var_41204f29);
		}
		if(!isinarray(level.var_41204f29, tolower(k)))
		{
			level.var_41204f29[level.var_41204f29.size] = tolower(k);
		}
	}
	level.var_5e990e96 = arraycopy(level.var_41204f29);
	if(isdefined(level.struct))
	{
		temp = arraycopy(level.struct);
		level.struct = [];
		foreach(struct in temp)
		{
			struct::init(struct);
		}
	}
	function_6c07201b("CreateStruct", &function_e0a8e4ba);
}

/*
	Name: function_aeb1baea
	Namespace: load
	Checksum: 0xECD52CCC
	Offset: 0x520
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_aeb1baea()
{
	/#
		assert(!isdefined(level.var_f18a6bd6));
	#/
	level.var_f18a6bd6 = &function_5e443ed1;
}

/*
	Name: function_5e443ed1
	Namespace: load
	Checksum: 0x3A059C06
	Offset: 0x568
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_5e443ed1()
{
	/#
		/#
			assert(isdefined(level.first_frame), "");
		#/
	#/
	zm::init();
	level._loadstarted = 1;
	register_clientfields();
	level.aitriggerspawnflags = getaitriggerflags() | 8192;
	level.vehicletriggerspawnflags = getvehicletriggerflags();
	level thread start_intro_screen_zm();
	system::function_c11b0642();
	level thread art_review();
	level flag::set(#"load_main_complete");
}

/*
	Name: start_intro_screen_zm
	Namespace: load
	Checksum: 0xB82C9C75
	Offset: 0x670
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function start_intro_screen_zm()
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] lui::screen_fade_out(0, undefined);
		players[i] val::set(#"start_intro_screen_zm", "freezecontrols");
	}
	wait(1);
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0xC773604C
	Offset: 0x710
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("allplayers", "zmbLastStand", 1, 1, "int");
}

