#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_2943ccdc;

/*
	Name: function_c51c9b65
	Namespace: namespace_2943ccdc
	Checksum: 0x4C8A1663
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c51c9b65()
{
	level notify(-244390841);
}

/*
	Name: __init__system__
	Namespace: namespace_2943ccdc
	Checksum: 0x2950AD4A
	Offset: 0x168
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_ee64d6a280a2e42", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2943ccdc
	Checksum: 0xFDA5DBA2
	Offset: 0x1B0
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "toggle_interactive_map", 1, 1, "int", &function_831986b, 0, 0);
}

/*
	Name: function_831986b
	Namespace: namespace_2943ccdc
	Checksum: 0xF8B8E58E
	Offset: 0x208
	Size: 0x76
	Parameters: 7
	Flags: Linked, Private
*/
function private function_831986b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self thread function_f4804ac(fieldname);
	}
	else
	{
		self notify(#"close_interactive_map");
	}
}

/*
	Name: function_f4804ac
	Namespace: namespace_2943ccdc
	Checksum: 0x25A92054
	Offset: 0x288
	Size: 0x686
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f4804ac(localclientnum)
{
	self notify("736d32590bdc259");
	self endon(#"death", "36e6f79cf9fe7521", #"close_interactive_map");
	while(!isdefined(function_fecfab51("x")))
	{
		waitframe(1);
	}
	left = function_fecfab51("x");
	top = function_fecfab51("y");
	width = function_fecfab51("width");
	height = function_fecfab51("height");
	loc_00000446:
	cursor_pos = (left + (width * (isdefined(function_2ff81eb2("x")) ? function_2ff81eb2("x") : 0)), top + (height * (isdefined(function_2ff81eb2("y")) ? function_2ff81eb2("y") : 0)), 0);
	var_75576067 = (0, 0, 0);
	var_8ab7eec6 = height / 1024;
	last_time = float(self getclienttime()) / 1000;
	while(true)
	{
		var_5068885e = function_41fea20f(localclientnum);
		var_498c84ce = (var_5068885e[0] / 1920) * 24;
		var_860de4e5 = (var_5068885e[1] / 1080) * 24;
		cur_time = float(self getclienttime()) / 1000;
		var_52665581 = gamepadusedlast(localclientnum);
		if(!is_true(function_125940c8()))
		{
			if(var_52665581)
			{
				input = self function_b8e6d95c();
				input[#"look"] = util::function_63320ea1(input[#"look"]);
				input[#"move"] = util::function_63320ea1(input[#"move"]);
				if(length2dsquared(input[#"look"]) > length2dsquared(input[#"move"]) * 0.5)
				{
					var_75576067 = input[#"look"];
				}
				else
				{
					var_75576067 = input[#"move"];
				}
				var_75576067 = (((var_75576067[0], var_75576067[1] * -1, 0) * var_8ab7eec6) * 1024) * (cur_time - last_time);
				var_75576067 = var_75576067 * ((isdefined(function_2ff81eb2("state")) ? function_2ff81eb2("state") : 0) > 0 ? 0.66 : 1);
				cursor_pos = cursor_pos + var_75576067;
			}
			else
			{
				var_75576067 = function_6593be12(localclientnum);
				cursor_pos = cursor_pos + var_75576067;
				var_ecec29b6 = math::clamp(cursor_pos[0], 0, var_5068885e[0] - var_498c84ce);
				var_9031f03b = math::clamp(cursor_pos[1], 0, var_5068885e[1] - var_860de4e5);
				cursor_pos = (var_ecec29b6, var_9031f03b, 0);
			}
			var_bc1b26be = (cursor_pos[0] - left) / width;
			var_39073afc = (cursor_pos[1] - top) / height;
			if(var_52665581)
			{
				var_bc1b26be = math::clamp(var_bc1b26be, 0, 1);
				var_39073afc = math::clamp(var_39073afc, 0, 1);
			}
			cursor_pos = (left + (width * var_bc1b26be), top + (height * var_39073afc), 0);
			var_e8e314b2 = function_747d0bce("x");
			if(isdefined(var_e8e314b2))
			{
				setuimodelvalue(var_e8e314b2, var_bc1b26be);
			}
			var_29e952de = function_747d0bce("y");
			if(isdefined(var_29e952de))
			{
				setuimodelvalue(var_29e952de, var_39073afc);
			}
		}
		last_time = cur_time;
		waitframe(1);
	}
}

/*
	Name: function_b1a83ab
	Namespace: namespace_2943ccdc
	Checksum: 0x6F1B38D9
	Offset: 0x918
	Size: 0x3A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b1a83ab()
{
	return getuimodel(function_5c2e399f(), "ScriptedWidgetData.widgetModels." + #"hash_ee64d6a280a2e42");
}

/*
	Name: function_644b2f6d
	Namespace: namespace_2943ccdc
	Checksum: 0x96CC7905
	Offset: 0x960
	Size: 0x56
	Parameters: 0
	Flags: Linked, Private
*/
function private function_644b2f6d()
{
	ui_model = function_b1a83ab();
	if(isdefined(ui_model))
	{
		return getuimodel(ui_model, "cursor.mapObjects." + #"cursor");
	}
	return undefined;
}

/*
	Name: function_125940c8
	Namespace: namespace_2943ccdc
	Checksum: 0x6BACA31B
	Offset: 0x9C0
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private function_125940c8()
{
	ui_model = function_b1a83ab();
	if(isdefined(ui_model))
	{
		hide_model = getuimodel(ui_model, "hide");
		return (isdefined(hide_model) ? getuimodelvalue(hide_model) : undefined);
	}
	return undefined;
}

/*
	Name: function_747d0bce
	Namespace: namespace_2943ccdc
	Checksum: 0x88B8F0DF
	Offset: 0xA40
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_747d0bce(field)
{
	ui_model = function_644b2f6d();
	if(isdefined(ui_model))
	{
		return getuimodel(ui_model, field);
	}
	return undefined;
}

/*
	Name: function_2ff81eb2
	Namespace: namespace_2943ccdc
	Checksum: 0x54BAAF13
	Offset: 0xA90
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2ff81eb2(field)
{
	ui_model = function_644b2f6d();
	if(isdefined(ui_model))
	{
		ui_model = getuimodel(ui_model, field);
		return (isdefined(ui_model) ? getuimodelvalue(ui_model) : undefined);
	}
	return undefined;
}

/*
	Name: function_fecfab51
	Namespace: namespace_2943ccdc
	Checksum: 0x3E0495AC
	Offset: 0xB08
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fecfab51(field)
{
	ui_model = function_b1a83ab();
	if(isdefined(ui_model))
	{
		ui_model = getuimodel(ui_model, "cursor." + field);
		return (isdefined(ui_model) ? getuimodelvalue(ui_model) : undefined);
	}
	return undefined;
}

