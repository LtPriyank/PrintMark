
ACTION AxisIOMap: 
	
	//Cutter Axis Basic Input
	iFb_MpAxisBasic.MpLink       := ADR(gMl_CutAxis);
	iFb_MpAxisBasic.Enable       := TRUE;
	iFb_MpAxisBasic.ErrorReset   := gAx_Cutter.In.ErrorReset;
	iFb_MpAxisBasic.Parameters   := ADR(gAx_Cutter.In.Parameters);
	iFb_MpAxisBasic.Update       := gAx_Cutter.In.Update;
	iFb_MpAxisBasic.Axis         := ADR(gCutAxis);
	iFb_MpAxisBasic.Power        := gAx_Cutter.In.Power;
	iFb_MpAxisBasic.Home         := gAx_Cutter.In.Home;
	iFb_MpAxisBasic.MoveVelocity := gAx_Cutter.In.MoveVelocity;
	iFb_MpAxisBasic.MoveAbsolute := gAx_Cutter.In.MoveAbsolute;
	iFb_MpAxisBasic.MoveAdditive := gAx_Cutter.In.MoveAdditive;
	iFb_MpAxisBasic.Stop         := gAx_Cutter.In.Stop;
	iFb_MpAxisBasic.JogPositive  := gAx_Cutter.In.JogPositive;
	iFb_MpAxisBasic.JogNegative  := gAx_Cutter.In.JogNegative;
	iFb_MpAxisBasic.Autotune     := gAx_Cutter.In.Autotune;
	iFb_MpAxisBasic.Simulate     := gAx_Cutter.In.Simulate;
	iFb_MpAxisBasic.TorqueLimit  := gAx_Cutter.In.TorqueLimit;
	iFb_MpAxisBasic.ReleaseBrake := gAx_Cutter.In.ReleaseBrake;
	iFb_MpAxisBasic();

	//Cutter axis Basic Output
	gAx_Cutter.Out.Active         := iFb_MpAxisBasic.Active;
	gAx_Cutter.Out.Error          := iFb_MpAxisBasic.Error;
	gAx_Cutter.Out.StatusID       := iFb_MpAxisBasic.StatusID;
	gAx_Cutter.Out.UpdateDone     := iFb_MpAxisBasic.UpdateDone;
	gAx_Cutter.Out.Position       := iFb_MpAxisBasic.Position;
	gAx_Cutter.Out.Velocity       := iFb_MpAxisBasic.Velocity;
	gAx_Cutter.Out.CommandBusy    := iFb_MpAxisBasic.CommandBusy;
	gAx_Cutter.Out.CommandAborted := iFb_MpAxisBasic.CommandAborted;
	gAx_Cutter.Out.PowerOn        := iFb_MpAxisBasic.PowerOn;
	gAx_Cutter.Out.IsHomed        := iFb_MpAxisBasic.IsHomed;
	gAx_Cutter.Out.InVelocity     := iFb_MpAxisBasic.InVelocity;
	gAx_Cutter.Out.InPosition     := iFb_MpAxisBasic.InPosition;
	gAx_Cutter.Out.MoveActive     := iFb_MpAxisBasic.MoveActive;
	gAx_Cutter.Out.Stopped        := iFb_MpAxisBasic.Stopped;
	gAx_Cutter.Out.TuningDone     := iFb_MpAxisBasic.TuningDone;
	gAx_Cutter.Out.Simulation     := iFb_MpAxisBasic.Simulation;
	gAx_Cutter.Out.TorqueLimited  := iFb_MpAxisBasic.TorqueLimited;
	gAx_Cutter.Out.BrakeReleased  := iFb_MpAxisBasic.BrakeReleased;
	gAx_Cutter.Out.Info           := iFb_MpAxisBasic.Info;
	
	//Cam Axis basic input parameters
	iFb_MpAxisCaming.MpLink       := ADR(gMl_CutAxis);
	iFb_MpAxisCaming.Enable       := TRUE;
	iFb_MpAxisCaming.ErrorReset   := gAx_CutterCam.In.ErrorReset;
	iFb_MpAxisCaming.Parameters   := ADR(gAx_CutterCam.In.Parameters);
	iFb_MpAxisCaming.Update       := gAx_CutterCam.In.Update;
	iFb_MpAxisCaming.MpLinkMaster := ADR(gMl_BeltAxis);
	iFb_MpAxisCaming.Signal1      := gAx_CutterCam.In.Signal1;
	iFb_MpAxisCaming.Signal2      := gAx_CutterCam.In.Signal2;
	iFb_MpAxisCaming.Signal3      := gAx_CutterCam.In.Signal3;
	iFb_MpAxisCaming.Signal4      := gAx_CutterCam.In.Signal4;
	iFb_MpAxisCaming.StartSequence:= gAx_CutterCam.In.StartSequence;
	iFb_MpAxisCaming.Continue     := gAx_CutterCam.In.Continue;
	iFb_MpAxisCaming.EndSequence  := gAx_CutterCam.In.EndSequence;
	
	//Cam Axis basic output parameters
	gAx_CutterCam.Out.InSync := iFb_MpAxisCaming.InSync;
	gAx_CutterCam.Out.Error := iFb_MpAxisCaming.Error;
	
	//Calling Cam FB
	iFb_MpAxisCaming();

END_ACTION
