
ACTION AxisIOMap:
	
	//Belt Axis Basic inputs
	iFb_MpAxisBasic.MpLink       := ADR(gMl_BeltAxis);
	iFb_MpAxisBasic.Enable       := TRUE;
	iFb_MpAxisBasic.ErrorReset   := gAx_BeltConveyor.In.ErrorReset;
	iFb_MpAxisBasic.Parameters   := ADR(gAx_BeltConveyor.In.Parameters);
	iFb_MpAxisBasic.Update       := gAx_BeltConveyor.In.Update;
	iFb_MpAxisBasic.Axis         := ADR(gBeltAxis);
	iFb_MpAxisBasic.Power        := gAx_BeltConveyor.In.Power;
	iFb_MpAxisBasic.Home         := gAx_BeltConveyor.In.Home;
	iFb_MpAxisBasic.MoveVelocity := gAx_BeltConveyor.In.MoveVelocity;
	iFb_MpAxisBasic.MoveAbsolute := gAx_BeltConveyor.In.MoveAbsolute;
	iFb_MpAxisBasic.MoveAdditive := gAx_BeltConveyor.In.MoveAdditive;
	iFb_MpAxisBasic.Stop         := gAx_BeltConveyor.In.Stop;
	iFb_MpAxisBasic.JogPositive  := gAx_BeltConveyor.In.JogPositive;
	iFb_MpAxisBasic.JogNegative  := gAx_BeltConveyor.In.JogNegative;
	iFb_MpAxisBasic.Autotune     := gAx_BeltConveyor.In.Autotune;
	iFb_MpAxisBasic.Simulate     := gAx_BeltConveyor.In.Simulate;
	iFb_MpAxisBasic.TorqueLimit  := gAx_BeltConveyor.In.TorqueLimit;
	iFb_MpAxisBasic.ReleaseBrake := gAx_BeltConveyor.In.ReleaseBrake;
	iFb_MpAxisBasic();
    
	//Belt Axis Basic outputs
	gAx_BeltConveyor.Out.Active         := iFb_MpAxisBasic.Active;
	gAx_BeltConveyor.Out.Error          := iFb_MpAxisBasic.Error;
	gAx_BeltConveyor.Out.StatusID       := iFb_MpAxisBasic.StatusID;
	gAx_BeltConveyor.Out.UpdateDone     := iFb_MpAxisBasic.UpdateDone;
	gAx_BeltConveyor.Out.Position       := iFb_MpAxisBasic.Position;
	gAx_BeltConveyor.Out.Velocity       := iFb_MpAxisBasic.Velocity;
	gAx_BeltConveyor.Out.CommandBusy    := iFb_MpAxisBasic.CommandBusy;
	gAx_BeltConveyor.Out.CommandAborted := iFb_MpAxisBasic.CommandAborted;
	gAx_BeltConveyor.Out.PowerOn        := iFb_MpAxisBasic.PowerOn;
	gAx_BeltConveyor.Out.IsHomed        := iFb_MpAxisBasic.IsHomed;
	gAx_BeltConveyor.Out.InVelocity     := iFb_MpAxisBasic.InVelocity;
	gAx_BeltConveyor.Out.InPosition     := iFb_MpAxisBasic.InPosition;
	gAx_BeltConveyor.Out.MoveActive     := iFb_MpAxisBasic.MoveActive;
	gAx_BeltConveyor.Out.Stopped        := iFb_MpAxisBasic.Stopped;
	gAx_BeltConveyor.Out.TuningDone     := iFb_MpAxisBasic.TuningDone;
	gAx_BeltConveyor.Out.Simulation     := iFb_MpAxisBasic.Simulation;
	gAx_BeltConveyor.Out.TorqueLimited  := iFb_MpAxisBasic.TorqueLimited;
	gAx_BeltConveyor.Out.BrakeReleased  := iFb_MpAxisBasic.BrakeReleased;
	gAx_BeltConveyor.Out.Info           := iFb_MpAxisBasic.Info;
	

END_ACTION
