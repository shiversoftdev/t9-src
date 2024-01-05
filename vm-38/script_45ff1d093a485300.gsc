#using script_68d08b784c92da95;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using script_41fe08c37d53a635;
#using script_4c5c4a64a59247a2;
#using script_35598499769dbb3d;
#using script_4d85e8de54b02198;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\archetype_human_cover.gsc;

#namespace archetype_notetracks;

/*
	Name: function_37b091c9
	Namespace: archetype_notetracks
	Checksum: 0x2C2FEC00
	Offset: 0x460
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_37b091c9()
{
	level notify(1947017545);
}

#namespace animationstatenetwork;

/*
	Name: registerdefaultnotetrackhandlerfunctions
	Namespace: animationstatenetwork
	Checksum: 0x9AA18CE5
	Offset: 0x480
	Size: 0x66C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec registerdefaultnotetrackhandlerfunctions()
{
	registernotetrackhandlerfunction("fire", &notetrackfirebullet);
	registernotetrackhandlerfunction("gib_disable", &notetrackgibdisable);
	registernotetrackhandlerfunction("gib = \"head\"", &gibserverutils::gibhead);
	registernotetrackhandlerfunction("gib = \"arm_left\"", &gibserverutils::gibleftarm);
	registernotetrackhandlerfunction("gib = \"arm_right\"", &gibserverutils::gibrightarm);
	registernotetrackhandlerfunction("gib = \"leg_left\"", &gibserverutils::gibleftleg);
	registernotetrackhandlerfunction("gib = \"leg_right\"", &gibserverutils::gibrightleg);
	registernotetrackhandlerfunction("dropgun", &notetrackdropgun);
	registernotetrackhandlerfunction("gun drop", &notetrackdropgun);
	registernotetrackhandlerfunction("drop_shield", &notetrackdropshield);
	registernotetrackhandlerfunction("hide_weapon", &notetrackhideweapon);
	registernotetrackhandlerfunction("show_weapon", &notetrackshowweapon);
	registernotetrackhandlerfunction("hide_ai", &notetrackhideai);
	registernotetrackhandlerfunction("show_ai", &notetrackshowai);
	registernotetrackhandlerfunction("attach_knife", &notetrackattachknife);
	registernotetrackhandlerfunction("detach_knife", &notetrackdetachknife);
	registernotetrackhandlerfunction("grenade_throw", &notetrackgrenadethrow);
	registernotetrackhandlerfunction("start_ragdoll", &notetrackstartragdoll);
	registernotetrackhandlerfunction("ragdoll_nodeath", &notetrackstartragdollnodeath);
	registernotetrackhandlerfunction("unsync", &notetrackmeleeunsync);
	registernotetrackhandlerfunction("helmet_pop", &notetrackhelmetpop);
	registernotetrackhandlerfunction("drop clip", &function_727744ff);
	registernotetrackhandlerfunction("extract clip left", &function_cd88e2dc);
	registernotetrackhandlerfunction("extract clip right", &function_8982cca0);
	registernotetrackhandlerfunction("attach clip left", &function_3f4b4219);
	registernotetrackhandlerfunction("attach clip right", &function_15b71a09);
	registernotetrackhandlerfunction("detach clip left", &function_9d41000);
	registernotetrackhandlerfunction("detach clip right", &function_9d41000);
	registernotetrackhandlerfunction("step1", &notetrackstaircasestep1);
	registernotetrackhandlerfunction("step2", &notetrackstaircasestep2);
	registernotetrackhandlerfunction("anim_movement = \"stop\"", &notetrackanimmovementstop);
	registernotetrackhandlerfunction("gun_2_back", &notetrackguntoback);
	registernotetrackhandlerfunction("gun_2_right", &function_776caa25);
	registernotetrackhandlerfunction("pistol_pickup", &function_f7e95a07);
	registernotetrackhandlerfunction("pistol_putaway", &function_c49db6d);
	registerblackboardnotetrackhandler("anim_pose = \\\"stand\\\"", "_stance", "stand");
	registerblackboardnotetrackhandler("anim_pose = \\\"crouch\\\"", "_stance", "crouch");
	registerblackboardnotetrackhandler("anim_pose = \\\"prone\\\"", "_stance", "prone");
	registerblackboardnotetrackhandler("anim_pose = stand", "_stance", "stand");
	registerblackboardnotetrackhandler("anim_pose = crouch", "_stance", "crouch");
	registerblackboardnotetrackhandler("anim_pose = prone", "_stance", "prone");
}

/*
	Name: notetrackguntoback
	Namespace: animationstatenetwork
	Checksum: 0x70A996F7
	Offset: 0xAF8
	Size: 0x7A
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackguntoback(entity)
{
	if(!is_true(entity.var_8f33d87a))
	{
		ai::gun_remove();
		entity attach(entity.primaryweapon.worldmodel, "tag_stowed_back", 0);
		entity.var_8f33d87a = 1;
	}
}

/*
	Name: function_776caa25
	Namespace: animationstatenetwork
	Checksum: 0x62CB38E2
	Offset: 0xB80
	Size: 0x86
	Parameters: 1
	Flags: Linked, Private
*/
function private function_776caa25(entity)
{
	if(is_true(entity.var_8f33d87a))
	{
		entity.var_8f33d87a = 0;
		entity detach(entity.primaryweapon.worldmodel, "tag_stowed_back");
	}
	ai::gun_recall();
	entity.bulletsinclip = entity.primaryweapon.clipsize;
}

/*
	Name: function_f7e95a07
	Namespace: animationstatenetwork
	Checksum: 0x35373C4E
	Offset: 0xC10
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f7e95a07(entity)
{
	ai::gun_switchto(entity.sidearm, "right");
	entity.bulletsinclip = entity.sidearm.clipsize;
}

/*
	Name: function_c49db6d
	Namespace: animationstatenetwork
	Checksum: 0xBBA2F492
	Offset: 0xC60
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c49db6d(entity)
{
	ai::gun_switchto(entity.sidearm, "none");
}

/*
	Name: notetrackanimmovementstop
	Namespace: animationstatenetwork
	Checksum: 0x1CA6CD11
	Offset: 0xC98
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackanimmovementstop(entity)
{
	if(entity haspath())
	{
		entity pathmode("move delayed", 1, randomfloatrange(2, 4));
	}
}

/*
	Name: notetrackstaircasestep1
	Namespace: animationstatenetwork
	Checksum: 0xDB238C4F
	Offset: 0xD08
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackstaircasestep1(entity)
{
	numsteps = entity getblackboardattribute("_staircase_num_steps");
	numsteps++;
	entity setblackboardattribute("_staircase_num_steps", numsteps);
}

/*
	Name: notetrackstaircasestep2
	Namespace: animationstatenetwork
	Checksum: 0x96B1E87D
	Offset: 0xD70
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackstaircasestep2(entity)
{
	numsteps = entity getblackboardattribute("_staircase_num_steps");
	numsteps = numsteps + 2;
	entity setblackboardattribute("_staircase_num_steps", numsteps);
}

/*
	Name: notetrackdropguninternal
	Namespace: animationstatenetwork
	Checksum: 0x3D17AC34
	Offset: 0xDE0
	Size: 0xD4
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackdropguninternal(entity)
{
	if(!isdefined(entity.weapon) || entity.weapon === level.weaponnone)
	{
		return;
	}
	if(isdefined(entity.ai) && is_true(entity.ai.var_7c61677c))
	{
		if(isalive(entity))
		{
			return;
		}
	}
	entity.lastweapon = entity.weapon;
	primaryweapon = entity.primaryweapon;
	secondaryweapon = entity.secondaryweapon;
	entity thread shared::dropaiweapon();
}

/*
	Name: notetrackattachknife
	Namespace: animationstatenetwork
	Checksum: 0xD45ED760
	Offset: 0xEC0
	Size: 0x5A
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackattachknife(entity)
{
	if(!is_true(entity._ai_melee_attachedknife))
	{
		entity attach(#"wpn_t7_knife_combat_prop", "TAG_WEAPON_LEFT");
		entity._ai_melee_attachedknife = 1;
	}
}

/*
	Name: notetrackdetachknife
	Namespace: animationstatenetwork
	Checksum: 0xB4614C38
	Offset: 0xF28
	Size: 0x56
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackdetachknife(entity)
{
	if(is_true(entity._ai_melee_attachedknife))
	{
		entity detach(#"wpn_t7_knife_combat_prop", "TAG_WEAPON_LEFT");
		entity._ai_melee_attachedknife = 0;
	}
}

/*
	Name: notetrackhideweapon
	Namespace: animationstatenetwork
	Checksum: 0x9C1FB1A4
	Offset: 0xF88
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackhideweapon(entity)
{
	entity ai::gun_remove();
}

/*
	Name: notetrackshowweapon
	Namespace: animationstatenetwork
	Checksum: 0x8B7C495
	Offset: 0xFB8
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackshowweapon(entity)
{
	entity ai::gun_recall();
}

/*
	Name: notetrackhideai
	Namespace: animationstatenetwork
	Checksum: 0x66CEA9C1
	Offset: 0xFE8
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackhideai(entity)
{
	entity hide();
}

/*
	Name: notetrackshowai
	Namespace: animationstatenetwork
	Checksum: 0xA06DBB1D
	Offset: 0x1018
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackshowai(entity)
{
	entity show();
}

/*
	Name: notetrackstartragdoll
	Namespace: animationstatenetwork
	Checksum: 0x2E941BC3
	Offset: 0x1048
	Size: 0x20C
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackstartragdoll(entity)
{
	if(isactor(entity) && entity isinscriptedstate())
	{
		entity.overrideactordamage = undefined;
		entity.allowdeath = 1;
		entity.skipdeath = 1;
		entity kill(entity.origin, undefined, undefined, undefined, undefined, 1);
	}
	notetrackdropguninternal(entity);
	entity startragdoll();
	/#
		current_anim = entity asmgetcurrentdeltaanimation();
		text = "";
		if(isdefined(current_anim) && current_anim != "")
		{
			text = text + ("" + function_9e72a96(current_anim));
			notetracks = getnotetracktimes(current_anim, "");
			if(notetracks.size == 1)
			{
				time = entity getanimtime(current_anim);
				text = text + ((("" + notetracks[0]) + "") + time);
			}
			else
			{
				text = text + ("" + notetracks.size);
			}
		}
		record3dtext(text, entity.origin + vectorscale((0, 0, 1), 4), (1, 0, 0), "", undefined, 0.4);
	#/
}

/*
	Name: _delayedragdoll
	Namespace: animationstatenetwork
	Checksum: 0x5B8275C7
	Offset: 0x1260
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function _delayedragdoll(entity)
{
	wait(0.25);
	if(isdefined(entity) && !entity isragdoll())
	{
		entity startragdoll();
		/#
			record3dtext("", entity.origin + vectorscale((0, 0, 1), 4), (1, 0, 0), "", undefined, 0.4);
		#/
	}
}

/*
	Name: notetrackstartragdollnodeath
	Namespace: animationstatenetwork
	Checksum: 0xABF639E
	Offset: 0x1300
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function notetrackstartragdollnodeath(entity)
{
	if(isdefined(entity._ai_melee_opponent))
	{
		entity._ai_melee_opponent unlink();
	}
	entity thread _delayedragdoll(entity);
}

/*
	Name: notetrackfirebullet
	Namespace: animationstatenetwork
	Checksum: 0xE613EBCB
	Offset: 0x1358
	Size: 0x13C
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackfirebullet(animationentity)
{
	if(isactor(animationentity) && animationentity isinscriptedstate())
	{
		if(animationentity.weapon != level.weaponnone)
		{
			animationentity notify(#"about_to_shoot");
			startpos = animationentity gettagorigin("tag_flash");
			angles = animationentity gettagangles("tag_flash");
			forward = anglestoforward(angles);
			endpos = startpos + vectorscale(forward, 100);
			magicbullet(animationentity.weapon, startpos, endpos, animationentity);
			animationentity notify(#"shoot");
			animationentity.bulletsinclip--;
		}
	}
}

/*
	Name: notetrackhelmetpop
	Namespace: animationstatenetwork
	Checksum: 0xD60FF98C
	Offset: 0x14A0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackhelmetpop(animationentity)
{
	destructserverutils::function_8475c53a(animationentity, "helmet");
}

/*
	Name: notetrackdropgun
	Namespace: animationstatenetwork
	Checksum: 0xB5BA5EE4
	Offset: 0x14D8
	Size: 0xAC
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackdropgun(animationentity)
{
	if(isdefined(animationentity.var_bd5efde2) && isdefined(animationentity.var_6622f75b))
	{
		clip = function_ed287fd1(animationentity);
		if(isdefined(clip.model))
		{
			function_a5af97c9(animationentity, clip, animationentity.var_bd5efde2);
			function_c83ca932(animationentity);
		}
	}
	notetrackdropguninternal(animationentity);
}

/*
	Name: notetrackdropshield
	Namespace: animationstatenetwork
	Checksum: 0xFD34F53E
	Offset: 0x1590
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackdropshield(animationentity)
{
	aiutility::dropriotshield(animationentity);
}

/*
	Name: notetrackgrenadethrow
	Namespace: animationstatenetwork
	Checksum: 0x22BD192D
	Offset: 0x15C0
	Size: 0x12C
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackgrenadethrow(animationentity)
{
	if(archetype_human_cover::function_9d8b22d8(animationentity, 1, 0))
	{
		archetype_human_cover::function_ce446f2e(animationentity);
	}
	else
	{
		if(isdefined(animationentity.grenadethrowposition))
		{
			arm_offset = undefined;
			if(isdefined(self.var_ce7a311e))
			{
				arm_offset = [[self.var_ce7a311e]](animationentity, animationentity.grenadethrowposition);
			}
			else
			{
				arm_offset = archetype_human_cover::temp_get_arm_offset(animationentity, animationentity.grenadethrowposition);
			}
			throw_vel = animationentity canthrowgrenadepos(arm_offset, animationentity.grenadethrowposition);
			if(isdefined(throw_vel))
			{
				archetype_human_cover::function_ce446f2e(animationentity);
			}
			else
			{
				archetype_human_cover::function_83c0b7e1(animationentity);
			}
		}
		else
		{
			archetype_human_cover::function_83c0b7e1(animationentity);
		}
	}
}

/*
	Name: notetrackmeleeunsync
	Namespace: animationstatenetwork
	Checksum: 0x9F7E19F7
	Offset: 0x16F8
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackmeleeunsync(animationentity)
{
	if(isdefined(animationentity) && isdefined(animationentity.enemy))
	{
		if(is_true(animationentity.enemy._ai_melee_markeddead))
		{
			animationentity unlink();
		}
	}
}

/*
	Name: notetrackgibdisable
	Namespace: animationstatenetwork
	Checksum: 0x5835FEDB
	Offset: 0x1768
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private notetrackgibdisable(animationentity)
{
	if(animationentity ai::has_behavior_attribute("can_gib"))
	{
		animationentity ai::set_behavior_attribute("can_gib", 0);
	}
}

/*
	Name: function_ed287fd1
	Namespace: animationstatenetwork
	Checksum: 0x4889E9BE
	Offset: 0x17C0
	Size: 0x76
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ed287fd1(animationentity)
{
	result = {};
	result.model = animationentity.weapon.clipmodel;
	result.var_98bd9c20 = "tag_clip";
	result.var_c63463cb = "tag_clip_empty";
	result.var_696fb09f = "tag_accessory_left";
	result.var_86c2ede3 = "tag_accessory_right";
	return result;
}

/*
	Name: function_dab83a5a
	Namespace: animationstatenetwork
	Checksum: 0xF847411A
	Offset: 0x1840
	Size: 0x16E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_dab83a5a(animationentity, clip, visible)
{
	if(isdefined(clip.var_c63463cb) && animationentity haspart(clip.var_c63463cb))
	{
		if(!is_true(visible))
		{
			animationentity hidepart(clip.var_c63463cb);
			animationentity.var_91d2328b = clip.var_c63463cb;
		}
		else
		{
			animationentity showpart(clip.var_c63463cb);
			animationentity.var_91d2328b = undefined;
		}
	}
	if(isdefined(clip.var_98bd9c20) && animationentity haspart(clip.var_98bd9c20))
	{
		if(!is_true(visible))
		{
			animationentity hidepart(clip.var_98bd9c20);
			animationentity.var_af41987d = clip.var_98bd9c20;
		}
		else
		{
			animationentity showpart(clip.var_98bd9c20);
			animationentity.var_af41987d = undefined;
		}
	}
}

/*
	Name: function_73e97c7d
	Namespace: animationstatenetwork
	Checksum: 0x47AC9835
	Offset: 0x19B8
	Size: 0xA2
	Parameters: 3
	Flags: Linked, Private
*/
function private function_73e97c7d(animationentity, clip, attachtag)
{
	if(isdefined(clip.model) && isdefined(attachtag) && animationentity haspart(attachtag) && !isdefined(animationentity.var_6622f75b))
	{
		animationentity attach(clip.model, attachtag);
		animationentity.var_6622f75b = clip.model;
		animationentity.var_bd5efde2 = attachtag;
	}
}

/*
	Name: function_c83ca932
	Namespace: animationstatenetwork
	Checksum: 0xEF490204
	Offset: 0x1A68
	Size: 0x6A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c83ca932(animationentity)
{
	if(isdefined(animationentity.var_bd5efde2) && isdefined(animationentity.var_6622f75b))
	{
		animationentity detach(animationentity.var_6622f75b, animationentity.var_bd5efde2);
		animationentity.var_6622f75b = undefined;
		animationentity.var_bd5efde2 = undefined;
	}
}

/*
	Name: function_a5af97c9
	Namespace: animationstatenetwork
	Checksum: 0x882FB398
	Offset: 0x1AE0
	Size: 0x1DC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_a5af97c9(animationentity, clip, tag)
{
	origin = animationentity gettagorigin(tag);
	angles = animationentity gettagangles(tag);
	/#
		if(!isdefined(clip.model))
		{
			weaponname = "";
			if(isdefined(animationentity.weapon.name))
			{
				weaponname = function_9e72a96(animationentity.weapon.name);
			}
			/#
				assertmsg((("" + weaponname) + "") + animationentity.aitype);
			#/
		}
	#/
	var_fffb32e9 = util::spawn_model(clip.model, origin, angles);
	if(isdefined(var_fffb32e9))
	{
		var_fffb32e9 notsolid();
		var_fffb32e9 physicslaunch(var_fffb32e9.origin - vectorscale((0, 0, 1), 3), (randomfloatrange(-0.5, 0.5), randomfloatrange(-0.5, 0.5), 0));
		var_fffb32e9 util::delay(10, undefined, &function_6bde1bde);
	}
}

/*
	Name: function_727744ff
	Namespace: animationstatenetwork
	Checksum: 0xC4A828DB
	Offset: 0x1CC8
	Size: 0x124
	Parameters: 1
	Flags: Linked, Private
*/
function private function_727744ff(animationentity)
{
	clip = function_ed287fd1(animationentity);
	if(isdefined(animationentity.var_bd5efde2) && (isdefined(animationentity.var_6622f75b) && isdefined(clip.model)))
	{
		function_a5af97c9(animationentity, clip, animationentity.var_bd5efde2);
		function_c83ca932(animationentity);
		function_dab83a5a(animationentity, clip, 0);
	}
	else if(isdefined(clip.model) && isdefined(clip.var_98bd9c20) && animationentity haspart(clip.var_98bd9c20))
	{
		function_a5af97c9(animationentity, clip, clip.var_98bd9c20);
		function_dab83a5a(animationentity, clip, 0);
	}
}

/*
	Name: function_cd88e2dc
	Namespace: animationstatenetwork
	Checksum: 0xDB140536
	Offset: 0x1DF8
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cd88e2dc(animationentity)
{
	clip = function_ed287fd1(animationentity);
	function_dab83a5a(animationentity, clip, 0);
	function_73e97c7d(animationentity, clip, clip.var_696fb09f);
}

/*
	Name: function_8982cca0
	Namespace: animationstatenetwork
	Checksum: 0xB796BA2F
	Offset: 0x1E68
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8982cca0(animationentity)
{
	clip = function_ed287fd1(animationentity);
	function_dab83a5a(animationentity, clip, 0);
	function_73e97c7d(animationentity, clip, clip.var_86c2ede3);
}

/*
	Name: function_3f4b4219
	Namespace: animationstatenetwork
	Checksum: 0x3563CFFB
	Offset: 0x1ED8
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3f4b4219(animationentity)
{
	clip = function_ed287fd1(animationentity);
	function_73e97c7d(animationentity, clip, clip.var_696fb09f);
	function_dab83a5a(animationentity, clip, 0);
}

/*
	Name: function_15b71a09
	Namespace: animationstatenetwork
	Checksum: 0x9475EC5A
	Offset: 0x1F48
	Size: 0x64
	Parameters: 1
	Flags: Linked, Private
*/
function private function_15b71a09(animationentity)
{
	clip = function_ed287fd1(animationentity);
	function_73e97c7d(animationentity, clip, clip.var_86c2ede3);
	function_dab83a5a(animationentity, clip, 0);
}

/*
	Name: function_9d41000
	Namespace: animationstatenetwork
	Checksum: 0xEBE56718
	Offset: 0x1FB8
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_9d41000(animationentity)
{
	clip = function_ed287fd1(animationentity);
	function_c83ca932(animationentity);
	function_dab83a5a(animationentity, clip, 1);
}

/*
	Name: function_6bde1bde
	Namespace: animationstatenetwork
	Checksum: 0xDE4068CB
	Offset: 0x2020
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6bde1bde()
{
	self endon(#"death");
	self.origin = self.origin + (0, 0, -1);
	waitframe(1);
	self delete();
}

