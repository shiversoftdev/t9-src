#using script_75da5547b1822294;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\oob.gsc;

#namespace oob;

/*
	Name: function_1abb3597
	Namespace: oob
	Checksum: 0x7F667009
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1abb3597()
{
	level notify(1864816179);
}

/*
	Name: init
	Namespace: oob
	Checksum: 0x7B663A09
	Offset: 0xC0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_bde3d03 = &function_b777ff94;
}

/*
	Name: function_3c597e8d
	Namespace: oob
	Checksum: 0x728F889D
	Offset: 0xE8
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private function_3c597e8d()
{
	if(territory::function_c0de0601())
	{
		return territory::get_center();
	}
	var_6024133d = getentarray("map_corner", "targetname");
	if(var_6024133d.size)
	{
		return math::find_box_center(var_6024133d[0].origin, var_6024133d[1].origin);
	}
	return (0, 0, 0);
}

/*
	Name: function_2a3d483d
	Namespace: oob
	Checksum: 0xFB5B3649
	Offset: 0x180
	Size: 0x12A
	Parameters: 1
	Flags: Private
*/
function private function_2a3d483d(start)
{
	mapcenter = function_3c597e8d();
	jumpdistance = 600;
	var_d7afe542 = mapcenter - start;
	var_d80c8cde = length(var_d7afe542);
	var_fa57b4b3 = vectornormalize(var_d7afe542);
	steps = int(var_d80c8cde / jumpdistance);
	for(index = 1; index <= steps; index++)
	{
		newpoint = start + ((var_fa57b4b3 * index) * jumpdistance);
		if(!chr_party(newpoint) && territory::is_inside(newpoint))
		{
			return newpoint;
		}
	}
	return mapcenter;
}

/*
	Name: function_c1471c7c
	Namespace: oob
	Checksum: 0x53294C62
	Offset: 0x2B8
	Size: 0x10E
	Parameters: 1
	Flags: Private
*/
function private function_c1471c7c(point)
{
	startpoint = (point[0], point[1], 10000);
	endpoint = (point[0], point[1], -10000);
	groundtrace = groundtrace(startpoint, endpoint, 0, undefined, 0, 0);
	physicstrace = physicstraceex(startpoint, endpoint, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), undefined, 32);
	if(groundtrace[#"position"][2] > physicstrace[#"position"][2])
	{
		return groundtrace[#"position"];
	}
	return physicstrace[#"position"];
}

/*
	Name: _teleport_player
	Namespace: oob
	Checksum: 0x7ADDFF82
	Offset: 0x3D0
	Size: 0xFA
	Parameters: 3
	Flags: Private
*/
function private _teleport_player(origin, angles, var_9914886a)
{
	self endon(#"disconnect", #"hash_6b2be5fc7a5ce34f");
	self.oobdisabled = 1;
	fadetime = 0.5;
	self thread hud::fade_to_black_for_x_sec(0, 1, fadetime, fadetime);
	wait(fadetime);
	self.var_63b63c2 = 1;
	self unlink();
	self setorigin(angles);
	self setplayerangles((0, var_9914886a[1], 0));
	self.oobdisabled = 0;
	self.var_63b63c2 = 0;
}

/*
	Name: function_b777ff94
	Namespace: oob
	Checksum: 0xCBEADDB
	Offset: 0x4D8
	Size: 0x28C
	Parameters: 1
	Flags: None
*/
function function_b777ff94(entity)
{
	/#
		iprintlnbold(((((("" + entity.origin[0]) + "") + entity.origin[1]) + "") + entity.origin[2]) + "");
	#/
	if(!isdefined(entity))
	{
		return;
	}
	players = [];
	var_9914886a = 0;
	if(isplayer(entity) && entity isinvehicle())
	{
		vehicle = entity getvehicleoccupied();
		players = vehicle getvehoccupants();
		if(isdefined(vehicle.scriptvehicletype) && vehicle.scriptvehicletype == #"tactical_raft_wz")
		{
			var_9914886a = 1;
		}
	}
	else
	{
		players[players.size] = entity;
	}
	playeroffset = vectorscale((0, 1, 0), 120);
	mapcenter = function_3c597e8d();
	for(index = 0; index < players.size; index++)
	{
		player = players[index];
		startpoint = player.origin + (playeroffset * index);
		var_8390ff37 = function_2a3d483d(startpoint);
		var_8390ff37 = function_c1471c7c(var_8390ff37);
		var_ee243d11 = vectortoangles(mapcenter - player.origin);
		if(!isplayer(player))
		{
			player dodamage(player.health, player.origin);
			continue;
		}
		player thread _teleport_player(var_8390ff37, var_ee243d11, var_9914886a);
	}
}

/*
	Name: function_cabed683
	Namespace: oob
	Checksum: 0xD96A703B
	Offset: 0x770
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_cabed683(startpoint)
{
	var_8390ff37 = function_2a3d483d(startpoint);
	var_8390ff37 = function_c1471c7c(var_8390ff37);
	return var_8390ff37;
}

