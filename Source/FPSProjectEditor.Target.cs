// Copyright Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;
using System.Collections.Generic;

public class FPSProjectEditorTarget : TargetRules
{
	public FPSProjectEditorTarget( TargetInfo Target) : base(Target)
	{
		Type = TargetType.Editor;
        BuildEnvironment = TargetBuildEnvironment.Shared;
        bUseSharedPCHs = true;
		DefaultBuildSettings = BuildSettingsVersion.V2;
		ExtraModuleNames.AddRange( new string[] { "FPSProject" } );
	}
}
