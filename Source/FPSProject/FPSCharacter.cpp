// Fill out your copyright notice in the Description page of Project Settings.

#include "FPSCharacter.h"
#include "FPSProject.h"
#include "Components/CapsuleComponent.h"
#include "Common/UdpSocketBuilder.h"

float height = 200.0;
// Sets default values
AFPSCharacter::AFPSCharacter()
{
	GetMesh()->SetOwnerNoSee(true);
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

	// Create a first person camera component.
	FPSCameraComponent = CreateDefaultSubobject<UCameraComponent>(TEXT("FirstPersonCamera"));
	// Attach the camera component to our capsule component.
	FPSCameraComponent->SetupAttachment(GetCapsuleComponent());

	// Position the camera slightly above the eyes.
	FPSCameraComponent->SetRelativeLocation(FVector(0.0f, 0.0f, 50.0f + BaseEyeHeight));
	// Allow the pawn to control camera rotation.
	FPSCameraComponent->bUsePawnControlRotation = true;

	// Create a first person mesh component for the owning player.
	FPSMesh = CreateDefaultSubobject<USkeletalMeshComponent>(TEXT("FirstPersonMesh"));
	// Only the owning player sees this mesh.
	FPSMesh->SetOnlyOwnerSee(true);
	// Attach the FPS mesh to the FPS camera.
	FPSMesh->SetupAttachment(FPSCameraComponent);
	// Disable some environmental shadowing to preserve the illusion of having a single mesh.
	FPSMesh->bCastDynamicShadow = false;
	FPSMesh->CastShadow = false;
}

// Called when the game starts or when spawned
void AFPSCharacter::BeginPlay()
{
	Super::BeginPlay();

	
	bool suc = true;
	StartUDPReceiver(FString(TEXT("MySocket")), FString(TEXT("127.0.0.1")), 9000, suc);
	if (GEngine && suc)
	{
		// Put up a debug message for five seconds. The -1 "Key" value (first argument) indicates that we will never need to update or refresh this message.
		GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Red, TEXT("We are using FPSCharacter."));
	}
	
}

// Called every frame
void AFPSCharacter::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
	FString received_string;
	bool suc = false;
	DataRecv(received_string, suc);
	if (suc) {
		//start 01 end 23 culicue 45
		// start is the index finger tip
    	// end is the thumb finger tip
		TArray<FString> arr;
		received_string.ParseIntoArray(arr, *FString(" "));
		float temp = height;
		height = FCString::Atoi(*(arr[5]))-FCString::Atoi(*(arr[3]));
		if (temp - height > 20.0){
			AFPSCharacter::Fire();
		}
		ScreenMsg(received_string);
		float angle = FCString::Atof(*(arr[1]))-FCString::Atof(*(arr[5]));
		float distance = FCString::Atof(*(arr[0])) - FCString::Atof(*(arr[4]));
		AFPSCharacter::AddControllerPitchInput(angle / 90.0);
		AFPSCharacter::AddControllerYawInput((distance-250.0) / 90.0);
		
	}

}

// Called to bind functionality to input
void AFPSCharacter::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);
	// Set up "movement" bindings.
	PlayerInputComponent->BindAxis("MoveForward", this, &AFPSCharacter::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &AFPSCharacter::MoveRight);

	// Set up "look" bindings.
	PlayerInputComponent->BindAxis("Turn", this, &AFPSCharacter::AddControllerYawInput);
	PlayerInputComponent->BindAxis("LookUp", this, &AFPSCharacter::AddControllerPitchInput);

	// Set up "action" bindings.
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &AFPSCharacter::StartJump);
	PlayerInputComponent->BindAction("Jump", IE_Released, this, &AFPSCharacter::StopJump);

	// Set up "fire" bindings.
	PlayerInputComponent->BindAction("Fire", IE_Pressed, this, &AFPSCharacter::Fire);
}

void AFPSCharacter::MoveForward(float Value)
{
	// Find out which way is "forward" and record that the player wants to move that way.
	FVector Direction = FRotationMatrix(Controller->GetControlRotation()).GetScaledAxis(EAxis::X);
	AddMovementInput(Direction, Value);
}

void AFPSCharacter::MoveRight(float Value)
{
	// Find out which way is "right" and record that the player wants to move that way.
	FVector Direction = FRotationMatrix(Controller->GetControlRotation()).GetScaledAxis(EAxis::Y);
	AddMovementInput(Direction, Value);
}

void AFPSCharacter::StartJump()
{
	bPressedJump = true;
}

void AFPSCharacter::StopJump()
{
	bPressedJump = false;
}

void AFPSCharacter::Fire()
{
		// Attempt to fire a projectile.
	if (ProjectileClass)
	{
		// Get the camera transform.
		FVector CameraLocation;
		FRotator CameraRotation;
		GetActorEyesViewPoint(CameraLocation, CameraRotation);

		// Set MuzzleOffset to spawn projectiles slightly in front of the camera.
		MuzzleOffset.Set(100.0f, 0.0f, 0.0f);

		// Transform MuzzleOffset from camera space to world space.
		FVector MuzzleLocation = CameraLocation + FTransform(CameraRotation).TransformVector(MuzzleOffset);

		// Skew the aim to be slightly upwards.
		FRotator MuzzleRotation = CameraRotation;
		MuzzleRotation.Pitch += 10.0f;

		UWorld* World = GetWorld();
		if (World)
		{
			FActorSpawnParameters SpawnParams;
			SpawnParams.Owner = this;
			SpawnParams.Instigator = GetInstigator();

			// Spawn the projectile at the muzzle.
			AFPSProjectile* Projectile = World->SpawnActor<AFPSProjectile>(ProjectileClass, MuzzleLocation, MuzzleRotation, SpawnParams);
			if (Projectile)
			{
				// Set the projectile's initial trajectory.
				FVector LaunchDirection = MuzzleRotation.Vector();
				Projectile->FireInDirection(LaunchDirection);
			}
		}
	}
}

void AFPSCharacter::StartUDPReceiver(const FString& YourChosenSocketName, const FString& TheIP, const int32 ThePort, bool& success) // 接收器初始化  接收信息前  
{
	TSharedRef<FInternetAddr> targetAddr = ISocketSubsystem::Get(PLATFORM_SOCKETSUBSYSTEM)->CreateInternetAddr();
	FIPv4Address Addr;
	FIPv4Address::Parse(TheIP, Addr);
	//Create Socket  
	FIPv4Endpoint Endpoint(FIPv4Address::Any, ThePort); 
	ListenSocket = FUdpSocketBuilder(*YourChosenSocketName)
		.AsNonBlocking()
		.AsReusable()
		.BoundToEndpoint(Endpoint)
		.WithReceiveBufferSize(2 * 1024 * 1024);
	//BUFFER SIZE  
	int32 BufferSize = 2 * 1024 * 1024;
	ListenSocket->SetSendBufferSize(BufferSize, BufferSize);
	ListenSocket->SetReceiveBufferSize(BufferSize, BufferSize);
	if (!ListenSocket)
	{
		ScreenMsg("No socket");
		success = false;
	}
	if (ListenSocket)
	{
		ScreenMsg("The receiver is initialized");
		success = true;
	}
	//return true;  
}

void AFPSCharacter::DataRecv(FString& str, bool& success)              //接收消息处理  
{
	if (!ListenSocket)
	{
		ScreenMsg("No sender socket");
		success = false;
		//return success;  
	}
	TSharedRef<FInternetAddr> targetAddr = ISocketSubsystem::Get(PLATFORM_SOCKETSUBSYSTEM)->CreateInternetAddr();
	TArray<uint8> ReceivedData;//定义一个接收器  
	uint32 Size;
	if (ListenSocket->HasPendingData(Size))
	{
		success = true;
		str = "";
		uint8* Recv = new uint8[Size];
		int32 BytesRead = 0;
		ReceivedData.SetNumUninitialized(FMath::Min(Size, 65507u));
		ListenSocket->RecvFrom(ReceivedData.GetData(), ReceivedData.Num(), BytesRead, *targetAddr);//创建远程接收地址  
		char ansiiData[1024];
		memcpy(ansiiData, ReceivedData.GetData(), BytesRead);//拷贝数据到接收器  
		ansiiData[BytesRead] = 0;                            //判断数据结束  
		FString debugData = ANSI_TO_TCHAR(ansiiData);         //字符串转换  
		str = debugData;
		// memset(ansiiData,0,1024);//清空   
	}
	else
	{
		success = false;
	}
	//return success;
}

AFPSCharacter::~AFPSCharacter() {
	delete UDPReceiver;
	UDPReceiver = nullptr;
	//Clear all sockets!  
	//      makes sure repeat plays in Editor dont hold on to old sockets!  
	if (ListenSocket)
	{
		ListenSocket->Close();
		ISocketSubsystem::Get(PLATFORM_SOCKETSUBSYSTEM)->DestroySocket(ListenSocket);
	}
}