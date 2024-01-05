#using scripts\core_common\clientfield_shared.csc;

#namespace archetype_human;

/*
	Name: precache
	Namespace: archetype_human
	Checksum: 0x80F724D1
	Offset: 0x98
	Size: 0x4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec precache()
{
}

/*
	Name: main
	Namespace: archetype_human
	Checksum: 0x9F6DAD8D
	Offset: 0xA8
	Size: 0x84
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	clientfield::register("actor", "facial_dial", 1, 1, "int", &humanclientutils::facialdialoguehandler, 0, 1);
	clientfield::register("actor", "lipflap_anim", 1, 2, "int", undefined, 0, 1);
}

#namespace humanclientutils;

/*
	Name: facialdialoguehandler
	Namespace: humanclientutils
	Checksum: 0xC10602BB
	Offset: 0x138
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function facialdialoguehandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump)
	{
		self.facialdialogueactive = 1;
	}
	else if(is_true(self.facialdialogueactive))
	{
		self clearanim(#"faces", 0);
	}
}

