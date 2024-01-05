#using script_4108035fe400ce67;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_40fc784c60f9fa7b;

#namespace vehicle;

/*
	Name: function_1622f082
	Namespace: vehicle
	Checksum: 0xC183CACE
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1622f082()
{
	level notify(963480644);
}

#namespace wz_vehicle;

/*
	Name: __init__system__
	Namespace: wz_vehicle
	Checksum: 0x7E59B10F
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wz_vehicle", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: wz_vehicle
	Checksum: 0xFF8A97A7
	Offset: 0x108
	Size: 0xBC
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_cd8f416a = [];
	level.var_63e0085 = 0;
	level.var_7c6454 = 1;
	callback::add_callback(#"hash_5ca3a1f306039e1e", &function_f565cb50);
	callback::add_callback(#"hash_666d48a558881a36", &function_8307577f);
	callback::add_callback(#"hash_2c1cafe2a67dfef8", &function_6bcb016d);
}

/*
	Name: function_f565cb50
	Namespace: wz_vehicle
	Checksum: 0x11B973A9
	Offset: 0x1D0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_f565cb50()
{
	level.var_cd8f416a[level.var_cd8f416a.size] = self;
}

/*
	Name: function_8307577f
	Namespace: wz_vehicle
	Checksum: 0xF6943C1E
	Offset: 0x1F8
	Size: 0xA4
	Parameters: 1
	Flags: None
*/
function function_8307577f(params)
{
	vehicle = self;
	player = params.player;
	seatindex = params.eventstruct.seat_index;
	if(seatindex === 0)
	{
		callback::callback("on_driving_wz_vehicle", {#seatindex:seatindex, #player:player, #vehicle:vehicle});
	}
}

/*
	Name: function_6bcb016d
	Namespace: wz_vehicle
	Checksum: 0xE6F510C2
	Offset: 0x2A8
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function function_6bcb016d(params)
{
	vehicle = self;
	player = params.player;
	seatindex = params.eventstruct.seat_index;
	oldseatindex = params.eventstruct.old_seat_index;
	if(seatindex == 0)
	{
		callback::callback("on_driving_wz_vehicle", {#seatindex:seatindex, #player:self, #vehicle:vehicle});
	}
}

