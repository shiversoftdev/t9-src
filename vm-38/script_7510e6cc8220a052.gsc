#using script_4bf952f6ba31bb17;

#namespace namespace_26186a83;

/*
	Name: function_bf84bb03
	Namespace: namespace_26186a83
	Checksum: 0x7B715A55
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bf84bb03()
{
	level notify(1067036143);
}

/*
	Name: play_animation
	Namespace: namespace_26186a83
	Checksum: 0xAE2FBAFA
	Offset: 0xB0
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function play_animation(var_f6550bae)
{
	if(!self function_4a2ac86a())
	{
		return;
	}
	var_4d704690 = self astsearch(var_f6550bae);
	if(!isdefined(var_4d704690[#"animation"]))
	{
		return;
	}
	animation = self animmappingsearch(var_4d704690[#"animation"]);
	self animscripted("bot_play_animation", self.origin, self.angles, animation, "server script", undefined, undefined, var_4d704690[#"blend_in_time"], undefined, undefined, 1);
	self thread function_33f98f4(animation, var_4d704690[#"animation_mocomp"], var_4d704690[#"blend_out_time"]);
}

/*
	Name: function_33f98f4
	Namespace: namespace_26186a83
	Checksum: 0x72A14811
	Offset: 0x1D8
	Size: 0x1DC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_33f98f4(animation, mocomp, blendout)
{
	self endon(#"death", #"disconnect");
	var_278cadb0 = spawnstruct();
	var_278cadb0.name = mocomp;
	var_278cadb0.entity = self;
	var_278cadb0.delta_anim = animation;
	var_278cadb0.blend_out_time = blendout;
	var_278cadb0.duration = max(0, getanimlength(animation) - blendout);
	var_278cadb0.status = 0;
	animationstatenetwork::runanimationmocomp(var_278cadb0);
	animlength = getanimlength(animation);
	animtime = self getanimtime(animation) * animlength;
	while(self isplayinganimscripted() && animtime < var_278cadb0.duration)
	{
		animtime = self getanimtime(animation) * animlength;
		var_278cadb0.status = 1;
		animationstatenetwork::runanimationmocomp(var_278cadb0);
		waitframe(1);
	}
	var_278cadb0.status = 2;
	animationstatenetwork::runanimationmocomp(var_278cadb0);
	self stopanimscripted(blendout);
}

