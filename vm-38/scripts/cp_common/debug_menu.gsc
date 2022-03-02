#namespace debug_menu;

/*
	Name: function_d1fc466c
	Namespace: debug_menu
	Checksum: 0x6C03E3DA
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d1fc466c()
{
	level notify(272246760);
}

/*
	Name: set_hudelem
	Namespace: debug_menu
	Checksum: 0xEAC3B0F9
	Offset: 0x80
	Size: 0x178
	Parameters: 7
	Flags: None
*/
function set_hudelem(text, x, y, scale, alpha, sort, debug_hudelem)
{
	/#
		if(!isdefined(alpha))
		{
			alpha = 1;
		}
		if(!isdefined(scale))
		{
			scale = 1;
		}
		if(!isdefined(sort))
		{
			sort = 20;
		}
		if(isdefined(level.player) && !isdefined(debug_hudelem))
		{
			hud = newdebughudelem(level.player);
		}
		else
		{
			hud = newdebughudelem();
			hud.debug_hudelem = 1;
		}
		hud.location = 0;
		hud.alignx = "";
		hud.aligny = "";
		hud.foreground = 1;
		hud.fontscale = scale;
		hud.sort = sort;
		hud.alpha = alpha;
		hud.x = x;
		hud.y = y;
		hud.og_scale = scale;
		if(isdefined(text))
		{
			hud settext(text);
		}
		return hud;
	#/
}

/*
	Name: new_hud
	Namespace: debug_menu
	Checksum: 0x17D3919D
	Offset: 0x208
	Size: 0xC2
	Parameters: 5
	Flags: None
*/
function new_hud(hud_name, msg, x, y, scale)
{
	/#
		if(!isdefined(level.hud_array))
		{
			level.hud_array = [];
		}
		if(!isdefined(level.hud_array[hud_name]))
		{
			level.hud_array[hud_name] = [];
		}
		hud = set_hudelem(msg, x, y, scale);
		level.hud_array[hud_name][level.hud_array[hud_name].size] = hud;
		return hud;
	#/
}

/*
	Name: remove_hud
	Namespace: debug_menu
	Checksum: 0xC7C5071E
	Offset: 0x2D8
	Size: 0x8C
	Parameters: 1
	Flags: None
*/
function remove_hud(hud_name)
{
	/#
		if(!isdefined(level.hud_array[hud_name]))
		{
			return;
		}
		huds = level.hud_array[hud_name];
		for(i = 0; i < huds.size; i++)
		{
			destroy_hud(huds[i]);
		}
		level.hud_array[hud_name] = undefined;
	#/
}

/*
	Name: destroy_hud
	Namespace: debug_menu
	Checksum: 0x71824801
	Offset: 0x370
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function destroy_hud(hud)
{
	/#
		if(isdefined(hud))
		{
			hud destroy();
		}
	#/
}

