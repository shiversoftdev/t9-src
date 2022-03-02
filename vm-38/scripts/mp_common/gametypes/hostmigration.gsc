#using scripts\core_common\hostmigration_shared.gsc;

#namespace hostmigration;

/*
	Name: function_86fbc1fc
	Namespace: hostmigration
	Checksum: 0xC5372653
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_86fbc1fc()
{
	level notify(227009867);
}

/*
	Name: callback_hostmigrationsave
	Namespace: hostmigration
	Checksum: 0x80F724D1
	Offset: 0x88
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function callback_hostmigrationsave()
{
}

/*
	Name: callback_prehostmigrationsave
	Namespace: hostmigration
	Checksum: 0x80F724D1
	Offset: 0x98
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function callback_prehostmigrationsave()
{
}

/*
	Name: callback_hostmigration
	Namespace: hostmigration
	Checksum: 0x9CA184A8
	Offset: 0xA8
	Size: 0x1D8
	Parameters: 0
	Flags: Linked
*/
function callback_hostmigration()
{
	setslowmotion(1, 1, 0);
	level.hostmigrationreturnedplayercount = 0;
	if(level.inprematchperiod)
	{
		level waittill(#"prematch_over");
	}
	if(level.gameended)
	{
		/#
			println(("" + gettime()) + "");
		#/
		return;
	}
	/#
		println("" + gettime());
	#/
	level.hostmigrationtimer = 1;
	sethostmigrationstatus(1);
	level notify(#"host_migration_begin");
	thread locktimer();
	players = level.players;
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		player thread hostmigrationtimerthink();
	}
	level endon(#"host_migration_begin");
	hostmigrationwait();
	level.hostmigrationtimer = undefined;
	sethostmigrationstatus(0);
	/#
		println("" + gettime());
	#/
	level notify(#"host_migration_end");
}

