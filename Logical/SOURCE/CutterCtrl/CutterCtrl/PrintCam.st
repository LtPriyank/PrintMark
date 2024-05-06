
ACTION Printcam: 
	
	gAx_CutterCam.In.Parameters.Configuration.Master := ADR(gMl_BeltAxis); // Not Mplink Axis Address 
	gAx_CutterCam.In.Parameters.Configuration.MasterParID := ACP10PAR_PCTRL_S_ACT;  //ACP10PAR_S_SET_VAX1;
	gAx_CutterCam.In.Parameters.Configuration.MaxMasterVelocity :=  2000; //Maximum velocity of the master axis.
	
	(** STATE 0 Event 1 - 	NOT USED - JUMP TO STATE 1 **) 
	gAx_CutterCam.In.Parameters.Configuration.State[0].Event[0].Type := ncST_END; //Trigger 
	gAx_CutterCam.In.Parameters.Configuration.State[0].Event[0].Attribute := ncAT_ONCE; //Reaction 
	gAx_CutterCam.In.Parameters.Configuration.State[0].Event[0].NextState := 1; //Next State
	
	(** STATE 1 WAIT FOR TRIGGER **) 
	gAx_CutterCam.In.Parameters.Configuration.State[1].CamProfileIndex := 16#FFFE; 
	gAx_CutterCam.In.Parameters.Configuration.State[1].MasterFactor := 325; //Slope 
	gAx_CutterCam.In.Parameters.Configuration.State[1].SlaveFactor := 360; //Slope
	(** STATE 1 WAIT FOR TRIGGER **) 
	gAx_CutterCam.In.Parameters.Configuration.State[1].CompMode := ncONLYCOMP; 
	gAx_CutterCam.In.Parameters.Configuration.State[1].MasterCompDistance := 225; //Master Positive movement
	gAx_CutterCam.In.Parameters.Configuration.State[1].SlaveCompDistance := 1620; //Slave Positive movement
	(** STATE 1 Event 1 - WAIT FOR S_START **) 
	gAx_CutterCam.In.Parameters.Configuration.State[1].Event[0].Type := ncST_END; //Trigger 
	gAx_CutterCam.In.Parameters.Configuration.State[1].Event[0].Attribute := ncST_END; //Reaction 
	gAx_CutterCam.In.Parameters.Configuration.State[1].Event[0].NextState := 2; //Next State

	
	(** STATE 2 Event 1- FORWARD MOVEMENT OF SLAVE **) 
	gAx_CutterCam.In.Parameters.Configuration.State[2].CamProfileIndex := 16#FFFF; 
	gAx_CutterCam.In.Parameters.Configuration.State[2].MasterFactor := 325; //Master Positive movement
	gAx_CutterCam.In.Parameters.Configuration.State[2].SlaveFactor := 360; //Master Positive movement 
	(** STATE 2 Event 1- FORWARD MOVEMENT OF SLAVE **)
	gAx_CutterCam.In.Parameters.Configuration.State[2].Event[0].Type := ncST_END; //Trigger 
	gAx_CutterCam.In.Parameters.Configuration.State[2].Event[0].Attribute := ncST_END; //Reaction 
	gAx_CutterCam.In.Parameters.Configuration.State[2].Event[0].NextState := 3; //Next State
	
	
	(** STATE 3 WAIT FOR TRIGGER **) 
	gAx_CutterCam.In.Parameters.Configuration.State[3].CamProfileIndex := 16#FFFE; 
	gAx_CutterCam.In.Parameters.Configuration.State[3].MasterFactor := 225; //Slope 
	gAx_CutterCam.In.Parameters.Configuration.State[3].SlaveFactor := 1620; //Slope
	(** STATE 3 WAIT FOR TRIGGER **) 
	gAx_CutterCam.In.Parameters.Configuration.State[3].CompMode := ncONLYCOMP; 
	gAx_CutterCam.In.Parameters.Configuration.State[3].MasterCompDistance := 150; //Master Positive movement
	gAx_CutterCam.In.Parameters.Configuration.State[3].SlaveCompDistance := 1620; //Slave Negative movement
	(** STATE 3 Event 1 - WAIT FOR S_START **) 
	gAx_CutterCam.In.Parameters.Configuration.State[3].Event[0].Type := ncST_END; //Trigger 
	gAx_CutterCam.In.Parameters.Configuration.State[3].Event[0].Attribute := ncST_END; //Reaction 
	gAx_CutterCam.In.Parameters.Configuration.State[3].Event[0].NextState := 1; //Next State
	
	
	
	

END_ACTION
