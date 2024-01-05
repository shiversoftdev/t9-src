#using script_13da4e6b98ca81a1;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace killcam_shared;

/*
	Name: function_59a2f520
	Namespace: killcam_shared
	Checksum: 0x835AA15D
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_59a2f520()
{
	level notify(163142667);
}

#namespace killcam;

/*
	Name: __init__system__
	Namespace: killcam
	Checksum: 0x3540B209
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"killcam", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: killcam
	Checksum: 0x55891FCD
	Offset: 0x100
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(sessionmodeiszombiesgame())
	{
		return;
	}
	callback::on_localclient_connect(&on_localclient_connect);
	callback::on_killcam_begin(&on_killcam_begin);
	callback::on_killcam_end(&on_killcam_end);
	callback::function_9fcd5f60(&function_9fcd5f60);
	callback::add_callback(#"hash_1184c2c2ed4c24b3", &function_c8bff20a);
}

/*
	Name: on_localclient_connect
	Namespace: killcam
	Checksum: 0x69F59D6E
	Offset: 0x1D8
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function on_localclient_connect(localclientnum)
{
	if(!isdefined(level.killcam))
	{
		level.killcam = [];
	}
	if(!isdefined(level.killcam[localclientnum]))
	{
		level.killcam[localclientnum] = {};
	}
}

/*
	Name: function_c8bff20a
	Namespace: killcam
	Checksum: 0xB2864C2A
	Offset: 0x230
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_c8bff20a(eventstruct)
{
	if(eventstruct.gamestate === #"pregame")
	{
		function_bb763df8(eventstruct.localclientnum);
	}
}

/*
	Name: function_549a01b9
	Namespace: killcam
	Checksum: 0x8F1A4772
	Offset: 0x280
	Size: 0x114
	Parameters: 1
	Flags: Linked
*/
function function_549a01b9(localclientnum)
{
	if(codcaster::function_b8fe9b52(localclientnum))
	{
		return;
	}
	if(function_56e2eaa8(self) && isdefined(level.killcam[localclientnum]) && game.state !== #"pregame")
	{
		level.killcam[localclientnum].var_57426003 = util::getnextobjid(localclientnum);
		objective_add(localclientnum, level.killcam[localclientnum].var_57426003, "active", #"hash_e8ccf98fcea7a36", vectorscale((0, 0, -1), 10000));
		objective_onentity(localclientnum, level.killcam[localclientnum].var_57426003, self, 0, 0, 0);
	}
}

/*
	Name: function_bb763df8
	Namespace: killcam
	Checksum: 0x9E3B85D
	Offset: 0x3A0
	Size: 0xA6
	Parameters: 1
	Flags: Linked
*/
function function_bb763df8(localclientnum)
{
	if(isdefined(level.killcam[localclientnum]) && isdefined(level.killcam[localclientnum].var_57426003))
	{
		util::releaseobjid(localclientnum, level.killcam[localclientnum].var_57426003);
		objective_delete(localclientnum, level.killcam[localclientnum].var_57426003);
		level.killcam[localclientnum].var_57426003 = undefined;
	}
}

/*
	Name: on_killcam_begin
	Namespace: killcam
	Checksum: 0x296A63F
	Offset: 0x450
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function on_killcam_begin(params)
{
	player = function_27673a7(params.localclientnum);
	if(!isdefined(player))
	{
		return;
	}
	number = player getentitynumber();
	test_player = getentbynum(params.localclientnum, number);
	if(test_player !== player)
	{
		return;
	}
	player function_2362a697(params.localclientnum, params.bundle);
	function_bb763df8(params.localclientnum);
	player function_549a01b9(params.localclientnum);
}

/*
	Name: on_killcam_end
	Namespace: killcam
	Checksum: 0x4D54B96
	Offset: 0x548
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function on_killcam_end(params)
{
	function_bb763df8(params.localclientnum);
	player = function_27673a7(params.localclientnum);
	if(!isdefined(player))
	{
		return;
	}
	player function_dc3fa738(params.localclientnum);
}

/*
	Name: function_9fcd5f60
	Namespace: killcam
	Checksum: 0x411FDDE1
	Offset: 0x5C0
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_9fcd5f60(params)
{
	player = function_27673a7(params.localclientnum);
	if(!isdefined(player))
	{
		return;
	}
	player function_dc3fa738(params.localclientnum);
	player function_2362a697(params.localclientnum, params.bundle);
	function_bb763df8(params.localclientnum);
	player function_549a01b9(params.localclientnum);
}

/*
	Name: function_2362a697
	Namespace: killcam
	Checksum: 0x185007DB
	Offset: 0x680
	Size: 0x86
	Parameters: 2
	Flags: Linked
*/
function function_2362a697(localclientnum, script_bundle)
{
	if(isdefined(level.killcam[localclientnum]) && isdefined(script_bundle))
	{
		var_c8b06dda = script_bundle.("posteffect");
		if(isdefined(var_c8b06dda))
		{
			self codeplaypostfxbundle(var_c8b06dda);
			level.killcam[localclientnum].var_c6128b93 = var_c8b06dda;
		}
	}
}

/*
	Name: function_dc3fa738
	Namespace: killcam
	Checksum: 0xE810B98F
	Offset: 0x710
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_dc3fa738(localclientnum)
{
	if(isdefined(level.killcam[localclientnum].var_c6128b93))
	{
		self codestoppostfxbundle(level.killcam[localclientnum].var_c6128b93);
		level.killcam[localclientnum].var_c6128b93 = undefined;
	}
}

