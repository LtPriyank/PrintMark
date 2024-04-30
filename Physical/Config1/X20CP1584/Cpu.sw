<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio FileVersion="4.9"?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="BeltCtrl" Source="SOURCE.BeltCtrl.BeltCtrl.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="CutterCtr1" Source="SOURCE.CutterCtrl.CutterCtrl.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2" />
  <TaskClass Name="Cyclic#3" />
  <TaskClass Name="Cyclic#4" />
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8" />
  <DataObjects>
    <DataObject Name="Acp10sys" Source="" Memory="UserROM" Language="Binary" />
  </DataObjects>
  <NcDataObjects>
    <NcDataObject Name="acp10etxen" Source="acp10etxen.dob" Memory="UserROM" Language="Ett" />
    <NcDataObject Name="gBeltAxisa" Source="gBeltAxisobj.gBeltAxisa.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="gBeltAxisi" Source="gBeltAxisobj.gBeltAxisi.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="gCutAxisa" Source="gCutAxisobj.gCutAxisa.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="gCutAxisi" Source="gCutAxisobj.gCutAxisi.dob" Memory="UserROM" Language="Ax" />
  </NcDataObjects>
  <Binaries>
    <BinaryObject Name="FWRules" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="TCData" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="udbdef" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="acp10cfg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Acp10map" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="ashwac" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="User" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Role" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="Acp10man" Source="Libraries.Acp10man.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10par" Source="Libraries.Acp10par.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="NcGlobal" Source="Libraries.NcGlobal.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10_MC" Source="Libraries.Acp10_MC.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="Libraries.sys_lib.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="brsystem" Source="Libraries.brsystem.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="runtime" Source="Libraries.runtime.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="MpPackML" Source="Libraries.MpPackML.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpBase" Source="Libraries.MpBase.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astime" Source="Libraries.astime.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="MpAxis" Source="Libraries.MpAxis.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpCom" Source="Libraries.MpCom.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="fileio" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="powerlnk" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>