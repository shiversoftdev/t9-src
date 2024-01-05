#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace telemetry;

/*
	Name: add_callback
	Namespace: telemetry
	Checksum: 0x55694EA4
	Offset: 0x70
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function add_callback(var_8c8ba9e1, callback_func)
{
	callback::add_callback(var_8c8ba9e1, callback_func);
}

/*
	Name: function_98df8818
	Namespace: telemetry
	Checksum: 0xD9F40750
	Offset: 0xA8
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function function_98df8818(callback, func)
{
	if(!isdefined(level.var_1bebdc8e))
	{
		level.var_1bebdc8e = [];
	}
	if(!isdefined(level.var_1bebdc8e[callback]))
	{
		level.var_1bebdc8e[callback] = [];
	}
	level.var_1bebdc8e[callback][level.var_1bebdc8e[callback].size] = func;
}

/*
	Name: function_18135b72
	Namespace: telemetry
	Checksum: 0x5C04A58E
	Offset: 0x130
	Size: 0xC8
	Parameters: 2
	Flags: Linked
*/
function function_18135b72(callback, data)
{
	if(!isdefined(level.var_1bebdc8e))
	{
		return;
	}
	if(!isdefined(level.var_1bebdc8e[callback]))
	{
		return;
	}
	if(isdefined(data))
	{
		for(i = 0; i < level.var_1bebdc8e[callback].size; i++)
		{
			thread [[level.var_1bebdc8e[callback][i]]](data);
		}
	}
	else
	{
		for(i = 0; i < level.var_1bebdc8e[callback].size; i++)
		{
			thread [[level.var_1bebdc8e[callback][i]]]();
		}
	}
}

/*
	Name: function_f397069a
	Namespace: telemetry
	Checksum: 0x2BAC954C
	Offset: 0x200
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_f397069a()
{
	while(level.var_d3427749 === gettime())
	{
		waitframe(1);
	}
	level.var_d3427749 = gettime();
}

