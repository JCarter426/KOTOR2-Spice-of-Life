void jc_Follow(object oTarget) {
	vector vPosition = GetPosition(oTarget);
	float fDist = GetDistanceBetween(oTarget, OBJECT_SELF);
	int bIsTargetRunning = IsRunning(oTarget);
	
	if( GetSoloMode() ) {
		if( GetCurrentAction() == ACTION_MOVETOPOINT )
			ClearAllActions();
	}
	else {
		if( fDist <= 1.5 ) {
			ActionMoveAwayFromObject(oTarget, FALSE, 1.5);
		}
		else if( fDist <= 5.0 ) {
			if( fabs(VectorToAngle(vPosition - GetPosition(OBJECT_SELF)) - GetFacing(OBJECT_SELF)) < 5.0 )
				SetFacingPoint(vPosition);
		}
		else if( fDist <= 10.0 )
			ActionForceMoveToObject(oTarget, IsRunning(oTarget), 3.0, 6.0);
		else
			ActionForceMoveToObject(oTarget, TRUE, 3.0, 6.0);
	}
}

void JC_FollowTheLeader(object oTarget) {
	if( GetCurrentAction() == ACTION_WAIT 
		|| GetIsConversationActive()
		|| !GetCommandable() )
		return;
	
	if( GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN, OBJECT_SELF, 1, CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY)) )
		return;
		
	DelayCommand(0.1, jc_Follow(oTarget));
	DelayCommand(0.2, jc_Follow(oTarget));
	DelayCommand(0.3, jc_Follow(oTarget));
	DelayCommand(0.4, jc_Follow(oTarget));
	DelayCommand(0.5, jc_Follow(oTarget));
	DelayCommand(0.6, jc_Follow(oTarget));
	DelayCommand(0.7, jc_Follow(oTarget));
	DelayCommand(0.8, jc_Follow(oTarget));
	DelayCommand(0.9, jc_Follow(oTarget));
	DelayCommand(1.0, jc_Follow(oTarget));
	DelayCommand(1.1, jc_Follow(oTarget));
	DelayCommand(1.2, jc_Follow(oTarget));
	DelayCommand(1.3, jc_Follow(oTarget));
	DelayCommand(1.4, jc_Follow(oTarget));
	DelayCommand(1.5, jc_Follow(oTarget));
	DelayCommand(1.6, jc_Follow(oTarget));
	DelayCommand(1.7, jc_Follow(oTarget));
	DelayCommand(1.8, jc_Follow(oTarget));
	DelayCommand(1.9, jc_Follow(oTarget));
	DelayCommand(2.0, jc_Follow(oTarget));
	DelayCommand(2.1, jc_Follow(oTarget));
	DelayCommand(2.2, jc_Follow(oTarget));
	DelayCommand(2.3, jc_Follow(oTarget));
	DelayCommand(2.4, jc_Follow(oTarget));
	DelayCommand(2.5, jc_Follow(oTarget));
	DelayCommand(2.6, jc_Follow(oTarget));
	DelayCommand(2.7, jc_Follow(oTarget));
	DelayCommand(2.8, jc_Follow(oTarget));
	DelayCommand(2.9, jc_Follow(oTarget));
}