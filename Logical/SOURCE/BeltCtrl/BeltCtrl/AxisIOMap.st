
ACTION AxisIOMap:
	
	//Belt Axis Basic inputs
	iFb_MpAxisBasic.MpLink       := ADR(gMl_BeltAxis);
	iFb_MpAxisBasic.Enable       := TRUE;
	iFb_MpAxisBasic.ErrorReset   := gAx_Master.In.ErrorReset;
	iFb_MpAxisBasic.Parameters   := ADR(gAx_Master.In.Parameters);
	iFb_MpAxisBasic.Update       := gAx_Master.In.Update;
	iFb_MpAxisBasic.Axis         := ADR(gBeltAxis);
	iFb_MpAxisBasic.Power        := gAx_Master.In.Power;
	iFb_MpAxisBasic.Home         := gAx_Master.In.Home;
	iFb_MpAxisBasic.MoveVelocity := gAx_Master.In.MoveVelocity;
	iFb_MpAxisBasic.MoveAbsolute := gAx_Master.In.MoveAbsolute;
	iFb_MpAxisBasic.MoveAdditive := gAx_Master.In.MoveAdditive;
	iFb_MpAxisBasic.Stop         := gAx_Master.In.Stop;
	iFb_MpAxisBasic.JogPositive  := gAx_Master.In.JogPositive;
	iFb_MpAxisBasic.JogNegative  := gAx_Master.In.JogNegative;
	iFb_MpAxisBasic.Autotune     := gAx_Master.In.Autotune;
	iFb_MpAxisBasic.Simulate     := gAx_Master.In.Simulate;
	iFb_MpAxisBasic.TorqueLimit  := gAx_Master.In.TorqueLimit;
	iFb_MpAxisBasic.ReleaseBrake := gAx_Master.In.ReleaseBrake;
	iFb_MpAxisBasic();
    
	//Belt Axis Basic outputs
	gAx_Master.Out.Active         := iFb_MpAxisBasic.Active;
	gAx_Master.Out.Error          := iFb_MpAxisBasic.Error;
	gAx_Master.Out.StatusID       := iFb_MpAxisBasic.StatusID;
	gAx_Master.Out.UpdateDone     := iFb_MpAxisBasic.UpdateDone;
	gAx_Master.Out.Position       := iFb_MpAxisBasic.Position;
	gAx_Master.Out.Velocity       := iFb_MpAxisBasic.Velocity;
	gAx_Master.Out.CommandBusy    := iFb_MpAxisBasic.CommandBusy;
	gAx_Master.Out.CommandAborted := iFb_MpAxisBasic.CommandAborted;
	gAx_Master.Out.PowerOn        := iFb_MpAxisBasic.PowerOn;
	gAx_Master.Out.IsHomed        := iFb_MpAxisBasic.IsHomed;
	gAx_Master.Out.InVelocity     := iFb_MpAxisBasic.InVelocity;
	gAx_Master.Out.InPosition     := iFb_MpAxisBasic.InPosition;
	gAx_Master.Out.MoveActive     := iFb_MpAxisBasic.MoveActive;
	gAx_Master.Out.Stopped        := iFb_MpAxisBasic.Stopped;
	gAx_Master.Out.TuningDone     := iFb_MpAxisBasic.TuningDone;
	gAx_Master.Out.Simulation     := iFb_MpAxisBasic.Simulation;
	gAx_Master.Out.TorqueLimited  := iFb_MpAxisBasic.TorqueLimited;
	gAx_Master.Out.BrakeReleased  := iFb_MpAxisBasic.BrakeReleased;
	gAx_Master.Out.Info           := iFb_MpAxisBasic.Info;
	

END_ACTION
