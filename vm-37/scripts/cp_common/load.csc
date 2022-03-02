#using script_12578f6acd24ec34;
#using script_17179876e0e27f8c;
#using script_1d4ca739cb476f50;
#using script_31a4e84bd38b34e2;
#using script_45af62df1bb6015d;
#using script_45e0fb7326469ccf;
#using script_4e38b3316a305ce7;
#using script_5f01badf05cc8ed1;
#using script_6c15b80dfa790b53;
#using script_c22b8fa254e64a0;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfaceanim_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\helicopter_sounds_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\traps_deployable.csc;
#using scripts\core_common\turret_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\cp_common\ambient.csc;
#using scripts\cp_common\global_fx.csc;
#using scripts\cp_common\oed.csc;
#using scripts\cp_common\rotating_object.csc;
#using scripts\cp_common\skipto.csc;

#namespace load;

/*
	Name: levelnotifyhandler
	Namespace: load
	Checksum: 0xD1C3FD79
	Offset: 0x160
	Size: 0x4E
	Parameters: 3
	Flags: None
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
	Checksum: 0xFA73DF06
	Offset: 0x1B8
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
	Checksum: 0x580F0B38
	Offset: 0x200
	Size: 0x194
	Parameters: 0
	Flags: None
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
	callback::on_localclient_shutdown(&on_player_shutdown);
	system::function_c11b0642();
	art_review();
	level flag::set(#"load_main_complete");
}

/*
	Name: basic_player_connect
	Namespace: load
	Checksum: 0x5A4D659B
	Offset: 0x3A0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function basic_player_connect(localclientnum)
{
	forcegamemodemappings(localclientnum, "default");
}

/*
	Name: on_player_spawned
	Namespace: load
	Checksum: 0xE7EDC5A8
	Offset: 0x3D8
	Size: 0x7C
	Parameters: 1
	Flags: None
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
	Checksum: 0xDB0018AD
	Offset: 0x460
	Size: 0x5C
	Parameters: 1
	Flags: None
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
	Name: on_player_shutdown
	Namespace: load
	Checksum: 0xD37A4FEF
	Offset: 0x4C8
	Size: 0x118
	Parameters: 1
	Flags: None
*/
function on_player_shutdown(localclientnum)
{
	foreach(var_883bd19d in level.var_a706401b)
	{
		foreach(var_5aec6a8d in var_883bd19d)
		{
			if([[ var_5aec6a8d.var_34327e5a ]]->is_open(localclientnum))
			{
				[[ var_5aec6a8d.var_34327e5a ]]->close(localclientnum);
			}
		}
	}
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0x80F724D1
	Offset: 0x5E8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function register_clientfields()
{
}

