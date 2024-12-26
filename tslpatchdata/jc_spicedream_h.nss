#include "k_inc_generic"
#include "k_inc_switch"
#include "jc_inc_follow"
#include "jc_inc_spice"

void DefaultHeartbeat();
void Update();

void main() {
	ExecuteScript("k_ai_master", OBJECT_SELF, KOTOR_DEFAULT_EVENT_ON_HEARTBEAT);
	
	Update();
		
	if( !IsFollower(OBJECT_SELF) )
		DefaultHeartbeat();
}

void Update() {
	if( !GetLocalBoolean(OBJECT_SELF, 30) )
		return;
	
	int nUser = GetSpiceUser(OBJECT_SELF);
	object oUser = GetObjectByTag(NPCToTag(GetSpiceUser(OBJECT_SELF)));

	float fDelay = 0.0;
	while( fDelay < 3.0 ) {
		DelayCommand(fDelay, UpdateHallucination(OBJECT_SELF, oUser));
		fDelay += 0.015;
	}
	
	if( IsFollower(OBJECT_SELF) )
		JC_FollowTheLeader(oUser);
	
	if( GetCurrentAction() != ACTION_MOVETOPOINT ) {
		if( IsDancer(OBJECT_SELF) )
			Dance(OBJECT_SELF);
		else if( IsMusician(OBJECT_SELF) )
			PlayMusic(OBJECT_SELF);
	}
}

void DefaultHeartbeat() {
	object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF,1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
	if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
	{
		if(GN_GetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS) || GN_GetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS_MOBILE))
		{
			string sWay = "WP_" + GetTag(OBJECT_SELF) + "_01";
			int nSeries = GetLocalNumber(OBJECT_SELF, WALKWAYS_SERIES_NUMBER);
			if(!GetIsObjectValid(GetObjectByTag(sWay)) && nSeries <= 0)
			{
				if(GetCurrentAction(OBJECT_SELF) != ACTION_MOVETOPOINT)
				{
					if(!GN_GetIsFighting(OBJECT_SELF) && !GetIsObjectValid(oEnemy))
					{
						GN_PlayAmbientAnimation();
					}
				}
			}
		}
	}
	if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT))
	{
		SignalEvent(OBJECT_SELF, EventUserDefined(1001));
	}
}