{ --------------------------------------------------------------------------------------------------
  Ebene 2 (Sam-Interface)
  --------------------------------------------------------------------------------------------------
  von TModules abgeleitetes Objekt, das die Maschinenfunktionen der SAMPLER.DLL verwendet
  --------------------------------------------------------------------------------------------------
  Datum    op  function/procedure     �nderung / Neuerung
  -------- --  -------------------    -------------------------------------------------------------
  26.05.00 wl                         neue unit
  31.05.00 wl  InitSamModuleWithDLL   tut das gleiche wie vorher InitSamGlobals
  31.05.00 wl  TVortexer              aus SerObj hierher (wegen Sampler.dll-Befehlen)
  31.05.00 wl  TActionModules         enth�lt alle Befehle aus TModules, die Sampler.dll oder Relay-Boards ansprechen
  31.05.00 wl  ResetAllModules        aus SamCmd
  07.06.00 wl  Turn6WayValve          wenn es den Port nicht gibt -> GlobalErrPtr setzen -> raus
  20.06.00 wl  TActionModules         neu: alle Balance-Funktionen; Balance-Objekt Teil von gModules
  04.07.00 wl  TActionModules.BalancesInit  Fehler beseitigt
  04.07.00 wl  TActionModules.BalancesInit  Logtext erscheint nicht mehr
  10.07.00 wl  Turn6WayValve          benutzt neue Funktion Find_ByType
  12.07.00 wl  Add6WayValve,Read6WayValve  alle 6-Wege-Ventil-Funktionen hier, damit der Sampler nicht mehr blockiert wird
  14.07.00 wl  SwitchOn,SwitchOff     vor jedem Conrad-/Compulab-Schalten wird ein Execute ausgef�hrt!
  14.07.00 wl  Vortexer- und Thermostat-Methoden   aus ObjModul hierher
  17.07.00 wl  TVortexer              --> SerObj (wider zur�ck)
  17.07.00 wl  FVarRediMotor          neu: aus TTip entfernt und hierher verschoben
  17.07.00 wl  VolMotorInit,VolMotorSetVolume  neue Redi-Motor-Funktionen
  17.07.00 wl  InitSamModuleWithDLL   gmArchiveFiles und gmMoveErrorFile werden nur hier ausgef�hrt
  17.07.00 wl  WriteLogText           Schreibt alle geladenen Module in die Error.dat
  26.07.00 wl  CreateComModules       ReadDeviceIniFile --> ObjModul
  02.08.00 wl  CreateComModules       2 gravierende Fehler bei VarRedi und Tango beseitigt
  02.08.00 wl  CheckTemperature       komplett renoviert mit ordentlicher Fehlermeldung
  02.08.00 wl  Set-,GetTemperatue     arbeiten mit single statt integer
  03.08.00 wl  CheckTemperature       �NDERUNG: wenn ReqTime=0, wird jetzt keine Temperatur gesetzt, sondern sofort abgefragt
  (wenn ReqTime=0, wurde FR�HER die Zeit automatisch auf 1 Stunde gesetzt)
  10.08.00 wl  GetTemperatue          Ergebnis wird im LogDisplay ausgegeben
  14.08.00 mo  InitSamModuleWithDLL   DLLVersionPtr ist jetzt PChar
  31.08.00 wl  GetTemperature         Ist-Wert wird auf Display (TLabel) ausgegeben
  31.08.00 wl  ShakerSetSpeed         Soll-Wert wird auf Display (TLabel) ausgegeben
  06.09.00 wl  ResetExternModules     Vortexer-Anzeige wird zur�ckgesetzt
  21.09.00 tbh CheckTemperature       Methode setzt keine Temperatur mehr
  21.09.00 tbh CheckTemperature       Eintrag in Log-File korrigiert LowTemp<->HighTemp
  27.10.00 tbh CheckTemperature       Abfrage nur wenn kein Simulationsmodus aktiv
  30.10.00 tbh Add6WayValve           property Timeout f�r 6Wege-Ventil setzen
  06.11.00 tbh ReadTTLIn              neu: Funktion zum Auslesen von TTL-Eing�ngen (von Rosys-Relayboard)
  08.11.00 tbh ReadTTLIn              abzufragenden Port richtig eingetragen
  19.12.00 mo  BalanceOpenDoor        Simulationsmodus erm�glicht
  22.12.00 tbh BalanceOpenDoor        Abfragezeit und Anzahl �ber Ini einstellbar (DoorRequestDelay/DoorNoOfRequests)
  13.03.01 tbh TangoAvailable         neu: pr�ft ob Zugriff auf Tango m�glich ist
  13.03.01 tbh VortexerAvailable      neu: pr�ft ob Zugriff auf Vortexer m�glich ist
  13.03.01 tbh ShakerGetSpeed         neu: liest Vortexergeschwindigkeit aus
  13.03.01 tbh diverse                Abfrage der Verf�gbarkeit von Thermostaten und Vortexern eingebaut
  30.03.01 tbh ShakerGetSpeed         schreibt Speed auch in VortexerAbfrageArray (FDisplayList)
  30.03.01 tbh GetTemperature         schreibt Temperatur auch in VortexerAbfrageArray (FDisplayList)
  11.05.01 tbh ShakerSetSpeed         Soll-Wert wird wieder auf Display (TLabel) ausgegeben (in blau)
  14.05.01 tbh ShakerFixation         Wurde Abfragethread unterbrochen wird nochmal die Schnittstelle ausgelesen
  01.06.01 tbh diverse                um IKA Vortexer erweitert (ShakerGetSpeed, ShakerSetSpeed, Init usw.)
  05.07.01 tbh Add6WayValve           SleepTime, ResetBeforeTurn werden aus Sampler.ini eingelesen
  05.07.01 tbh Add6WayValve           Timeout jetzt in Sekunden (statt Millisekunden)
  05.07.01 tbh ResetExternModules     6-Wege-Ventil wird initialisiert, Schleifen zusammengefasst
  16.08.01 mo  Add6WayValve           TN1012 ResetBeforeTurn wieder entfernt
  27.08.01 mo  Add6WayValve           TN1012.1 Neuer Parameter RetryCnt
  29.08.01 mo  Add6WayValve           TN1012.1 Timeout default auf 20 sekunden
  06.09.01 tbh ResetExternModules     TN1030 Vortexer stoppen nur noch wenn gNoVortexerStopAtInit=false
  06.09.01 tbh ShutDown               TN1030 Vortexer werden bei Programmende gestoppt wenn gReleaseVortexersAtEnd=true
  17.10.01 mo  InitSamModuleWithDLL   TN1067 entfernt
  21.10.01 mo  TActionModules         TN1002 Neu: FExtTubeBCReader = externer Tube Barcode Leser
  07.11.01 mo  ResetAllModules        TN1085 Alle Ports auf Relais Board 5 werden im reset ausgeschaltet
  26.11.01 mo  Turn6WayValve          TN1109 Auch wenn ein Port >6 �bergeben wird dreht das Ventil nur bis Port 6
  28.11.01 tbh GetLastMotorStep       TN1051 neu: Funktion liefert den zuletzt verwendeten Schritt des VarRediMotors
  28.12.01 tbh VolMotorSetVolume      TN1051 Motor kann direkt auf Stepwert gesetzt werden
  03.01.02 tbh GetBalanceName         TN1051 neu: ermittelt Name der angeschlossenen Waage
  16.01.02 tbh VolMotorSetVolume      TN1141 keine Log des Volumens wenn Step direkt gesetzt wird
  20.02.02 mo  ResetExternModules     TN1149 6 WayValve wird nicht mehr automatisch resettet
  05.03.02 mo  ResetAllModules        TN1079.1 Reset f�r BCReader Turntable
  13.04.02 mo                         TN1067 Anpassungen f�r SIAS
  13.04.02 mo  BalancesInit           TN1067.1 BalanceThreadrunning ersetzt IsBusy
  15.04.02 mo  BalanceStartWeight     TN1067.1 Abfrage auf Balance[].Door entfernt
  24.06.02 tbh TangoAvailable         TN1208 Aufruf von SamErrorBox angepasst
  24.06.02 tbh CheckTemperature       TN1208 Aufruf von SamErrorBox angepasst
  24.06.02 tbh VortexerAvailable      TN1208 Aufruf von SamErrorBox angepasst
  15.07.02 mo  Add6WayValve           TN1109 In Sampler.ini kann unter [6WayValve] jetzt ComPort= anstatt COMMPORT= benuzt werden
  16.07.02 mo  Add6WayValve           TN1109 Umbenannt in AddSystemLiquidValve
  18.07.02 mo  Turn6WayValve          TN1109 Umbenannt in TurnSystemLiquidValve
  18.07.02 mo  TurnSystemLiquidValve  TN1109 Relais Ventil wird geschaltet
  19.07.02 tbh Shutdown               TN1109 beim Verlassen der Software werden alle Ports abgeschaltet
  19.07.02 tbh AddSystemLiquidValve   TN1109 Name SystemLiquidValve wird aus Konstante gelesen
  06.08.02 tbh SwitchOn/SwitchOff     TN1113 schaltet Relay-Boards gem�� Device.ini-Einstellungen
  10.10.02 wl                               TN1293.2 Ini Access - uses ge�ndert
  23.10.02 wl  AddSystemLiquidValve   TN1293.1 verwendet TWinlissyIniAccess
  01.11.02 tbh BalanceDoTara          TN1302 Aufruf von FBalance.Tara angepasst
  06.11.02 tbh GetBalanceName         TN1299 pr�ft ob Waage �berhaupt vorhanden
  13.11.02 tbh BalanceOpenDoor        TN1340 wenn keine Waage da ist: Abbruch der Funktion
  12.12.02 wl  ShutDown               TN1345 neu: Entladen von DLL's (aus SamStart)
  12.12.02 wl  CreateRobotModules     TN1345  (aus ObjModul) vor�bergehend deaktiviert!
  12.12.02 wl  SetSimulationMode      TN1345   aus ObjModul
  12.12.02 wl  ResetAllModules        TN1345  teilweise --> TRobiticInterface.ResetModules
  27.12.02 wl                         TN1293.5 uses und WinlissyIniAccess ge�ndert
  27.12.02 wl                         TN1293.5 uses Device: TDevice statt TDevicePart
  28.01.03 wl  FOmniValve,FBalance,FRelayValve  TN1345 --> ActiveDevice.pas
  28.01.03 wl  SetSimulationMode      TN1345 individuell f�r jedes Device
  28.01.03 wl  CreateRobotModules     TN1345 wieder aktiviert!
  28.01.03 wl  CreateLeafDevice       TN1345 Index -1 statt 0
  04.03.03 wl                         TN1345 ifdefs f�r SIAS entfernt
  10.03.03 mo  ShutDown               TN1348 Balance wird freigegeben
  07.04.03 wl                         TN1345 Anpassung an TVortReqThread
  13.06.03 wl  AddBCReaders           TN1501.1 die Shapes f�r alle Reader werden erzeugt
  13.06.03 wl  BCReaderSetBounds      TN1501.1 die Shapes f�r alle Reader werden neu gesetzt
  13.06.03 wl  CreateBCReaders        TN1501.1 Die settings werden ausgelesen und BCReader-Devices erzeugt
  13.06.03 wl  ReadBarcodeTube, ...   TN1501.1 alle BC-Reader-Methoden hierher verschoben
  18.06.03 wl  CreateBCReaders        TN1501.1 Name wird bei 2D reader ge�ndert
  03.07.03 wl                         TN1501.1 Device-Struktur komplett �berarbeitet
  04.07.03 wl                         TN1501.2 �nderungen f�r Decapper-Device
  08.07.03 wl                         TN1501.1 Umstellung BCReader: Barcodestr entfernt
  08.07.03 wl                         TN1536   Umstellung CommunicationManager
  14.07.03 wl  SetSimulationMode      TN1535.1 entfernt: wird in Communication bestimmt
  16.07.03 wl  TubeBCREaderExists     TN1501.7 --> TubeHandling
  16.07.03 wl  ReadBarcodeTube        TN1501.1 --> TubeHandling
  21.07.03 wl  CreateBCReaders        TN1501.1 Korrektur beim Auslesen von RackReader
  24.07.03 wl  ResetDecappers         TN1501.2 neu: alle Decapper werden in Default-Zustand gesetzt
  24.07.03 wl  ResetAllModules        TN1501.2 inclusive ResetDecappers
  24.07.03 wl  CreateBalance          TN1536   einige Balance-Werte werden hier eingelesen
  28.07.03 wl  CreateRobotModules     TN1536   OnValue/OffValue werden gesetzt
  29.07.03 wl  ReadTTLIn              TN1501.3 --> TRoboticInterfaceZP01.Sensor_Read
  30.07.03 wl  CreateRobotModules     TN1536   TSwitchDevice statt TZP01SwitchDevice
  03.08.03 wl  Vortexer-Methoden      TN1536   m�glichst viel Funktionalit�t -> TShakerDevice
  03.08.03 wl  Thermostat-Methoden    TN1536   m�glichst viel Funktionalit�t -> TThermoDevice
  04.08.03 wl  CreateBalance          TN1501.10  erzeugt jetzt auch ein WeighingDevice
  25.08.03 wl  Balance-Methoden       TN1556   alle Balance-Methoden entfernt
  03.09.03 wl  FindTubeReadingDevice  TN1568   f�r Editor hierher verschoben
  03.09.03 wl  CreateBCReaders        TN1570   CodeFilter wird an Device und nicht an Interface �bergeben
  04.09.03 wl  CreateBCReaders        TN1570   RackCodeFilter wird aus 'MTP_BCR_CodeFilter' gelesen
  15.09.03 pk  CreateBalance          TN1556   Creates a Balance Device Object using the BalanceDeviceFactory
  22.09.03 pk  gmBalanceAskTara       TN1593   Removed.  Was not used by any unit.
  01.10.03 pk  ResetAllModules        TN1608   Do not call ResetDecappers --> Moved to ThrdMan.InitAll function
  01.10.03 wl  CreateComModules       TN1536   Anpassung an TIntfVarRedi
  15.10.03 wl  CreateRobotModules     TN1624   erzeugt jetzt auch TPipPumpDevice
  19.11.03 wl  CreateBCReaders        TN1668.1 TTurnTableMotor statt TTurnTableMotor_1
  28.11.03 wl  ResetDecappers         TN1665   Sucht in der Posinfo.db nach Eintr�gen f�r Cap-Positions und l�scht sie
  04.12.03 wl  ResetDecappers         TN1665   Suche in Posinfo abgeschaltet, wenn kein Layout geladen ist
  10.12.03 wl  CreateRobotModules     TN1672   erzeugt gPipArm und gGrpArm und ordnet ihnen die Motoren zu
  19.12.03 wl  CreateRobotModules     TN1672   PipMotor VY als k�nstliches Konstrukt f�r ZP01
  20.01.04 wl  CreateRobotModules     TN1672   VYPipMotor-Konstrukt wieder entfernt
  21.01.04 wl  CreateRobotModules     TN1672   die jeweils anderen Arme werden als CombinedArm oder ConcurrentArm �bergeben
  12.02.04 pk  ResetModules           TN1744   New functionality from ThrdMan.InitAll
  19.02.04 pk  ShutDown               TN1753   Calls gCommManager.ShutDown instead of .Free. Other functionality moved to SamStart
  23.02.04 pk                         TN1753   New: StartupBalanceDisplay, ShutDownBalanceDisplay
  25.02.04 pk  CreateBCReaders        TN1753   If reusing Tube barcode reader then give false for new parameter of TRackReadingDevice.Create
  27.02.04 pk  ResetError             TN1744.2 Do not reset CatShakers
  12.03.04 pk  ResetRediPump          TN1809   SwitchOff the redipump
  17.03.04 pk  ResetError             TN1826   Global error reset before reset-functions are called
  02.04.04 wl  CreateRobotModules     TN1788   TPipPumpDevice wird mit TipIndex erzeugt
  02.04.04 wl  CreateTipManager       TN1788   wird mit echten Arm-Devices erzeugt
  08.06.04 wl  CreateRobotModules     TN1963   gTipManager wird immer vor den ArmDevices erzeugt
  08.06.04 wl  CreateRobotModules     TN1963   gGrpArm wird nur erzeugt, wenn auch Handler-Motoren definiert sind
  08.06.04 wl  AddGripperArm          TN1963    neu: Erzeugen von GripperArmDevice
  15.06.04 wl  CreateBCReaders        TN1963   statt TTurntableMotor wird TBCTurntableDevice erzeugt
  21.06.04 wl  AddGripperArm          TN1963   wenn gGrpArm nicht existiert, wird es hier gesetzt
  28.06.04 pk                         TN2009.7 Init functions from Thread units
  29.06.04 pk                         TN2009.8 Moved into Action unit because Layouter would not compile
  29.07.04 pk  ResetError             TN2043   gmBringBackTools show dialog
  30.09.04 wl  CreateSystemDevices    TN2157.1 erzeugt Devices f�r UserProtection und StateSignal
  25.10.04 wl  CreateRobotModules     TN2191   Einlesen von 'Carrier_Crash_Avoidance' -> DevicesXBasedMotorSystem
  14.01.05 pk  ResetError             TN2281.2 Call SetGlobalErrTemporary instead of SetGlobalErr
  16.02.05 wl  AddSystemLiquidValve   TN2269   --> ObjModul
  16.02.05 wl  ShutDown               TN2269   unn�tig, entfernt
  16.02.05 wl  XWayValveCheck         TN2269   an ge�ndertes TXWayValveDevice angepasst
  23.03.05 pk  CreateMTPReader        TN2360   Some code from CreateBCReaders. New code for using other devices as MTP BCReader
  23.03.05 pk  SetXConflictResolve    TN2358.0 Set the XConflictResolveMode for all arms
  03.06.05 wl  StirrerStop            TN2436   --> RoboticInterface
  03.06.05 wl  CreateRobotModules     TN2436   komplett �berarbeitet: 2. Pipettierarm ist m�glich!
  15.06.05 pk  CreateRobotModules     TN2464   use DistX_Pip2_Tip1 for Arm2
  21.06.05 pk  fConflictManager       TN2464.3 New
  21.06.05 pk  CreateRobotModules     TN2464.3 Create ConflictManager and assign events
  30.06.05 wl  CreateRobotModules     TN2483   Assigned-Abfrage auf PipArm 1 eingebaut - sonst m�glicher Programmabsturz
  05.07.05 pk  CreateBCReaders        TN2489   use  IniReadBCRPosition to read barcode reader positions from init
  11.07.05 wl  CreateBCReaders        TN2498.1 Parameter: string statt TFuncParam
  03.08.05 pk  CreateComModules       TN2308   pass simulated as argument to TIntfVarRedi.Create
  23.09.05 wl  div. Methoden          TN2624   Bit wird jetzt immer als String gelesen
  14.10.05 wl  Set/GetTemperatur      TN2670   benutzt jetzt alle Thermostate (z.B.CANBus)
  17.11.05 wl  ReadBarcodeRack        TN2771   benutzt TRackBCReadingOperation
  17.11.05 wl  FindGripperArmName     TN2771   sucht GripperArm nach dem Namen
  05.12.05 wl  CreateRobotModules     TN2816   benutzt TDevice.GetGripper/PipetteArmName
  22.12.05 pk  FindUserProtection     TN2875   New
  22.12.05 pk  CreateSystemDevices    TN2875   made more compatible to device hierarchy
  05.01.06 pk                         TN2877   find arm functions (eg. FindArmNames, FindFirstArmByArmClass, etc)
  23.02.06 thr AddLeafDevice          TN2941   A Leafdevice now has a carriername
  08.03.06 thr StartupBalanceDisplay  TN2941   Starts all Balances
  25.08.06 thr                        TN3264   TShakerext durch TSpeedshaker ersetzt
  28.08.06 thr Vortexermethoden       TN3264   Aufruf von thrman
  01.09.06 pk  VortexerStop           TN3277   Stop the canbus heaters
  07.09.06 pk  VortexerStop           TN3291   Code removed because canbus heaters are already reset in self.reset and self.resetexcluding
  05.07.06 wl  VolMotorSetVolume      TN3119.2  an �nderungen von TIntfVarRedi angepasst
  26.09.06 wl  VolMotorInit           TN3326   Min/MaxVolume double statt integer
  10.10.06 thr                        TN3351   Unit Vortinfo entfernt
  23.10.06 pk  CreateBCReaders        TN3373   Find the ExecGroup of the Rotation motor and assign it to Turntable
  18.10.06 wl  VolMotorSetVolume      TN3362    VarixMotorSteps ist var, wird auf den wirklich eingestellten Wert gesetzt
  03.12.06 wl                         TN3243   alle ErrBox-Aufrufe durch ErrBoxSimple oder ErrBoxSerialIntf ersetzt
  07.12.06 wl                         TN3243    uses SamCmd entfernt
  21.12.06 wl  CheckTemperature       TN3494    cieCheckActionTimeout statt cieUndefined
  03.01.07 pk  CreateSystemDevices    TN3479    Call TStateSignalDevice.CreateOldStyle
  18.01.07 wl  CheckTemperature,..    TN3507    alle Vortexer-Funktionen entfernt
  19.01.07 pk  ReadBarcodeRack        TN3511    use aRackMovable as paramter to create function to avoid access violation when arm=nil
  22.02.07 pk  Destroy                TN3583    fConflictManager.Free
  02.03.07 pk                         TN3613    RediMotor function called using TVarRediMotorDevice
  06.03.07 wl  ResetModules           TN3620    entfernt: StirrerStop
  07.03.07 wl  ResetModules           TN3620    gCommManager.Robot_ResetModules statt Robot.ResetModules
  07.03.07 wl                         TN3620    gmModuleAdressExists statt Robot.ModuleExist
  12.11.07 pk                         TN3864    all references to DeviceList commented out for now
  07.01.08 pk  ConnectModules         TN3864    New: Calls Connect for each module
  31.01.08 wl  VortexerStop           TN4003    gNoVortexerStopAtInit auskommentiert (evtl. nicht mehr n�tig)
  07.02.08 wl  VortexerInit           TN4009    neu in Init-Routine (war vorher irgendwo anders)
  07.02.08 wl  VortexerStop           TN4009    wieder aktiviert
  07.02.08 wl  ResetExternModules     TN4009    mit ResetModules vereinigt
  07.02.08 wl  Connect/DisconnectModules  TN4009     statt einzelner Fehler wird eine Fehlerliste erzeugt
  18.02.08 wl  CreateMTPReader            TN4009     noch mehr auskommentiert
  17.03.08 wl                             TN4043     uses IntfMixerDevice
  18.04.08 pk  RelayInit, RelayReset      TN3864     New
  22.04.08 pk                             TN4080     use ITubeBCReaderDevice, IRackBCReaderDevice
  25.04.08 wl  ResetModules               TN4051     gmAllArmsExecute entfernt (hatte keine Auswirkung)
  03.06.08 pk AssignMultiYMotorDeviceEvents TN4133   New
  05.06.08 pk                               TN4139   WB changed to TLayoutManager.Instance.CurrentLayout
  03.07.08 wl                                         TN4157
  11.07.08 wl                               TN4164   TActionModules wird nicht mehr von TModules abgeleitet, hat nur noch Klassenfunktionen
  11.07.08 wl  Init und Reset-Funktionen    TN4164   von ObjModul hierher
  17.07.08 hd  ResetModules                  TN4163     gmAllArmsInitMotorsWithID now called with the fInitID argument
  17.07.08 pk  ResetError                    TN4163     InitializeInitID method executed at the beginning
  02.09.08 pk                                TN4215     Init moved here from Action.pas
  19.09.08 pk  ResetError                    TN4215     Now with exception handling
  20.09.08 pk  InitExtended                  TN4215     call gmInitTipStatus_AllArms (was called in dilutionmanager.create)
  25.09.08 pk                                TN3985     just log, don't show messagebox - causes thread deadlock
  17.11.08 pk  ResetError                    TN4280     Calls BringBackToolsAtReset instead of BringBackTools
  19.11.08 pk  InitExtended                  TN4280     ConflictResolveMode set to xcMoveAwayCheckID
  12.12.08 wl  ResetLiqError                 TN4363    entfernt
  17.12.08 pk  ConnectModules                TN4372    from ObjModul
  06.01.09 pk  ConnectModulesIntern,...      TN4372    New. Called in context of other thread
  16.01.09 pk  TActionModuleCommunicationMes TN4372    now pass current thread ID as ContractorThreadID
  04.03.09 pk  DisconnectModulesIntern       TN4453     Dont show messagebox.  Causes software to hang
  08.04.09 pk  RelayReset                    TN4514    Call Trigger.Reset
  09.04.09 pk  RelayReset/Init               TN4514    SearchIndex set to 0 before loop for triggers
  14.04.09 pk  ConnectDevice                 TN4523    New
  16.06.09 wl  Connect-/DisconnectModulesSimple  TN4609    statt Connect-/DisconnectModulesIntern: ist jetzt public
  10.08.09 wl                                TN4702   Strings werden jetzt direkt geladen
  28.08.09 pk  SetOnCheckSimulated           TN4753   from ObjModul
  08.09.09 pk                                TN4753   uses ErrorMessage replaced by ErrorInfo
  19.10.09 pk  ResetDecappers                TN4826   check IsCurrentLayoutEmpty to avoid exception
  04.11.09 pk                                TN4843   Replace TObjectList, TStringList, TStrings with Generics Lists and TStringArray
  16.02.09 ts  VortexerInit                  TN4986   xSearchModul wieder auf 0 bevor Shaker gesucht werden
  17.02.10 ts  VortexerStopp                 TN4986   xSearchModul wieder auf 0 bevor Shaker gesucht werden
  17.02.10 ts  Vortexer-/RelayInit           TN4986   globalInitID wird genutzt statt eigene InitID zu erzeugen, Vermeidung doppelter Initialisierung (Bsp: CAT-Vortexer und FixationDriver - gleiche Connection)
  18.02.10 pk  Connect/DisconnectModules     TN4985.1 Now possible with callback instead of waiting
  30.06.10 pk  BCReaderInit                  TN5000   New. called in ResetModules
  02.11.10 pk  InitConnections               TN5325   New
  15.11.10 pk                                TN5340   Changes to prevent memory leak
  16.11.10 wl  InitBasic                     TN5351   von ActionLow hierher
  19.11.10 wl  Activate-,DeactivateModules   TN5358  neu
  04.04.11 wl  AssignMultiYMotorDeviceEvents TN5525   Zuordnung nur noch, wenn GripperMotor(ID) = VMotor(ID)
  25.06.12 wl                                TN5899   uses ge�ndert
  27.02.13 wl                                TN6066   an ArmConflictManager angepasst
  10.04.13 wl                                TN6045   uses ge�ndert
  26.07.13 ts  TActionModules.ResetError     TN6207   GlobalErr kann auch w�hrend Reset gesetzt werden (im Fehler), muss zur�ckgesetzt werden
  15.08.13 wl                                TN6223   uses ge�ndert
  20.08.13 wl                                TN6231   an �nderungen in ToolHandling angepasst
  21.08.13 wl  alle Init- und Reset-Methoden TN6231   --> DeviceInitHandling
  -------------------------------------------------------------------------------------------------- }

unit ObjModulA;


interface


uses
    IntfDevice,
    ThrdMan;

type
    TActionModuleCommunicationFinishedEvent = procedure(const aErrors: TArray<string>) of object;

    TActionModuleCommunicationMessageInfo = class(TModuleCommunicationGeneralMessageInfo)
    protected
        fOnFinished: TActionModuleCommunicationFinishedEvent;
    public
        constructor Create();
        procedure Finished(const aErrors: TArray<string>);
        property OnFinished: TActionModuleCommunicationFinishedEvent read fOnFinished write fOnFinished;
    end;

    TModuleCommunicationConnectMessageInfo = class(TActionModuleCommunicationMessageInfo);
    TModuleCommunicationDisconnectMessageInfo = class(TActionModuleCommunicationMessageInfo);

    TActionModules = class
    private
        class procedure AssignMultiYMotorDeviceEvents;
        class procedure SafeModuleCommunication(const aMessage: TModuleCommunicationGeneralMessageInfo);
        class function FindAllConnectionsForDevice(const aDevice: IDevice): TArray<string>;
        class function DoOnCheckSimulated(aSender: TObject): boolean;
        class procedure SetOnCheckSimulated;
        class procedure ConnectModulesWithMessage(const aMessage: TModuleCommunicationConnectMessageInfo);
        class procedure DisconnectModulesWithMessage(const aMessage
            : TModuleCommunicationDisconnectMessageInfo);
        class function ConnectModulesSimple(): TArray<string>;
        class function DisconnectModulesSimple(): TArray<string>;
    public
        class procedure CreateEvents();

        class procedure ConnectModules(); overload;
        class procedure ConnectModules(const aOnFinished: TActionModuleCommunicationFinishedEvent); overload;
        class procedure ConnectDevice(const aDevice: IDevice);

        class procedure DisconnectModules(); overload;
        class procedure DisconnectModules(const aOnFinished
            : TActionModuleCommunicationFinishedEvent); overload;

        // bei Unterbrechungen:
        class function ActivateModules(): TArray<string>;
        class function DeactivateModules(): TArray<string>;
    end;


implementation


uses
    SysUtils,
    Generics.Collections,
    RunFlow,
    GUIManager,
    ObjModul,
    Driver,
    DriverManager,
    Connection,
    ConnectionManager,
    ThreadAPI,
    IntfArmDevice,
    IntfMotorBasedMotionDevice,
    DeviceManager;

{ TActionModuleCommunicationMessageInfo }

constructor TActionModuleCommunicationMessageInfo.Create();
begin
    inherited Create(TActionModules.SafeModuleCommunication, TThreadAPI.GetCurrentThreadID());

end;

procedure TActionModuleCommunicationMessageInfo.Finished(const aErrors: TArray<string>);
begin
    if not Assigned(fOnFinished) then
        EXIT;
    fOnFinished(aErrors);
end;

{ TActionModules }

class procedure TActionModules.CreateEvents();
begin
    AssignMultiYMotorDeviceEvents();
    SetOnCheckSimulated();
end;

class function TActionModules.DoOnCheckSimulated(aSender: TObject): boolean;
begin
    result := TRunFlow.Instance.SimulationMode;
end;

class procedure TActionModules.SetOnCheckSimulated();
var
    xIndex: integer;
    xIntf: IConnection;
begin
    xIndex := 0;
    while true do
    begin
        if not gConnectionManager.FindModuleExt(IConnection, xIndex, xIntf) then
            EXIT;
        xIntf.OnCheckSimulated := DoOnCheckSimulated;
    end;
end;

class procedure TActionModules.AssignMultiYMotorDeviceEvents();
var
    xArmArray: TArray<IArmDevice>;
    xIndex1, xIndex2: integer;
    xMotorMotionDevice: IMotorBasedMotionDevice;
    xVMotorID: integer;
begin
    // Spezialfall, der bisher nur f�r ZP01 ben�tigt wird: Ist der Gripper-Motor des Arms oder eines
    // kombinierten Arms identisch mit dem Varispan-Motor?

    xArmArray := gDeviceManager.FindModules<IArmDevice>;

    for xIndex1 := 0 to high(xArmArray) do
    begin

        // herausfinden, ob es einen V-Motor gibt
        if not Supports(xArmArray[xIndex1].MotionDevice, IMotorBasedMotionDevice, xMotorMotionDevice) then
            CONTINUE;
        if not Assigned(xMotorMotionDevice.YMotors) then
            CONTINUE;
        if not Assigned(xMotorMotionDevice.YMotors.VMotor) then
            CONTINUE;
        xVMotorID := xMotorMotionDevice.YMotors.VMotor.MotorID;

        // Herausfinden, ob der Gripper-Motor die gleiche MotorID hat
        if Assigned(xArmArray[xIndex1].GripDevice) and xArmArray[xIndex1]
            .GripDevice.HasGripperMotorWithThisMotorID(xVMotorID) then
        begin
            xMotorMotionDevice.YMotors.OnMultiYMoveAllowed := xArmArray[xIndex1].GripDevice.IsGripMoveAllowed;
            CONTINUE;
        end;

        // Kombinierten Arm finden, der einen Gripper mit der gleichen ModuleID hat
        for xIndex2 := 0 to high(xArmArray) do
        begin
            if (xIndex2 = xIndex1) then
                CONTINUE;

            if Assigned(xArmArray[xIndex2].GripDevice) and
                xArmArray[xIndex2].GripDevice.HasGripperMotorWithThisMotorID(xVMotorID) then
            begin
                xMotorMotionDevice.YMotors.OnMultiYMoveAllowed :=
                    xArmArray[xIndex2].GripDevice.IsGripMoveAllowed;
                BREAK;
            end;
        end;
    end;
end;

class function TActionModules.ConnectModulesSimple(): TArray<string>;
var
    xErrors: TList<string>;
begin
    xErrors := TList<string>.Create;
    try
        gConnectionManager.ConnectModules(xErrors);
        if (xErrors.Count > 0) then
            gGUIManager.MessageBox(TModuleFinder.ErrorText(xErrors), 'Connect Errors', 16);
        result := xErrors.ToArray;
    finally
        xErrors.Free;
    end;
end;

class function TActionModules.DisconnectModulesSimple(): TArray<string>;
var
    xErrors: TList<string>;
begin
    xErrors := TList<string>.Create;
    try
        gConnectionManager.DisconnectModules(xErrors);
        // 04.03.09 pk we really dont need to show a messagebox here.  It can cause app to crash
        // if ( xErrors.Count > 0 ) then
        // MessageHandling.gmSyncMessageBox( xErrors.Text, 'Disconnect Errors', 16 );
        result := xErrors.ToArray;
    finally
        xErrors.Free;
    end;
end;

class procedure TActionModules.SafeModuleCommunication(const aMessage
    : TModuleCommunicationGeneralMessageInfo);
// 06.01.09 pk this function is called in the context of a special thread which stay alive until the application is closed
// for ActiveX/COM the thread that creates COM objects must stay alive, otherwise the COM objects are destroyed
// automatically by windows when the thread is destroyed
var
    xErrors: TArray<string>;
begin
    if aMessage is TModuleCommunicationConnectMessageInfo then
    begin
        xErrors := ConnectModulesSimple();
    end
    else if aMessage is TModuleCommunicationDisconnectMessageInfo then
    begin
        xErrors := DisconnectModulesSimple();
    end;

    if (aMessage is TActionModuleCommunicationMessageInfo) then
        (aMessage as TActionModuleCommunicationMessageInfo).Finished(xErrors);

end;

class procedure TActionModules.ConnectModulesWithMessage(const aMessage
    : TModuleCommunicationConnectMessageInfo);
begin
    ThrMan.RequestSafeModuleCommunication(aMessage);
end;

class procedure TActionModules.ConnectModules(const aOnFinished: TActionModuleCommunicationFinishedEvent);
var
    xMessage: TModuleCommunicationConnectMessageInfo;
begin
    xMessage := TModuleCommunicationConnectMessageInfo.Create();
    xMessage.OnFinished := aOnFinished;
    xMessage.Wait := false;
    ConnectModulesWithMessage(xMessage);
end;

class procedure TActionModules.ConnectModules();
var
    xMessage: TModuleCommunicationConnectMessageInfo;
begin
    xMessage := TModuleCommunicationConnectMessageInfo.Create();
    ConnectModulesWithMessage(xMessage);
end;

class procedure TActionModules.DisconnectModulesWithMessage(const aMessage
    : TModuleCommunicationDisconnectMessageInfo);
begin
    ThrMan.RequestSafeModuleCommunication(aMessage);
end;

class procedure TActionModules.DisconnectModules(const aOnFinished: TActionModuleCommunicationFinishedEvent);
var
    xMessage: TModuleCommunicationDisconnectMessageInfo;
begin
    xMessage := TModuleCommunicationDisconnectMessageInfo.Create();
    xMessage.OnFinished := aOnFinished;
    xMessage.Wait := false;
    DisconnectModulesWithMessage(xMessage);
end;

class procedure TActionModules.DisconnectModules();
var
    xMessage: TModuleCommunicationDisconnectMessageInfo;
begin
    xMessage := TModuleCommunicationDisconnectMessageInfo.Create();
    DisconnectModulesWithMessage(xMessage);
end;

class function TActionModules.FindAllConnectionsForDevice(const aDevice: IDevice): TArray<string>;
var
    xDriverNames: TArray<string>;
    xDriver: IDriver;
    x: integer;
begin
    xDriverNames := gDeviceManager.FindAllDriversForDevice(aDevice);
    for x := 0 to Length(xDriverNames) - 1 do
    begin
        gDriverManager.FindModule(true, xDriverNames[x], IDriver, xDriver);
        result := gDriverManager.FindAllConnectionsForDriver(xDriver);
    end;
end;

class procedure TActionModules.ConnectDevice(const aDevice: IDevice);
var
    xConnectionNames: TArray<string>;
    xConnection: IConnection;
    x: integer;
begin
    xConnectionNames := FindAllConnectionsForDevice(aDevice);
    for x := 0 to Length(xConnectionNames) - 1 do
    begin
        gConnectionManager.FindModule(true, xConnectionNames[x], IConnection, xConnection);
        xConnection.Connect;
    end;
end;

class function TActionModules.ActivateModules(): TArray<string>;
var
    xErrors: TList<string>;
begin
    xErrors := TList<string>.Create;
    try
        gConnectionManager.ActivateModules(xErrors);
        if (xErrors.Count > 0) then
            gGUIManager.MessageBox(TModuleFinder.ErrorText(xErrors), 'Connect Errors', 16);
        result := xErrors.ToArray;
    finally
        xErrors.Free;
    end;
end;

class function TActionModules.DeactivateModules(): TArray<string>;
var
    xErrors: TList<string>;
begin
    xErrors := TList<string>.Create;
    try
        gConnectionManager.DeactivateModules(xErrors);
        if (xErrors.Count > 0) then
            gGUIManager.MessageBox(TModuleFinder.ErrorText(xErrors), 'Connect Errors', 16);
        result := xErrors.ToArray;
    finally
        xErrors.Free;
    end;
end;


end.
