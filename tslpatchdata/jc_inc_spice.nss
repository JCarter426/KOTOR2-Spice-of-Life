//  0 SPICE_INVALID
//  1 SPICE_ANDRIS
//  2 SPICE_ANDRIS_REFINED
//  3 SPICE_BOOSTER_BLUE
//  4 SPICE_CARSUNUM
//  5 SPICE_GIGGLEDUST
//  6 SPICE_GLITTERSTIM
//  7 SPICE_KARRAK
//  8 SPICE_LESAI
//  9 SPICE_MILLAFLOWER
// 10 SPICE_PYREPENOL
// 11 SPICE_RYLL
// 12 SPICE_SANSANNA
// 13 SPICE_SANSANNA_PURE
// 14 SPICE_YALADAI
// 15 SPICE_YARROCK

int DISGUISE_TYPE_INVISIBLE = #2DAMEMORY1#;
int WITHDRAWAL_EFFECT_ICON  = #2DAMEMORY2#;
int FIRST_SPICE_SPELL_ID    = #2DAMEMORY3#;
int LAST_SPICE_SPELL_ID     = #2DAMEMORY17#;


float CalcWithdrawalDuration(object oUser, float fBaseDuration);
void FearOrNothing(object obj, int nDC, float fDuration);
int GetCurrentSpice(object obj);
location GetLocationNear(location loc);
int GetSpiceUser(object obj);
void Dance(object obj);
void Giggle(object obj);
void Hallucinate(object obj, int bFollow = FALSE);
void Hide(object obj);
int IsDancer(object obj);
int IsMusician(object obj);
int IsFollower(object obj);
string NPCToTag(int nNPC);
void PlayMusic(object obj);
void SetSpiceUser(object obj, int nNPC);
void Show(object obj);
int SpiceEffectIcon(int nSpice);
void StunOrSlow(object obj, int nDC, float fDuration);
string RandomHallucination();
int TagToNPC(string sTag);
void UpdateHallucination(object obj, object oUser);

float CalcWithdrawalDuration(object oUser, float fBaseDuration) {
	int nAbility = GetAbilityModifier(ABILITY_CONSTITUTION, oUser);
	float fDuration = (1.0 - 0.0 * nAbility) * fBaseDuration;
	float fMinDuration = fBaseDuration / 2;
	if( fDuration < fMinDuration )
		return fMinDuration;
	return fDuration;
}

void Dance(object obj) {
	AssignCommand(obj, ActionPlayAnimation(ANIMATION_LOOPING_DANCE + Random(2), 1.0, 3.0));
}

void FearOrNothing(object obj, int nDC, float fDuration) {
	if( WillSave(obj, nDC) == 0 )
		ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectHorrified(), obj, fDuration);
}

int GetCurrentSpice(object obj) {
	if( obj == OBJECT_INVALID )
		return 0;
	effect e = GetFirstEffect(obj);
	int nSpellId = -1;
	while( GetIsEffectValid(e) ) {
		nSpellId = GetEffectSpellId(e);
		if( nSpellId >= FIRST_SPICE_SPELL_ID && nSpellId <= LAST_SPICE_SPELL_ID )
			return nSpellId - FIRST_SPICE_SPELL_ID + 1;
	}
	return 0;
}

location GetLocationNear(location loc) {
	vector v = GetPositionFromLocation(loc);
	vector vPosition = GetPositionFromLocation(loc) + Vector(Random(11) * 0.1 - 0.5, Random(11) * 0.1 - 0.5);
	float fOrientation = VectorToAngle(v - vPosition);
	return Location(vPosition, fOrientation);
}

int GetSpiceUser(object obj) {
	int nNPC = 0;
	if( GetLocalBoolean(obj, 61) )
		nNPC |= 1;
	if( GetLocalBoolean(obj, 62) )
		nNPC |= 2;
	if( GetLocalBoolean(obj, 63) )
		nNPC |= 4;
	if( GetLocalBoolean(obj, 64) )
		nNPC |= 8;
	if( nNPC == 15 )
		return NPC_PLAYER;
	return nNPC;
}

void Giggle(object obj) {
	if( !GetIsConversationActive() && WillSave(obj, 25) == 0 ) {
		AssignCommand(obj, ClearAllActions());
		AssignCommand(obj, ActionPlayAnimation(10029, 1.0, 6.0));
		ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectEntangle(), obj, 6.0);
	}
}

void Hallucinate(object obj, int bFollow) {
	string sTemplate = RandomHallucination();
	object oHallucination = CreateObject(OBJECT_TYPE_CREATURE, sTemplate, GetLocationNear(GetLocation(obj)));
	
	Hide(oHallucination);
	DelayCommand(0.1, SetSpiceUser(oHallucination, TagToNPC(GetTag(obj))));
	DelayCommand(0.2, SetLocalBoolean(oHallucination, 30, TRUE));
	DelayCommand(0.2, SetLocalBoolean(oHallucination, 12, bFollow));
}

void Hide(object obj) {
	SetCommandable(TRUE, obj);
	ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDisguise(DISGUISE_TYPE_INVISIBLE), obj);
	EnableRendering(obj, FALSE);
}

int IsDancer(object obj) {
	return GetTag(obj) == "jc_spice_twilek";
}

int IsFollower(object obj) {
	return GetLocalBoolean(obj, 12);
}

int IsMusician(object obj) {
	return GetTag(obj) == "jc_spice_bith";
}

string NPCToTag(int nNPC) {
	switch( nNPC ) {
	case NPC_PLAYER: return "";
	case NPC_ATTON: return "Atton";
	case NPC_BAO_DUR: return "BaoDur";
	case NPC_CANDEROUS: return "Mand";
	case NPC_DISCIPLE: return "Disciple";
	case NPC_G0T0: return "G0T0";
	case NPC_HANDMAIDEN: return "Handmaiden";
	case NPC_HANHARR: return "Hanharr";
	case NPC_HK_47: return "HK47";
	case NPC_KREIA: return "Kreia";
	case NPC_MIRA: return "Mira";
	case NPC_T3_M4: return "T3M4";
	case NPC_VISAS: return "VisasMarr";
	}
	return "INVALID";
}

void PlayMusic(object obj) {
	AssignCommand(obj, ActionPlayAnimation(ANIMATION_LOOPING_DANCE, 1.0, 3.0));
}

string RandomHallucination() {
	switch( Random(10) ) {
	case 0: return "jc_spice_b4d4";
	case 1: return "jc_spice_bith";
	case 2: return "jc_spice_cannok";
	case 3: return "jc_spice_gizka";
	case 4: return "jc_spice_iriaz";
	case 5: return "jc_spice_jawa";
	case 6: return "jc_spice_rak";
	case 7: return "jc_spice_tach";
	case 8: return "jc_spice_twilek";
	case 9: return "jc_spice_zombie";
	}
	return "";
}

void SetSpiceUser(object obj, int nNPC) {
	if( nNPC == NPC_PLAYER )
		nNPC = 15;
	SetLocalBoolean(obj, 61, nNPC & 1);
	SetLocalBoolean(obj, 62, (nNPC >> 1) & 1);
	SetLocalBoolean(obj, 63, (nNPC >> 2) & 1);
	SetLocalBoolean(obj, 64, (nNPC >> 3) & 1);
}

void Show(object obj) {
	SetCommandable(TRUE, obj);
	EnableRendering(obj, TRUE);	
	effect e = GetFirstEffect(obj);
	while( GetIsEffectValid(e) ) {
		if( GetEffectType(e) == EFFECT_TYPE_DISGUISE )
			RemoveEffect(obj, e);
		e = GetNextEffect(obj);
	}
}

int SpiceEffectIcon(int nSpice) {
	return WITHDRAWAL_EFFECT_ICON - (LAST_SPICE_SPELL_ID - FIRST_SPICE_SPELL_ID + 1 - nSpice + 1);
}

void StunOrSlow(object obj, int nDC, float fDuration) {
	effect e;
	if( FortitudeSave(obj, nDC) == 0 ) {
		e = EffectStunned();
	}
	else {
		e = EffectMovementSpeedDecrease(50);
		e = EffectLinkEffects(e, EffectACDecrease(4));
	}	
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, obj, fDuration);
}

int TagToNPC(string sTag) {
	if( sTag == "" )
		return NPC_PLAYER;
	if( sTag == "Atton" )
		return NPC_ATTON;
	if( sTag == "BaoDur" )
		return NPC_BAO_DUR;
	if( sTag == "Mand" )
		return NPC_CANDEROUS;
	if( sTag == "Disciple" )
		return NPC_DISCIPLE;
	if( sTag == "G0T0" )
		return NPC_G0T0;
	if( sTag == "Handmaiden" )
		return NPC_HANDMAIDEN;
	if( sTag == "Hanharr" )
		return NPC_HANHARR;
	if( sTag == "HK47" )
		return NPC_HK_47;
	if( sTag == "Kreia" )
		return NPC_KREIA;
	if( sTag == "Mira" )
		return NPC_MIRA;
	if( sTag == "T3M4" )
		return NPC_T3_M4;
	if( sTag == "VisasMarr" )
		return NPC_VISAS;
	return 0xCCCCCCCC;
}

void UpdateHallucination(object obj, object oUser) {
	if( !(GetIsObjectValid(oUser) && GetCurrentSpice(oUser) == 15) ) {
		Hide(obj);
		AssignCommand(obj, SetIsDestroyable(TRUE));
		DestroyObject(obj, 0.1, FALSE, 0.0, TRUE);
	}
	else if( GetIsPartyLeader(oUser) ) {
		Show(obj);
	}
	else {
		Hide(obj);
	}
}