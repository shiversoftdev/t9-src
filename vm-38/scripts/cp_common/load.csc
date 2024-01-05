#using script_45af62df1bb6015d;
#using script_c22b8fa254e64a0;
#using scripts\weapons\spike_charge.csc;
#using scripts\weapons\cp\weaponobjects.csc;
#using scripts\cp_common\skipto.csc;
#using scripts\cp_common\rotating_object.csc;
#using scripts\cp_common\oed.csc;
#using script_6c15b80dfa790b53;
#using scripts\cp_common\global_fx.csc;
#using scripts\cp_common\ambient.csc;
#using scripts\core_common\vehicles\driving_fx.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\clientfaceanim_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using script_31a4e84bd38b34e2;
#using scripts\core_common\status_effects\status_effects.csc;
#using scripts\weapons\antipersonnelguidance.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\traps_deployable.csc;
#using scripts\core_common\turret_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using script_1d4ca739cb476f50;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\helicopter_sounds_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace load;

/*
	Name: function_ed0764ef
	Namespace: load
	Checksum: 0xCD9D81F
	Offset: 0x160
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ed0764ef()
{
	level notify(-451598296);
}

/*
	Name: levelnotifyhandler
	Namespace: load
	Checksum: 0xF5843FA7
	Offset: 0x180
	Size: 0x4E
	Parameters: 3
	Flags: Linked
*/
function levelnotifyhandler(clientnum, state, oldstate)
{
	if(oldstate != "")
	{
		level notify(oldstate, {#localclientnum:state});
	}
}

/*
	Name: function_aeb1baea
	Namespace: load
	Checksum: 0xCE9781C3
	Offset: 0x1D8
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
	Checksum: 0xE8C3DC02
	Offset: 0x220
	Size: 0x174
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
	if(is_true(level._loadstarted))
	{
		return;
	}
	level._loadstarted = 1;
	level thread util::init_utility();
	level thread register_clientfields();
	util::registersystem("levelNotify", &levelnotifyhandler);
	level.createfx_disable_fx = getdvarint(#"disable_fx", 0) == 1;
	callback::add_callback(#"on_localclient_connect", &basic_player_connect);
	callback::on_spawned(&on_player_spawned);
	system::function_c11b0642();
	art_review();
	level flag::set(#"load_main_complete");
}

/*
	Name: basic_player_connect
	Namespace: load
	Checksum: 0xCFDACF2E
	Offset: 0x3A0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function basic_player_connect(localclientnum)
{
	forcegamemodemappings(localclientnum, "default");
}

/*
	Name: on_player_spawned
	Namespace: load
	Checksum: 0xEA359673
	Offset: 0x3D8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function on_player_spawned(localclientnum)
{
	level flag::set(#"hash_31f7d14ea61c9b88");
	level flag::clear(#"hash_31f7d14ea61c9b88");
	self thread force_update_player_clientfields(localclientnum);
	self function_b181fc06(localclientnum);
}

/*
	Name: force_update_player_clientfields
	Namespace: load
	Checksum: 0x52C24A9C
	Offset: 0x460
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function force_update_player_clientfields(localclientnum)
{
	self endon(#"death");
	while(!clienthassnapshot(localclientnum))
	{
		waitframe(1);
	}
	self processclientfieldsasifnew(1);
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0x80F724D1
	Offset: 0x4C8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
}

