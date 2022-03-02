#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_88f6bc3c;

/*
	Name: function_368c8e75
	Namespace: namespace_88f6bc3c
	Checksum: 0xB607887D
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_368c8e75()
{
	level notify(367228312);
}

#namespace namespace_5443b356;

/*
	Name: main
	Namespace: namespace_5443b356
	Checksum: 0x919D9CE6
	Offset: 0x150
	Size: 0xDC
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	clientfield::register("toplayer", "player_cam_blur", 1, 1, "int", &player_cam_blur, 0, 1);
	clientfield::register("toplayer", "player_cam_bubbles", 1, 1, "int", &player_cam_bubbles, 0, 1);
	clientfield::register("toplayer", "player_cam_fire", 1, 1, "int", &player_cam_fire, 0, 0);
}

/*
	Name: player_cam_blur
	Namespace: namespace_5443b356
	Checksum: 0x68C7171F
	Offset: 0x238
	Size: 0x96
	Parameters: 7
	Flags: Linked
*/
function player_cam_blur(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1 && !function_1cbf351b(fieldname))
	{
		self thread function_3c4a545b(fieldname);
	}
	else
	{
		self notify(#"hash_31875ebd426b00c1");
	}
}

/*
	Name: function_3c4a545b
	Namespace: namespace_5443b356
	Checksum: 0xB08CC907
	Offset: 0x2D8
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_3c4a545b(localclientnum)
{
	self endon(#"disconnect");
	self endon(#"hash_31875ebd426b00c1");
	blur_level = 0.5;
	while(blur_level <= 1)
	{
		blur_level = blur_level + 0.04;
		waitframe(1);
	}
}

/*
	Name: player_cam_bubbles
	Namespace: namespace_5443b356
	Checksum: 0x10EB6D51
	Offset: 0x350
	Size: 0x114
	Parameters: 7
	Flags: Linked
*/
function player_cam_bubbles(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1 && !function_1cbf351b(fieldname))
	{
		if(isdefined(self.n_fx_id))
		{
			deletefx(fieldname, self.n_fx_id, 1);
		}
		self.n_fx_id = playfxoncamera(fieldname, "player/fx_plyr_swim_bubbles_body", (0, 0, 0), (1, 0, 0), (0, 0, 1));
		self playrumbleonentity(fieldname, "damage_heavy");
	}
	else if(isdefined(self.n_fx_id))
	{
		deletefx(fieldname, self.n_fx_id, 1);
	}
}

/*
	Name: player_cam_fire
	Namespace: namespace_5443b356
	Checksum: 0x7D2F8452
	Offset: 0x470
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function player_cam_fire(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1 && !function_1cbf351b(fieldname))
	{
		burn_on_postfx();
	}
	else
	{
		function_97a0dd0a();
	}
}

/*
	Name: burn_on_postfx
	Namespace: namespace_5443b356
	Checksum: 0xD261A399
	Offset: 0x508
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function burn_on_postfx()
{
	self endon(#"disconnect");
	self endon(#"hash_8098b25d66c781c");
	self thread postfx::playpostfxbundle(#"pstfx_burn_loop");
}

/*
	Name: function_97a0dd0a
	Namespace: namespace_5443b356
	Checksum: 0x7779ED00
	Offset: 0x560
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_97a0dd0a()
{
	self notify(#"hash_8098b25d66c781c");
	self postfx::stoppostfxbundle("pstfx_burn_loop");
}

