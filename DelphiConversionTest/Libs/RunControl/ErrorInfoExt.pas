{ --------------------------------------------------------------------------------------------------
  Copyright � 2006 Zinsser Analytic GmbH - All rights reserved.
  Author       : Wolfgang Lyncke (wl)
  Description  : Error Handling classes
  --------------------------------------------------------------------------------------------------
  Revision History:
  date     op  method                           track-no  improvement/change
  -------- --  -------------------------------  --------- ----------------------------------------------
  29.11.06 wl                                   TN3243    initial version
  07.12.06 wl  TErrorMessageFactory             TN3243    von SamErr hierher verschoben
  21.12.06 wl  TComInterfaceErrorInfo.FindOutError  TN3494  cieCheckActionTimeout hat Abort,Retry und Ignore-Buttor (wie fr�her)
  06.03.07 wl  TMachineErrorInfo                    TN3620  --> RoboticInterfaceZP01/02
  09.06.09 pk  TSysLiquidIsOutErrorInfo             TN4585.1  --> VolumesInfo
  10.08.09 wl                                       TN4702   Strings werden jetzt direkt geladen
  08.09.09 pk                                       TN4753   uses ErrorMessage replaced by ErrorInfo
  12.10.09 pk                                       TN4812   AdditionalInfo is no longer normal TStringList class
  04.02.10 pk                                       TN4972   Changes for Restart
  20.09.11 wl  TReagentIsOutErrorInfo               TN5723   AspGetNextStep mit Color
  03.11.11 wl  TReagentIsOutErrorInfo               TN5725   AspGetNextStep auskommentiert
  06.02.12 wl  TReagentIsOutErrorInfo.Create        TN5725   kein Retry-Button mehr
  -------------------------------------------------------------------------------------------------- }

unit ErrorInfoExt;


interface


uses
    Classes,
    AppTypes,
    ErrorInfo;

type
    TComInterfaceErrorInfoType = (cieCheckActionTimeout, cieType1, cieType5, cieType7, cieType8);

    TComInterfaceErrorInfo = class(TErrorInfo)
    private
        fErrorCode: TComInterfaceErrorInfoType;
        fComPort: integer;
        fModuleName: string;
        fInfoText: string;
        function FindOutError(out oButtons: TErrorInfoButtons): string;
    protected
        function GetFullInfoText: string; override;
    public
        constructor Create(aErrorCode: TComInterfaceErrorInfoType; aComPort: integer;
            const aModuleName, aInfoText: string); reintroduce;
    end;

    TReagentIsOutErrorInfo = class(TErrorInfo)
    private
        fRackID: string;
        fRackPos: integer;
        function FindOutError(): string;
    public
        constructor Create(const aRackID: string; aRackPos: integer); reintroduce;
    end;


implementation


uses
    SysUtils,
    Controls,
    Forms,
    Variants,
    Windows,
    PosinfoDataAdaptor,
    CommonTypes,
    GeneralTypes,
    UtilLib;

{ TComInterfaceErrorInfo }

constructor TComInterfaceErrorInfo.Create(aErrorCode: TComInterfaceErrorInfoType; aComPort: integer;
    const aModuleName, aInfoText: string);
var
    xCaption, xInfoText: string;
    xButtons: TErrorInfoButtons;
begin

    inherited Create();

    fErrorCode := aErrorCode;
    fComPort := aComPort;
    fModuleName := aModuleName;
    fInfoText := aInfoText;
    xCaption := TLanguageString.Read('Serial Module Error', 'Fehler an seriellen Modul');
    xInfoText := FindOutError(xButtons);

    Init(xInfoText, xCaption, xButtons);
end;

function TComInterfaceErrorInfo.FindOutError(out oButtons: TErrorInfoButtons): string;
begin
    result := '[' + fModuleName + ']:' + fInfoText;

    case fErrorCode of
        cieCheckActionTimeout:
            begin
                AddCauseAndAction(TLanguageString.Read('No access to module', 'Kein Zugriff auf das Ger�t'),
                    TLanguageString.Read('Check timeout settings', '�berpr�fen Sie die Timeout-Einstellung'));
                oButtons := eibAbortRetryIgnore;
            end;

        // Die Logik der Fehlermeldungen ist nicht klar, aber ich lasse es erst mal so

        cieType1:
            begin
                AddCauseAndAction(TLanguageString.Read('No connection with module ',
                    'Keine Verbindung zum Ger�t'), TLanguageString.Read('Check cables',
                    '�berpr�fen Sie die Verkabelung'));
                oButtons := eibAbortRetryIgnore;
            end;
        cieType5:
            begin
                AddCauseAndAction(TLanguageString.Read('No access to module', 'Kein Zugriff auf das Ger�t'),
                    TLanguageString.Read('Check timeout settings', '�berpr�fen Sie die Timeout-Einstellung'));
                oButtons := eibAbortRetry;
            end;
        cieType7:
            begin
                AddCauseAndAction(TLanguageString.Read('Machine is not plugged in',
                    'Ger�t ist nicht eingeschaltet'), TLanguageString.Read('Plug in, switch on',
                    'Ger�t anschalten'));
                AddCauseAndAction(TLanguageString.Read('No connection with module ',
                    'Keine Verbindung zum Ger�t'), TLanguageString.Read('Check cables',
                    '�berpr�fen Sie die Verkabelung'));
                AddCauseAndAction(TLanguageString.Read('Wrong device settings',
                    'Faslche Ger�teeinstellungen'), TLanguageString.Read('Check device settings',
                    '�berpr�fen Sie die Ger�teeinstellungen'));
                oButtons := eibAbortRetry;
            end;
        cieType8:
            begin
                AddCauseAndAction(TLanguageString.Read('Wrong device name', 'Falscher Ger�tename'),
                    TLanguageString.Read('Check device settings', '�berpr�fen Sie die Ger�tedefinition'));
                AddCauseAndAction(TLanguageString.Read('Failure setting device state ',
                    'Fehler beim Ger�testatus setzen'), TLanguageString.Read('Check state',
                    '�berpr�fen Sie den zu setzenden Status'));
                AddCauseAndAction(TLanguageString.Read('Wrong device setting', 'Falsche Ger�tedefinition'),
                    TLanguageString.Read('Contact support', 'Kontaktieren Sie den Support'));
                oButtons := eibAbortIgnore;
            end;
        else
            begin
                oButtons := eibAbort;
            end;
    end;
end;

function TComInterfaceErrorInfo.GetFullInfoText(): string;
begin
    result := TLanguageString.Read('COM Port: {0}, Error: {1}', 'COM-Port: {0}, Fehler: {1}',
        [fComPort, self.InfoText]);
end;

{ TReagentIsOutErrorInfo }

constructor TReagentIsOutErrorInfo.Create(const aRackID: string; aRackPos: integer);
var
    xCaption, xInfoText: string;
begin
    inherited Create();

    fRackID := aRackID;
    fRackPos := aRackPos;
    xInfoText := FindOutError();
    xCaption := TLanguageString.Read('Volume Control', 'Mengenkontrolle');

    Init(xInfoText, xCaption, eibAbortIgnore); // Retry ist nicht m�glich
end;

function TReagentIsOutErrorInfo.FindOutError(): string;
//var
//    xAmount: double;
//    xSubstID: string;
//    xDA: TPosinfoDataAdaptor;
//    xColor: integer;
begin
    // gmAllArmsMoveZTravel();
    // self.edVolCtrlRack.Visible := true;
    // self.lRackID.Visible := true;

    AddCauseAndAction(TLanguageString.Read('Amount of volume has fallen below safety limit!',
        'Volumen unterschreitet Sicherheitsgrenze!'), TLanguageString.Read('Refill tube!',
        'F�llen Sie das R�hrchen auf!'));
//    xAmount := 0;
{    xDA := TPosinfoDataAdaptor.Create();
    try
        xDA.AspGetNextStep(fRackID, fRackPos, xSubstID, xAmount, xColor);
    finally
        xDA.Free;
    end;
    // lLiq.Caption := gmGetResString(24210{Reagent: }//);
    // self.edVolCtrlSubstID.Text := xSubstID;

    // self.edVolCtrlRack.Text := aRackID;
    // self.edVolCtrlPos.Text := IntToStr( aRackPos );
    // Edit2.Text := IntToStr(round(xAmount));
    // lDimension.Caption := gmGetResString(24290{yl});
    // lDimension2.Caption := gmGetResString(24290{yl});

    result := TLanguageString.Read('Rack {0}, Pos. {1}: Reagent is out',
        'Rack {0}, Pos. {1}: Reagenz ist verbraucht', [fRackID, fRackPos]);

    // TabSheet6.TabVisible:=true;
end;


end.
