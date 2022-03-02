#namespace blackboard_vehicle;

/*
	Name: function_a0edf205
	Namespace: blackboard_vehicle
	Checksum: 0x5610BC01
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a0edf205()
{
	level notify(586745751);
}

#namespace blackboard;

/*
	Name: registervehicleblackboardattributes
	Namespace: blackboard
	Checksum: 0xA1E91AEE
	Offset: 0x80
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function registervehicleblackboardattributes()
{
	/#
		assert(isvehicle(self), "");
	#/
}

/*
	Name: bb_getspeed
	Namespace: blackboard
	Checksum: 0xF28A4FF1
	Offset: 0xC0
	Size: 0x3A
	Parameters: 0
	Flags: Linked
*/
function bb_getspeed()
{
	velocity = self getvelocity();
	return length(velocity);
}

/*
	Name: bb_vehgetenemyyaw
	Namespace: blackboard
	Checksum: 0xB10CCA97
	Offset: 0x108
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function bb_vehgetenemyyaw()
{
	enemy = self.enemy;
	if(!isdefined(enemy))
	{
		return 0;
	}
	toenemyyaw = vehgetpredictedyawtoenemy(self, 0.2);
	return toenemyyaw;
}

/*
	Name: vehgetpredictedyawtoenemy
	Namespace: blackboard
	Checksum: 0x7CB68520
	Offset: 0x160
	Size: 0x152
	Parameters: 2
	Flags: Linked
*/
function vehgetpredictedyawtoenemy(entity, lookaheadtime)
{
	if(isdefined(entity.predictedyawtoenemy) && isdefined(entity.predictedyawtoenemytime) && entity.predictedyawtoenemytime == gettime())
	{
		return entity.predictedyawtoenemy;
	}
	selfpredictedpos = entity.origin;
	moveangle = entity.angles[1] + entity getmotionangle();
	selfpredictedpos = selfpredictedpos + (((cos(moveangle), sin(moveangle), 0) * 200) * lookaheadtime);
	yaw = (vectortoangles(entity.enemy.origin - selfpredictedpos)[1]) - entity.angles[1];
	yaw = absangleclamp360(yaw);
	entity.predictedyawtoenemy = yaw;
	entity.predictedyawtoenemytime = gettime();
	return yaw;
}

