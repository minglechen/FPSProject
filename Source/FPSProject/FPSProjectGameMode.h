// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "GameFramework/GameModeBase.h"
#include "FPSProjectGameMode.generated.h"

/**
 * 
 */
UCLASS()
class FPSPROJECT_API AFPSProjectGameMode : public AGameModeBase
{
	GENERATED_BODY()
	virtual void StartPlay() override;
};
