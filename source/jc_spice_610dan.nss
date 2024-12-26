#include "jc_inc_spiceloot"

void main() {
	if( GetLocalBoolean(OBJECT_SELF, 57) )
		return;
	
	object oContainer = GetObjectByTag("npc_gerevick");
	
	if( !GetIsObjectValid(oContainer) )
		return;
	
	SetLocalBoolean(OBJECT_SELF, 57, TRUE);
	
	PlaceSpice(oContainer, GetSpiceRare());
	
	DelayCommand(1.0, DestroyObject(OBJECT_SELF, 0.0, TRUE, 0.0, TRUE));
}