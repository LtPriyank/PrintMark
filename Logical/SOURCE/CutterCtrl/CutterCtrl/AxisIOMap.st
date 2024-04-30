
ACTION ACTION: 
	
	//Cutter Axis Basic Input
	iFb_MpAxisBasic.MpLink       := ADR(gMl_CutAxis);
	iFb_MpAxisBasic.Enable       := TRUE;
	iFb_MpAxisBasic.ErrorReset   := gAx_SlaveBasic.In.ErrorReset;
	iFb_MpAxisBasic.Parameters   := ADR(gAx_SlaveBasic.In.Parameters);
	iFb_MpAxisBasic.Update       := gAx_SlaveBasic.In.Update;
	iFb_MpAxisBasic.Axis         := ADR(gCutAxis);
	iFb_MpAxisBasic.Power        := gAx_SlaveBasic.In.Power;
	iFb_MpAxisBasic.Home         := gAx_SlaveBasic.In.Home;
	iFb_MpAxisBasic.MoveVelocity := gAx_SlaveBasic.In.MoveVelocity;
	iFb_MpAxisBasic.MoveAbsolute := gAx_SlaveBasic.In.MoveAbsolute;
	iFb_MpAxisBasic.MoveAdditive := gAx_SlaveBasic.In.MoveAdditive;
	iFb_MpAxisBasic.Stop         := gAx_SlaveBasic.In.Stop;
	iFb_MpAxisBasic.JogPositive  := gAx_SlaveBasic.In.JogPositive;
	iFb_MpAxisBasic.JogNegative  := gAx_SlaveBasic.In.JogNegative;
	iFb_MpAxisBasic.Autotune     := gAx_SlaveBasic.In.Autotune;
	iFb_MpAxisBasic.Simulate     := gAx_SlaveBasic.In.Simulate;
	iFb_MpAxisBasic.TorqueLimit  := gAx_SlaveBasic.In.TorqueLimit;
	iFb_MpAxisBasic.ReleaseBrake := gAx_SlaveBasic.In.ReleaseBrake;

	//Slave Axis Basic Output
	gAx_SlaveBasic.Out.Active         := iFb_MpAxisBasic.Active;
	gAx_SlaveBasic.Out.Error          := iFb_MpAxisBasic.Error;
	gAx_SlaveBasic.Out.StatusID       := iFb_MpAxisBasic.StatusID;
	gAx_SlaveBasic.Out.UpdateDone     := iFb_MpAxisBasic.UpdateDone;
	gAx_SlaveBasic.Out.Position       := iFb_MpAxisBasic.Position;
	gAx_SlaveBasic.Out.Velocity       := iFb_MpAxisBasic.Velocity;
	gAx_SlaveBasic.Out.CommandBusy    := iFb_MpAxisBasic.CommandBusy;
	gAx_SlaveBasic.Out.CommandAborted := iFb_MpAxisBasic.CommandAborted;
	gAx_SlaveBasic.Out.PowerOn        := iFb_MpAxisBasic.PowerOn;
	gAx_SlaveBasic.Out.IsHomed        := iFb_MpAxisBasic.IsHomed;
	gAx_SlaveBasic.Out.InVelocity     := iFb_MpAxisBasic.InVelocity;
	gAx_SlaveBasic.Out.InPosition     := iFb_MpAxisBasic.InPosition;
	gAx_SlaveBasic.Out.MoveActive     := iFb_MpAxisBasic.MoveActive;
	gAx_SlaveBasic.Out.Stopped        := iFb_MpAxisBasic.Stopped;
	gAx_SlaveBasic.Out.TuningDone     := iFb_MpAxisBasic.TuningDone;
	gAx_SlaveBasic.Out.Simulation     := iFb_MpAxisBasic.Simulation;
	gAx_SlaveBasic.Out.TorqueLimited  := iFb_MpAxisBasic.TorqueLimited;
	gAx_SlaveBasic.Out.BrakeReleased  := iFb_MpAxisBasic.BrakeReleased;
	gAx_SlaveBasic.Out.Info           := iFb_MpAxisBasic.Info;

END_ACTION
