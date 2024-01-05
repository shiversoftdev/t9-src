#using scripts\core_common\util_shared.gsc;
#using script_75da5547b1822294;
#using script_d9b5c8b1ad38ef5;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace weapon_cache;

/*
	Name: __init__system__
	Namespace: weapon_cache
	Checksum: 0xFEA3BE58
	Offset: 0x1B8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"weapon_cache", &function_70a657d8, undefined, &finalize, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weapon_cache
	Checksum: 0xDC594A82
	Offset: 0x208
	Size: 0x128
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_6143c4e1e18f08fd")))
	{
		return;
	}
	clientfield::register("scriptmover", "register_weapon_cache", 1, 1, "int");
	clientfield::register("toplayer", "weapon_cache_ammo_cooldown", 1, 1, "int");
	clientfield::register("toplayer", "weapon_cache_cac_cooldown", 1, 1, "int");
	callback::on_connect(&onplayerconnect);
	level.var_b24258 = &function_b24258;
	level.var_f830a9db = &function_f830a9db;
	level.var_50c35573 = [];
}

/*
	Name: onplayerconnect
	Namespace: weapon_cache
	Checksum: 0xAD5920B7
	Offset: 0x338
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function onplayerconnect()
{
	level.var_50c35573[self getentitynumber()] = 1;
}

/*
	Name: finalize
	Namespace: weapon_cache
	Checksum: 0x87EF1F0D
	Offset: 0x368
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function finalize()
{
	if(!is_true(getgametypesetting(#"hash_6143c4e1e18f08fd")))
	{
		return;
	}
	var_b5f67dff = territory::get_struct_array("weapon_cache");
	foreach(var_73b9e48e in var_b5f67dff)
	{
		var_73b9e48e.var_331b8fa4 = 0;
		var_73b9e48e function_4c6228cd();
	}
}

/*
	Name: function_4c6228cd
	Namespace: weapon_cache
	Checksum: 0x987C88E8
	Offset: 0x458
	Size: 0x1F2
	Parameters: 0
	Flags: Linked
*/
function function_4c6228cd()
{
	usetrigger = spawn("trigger_radius_use", self.origin, 0, 96, 32);
	usetrigger setcursorhint("HINT_INTERACTIVE_PROMPT");
	usetrigger function_dae4ab9b(0);
	useobject = gameobjects::create_use_object(#"any", usetrigger, [], undefined, #"weapon_cache", 1, 1, 1, self.angles);
	useobject gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
	useobject gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
	useobject gameobjects::set_use_time(0);
	useobject gameobjects::set_onuse_event(&function_692bd0bc);
	useobject.canuseobject = &function_43017839;
	useobject.dontlinkplayertotrigger = 1;
	useobject.keepweapon = 1;
	useobject clientfield::set("register_weapon_cache", 1);
	useobject disconnectpaths();
	self.entity = util::spawn_model(#"p9_usa_large_ammo_crate_01", self.origin, self.angles);
	self.mdl_gameobject = useobject;
	useobject.var_73b9e48e = self;
}

/*
	Name: function_692bd0bc
	Namespace: weapon_cache
	Checksum: 0x743B6D2C
	Offset: 0x658
	Size: 0x2A4
	Parameters: 1
	Flags: Linked
*/
function function_692bd0bc(player)
{
	primaryweapons = player getweaponslistprimaries();
	givemaxammo = player hasperk(#"specialty_extraammo") || player function_db654c9(player.class_num, #"hash_4a12859000892dda");
	foreach(weapon in primaryweapons)
	{
		player setweaponammoclip(weapon, player function_b7f1fd2c(weapon));
		if(givemaxammo)
		{
			player givemaxammo(weapon);
			continue;
		}
		player givestartammo(weapon);
	}
	primaryoffhand = player function_826ed2dd();
	player setweaponammoclip(primaryoffhand, player function_b7f1fd2c(primaryoffhand));
	loadout = player loadout::get_loadout_slot("secondarygrenade");
	secondaryoffhand = loadout.weapon;
	if(isdefined(secondaryoffhand) && player hasweapon(secondaryoffhand))
	{
		player setweaponammoclip(secondaryoffhand, player function_b7f1fd2c(secondaryoffhand));
	}
	player notify(#"resupply");
	player playsoundtoplayer(#"hash_da34d63dbce7ba7", player);
	player thread function_2909dca6(self.var_73b9e48e);
	player thread function_f9502d83();
}

/*
	Name: function_f9502d83
	Namespace: weapon_cache
	Checksum: 0x66410CA
	Offset: 0x908
	Size: 0x1D0
	Parameters: 0
	Flags: Linked
*/
function function_f9502d83()
{
	self endon(#"disconnect");
	var_b5f67dff = territory::get_struct_array("weapon_cache");
	self clientfield::set_to_player("weapon_cache_ammo_cooldown", 1);
	level.var_50c35573[self getentitynumber()] = 0;
	foreach(var_73b9e48e in var_b5f67dff)
	{
		var_73b9e48e gameobjects::function_7a00d78c(self);
	}
	self waittilltimeout(60, #"death");
	self clientfield::set_to_player("weapon_cache_ammo_cooldown", 0);
	level.var_50c35573[self getentitynumber()] = 1;
	foreach(var_73b9e48e in var_b5f67dff)
	{
		var_73b9e48e gameobjects::function_664b40(self);
	}
}

/*
	Name: function_43017839
	Namespace: weapon_cache
	Checksum: 0x1040E867
	Offset: 0xAE0
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43017839(player)
{
	if(level.var_50c35573[player getentitynumber()] != 1)
	{
		return false;
	}
	return true;
}

/*
	Name: function_b24258
	Namespace: weapon_cache
	Checksum: 0xBA490D4C
	Offset: 0xB28
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b24258(eventstruct)
{
	self luinotifyevent(#"hash_c893e57629c7648");
}

/*
	Name: function_f830a9db
	Namespace: weapon_cache
	Checksum: 0x240B4CF5
	Offset: 0xB60
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_f830a9db()
{
	self endon(#"disconnect");
	self clientfield::set_to_player("weapon_cache_cac_cooldown", 1);
	self notify(#"hash_2bc8de932f7212e7");
	self waittilltimeout(120, #"death");
	self clientfield::set_to_player("weapon_cache_cac_cooldown", 0);
}

/*
	Name: function_6f438290
	Namespace: weapon_cache
	Checksum: 0x741A3E38
	Offset: 0xBF0
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6f438290()
{
	var_b5f67dff = territory::get_struct_array("weapon_cache");
	var_8794b467 = arraysortclosest(var_b5f67dff, self.origin);
	return var_8794b467[0];
}

/*
	Name: function_74547745
	Namespace: weapon_cache
	Checksum: 0x9CC988D6
	Offset: 0xC50
	Size: 0x7C
	Parameters: 0
	Flags: Private
*/
function private function_74547745()
{
	var_73b9e48e = self function_6f438290();
	if(!isdefined(var_73b9e48e))
	{
		return;
	}
	var_73b9e48e function_4ac19c4f();
	self waittill(#"death", #"hash_2bc8de932f7212e7");
	var_73b9e48e function_70db7bab();
}

/*
	Name: function_2909dca6
	Namespace: weapon_cache
	Checksum: 0x16D8149A
	Offset: 0xCD8
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2909dca6(var_73b9e48e)
{
	var_73b9e48e function_4ac19c4f();
	wait(1);
	var_73b9e48e function_70db7bab();
}

/*
	Name: function_4ac19c4f
	Namespace: weapon_cache
	Checksum: 0x7A8D7BB1
	Offset: 0xD20
	Size: 0x58
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4ac19c4f()
{
	if(!self.var_331b8fa4 && isdefined(self.entity))
	{
		self.entity thread scene::play("p9_usa_large_ammo_crate_01_bundle", "open", self.entity);
	}
	self.var_331b8fa4++;
}

/*
	Name: function_70db7bab
	Namespace: weapon_cache
	Checksum: 0x5BBC0BB3
	Offset: 0xD80
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70db7bab()
{
	if(self.var_331b8fa4 && isdefined(self.entity))
	{
		self.var_331b8fa4--;
		if(!self.var_331b8fa4)
		{
			self.entity thread scene::play("p9_usa_large_ammo_crate_01_bundle", "close", self.entity);
		}
	}
}

