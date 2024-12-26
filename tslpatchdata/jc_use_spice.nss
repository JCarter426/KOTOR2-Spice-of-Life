#include "jc_inc_spice"

void UseAndris(object oUser, int nLevel = 1);
void UseBoosterBlue(object oUser);
void UseCarsunum(object oUser);
void UseGiggledust(object oUser);
void UseKarrak(object oUser);
void UseLesai(object oUser);
void UseMillaflower(object oUser);
void UsePyrepenol(object oUser);
void UseRyllOrGlitterstim(object oUser, int nLevel);
void UseSansanna(object oUser, int nLevel = 1);
void UseYaladai(object oUser);
void UseYarrock(object oUser);

void main() {
	object oTarget = GetSpellTargetObject();
	if( GetCurrentSpice(oTarget) )
		return;
	switch( GetSpellId() - FIRST_SPICE_SPELL_ID + 1 ) {
	case 1: // Andris
		UseAndris(oTarget, 1);
		break;
	case 2: // Refined Andris
		UseAndris(oTarget, 2);
		break;
	case 3: // Booster Blue
		UseBoosterBlue(oTarget);
		break;
	case 4: // Carsunum
		UseCarsunum(oTarget);
		break;
	case 5: // Giggledust
		UseGiggledust(oTarget);
		break;
	case 6: // Glitterstim
		UseRyllOrGlitterstim(oTarget, 2);
		break;
	case 7: // Karrak
		UseKarrak(oTarget);
		break;
	case 8: // Lesai
		UseLesai(oTarget);
		break;
	case 9: // Millaflower
		UseMillaflower(oTarget);
		break;
	case 10: // Pyrepenol
		UsePyrepenol(oTarget);
		break;
	case 11: // Ryll
		UseRyllOrGlitterstim(oTarget, 1);
		break;
	case 12: // Sansanna
		UseSansanna(oTarget, 1);
		break;
	case 13: // Pure Sansanna
		UseSansanna(oTarget, 2);
		break;
	case 14: // Yaladai
		UseYaladai(oTarget);
		break;
	case 15: // Yarrock
		UseYarrock(oTarget);
		break;
	}
}

void UseAndris(object oUser, int nLevel) {
	// SendMessageToPC(GetFirstPC(), "Using Andris (level " + IntToString(nLevel) + ")");
	
	int nSpice = nLevel;
	float fEffectDuration = 120.0;
	float fWithdrawalDuration = CalcWithdrawalDuration(oUser, 30.0);
	
	effect e = EffectAbilityIncrease(ABILITY_WISDOM, 2 * (nLevel + 1));
	e = EffectLinkEffects(e, EffectSkillIncrease(SKILL_AWARENESS, 4 * nLevel - 1));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
	
	e = EffectAbilityDecrease(ABILITY_STRENGTH, 2);
	e = SetEffectIcon(e, WITHDRAWAL_EFFECT_ICON);
	DelayCommand(fEffectDuration, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fWithdrawalDuration));
}

void UseBoosterBlue(object oUser) {
	// SendMessageToPC(GetFirstPC(), "Using Booster Blue");
	
	int nSpice = 3;
	float fEffectDuration = 120.0;
	float fWithdrawalDuration = CalcWithdrawalDuration(oUser, 30.0);
	
	effect e = EffectAbilityIncrease(ABILITY_DEXTERITY, 2);
	e = EffectLinkEffects(e, EffectACIncrease(4));
	e = EffectLinkEffects(e, EffectSavingThrowIncrease(SAVING_THROW_REFLEX, 3));
	e = EffectLinkEffects(e, EffectModifyAttacks(1));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
	
	e = EffectAbilityDecrease(ABILITY_INTELLIGENCE, 2);
	e = EffectLinkEffects(e, EffectAbilityDecrease(ABILITY_WISDOM, 2));
	e = SetEffectIcon(e, WITHDRAWAL_EFFECT_ICON);
	DelayCommand(fEffectDuration, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fWithdrawalDuration));
}

void UseCarsunum(object oUser) {
	// SendMessageToPC(GetFirstPC(), "Using Carsunum");
	
	int nSpice = 4;
	float fEffectDuration = 120.0;
	float fWithdrawalDuration = CalcWithdrawalDuration(oUser, 30.0);
	
	effect e = EffectAbilityIncrease(ABILITY_STRENGTH, 3);
	e = EffectLinkEffects(e, EffectAbilityIncrease(ABILITY_DEXTERITY, 3));
	e = EffectLinkEffects(e, EffectAbilityIncrease(ABILITY_CONSTITUTION, 3));
	e = EffectLinkEffects(e, EffectAbilityIncrease(ABILITY_INTELLIGENCE, 3));
	e = EffectLinkEffects(e, EffectAbilityIncrease(ABILITY_WISDOM, 3));
	e = EffectLinkEffects(e, EffectAbilityIncrease(ABILITY_CHARISMA, 3));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
	
	e = EffectAbilityDecrease(ABILITY_STRENGTH, 3);
	e = EffectLinkEffects(e, EffectAbilityDecrease(ABILITY_DEXTERITY, 3));
	e = EffectLinkEffects(e, EffectAbilityDecrease(ABILITY_CONSTITUTION, 3));
	e = SetEffectIcon(e, WITHDRAWAL_EFFECT_ICON);
	DelayCommand(fEffectDuration, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fWithdrawalDuration));
}

void UseGiggledust(object oUser) {
	// SendMessageToPC(GetFirstPC(), "Using Giggledust");
		
	int nSpice = 5;
	float fEffectDuration = 120.0;
	
	effect e = EffectAbilityDecrease(ABILITY_CHARISMA, 2);
	e = EffectLinkEffects(e, EffectSkillIncrease(SKILL_AWARENESS, 5));
	e = EffectLinkEffects(e, EffectSkillDecrease(SKILL_STEALTH, 5));
	e = EffectLinkEffects(e, EffectACIncrease(2));
	e = EffectLinkEffects(e, EffectSavingThrowIncrease(SAVING_THROW_REFLEX, 3));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
	
	float fDelay = 6.0;
	while( fDelay < fEffectDuration ) {
		if( Random(4) == 0 )
			DelayCommand(fDelay, Giggle(oUser));
		fDelay += 6.0;
	}
}

void UseKarrak(object oUser) {
	// SendMessageToPC(GetFirstPC(), "Using Karrak");
	
	int nSpice = 7;
	float fEffectDuration = 120.0;
	float fWithdrawalDuration = CalcWithdrawalDuration(oUser, 30.0);
	
	effect e = EffectAbilityIncrease(ABILITY_CONSTITUTION, 2);
	e = EffectLinkEffects(e, EffectRegenerate(4, 6.0));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
	
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectImmunity(IMMUNITY_TYPE_POISON), oUser, fEffectDuration - 1.0);
	
	float fDelay = 6.0;
	while( fDelay < fEffectDuration ) {
		DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamageForcePoints(20), oUser));
		fDelay += 6.0;
	}
	
	e = EffectAbilityDecrease(ABILITY_CONSTITUTION, 2);
	e = SetEffectIcon(e, WITHDRAWAL_EFFECT_ICON);
	DelayCommand(fEffectDuration, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fWithdrawalDuration));
	
	DelayCommand(fEffectDuration, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectPoison(POISON_DAMAGE_AVERAGE), oUser));
}

void UseLesai(object oUser) {
	// SendMessageToPC(GetFirstPC(), "Using Lesai");
	
	int nSpice = 8;
	float fEffectDuration = 120.0;
	
	effect e = EffectAbilityDecrease(ABILITY_CHARISMA, 2);
	e = EffectLinkEffects(e, EffectSavingThrowIncrease(SAVING_THROW_WILL, 3));
	e = EffectLinkEffects(e, EffectImmunity(IMMUNITY_TYPE_STUN));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
}

void UseMillaflower(object oUser) {
	// SendMessageToPC(GetFirstPC(), "Using Millaflower");
	
	int nSpice = 9;
	float fEffectDuration = 120.0;
	float fWithdrawalDuration = CalcWithdrawalDuration(oUser, 30.0);
	
	effect e = EffectSavingThrowIncrease(SAVING_THROW_WILL, 6);
	e = EffectLinkEffects(e, EffectImmunity(IMMUNITY_TYPE_STUN));
	e = EffectLinkEffects(e, EffectImmunity(IMMUNITY_TYPE_FEAR));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
	
	e = EffectAbilityDecrease(ABILITY_DEXTERITY, 2);
	e = SetEffectIcon(e, WITHDRAWAL_EFFECT_ICON);
	DelayCommand(fEffectDuration, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fWithdrawalDuration));
	DelayCommand(fEffectDuration, StunOrSlow(oUser, 25, 9.0));
}

void UsePyrepenol(object oUser) {
	// SendMessageToPC(GetFirstPC(), "Using Pyrepenol");
	
	int nSpice = 10;
	float fEffectDuration = 120.0;
	
	effect e = EffectAbilityIncrease(ABILITY_CHARISMA, 4);
	e = EffectLinkEffects(e, EffectAttackIncrease(2));
	e = EffectLinkEffects(e, EffectACIncrease(2));
	e = EffectLinkEffects(e, EffectSavingThrowDecrease(SAVING_THROW_FORT, 3));
	e = EffectLinkEffects(e, EffectSavingThrowDecrease(SAVING_THROW_REFLEX, 3));
	e = EffectLinkEffects(e, EffectSavingThrowDecrease(SAVING_THROW_WILL, 3));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
}

void UseRyllOrGlitterstim(object oUser, int nLevel) {
	// if( nLevel == 1 )
	// 	SendMessageToPC(GetFirstPC(), "Using Ryll");
	// else if( nLevel == 2 )
	// 	SendMessageToPC(GetFirstPC(), "Using Glitterstim");
	
	int nSpice = 11;
	if( nLevel > 1 )
		nSpice = 6;
	float fEffectDuration = 120.0;
	float fWithdrawalDuration = CalcWithdrawalDuration(oUser, 30.0);
	
	effect e = EffectAbilityIncrease(ABILITY_INTELLIGENCE, nLevel * 2 + 1);
	e = EffectLinkEffects(e, EffectAbilityIncrease(ABILITY_WISDOM, nLevel * 2 + 1));
	e = EffectLinkEffects(e, EffectAbilityIncrease(ABILITY_CHARISMA, nLevel * 2 + 1));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
	
	e = EffectAbilityDecrease(ABILITY_DEXTERITY, 3);
	e = EffectLinkEffects(e, EffectSavingThrowDecrease(SAVING_THROW_WILL, 3));
	e = SetEffectIcon(e, WITHDRAWAL_EFFECT_ICON);
	DelayCommand(fEffectDuration, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fWithdrawalDuration));
}

void UseSansanna(object oUser, int nLevel) {
	// SendMessageToPC(GetFirstPC(), "Using Sansanna (level " + IntToString(nLevel) + ")");
	
	int nSpice = nLevel + 11;
	float fEffectDuration = 120.0;
	float fWithdrawalDuration = CalcWithdrawalDuration(oUser, 30.0);

	effect e = EffectAbilityIncrease(ABILITY_INTELLIGENCE, 2 * (nLevel + 1));
	e = EffectLinkEffects(e, EffectSkillIncrease(SKILL_COMPUTER_USE, nLevel * 2));
	e = EffectLinkEffects(e, EffectSkillIncrease(SKILL_DEMOLITIONS, nLevel * 2));
	e = EffectLinkEffects(e, EffectSkillIncrease(SKILL_STEALTH, nLevel * 2));
	e = EffectLinkEffects(e, EffectSkillIncrease(SKILL_AWARENESS, nLevel * 2));
	e = EffectLinkEffects(e, EffectSkillIncrease(SKILL_PERSUADE, nLevel * 2));
	e = EffectLinkEffects(e, EffectSkillIncrease(SKILL_REPAIR, nLevel * 2));
	e = EffectLinkEffects(e, EffectSkillIncrease(SKILL_SECURITY, nLevel * 2));
	e = EffectLinkEffects(e, EffectSkillIncrease(SKILL_TREAT_INJURY, nLevel * 2));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
	
	e = EffectAbilityDecrease(ABILITY_WISDOM, 2);
	e = SetEffectIcon(e, WITHDRAWAL_EFFECT_ICON);
	DelayCommand(fEffectDuration, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fWithdrawalDuration));
}

void UseYaladai(object oUser) {
	// SendMessageToPC(GetFirstPC(), "Using Yaladai");
	
	int nSpice = 14;
	float fEffectDuration = 120.0;
	
	int nDSPoints = (GetGoodEvilValue(oUser) - 50) / 10;
	if( nDSPoints > 0 && WillSave(oUser, 25) == 0 )
		AdjustAlignment(oUser, nDSPoints, ALIGNMENT_DARK_SIDE);
	
	effect e = EffectAbilityIncrease(ABILITY_WISDOM, 4);
	e = EffectLinkEffects(e, EffectAbilityIncrease(ABILITY_CHARISMA, 4));
	e = EffectLinkEffects(e, EffectSavingThrowDecrease(SAVING_THROW_WILL, 7));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
}

void UseYarrock(object oUser) {
	// SendMessageToPC(GetFirstPC(), "Using Yarrock");
	
	int nSpice = 15;
	float fEffectDuration = 120.0;
	float fWithdrawalDuration = CalcWithdrawalDuration(oUser, 30.0);

	effect e = EffectAbilityIncrease(ABILITY_CHARISMA, 6);
	e = EffectLinkEffects(e, EffectAttackIncrease(4));
	e = EffectLinkEffects(e, EffectACIncrease(4));
	e = SetEffectIcon(e, SpiceEffectIcon(nSpice));
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fEffectDuration);
	
	if( Random(4) == 0 )
		DelayCommand(fEffectDuration, FearOrNothing(oUser, 25, 6.0));
	
	float fDelay = IntToFloat(5 + Random(10));
	int nChance = 1;
	int bHasFollower = FALSE;
	while( fDelay < fEffectDuration ) {
		if( Random(5) == 0 ) {
			if( !bHasFollower && Random(4) == 0 ) {
				bHasFollower = TRUE;
				DelayCommand(fDelay, Hallucinate(oUser, TRUE));
			}
			else {
				DelayCommand(fDelay, Hallucinate(oUser, FALSE));
			}
		}
		else {
			++nChance;
		}
		fDelay += IntToFloat(5 + Random(10));
	}
	
	e = EffectSavingThrowDecrease(SAVING_THROW_FORT, 3);
	e = EffectLinkEffects(e, EffectSavingThrowDecrease(SAVING_THROW_REFLEX, 3));
	e = EffectLinkEffects(e, EffectSavingThrowDecrease(SAVING_THROW_WILL, 3));
	e = SetEffectIcon(e, WITHDRAWAL_EFFECT_ICON);
	DelayCommand(fEffectDuration, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oUser, fWithdrawalDuration));
}