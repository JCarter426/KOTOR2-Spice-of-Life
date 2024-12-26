#include "k_inc_generic"
#include "jc_inc_follow"
#include "jc_inc_spice"

void Init();

void main() {
	DelayCommand(0.3, Init());
}

void Init() {
	if( !GetLocalBoolean(OBJECT_SELF, 12) ) {
		GN_SetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR);
		GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS);
		GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS_MOBILE);
	}
	
	GN_SetDayNightPresence(AMBIENT_PRESENCE_ALWAYS_PRESENT);
	GN_SetListeningPatterns();
	SetLocalNumber(OBJECT_SELF, 11, 6);
	
	int nUser = GetSpiceUser(OBJECT_SELF);
	object oUser = GetObjectByTag(NPCToTag(GetSpiceUser(OBJECT_SELF)));

	float fDelay = 0.0;
	while( fDelay < 3.0 ) {
		DelayCommand(fDelay, UpdateHallucination(OBJECT_SELF, oUser));
		fDelay += 0.015;
	}
	
	if( IsDancer(OBJECT_SELF) )
		Dance(OBJECT_SELF);
	else if( IsMusician(OBJECT_SELF) )
		PlayMusic(OBJECT_SELF);
}