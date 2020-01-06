unit Unitct;
//Copyright 2012 Veikko Kanto

//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.

// Mini Curve Tracer Program.
// This program establishes the serial communication with the Mini_CT electronics
// 256 data points per sweep are stored per trace
// Display is in V-I mode or V-t, I-t mode
// Commands to Mini_CT are established through button settings or text script files
// Trace data written to a file is in an ascii curve tracer native format or comma delimited format

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, MmSystem, Spin, Buttons, Clipbrd,
  ComCtrls, Registry, printers, MPlayer, ShellAPI, Math;


type
  TForm1 = class(TForm)
    RunSweep: TButton;
    Timer1: TTimer;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    mnuFile: TMenuItem;
    mnuExit: TMenuItem;
    Labelipd: TLabel;
    Labelvpd: TLabel;
    SpinMa: TSpinButton;
    SpinVolts: TSpinButton;
    Load1: TMenuItem;
    Copy1: TMenuItem;
    Copy2: TMenuItem;
    tmrchkstatus: TTimer;
    Clear1: TMenuItem;
    Yes1: TMenuItem;
    Sound1: TMenuItem;
    On1: TMenuItem;
    UpDownVO: TUpDown;
    UpDownIO: TUpDown;
    LabelVO: TLabel;
    LabelIO: TLabel;
    Memo1: TMemo;
    CollectorStart: TSpinEdit;
    Label1: TLabel;
    CollectorStep: TSpinEdit;
    Label7: TLabel;
    Setvalues: TButton;
    ReadVoltages: TButton;
    Labelch0: TLabel;
    Labelch1: TLabel;
    Labelch2: TLabel;
    Labelch3: TLabel;
    Labelch4: TLabel;
    Edit1: TEdit;
    CollectorV: TSpinEdit;
    BaseVolts: TSpinEdit;
    BaseuA: TSpinEdit;
    SetCollector: TButton;
    SetBaseV: TButton;
    SetBaseI: TButton;
    Label12: TLabel;
    Label13: TLabel;
    TraceNumber: TSpinEdit;
    SweepStep: TSpinEdit;
    Shape11: TShape;
    Shape12: TShape;
    Label14: TLabel;
    tubetype: TEdit;
    Calibrate1: TMenuItem;
    Save1: TMenuItem;
    Load2: TMenuItem;
    CheckF: TCheckBox;
    Avg8: TButton;
    LabelSP: TLabel;
    LabelSS: TLabel;
    LabelSG: TLabel;
    Label15: TLabel;
    LabelMPV: TLabel;
    LabelSPV: TLabel;
    MultiPlot1: TMenuItem;
    buttonmulti: TButton;
    Labelv: TLabel;
    Labeli: TLabel;
    CheckGV: TCheckBox;
    ButtonRunScript: TButton;
    Timer5: TTimer;
    S1: TMenuItem;
    Save2: TMenuItem;
    Load3: TMenuItem;
    ScriptItems1: TMenuItem;
    runsweep1: TMenuItem;
    avg8sweeps1: TMenuItem;
    readvoltages1: TMenuItem;
    sweepstep11: TMenuItem;
    clear2: TMenuItem;
    setplate4001: TMenuItem;
    setscreen4001: TMenuItem;
    setgrid101: TMenuItem;
    minplate01: TMenuItem;
    minscreen01: TMenuItem;
    setsweepvalues1: TMenuItem;
    for101: TMenuItem;
    next1: TMenuItem;
    wait51: TMenuItem;
    stop1: TMenuItem;
    namescript11: TMenuItem;
    incmaxgrid101: TMenuItem;
    decmaxgrid101: TMenuItem;
    incsweepstep1: TMenuItem;
    yes2: TMenuItem;
    PlotType: TRadioGroup;
    ReDraw: TButton;
    storeread1: TMenuItem;
    Timer6: TTimer;
    Memo2: TMemo;
    SamplePoint: TSpinEdit;
    LabelPVS: TLabel;
    LabelPIS: TLabel;
    Label26: TLabel;
    Shape1: TShape;
    CheckBox1: TCheckBox;
    Timer7: TTimer;
    LabelNdex: TLabel;
    LabelWait: TLabel;
    LabelLine: TLabel;
    CheckCursor: TCheckBox;
    LabelendV: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button11: TButton;
    LabelRslope: TLabel;
    LabelRefV: TLabel;
    LabelRefI: TLabel;
    CheckBaseV: TCheckBox;
    SpinMsteps: TSpinEdit;
    LabelPP: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel10: TBevel;
    SpinPC: TSpinEdit;
    SpinNC: TSpinEdit;
    RadioCompare: TRadioGroup;
    Button4: TButton;
    Label5: TLabel;
    Label6: TLabel;
    CheckAuto: TCheckBox;
    RadioVG: TRadioGroup;
    RadioSR: TRadioGroup;
    LabelDV: TLabel;
    LabelDI: TLabel;
    RadioSweep: TRadioGroup;
    ListBox1: TListBox;
    Reset1: TMenuItem;
    Bevel8: TBevel;
    nocal: TImage;
    ButtonRunC: TButton;
    RadioCal: TRadioGroup;
    ComPort1: TMenuItem;
    Com11: TMenuItem;
    Com21: TMenuItem;
    Com31: TMenuItem;
    Com41: TMenuItem;
    Com51: TMenuItem;
    Com61: TMenuItem;
    Com71: TMenuItem;
    Com81: TMenuItem;
    Com91: TMenuItem;
    Com101: TMenuItem;
    Com111: TMenuItem;
    Com121: TMenuItem;
    Com131: TMenuItem;
    Com141: TMenuItem;
    sweeptype01: TMenuItem;
    SetUp1: TMenuItem;
    Yes3: TMenuItem;
    vperdiv1: TMenuItem;
    iperdiv01: TMenuItem;
    voffset01: TMenuItem;
    ioffset01: TMenuItem;
    notodisp11: TMenuItem;
    samplepoint01: TMenuItem;
    baseuav1: TMenuItem;
    autoinc01: TMenuItem;
    cursor01: TMenuItem;
    mark1: TMenuItem;
    value1: TMenuItem;
    filter01: TMenuItem;
    live01: TMenuItem;
    plottype01: TMenuItem;
    Clear3: TMenuItem;
    Yes4: TMenuItem;
    ImageWave: TImage;
    wave01: TMenuItem;
    Bevel15: TBevel;
    LabelAC: TLabel;
    BX0: TShape;
    BX1: TShape;
    BX2: TShape;
    BX3: TShape;
    BX4: TShape;
    BX5: TShape;
    BX6: TShape;
    BX7: TShape;
    BX8: TShape;
    PrintPlot1: TMenuItem;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Rate1: TMenuItem;
    N05X1: TMenuItem;
    N10X1: TMenuItem;
    N20X1: TMenuItem;
    save21: TMenuItem;
    random1: TMenuItem;
    customwave1: TMenuItem;
    Loops1: TMenuItem;
    Display1: TMenuItem;
    Acquire1: TMenuItem;
    Waveform1: TMenuItem;
    Set1: TMenuItem;
    Comment1: TMenuItem;
    Append1: TMenuItem;
    MediaPlayer1: TMediaPlayer;
    Sount1: TMenuItem;
    On2: TMenuItem;
    AutoUpdateOff1: TMenuItem;
    Label8: TLabel;
    Label9: TLabel;
    liveupdate: TCheckBox;
    Labels1: TMenuItem;
    VIperDiv1: TMenuItem;
    Offsets1: TMenuItem;
    SN1: TMenuItem;
    StepTrace1: TMenuItem;
    CompareTrace1: TMenuItem;
    CursorVI1: TMenuItem;
    Value2: TMenuItem;
    update01: TMenuItem;
    show01: TMenuItem;
    hide01: TMenuItem;
    storecursor1: TMenuItem;
    storevalue1: TMenuItem;
    storetrace1: TMenuItem;
    storeimage1: TMenuItem;
    newtimestamp01: TMenuItem;
    remcomment1: TMenuItem;
    Remark1: TMenuItem;
    storeremcomment1: TMenuItem;
    SavetoFile1: TMenuItem;
    Export1: TMenuItem;
    Trace1: TMenuItem;
    All1: TMenuItem;
    fori101: TMenuItem;
    nexti1: TMenuItem;
    loop1: TMenuItem;
    end1: TMenuItem;
    pause1: TMenuItem;
    Pause2: TMenuItem;
    Stop2: TMenuItem;
    ResetRunSweep1: TMenuItem;
    LabelIdex: TLabel;
    ShowCalMenu1: TMenuItem;
    N001sperstep1: TMenuItem;
    N01secperstep1: TMenuItem;
    StepTime1: TMenuItem;
    N1secperstep1: TMenuItem;
    LabelS: TLabel;
    runbasestep1: TMenuItem;
    runbasevstep201: TMenuItem;
    traceno11: TMenuItem;
    inctraceno1: TMenuItem;
    Cursor1: TMenuItem;
    Compare01: TMenuItem;
    comparestep1: TMenuItem;
    comparetrace11: TMenuItem;
    SingleStep1: TMenuItem;
    ShowResistorMenu1: TMenuItem;
    PanelR: TPanel;
    SetR: TButton;
    EditR0: TEdit;
    EditR1: TEdit;
    EditR2: TEdit;
    EditR3: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    CurrentTrace1: TMenuItem;
    HTMLHelp1: TMenuItem;
    LoadCompare1: TMenuItem;
    savefilenst1: TMenuItem;
    loadfilefilename1: TMenuItem;
    loadimageimagename1: TMenuItem;
    popupcomment1: TMenuItem;
    EditHid: TEdit;
    SweepTypeText: TStaticText;
    CompareText: TStaticText;
    ACSweepText: TStaticText;
    SlowSweepText: TStaticText;
    OffText: TStaticText;
    ToTraceText: TStaticText;
    toPartText: TStaticText;
    XYText: TStaticText;
    XTText: TStaticText;
    PlotTypeText: TStaticText;
    UpdateWithSweepText: TStaticText;
    AutoIncText: TStaticText;
    CursorText: TStaticText;
    LiveText: TStaticText;
    FilterOnText: TStaticText;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Plot1: TMenuItem;
    resetplot1: TMenuItem;
    plotbvic1: TMenuItem;
    plotcvib1: TMenuItem;
    Com151: TMenuItem;
    Com161: TMenuItem;
    Com171: TMenuItem;
    Com181: TMenuItem;
    Com191: TMenuItem;
    Com201: TMenuItem;
    EditR4: TEdit;
    Label22: TLabel;
    ZeroLeads: TButton;
    BaseLabelPosition1: TMenuItem;
    N01: TMenuItem;
    N1281: TMenuItem;
    N2561: TMenuItem;
    plotcvic1: TMenuItem;
    addcollv101: TMenuItem;
    About1: TMenuItem;
    ButtonExample: TButton;
    plotbvcv1: TMenuItem;
    baseat1: TMenuItem;
    sin16x1: TMenuItem;
    procedure RunSweepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FomrDestroy(Sender: TObject);
    procedure SpinVoltsDownClick(Sender: TObject);
    procedure SpinButton3donwclick(Sender: TObject);
    procedure SpinMaDownClick(Sender: TObject);
    procedure SpinMaUpClick(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure Copy2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure tmrchkstatusTimer(Sender: TObject);
    procedure Yes1Click(Sender: TObject);
    procedure On1Click(Sender: TObject);
    procedure UpDownVOClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownIOClick(Sender: TObject; Button: TUDBtnType);
    procedure SetvaluesClick(Sender: TObject);
    procedure ReadVoltagesClick(Sender: TObject);
    procedure SetCollectorClick(Sender: TObject);
    procedure SetBaseVClick(Sender: TObject);
    procedure SetBaseIClick(Sender: TObject);
    procedure SweepStepChange(Sender: TObject);
    procedure TraceNumberChange(Sender: TObject);
    procedure Load2Click(Sender: TObject);
    procedure Avg8Click(Sender: TObject);
    procedure MultiPlot1Click(Sender: TObject);
    procedure buttonmultiClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer5Timer(Sender: TObject);
    procedure ButtonRunScriptClick(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure Load3Click(Sender: TObject);
    procedure runsweep1Click(Sender: TObject);
    procedure avg8sweeps1Click(Sender: TObject);
    procedure poweron1Click(Sender: TObject);
    procedure poweroff1Click(Sender: TObject);
    procedure readvoltages1Click(Sender: TObject);
    procedure readheater1Click(Sender: TObject);
    procedure sweepstep11Click(Sender: TObject);
    procedure clear2Click(Sender: TObject);
    procedure setplate4001Click(Sender: TObject);
    procedure setscreen4001Click(Sender: TObject);
    procedure setgrid101Click(Sender: TObject);
    procedure minplate01Click(Sender: TObject);
    procedure stepplate101Click(Sender: TObject);
    procedure setsweepvalues1Click(Sender: TObject);
    procedure for101Click(Sender: TObject);
    procedure next1Click(Sender: TObject);
    procedure wait51Click(Sender: TObject);
    procedure stop1Click(Sender: TObject);
    procedure namescript11Click(Sender: TObject);
    procedure incmaxgrid101Click(Sender: TObject);
    procedure decmaxgrid101Click(Sender: TObject);
    procedure incsweepstep1Click(Sender: TObject);
    procedure yes2Click(Sender: TObject);
    procedure ReDrawClick(Sender: TObject);
    procedure storeread1Click(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure OnMouseMove2(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SamplePointChange(Sender: TObject);
    procedure Live(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure Oncheckcursor(Sender: TObject);
    procedure minscreen01Click(Sender: TObject);
    procedure Onplottype(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure CheckGVClick(Sender: TObject);
    procedure CheckBaseVClick(Sender: TObject);
    procedure SpinMstepsChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpinPCChange(Sender: TObject);
    procedure SpinNCChange(Sender: TObject);
    procedure RadioCompareClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ButtonRunCClick(Sender: TObject);
    procedure Com11Click(Sender: TObject);
    procedure Com21Click(Sender: TObject);
    procedure Com31Click(Sender: TObject);
    procedure Com41Click(Sender: TObject);
    procedure Com51Click(Sender: TObject);
    procedure Com61Click(Sender: TObject);
    procedure Com71Click(Sender: TObject);
    procedure Com81Click(Sender: TObject);
    procedure Com91Click(Sender: TObject);
    procedure Com101Click(Sender: TObject);
    procedure Com111Click(Sender: TObject);
    procedure Com121Click(Sender: TObject);
    procedure Com131Click(Sender: TObject);
    procedure Com141Click(Sender: TObject);
    procedure sweeptype01Click(Sender: TObject);
    procedure Yes3Click(Sender: TObject);
    procedure vperdiv1Click(Sender: TObject);
    procedure iperdiv01Click(Sender: TObject);
    procedure voffset01Click(Sender: TObject);
    procedure ioffset01Click(Sender: TObject);
    procedure notodisp11Click(Sender: TObject);
    procedure samplepoint01Click(Sender: TObject);
    procedure baseuav1Click(Sender: TObject);
    procedure autoinc01Click(Sender: TObject);
    procedure cursor01Click(Sender: TObject);
    procedure mark1Click(Sender: TObject);
    procedure value1Click(Sender: TObject);
    procedure filter01Click(Sender: TObject);
    procedure live01Click(Sender: TObject);
    procedure plottype01Click(Sender: TObject);
    procedure Yes4Click(Sender: TObject);
    procedure wave01Click(Sender: TObject);
    procedure RadioSweepClick(Sender: TObject);
    procedure wavemousedown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mousew0(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mousew1(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mousew2(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mousew3(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mousew4(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mousew5(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mousew6(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mousew7(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mousew8(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PrintPlot1Click(Sender: TObject);
    procedure mnusave21click(Sender: TObject);
    procedure N05X1Click(Sender: TObject);
    procedure N10X1Click(Sender: TObject);
    procedure N20X1Click(Sender: TObject);
    procedure customwave1Click(Sender: TObject);
    procedure random1Click(Sender: TObject);
    procedure Append1Click(Sender: TObject);
    procedure On2Click(Sender: TObject);
    procedure AutoUpdateOff1Click(Sender: TObject);
    procedure VIperDiv1Click(Sender: TObject);
    procedure Offsets1Click(Sender: TObject);
    procedure SN1Click(Sender: TObject);
    procedure StepTrace1Click(Sender: TObject);
    procedure CompareTrace1Click(Sender: TObject);
    procedure CursorVI1Click(Sender: TObject);
    procedure Value2Click(Sender: TObject);
    procedure update01Click(Sender: TObject);
    procedure show01Click(Sender: TObject);
    procedure hide01Click(Sender: TObject);
    procedure remcomment1Click(Sender: TObject);
    procedure newtimestamp01Click(Sender: TObject);
    procedure storecursor1Click(Sender: TObject);
    procedure storevalue1Click(Sender: TObject);
    procedure storetrace1Click(Sender: TObject);
    procedure storeimage1Click(Sender: TObject);
    procedure storeremcomment1Click(Sender: TObject);
    procedure SavetoFile1Click(Sender: TObject);
    procedure All1Click(Sender: TObject);
    procedure Trace1Click(Sender: TObject);
    procedure fori101Click(Sender: TObject);
    procedure nexti1Click(Sender: TObject);
    procedure loop1Click(Sender: TObject);
    procedure end1Click(Sender: TObject);
    procedure pause1Click(Sender: TObject);
    procedure ResetRunSweep1Click(Sender: TObject);
    procedure Pause2Click(Sender: TObject);
    procedure Stop2Click(Sender: TObject);
    procedure ShowCalMenu1Click(Sender: TObject);
    procedure N001sperstep1Click(Sender: TObject);
    procedure N01secperstep1Click(Sender: TObject);
    procedure N1secperstep1Click(Sender: TObject);
    procedure runbasestep1Click(Sender: TObject);
    procedure runbasevstep201Click(Sender: TObject);
    procedure traceno11Click(Sender: TObject);
    procedure inctraceno1Click(Sender: TObject);
    procedure Compare01Click(Sender: TObject);
    procedure comparestep1Click(Sender: TObject);
    procedure comparetrace11Click(Sender: TObject);
    procedure SingleStep1Click(Sender: TObject);
    procedure ShowResistorMenu1Click(Sender: TObject);
    procedure SetRClick(Sender: TObject);
    procedure CurrentTrace1Click(Sender: TObject);
    procedure HTMLHelp1Click(Sender: TObject);
    procedure RadioCalClick(Sender: TObject);
    procedure LoadCompare1Click(Sender: TObject);
    procedure savefilenst1Click(Sender: TObject);
    procedure loadfilefilename1Click(Sender: TObject);
    procedure loadimageimagename1Click(Sender: TObject);
    procedure popupcomment1Click(Sender: TObject);
    procedure formkeydown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure formkeyup(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Onsweeptextclick(Sender: TObject);
    procedure CompareTextClick(Sender: TObject);
    procedure checkbasedown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure checkgvdown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ACSweepTextClick(Sender: TObject);
    procedure SlowSweepTextClick(Sender: TObject);
    procedure OffTextClick(Sender: TObject);
    procedure ToTraceTextClick(Sender: TObject);
    procedure toPartTextClick(Sender: TObject);
    procedure PlotTypeTextClick(Sender: TObject);
    procedure XYTextClick(Sender: TObject);
    procedure XTTextClick(Sender: TObject);
    procedure UpdateWithSweepTextClick(Sender: TObject);
    procedure AutoIncTextClick(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure CursorTextClick(Sender: TObject);
    procedure LiveTextClick(Sender: TObject);
    procedure FilterOnTextClick(Sender: TObject);
    procedure LabelVOClick(Sender: TObject);
    procedure LabelIOClick(Sender: TObject);
    procedure LabelvpdClick(Sender: TObject);
    procedure LabelipdClick(Sender: TObject);
    procedure LabelACClick(Sender: TObject);
    procedure resetplot1Click(Sender: TObject);
    procedure plotbvic1Click(Sender: TObject);
    procedure plotcvib1Click(Sender: TObject);
    procedure Com151Click(Sender: TObject);
    procedure Com161Click(Sender: TObject);
    procedure Com171Click(Sender: TObject);
    procedure Com181Click(Sender: TObject);
    procedure Com191Click(Sender: TObject);
    procedure Com201Click(Sender: TObject);
    procedure subtracttextclick(Sender: TObject);
    procedure ZeroLeadsClick(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure N1281Click(Sender: TObject);
    procedure N2561Click(Sender: TObject);
    procedure plotcvic1Click(Sender: TObject);
    procedure addcollv101Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ButtonExampleClick(Sender: TObject);
    procedure plotbvcv1Click(Sender: TObject);
    procedure baseat1Click(Sender: TObject);
    procedure sin16x1Click(Sender: TObject);
  private
     { Private declarations }

  public
    { Public declarations }

  end;

var
  Form1: TForm1;
  //The pins array returns the plus or minus pin num associated with an index number
  //Up to 4096 curve traces can be stored
  //The index points to a 256 data point trace in the traces[] array while pins holds the
  //associated minus and plus  pin indices 
  pins : array[0..1, -1..4095, 0..1] of integer; //[normal/compare, trace, minus pin = 0 / plus pin = 1]

implementation

uses Unit2, Unit3, Unit4;

//uses

{$R *.DFM}

var
  myimage : TBitmap;                            //The curve tracer displayed image bitmap
  addata : array [0..4095,1..4] of integer;     //Raw adc data from a trace sweep 1=CV 2=CI 3=BV 4= BI
  serno : array[0..1] of string;               //Curve tracer Serial Number 0=Part Under Test 1=Compare Part

  //The traces[] array holds sweep data for up to 4096 traces
  traces : array[0..1, -1..4096, 0..512, 1..4] of single; //[Part/Compare, index, data sample, CV CI BV BI]

  v : array [-2..1024,1..4] of single;    //array to hold ADC data scaled to calibrated voltage levels
                                         //v[i,1]=CV, v[i,2]=CI, v[i,3] = BV, v[i,4] = BI
  //vb : array [0..256,1..6] of single;    //array to hold ADC data scaled to calibrated voltage levels
  maxpoints : integer;                   //Maximum number of sweep sampling points

  vpd : array[0..10] of single;         //volts per division display constants
  ipd : array[0..11] of single;         //amps per division display constants
  vspin, ispin : integer;               //spin edit index for v and i per division
  vperdiv, iperdiv : single;            //current volts and amps per div

  cmpm, cmpp, cmpi : integer;           //Compair pin indices for plus and minus pins

  calpv,calpi,calsv,calsi,calgv,calgi,calhv,calhi : single; //calibration gain values for Voltage and Current measurements
  zpv,zpi,zsv,zsi,zgv,zgi,zhv,zhi : single;                 //calibration zero values for Voltage and Current measurements

  flagcal, flagmulti : bool;   //flags for calibration and multi-plot

   d : tDCB;                      //Serial port I/O definitions
   p : ^dword;
   dw :dword;
   comhand: thandle;
   a : longbool;
   a2 : bool;
   FileName : string;
   cp : tcommprop;
   cs : tcomstat;
   bchar : char;
   k : dword;
   cs1 : array[0..100] of char;
   cstats : integer;
   
   LogName : string;                  //File name for sript file saves

   cline : array[0..8192] of integer;  //Array to hold recieved charaters from serial port
   cline_count : integer;              //Number of charaters recieved
   datalen : integer;                  //Number of charaters expected in return data
   cnt1 : integer;                     //Character index pointer

   flg : bool;                        //Flag to indicate if fast or slow sweep data is expected
   gv1, gv2, gv3 : integer;           //Temp storage for Base values
   flagavg : bool;                    //Flag for processing data average
   countavg : integer;                //Counter for averaging data

   //Sript file looping variables
   waitcount, scriptcount, forcount, forpos, foricount, foripos, looppos, pltpos : integer;
   //Mouse cursor variables
   mousev, mousei, mousegv, pv1, pv2, pi1, pi2, grv1, grv2, baseV, baseI : single;

   foot : integer;              //Foot switch variable
   ioffset,voffset :  integer;  //Offsets for display

   cursortrace : integer;      //Trace number that is used for cursor display
   noupdate : bool;            //Flag whether to update display
   tical, tvcal, vref1, iref1, vbref, ibref, calvolts, calohms : single; //Calibration variables
   plotcolor : integer;        // Color to plot trace
   comparename : string;       // Temp storage for name of compare file
   switchpos, calnum : integer;   //Switch position byte for gain, series-R and Bave V/I
   //Calibration array datra
   Vcal : array [0..1] of single;  // [i,v] i = 0 for x1, 1 for x4.5
   Voff : array [0..1] of single;
   Ical : array [0..4] of single;  // [i,v] i = 0 for 500, 1 for 1500, 2 for 15K, 3 for 100K and 4 for 1Meg
   Ioff : array [0..4] of single;
   resistor : array [0..4] of single;  //Sense resistor values
   kcap : single;                  //Capacitance constant
   cvzero, cvcal, bvzero, bvcal, bizero, bical : single; //Calibration constants for current switch positions
   stime : tdatetime;                                    //Current date/time variable
   serialno, sntemp, radiowave, p2temp : integer;        //Serial number of CT, temp value, waveform type, temp value
   delay1, delay2 : integer;                             //Delays for continous live mode timer
   collectorflag, singlepass : bool;                     //flag for collector DC value update needed, flag for script single step
   fname : string;                                       //File Name for script file saves
   makescript : bool;
   Rleads, Rmeasure, Cmeasure, Cleads : single;          //Measurement zero value storage
   BaseAt : integer;                                     //Location to print base step value 

//procedure to paste prototype instructions into the script memo edit area
procedure pastescript(pt : string);
begin
 form1.EditHid.text := pt + chr(13) + chr(10);
 form1.editHid.SelectAll;
 form1.EditHid.CopyToClipboard;
 form1.Memo1.PasteFromClipboard;
end;
 
//Open serial comport #1 to #20 and set to 8 data no parity baud=460800. return 0 on error;
Function opencomport(portnum : smallint): smallint;
begin
  if (portnum < 1) or (portnum > 20) then portnum := 1;
  if portnum = 1 then FileName := 'com1';
  if portnum = 2 then FileName := 'com2';
  if portnum = 3 then FileName := 'com3';
  if portnum = 4 then FileName := 'com4';
  if portnum = 5 then FileName := 'com5';
  if portnum = 6 then FileName := 'com6';
  if portnum = 7 then FileName := 'com7';
  if portnum = 8 then FileName := 'com8';
  if portnum = 9 then FileName := 'com9';
  if portnum = 10 then FileName := '\\.\COM10';
  if portnum = 11 then FileName := '\\.\COM11';
  if portnum = 12 then FileName := '\\.\COM12';
  if portnum = 13 then FileName := '\\.\COM13';
  if portnum = 14 then FileName := '\\.\COM14';
  if portnum = 15 then FileName := '\\.\COM15';
  if portnum = 16 then FileName := '\\.\COM16';
  if portnum = 17 then FileName := '\\.\COM17';
  if portnum = 18 then FileName := '\\.\COM18';
  if portnum = 19 then FileName := '\\.\COM19';
  if portnum = 20 then FileName := '\\.\COM20';
  comhand := FileOpen(FileName, fmOpenReadWrite);    //Open ComX for input-output mode
  opencomport := -1;                                 //If open works, return all ones
  if (comhand > 0) and (comhand < 4294967295) then begin
    //valid file handle was returned, so set up port parameters
    getcommproperties(comhand, cp);                 //Get the com port windows handle
    a2 := SetUpComm(comhand, 32768, 16);           //Set up for a 32767 byte receive buffer and a 512 byte write buffer
    a2 := GetCommState(comhand, d);                //Get the current set up for the port
    dw := d.wreserved;
    dw := d.wreserved1;
    d.BaudRate := 460800;                         //Change the speed and bit settings
    d.ByteSize := 8;
    d.Parity := NOPARITY;
    d.StopBits := ONESTOPBIT;
    d.Flags := 1;
    a2 := SetCommState(comhand, d);               //Configure the new speed and bit settings
   end
  else
    opencomport := 0;                             //Return zero if error
end;

//Close the serial port
procedure closecomport;                         //Shut down the serial port
begin
 closehandle(comhand);
end;

//Transmit the lower byte of an integer through the serial port. return -1 on error
function transmitcombyte(databyte : smallint): smallint;
var
   c : char;
   p9 : array[0..2] of char;
   f : word;
begin
 if databyte <0 then databyte := 0;
 if databyte >255 then databyte := 255;
 c := chr(databyte);
 p9[0] := c;
 p9[1] := chr(0);
 f := filewrite(comhand, p9, 1);
 if f = 0 then transmitcombyte := -1 else transmitcombyte := 0;  //on error return -1 else 0 if sent
end;

//write a serial string command to the curve tracer
procedure writecommand(cs2 : shortstring);
var
 i : smallint;
 p9 : array[0..255] of char;
 f : word;
 count : integer;
begin
 count := Length(cs2);
 if count < 1 then exit;
 for i := 0 to count-1 do p9[i]:= cs2[i+1];
 p9[count] := char(13);       //add CR
 p9[count+1] := char(10);     //add LF
 f := filewrite(comhand, p9, count+2);
end;

//get one byte from com port buffer. return byte 0-255 but if no data available, return 256
function readcombyte(): integer;
var
 d : dword;
 f : word;
 b : byte;
begin
 clearcommerror(comhand, d, @cs);
  b := 0;
  readcombyte := 256;                  //return 256 if no byte was recieved
 if cs.cbinque <> 0 then begin
  f := fileread (comhand, b, 1);
  if f <> 0 then readcombyte := b;
 end;
end;

//interim function, now only sets the script output file to a default value of lognull.txt
procedure logfilename(i : integer);
var
 f : textfile;
begin;
 if i = 9 then LogName := 'LogNull.txt';
 try
  AssignFile(F, logname);
  Rewrite(F);
 finally
  close(F);
 end;
end;

//Takes the switch byte returned by the curve tracer using it to
//update the application form and set the calibration variables
procedure setgain(g : integer);
begin
 if (g and 32) <> 32 then begin
  form1.SetBaseI.enabled := false;
  form1.SetBaseV.enabled := true;
  form1.checkGV.visible := false;
  form1.checkBaseV.visible := true;
  if form1.checkgv.checked = true then form1.checkbasev.checked := true
 end else begin
  Form1.SetBaseI.enabled := true;
  form1.SetBaseV.enabled := false;
  form1.checkGV.visible := true;
  form1.checkBaseV.visible := false;
  if form1.checkbasev.checked = true then form1.checkgv.checked := true
 end;
 if (g and 16) = 16 then begin
  calpv := Vcal[1];
  zpv := Voff[1];
  form1.radioVG.ItemIndex := 1;
 end else begin
  calpv := Vcal[0];
  zpv := Voff[0];
  form1.radioVG.ItemIndex := 0;
 end;
 g := g and 15;
 if g = 14 then begin calpi := Ical[0]; zpi := Ioff[0]; form1.radioSR.ItemIndex := 0; end;
 if g = 13 then begin calpi := Ical[1];  zpi := Ioff[1]; form1.radioSR.ItemIndex := 1; end;
 if g = 11 then begin calpi := Ical[2];  zpi := Ioff[2]; form1.radioSR.ItemIndex := 2; end;
 if g = 7 then begin calpi := Ical[3];  zpi := Ioff[3]; form1.radioSR.ItemIndex := 3; end;
 if g = 15 then begin calpi := Ical[4];  zpi := Ioff[4]; form1.radioSR.ItemIndex := 4; end;

end;

//A simple linear search hashing function to locate where pin+ to pin- trace data is stored
//The index number is returned. If no entry is found, -1 is returned
//To save new pin data set R/W = 1, else R/W = 0
function hash(trace : integer; negpin:integer; pospin:integer; rw:integer):integer;
var
 i : integer;
begin
 hash := -1;  //Set return value for not found in table

  for i := 0 to 4095 do begin
   if (pins[trace,i,0] = negpin) and (pins[trace,i,1] = pospin) then begin     //Check if pins are in table
    hash := i;
    exit;                                                                      //If match is found, return index to table
   end;
   if pins[trace,i,0] = 0 then begin   //If table entery is empty value, then new trace can go here
     if rw = 1 then begin  //Test if caller wants to store value and return index if true
       hash := i;
       exit;
     end;
   end;
  end;
end;

//Paints the bitmap array for the plot to the Form
procedure paintdib;
begin
 Form1.canvas.draw(0, 0, myimage);
 myimage.Height := 513;           //Restore the image size to 513x513
 myimage.Width := 513;            //Needed if other images were loaded
 myimage.PixelFormat := pf24bit; //Use true RGB for the image
end;
 
// Plots the voltage and current curve for maxpoints of data
// Trace line color is set by global variable tracecolor
// If global flagmulti is true, then new traces are drawn over the plot
// Plot is X-Y or X-t depending on plotype radio button
// If Curson if enabled, it is is drawn on trace
// All selected text types are drawn
procedure plotdata;
var
 i : integer;
 v1, v2 : integer;
 ki, kv, kio,kvo : single;
begin

if flagmulti = false then begin
//Set graphing pen and background colors
myimage.Canvas.Pen.mode := pmcopy;
myimage.canvas.pen.Width := 1;
myimage.canvas.Rectangle(0, 0, 513, 513);
myimage.canvas.pen.color := $afafaf;
myimage.canvas.Brush.Color := $6f6f6f;
myimage.canvas.brush.style := bssolid;
myimage.canvas.FillRect(rect(1, 1, 512, 512));


//Draw grids for the display area
for i := 1 to 9 do begin
 myimage.canvas.moveto(trunc(i*51.2),1);
 myimage.canvas.lineto(trunc(i*51.2),511);
end; {i}
for i := 1 to 9 do begin
 myimage.canvas.moveto(1,trunc(i*51.2));
 myimage.canvas.lineto(511,trunc(i*51.2));
end; {i}

for i := 1 to 49 do begin
 myimage.canvas.moveto(trunc(i*10.24),253);
 myimage.canvas.lineto(trunc(i*10.24),260);
end; {i}
for i := 1 to 49 do begin
 myimage.canvas.moveto(253,trunc(i*10.24));
 myimage.canvas.lineto(260,trunc(i*10.24));
end; {i}
end; {flagmulti if}

//Set the scale factors for plotting on the display area
 kV := 51.2 / vperdiv;
 ki := 51.2/(iperdiv*0.001);
 kvo := Voffset * 51.2;
 kio := Ioffset * 51.2;

//Plot the voltage versus current in plotcolor
 myimage.canvas.pen.mode := pmmerge;    //pmmerge is used to prevent writing over graph lines
 myimage.canvas.pen.Color := plotcolor;
 myimage.canvas.pen.Width := 2;
 myimage.canvas.pen.style := pssolid;

 if (form1.plottype.ItemIndex = 0) then begin //Check for X-Y plot type
  for i := 0 to maxpoints-1 do begin  //Plot trace
   v2 := 256-trunc(v[i,2] * ki - kio);
   v1 := 256+trunc(v[i,1] * kv - kvo);
   if i=0 then myimage.canvas.moveto(v1, v2); //Move to the first point to prevent wild lines on plot
   if (form1.checkcursor.checked = true) and (i = form1.SamplePoint.value) and (cursortrace = form1.SweepStep.value) then begin
    myimage.canvas.Ellipse(v1-3,v2-3,v1+3,v2+3);
   end;
   myimage.canvas.lineto(v1, v2);
  end; {i}
 end;

 if (form1.plottype.ItemIndex = 1) then begin //Check for X-t plot type
  for i := 0 to maxpoints-1 do begin   //Plot voltage
   v1 := i*2;
   v2 := 256-trunc(v[i,1] * kv - kvo);
   if i=0 then myimage.canvas.moveto(v1, v2); //Move to the first point to prevent wild lines on plot
   if (form1.checkcursor.checked = true) and (i = form1.SamplePoint.value) and (cursortrace = form1.SweepStep.value) then begin
    myimage.canvas.Ellipse(v1-3,v2-3,v1+3,v2+3);
   end;
   myimage.canvas.lineto(v1, v2);
  end; {i}
  myimage.canvas.pen.Color := $a70000 + plotcolor; //Add blue to 2nd plot (current)
  for i := 0 to maxpoints-1 do begin   //Plot current
   v1 := i*2;
   v2 := 256-trunc(v[i,2] * ki - kio);
   if i=0 then myimage.canvas.moveto(v1, v2); //Move to the first point to prevent wild lines on plot
   if (form1.checkcursor.checked = true) and (i = form1.SamplePoint.value) and (cursortrace = form1.SweepStep.value) then begin
    myimage.canvas.Ellipse(v1-3,v2-3,v1+3,v2+3);
   end;
   myimage.canvas.lineto(v1, v2);
  end; {i}
 end;

 //print base V/I values at end of trace
 myimage.canvas.brush.style := bsclear;  //text has transparent background
 myimage.canvas.pen.mode := pmcopy;      //copy mode for text
// if form1.N01.Checked then i := 64;    //Old code to set text position, now uses baseat variable
// if form1.N1281.Checked then i := 128;
// if form1.N2561.Checked then i := 255;
 i := BaseAt;
 v2 := 256-trunc(v[i,2] * ki - kio);
 v1 := 256+trunc(v[i,1] * kv - kvo);
 if (form1.checkgv.checked = true) and (form1.plottype.itemindex = 0)then begin
   mousegv := v[1,4];
   grv1 := gv2;
   grv2 := mousegv;
   myimage.canvas.TextOut(v1+2,v2-3, format('%3.1f',[mousegv])+'uA');
 end else
 if (form1.checkBaseV.checked = true) and (form1.plottype.itemindex = 0)then begin
   mousegv := v[1,3];
   myimage.canvas.TextOut(v1+2,v2-3, format('%2.2f',[mousegv])+'V');
 end;

 //Print selected labels at top of plot
 myimage.canvas.pen.Width := 1;
 myimage.canvas.pen.mode := pmcopy;
 myimage.canvas.Font.Color := clwhite;
 if form1.VIperDiv1.checked then myimage.canvas.TextOut(1,1, form1.labelvpd.caption + ' : ' + form1.labelipd.caption);
 if form1.offsets1.checked then myimage.canvas.TextOut(1,14, form1.labelvo.caption + ' : ' + form1.labelio.caption);
 if form1.SN1.checked then myimage.canvas.TextOut(360,1, 'S/N:'+form1.tubetype.text);
 if form1.steptrace1.checked then myimage.canvas.TextOut(160,1, inttostr(form1.tracenumber.value) + ', ' + inttostr(form1.sweepstep.value));
 if form1.comparetrace1.checked then myimage.canvas.TextOut(260,1, inttostr(form1.spinnc.value) + ', ' + inttostr(form1.spinpc.value));
 if form1.cursorvi1.checked then myimage.canvas.TextOut(160,14, form1.labelpvs.caption + ' : ' + form1.labelpis.caption);
 if form1.value2.checked then myimage.canvas.TextOut(360,14, form1.labelrslope.caption);

 //if the voltage gain is high at 4.5X then place black voltage markers to
 //remind user voltage is clipping at plus and minus 3.3V
 if (form1.radiovg.ItemIndex = 1) and (form1.plottype.itemindex = 0) then begin
  myimage.canvas.pen.Width := 4;
  myimage.canvas.pen.mode := pmcopy;
  myimage.canvas.pen.Color := clblack;
  v2 := 256-trunc(3.238 * kv + kvo);
  myimage.canvas.moveto(v2, 0);
  myimage.canvas.lineto(v2, 512);
  v2 := 256-trunc(-3.238 * kv + kvo);
  myimage.canvas.moveto(v2, 0);
  myimage.canvas.lineto(v2, 512);
  myimage.canvas.pen.Width := 1;
 end;

 myimage.canvas.brush.style := bssolid;  //restore text mode to solid background

end; {plotdata}

//Processes parameter Value calculations when an item in the listbox is selected
procedure listboxupdate;
var
 j, i : integer;
 v1, v2, v3, v4, i1, i2, i3, i4, m, b, slopev, slopei, vref1a, iref1a, zmag, zpha: single;
begin
 //Find absolute value of resistance slope using cursor and reference mark value for the delta values
 if form1.listbox1.ItemIndex = 0 then begin
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
  j := form1.SamplePoint.value;                                 //Get current cursor point values
  v1 := traces[0,i,j,1];
  i1 := traces[0,i,j,2];
  v2 := traces[0,i,1,3];
  i2 := traces[0,i,1,4];
  slopev :=   abs(v1 - vref1);
  slopei :=   abs(i1 - iref1);
  if slopei < 1e-10 then slopei := 1e-10;
  form1.LabelRslope.caption := format('Slope=%7.2fohm',[slopev/slopei - Rleads]);
  Rmeasure := slopev/slopei;
 end;
 //Use cursor and reference mark values for delta and calculate beta
 if form1.listbox1.ItemIndex = 1 then begin
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
  j := form1.SamplePoint.value;                                 //get the cursor sample point values
  v1 := traces[0,i,j,1];
  i1 := traces[0,i,j,2];
  v2 := traces[0,i,1,3];
  i2 := traces[0,i,1,4];
  i3 :=   abs(i1 - iref1);
  i4 :=   abs(i2 - ibref) * 1e-6;
  if i4 < 1e-8 then i4 := 1e-8;
  form1.LabelRslope.caption := format('Beta=%3.1f',[i3/i4]);
 end;
  //Using cursor and reference mark values, find the tansconductance
 if form1.listbox1.ItemIndex = 2 then begin
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
  j := form1.SamplePoint.value;                  //Get values for cursor point
  v1 := traces[0,i,j,1];
  i1 := traces[0,i,j,2];
  v2 := traces[0,i,1,3];
  i2 := traces[0,i,1,4];                         //Use marked reference values plus base voltage
  i3 :=   abs(i1 - iref1);                       //to calculate transconductance
  v4 :=   abs(v2 - vbref);
  if v4 < 1e-8 then v4 := 1e-8;
  form1.LabelRslope.caption := format('Gm=%0.6fmho',[i3/v4]);
 end;
 //Take the collector slope and find the Early Voltage intercept point
 if form1.listbox1.ItemIndex = 3 then begin
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
  j := form1.SamplePoint.value;
  v1 := traces[0,i,j,1];
  i1 := traces[0,i,j,2];
  vref1a := vref1;
  iref1a := iref1;
  if v1 < vref1a then begin
   v3 := v1;
   v1 := vref1a;
   vref1a := v3;
   i3 := i1;
   i1 := iref1a;
   iref1a := i3;
  end;
  v2 :=   v1 - vref1a;
  i2 :=   i1 - iref1a;
  if abs(v2) < 1e-9 then v2 := 1e-9;
  m := i2/v2;
  if abs(m) < 1e-12 then m := 1e-12;
  b := i1-m*v1;
  form1.LabelRslope.caption := format('Early=%3.2fV',[-b/m]);
 end;
 //If waveforms are sine or triangle, use the loop voltage and current to find capacitance
 if form1.listbox1.ItemIndex >= 4 then begin
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
  v2 :=  50.0; //Initialize variables to find min and max voltage and current
  i2 :=  1.0;
  V3 :=  -50.0;
  I3 := -1.0;
  v4 := 0;
  for j :=0 to maxpoints-1 do begin
   v1 := traces[0,i,j,1];
   i1 := traces[0,i,j,2];
   if v1 < v2 then v2 := v1;
   if v1 > v3 then v3 := v1;
   if i1 < i2 then i2 := i1;
   if i1 > i3 then i3 := i1;
   v4 := v4 + v1;
  end;
  b := v3-v2;
  m := i3-i2;
  v4 := v4 / maxpoints;
  if abs(b) < 0.00001 then b := 0.0001;
  if form1.listbox1.itemindex = 4 then form1.LabelRslope.caption := format('C=%2.6fuF',[1e6*m/(kcap*b) - Cleads]);
  Cmeasure := 1e6*m/(kcap*b);
  //Capacitance function finds min and max values so they are ready to display if selected
  if form1.listbox1.itemindex = 5 then form1.LabelRslope.caption := format('Vmax=%2.4fV',[v3]);
  if form1.listbox1.itemindex = 6 then form1.LabelRslope.caption := format('Vmin=%2.4fV',[v2]);
  if form1.listbox1.itemindex = 7 then form1.LabelRslope.caption := format('Imax=%2.6fmA',[i3*1000.0]);
  if form1.listbox1.itemindex = 8 then form1.LabelRslope.caption := format('Imin=%2.6fmA',[i2*1000.0]);
  //Derive temperature in Celsius using diode voltage delta C=dV/2mV. Mark reference is 25C voltage
  if form1.listbox1.itemindex = 9 then
  begin
   i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
   j := form1.SamplePoint.value;
   v4 := traces[0,i,j,1];
   form1.LabelRslope.caption := format('T=%3.1fC',[25.0 + ((vref1-v4)/0.002)]);
  end;
  if form1.listbox1.itemindex >= 10 then
  begin
  try
  //find Zmag
   b := abs(v3-v2);
   m := abs(i3-i2);
   if m < 1e-10 then m := 1e-10;
   zmag := b/m;  //magnitude in ohms
   if form1.listbox1.itemindex = 10 then form1.LabelRslope.caption := format('Zmag=%6.2fohm',[zmag]);
  //find Zphase
   m := abs(i3-i2);
   traces[0,i,256,1] := traces[0,i,0,1]; //wrap around V and I waveforms for phase finding
   traces[0,i,257,1] := traces[0,i,1,1];
   traces[0,i,256,2] := traces[0,i,0,2];
   traces[0,i,257,2] := traces[0,i,1,2];
   for j :=0 to maxpoints do begin
    v1 := traces[0,i,j,1];
    v2 := traces[0,i,j+1,1];
    if (v1 >= 0.0) and (v2 < 0.0) then break;
   end;
   b := abs(v1/(v2-v1));
   i1 := traces[0,i,j,2];
   i2 := traces[0,i,j+1,2];
   i3 := b*(i2-i1)+i1;
   //form1.caption := format('%3.8f',[i3]);
   for j :=0 to maxpoints do begin
    v1 := traces[0,i,j,1];
    v2 := traces[0,i,j+1,1];
    if (v1 < 0.0) and (v2 >= 0.0) then break;
   end;
   b := abs(v1/(v2-v1));
   i1 := traces[0,i,j,2];
   i2 := traces[0,i,j+1,2];
   b := b*(i2-i1)+i1 - i3;
   b := -b;
   if b > 1.0 then b := 1.0;
   if b < -1.0 then b := -1.0;
   zpha := arcsin(b/m);
   if zmag < 1e-14 then zmag := 1e-14;
   if form1.listbox1.itemindex = 11 then form1.LabelRslope.caption := format('Phase=%3.2fdeg',[zpha*57.29578]);
   if form1.listbox1.itemindex = 12 then form1.LabelRslope.caption := format('Zreal=%3.2fohm',[zmag*cos(zpha)]);
   if form1.listbox1.itemindex = 13 then form1.LabelRslope.caption := format('Zimag=%3.2fohm',[zmag*sin(zpha)]);
   if form1.listbox1.itemindex = 14 then form1.LabelRslope.caption := format('L=%1.5fH',[zmag*sin(zpha)/377.0]);
   if form1.listbox1.itemindex = 15 then form1.LabelRslope.caption := format('Ymag=%1.8fS',[1/zmag]);
   if form1.listbox1.itemindex = 16 then form1.LabelRslope.caption := format('Yreal=%1.8fS',[(1/zmag)*cos(zpha)]);
   if form1.listbox1.itemindex = 17 then form1.LabelRslope.caption := format('Yimag=%1.8fS',[(1/zmag)*sin(zpha)]);
   if form1.listbox1.itemindex = 18 then form1.LabelRslope.caption := format('C=%2.6fuF',[(1.0e6/(zmag*377.0))*sin(zpha)]);
   if form1.listbox1.itemindex = 19 then form1.LabelRslope.caption := format('R=%6.2fohm',[zmag / cos(zpha)]);
   except;
    form1.LabelRslope.caption := 'Math Error';
   end;
  end;
  if (form1.ListBox1.ItemIndex = 4) and ((RadioWave = 2)or(RadioWave = 5)or(RadioWave = 8)) then  form1.LabelRslope.caption := 'C=Invalid Measure';
 end;
end;  {listboxupdate}

// Redraw Curves onto Form: Handles multiple, No. to Disp., and Compare
procedure doredraw;
var
 i, m, j : integer;
begin
 myimage.PixelFormat := pf24bit; //Use true RGB for the image
 plotcolor := $00a700; // Initial plot color is green
 if form1.spinMsteps.value > 1 then begin //If No. to Disp is 2 to 10 then do this
  flagmulti := false;                     //Mark first plot to redraw grid
  for i := 0 to maxpoints-1 do begin      //Clear left over data
   v[i,1] := 0;
   v[i,2] := 0;
   v[i,3] := 0;
   v[i,4] := 0;
  end;
  for m := 1 to form1.spinMsteps.value do begin   //Do 2 to 10 traces
   cursortrace := m;
   i := hash(0,form1.TraceNumber.value,m,0);  //find a table entry
    for j := 0 to maxpoints-1 do begin   // save the data to a trace plot array
     v[j,1] := traces[0,i,j,1];
     v[j,2] := traces[0,i,j,2];
     v[j,3] := traces[0,i,j,3];
     v[j,4] := traces[0,i,j,4];
    end;
    plotdata;                                    //Draw grids on plot, then only traces
    flagmulti := true;                          //Mark to draw multiple traces
    if m = form1.SweepStep.Value then begin     //Update Cursor Data
     form1.LabelPVS.caption := format('VC = %2.3f V',[v[form1.SamplePoint.Value,1]]);
     form1.LabelPIS.caption := format('IC = %3.5f mA',[1000.0*v[form1.SamplePoint.Value,2]]);
     form1.LabelDV.caption := format('DV = %2.3f V',[v[form1.SamplePoint.Value,1]-vref1]);
     form1.LabelDI.caption := format('DI = %3.5f mA',[1000.0*v[form1.SamplePoint.Value,2]-1000.0*iref1]);
    end;
   end;
 end
 // Plot only a single trace for current sweep step and trace no
 else begin
  cursortrace := form1.SweepStep.value;
  flagmulti := false;             //Do plot with initial grid drawing
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
  for j := 0 to maxpoints-1 do begin   // save the data to a plot trace array
     v[j,1] := traces[0,i,j,1];
     v[j,2] := traces[0,i,j,2];
     v[j,3] := traces[0,i,j,3];
     v[j,4] := traces[0,i,j,4];
  end;
//  if form1.radiocompare.ItemIndex = 3 then begin  //process subtract trace function
//  i := hash(0,form1.spinpc.value,form1.spinnc.value,0);  //find a table entry
//   for j := 0 to maxpoints-1 do begin
//     v[j,1] := v[j,1]-traces[0,i,j,1];
//     v[j,2] := v[j,2]-traces[0,i,j,2];   //subtract option not implemented
//     v[j,3] := v[j,3]-traces[0,i,j,3];   //Reduces capacitance loop if only current is subtracted
//     v[j,4] := v[j,4]-traces[0,i,j,4];
//   end;
//  end;
  plotdata;                           //Draw grids and plot
  form1.LabelPVS.caption := format('VC = %2.3f V',[v[form1.SamplePoint.Value,1]]);
  form1.LabelPIS.caption := format('IC = %3.5f mA',[1000.0*v[form1.SamplePoint.Value,2]]);
  form1.LabelDV.caption := format('DV = %2.3f V',[v[form1.SamplePoint.Value,1]-vref1]);
  form1.LabelDI.caption := format('DI = %3.5f mA',[1000.0*v[form1.SamplePoint.Value,2]-1000.0*iref1]);
//  plotdata;                        ////?? not sure why second redraw
 end;

 // Plot the compare trace over the other curves from the same part
 if form1.radiocompare.ItemIndex = 1 then begin
  flagmulti := true;        //Do not draw new grids or clear other plots
  plotcolor := $00a7;       //Set the plot color to Red
  cursortrace := 0;
  for i := 0 to maxpoints-1 do begin  //Clear out any old curve plot data
   v[i,1] := 0;
   v[i,2] := 0;
   v[i,3] := 0;
   v[i,4] := 0;
  end;
   i := hash(0,form1.spinNC.value,form1.spinPC.value,0);  //find a table entry
    for j := 0 to maxpoints-1 do begin   // save the data to the trace plot array
     v[j,1] := traces[0,i,j,1];
     v[j,2] := traces[0,i,j,2];
     v[j,3] := traces[0,i,j,3];
     v[j,4] := traces[0,i,j,4];
    end;
    plotdata;                    //Plot the curve and turn off the plot curve overwrite
    flagmulti := false;
 end;

 //Plot the compare trace for a second part over the trace from the current part
 if form1.radiocompare.ItemIndex = 2 then begin
  flagmulti := true;             //Do not draw new grids or clear other plots
  plotcolor := $00a7;            //Set the plot color to Red
 //When comparing two parts, multiple traces for No to Disp are processed
 if form1.spinMsteps.value > 1 then begin
  for i := 0 to maxpoints-1 do begin   //Clear out the data in the plot arry
   v[i,1] := 0;
   v[i,2] := 0;
   v[i,3] := 0;
   v[i,4] := 0;
  end;
   for m := 1 to form1.spinMsteps.value do begin
    cursortrace := 0;
    i := hash(1,form1.TraceNumber.value,m,0);  //find a table entry
    for j := 0 to maxpoints-1 do begin   // save the data to a trace array
     v[j,1] := traces[1,i,j,1];
     v[j,2] := traces[1,i,j,2];
     v[j,3] := traces[1,i,j,3];
     v[j,4] := traces[1,i,j,4];
    end;
    plotdata;
   end;
   flagmulti := false;
  end
 //Plot only a single trace when No to Dips is one
 else begin
   cursortrace := 0;
   i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
   for j := 0 to maxpoints-1 do begin   // save the data to a trace array
     v[j,1] := traces[1,i,j,1];
     v[j,2] := traces[1,i,j,2];
     v[j,3] := traces[1,i,j,3];
     v[j,4] := traces[1,i,j,4];
    end;
    plotdata;
 end;
 end;
 paintdib;
 if form1.liveupdate.Checked = true then  listboxupdate;  //Update the Value selected in the parameter list box
end; {doredraw}

// Send command for either an AC or slow sweep. Serial receive variables are cleared for new data reception.
procedure doRunSweep;
begin
 stime := now;
 if form1.radiosweep.ItemIndex = 0 then begin
   form1.RunSweep.enabled := false;
   form1.edit1.clear;
   cnt1 := 0;
   datalen := 256;
   maxpoints := 256;
   cline_count := 0;
   transmitcombyte(ord('S'));
   transmitcombyte(ord('W'));
   transmitcombyte(ord('P'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('2'));
   transmitcombyte(ord('5'));
   transmitcombyte(ord('6'));
   transmitcombyte(13);
   sleep(5);
  end;
 if form1.radiosweep.ItemIndex = 1 then begin
   form1.RunSweep.enabled := false;
   form1.edit1.clear;
   cnt1 := 0;
   datalen := 256;
   maxpoints := 256;
   cline_count := 0;
   transmitcombyte(ord('M'));
   transmitcombyte(ord('E'));
   transmitcombyte(ord('A'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('2'));
   transmitcombyte(ord('5'));
   transmitcombyte(ord('6'));
   transmitcombyte(13);
   sleep(5);
 end;
 collectorflag := false;
end;

//Start an acquisition of a curve trace
procedure TForm1.RunSweepClick(Sender: TObject);
begin
  if makescript = true then begin pastescript('runsweep'); exit; end;
  doRunSweep;  //send command to initialize a trace sweep
 if form1.On2.checked = true then begin   //if sound is on play click
    mediaplayer1.FileName := 'button_down.wav';
    mediaplayer1.AutoRewind := True;
    mediaplayer1.Open;
    try
     mediaplayer1.Play;
    finally
    end;
  end;
end;

//Returned integer data from a trace sweep is zeroed and scaled to calibrated volts and amps
procedure fixdata;
var
 j, i: word;
 f2, f3 : single;
begin
  f3 := 1.0; f2 :=0;
  if flagavg = true then begin  //if averaging is set, eight traces are scanned and added
   f3 := 0.125;
   f2 := 1.0;
   if countavg = 1 then f2 := 0.0;
  end;
// Extract Switch Settings
   switchpos := round(addata[maxpoints,1]);
   setgain(switchpos);
// Convert ADC units to volts or amps from calibration values
  for j := 0 to maxpoints-1 do begin
    v[j,1] := f3*((addata[j,1]-zpv)* calpv)+ f2*v[j,1];
    v[j,2] := f3*((addata[j,2]-zpi)* calpi)+ f2*v[j,2];
    v[j,3] := baseV;  //no real data is read from the curve tracer for base values
    v[j,4] := baseI;  //only the command voltage and current are saved
  end;

 //Process running average filter v[n] = (v[n-1}+v[n]+v[n+1])/3.0
 if form1.checkF.checked = true then begin
    v[-1,1] := v[maxpoints-1,1];
    v[-1,2] := v[maxpoints-1,2];
    v[-2,1] := v[maxpoints-2,1];
    v[-2,2] := v[maxpoints-2,2];
    v[maxpoints,1] := v[0,1];
    v[maxpoints,2] := v[0,2];
    v[maxpoints+1,1] := v[1,1];
    v[maxpoints+1,2] := v[1,2];
  if form1.radiosweep.ItemIndex = 0 then begin
   for j := 0 to maxpoints-1 do begin
    v[j,1] := (v[j-1,1]+v[j,1]+v[j+1,1])/ 3.0;
    v[j,2] := (v[j-1,2]+v[j,2]+v[j+1,2])/ 3.0;
//    v[j,1] := (v[j-2,1]+v[j-1,1]+v[j,1]+v[j+1,1]+v[j+2,1])/ 5.0;     //code option for 5 point average
//    v[j,2] := (v[j-2,2]+v[j-1,2]+v[j,2]+v[j+1,2]+v[j+2,2])/ 5.0;
   end;
  end else begin
   for j := 1 to maxpoints-2 do begin
    v[j,1] := (v[j-1,1]+v[j,1]+v[j+1,1])/ 3.0;
    v[j,2] := (v[j-1,2]+v[j,2]+v[j+1,2])/ 3.0;
   end;
  end; 
 end;

  //after processing, save the new data to the trace array
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,1);  //find a table entry
  if i <> -1 then begin
   pins[0,i,0] := form1.TraceNumber.value;
   pins[0,i,1] := form1.SweepStep.value;
   for j := 0 to maxpoints-1 do begin   // save the data to a trace array
    traces[0,i,j,1] := v[j,1];
    traces[0,i,j,2] := v[j,2];
    traces[0,i,j,3] := v[j,3];
    traces[0,i,j,4] := v[j,4];
   end;
  end;

  DoReDraw; //Plot the traces
  form1.RunSweep.enabled := true;
  //if sweep step autoincrement is on, update the count but leave the old trace on display
  if form1.checkauto.Checked = true then begin
   noupdate := true;
   if flagavg = false then form1.SweepStep.Value := form1.SweepStep.value + 1;
   if (flagavg = true) and (countavg = 8) then form1.SweepStep.Value := form1.SweepStep.value + 1;
   noupdate := false;
  end; 
end;

// Transmit command "c1"+"c2"+"c3" + integer value converted to charaters
procedure setinteger(c1 : char; c2: char; c3 : char; x : integer);
var
x0, x1, x2, x3, x4 : integer;
begin
   transmitcombyte(ord(c1));
   transmitcombyte(ord(c2));
   transmitcombyte(ord(c3));
   x0 := x;
   x4 := x0 mod 10;
   x0 := x0 div 10;
   x3 := x0 mod 10;
   x0 := x0 div 10;
   x2 := x0 mod 10;
   x0 := x0 div 10;
   x1 := x0 mod 10;
   transmitcombyte(48 + x1);
   transmitcombyte(48 + x2);
   transmitcombyte(48 + x3);
   transmitcombyte(48 + x4);
   sleep(30);
   transmitcombyte(10);
   sleep(15);
end; {setinteger}
// Process Set Collector voltage command

procedure doSetCollector;
var
 a1, a2 : integer;
begin
   form1.edit1.text := '';
   a1:= 2048 - trunc((form1.CollectorV.value) * cvcal);
   a2 := a1-round(cvzero);
   if a2 > 4095 then a2 := 4095;
   if a2 < 0 then a2 := 0;
   setinteger('D','A','0',a2);
   form1.LabelSP.caption := format('%2.3f V',[0.01*(2048-a1)/cvcal]);
   sleep(15);
   collectorflag := true;
end;

// Routine to send commands to set collector slow sweep values
procedure dosetvalues;
var
 a1, a2 : integer;
 vend : single;
begin
   form1.edit1.text := '';
   if form1.checkbox1.Checked = true then begin form1.timer7.enabled := false; sleep(300); end;
   a1:= 2048-trunc(form1.CollectorStart.value*cvcal);
   if a1 < 0 then a1 := 0;
   if a1 > 4095 then a1 := 4095;
   setinteger('S','T','A',a1-round(cvzero));
   form1.LabelMPV.caption := format('%3.3f V',[0.01*(2048-a1)/cvcal]);
   a2:= 2048-trunc(form1.CollectorStep.value*cvcal);
   if a2 < 0 then a2 := 0;
   if a2 > 4095 then a2 := 4095;
   setinteger('S','T','P',a2);
   form1.LabelSPV.caption := format('%1.3f V',[0.01*(2048-a2)/cvcal]);
   vend := 0.01*(2048-a1) / cvcal + (255.0*0.01*(2048-a2)/cvcal);
   if vend > 15.0 then vend := 15.0;
   if vend < -15.0 then vend := -15.0;
   form1.labelendV.caption := format('End-V %3.2f V',[vend]);
   if collectorflag = true then doSetCollector;
   if form1.checkbox1.Checked = true then form1.timer7.enabled := true;
end; {dosetvalues}

//Clears Heightlighted buttons in wave type button string
procedure clrwavebox;
begin
 form1.BX0.visible := false;
 form1.BX1.visible := false;
 form1.BX2.visible := false;
 form1.BX3.visible := false;
 form1.BX4.visible := false;
 form1.BX5.visible := false;
 form1.BX6.visible := false;
 form1.BX7.visible := false;
 form1.BX8.visible := false;
end;

//Sends the waveform command for the selected wave type
procedure radiowaveset;
begin
 if form1.checkbox1.Checked = true then begin form1.timer7.enabled := false; sleep(delay1); end;
 clrwavebox;
 if RadioWave = 0 then begin
   kcap := 60.4*2.0*3.14159;
   form1.edit1.clear;
   cline_count := 0;
   transmitcombyte(ord('W'));
   transmitcombyte(ord('A'));
   transmitcombyte(ord('V'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(13);
   sleep(20);
   form1.labelac.caption := 'AC: Sine Wave';
   form1.BX0.visible := true;
  end;
  if RadioWave = 1 then begin
   kcap := 62.4 * 4.0;
   form1.edit1.clear;
   cline_count := 0;
   transmitcombyte(ord('W'));
   transmitcombyte(ord('A'));
   transmitcombyte(ord('V'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('1'));
   transmitcombyte(13);
   sleep(20);
   form1.labelac.caption := 'AC: Triangle Wave';
   form1.BX1.visible := true;
  end;
  if RadioWave = 2 then begin
   kcap := 60.4 * 400.0;
   form1.edit1.clear;
   cline_count := 0;
   transmitcombyte(ord('W'));
   transmitcombyte(ord('A'));
   transmitcombyte(ord('V'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('2'));
   transmitcombyte(13);
   sleep(20);
   form1.labelac.caption := 'AC: Square Wave';
   form1.BX2.visible := true;
  end;
  if RadioWave = 3 then begin
      kcap := 60.4*3.532*3.14159;
   form1.edit1.clear;
   cline_count := 0;
   transmitcombyte(ord('W'));
   transmitcombyte(ord('A'));
   transmitcombyte(ord('V'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('3'));
   transmitcombyte(13);
   sleep(20);
   form1.labelac.caption := 'AC: +Full Sine Wave';
   form1.BX3.visible := true;
  end;
  if RadioWave = 4 then begin
   kcap := 62.4 * 8.0;
   form1.edit1.clear;
   cline_count := 0;
   transmitcombyte(ord('W'));
   transmitcombyte(ord('A'));
   transmitcombyte(ord('V'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('4'));
   transmitcombyte(13);
   sleep(20);
   form1.labelac.caption := 'AC: +Triangle Wave';
   form1.BX4.visible := true;
  end;
  if RadioWave = 5 then begin
   kcap := 60.4 * 400.0;
   form1.edit1.clear;
   cline_count := 0;
   transmitcombyte(ord('W'));
   transmitcombyte(ord('A'));
   transmitcombyte(ord('V'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('5'));
   transmitcombyte(13);
   sleep(20);
   form1.labelac.caption := 'AC: +Square Wave';
   form1.BX5.visible := true;
  end;
  if RadioWave = 6 then begin
         kcap := 60.4*3.532*3.14159;
   form1.edit1.clear;
   cline_count := 0;
   transmitcombyte(ord('W'));
   transmitcombyte(ord('A'));
   transmitcombyte(ord('V'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('6'));
   transmitcombyte(13);
   sleep(20);
   form1.labelac.caption := 'AC: -Full Sine Wave';
   form1.BX6.visible := true;
  end;
  if RadioWave = 7 then begin
     kcap := 62.4 * 8.0;
   form1.edit1.clear;
   cline_count := 0;
   transmitcombyte(ord('W'));
   transmitcombyte(ord('A'));
   transmitcombyte(ord('V'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('7'));
   transmitcombyte(13);
   sleep(20);
   form1.labelac.caption := 'AC: -Triangle Wave';
   form1.BX7.visible := true;
  end;
  if RadioWave = 8 then begin
   kcap := 60.4 * 400.0;
   form1.edit1.clear;
   cline_count := 0;
   transmitcombyte(ord('W'));
   transmitcombyte(ord('A'));
   transmitcombyte(ord('V'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('8'));
   transmitcombyte(13);
   sleep(20);
   form1.labelac.caption := 'AC: -Square Wave';
   form1.BX8.visible := true;
  end;
 if form1.checkbox1.Checked = true then form1.timer7.enabled := true;
end; {radiowaveset}

// Process Set Base voltage command
procedure doSetBaseV;
var
 a1, a2 : integer;
begin
   if form1.checkbox1.Checked = true then begin form1.timer7.enabled := false; sleep(300); end;
   form1.edit1.text := '';
   a1 := 2048-trunc(form1.BaseVolts.value*bvcal);
   a2 := a1-round(bvzero);
   if a2 > 4095 then a2 := 4095;
   if a2 < 0 then a2 := 0;
   setinteger('D','A','1',a2);
   baseV := 0.01*(2048-a1)/bvcal;
   baseI := -baseV/0.047;
   form1.LabelSS.caption := format('%2.3f V',[baseV]);
   form1.LabelSG.caption := format('%3.1f uA',[baseI]);
   sleep(10);
   if form1.checkbox1.Checked = true then form1.timer7.enabled := true;
end;

// Process Set Base current command
procedure doSetBaseI;
var
 a1, a2 : integer;
begin
   if form1.checkbox1.Checked = true then begin form1.timer7.enabled := false; sleep(300); end;
   form1.edit1.text := '';
   a1 := 2048-trunc(form1.BaseuA.value*bical);
   a2 := a1+round(bizero);
   if a2 > 4095 then a2 := 4095;
   if a2 < 0 then a2 := 0;
   setinteger('D','A','1',a2);
   baseI := 0.1*(2048-a1)/bical;
   baseV := -baseI * 0.047;
   form1.LabelSG.caption := format('%3.1f uA',[baseI]);
   form1.LabelSS.caption := format('%2.3f V',[baseV]);
   sleep(10);
   if form1.checkbox1.Checked = true then form1.timer7.enabled := true;
end;

//After a power wake up, Mini_CT needs to be restored
procedure resetmodes;
begin
 radiowaveset;    //set the waveform type
 if form1.SetBaseV.enabled = true then doSetBaseV;  //set the base V/I
 if form1.SetBaseI.enabled = true then doSetBaseI;
 dosetvalues; //set the static values for the collector and slow sweep
end;

//Routine to test for serial input data and to sort out the incomming bytes
procedure checkforbyte;
var
 ctest : char;
 j, i, ic : integer;
 tpv,tpi,tsv,tsi,tgv,tgi, tvcal, tical : single;
begin
 j := 1;
 while (j = 1) do begin
  ic := readcombyte;
  if (ic = 136) then begin form1.RunSweep.click; exit; end; //process a foot switch press
  if (ic = 131) then  //process a power on wake up
  begin
   serialno := sntemp;
   resetmodes;
   setgain(p2temp);
   form1.caption := 'N7VK Mini Curve Tracer S/N: ' + inttostr(serialno);
   form1.RunSweep.Enabled := true;
   exit;
  end;
  if (ic = 132) then begin  serialno := sntemp; setgain(p2temp); exit; end; //process a serial number and switch setting request
  if (ic < 128) then begin p2temp := sntemp; sntemp := ic; end; //process normal data. switch and serial numbers are at the end
  //if no data is present then set j=0 to exit while loop
  if (ic = 256) then j := 0 else begin  //process block of trace sweep data
   ctest := char(ic);
   cline[cline_count] := ic;
   if form1.on1.checked = true then form1.edit1.text := form1.edit1.text + ctest; //text echo
   if (ic = 129) then begin              //129 marks end of data
     i := cline_count-(datalen*4+4)-0;   //test length of data block
     if i < 0 then begin                 //If not enough, exit data scan
            flg := false;
            form1.RunSweep.enabled := true;
            exit;
     end;
     cnt1 := 0;
     while (i < cline_count) do begin                 //make 14-bit word from two 7-bit bytes
      addata[cnt1,1] := cline[i]*128 + cline[i+1] ;   //voltage data
      addata[cnt1,2] := cline[i+2]*128 + cline[i+3];  //current data
      i := i + 4;
      cnt1 := cnt1+1;
     end;
     if (cnt1 >= maxpoints+1) and (flg = false) then begin  //was a sweep, so correct data
      fixdata;
      stime := now-stime;
      //form1.caption := floattostr(86400*stime)  ;   //used for loop time testing
     end;
     if ( cnt1 >= maxpoints+1) and flg then begin     //if data is greater than 257, then data is DC
     if calnum = 1 then begin                 //cal for collector volt measure zero
       tvcal := 0.0;
       for j := 0 to maxpoints-1 do begin
        tvcal := tvcal+addata[j,1];
       end;
       zpv := tvcal / maxpoints;
       Voff[form1.RadioVG.ItemIndex] := zpv;
     end;
     if calnum = 2 then begin                //cal for collector volt measure
      tvcal := 0.0;
      for j := 0 to maxpoints-1 do begin
       tvcal := tvcal+addata[j,1] - zpv;
      end;
      tvcal := tvcal / maxpoints;
      calpv := calvolts / (tvcal + 0.1);
      Vcal[form1.RadioVG.ItemIndex] := calpv;
    end;
    if calnum = 3 then begin                //cal for collector current measure zero
     tical := 0.0;
       for j := 0 to maxpoints-1 do begin
        tical := tical+addata[j,2];
      end;
     zpi :=  tical / maxpoints;
     Ioff[form1.RadioSR.ItemIndex] := zpi;
    end;
    if calnum = 4 then begin                //cal for collector current measure
     tical := 0.0;
     for j := 0 to maxpoints-1 do begin
       tical := tical+addata[j,2] - zpi;
     end;
     tical := tical / maxpoints;
     calpi := 10.0 / ((tical + 0.1) * calohms) ;
     Ical[form1.RadioSR.ItemIndex] := calpi;
    end;
    if calnum = 5 then begin
     tvcal := 0.0;
     for j := 0 to maxpoints-1 do begin
       tvcal := tvcal + addata[j,1] - zpv;
     end;
     cvzero :=  -100.0 * tvcal * calpv * cvcal / maxpoints;
     doSetCollector;
    end;
    if calnum = 6 then begin
     tvcal := 0.0;
     for j := 0 to maxpoints-1 do begin
       tvcal := tvcal + addata[j,1] - zpv;
     end;
     cvcal := 10.0 / (0.000001 + tvcal * calpv / maxpoints);
     doSetCollector;
    end;
    if calnum = 7 then begin
     tvcal := 0.0;
     for j := 0 to maxpoints-1 do begin
       tvcal := tvcal + addata[j,1] - zpv;
     end;
     bvzero :=  -100.0 * tvcal * calpv * bvcal / maxpoints;
     doSetBaseV;
    end;
    if calnum = 8 then begin
     tvcal := 0.0;
     for j := 0 to maxpoints-1 do begin
       tvcal := tvcal + addata[j,1] - zpv;
     end;
     bvcal := (0.000001 + tvcal * calpv / maxpoints);
     bvcal := 2.0 * 9.0 / (0.000001 + tvcal * calpv / maxpoints);
     doSetBaseV;
    end;
    if calnum = 9 then begin
     tical := 0.0;
     for j := 0 to maxpoints-1 do begin
       tical := tical + addata[j,2] - zpi;
     end;
     bizero :=  1.0e6 * tical * calpi / maxpoints;
     bizero := -bvzero;
     doSetBaseI;
    end;
    if calnum = 10 then begin
     tical := 0.0;
     for j := 0 to maxpoints-1 do begin
       tical := tical + addata[j,2] - zpi;
     end;
     bical := 190.0e-6 / (0.000001 + tical * calpi / maxpoints);
     doSetBaseI;
    end;
    //reset calibration flag
    calnum := 0;
    // Extract Switch Settings
     switchpos := round(addata[maxpoints,1]);
     setgain(switchpos);
     tpv := 0;
     tpi := 0;
     for i := 0 to maxpoints-1 do begin
      tpv := tpv + (addata[i,1]-zpv)* calpv;
      tpi := tpi + (addata[i,2]-zpi)* calpi;
     end;
      tpv := tpv / maxpoints;
      tpi := tpi / maxpoints;
      tsv := (addata[0,3]-zpv)* calpv;
      tsi := (addata[0,4]-zpi)* calpi;
      tgv := 0.0;
      tgi := 0.0;

      form1.labelch0.caption := format('%2.3f',[tpv]);
      form1.labelch1.caption := format('%4.2f',[1e6*tpi]);
      form1.labelch2.caption := 'Samples = ' + inttostr(datalen);
      form1.labelch3.caption := format('%2.3f',[baseV]);
      form1.labelch4.caption := format('%3.1f',[baseI]);

      maxpoints := 256;
      datalen := 256;
      flg := false;
      form1.RunSweep.enabled := true;
     end;
   end;
   cline_count := cline_count+1;
   If (cline_count > 8191) then cline_count := 8191;
//   form1.caption := inttostr(cline_count);
  end;
 end;
end; {checkforbyte}


//Send the get serial number command
procedure doserialnum;
begin
   transmitcombyte(ord('S'));
   transmitcombyte(ord('E'));
   transmitcombyte(ord('R'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(13);
   sleep(15);
   checkforbyte;
end;

// Loads offset and calibration data for the current serial number of Mini_CT
procedure loadcalibrationdata;
var
  F: TextFile;
  x : single;
begin
   Try
    Form1.Edit1.Text := 'CalLut_' + inttostr(serialno) + '.Dat Calibration File Loaded';
    AssignFile(F, 'callut_' + inttostr(serialno) + '.dat');
    ReSet(F);
    Read(F, x);
    Vcal[0] := x;
    Read(F, Vcal[1]);
    Read(F, Voff[0]);
    Read(F, Voff[1]);
    Read(F, Ical[0]);
    Read(F, Ical[1]);
    Read(F, Ical[2]);
    Read(F, Ical[3]);
    Read(F, Ical[4]);
    Read(F, Ioff[0]);
    Read(F, Ioff[1]);
    Read(F, Ioff[2]);
    Read(F, Ioff[3]);
    Read(F, Ioff[4]);
    read(F, cvzero);
    read(F, cvcal);
    read(F, bvzero);
    read(F, bvcal);
    read(F, bizero);
    read(F, bical);
    read(F, resistor[0]);
    read(F, resistor[1]);
    read(F, resistor[2]);
    read(F, resistor[3]);
    try
     read(F, resistor[4]);
    except
     resistor[4] := 1.0e6;
    end;
    closefile(F);
    Form1.NoCal.Visible := false;
   Except
    Form1.Edit1.Text := 'Calibration file did not load';
   End;
end; {loadcalibrationdata}

//Reset the system on program start
procedure dostartload;
begin
   doserialnum;            //Get the Mini_CT serial number
   loadcalibrationdata;    //Load the calibration file for the serial number
   radiowaveset;           //Initialize AC waverform type
   doRunSweep;             //Run a sweep
   form1.timer6.enabled := true; //Turn on timer to poll Mini_CT for switch settings
end;

//When the form starts up, all variables must be initiallized
procedure TForm1.FormCreate(Sender: TObject);
var
 i, ic, j, k : integer;
begin
 serialno := 0;     //Mini_CT serial number is zero until data is read from serial port
 delay1 := 100;     //Timer delay for continous (Live) AC Sweep
 delay2 := 200;     //Timer delay for continous (Live) Slow Sweep
 collectorflag := false;  //On wake up, the system needs to know if DC value for collector needs restoring
 fname := 'LogNull'; //Script file default file name for data output
 logfilename(9);     //Sets default name
 for i := 1 to 20 do begin //Search serial port numbers for Mini_CT
  cstats := opencomport(i); //open up serial port-i
 if cstats <> 0 then begin
   transmitcombyte(13);     //Clear input buffer on Mini_CT and send for switch data
   transmitcombyte(13);
   transmitcombyte(ord('S'));
   transmitcombyte(ord('W'));
   transmitcombyte(ord('S'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(13);
   sleep(800);                //wait for return of data
   for j := 1 to 20 do begin  //Scan serial data for serial number
    ic := readcombyte;
    //form1.memo1.Lines.Add(inttostr(ic));
    if (ic = 132) then begin serialno := k; break; end;
    if (ic < 128) then k := ic;
   end;
  end; 
  if serialno <> 0 then break;
  closecomport;
 end;

 //Mark port selection with port number and put a check by port number
 if i < 21 then begin
  form1.comport1.caption := 'Com: '+inttostr(i);
  if i = 1 then form1.com11.checked := true;
  if i = 2 then form1.com21.checked := true;
  if i = 3 then form1.com31.checked := true;
  if i = 4 then form1.com41.checked := true;
  if i = 5 then form1.com51.checked := true;
  if i = 6 then form1.com61.checked := true;
  if i = 7 then form1.com71.checked := true;
  if i = 8 then form1.com81.checked := true;
  if i = 9 then form1.com91.checked := true;
  if i = 10 then form1.com101.checked := true;
  if i = 11 then form1.com111.checked := true;
  if i = 12 then form1.com121.checked := true;
  if i = 13 then form1.com131.checked := true;
  if i = 14 then form1.com141.checked := true;
  if i = 15 then form1.com151.checked := true;
  if i = 16 then form1.com161.checked := true;
  if i = 17 then form1.com171.checked := true;
  if i = 18 then form1.com181.checked := true;
  if i = 19 then form1.com191.checked := true;
  if i = 20 then form1.com201.checked := true;
 end;

 if i = 21 then form1.comport1.caption := 'Com: XX'; //dos equis if port not found
 cnt1 := 0;    //set the data return character counter to zero
 foot := 0;    //se the foot switch state to zero
 maxpoints := 256; //Each curve is 256 voltage and current points

 flg := false;      //if true, DC data is expected. if false, sweep data is expected
 flagavg := false;  //flag to enable averaging of data
 baseV := 0.0;      //zero base volts setting
 baseI := 0.0;      //zero base current setting
 cursortrace := 1;  //set the cursor to show on trace-1
 noupdate := false; //prevents a screen refres when changing sweep step and trace numbers

 //Set calibration value constants
 calpv := 0.931*30.0/16384.0;
 calpi := 0.9514*0.00066*30.0/16384.0;
 calsv := calpv;
 calsi := calpi;
 calgv := calpv/6.0;
 calgi := calpi*2.0;
 calhv := calpv;
 calhi := calpi*0.2;
 //Set calibration offset constants
 zpv := 8124.5;
 zpi := 8126.0;
 zsv := 0;
 zsi := 0;
 zgv := 2;
 zgi := 4;
 zhv := 0;
 zhi := 0;
 Vcal[0] := calpv;
 Vcal[1] := calpv/6.0;
 Voff[0] := zpv;
 Voff[1] := zpv;
 Ical[0] := calpi * 3.0;
 Ical[1] := calpi * 1.0;
 Ical[2] := calpi * 1.5/15.0 ;
 Ical[3] := calpi * 1.5/100.0;
 Ical[4] := calpi * 1.5/1000.0;
 Ioff[0] := zpi;
 Ioff[1] := zpi;
 Ioff[2] := zpi;
 Ioff[3] := zpi;
 Ioff[4] := zpi;
 resistor[0] := 506;
 resistor[1] := 1505;
 resistor[2] := 14800;
 resistor[3] := 100600;
 resistor[4] := 1.0e6;
 calnum := 0;
 calvolts := 10.0;
 calohms := resistor[1];
 flagcal := false;
 //Set initial sense resistor values
 myimage := TBitmap.Create;  //Define the image for plotting data
 myimage.Height := 513;
 myimage.Width := 513;
 myimage.PixelFormat := pf24bit; //Use true RGB for the image

 vperdiv := 5.0; //Initiallize the Volts/Current per division values
 iperdiv := 5.0;
 vspin := 8;
 ispin := 11;
 vpd[9] := 10.0; ipd[11] := 5.0;
 vpd[8] := 5.0; ipd[10] := 2.0;
 vpd[7] := 2.0; ipd[9] := 1.0;
 vpd[6] := 1.0; ipd[8] := 0.5;
 vpd[5] := 0.5; ipd[7] := 0.2;
 vpd[4] := 0.2; ipd[6] := 0.1;
 vpd[3] := 0.1; ipd[5] := 0.05;
 vpd[2] := 0.05; ipd[4] := 0.02;
 vpd[1] := 0.02; ipd[3] := 0.01;
 vpd[0] := 0.01; ipd[2] := 0.005;
 vpd[0] := 0.01; ipd[1] := 0.002;
 ipd[0] := 0.001;
 cmpp := 1;                      //Initiallize compair pin indices
 cmpm := 1;
 cmpi := 4096;
 kcap := 60.4*2.0*3.14159;
 cvzero := 23.0;
 cvcal := 1.3889;
 bvzero := 48.0;
 bvcal := 2.099;
 bizero := -48;
 bical := -1.024;
 radiowave := 0;
 Rleads := 0.0;
 Cleads := 0.0;
 setthreadpriority(getcurrentthread, THREAD_PRIORITY_HIGHEST); //Give this program more priority
 form1.listbox1.ItemIndex := 0;
 makescript := false;
 form1.tmrchkstatus.Enabled := true;
 baseat := 128;
 dostartload;
 //form1.timer6.enabled := true;
// setthreadpriority(getcurrentthread, THREAD_PRIORITY_HIGHEST); //Give this program more priority
end; {formcreate}

//Menu exit item
procedure TForm1.mnuExitClick(Sender: TObject);
begin
 close;
end;

//Timer1 is used for starting an acquire of the next curve data (live) continuous on
procedure TForm1.Timer1Timer(Sender: TObject);
begin
 RunSweep.Click; //start the read
end;


//On exit close serial acquisition and program
procedure TForm1.FomrDestroy(Sender: TObject);
begin
   closecomport;
   Close;
end;

//Changes the volts per division when the spin button down is clicked
procedure TForm1.SpinVoltsDownClick(Sender: TObject);
begin
 vspin := vspin - 1;                    //decrement button value
 if vspin < 0 then vspin := 0;          //check limits
 vperdiv := vpd[vspin];                 //look up new value
 labelvpd.caption := format('%1.2f',[vperdiv]) + 'V/Div.';  //Update label on form
 DoReDraw;
end;

//Changes the volts per division when the spin button up is clicked
procedure TForm1.SpinButton3donwclick(Sender: TObject);
begin
 vspin := vspin + 1;
 if vspin > 9 then vspin := 9;
 vperdiv := vpd[vspin];
 labelvpd.caption := format('%1.2f',[vperdiv]) + 'V/Div.';
 DoReDraw;
end;

//Changes the amps per division when the spin button down is clicked
procedure TForm1.SpinMaDownClick(Sender: TObject);
begin
 ispin := ispin - 1;
 if ispin < 0 then ispin := 0;
 iperdiv := ipd[ispin];
 labelipd.caption := format('%1.3f',[iperdiv]) + 'mA/Div.';
 DoReDraw;
end;

//Changes the amps per division when the spin button up is clicked
procedure TForm1.SpinMaUpClick(Sender: TObject);
begin
 ispin := ispin + 1;
 if ispin > 11 then ispin := 11;
 iperdiv := ipd[ispin];
 labelipd.caption := format('%1.3f',[iperdiv]) + 'mA/Div.';
 DoReDraw;
end;

// Loads trace data pointed to by Sweep Step and Trace Number into the display array V[]
// New trace data is drawn on the display
procedure loadtrace;
var
 i,j : integer;
// ih : integer;
begin
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
   for j := 0 to maxpoints-1 do begin   // save the data to a trace array
    v[j,1] := traces[0,i,j,1];
    v[j,2] := traces[0,i,j,2];
    v[j,3] := traces[0,i,j,3];
    v[j,4] := traces[0,i,j,4];
   end;
   DoReDraw;
//   ih := hash(0,form1.TraceNumber.value, 1, 0);  ////??find a table entry
end;

//Load part trace if cm=0 or compare trace if cm=1 using file name fn
Procedure FileLoadTraces(cm : integer; fn : string);
var
  F: TextFile; //The holder for the file name
  s2 : string;
  i, j, rl : integer;
  x : single;
begin
  try
//    form1.caption := fn;
    AssignFile(F, fn);
    ReSet(F);
    for j := 0 to 4095 do begin            //Clear out the trace memory
     pins[cm,j,0] := 0;
     pins[cm,j,1] := 0;
    end;
    Readln(F,s2);                   //Read the first line for the tube type serial number
    if cm = 0 then form1.tubetype.text := s2 else comparename := s2;
    Readln(F,rl);
    i := 0;                               //Set the trace counter to zero
    while (i <= 4095) and (seekeof(F) <> true) do begin  //Read traces until end of file or more than 4096 traces have been read
     Read(F,j);                                          //Read the tube sample number
     if j >= 32000 then break;
     pins[cm,i,0] := j;
     Read(F,j);                                          //Read the sweep number
     pins[cm,i,1] := j;
     for j := 0 to rl-1 do begin  //Read voltage and current values for sweep
      Read(F,x);
      traces[cm,i,j,1] := x;    //collector voltage
      Read(F,x);
      traces[cm,i,j,2] := x;    //collector current
      Read(F,x);
      traces[cm,i,j,3] := x;    //base voltage
      Read(F,x);
      traces[cm,i,j,4] := x;    //base current
     end;
     i := i + 1;                                       //Increment the trace counter
     form1.Caption := inttostr(i);
    end;
  finally                                             //Close the file
    CloseFile(F);
  end;
 loadtrace;                                           //Plot data for the current pin numbers
end; {FileLoadTraces}

//Process Load (curve data) under the File drop down menu
procedure TForm1.Load1Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt := '*.txt';
  SaveDialog1.DefaultExt := '*.txt';
  OpenDialog1.FilterIndex := 1;
  OpenDialog1.Filename := ChangeFileExt(OpenDialog1.FileName, '.txt');
 if OpenDialog1.Execute then begin          //Open the file dialog and let the user pick a file name
  SaveDialog1.Filename := OpenDialog1.FileName;
  FileLoadTraces(0,SaveDialog1.Filename); //Load the part trace
 end;
end; {load1click}

//Copy the curve trace image to the clip board for use in pasting (word, photo edti, etc)
procedure TForm1.Copy2Click(Sender: TObject);
begin
  Clipboard.Assign(myimage);
end;

//Make center of plot the zero point
procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  UpdownIO.position := 0;
  Ioffset := -UpDownIO.position ;
  LabelIO.caption := 'IO ' + inttostr(updownio.position) + ' Div.';
  UpDownVO.position := 0;
  Voffset := -UpDownVO.position;
  LabelVO.caption := 'VO ' + inttostr(updownvo.position) + ' Div.';
  DoReDraw;
end;

//Every 2ms, we are looking for serial data in the com buffer (data polling)
procedure TForm1.tmrchkstatusTimer(Sender: TObject);
begin
 checkforbyte;
end;

// Clear all of the pin indices, no trace data is deleted
procedure cleardata;
var
 j, m, i : integer;
begin
    for j := 0 to 4095 do begin
     pins[0,j,0] := 0;
     pins[0,j,1] := 0;
    end;
 for i := -1 to 4096 do begin
  for m := 0 to 512 do begin
     traces[0,i,m,1] := 0.0;
     traces[0,i,m,2] := 0.0;
     traces[0,i,m,3] := 0.0;
     traces[0,i,m,4] := 0.0;
  end;
 end;
  for i := 0 to maxpoints-1 do begin      //Clear left over data
   v[i,1] := 0;
   v[i,2] := 0;
   v[i,3] := 0;
   v[i,4] := 0;
  end;
end;

// Menu Item Clear: clears curve tracer memory
procedure TForm1.Yes1Click(Sender: TObject);
begin
 cleardata;
 DoReDraw;
end;

procedure TForm1.CurrentTrace1Click(Sender: TObject);
var
 i: integer;
begin
 i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
 pins[0,i,0] := 0;
 pins[0,i,1] := 0;
 DoRedraw;
end;

// Process Menu Sound on and off
procedure TForm1.On1Click(Sender: TObject);
begin
 form1.on1.checked :=  form1.on1.checked xor true;
 if form1.on1.checked = true then begin
   form1.label8.visible := true;
   form1.Edit1.visible := true;
 end
 else begin
   form1.label8.visible := false;
   form1.Edit1.visible := false;
 end;
end;

//Process display voltage offset spinner change
procedure TForm1.UpDownVOClick(Sender: TObject; Button: TUDBtnType);
begin
  Voffset := -UpDownVO.position;
  LabelVO.caption := 'VO ' + inttostr(updownvo.position) + ' Div.';
  DoReDraw;
end;

//Process display current offset spinner change
procedure TForm1.UpDownIOClick(Sender: TObject; Button: TUDBtnType);
begin
  Ioffset := -UpDownIO.position ;
  LabelIO.caption := 'IO ' + inttostr(updownio.position) + ' Div.';
  DoReDraw;
end;

// Set Sweep Values button processing
procedure TForm1.SetvaluesClick(Sender: TObject);
begin
   if makescript = true then begin
    pastescript('startcollector '+inttostr(form1.collectorstart.value));
    pastescript('stepcollector '+inttostr(form1.collectorstep.value));
    pastescript('setsweepvalues');
    exit;
   end;
   dosetvalues;
end;

// Send command to peform a DC voltage measure
procedure doReadVoltages(np : integer);
begin
   form1.edit1.clear;
   cnt1 := 0;
   if np > 256 then np := 250;
   if np < 1 then np := 1;
   datalen := np;
   maxpoints := np;
   cline_count := 0;
   flg := true;
   setinteger('D','C','M',np);
   sleep(10)
end;

// Read Voltages button processing
procedure TForm1.ReadVoltagesClick(Sender: TObject);
begin
 if makescript = true then begin pastescript('readvoltages'); exit; end;
 doReadVoltages(256);
end;

// Set Collector voltage button processing
procedure TForm1.SetCollectorClick(Sender: TObject);
begin
   if makescript = true then begin pastescript('setcollector '+inttostr(form1.collectorV.value)); exit; end;
   doSetCollector;
end;

// Base Volage button press
procedure TForm1.SetBaseVClick(Sender: TObject);
begin
 if makescript = true then begin pastescript('setbasev '+inttostr(form1.basevolts.value)); exit; end;
 doSetBaseV;
end;

// Set Base I button press
procedure TForm1.SetBaseIClick(Sender: TObject);
begin
 if makescript = true then begin pastescript('setbasei '+inttostr(form1.baseuA.value)); exit; end;
 doSetBaseI;
end;

// Process a change to the Sweep Step number
procedure TForm1.SweepStepChange(Sender: TObject);
begin
 if noupdate = false then loadtrace;  //With auto increment on, leave previous trace on display
end;

// Process a change to the Trace Number
procedure TForm1.TraceNumberChange(Sender: TObject);
begin
 loadtrace;
end;

// Process Menu item Load Cal
procedure TForm1.Load2Click(Sender: TObject);
begin
 loadcalibrationdata;
end;

// Average 8 curve sweeps
procedure DoAvg8;
var
 w, i, k, m : integer;
begin
  form1.Avg8.Enabled := false;
  countavg := 1;
  flagavg := true;
  k := form1.spinmsteps.Value;
  form1.spinmsteps.value := 1;
  m := form1.radiocompare.ItemIndex;
  form1.radiocompare.ItemIndex := 0;

  for i := 1 to 8 do begin
   countavg := i;
   flagavg := true;
   DoRunSweep;
   for w := 1 to 20 do begin
    sleep(25);
    checkforbyte;
    if form1.RunSweep.enabled = true then break;
   end;
  end;

  form1.Avg8.enabled := true;
  flagavg := false;
  form1.spinmsteps.Value := k;
  form1.radiocompare.ItemIndex := m;
end; {doavg8}

// Process Avg8 button press
procedure TForm1.Avg8Click(Sender: TObject);
begin
 if makescript = true then begin pastescript('avg8'); exit; end;
 DoAvg8;
end;

// Menu item Multi Plot: Brings up multi plot form
procedure TForm1.MultiPlot1Click(Sender: TObject);
var
 j : integer;
begin
 form2.ListBox1.Clear;
 form2.ListBox1.MultiSelect := true;
 form2.show;
 j := 0;
 while pins[0,j,0] <> 0 do begin
  form2.ListBox1.items.add(format('%3d',[pins[0,j,0]]) + ' : ' + format('%3d',[pins[0,j,1]]));
  j := j + 1;
 end;
end;

// Processes display command sent from multi plot form
// All selected traces are displayed simultaneously
procedure TForm1.buttonmultiClick(Sender: TObject);
var
 i, j : integer;
begin
  flagmulti := false;
   for i := 0 to maxpoints-1 do begin
    v[i,1] := 0;
    v[i,2] := 0;
    v[i,3] := 0;
    v[i,4] := 0;
   end;

 if form1.radiocompare.ItemIndex = 1 then begin
  flagmulti := true;
  plotcolor := $00a7;
   i := hash(0,form1.spinNC.value,form1.spinPC.value,0);  //find a table entry
    for j := 0 to maxpoints-1 do begin   // save the data to a trace array
     v[j,1] := traces[0,i,j,1];
     v[j,2] := traces[0,i,j,2];
     v[j,3] := traces[0,i,j,3];
     v[j,4] := traces[0,i,j,4];
    end;
 end;

 if form1.radiocompare.ItemIndex = 2 then begin
  flagmulti := true;
  plotcolor := $00a7;
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
  for j := 0 to maxpoints-1 do begin   // save the data to a trace array
     v[j,1] := traces[1,i,j,1];
     v[j,2] := traces[1,i,j,2];
     v[j,3] := traces[1,i,j,3];
     v[j,4] := traces[1,i,j,4];
  end;
  plotdata;
 end;

 plotcolor := $00a700;

 flagmulti := true;
 for i := 1 to form2.listbox1.items.count do begin
  if form2.listbox1.Selected[i-1] = true then begin
    for j := 0 to maxpoints-1 do begin
    v[j,1] := traces[0,i-1,j,1];
    v[j,2] := traces[0,i-1,j,2];
    v[j,3] := traces[0,i-1,j,3];
    v[j,4] := traces[0,i-1,j,4];
   end;
  plotdata;
 end;
 end;
 flagmulti := false;
 paintdib;
end;

// Process mouse click on dispaly graph: Converts mouse x-y data to voltage and current
procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 kv, ki : single;
begin
 if x > 513 then exit;
 if y > 513 then exit;
 kv := vperdiv / 51.2;    //set scale factors for plotting
 ki := iperdiv/ 51.2;
 if plottype.ItemIndex = 0 then begin
  form1.labelv.caption := format('%2.3f',[(x -256 + (Voffset*51.2)) * kv])+'V';
  form1.labeli.caption := format('%2.5f',[(256 - y + (Ioffset*51.2)) * ki])+'mA';
  mousei := (256 - y + (Ioffset*51.2)) * ki;
  mousev := (x - 256 + (Voffset*51.2)) * kv;
 end;
 if plottype.ItemIndex = 1 then begin
  form1.labelv.caption := format('%2.3f',[(256 -y + (Voffset*51.2)) * kv])+'V';
  form1.labeli.caption := format('%2.5f',[(256 - y + (Ioffset*51.2)) * ki])+'mA';
  mousei := (256 - y + (Ioffset*51.2)) * ki;
  mousev := (256 -y + (Voffset*51.2)) * kv;
 end;
  form1.memo2.Lines.Add(format('%2.3f',[mousev])+format(' %2.6f',[mousei/1000.0])+format(' %2.2f',[mousegv]));
end;

// Transmits command string cmds + integer i4 converted to a 4 byte string
procedure transmitcommand(cmds : string ; i4 : integer);
var
 j1, j2, j3, j4 : integer;
begin
   transmitcombyte(ord(cmds[1]));
   transmitcombyte(ord(cmds[2]));
   transmitcombyte(ord(cmds[3]));
   j4 := i4 mod 10;
   i4 := i4 div 10;
   j3 := i4 mod 10;
   i4 := i4 div 10;
   j2 := i4 mod 10;
   i4 := i4 div 10;
   j1 := i4 mod 10;
   i4 := i4 div 10;
   transmitcombyte(j1+ord('0'));
   transmitcombyte(j2+ord('0'));
   transmitcombyte(j3+ord('0'));
   transmitcombyte(j4+ord('0'));
   transmitcombyte(13);
   sleep(5);
end;

// Sends command to set a custom wave data point value = cmd1
procedure doscw(cmd1 : integer);
begin
 transmitcommand('SCW',cmd1);
end;

// Sends command to set port P3 to value cmd1
procedure dosetp3(cmd1 : integer);
begin
 cmd1 := cmd1 and 255;
 transmitcommand('SP3',cmd1);
end;

// Sends a sequence of commands to program the wave generator for random numbers
procedure dorandom;
var
 i : integer;
begin
transmitcommand('SCW',8192);
 for i := 0 to 255 do begin
  transmitcommand('SCW', random(4095));
 end;
end;

// Sends a sequence of commands to program the wave generator for 960Hz Sine Wave
procedure dosin16x;
var
 i : integer;
begin
 transmitcommand('SCW',8192);
 for i := 0 to 15 do begin
  transmitcommand('SCW', 2048);
  transmitcommand('SCW', 1265);
  transmitcommand('SCW', 601);
  transmitcommand('SCW', 157);
  transmitcommand('SCW', 1);
  transmitcommand('SCW', 157);
  transmitcommand('SCW', 601);
  transmitcommand('SCW', 1265);
  transmitcommand('SCW', 2048);
  transmitcommand('SCW', 2831);
  transmitcommand('SCW', 3495);
  transmitcommand('SCW', 3939);
  transmitcommand('SCW', 4095);
  transmitcommand('SCW', 3939);
  transmitcommand('SCW', 3495);
  transmitcommand('SCW', 2831);
 end;
end;

// Resets script variables and turns off the script timer5
procedure dostopscript;
begin
 form1.RunSweep.enabled := true;
 form1.timer5.enabled := false;
 scriptcount := -1;
 waitcount := 0;
 forcount := 0;
 foricount := 0;
 forpos := 256;
 foripos := 256;
 looppos := 256;
 form1.timer6.enabled := true;
 singlepass := false;
end; {dostopscript}

// Menu Script Control Stop: Stopping a script can not be on the form. It is unreliable there
procedure TForm1.Stop2Click(Sender: TObject);
begin
 dostopscript;
end;

// Menu Data File Save Processing:
// Write: S/N, #sample points
// Write n-records for all stored traces
// Record Format:
// Sweep Step, Trace No.             ////?? add crlf
// CV[0], CI[0], BV[0], Bi[0] crlf
// CV[1], CI[1], BV[1], Bi[1] crlf
// ...
// CV[255], CI[255], BV[255], Bi[255] crlf
// End of records: 32000 Note: used as end separator to store other data
procedure savedatafile(fs : string);
var
  F: TextFile;
  i, j, jm : integer;
begin
  try
    AssignFile(F, fs);
    Rewrite(F);
    Writeln(F, form1.tubetype.text);  //write S/N from edit box
    Writeln(F, maxpoints);  //write record length
    i := 0;
    while pins[0,i,0] <> 0 do begin
     Write(F, format('%4d',[pins[0,i,0]]));              //Write the trace number index
     Write(F, ' ' + format('%4d',[pins[0,i,1]]));        //Write the sweep step number index
     for j := 0 to maxpoints-1 do begin
      jm := j;
      Write(F, ' ' + format('%2.3f',[traces[0,i,jm,1]]));  //Write the voltage to 1mV
      Write(F, ' ' + format('%0.9f',[traces[0,i,jm,2]]));  //Write the curent to 1nA
      Write(F, ' ' + format('%2.3f',[traces[0,i,jm,3]]));  //Base voltage is fixed value for now
      Write(F, ' ' + format('%0.6f',[traces[0,i,jm,4]]));  //Base current is fixed value for now
      Writeln(F, '');                                      //end the single trace data with a return
     end;
     i := i + 1;
     if i > 4095 then pins[0,i,0] := 0;                   //no more than 4095 traces
    end;
    Writeln(F, format('%3d',[32000]));  //mark end of trace data with any number greater than 32K
  finally
    CloseFile(F);
  end;
end; {savedatafile}

// Processes Timer-5 Interupts: Used for running script files
procedure TForm1.Timer5Timer(Sender: TObject);
var
 i, n, k, j, ls, m : integer;
 s, sc, sd, es, s2 : string;
 F2 : TextFile;
 px, py : single;
begin

 if formp.Visible = true then exit;
 if form1.pause2.Checked = true then exit;
 if form1.singlestep1.Checked = true then begin
  if singlepass = false then exit;
 end;
 singlepass := false;

 if waitcount > 0 then begin
  waitcount := waitcount-1;
  form1.labelwait.caption := 'Wait ' + inttostr(waitcount);
  exit;
 end;

 scriptcount := scriptcount + 1;
 if scriptcount > 512 then dostopscript;

 form1.labelLine.caption := 'line: ' + inttostr(scriptcount+1);
  k := 0;
 for j := 0 to scriptcount-1 do k := k + length(form1.memo1.Lines.strings[j]) + 2;
 s := form1.memo1.Lines.strings[scriptcount];
      Memo1.SetFocus;
      Memo1.SelStart := k;
      ls := length(s);
      if ls > 20 then ls := 20;
      Memo1.SelLength := ls;
      n := length(s);

 s := trimleft(form1.memo1.Lines.strings[scriptcount] + ' ');
 n := length(s);
 form1.labelS.caption := copy(s,1,21);
 s := lowercase(s);
 es := 'Error';
try
  i := Pos('for ', s);
  if i = 1 then begin
   forpos := scriptcount;
   es := 'Numeric Input Error';
   forcount :=  strtoint(trim(copy(s,i+4,n-i-3)));
   form1.labelNdex.caption := 'for: ' + inttostr(forcount);
   exit;
  end;

  i := Pos('fori ', s);
  if i = 1 then begin
   foripos := scriptcount;
      es := 'Numeric Input Error';
   foricount :=  strtoint(trim(copy(s,i+5,n-i-4)));
   form1.labelIdex.caption := 'fori: ' + inttostr(foricount);
   exit;
  end;

  i := pos('nexti ', s);
  if i = 1 then begin
   foricount := foricount - 1;
   form1.labelIdex.caption := 'fori: ' + inttostr(foricount);
   if foricount >= 1 then begin
    scriptcount := foripos;
    exit;
   end;
  end;

  i := pos('next ', s);
  if i = 1 then begin
   forcount := forcount - 1;
   form1.labelNdex.caption := 'for: ' + inttostr(forcount);
   if forcount >= 1 then begin
    scriptcount := forpos;
    exit;
   end;
  end;

    i := pos('loop ', s);
  if i = 1 then begin
   looppos := scriptcount;
   exit;
  end;

  i := pos('end ', s);
  if i = 1 then begin
    scriptcount := looppos;
    exit;
  end;

 i := Pos('wait ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  waitcount :=  strtoint(trim(copy(s,i+5,n-i-4)));
  exit;
 end;

  i := pos('pause ', s);
   if i = 1 then begin
    form1.Pause2.Checked := true;
    exit;
  end;

  i := Pos('runsweep ', s);
 if i = 1 then begin
  doRunSweep;
   for i := 1 to 20 do begin
    sleep(25);
    checkforbyte;
    if form1.RunSweep.enabled = true then break;
   end;
  exit;
 end;

  i := Pos('runbasev+ ', s);
 if i = 1 then begin
  doRunSweep;
   for i := 1 to 20 do begin
    sleep(25);
    checkforbyte;
    if form1.RunSweep.enabled = true then break;
   end;
  form1.SweepStep.value :=  form1.SweepStep.value + 1;
     es := 'Numeric Input Error';
  form1.BaseVolts.value := form1.BaseVolts.value + strtoint(trim(copy(s,i+10,n-i-9)));
  DoSetBaseV;
  exit;
 end;

  i := Pos('runbasei+ ', s);
 if i = 1 then begin
  doRunSweep;
   for i := 1 to 20 do begin
    sleep(25);
    checkforbyte;
    if form1.RunSweep.enabled = true then break;
   end;
  form1.SweepStep.value :=  form1.SweepStep.value + 1;
     es := 'Numeric Input Error';
  form1.Baseua.value := form1.Baseua.value + strtoint(trim(copy(s,i+10,n-i-9)));
  DoSetBaseI;
  exit;
 end;

 i := Pos('stop ', s);
 if i = 1 then begin
   dostopscript;
  exit;
 end;

  i := Pos('incsweepstep ', s);
 if i = 1 then begin
  form1.SweepStep.value :=  form1.SweepStep.value + 1;
  exit;
 end;

 i := Pos('sweepstep ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.SweepStep.value :=  strtoint(trim(copy(s,i+10,n-i-9)));
  exit;
 end;

 i := Pos('comparestep ', s);
 if i = 1 then begin
   es := 'Numeric Input Error';
  form1.spinPC.value :=  strtoint(trim(copy(s,i+12,n-i-11)));
  exit;
 end;

  i := Pos('inctraceno ', s);
 if i = 1 then begin
  form1.tracenumber.value :=  form1.tracenumber.value + 1;
  exit;
 end;

 i := Pos('traceno ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.tracenumber.value :=  strtoint(trim(copy(s,i+8,n-i-7)));
  exit;
 end;

 i := Pos('comparetrace ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.spinNC.value :=  strtoint(trim(copy(s,i+13,n-i-12)));
  exit;
 end;

 i := Pos('avg8 ', s);
 if i = 1 then begin
  form1.update;
  DoAvg8;
  exit;
 end;


 i := Pos('setcollector ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.CollectorV.value :=  strtoint(trim(copy(s,i+13,n-i-12)));
  dosetcollector;
  exit;
 end;

i := Pos('setbasev ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.BaseVolts.value :=  strtoint(trim(copy(s,i+9,n-i-8)));
  DoSetBaseV;
  exit;
 end;

 i := Pos('setbasei ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.Baseua.value :=  strtoint(trim(copy(s,i+9,n-i-8)));
  DoSetBaseI;
  exit;
 end;

 i := Pos('startcollector ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.CollectorStart.value :=  strtoint(trim(copy(s,i+15,n-i-14)));
  exit;
 end;

 i := Pos('stepcollector ', s);
 if i = 1 then begin
     es := 'Numeric Input Error';
  form1.CollectorStep.value :=  strtoint(trim(copy(s,i+14,n-i-13)));
  exit;
 end;

 i := Pos('setsweepvalues ', s);
 if i = 1 then begin
  dosetvalues;
  exit;
 end;

 i := Pos('sweeptype ', s);
 if i = 1 then begin
     es := 'Numeric Input Error';
  if  strtoint(trim(copy(s,i+10,n-i-9))) = 0 then radiosweep.ItemIndex := 0 else radiosweep.ItemIndex := 1;
  exit;
 end;

 i := Pos('compare ', s);
 if i = 1 then begin
     es := 'Numeric Input Error';
  j := strtoint(trim(copy(s,i+8,n-i-7)));
  if j <0 then j := 0;
  if j > 2 then j := 2;
  radiocompare.ItemIndex := j;
  exit;
 end;

 i := Pos('readvoltages ', s);
 if i = 1 then begin
  j :=  strtointdef(trim(copy(s,i+13,n-i-12)),256);
  DoReadVoltages(j);
  sleep((delay2 * j div 256)+2);
  checkforbyte;
  exit;
 end;

 i := Pos('addbasei ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.Baseua.value :=  form1.Baseua.value + strtoint(trim(copy(s,i+9,n-i-8)));
  DoSetBaseI;
  exit;
 end;

 i := Pos('addbasev ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
   form1.BaseVolts.value :=  form1.BaseVolts.value + strtoint(trim(copy(s,i+9,n-i-8)));
   DoSetBaseV;
  exit;
 end;

 i := Pos('addcollv ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
   form1.CollectorV.value :=  form1.CollectorV.value + strtoint(trim(copy(s,i+9,n-i-8)));
   DoSetCollector;
  exit;
 end;

 i := Pos('name ', s);
 if i = 1 then begin
  fname := trim(copy(s,i+5,n-i-4));
  exit;
 end;

 i := Pos('rem ', s);
 if i = 1 then begin
  exit;
 end;

 i := Pos('clear ', s);
 if i = 1 then begin
  cleardata;
  exit;
 end;

 i := Pos('voffset ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j := strtoint(trim(copy(s,i+8,n-i-7)));
  form1.updownvo.position :=  j;
  voffset :=   -j ;
  LabelVO.caption := 'VO ' + inttostr(updownvo.position) + ' Div.';
  DoReDraw;
  exit;
 end;

 i := Pos('ioffset ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
   j := strtoint(trim(copy(s,i+8,n-i-7)));
  form1.updownio.position :=  j;
  ioffset := -j;
  LabelIO.caption := 'IO ' + inttostr(updownio.position) + ' Div.';
  DoReDraw;
  exit;
 end;

 i := Pos('vperdiv ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  vspin :=  strtoint(trim(copy(s,i+8,n-i-7)));
  if vspin < 0 then vspin := 0;
  if vspin > 9 then vspin := 9;
  vperdiv := vpd[vspin];                 //look up new value
  labelvpd.caption := format('%1.2f',[vperdiv]) + 'V/Div.';  //Update label on form
  DoReDraw;
  exit;
 end;

 i := Pos('iperdiv ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  ispin :=  strtoint(trim(copy(s,i+8,n-i-7)));
  if ispin < 0 then ispin := 0;
  if ispin > 11 then ispin := 11;
  iperdiv := ipd[ispin];
  labelipd.caption := format('%1.3f',[iperdiv]) + 'mA/Div.';
  DoReDraw;
  exit;
 end;

 i := Pos('notodisp ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.spinmsteps.Value :=  strtoint(trim(copy(s,i+9,n-i-8)));
  exit;
 end;

  i := Pos('samplepoint ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.SamplePoint.Value :=  strtoint(trim(copy(s,i+12,n-i-11)));
  exit;
 end;

 i := Pos('value ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  form1.listbox1.ItemIndex :=  strtoint(trim(copy(s,i+6,n-i-5)));
  listboxupdate;
  exit;
 end;

  i := Pos('baseuav ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+8,n-i-7)));
  if j = 0 then begin checkgv.Checked := false; checkbasev.checked := false; end;
  if j = 1 then checkgv.Checked := true;
  if j = 2 then checkbasev.Checked := true;
  exit;
 end;

 i := Pos('baseat ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+7,n-i-6)));
  if j < 0 then j := 0;
  if j > 255 then j := 255;
  baseat := j;
  exit;
 end;

  i := Pos('autoinc ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+8,n-i-7)));
  if j = 0 then checkauto.Checked := false else checkauto.checked := true;
  exit;
 end;

  i := Pos('cursor ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+7,n-i-6)));
  if j = 0 then checkcursor.Checked := false else checkcursor.checked := true;
  exit;
 end;

   i := Pos('filteron ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+9,n-i-8)));
  if j = 0 then checkF.checked := false else checkF.checked := true;
  exit;
 end;

 i := Pos('live ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+5,n-i-4)));
  if j = 0 then checkbox1.checked := false else checkbox1.checked := true;
  exit;
 end;

 i := Pos('plottype ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+9,n-i-8)));
  if j = 0 then form1.plottype.itemindex := 0 else  form1.plottype.itemindex := 1;
  exit;
 end;

 i := Pos('mark ', s);
 if i = 1 then begin
  form1.button11.click;
  exit;
 end;

 i := Pos('wave ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+5,n-i-4)));
  if j < 0 then j := 0;
  if j > 8 then j := 8;
  radiowave := j;
  radiowaveset;
  exit;
 end;

 i := Pos('random ', s);
 if i = 1 then begin
  dorandom;
  exit;
 end;

 i := Pos('custom ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+7,n-i-6)));
  doscw(j);
  exit;
 end;

 i := Pos('sin16x ', s);
 if i = 1 then begin
  dosin16x;
  exit;
 end;


 i := Pos('setp3 ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+6,n-i-5)));
  dosetp3(j);
  exit;
 end;

 i := Pos('update ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+7,n-i-6)));
  if j = 0 then liveupdate.Checked := false else liveupdate.checked := true;
  exit;
 end;

 i := Pos('show ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+5,n-i-4)));
  if j = 0 then form1.VIperDiv1.checked := true;
  if j = 1 then form1.offsets1.checked := true;
  if j = 2 then form1.sn1.checked := true;
  if j = 3 then form1.steptrace1.checked := true;
  if j = 4 then form1.comparetrace1.checked := true;
  if j = 5 then form1.cursorVI1.checked := true;
  if j = 6 then form1.Value2.checked := true;
  exit;
 end;

 i := Pos('hide ', s);
 if i = 1 then begin
    es := 'Numeric Input Error';
  j :=  strtoint(trim(copy(s,i+5,n-i-4)));
  if j = 0 then form1.VIperDiv1.checked := false;
  if j = 1 then form1.offsets1.checked := false;
  if j = 2 then form1.sn1.checked := false;
  if j = 3 then form1.steptrace1.checked := false;
  if j = 4 then form1.comparetrace1.checked := false;
  if j = 5 then form1.cursorVI1.checked := false;
  if j = 6 then form1.Value2.checked := false;
  exit;
 end;

 i := Pos('open ', s);
 if i = 1 then begin
  sc :=  trim(trim(copy(s,i+5,n-i-4)));
  logname := '';
  if pos('n',sc) > 0 then logname := fname;
  if pos('s',sc) > 0 then begin
   if logname <> '' then logname := logname + '_';
   logname := logname+form1.tubetype.Text;
  end;
  dateseparator := '_';
  timeseparator := ';';
  if pos('t',sc) > 0 then begin
   if logname <> '' then logname := logname + '_';
   logname := logname+DateTimeToStr(Now);
  end;
  dateseparator := '/';
  timeseparator := ':';
  if logname = '' then logname := 'LogNull';
  logname := logname + '.txt';
  es := 'File Open or Name Error, ;' + logname;
  try
   AssignFile(F2, logname);
   Rewrite(F2);
  finally
   closefile(F2);
  end;
  exit;
 end;

 i := Pos('storeread ', s);
 if i = 1 then begin
   es := 'File Not Open or Save Error';
  try
   assignfile(F2, logname);
   append(F2);
   write(F2,form1.labelch0.caption + ' ');
   write(F2,form1.labelch1.caption + ' ');
   write(F2,form1.labelch3.caption + ' ');
   writeln(F2,form1.labelch4.caption);
  finally
   closefile(F2);
  end;
 exit;
 end;

 i := Pos('plotreset ', s);
 if i = 1 then begin
  pltpos := 0;
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,1);  //find a table entry
  if i <> -1 then begin
   pins[0,i,0] := form1.TraceNumber.value;
   pins[0,i,1] := form1.SweepStep.value;
   for m := 0 to 256 do begin
     traces[0,i,m,1] := 0.0;
     traces[0,i,m,2] := 0.0;
     traces[0,i,m,3] := 0.0;
     traces[0,i,m,4] := 0.0;
   end;
  end;
  doredraw;
  exit;
 end;

 i := Pos('plotbvic ', s);
 if i = 1 then begin
   es := 'Plot Read Error';
     i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
     if pltpos > 255 then pltpos := 255;
     if pltpos < 0 then pltpos := 0;
     for m := pltpos to 255 do begin
      traces[0,i,m,1] := strtofloat(form1.labelch3.caption);
      traces[0,i,m,2] := strtofloat(form1.labelch1.caption)*1.0e-6;
      traces[0,i,m,3] := 0.0;
      traces[0,i,m,4] := 0.0;
     end;
     doredraw;
     pltpos := pltpos + 1;
  exit;
 end;

 i := Pos('plotcvib ', s);
 if i = 1 then begin
   es := 'Plot Read Error';
     i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
     if pltpos > 255 then pltpos := 255;
     if pltpos < 0 then pltpos := 0;
     for m := pltpos to 255 do begin
      traces[0,i,m,1] := strtofloat(form1.labelch0.caption);
      traces[0,i,m,2] := strtofloat(form1.labelch4.caption)*1.0e-6;
      traces[0,i,m,3] := 0.0;
      traces[0,i,m,4] := 0.0;
     end;
     doredraw;
     pltpos := pltpos + 1;
  exit;
 end;

 i := Pos('plotbvcv ', s);       //undocumented plot function cv is 1ma=1v
 if i = 1 then begin
   es := 'Plot Read Error';
     i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
     if pltpos > 255 then pltpos := 255;
     if pltpos < 0 then pltpos := 0;
     px := strtofloat(form1.labelch3.caption);
     py := strtofloat(form1.labelch0.caption)*0.001;
     for m := pltpos to 255 do begin
      traces[0,i,m,1] := px;
      traces[0,i,m,2] := py;
      traces[0,i,m,3] := 0.0;
      traces[0,i,m,4] := 0.0;
     end;
     doredraw;
     pltpos := pltpos + 1;
  exit;
 end;

 i := Pos('plotcvic ', s);       //plot function collector voltage and current
 if i = 1 then begin
   es := 'Plot Read Error';
     i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
     if pltpos > 255 then pltpos := 255;
     if pltpos < 0 then pltpos := 0;
     px := strtofloat(form1.labelch0.caption);
     py := strtofloat(form1.labelch1.caption)*1e-6;
     for m := pltpos to 255 do begin
      traces[0,i,m,1] := px;
      traces[0,i,m,2] := py;
      traces[0,i,m,3] := 0.0;
      traces[0,i,m,4] := 0.0;
     end;
     doredraw;
     pltpos := pltpos + 1;
  exit;
 end;

 i := Pos('storecursor ', s);
 if i = 1 then begin
    es := 'File Not Open or Save Error';
  try
   assignfile(F2, logname);
   append(F2);
   writeln(F2,'Sweep Step: '+inttostr(form1.sweepstep.value));
   writeln(F2,'Trace Number: '+inttostr(form1.tracenumber.value));
   writeln(F2,'Sample Point: '+inttostr(form1.samplepoint.value));
   writeln(F2,form1.labelPVS.caption);
   writeln(F2,form1.labelPIS.caption);
   writeln(F2,form1.labelPP.caption);
   writeln(F2,form1.labelRefV.caption);
   writeln(F2,form1.labelrefI.caption);
   writeln(F2,form1.labelDV.caption);
   writeln(F2,form1.labelDI.caption);
  finally
   closefile(F2);
  end;
 exit;
 end;

 i := Pos('storevalue ', s);
 if i = 1 then begin
    es := 'File Not Open or Save Error';
  try
   assignfile(F2, logname);
   append(F2);
   writeln(F2,form1.labelRslope.caption);
  finally
   closefile(F2);
  end;
 exit;
 end;

 i := Pos('storetrace ', s);
 if i = 1 then begin
    es := 'File Not Open or Save Error';
   try
    assignfile(F2, logname);
    Append(F2);
    Writeln(F2, 'Trace Data:');  //write S/N
    Writeln(F2, 'file:' + logname);  //write S/N
    Writeln(F2, 'Samples:' + inttostr( maxpoints));  //write record length
    Write(F2, format('Trace: %4d',[form1.tracenumber.value]));              //Write the tube number index
    Writeln(F2, ' ' + format('Step: %4d',[form1.sweepstep.value]));        //Write the step number index
     for j := 0 to maxpoints-1 do begin
      Write(F2, ' ' + format('%2.3f',[V[j,1]]));  //Write the voltage to 1mV
      Write(F2, ' ' + format('%0.9f',[V[j,2]]));  //Write the curent to 1nA
      Write(F2, ' ' + format('%2.3f',[V[j,3]]));  //Base voltage is fixed value for now
      Write(F2, ' ' + format('%0.6f',[V[j,4]]));  //Base current is fixed value for now
      Writeln(F2, '');                            //end data point with a return
     end;
   finally
     closefile(F2);
   end;
  exit;
 end;

 i := Pos('saveimage ', s);
 if i = 1 then begin
  sc :=  trim(trim(copy(s,i+10,n-i-9)));
  s2 := '';
  if pos('n',sc) > 0 then s2 := fname;
  if pos('s',sc) > 0 then begin
   if s2 <> '' then s2 := s2 + '_';
   s2 := s2 + form1.tubetype.Text;
  end;
  dateseparator := '_';
  timeseparator := ';';
  if pos('t',sc) > 0 then begin
   if s2 <> '' then s2 := s2 + '_';
   s2 := s2+DateTimeToStr(Now);
  end;
  dateseparator := '/';
  timeseparator := ':';
  if s2 = '' then s2 := 'ImageNull';
  es := 'Image Save or Name Error, ;' + s2;
  try
   myimage.SaveToFile(ChangeFileExt(s2,'.bmp'));
  finally
  end;
   exit;
 end;

  i := Pos('savefile ', s);
 if i = 1 then begin
  sc :=  trim(trim(copy(s,i+9,n-i-8)));
  s2 := '';
  if pos('n',sc) > 0 then s2 := fname;
  if pos('s',sc) > 0 then begin
   if s2 <> '' then s2 := s2 + '_';
   s2 := s2 + form1.tubetype.Text;
  end;
  dateseparator := '_';
  timeseparator := ';';
  if pos('t',sc) > 0 then begin
   if s2 <> '' then s2 := s2 + '_';
   s2 := s2+DateTimeToStr(Now);
  end;
  dateseparator := '/';
  timeseparator := ':';
  if s2 = '' then s2 := 'ImageNull';
  es := 'File Save or Name Error, ;' + s2;
  try
   savedatafile(ChangeFileExt(s2,'.txt'));
  finally
  end;
   exit;
 end;

 i := Pos('storerem ', s);
 if i = 1 then begin
  sd := trim(copy(s,i+9,n-i-8));
   es := 'File Not Open or Save Error';
  try
   assignfile(F2, logname);
   append(F2);
   writeln(F2,sd);
  finally
   closefile(F2);
  end;
  exit;
 end;

 i := Pos('loadimage ', s);
 if i = 1 then begin
   sc :=  trim(trim(copy(s,i+10,n-i-9)));
   sc := ChangeFileExt(sc, '.bmp');
   es := 'File Not Found';
   try
    MyImage.LoadFromFile(sc);
    PaintDib;
   finally
   end;
   exit;
  end;

 i := Pos('loadfile ', s);
 if i = 1 then begin
   sc :=  trim(trim(copy(s,i+9,n-i-8)));
   sc := ChangeFileExt(sc, '.txt');
   es := 'File Not Found';
   try
    FileLoadTraces(0,sc);
   finally
   end;
   exit;
  end;

 i := Pos('popup ', s);
 if i = 1 then begin
   sc :=  uppercase(trim(trim(copy(s,i+6,n-i-5))));
   es := 'Unknown Error';
   try
    formp.show;
    formp.Label1.caption := sc;
   finally
   end;
    exit;
  end;

 except
  form1.pause2.Checked := true;
  MessageDlg(es, mtError, [mbOk], 0);
  exit;
 end;
 form1.labelS.caption := 'No Code';
end; {timer5}

// Process Run Script button press
procedure TForm1.ButtonRunScriptClick(Sender: TObject);
begin
 if form1.pause2.Checked = true then begin form1.pause2.checked := false; exit; end;
 if (form1.SingleStep1.checked = true) and (form1.timer5.enabled = true) then begin singlepass := true; exit; end;
 scriptcount := -1;
 waitcount := 0;
 forcount := 0;
 forpos := 256;
 foricount := 0;
 foripos := 256;
 looppos := 256;
 singlepass := true;
 pltpos := 0;
 timer6.enabled := false;
 timer5.enabled := true;
end;

// Saves the script file contained in the script file memo pad
procedure dosavescript;
begin
  form1.SaveDialog1.DefaultExt := '*.scr';
  form1.OpenDialog1.DefaultExt := '*.scr';
  form1.SaveDialog1.FilterIndex := 2;
  form1.SaveDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.scr');
  if form1.SaveDialog1.Execute then begin
   form1.OpenDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.scr');
  with Form1.Memo1.Lines do
   begin
    SaveToFile(ChangeFileExt(form1.SaveDialog1.FileName, '.scr'));
   end;
  end;
end;

// Process Menu item Scipt File Save
procedure TForm1.Save2Click(Sender: TObject);
begin
 dosavescript;
end;

// Loads a script file into the scipt memo pad
procedure doloadscript;
var
  F: TextFile;
  S: string;
begin
  form1.SaveDialog1.DefaultExt := '*.scr';
  form1.OpenDialog1.DefaultExt := '*.scr';
  form1.OpenDialog1.FilterIndex := 2;
  form1.OpenDialog1.Filename := ChangeFileExt(form1.OpenDialog1.FileName, '.scr');
  if form1.OpenDialog1.Execute then begin
  form1.SaveDialog1.Filename := form1.OpenDialog1.FileName;
  AssignFile(F, form1.OpenDialog1.FileName);
  Reset(F);
  while not Eof(F) do
   begin
   Readln(F, s);
   form1.Memo1.Lines.add(s);
  end;
  CloseFile(F);
 end; 
end;

// Menu Script File Load
procedure TForm1.Load3Click(Sender: TObject);
begin
 form1.Memo1.Clear;
 doloadscript;
end;

// Menu Script File Append
procedure TForm1.Append1Click(Sender: TObject);
begin
 doloadscript;
end;

// Menu Script Item for insert of script commands into memo pad
procedure TForm1.runbasestep1Click(Sender: TObject);
begin
 pastescript('runbasei+ 20');
end;

procedure TForm1.runbasevstep201Click(Sender: TObject);
begin
 pastescript('runbasev+ 20');
end;

procedure TForm1.traceno11Click(Sender: TObject);
begin
 pastescript('traceno 1');
end;

procedure TForm1.inctraceno1Click(Sender: TObject);
begin
  pastescript('inctraceno');
end;

procedure TForm1.Compare01Click(Sender: TObject);
begin
   pastescript('compare 0');
end;

procedure TForm1.comparestep1Click(Sender: TObject);
begin
  pastescript('comparestep 1');
end;

procedure TForm1.comparetrace11Click(Sender: TObject);
begin
  pastescript('comparetrace 1');
end;

procedure TForm1.fori101Click(Sender: TObject);
begin
 pastescript('fori 10');
end;

procedure TForm1.nexti1Click(Sender: TObject);
begin
 pastescript('nexti');
end;

procedure TForm1.loop1Click(Sender: TObject);
begin
 pastescript('loop');
end;

procedure TForm1.end1Click(Sender: TObject);
begin
 pastescript('end');
end;

procedure TForm1.pause1Click(Sender: TObject);
begin
 pastescript('pause');
end;

procedure TForm1.update01Click(Sender: TObject);
begin
 pastescript('update 0');
end;

procedure TForm1.show01Click(Sender: TObject);
begin
 pastescript('show 0');
end;

procedure TForm1.hide01Click(Sender: TObject);
begin
 pastescript('hide 0');
end;

procedure TForm1.remcomment1Click(Sender: TObject);
begin
  pastescript('rem comment');
end;

procedure TForm1.newtimestamp01Click(Sender: TObject);
begin
 pastescript('open n s t');
end;

procedure TForm1.storecursor1Click(Sender: TObject);
begin
 pastescript('storecursor');
end;

procedure TForm1.storevalue1Click(Sender: TObject);
begin
   pastescript('storevalue');
end;

procedure TForm1.storetrace1Click(Sender: TObject);
begin
 pastescript('storetrace');
end;

procedure TForm1.storeimage1Click(Sender: TObject);
begin
 pastescript('saveimage n s t');
end;

procedure TForm1.storeremcomment1Click(Sender: TObject);
begin
  pastescript('storerem comment');
end;

procedure TForm1.sweeptype01Click(Sender: TObject);
begin
 pastescript('sweeptype 0');
end;

procedure TForm1.customwave1Click(Sender: TObject);
begin
 pastescript('custom 8192');
end;

procedure TForm1.random1Click(Sender: TObject);
begin
   pastescript('random');
end;

procedure TForm1.runsweep1Click(Sender: TObject);
begin
 pastescript('runsweep');
end;

procedure TForm1.wave01Click(Sender: TObject);
begin
 pastescript('wave 0');
end;

procedure TForm1.avg8sweeps1Click(Sender: TObject);
begin
 pastescript('avg8');
end;

procedure TForm1.poweron1Click(Sender: TObject);
begin
 pastescript('poweron');
end;

procedure TForm1.poweroff1Click(Sender: TObject);
begin
 pastescript('poweroff');
end;

procedure TForm1.readvoltages1Click(Sender: TObject);
begin
 pastescript('readvoltages 256');
end;

procedure TForm1.readheater1Click(Sender: TObject);
begin
 pastescript('readheater');
end;

procedure TForm1.sweepstep11Click(Sender: TObject);
begin
 pastescript('sweepstep 2');
end;

procedure TForm1.clear2Click(Sender: TObject);
begin
 pastescript('clear');
end;

procedure TForm1.setplate4001Click(Sender: TObject);
begin
 pastescript('setcollector 400');
end;

procedure TForm1.setscreen4001Click(Sender: TObject);
begin
 pastescript('setbasev 400');
end;

procedure TForm1.setgrid101Click(Sender: TObject);
begin
 pastescript('setbasei 10');
end;

procedure TForm1.minplate01Click(Sender: TObject);
begin
 pastescript('startcollector 0');
end;

procedure TForm1.minscreen01Click(Sender: TObject);
begin
 pastescript('stepcollector 0');
end;

procedure TForm1.stepplate101Click(Sender: TObject);
begin
 pastescript('stepplate10');
end;

procedure TForm1.setsweepvalues1Click(Sender: TObject);
begin
 pastescript('setsweepvalues');
end;

procedure TForm1.for101Click(Sender: TObject);
begin
 pastescript('for 10');
end;

procedure TForm1.next1Click(Sender: TObject);
begin
 pastescript('next');
end;

procedure TForm1.wait51Click(Sender: TObject);
begin
 pastescript('wait 5');
end;

procedure TForm1.stop1Click(Sender: TObject);
begin
 pastescript('stop');
end;

procedure TForm1.namescript11Click(Sender: TObject);
begin
 pastescript('name file1');
end;

procedure TForm1.storeread1Click(Sender: TObject);
begin
 pastescript('storeread');
end;

procedure TForm1.incmaxgrid101Click(Sender: TObject);
begin
  pastescript('addbasei 10');
end;

procedure TForm1.decmaxgrid101Click(Sender: TObject);
begin
  pastescript('addbasev 10');
end;

procedure TForm1.incsweepstep1Click(Sender: TObject);
begin
  pastescript('incsweepstep');
end;

procedure TForm1.vperdiv1Click(Sender: TObject);
begin
  pastescript('vperdiv 0');
end;

procedure TForm1.iperdiv01Click(Sender: TObject);
begin
 pastescript('iperdiv 0');
end;

procedure TForm1.voffset01Click(Sender: TObject);
begin
 pastescript('voffset 0');
end;

procedure TForm1.ioffset01Click(Sender: TObject);
begin
 pastescript('ioffset 0');
end;

procedure TForm1.notodisp11Click(Sender: TObject);
begin
  pastescript('notodisp 1');
end;

procedure TForm1.samplepoint01Click(Sender: TObject);
begin
 pastescript('samplepoint 0');
end;

procedure TForm1.baseuav1Click(Sender: TObject);
begin
 pastescript('baseuav 0');
end;

procedure TForm1.autoinc01Click(Sender: TObject);
begin
 pastescript('autoinc 0');
end;

procedure TForm1.cursor01Click(Sender: TObject);
begin
 pastescript('cursor 0');
end;

procedure TForm1.mark1Click(Sender: TObject);
begin
 pastescript('mark');
end;

procedure TForm1.value1Click(Sender: TObject);
begin
 pastescript('value 0');
end;

procedure TForm1.filter01Click(Sender: TObject);
begin
 pastescript('filter 0');
end;

procedure TForm1.live01Click(Sender: TObject);
begin
 pastescript('live 0');
end;

procedure TForm1.plottype01Click(Sender: TObject);
begin
 pastescript('plottype 0');
end;


// Menu Calibration Save: Saves current calibration data to cal file associated with Mini_CT S/N
procedure TForm1.yes2Click(Sender: TObject);
var
  F: TextFile; 
begin
    AssignFile(F, 'callut_' + inttostr(serialno) + '.dat');
    Rewrite(F);
    Write(F, format('%0.9f ',[Vcal[0]]));
    Write(F, format('%0.9f ',[Vcal[1]]));
    Write(F, format('%4.1f ',[Voff[0]]));
    Write(F, format('%4.1f ',[Voff[1]]));
    Write(F, format('%0.12f ',[Ical[0]]));
    Write(F, format('%0.12f ',[Ical[1]]));
    Write(F, format('%0.12f ',[Ical[2]]));
    Write(F, format('%0.12f ',[Ical[3]]));
    Write(F, format('%0.12f ',[Ical[4]]));
    Write(F, format('%4.1f ',[Ioff[0]]));
    Write(F, format('%4.1f ',[Ioff[1]]));
    Write(F, format('%4.1f ',[Ioff[2]]));
    Write(F, format('%4.1f ',[Ioff[3]]));
    Write(F, format('%4.1f ',[Ioff[4]]));
    Write(F, format('%4.9f ',[cvzero]));
    Write(F, format('%4.9f ',[cvcal]));
    Write(F, format('%4.9f ',[bvzero]));
    Write(F, format('%4.9f ',[bvcal]));
    Write(F, format('%4.9f ',[bizero]));
    Write(F, format('%4.9f ',[bical]));
    Write(F, format('%6.0f ',[resistor[0]]));
    Write(F, format('%6.0f ',[resistor[1]]));
    Write(F, format('%6.0f ',[resistor[2]]));
    Write(F, format('%6.0f ',[resistor[3]]));
    Write(F, format('%7.0f',[resistor[4]]));
    Writeln(F, '');                        //end the single trace data with a return
   CloseFile(F);
   form1.nocal.Visible := false;
end;

// Process Redraw button push
procedure TForm1.ReDrawClick(Sender: TObject);
begin
 doredraw;
end;

//Timer interupt to poll for switch settings in Mini_CT
procedure TForm1.Timer6Timer(Sender: TObject);
begin
 if Form1.AutoUpdateOff1.checked = true then exit;
 if (form1.checkbox1.checked = false) and (form1.runsweep.enabled = true) and (serialno <> 0) then
 begin
   if length(edit1.text) > 52 then  edit1.Clear;   //When echo is on, clear when edit1 is full
   transmitcombyte(ord('S'));       //Send switch seting command
   transmitcombyte(ord('W'));
   transmitcombyte(ord('S'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(13);
   sleep(15);
   checkforbyte;                //when reply is received, checkforbyte will update settings
 end; 
end;

//Changes mouse to plus cursor when mouse is over plot area
procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if (X<513) and (Y<513) then Screen.Cursor := crCross else Screen.Cursor := crArrow;
end;

//Needed to force mouse back to arrow type
procedure TForm1.OnMouseMove2(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Screen.Cursor := crArrow;
end;

//Updates cursor values when the Sample Point spin edit value is chaged
procedure TForm1.SamplePointChange(Sender: TObject);
var
 i, j : integer;
 v1, i1 : single;
begin
 if form1.SamplePoint.Value < 0 then form1.SamplePoint.Value := maxpoints-1;
 if form1.SamplePoint.Value > maxpoints-1 then form1.SamplePoint.Value := 0 ;
 i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
 j := form1.SamplePoint.value;   //Get new data values
 v1 := traces[0,i,j,1];
 i1 := traces[0,i,j,2];
 form1.LabelPVS.caption := format('VC = %2.3f V',[v1]);           //Update text values
 form1.LabelPIS.caption := format('IC = %3.5f mA',[1000.0*i1]);
 form1.LabelDV.caption := format('DV = %2.3f V',[v1-vref1]);
 form1.LabelDI.caption := format('DI = %3.5f mA',[1000.0*i1-1000.0*iref1]);
 DoReDraw;      //Refresh the display to show the new cursor position
end;

//Process Continuous Sweep Settings: Sets the timer7 interval for either AC or Slow sweep loops
procedure TForm1.Live(Sender: TObject);
begin
 if checkbox1.Checked then begin
  if radiosweep.ItemIndex = 0 then begin
   timer7.Interval := delay1;
   timer7.enabled := true;
  end;
  if radiosweep.ItemIndex = 1 then begin
   timer7.Interval := delay2;
   timer7.enabled := true;
  end;
 end
 else timer7.enabled := false;
end;

//Timer7 processes the continuous sweep mode when Live is checked
procedure TForm1.Timer7Timer(Sender: TObject);
begin
  if form1.runsweep.enabled = true then DoRunSweep;
end;

//Check box Cursor shows a circle at the current sample point when checked
procedure TForm1.Oncheckcursor(Sender: TObject);
begin
 DoReDraw;   //Update plot for cursor on or off
end;

procedure TForm1.Onplottype(Sender: TObject);
begin
 DoReDraw;    //Update plot on plottype change
end;

//Mark the reference sample point for the cursor function: The point is also used in the parameter Value
procedure TForm1.Button11Click(Sender: TObject);
var
 i,j : integer;
begin
 if makescript = true then begin pastescript('mark'); exit; end;
 form1.labelPP.caption := 'Point:' + inttostr( form1.SamplePoint.Value) + ' Step:' + inttostr(form1.SweepStep.value) ;
 i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,0);  //find a table entry
 j := form1.SamplePoint.value;
 vref1 := traces[0,i,j,1];       //Collector V
 iref1 := traces[0,i,j,2];       //Collector i
 vbref := traces[0,i,j,3];       //Base V
 ibref := traces[0,i,j,4];       //Base i
 labelrefv.caption := format('Ref. V = %2.3f',[vref1]);         //Reference text values
 labelrefi.caption := format('Ref. I = %3.5f',[1000.0*iref1]);
 form1.LabelDV.caption := format('DV = %2.3f V',[0.0]);        //Delta text values
 form1.LabelDI.caption := format('DI = %3.5f mA',[0.0]);
end;

//There are two check boxes for ploting base values on the plot. Only V or I can be shown and checked
procedure TForm1.CheckGVClick(Sender: TObject);
begin
 if checkGV.checked = true then checkBaseV.Checked := false;
 DoReDraw;
end;
//There are two check boxes for ploting base values on the plot. Only V or I can be shown and checked
procedure TForm1.CheckBaseVClick(Sender: TObject);
begin
 if checkBaseV.checked = true then checkGV.Checked := false;
 DoReDraw;
end;

//Update plot when the No to Disp value is changed
procedure TForm1.SpinMstepsChange(Sender: TObject);
begin
 DoReDraw;
end;

//Button push to set plot to lower left corner
procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  UpdownIO.position := -5;
  Ioffset := -UpDownIO.position ;
  LabelIO.caption := 'IO ' + inttostr(updownio.position) + ' Div.';
  UpDownVO.position := -5;
  Voffset := -UpDownVO.position;
  LabelVO.caption := 'VO ' + inttostr(updownvo.position) + ' Div.';
  DoReDraw;
end;
//Button push to set plot to upper right corner
procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  UpdownIO.position := 5;
  Ioffset := -UpDownIO.position ;
  LabelIO.caption := 'IO ' + inttostr(updownio.position) + ' Div.';
  UpDownVO.position := 5;
  Voffset := -UpDownVO.position;
  LabelVO.caption := 'VO ' + inttostr(updownvo.position) + ' Div.';
  DoReDraw;
end;

//Update plot when compare sweep step or + index is changed
procedure TForm1.SpinPCChange(Sender: TObject);
begin
 DoReDraw;
end;

//Update plot when compare trace no or - index is changed
procedure TForm1.SpinNCChange(Sender: TObject);
begin
 DoReDraw;
end;

//Update plot when Compare type radio item is changed
procedure TForm1.RadioCompareClick(Sender: TObject);
begin
 DoReDraw;
end;

//Prcesses push of Swap button: The current part and compare part data is exchanged
procedure TForm1.Button4Click(Sender: TObject);
var
 i, j, k : integer;
 t1 : single;
 s2 : string;
begin
    for j := 0 to 4095 do begin     //Swap the trace memory
     i := pins[0,j,0];
     k := pins[0,j,1];
     pins[0,j,0] := pins[1,j,0];
     pins[0,j,1] := pins[1,j,1];
     pins[1,j,0] := i;
     pins[1,j,1] := k;
    end;
    s2 := tubetype.text;                 //Swap Name/serial number
    tubetype.text := comparename;
    comparename := S2;
    for i := 0 to 4095 do begin
     for j := 0 to maxpoints do begin    //Swap data values
      t1 := traces[0,i,j,1];
      traces[0,i,j,1] := traces[1,i,j,1];
      traces[1,i,j,1] := t1;
      t1 := traces[0,i,j,2];
      traces[0,i,j,2] := traces[1,i,j,2];
      traces[1,i,j,2] := t1;
      t1 := traces[0,i,j,3];
      traces[0,i,j,3] := traces[1,i,j,3];
      traces[1,i,j,3] := t1;
      t1 := traces[0,i,j,4];
      traces[0,i,j,4] := traces[1,i,j,4];
      traces[1,i,j,4] := t1;
     end;
    end;
    DoReDraw;
end;

//Process Value Parameter selection click in list box
procedure TForm1.ListBox1Click(Sender: TObject);
begin
 if makescript = true then begin pastescript('value ' + inttostr(form1.listbox1.ItemIndex)); exit; end;
 listboxupdate;
end;

//Run a calibration cycle for the type selected on the Cal Mode radio item
procedure TForm1.ButtonRunCClick(Sender: TObject);
begin
 formP.Label1.Caption :=  '';
 if radiocal.ItemIndex = 0 then begin  //Collector Voltage Measure Zero
  if form1.RadioSR.ItemIndex > 1 then formP.Label1.Caption :=  'Set R to 15K position, run again';
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  calnum := 1;
  doReadVoltages(256);
 end;
 if radiocal.ItemIndex = 1 then begin  //Collector Voltage Measure Cal
  if form1.RadioSR.ItemIndex > 1 then formP.Label1.Caption :=  'Set R to 15K position, run again';
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  if RadioVG.ItemIndex = 0 then calvolts := 10.0 else calvolts := 2.0;
  calnum := 2;
  doReadVoltages(256);
 end;
 if radiocal.ItemIndex = 2 then begin   //Collector Current Measure Zero
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  calnum := 3;
  doReadVoltages(256);
 end;
 if radiocal.ItemIndex = 3 then begin   //Collector Current Measure Cal
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  if RadioSR.ItemIndex = 0 then calohms := resistor[0];
  if RadioSR.ItemIndex = 1 then calohms := resistor[1];
  if RadioSR.ItemIndex = 2 then calohms := resistor[2];
  if RadioSR.ItemIndex = 3 then calohms := resistor[3];
  if RadioSR.ItemIndex = 4 then calohms := resistor[4];
  calnum := 4;
  doReadVoltages(256);
 end;
 if radiocal.ItemIndex = 4 then begin   //Collector DC Set Voltage Zero
  if (form1.RadioSR.ItemIndex > 1) or (form1.RadioVG.ItemIndex = 1) then formP.Label1.Caption :=  'Set R to 15K position and switch to X1, run again';
  CollectorV.Value := 0;
  cvzero := 0.0;
  doSetCollector;
  sleep(15);
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  calnum := 5;
  doReadVoltages(256);
  sleep(delay2*2);
 end;
 if radiocal.ItemIndex = 5 then begin   //Collector DC set Voltage Cal
  if (form1.RadioSR.ItemIndex > 1) or (form1.RadioVG.ItemIndex = 1) then formP.Label1.Caption :=  'Set R to 15K position and switch to X1, run again';
  CollectorV.Value := 1000;
  cvcal := 1.0;
  doSetCollector;
  sleep(15);
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  calnum := 6;
  doReadVoltages(256);
 end;
 if radiocal.ItemIndex = 6 then begin  //Base DC set Voltage Zero
  if (form1.RadioSR.ItemIndex <> 3) or (form1.RadioVG.ItemIndex = 1) or (form1.SetBaseV.Enabled = false) then formP.Label1.Caption :=  'Set R to 100K position, switch to X1, switch to BV, run again';
  CollectorV.Value := 0;
  doSetCollector;
  sleep(15);
  BaseVolts.Value := 0;
  bvzero := 0.0;
  doSetBaseV;
  sleep(15);
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  calnum := 7;
  doReadVoltages(256);
  sleep(delay2*2);
 end;
 if radiocal.ItemIndex = 7 then begin  //Base DC set Voltage Cal
  if (form1.RadioSR.ItemIndex <> 3) or (form1.RadioVG.ItemIndex = 1) or (form1.SetBaseV.Enabled = false) then formP.Label1.Caption :=  'Set R to 100K position, switch to X1, switch to BV, run again';
  CollectorV.Value := 0;
  doSetCollector;
  sleep(15);
  BaseVolts.Value := 900;
  bvcal := 2.0;
  doSetBaseV;
  sleep(15);
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  calnum := 8;
  doReadVoltages(256);
  sleep(delay2*2);
  checkforbyte;
  doReadVoltages(256);
  sleep(delay2*2);
  checkforbyte;
  doReadVoltages(256);
  sleep(delay2*2);
  checkforbyte;
 end;
 if radiocal.ItemIndex = 8 then begin  //Base DC set Current Zero
  if (form1.RadioSR.ItemIndex <> 3) or (form1.RadioVG.ItemIndex = 1) or (form1.SetBaseV.Enabled = true) then formP.Label1.Caption :=  'Set R to 100K position, switch to X1, switch to BI, run again';
  CollectorV.Value := 0;
  doSetCollector;
  sleep(15);
  Baseua.Value := 0;
  bizero := 0.0;
  doSetBaseI;
  sleep(15);
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  calnum := 9;
  doReadVoltages(256);
  sleep(delay2*2);
 end;
 if radiocal.ItemIndex = 9 then begin  //Base DC set Current Cal
  if (form1.RadioSR.ItemIndex <> 2) or (form1.RadioVG.ItemIndex = 1) or (form1.SetBaseV.Enabled = true) then formP.Label1.Caption :=  'Set R to 15K position, switch to X1, switch to BI, run again';
  CollectorV.Value := 0;
  doSetCollector;
  sleep(15);
  Baseua.Value := 1900;
  bical := -1.0;
  doSetBaseI;
  sleep(15);
  doReadVoltages(256);
  sleep(delay2);
  checkforbyte;
  calnum := 10;
  sleep(15);
  doReadVoltages(256);
 end;
end;

//Process for unchecking Com Port Numbers on pull down menu
procedure uncheckall;
begin
 form1.Com11.Checked := false;
 form1.Com21.Checked := false;
 form1.Com31.Checked := false;
 form1.Com41.Checked := false;
 form1.Com51.Checked := false;
 form1.Com61.Checked := false;
 form1.Com71.Checked := false;
 form1.Com81.Checked := false;
 form1.Com91.Checked := false;
 form1.Com101.Checked := false;
 form1.Com111.Checked := false;
 form1.Com121.Checked := false;
 form1.Com131.Checked := false;
 form1.Com141.Checked := false;
end;

//Process Com:1 menu click
procedure TForm1.Com11Click(Sender: TObject);
begin
 closecomport;
 if opencomport(1) <> 0 then begin
  form1.com11.checked := true;
  form1.comport1.caption := 'Com: 1';
  form1.RunSweep.enabled := true;
  dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:2 menu click
procedure TForm1.Com21Click(Sender: TObject);
begin
 closecomport;
 if opencomport(2) <> 0 then begin
  form1.com21.checked := true;
  form1.comport1.caption := 'Com: 2';
  form1.RunSweep.enabled := true;
  dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:3 menu click
procedure TForm1.Com31Click(Sender: TObject);
begin
 closecomport;
 if opencomport(3) <> 0 then begin
  form1.com31.checked := true;
  form1.comport1.caption := 'Com: 3';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:4 menu click
procedure TForm1.Com41Click(Sender: TObject);
begin
 closecomport;
 if opencomport(4) <> 0 then begin
  form1.com41.checked := true;
  form1.comport1.caption := 'Com: 4';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:5 menu click
procedure TForm1.Com51Click(Sender: TObject);
begin
 closecomport;
 if opencomport(5) <> 0 then begin
  form1.com51.checked := true;
  form1.comport1.caption := 'Com: 5';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:6 menu click
procedure TForm1.Com61Click(Sender: TObject);
begin
 closecomport;
 if opencomport(6) <> 0 then begin
  form1.com61.checked := true;
  form1.comport1.caption := 'Com: 6';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:7 menu click
procedure TForm1.Com71Click(Sender: TObject);
begin
 closecomport;
 if opencomport(7) <> 0 then begin
  form1.com71.checked := true;
  form1.comport1.caption := 'Com: 7';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:8 menu click
procedure TForm1.Com81Click(Sender: TObject);
begin
 closecomport;
 if opencomport(8) <> 0 then begin
  form1.com81.checked := true;
  form1.comport1.caption := 'Com: 8';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:9 menu click
procedure TForm1.Com91Click(Sender: TObject);
begin
 closecomport;
 if opencomport(9) <> 0 then begin
  form1.com91.checked := true;
  form1.comport1.caption := 'Com: 9';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:10 menu click
procedure TForm1.Com101Click(Sender: TObject);
begin
 closecomport;
 if opencomport(10) <> 0 then begin
  form1.com101.checked := true;
  form1.comport1.caption := 'Com: 10';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:11 menu click
procedure TForm1.Com111Click(Sender: TObject);
begin
 closecomport;
 if opencomport(11) <> 0 then begin
  form1.com111.checked := true;
  form1.comport1.caption := 'Com: 11';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:12 menu click
procedure TForm1.Com121Click(Sender: TObject);
begin
 closecomport;
 if opencomport(12) <> 0 then begin
  form1.com121.checked := true;
  form1.comport1.caption := 'Com: 12';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:13 menu click
procedure TForm1.Com131Click(Sender: TObject);
begin
 closecomport;
 if opencomport(13) <> 0 then begin
  form1.com131.checked := true;
  form1.comport1.caption := 'Com: 13';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Process Com:14 menu click
procedure TForm1.Com141Click(Sender: TObject);
begin
 closecomport;
 if opencomport(14) <> 0 then begin
  form1.com141.checked := true;
  form1.comport1.caption := 'Com: 14';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

//Menu Script File Make Set Up: Files memo pad with script file to restore current form state
procedure TForm1.Yes3Click(Sender: TObject);
begin
 //memo1.Clear;
 memo1.lines.Add('voffset ' + inttostr(updownvo.position));
 memo1.lines.Add('ioffset ' + inttostr(updownio.position));
 memo1.lines.Add('vperdiv ' + inttostr(vspin));
 memo1.lines.Add('iperdiv ' + inttostr(ispin));
 memo1.lines.Add('sweepstep ' + inttostr(SweepStep.value));
 memo1.lines.Add('traceno ' + inttostr(tracenumber.value));
 memo1.lines.Add('notodisp ' + inttostr(spinmsteps.value));
 memo1.lines.Add('plottype ' + inttostr(plottype.ItemIndex));
 memo1.lines.Add('samplepoint ' + inttostr(SamplePoint.value));
 if checkbox1.checked = true then memo1.lines.Add('live 1') else memo1.lines.Add('live 0');
 if checkcursor.checked = true then memo1.lines.Add('cursor 1') else memo1.lines.Add('cursor 0');
 if liveupdate.checked = true then memo1.lines.Add('update 1') else memo1.lines.Add('update 0');
 if checkgv.checked = true then memo1.lines.Add('baseuav 1');
 if checkbasev.checked = true then memo1.lines.Add('baseuav 2');
 if checkgv.checked = checkbasev.checked then memo1.lines.Add('baseuav 0');
 memo1.lines.Add('setcollector ' + inttostr(CollectorV.value));
 if form1.SetBaseV.enabled = true then memo1.lines.Add('setbasev ' + inttostr(BaseVolts.value));
 if form1.SetBaseI.enabled = true then memo1.lines.Add('setbasei ' + inttostr(Baseua.value));
 memo1.lines.Add('startcollector ' + inttostr(CollectorStart.value));
 memo1.lines.Add('stepcollector ' + inttostr(CollectorStep.value));
 memo1.lines.add('setsweepvalues');
 if checkauto.checked = true then memo1.lines.Add('autoinc 1') else memo1.lines.Add('autoinc 0');
 if checkf.checked = true then memo1.lines.Add('filteron 1') else memo1.lines.Add('filteron 0');
 memo1.lines.Add('wave '+inttostr(radiowave));
 if radiosweep.ItemIndex = 0 then memo1.lines.Add('sweeptype 0') else memo1.lines.Add('sweeptype 1');
 if Form1.VIperDiv1.Checked = false then memo1.lines.add('hide 0') else memo1.lines.add('show 0');
 if Form1.offsets1.Checked = false then memo1.lines.add('hide 1') else memo1.lines.add('show 1');
 if Form1.SN1.Checked = false then memo1.lines.add('hide 2') else memo1.lines.add('show 2');
 if Form1.steptrace1.Checked = false then memo1.lines.add('hide 3') else memo1.lines.add('show 3');
 if Form1.comparetrace1.Checked = false then memo1.lines.add('hide 4') else memo1.lines.add('show 4');
 if Form1.cursorVI1.Checked = false then memo1.lines.add('hide 5') else memo1.lines.add('show 5');
 if Form1.value2.Checked = false then memo1.lines.add('hide 6') else memo1.lines.add('show 6');
 memo1.lines.Add('comparestep ' + inttostr(spinPC.value));
 memo1.lines.Add('comparetrace ' + inttostr(spinNC.value));
 if radiocompare.ItemIndex = 0 then memo1.lines.add('compare 0');
 if radiocompare.ItemIndex = 1 then memo1.lines.add('compare 1');
 if radiocompare.ItemIndex = 2 then memo1.lines.add('compare 2');
 memo1.lines.Add('baseat ' + inttostr(baseat));
 //Note: switch settings can not be restored, only documented
 if radiovg.ItemIndex = 0 then memo1.lines.add('rem voltage gain x1') else memo1.lines.add('rem voltage gain x4.5');
 if radiosr.ItemIndex = 0 then memo1.lines.add('rem sense R 500');
 if radiosr.ItemIndex = 1 then memo1.lines.add('rem sense R 1.5K');
 if radiosr.ItemIndex = 2 then memo1.lines.add('rem sense R 15K');
 if radiosr.ItemIndex = 3 then memo1.lines.add('rem sense R 100K');
 if radiosr.ItemIndex = 4 then memo1.lines.add('rem sense R 1M');
 memo1.lines.add('runsweep');
end;

//Menu Script File Clear: Clears script file memo pad
procedure TForm1.Yes4Click(Sender: TObject);
begin
 form1.memo1.clear;
end;

//Posts calibration instructions over upper right of curve dispaly area
procedure postinstructions;
begin
 formP.memo2.clear;
 formP.show;
 if form1.radiocal.ItemIndex = 0 then begin
 try
    MyImage.LoadFromFile(ExtractFilePath(Application.EXEName) + 'vmz.bmp');
    PaintDib;
  finally
  end;
  formP.memo2.lines.Add('1. Set Gain Switch to x1');
  formP.memo2.lines.Add('2. Set Collector Voltage to Zero');
  formP.memo2.lines.add('3. Short Collector Post to Gnd');
  formP.memo2.lines.add('4. Click Run');
  formP.memo2.lines.Add('5. Set Gain Switch to x4.5');
  formP.memo2.lines.Add('6. Repeat 2-4');
 end;
 if form1.radiocal.ItemIndex = 1 then begin
  try
    MyImage.LoadFromFile(ExtractFilePath(Application.EXEName) + 'vmcall.bmp');
    PaintDib;
  finally
  end;
  formP.memo2.lines.Add('1. Set Gain Switch to x1');
  formP.memo2.lines.Add('2. Volts Vernier to Cal Pos');
  formP.memo2.lines.add('3. Connect DVM between Collector and Gnd');
  formP.memo2.lines.Add('4. Set Collector Voltage for 10.00V on DVM');
  formP.memo2.lines.add('5. Click Run');
  formP.memo2.lines.Add('6. Set Gain Switch to x4.5');
  formP.memo2.lines.Add('7. Set Collector Voltage for 2.000V on DVM');
  formP.memo2.lines.add('8. Click Run');
 end;
 if form1.radiocal.ItemIndex = 2 then begin
  try
    MyImage.LoadFromFile(ExtractFilePath(Application.EXEName) + 'cmz.bmp');
    PaintDib;
  finally
  end;
  formP.memo2.lines.Add('1. Set Gain Switch to x1');
  formP.memo2.lines.Add('2. Volts Vernier to Cal Pos');
  formP.memo2.lines.add('3. Open Collector to Gnd');
  formP.memo2.lines.Add('4. Set Collector Voltage for 0.00V');
  formP.memo2.lines.add('5. Set SensR to 500, Click Run');
  formP.memo2.lines.add('6. Set SensR to 1.5K, Click Run');
  formP.memo2.lines.add('7. Set SensR to 15K, Click Run');
  formP.memo2.lines.add('8. Set SensR to 100K, Click Run');
  formP.memo2.lines.add('9. Set SensR to 1M, Click Run');
 end;
 if form1.radiocal.ItemIndex = 3 then begin
  try
    MyImage.LoadFromFile(ExtractFilePath(Application.EXEName) + 'cmc.bmp');
    PaintDib;
  finally
  end;
  formP.memo2.lines.Add('1. Set Gain Switch to x1');
  formP.memo2.lines.Add('2. Volts Vernier to Cal Pos');
  formP.memo2.lines.add('3. Set Collector Voltage for 10.00V on DVM');
  formP.memo2.lines.Add('4. Short Collector to Gnd');
  formP.memo2.lines.add('5. Set SensR to 500, Click Run');
  formP.memo2.lines.add('6. Set SensR to 1.5K, Click Run');
  formP.memo2.lines.add('7. Set SensR to 15K, Click Run');
  formP.memo2.lines.add('8. Set SensR to 100K, Click Run');
  formP.memo2.lines.add('9. Set SensR to 1M, Click Run');
 end;
 if form1.radiocal.ItemIndex = 4 then begin
  try
    MyImage.LoadFromFile(ExtractFilePath(Application.EXEName) + 'cvz.bmp');
    PaintDib;
  finally
  end;
  formP.memo2.lines.Add('1. Set Gain Switch to x1');
  formP.memo2.lines.Add('2. Volts Vernier to Cal Pos');
  formP.memo2.lines.Add('3. Open Collector to Gnd');
  formP.memo2.lines.add('4. Click Run');
  end;
 if form1.radiocal.ItemIndex = 5 then begin
  try
    MyImage.LoadFromFile(ExtractFilePath(Application.EXEName) + 'cvz.bmp');
    PaintDib;
  finally
  end;
  formP.memo2.lines.Add('1. Set Gain Switch to x1');
  formP.memo2.lines.Add('2. Volts Vernier to Cal Pos');
  formP.memo2.lines.Add('3. Open Collector to Gnd');
  formP.memo2.lines.add('4. Click Run');
  end;
 if form1.radiocal.ItemIndex = 6 then begin
  try
    MyImage.LoadFromFile(ExtractFilePath(Application.EXEName) + 'bvz.bmp');
    PaintDib;
  finally
  end;
  formP.memo2.lines.Add('1. Set Gain Switch to x1');
  formP.memo2.lines.Add('2. Volts Vernier to Cal Pos');
  formP.memo2.lines.Add('3. Connect Collector to Base');
  formP.memo2.lines.add('4. Set Base Switch to V');
  formP.memo2.lines.add('5. Set SenseR to 100K');
  formP.memo2.lines.add('6. Click Run');
  end;
 if form1.radiocal.ItemIndex = 7 then begin
  try
    MyImage.LoadFromFile(ExtractFilePath(Application.EXEName) + 'bvz.bmp');
    PaintDib;
  finally
  end;
  formP.memo2.lines.Add('1. Set Gain Switch to x1');
  formP.memo2.lines.Add('2. Volts Vernier to Cal Pos');
  formP.memo2.lines.Add('3. Connect Collector to Base');
  formP.memo2.lines.add('4. Set Base Switch to V');
  formP.memo2.lines.add('5. Set SenseR to 100K');
  formP.memo2.lines.add('6. Click Run');
  end;
 if form1.radiocal.ItemIndex = 8 then begin
  try
    MyImage.LoadFromFile(ExtractFilePath(Application.EXEName) + 'bcz.bmp');
    PaintDib;
  finally
  end;
  formP.memo2.lines.Add('1. Set Gain Switch to x1');
  formP.memo2.lines.Add('2. Volts Vernier to Cal Pos');
  formP.memo2.lines.Add('3. Connect Collector to Base');
  formP.memo2.lines.add('4. Set Base Switch to I');
  formP.memo2.lines.add('5. Set SenseR to 100K');
  formP.memo2.lines.add('6. Click Run');
  end;
 if form1.radiocal.ItemIndex = 9 then begin
 try
    MyImage.LoadFromFile(ExtractFilePath(Application.EXEName) + 'bcc.bmp');
    PaintDib;
  finally
  end;
  formP.memo2.lines.Add('1. Set Gain Switch to x1');
  formP.memo2.lines.Add('2. Volts Vernier to Cal Pos');
  formP.memo2.lines.Add('3. Connect Collector to Base');
  formP.memo2.lines.add('4. Set Base Switch to I');
  formP.memo2.lines.add('5. Set SenseR to 15K');
  formP.memo2.lines.add('6. Click Run');
  end;
end;

//Process selection of the Sweep Type radio item: Sends command to turn on/off interupts in Mini_CT
//Interupts are used to generate the AC continuous waveform and are off for slow sweeps
procedure TForm1.RadioSweepClick(Sender: TObject);
var
 i : bool;
begin
 i := false;
 if form1.checkbox1.Checked = true then begin i := true; form1.CheckBox1.checked := false ; sleep(delay2); end;
 if form1.RadioSweep.ItemIndex = 0 then begin
   checkforbyte;
   transmitcombyte(ord('I'));
   transmitcombyte(ord('N'));
   transmitcombyte(ord('T'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('1'));
   transmitcombyte(13);
   sleep(15);
 end;
 if form1.RadioSweep.ItemIndex = 1 then begin
   checkforbyte;
   transmitcombyte(ord('I'));
   transmitcombyte(ord('N'));
   transmitcombyte(ord('T'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(ord('0'));
   transmitcombyte(13);
   sleep(15);
 end;
  form1.checkbox1.checked := i;
end;

//Processes mouse clicks in the wave form image area: Select wave types on mouse X location
procedure TForm1.wavemousedown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if X < 20 then begin radiowave:= 0; radiowaveset; exit; end;
   if X < 39 then begin radiowave := 1; radiowaveset;exit; end;
   if X < 59 then begin radiowave := 2; radiowaveset; exit; end;
   if X < 79 then begin radiowave := 3; radiowaveset; exit; end;
   if X < 99 then begin radiowave := 4; radiowaveset;exit; end;
   if X < 119 then begin radiowave := 5; radiowaveset; exit; end;
   if X < 139 then begin radiowave := 6; radiowaveset;exit; end;
   if X < 159 then begin radiowave := 7; radiowaveset; exit; end;
   radiowave := 8; radiowaveset;
end;

//When the wave button is heighlighted, the heighlight takes over the mouse click and it needs processing
procedure TForm1.mousew0(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  radiowave := 0; radiowaveset;
end;

procedure TForm1.mousew1(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    radiowave := 1; radiowaveset;
end;

procedure TForm1.mousew2(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  radiowave := 2; radiowaveset;
end;

procedure TForm1.mousew3(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 radiowave := 3; radiowaveset;
end;

procedure TForm1.mousew4(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 radiowave := 4; radiowaveset;
end;

procedure TForm1.mousew5(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 radiowave := 5; radiowaveset;
end;

procedure TForm1.mousew6(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 radiowave := 6; radiowaveset;
end;

procedure TForm1.mousew7(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 radiowave := 7; radiowaveset;
end;

procedure TForm1.mousew8(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 radiowave := 8; radiowaveset;
end;

//Menu Image Print Plot processing
procedure TForm1.PrintPlot1Click(Sender: TObject);
begin
  printersetupdialog1.execute;
  try
    with Printer do
    begin
      BeginDoc;
      canvas.stretchdraw(rect(100, 100, 2500, 2500), myimage);
      EndDoc;
    end;
  finally
  end;

end;

//Process Data file menu Save
procedure TForm1.mnusave21click(Sender: TObject);
var
  F: TextFile;
  i, j, jm : integer;
begin
  form1.OpenDialog1.DefaultExt := '*.txt';
  form1.SaveDialog1.DefaultExt := '*.txt';
  form1.SaveDialog1.FilterIndex := 1;
  form1.SaveDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.txt');
  if form1.SaveDialog1.Execute then    //open a dialog box to get file name
  begin
    form1.SaveDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.txt');  //open and overwrite the file with new data
    savedatafile(form1.SaveDialog1.Filename);
 end;
end;

// Menu Rate 5Hz/2.5Hz setting
procedure TForm1.N05X1Click(Sender: TObject);
begin
 form1.N05x1.Checked := true;
 delay1 := 200;
 delay2 := 400;
end;

// Menu Rate 10Hz/5Hz setting
procedure TForm1.N10X1Click(Sender: TObject);
begin
 form1.N10X1.Checked := true;
 delay1 := 100;
 delay2 := 200;
end;

// Menu Rate Max setting
procedure TForm1.N20X1Click(Sender: TObject);
begin
 form1.N20X1.checked := true;
 delay1 := 25;
 delay2 := 25;
end;

//Menu Sound On checked processing
procedure TForm1.On2Click(Sender: TObject);
begin
  form1.On2.Checked := form1.on2.checked xor true;
end;

//Menu Auto Update checked processing. With auto update on, the switch settings are polled when
//the Mini_CT is idle with no sweeps. If echo is on, checking this stops overwriting of echoed commands
procedure TForm1.AutoUpdateOff1Click(Sender: TObject);
begin
  Form1.AutoUpdateOff1.checked :=  Form1.AutoUpdateOff1.checked xor true;
end;

//Menu Image Labels Show/Hide checked processing
procedure TForm1.VIperDiv1Click(Sender: TObject);
begin
  Form1.VIperDiv1.Checked := Form1.VIperDiv1.Checked xor true;
  doredraw;
end;

procedure TForm1.Offsets1Click(Sender: TObject);
begin
  Form1.offsets1.Checked := Form1.offsets1.Checked xor true;
  doredraw;
end;

procedure TForm1.SN1Click(Sender: TObject);
begin
  Form1.sn1.Checked := Form1.sn1.Checked xor true;
  doredraw;
end;

procedure TForm1.StepTrace1Click(Sender: TObject);
begin
  Form1.steptrace1.Checked := Form1.steptrace1.Checked xor true;
  doredraw;
end;

procedure TForm1.CompareTrace1Click(Sender: TObject);
begin
 Form1.comparetrace1.Checked := Form1.comparetrace1.Checked xor true;
 doredraw;
end;

procedure TForm1.CursorVI1Click(Sender: TObject);
begin
  Form1.cursorvi1.Checked := Form1.cursorVI1.Checked xor true;
  doredraw;
end;

procedure TForm1.Value2Click(Sender: TObject);
begin
  Form1.Value2.Checked := Form1.value2.Checked xor true;
  doredraw;  
end;

//Menu Image Save to File processing
procedure TForm1.SavetoFile1Click(Sender: TObject);
begin
  form1.SaveDialog1.DefaultExt := '*.bmp';
  form1.SaveDialog1.FilterIndex := 3;
  form1.SaveDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.bmp');
  if form1.SaveDialog1.Execute then  myimage.SaveToFile(form1.SaveDialog1.Filename);
end;

// Menu Data File Export All processing: All curves are sent as comma delimited text
procedure TForm1.All1Click(Sender: TObject);
var
  F: TextFile;
  i, j, jm : integer;
begin
  form1.OpenDialog1.DefaultExt := '*.txt';
  form1.SaveDialog1.DefaultExt := '*.txt';
  form1.SaveDialog1.FilterIndex := 1;
  form1.SaveDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.txt');
  if form1.SaveDialog1.Execute then           //open a dialog box to get file name
  begin
  try
    form1.SaveDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.txt');  //open and overwrite the file with new data
    AssignFile(F, form1.SaveDialog1.FileName);
    Rewrite(F);

    for i := 0 to 4095 do begin
     if pins[0,i,0] = 0 then break;
     Write(F, format('"Trace:%4d",',[pins[0,i,0]]));              //Write the tube number index
     Write(F, ' ' + format('"Step:%4d",',[pins[0,i,1]]));        //Write the step number index
     Write(F, format(' "Trace:%4d",',[pins[0,i,0]]));              //Write the tube number index
     Write(F, ' ' + format('"Step%4d",',[pins[0,i,1]]));        //Write the step number index
    end;
    Writeln(F, '');

    for j := 0 to maxpoints-1 do begin
     jm := j;
     for i := 0 to 4095 do begin
      if pins[0,i,0] = 0 then break;
      Write(F, format('%2.3f,',[traces[0,i,jm,1]]));  //Write the voltage to 1mV
      Write(F, ' ' + format('%0.9f,',[traces[0,i,jm,2]]));  //Write the curent to 1nA
      Write(F, ' ' + format('%2.3f,',[traces[0,i,jm,3]]));  //Base voltage is fixed value for now
      Write(F, ' ' + format('%0.6f,',[traces[0,i,jm,4]]));  //Base current is fixed value for now
     end;
      Writeln(F, '');                                      //end the single trace data with a return
    end;

  finally
    CloseFile(F);
  end;
end;

end;

// Menu Data File Export Trace processing: current trace is exported as comma delimited data
procedure TForm1.Trace1Click(Sender: TObject);
var
  F: TextFile;
  j : integer;
begin
  form1.OpenDialog1.DefaultExt := '*.txt';
  form1.SaveDialog1.DefaultExt := '*.txt';
  form1.SaveDialog1.FilterIndex := 1;
  form1.SaveDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.txt');
  if form1.SaveDialog1.Execute then           //open a dialog box to get file name
  try
    form1.SaveDialog1.Filename := ChangeFileExt(form1.SaveDialog1.FileName, '.txt');  //open and overwrite the file with new data
    AssignFile(F, form1.SaveDialog1.FileName);
    Rewrite(F);
    Write(F, format('"Trace: %4d",',[form1.tracenumber.value]));
    Write(F, ' ' + format('"Step: %4d",',[form1.sweepstep.value]));
    Write(F, format('"Trace: %4d",',[form1.tracenumber.value]));
    Writeln(F, ' ' + format('"Step: %4d"',[form1.sweepstep.value]));

    for j := 0 to maxpoints-1 do begin
      Write(F, ' ' + format('%2.3f,',[V[j,1]]));  //Write the voltage to 1mV
      Write(F, ' ' + format('%0.9f,',[V[j,2]]));  //Write the curent to 1nA
      Write(F, ' ' + format('%2.3f,',[V[j,3]]));  //Base voltage is fixed value for now
      Write(F, ' ' + format('%0.6f',[V[j,4]]));  //Base current is fixed value for now
      Writeln(F, '');                            //end data point with a return
    end;
   finally
       CloseFile(F);
  end;
end;

// Menu Script Control Reset Run Sweep button: Button can be disabled if no com port was present
procedure TForm1.ResetRunSweep1Click(Sender: TObject);
begin
RunSweep.enabled := true;
end;

// Menu Script Control Pause: Pausing a script can not be on the form. It is unreliable there.
procedure TForm1.Pause2Click(Sender: TObject);
begin
 form1.pause2.Checked := form1.pause2.Checked xor true;
end;

// Menu Calibration Show Menu processing: makes Cal Mode radio buttons, run button and instructions visible
procedure TForm1.ShowCalMenu1Click(Sender: TObject);
begin
 showcalmenu1.Checked := showcalmenu1.Checked xor true;
 if showcalmenu1.Checked = true then begin
     buttonrunc.visible := true;
     formP.memo2.visible := true;
     radiocal.Visible := true;
     postinstructions;
 end;
 if showcalmenu1.Checked = false then begin
    buttonrunc.visible := false;
    formP.memo2.visible := false;
    formP.hide;
    radiocal.Visible := false;
    DoReDraw;
    DoReDraw;
 end;
end;

// Menu Script Control Step Time: sets script step time to 10ms
procedure TForm1.N001sperstep1Click(Sender: TObject);
begin
 form1.n001sperstep1.Checked := true;
 form1.timer5.Interval := 10;
end;

// Menu Script Control Step Time: sets script step time to 100ms
procedure TForm1.N01secperstep1Click(Sender: TObject);
begin
 form1.N01secperstep1.checked := true;
 form1.timer5.Interval := 100;
end;

// Menu Script Control Step Time: sets script step time to 1s
procedure TForm1.N1secperstep1Click(Sender: TObject);
begin
 form1.N1secperstep1.checked := true;
 form1.timer5.Interval := 1000;
end;

// Menu Script Control Single Step: sets check mark for single stepping of script
// Run Script button advances script one step when Single Step is checked
procedure TForm1.SingleStep1Click(Sender: TObject);
begin
 form1.singlestep1.checked := form1.singlestep1.checked xor true;
end;

procedure TForm1.ShowResistorMenu1Click(Sender: TObject);
begin
 showresistormenu1.Checked := showresistormenu1.Checked xor true;
 if showresistormenu1.checked then begin
  form1.panelr.visible := true;
  form1.editr0.text := inttostr(round(resistor[0]));
  form1.editr1.text := inttostr(round(resistor[1]));
  form1.editr2.text := inttostr(round(resistor[2]));
  form1.editr3.text := inttostr(round(resistor[3]));
  form1.editr4.text := inttostr(round(resistor[4]));
 end
 else begin
  form1.panelr.visible := false;
  doredraw;
 end;
end;

procedure TForm1.SetRClick(Sender: TObject);
begin
  resistor[0] := strtointdef(form1.editr0.text,500);
  resistor[1] := strtointdef(form1.editr1.text,1500);
  resistor[2] := strtointdef(form1.editr2.text,15000);
  resistor[3] := strtointdef(form1.editr3.text,100000);
  resistor[4] := strtointdef(form1.editr4.text,1000000);
  form1.editr0.text := inttostr(round(resistor[0]));
  form1.editr1.text := inttostr(round(resistor[1]));
  form1.editr2.text := inttostr(round(resistor[2]));
  form1.editr3.text := inttostr(round(resistor[3]));
  form1.editr4.text := inttostr(round(resistor[4]));
end;

procedure TForm1.HTMLHelp1Click(Sender: TObject);
var
 h1 : hwnd;
begin
 if ShellExecute(h1,'open','HTML_Help\Mini_CT_help.html',nil,nil,SW_NORMAL) = 2 then begin
  OpenDialog1.DefaultExt := '*.html';
  OpenDialog1.FilterIndex := 3;
  OpenDialog1.Filename := 'Mini_CT_help.html';
  if OpenDialog1.Execute then begin          //Open the file dialog and let the user pick a file name
   ShellExecute(h1,'open','Mini_CT_help.html',nil,nil,SW_NORMAL);
  end;
 end;
end;

procedure TForm1.RadioCalClick(Sender: TObject);
begin
  postinstructions;
end;

procedure TForm1.LoadCompare1Click(Sender: TObject);
begin
   OpenDialog1.DefaultExt := '*.txt';
  SaveDialog1.DefaultExt := '*.txt';
  OpenDialog1.FilterIndex := 1;
  OpenDialog1.Filename := ChangeFileExt(OpenDialog1.FileName, '.txt');
 if OpenDialog1.Execute then begin          //Open the file dialog and let the user pick a file name
  SaveDialog1.Filename := OpenDialog1.FileName;
  FileLoadTraces(1,SaveDialog1.Filename); //Load the part trace
 end;
end;

procedure TForm1.savefilenst1Click(Sender: TObject);
begin
pastescript('savefile n s t');
end;

procedure TForm1.loadfilefilename1Click(Sender: TObject);
begin
pastescript('loadfile filename');
end;

procedure TForm1.loadimageimagename1Click(Sender: TObject);
begin
pastescript('loadimage imagename');
end;

procedure TForm1.popupcomment1Click(Sender: TObject);
begin
  pastescript('popup comment');
end;

procedure TForm1.formkeydown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if shift = [ssShift] then makescript := true else makescript := false;
end;

procedure TForm1.formkeyup(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if shift = [ssShift] then makescript := true else makescript := false;
end;

procedure TForm1.Onsweeptextclick(Sender: TObject);
begin
 if makescript = true then begin pastescript('sweeptype ' + inttostr(form1.radiosweep.itemindex)); exit; end;
end;

procedure TForm1.CompareTextClick(Sender: TObject);
begin
 if makescript = true then begin pastescript('compare ' + inttostr(form1.radiocompare.itemindex)); exit; end;
end;

procedure TForm1.checkbasedown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if makescript = true then begin
  if form1.checkbaseV.checked then begin
   pastescript('baseuav 1');
   form1.checkbaseV.checked := false;
  end
  else begin
   pastescript('baseuav 0');
   form1.checkbaseV.checked := true;
  end;
  exit;
 end;

end;

procedure TForm1.checkgvdown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if makescript = true then begin
  if form1.checkgv.checked then begin
   pastescript('baseuav 1');
   form1.checkGV.checked := false;
  end
  else begin
   pastescript('baseuav 0');
   form1.checkGV.checked := true;
  end;
  exit;
 end;
end;

procedure TForm1.ACSweepTextClick(Sender: TObject);
begin
  if makescript = true then begin
   pastescript('sweeptype 0');
   exit;
   end
  else
   form1.radiosweep.itemindex := 0;
end;

procedure TForm1.SlowSweepTextClick(Sender: TObject);
begin
  if makescript = true then begin
   pastescript('sweeptype 1');
   exit;
   end
  else
   form1.radiosweep.itemindex := 1;
end;

procedure TForm1.OffTextClick(Sender: TObject);
begin
  if makescript = true then begin
   pastescript('compare 0');
   exit;
   end
  else
   form1.radiocompare.itemindex := 0;
end;

procedure TForm1.ToTraceTextClick(Sender: TObject);
begin
  if makescript = true then begin
   pastescript('compare 1');
   exit;
   end
  else
   form1.radiocompare.itemindex := 1;
end;

procedure TForm1.toPartTextClick(Sender: TObject);
begin
  if makescript = true then begin
   pastescript('compare 2');
   exit;
   end
  else
   form1.radiocompare.itemindex := 2;
end;

procedure TForm1.PlotTypeTextClick(Sender: TObject);
begin
 if makescript = true then begin pastescript('plottype ' + inttostr(form1.plottype.itemindex)); exit; end;
end;

procedure TForm1.XYTextClick(Sender: TObject);
begin
  if makescript = true then begin
   pastescript('plottype 0');
   exit;
   end
  else
   form1.plottype.itemindex := 0;
end;

procedure TForm1.XTTextClick(Sender: TObject);
begin
  if makescript = true then begin
   pastescript('plottype 1');
   exit;
   end
  else
   form1.plottype.itemindex := 1;
end;

procedure TForm1.UpdateWithSweepTextClick(Sender: TObject);
begin
 if makescript = true then begin
  if form1.liveupdate.checked then
   pastescript('update 1')
  else
   pastescript('update 0');
  exit;
 end;
 form1.liveupdate.checked := true xor form1.liveupdate.checked;
end;


procedure TForm1.AutoIncTextClick(Sender: TObject);
begin
 if makescript = true then begin
  if form1.checkauto.checked then
   pastescript('autoinc 1')
  else
   pastescript('autoinc 0');
  exit;
 end;
 form1.checkauto.checked := true xor form1.checkauto.checked;
end;

procedure TForm1.Label12Click(Sender: TObject);
begin
 if makescript = true then begin pastescript('sweepstep ' + inttostr(form1.sweepstep.value)); exit; end;
end;

procedure TForm1.Label13Click(Sender: TObject);
begin
 if makescript = true then begin pastescript('traceno ' + inttostr(form1.tracenumber.value)); exit; end;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
 if makescript = true then begin pastescript('notodisp ' + inttostr(form1.spinMsteps.value)); exit; end;
end;

procedure TForm1.Label26Click(Sender: TObject);
begin
 if makescript = true then begin pastescript('samplepoint ' + inttostr(form1.samplepoint.value)); exit; end;
end;

procedure TForm1.Label5Click(Sender: TObject);
begin
 if makescript = true then begin pastescript('comparestep ' + inttostr(form1.spinpc.value)); exit; end;
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
 if makescript = true then begin pastescript('comparetrace ' + inttostr(form1.spinNC.value)); exit; end;
end;

procedure TForm1.CursorTextClick(Sender: TObject);
begin
 if makescript = true then begin
  if form1.checkcursor.checked then
   pastescript('cursor 1')
  else
   pastescript('cursor 0');
  exit;
 end;
 form1.checkcursor.checked := true xor form1.checkcursor.checked;
end;

procedure TForm1.LiveTextClick(Sender: TObject);
begin
 if makescript = true then begin
  if form1.checkbox1.checked then
   pastescript('live 1')
  else
   pastescript('live 0');
  exit;
 end;
 form1.checkbox1.checked := true xor form1.checkbox1.checked;
end;

procedure TForm1.FilterOnTextClick(Sender: TObject);
begin
 if makescript = true then begin
  if form1.checkF.checked then
   pastescript('filter 1')
  else
   pastescript('filter 0');
  exit;
 end;
 form1.checkF.checked := true xor form1.checkF.checked;
end;

procedure TForm1.LabelVOClick(Sender: TObject);
begin
  if makescript = true then begin pastescript('voffset ' + inttostr(-Voffset)); exit; end;
end;

procedure TForm1.LabelIOClick(Sender: TObject);
begin
  if makescript = true then begin pastescript('ioffset ' + inttostr(-Ioffset)); exit; end;
end;

procedure TForm1.LabelvpdClick(Sender: TObject);
begin
 if makescript = true then begin pastescript('vperdiv ' + inttostr(vspin)); exit; end;
end;

procedure TForm1.LabelipdClick(Sender: TObject);
begin
 if makescript = true then begin pastescript('iperdiv ' + inttostr(ispin)); exit; end;
end;

procedure TForm1.LabelACClick(Sender: TObject);
begin
   if makescript = true then begin pastescript('wave ' + inttostr(radiowave)); exit; end;
end;

procedure TForm1.resetplot1Click(Sender: TObject);
begin
 pastescript('plotreset');
end;

procedure TForm1.plotbvic1Click(Sender: TObject);
begin
 pastescript('plotbvic');
end;

procedure TForm1.plotcvib1Click(Sender: TObject);
begin
 pastescript('plotcvib');
end;

procedure TForm1.Com151Click(Sender: TObject);
begin
 closecomport;
 if opencomport(15) <> 0 then begin
  form1.com151.checked := true;
  form1.comport1.caption := 'Com: 15';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

procedure TForm1.Com161Click(Sender: TObject);
begin
 closecomport;
 if opencomport(16) <> 0 then begin
  form1.com161.checked := true;
  form1.comport1.caption := 'Com: 16';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

procedure TForm1.Com171Click(Sender: TObject);
begin
 closecomport;
 if opencomport(17) <> 0 then begin
  form1.com171.checked := true;
  form1.comport1.caption := 'Com: 17';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

procedure TForm1.Com181Click(Sender: TObject);
begin
 closecomport;
 if opencomport(18) <> 0 then begin
  form1.com181.checked := true;
  form1.comport1.caption := 'Com: 18';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

procedure TForm1.Com191Click(Sender: TObject);
begin
 closecomport;
 if opencomport(19) <> 0 then begin
  form1.com191.checked := true;
  form1.comport1.caption := 'Com: 19';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

procedure TForm1.Com201Click(Sender: TObject);
begin
 closecomport;
 if opencomport(20) <> 0 then begin
  form1.com201.checked := true;
  form1.comport1.caption := 'Com: 20';
    form1.RunSweep.enabled := true;
    dostartload;
 end else
  form1.comport1.caption := 'Com: XX';
end;

procedure TForm1.subtracttextclick(Sender: TObject);
begin
 if makescript = true then begin
   pastescript('compare 3');
   exit;
   end
  else
   form1.radiocompare.itemindex := 3;
end;

procedure TForm1.ZeroLeadsClick(Sender: TObject);
begin
 if form1.listbox1.ItemIndex = 0 then begin   //Zero lead resistance for R measurement
  Rleads := 0.0;
  listboxupdate;
  if makescript = true then exit;
  Rleads := Rmeasure;
  listboxupdate;
 end;
 if form1.listbox1.ItemIndex = 4 then begin   //Zero lead resistance for R measurement
  Cleads := 0.0;
  listboxupdate;
  if makescript = true then exit;
  Cleads := Cmeasure;
  listboxupdate;
 end;
end;

procedure TForm1.N01Click(Sender: TObject);
begin
 form1.N01.Checked := true;
 baseat := 0;
end;

procedure TForm1.N1281Click(Sender: TObject);
begin
  Form1.N1281.checked := true;
  baseat := 128;
end;

procedure TForm1.N2561Click(Sender: TObject);
begin
 Form1.N2561.checked := true;
 baseat := 255;
end;

procedure TForm1.plotcvic1Click(Sender: TObject);
begin
 pastescript('plotcvic');
end;

procedure TForm1.addcollv101Click(Sender: TObject);
begin
pastescript('addcollv 10');
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  formabout.show;
end;

//Example code to assign data to V[] array and plot it
procedure TForm1.ButtonExampleClick(Sender: TObject);
var
 j, i : integer;
begin
  flagmulti := false;                   // Force drawing of reticule
  plotcolor := $00a700;                 // Initial plot color is green
  for j := 0 to maxpoints-1 do begin     // save the data to a trace plot array
     v[j,1] := 10.0*sin(j*0.05);
     v[j,2] := 0.01*cos(j*0.2+ 0.75);
     v[j,3] := 0;
     v[j,4] := 0;
  end;
  i := hash(0,form1.TraceNumber.value,form1.SweepStep.value,1);  //find a table entry
  if i <> -1 then begin
   pins[0,i,0] := form1.TraceNumber.value;     //Update pin numbers
   pins[0,i,1] := form1.SweepStep.value;
   for j := 0 to maxpoints-1 do begin         // save the data to a traces[] array
    traces[0,i,j,1] := v[j,1];               //Image is not persistent unless saved to traces[] arr
    traces[0,i,j,2] := v[j,2];
    traces[0,i,j,3] := v[j,3];
    traces[0,i,j,4] := v[j,4];
   end;
  end;
  plotdata;                               //generate the graph
  paintdib;                               //paint graph on the Form
end;

procedure TForm1.plotbvcv1Click(Sender: TObject);
begin
 pastescript('plotbvcv');
end;

procedure TForm1.baseat1Click(Sender: TObject);
begin
 pastescript('baseat 255');
end;

procedure TForm1.sin16x1Click(Sender: TObject);
begin
 pastescript('sin16x');
end;

end.

