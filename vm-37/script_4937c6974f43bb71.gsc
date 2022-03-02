#using scripts\core_common\clientfield_shared.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;

#namespace namespace_82bfe441;

/*
	Name: fade
	Namespace: namespace_82bfe441
	Checksum: 0xA11131A0
	Offset: 0x100
	Size: 0x84
	Parameters: 3
	Flags: None
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

