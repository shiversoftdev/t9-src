#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using script_35598499769dbb3d;
#using script_41fe08c37d53a635;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace globallogic_actor;

/*
	Name: callback_actorspawned
	Namespace: globallogic_actor
	Checksum: 0xABF7FC56
	Offset: 0xA8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function callback_actorspawned(spawner)
{
	self thread spawner::spawn_think(spawner);
	bb::logaispawn(self, spawner);
}

/*
	Name: callback_actorcloned
	Namespace: globallogic_actor
	Checksum: 0x5F739815
	Offset: 0xF0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function callback_actorcloned(original)
{
	destructserverutils::copydestructstate(original, self);
	gibserverutils::copygibstate(original, self);
}

