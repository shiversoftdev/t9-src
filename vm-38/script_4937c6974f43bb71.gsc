#using scripts\core_common\clientfield_shared.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;

#namespace namespace_82bfe441;

/*
	Name: function_9fd9770f
	Namespace: namespace_82bfe441
	Checksum: 0x128C1EA2
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9fd9770f()
{
	level notify(634382370);
}

/*
	Name: fade
	Namespace: namespace_82bfe441
	Checksum: 0xF23DEE38
	Offset: 0x120
	Size: 0x84
	Parameters: 3
	Flags: Linked
*/
function fade(var_564144a4, var_b8e08e16, var_ee0e1f8)
{
	if(!isdefined(var_b8e08e16))
	{
		var_b8e08e16 = "FadeImmediate";
	}
	if(!isdefined(var_ee0e1f8))
	{
		var_ee0e1f8 = 0;
	}
	globallogic_ui::function_9ed5232e("hudItems.cpHudFadeControl.fadeSpeed", var_b8e08e16);
	globallogic_ui::function_9ed5232e("hudItems.cpHudFadeControl.customFadeSpeed", var_ee0e1f8);
	globallogic_ui::function_9ed5232e("hudItems.cpHudFadeControl.doFadeOut", var_564144a4);
}

