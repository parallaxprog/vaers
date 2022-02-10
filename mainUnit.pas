unit mainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, mySQLDbTables, Vcl.StdCtrls,
  Vcl.DBGrids, mySQLDirectQuery, MySQLBatch, dateUtils, IdIOHandler, Vcl.Grids,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.CheckLst, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, shellAPI, Vcl.Buttons, WinSVc, Registry;

type
 TConnectData = record
     username:string;
     password:string;
     dbport:string;
     dbname:string;
 end;

 TQueryThread = class(TThread)
  private
    cData: TConnectData;
    FSQL:string;
    FSQLList:TStringList;
    FYear:integer;
    FSumType, FStartYear, FLCount:integer;
    FResult:string;
    FFinished, FStop, FBatch:boolean;
    mySQL: TmySQLDatabase;
    workQuery: TmySQLQuery;
  public
    constructor Create(CreateSuspended:Boolean; SQL:string; batch:boolean; cd:TConnectData);
    destructor Destroy; override;
    procedure Execute(); override;
    procedure logMain;
    procedure LogStop;
    procedure FreeObjects;
    procedure InitObjects;
  end;

  TmainForm = class(TForm)
    mysql: TMySQLDatabase;
    dataQuery: TMySQLQuery;
    userSource: TDataSource;
    saveDataQuery: TMySQLQuery;
    delQuery: TMySQLQuery;
    MySQLBatch: TMySQLBatchExecute;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    pcMain: TPageControl;
    tsExtract: TTabSheet;
    tsStats: TTabSheet;
    tsQuery: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnSymptoms: TButton;
    btnVax: TButton;
    btnReadAll: TButton;
    Panel2: TPanel;
    meQuery: TMemo;
    Label2: TLabel;
    btnQuery: TButton;
    lblCountRes: TLabel;
    edResult: TEdit;
    userQuery: TMySQLQuery;
    btnSelect: TButton;
    lblFrom: TLabel;
    cbTable: TComboBox;
    lblWhere: TLabel;
    cbDied: TCheckBox;
    cbVaxed: TCheckBox;
    meQueryLog: TMemo;
    cbAgeBelow: TCheckBox;
    cbAge: TComboBox;
    pbQuery: TProgressBar;
    lblAction: TLabel;
    QueryTimer: TTimer;
    cbGroup: TCheckBox;
    cbSymptom: TCheckBox;
    cbSymptoms: TComboBox;
    tsBackup: TTabSheet;
    OpenDialog: TOpenDialog;
    checkQuery: TMySQLQuery;
    Label12: TLabel;
    cbQYears: TComboBox;
    btnData: TButton;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    btnCheckData: TButton;
    btnCheckVax: TButton;
    btnCheckSymp: TButton;
    btnStopCheck: TButton;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    btnCalc: TButton;
    edCalcCount: TEdit;
    Label5: TLabel;
    meCalcLog: TMemo;
    meCheckLog: TMemo;
    pbCalc: TProgressBar;
    QueryCalcTimer: TTimer;
    Button10: TButton;
    vaxChart: TChart;
    Panel5: TPanel;
    btnUpdate: TButton;
    cbDeaths: TCheckBox;
    cbInjected: TCheckBox;
    cbInjections: TCheckBox;
    cbSymptoms2: TCheckBox;
    cbHosp: TCheckBox;
    cbEmergency: TCheckBox;
    cbLifeThreat: TCheckBox;
    cbCovidDeaths: TCheckBox;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    sgStat: TStringGrid;
    cbDisp: TCheckBox;
    cbExtStay: TCheckBox;
    cbFluVaxed: TCheckBox;
    cbDef: TCheckBox;
    cbRec: TCheckBox;
    cbOff: TCheckBox;
    cbCalcYears: TCheckListBox;
    Button12: TButton;
    Button13: TButton;
    Label16: TLabel;
    sgFlu: TStringGrid;
    cbC19Vax: TCheckBox;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Panel6: TPanel;
    btnOpenLink: TButton;
    studyQuery: TMySQLQuery;
    studyQuerytitle: TWideStringField;
    studyQueryurl: TWideStringField;
    dbgStudies: TDBGrid;
    dsstudyQuery: TDataSource;
    btnUpdateStudies: TButton;
    Label17: TLabel;
    edFilter: TEdit;
    Label18: TLabel;
    edCount: TEdit;
    btnClear: TButton;
    TabSheet8: TTabSheet;
    tsSetup: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    btnCreateTables: TButton;
    Label19: TLabel;
    edUser: TEdit;
    edPass: TEdit;
    Label20: TLabel;
    lblFilepath: TLabel;
    edPath: TEdit;
    btnPath: TButton;
    meSetupLog: TMemo;
    btnCheckTextfile: TButton;
    btnConnect: TButton;
    btnLoadFlu: TButton;
    btnLoadStudies: TButton;
    btnDownload: TButton;
    edPort: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edDB: TEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Button1: TButton;
    Button2: TButton;
    cbYears: TCheckListBox;
    Panel12: TPanel;
    meLog: TMemo;
    SpeedButton1: TSpeedButton;
    lblCount: TLabel;
    edNum: TEdit;
    Button3: TButton;
    cbDelete: TCheckBox;
    pgBar: TProgressBar;
    Label1: TLabel;
    cbDatatype: TComboBox;
    Button11: TButton;
    Label3: TLabel;
    edCheckNum: TEdit;
    Label4: TLabel;
    edCheckResult: TEdit;
    Panel14: TPanel;
    Panel15: TPanel;
    cbCheckYears: TCheckListBox;
    Panel13: TPanel;
    Panel11: TPanel;
    Button4: TButton;
    Button5: TButton;
    cbYearsChecked: TCheckListBox;
    Panel16: TPanel;
    sbMain: TStatusBar;
    cbCheck: TCheckBox;
    lotChart: TChart;
    Panel17: TPanel;
    btnLotUpdate: TButton;
    LotQuery: TMySQLQuery;
    Label10: TLabel;
    edCountLot: TEdit;
    cbLimit: TComboBox;
    lblLimit: TLabel;
    Label23: TLabel;
    edPercent: TEdit;
    Label24: TLabel;
    edLotPercent: TEdit;
    Label25: TLabel;
    edADVReports: TEdit;
    cbLotType: TComboBox;
    Label26: TLabel;
    Label27: TLabel;
    edC19Share: TEdit;
    edC19Inj: TEdit;
    Label28: TLabel;
    lotDQuery: TMySQLDirectQuery;
    cbInspection: TCheckBox;
    Panel18: TPanel;
    Button14: TButton;
    edVisCount: TEdit;
    Label15: TLabel;
    Label29: TLabel;
    cbVisDom: TComboBox;
    Label30: TLabel;
    cbVisYear: TComboBox;
    meVisual: TMemo;
    DBGrid2: TDBGrid;
    Panel19: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Button16: TButton;
    edTableRecs: TEdit;
    cbTableDatatype: TComboBox;
    ComboBox2: TComboBox;
    tableQuery: TMySQLQuery;
    dstableQuery: TDataSource;
    Label34: TLabel;
    cbTableType: TComboBox;
    Button17: TButton;
    sqlBatch: TMySQLBatchExecute;
    Button18: TButton;
    Label35: TLabel;
    cleanTimer: TTimer;
    btnLoadC19LotList: TButton;
    btnLoadLotList: TButton;
    Label6: TLabel;
    edInsCount: TEdit;
    loadTimer: TTimer;
    Panel20: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button6: TButton;
    edCleanCount: TEdit;
    ComboBox1: TComboBox;
    meClean: TMemo;
    SpeedButton2: TSpeedButton;
    procedure btnDataClick(Sender: TObject);
    procedure btnSymptomsClick(Sender: TObject);
    procedure btnVaxClick(Sender: TObject);
    procedure btnReadAllClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure QueryTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPathClick(Sender: TObject);
    procedure cbSymptomClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnCheckVaxClick(Sender: TObject);
    procedure btnCheckDataClick(Sender: TObject);
    procedure btnCheckSympClick(Sender: TObject);
    procedure btnCheckTextfileClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure QueryCalcTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure sgStatDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure btnLoadFluClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure cbDeathsClick(Sender: TObject);
    procedure cbCovidDeathsClick(Sender: TObject);
    procedure cbInjectedClick(Sender: TObject);
    procedure cbInjectionsClick(Sender: TObject);
    procedure cbFluVaxedClick(Sender: TObject);
    procedure cbSymptoms2Click(Sender: TObject);
    procedure cbHospClick(Sender: TObject);
    procedure cbEmergencyClick(Sender: TObject);
    procedure cbLifeThreatClick(Sender: TObject);
    procedure cbDispClick(Sender: TObject);
    procedure cbC19VaxClick(Sender: TObject);
    procedure cbExtStayClick(Sender: TObject);
    procedure cbOffClick(Sender: TObject);
    procedure cbRecClick(Sender: TObject);
    procedure cbDefClick(Sender: TObject);
    procedure btnOpenLinkClick(Sender: TObject);
    procedure btnLoadStudiesClick(Sender: TObject);
    procedure btnUpdateStudiesClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure mysqlAfterConnect(Sender: TObject);
    procedure mysqlAfterDisconnect(Sender: TObject);
    procedure mysqlConnectionFailure(Connection: TMySQLDatabase; Error: string);
    procedure btnDownloadClick(Sender: TObject);
    procedure btnCreateTablesClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure btnLotUpdateClick(Sender: TObject);
    procedure btnLoadC19LotListClick(Sender: TObject);
    procedure tbLimitChange(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure cleanTimerTimer(Sender: TObject);
    procedure btnLoadLotListClick(Sender: TObject);
    procedure loadTimerTimer(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    dthSeries: TFastLineSeries;
    c19dthSeries: TFastLineSeries;
    indSeries: TFastLineSeries;
    injSeries: TFastLineSeries;
    fluSeries: TFastLineSeries;
    sympSeries: TFastLineSeries;
    hospSeries: TFastLineSeries;
    erSeries: TFastLineSeries;
    lifeSeries: TFastLineSeries;
    dispSeries: TFastLineSeries;
    C19Series: TFastLineSeries;
    extSeries: TFastLineSeries;
    offSeries: TFastLineSeries;
    recSeries: TFastLineSeries;
    defSeries: TFastLineSeries;
    lotSeries: TFastLineSeries;
  public
    { Public declarations }
    startTime:TDateTime;
    f:textfile;
    stopEx:boolean;
    qList, fList:TStringList;
    uploadPath, imagePath, serviceName, iniFile, serverPath, FPath:string;
    vaxNumC19, vaxNumTotal, vaxLotC19, vaxLotTotal, FStudyCOunt:integer;
    QueryThread:TQueryThread;
    cData:TConnectData;
    fastLoad, lotLoading:boolean;
    procedure log(s:string);
    procedure log2(s:string);
    procedure logSetup(s:string);
    function DoLineCount:integer;
    function LocalInfile:boolean;
    procedure openStudies;
    procedure saveSetup;
    procedure loadSetup;
    procedure loadQuery(fn:string);
    procedure loadStudies;
    procedure LoadLotData;
    procedure loadData(tableName:string;year:integer);
    function yearExist(tableName:string;year:integer):integer;
    procedure ExtractData(tableName:string;year:integer);
    procedure ExtractVax(tableName:string;year:integer);
    procedure ExtractSymp(tableName:string;Year:integer);
    function skipToID(endID:integer;var lineNo:integer):boolean;
    procedure checkNumRecords(tableName:string; year, count:integer);
    procedure checkData(tableName:string);
    procedure getVaxData;
    procedure logClean(s:string);
    procedure loadFluData;
  end;

var
  mainForm: TmainForm;

implementation

{$R *.dfm}

function ShellEx(FileName: string; Params: string): bool;
var
  exInfo: TShellExecuteInfo;
  Ph: DWORD;
begin
  FillChar(exInfo, SizeOf(exInfo), 0);
  with exInfo do
  begin
    cbSize := SizeOf(exInfo);
    fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
    Wnd := GetActiveWindow();
    exInfo.lpVerb := 'open';
    exInfo.lpParameters := PChar(Params);
    lpFile := PChar(FileName);
    nShow := SW_HIDE;
  end;
  if ShellExecuteEx(@exInfo) then
    Ph := exInfo.hProcess
  else
  begin
    ShowMessage(SysErrorMessage(GetLastError));
    Result := true;
    exit;
  end;
  while WaitForSingleObject(exInfo.hProcess, 50) <> WAIT_OBJECT_0 do sleep(100);
  CloseHandle(Ph);

  Result := true;
end;

function sizeOfFile (const Filename : string) : Cardinal;
var sr : tSearchRec;
begin
  if findFirst (filename, 0, sr) = 0 then
  begin
    result := sr.size;
    findClose (sr);
  end
  else result := 0;
end;

function Strip(const s: string): string;
var
  i, count: Integer;
begin
  setLength(result, length(s));
  count := 0;
  for i := 1 to length(s) do
  begin
    if charInSet(s[i], [#65..#90,#97..#122,#48..#57,#10,#13,#32,'.',',','?','!','(',')',':','%','/']) then
    begin
      inc(count);
      result[count] := s[i];
    end;
  end;
  setLength(result, count);
  result:=trim(result);
end;

function ReplaceCRLF(const s: string): string;
begin
  result:=stringReplace(s, #13+#10,' ',[rfReplaceAll]);
end;

constructor TQueryThread.Create(CreateSuspended:Boolean; SQL:string; batch:boolean; cd:TConnectData);
begin
  inherited Create(CreateSuspended);
  cData:=cd;
  Self.FreeOnTerminate := false;
  FSQLList:=TStringList.Create;
  FSQLList.Text:=SQL;
  FBatch:=batch;
  InitObjects;
end;

destructor TQueryThread.Destroy;
begin
  FreeObjects;
  inherited Free;
end;

procedure TQueryThread.Execute;
var resField:string;
    i, SumTypeCount:integer;
begin
  resField:='';
  FStop:=false;
  FFinished:=false;
  SumTypeCount:=1;

  for i:=0 to FSQLList.Count-1 do
  with workQuery do
  begin
    FLCount:=i;
    if active then close;
    sql.Text:=FSQLList[i];
    open;
    if not (recordCount=0) then
    begin
      if (recordCount=1) then
      begin
        resField:=fields[0].AsString;
        FResult:=resField;
      end else
      begin
        resField:=inttostr(recordCount);
        FResult:=resField;
      end;
    end;
    close;

    if FBatch  then
    FYear:=strToInt(copy(FSQLList[i], pos('year=',FSQLList[i])+5, 4));

    if FBatch and (SumTypeCount=1) then
    begin
      sql.Text:='delete from vaers.sums where year='+inttostr(FYear)+' and sum_id>0';
      ExecSQL;
    end;

    case FBatch of
      false: Synchronize(LogMain);
      true: begin
        FSQL:='insert into sums values(0, '+inttostr(SumTypeCount)+', '+inttostr(FYear)+', '+FResult+');';
        sql.Text:=FSQL;
        ExecSQL;
        inc(SumTypeCount);
        if SumTypeCount=14 then SumTypeCount:=1;
        FFinished:=(i=(FSQLList.Count-1));
        Synchronize(LogMain);
      end;
    end;

    if FStop then
    begin
      Synchronize(LogStop);
      Exit;
    end;
  end; //for
end;

procedure TQueryThread.LogStop;
begin
  with mainForm do
  begin
    meCalcLog.Lines.Insert(0, timeToStr(now)+' Calculation aborted by user!');
    pbCalc.Position:=pbCalc.Max;
    QueryCalcTimer.enabled:=false;
  end;
end;

procedure TQueryThread.LogMain;
begin
  case FBatch of
  false: with mainForm do
  begin
    lblAction.Caption:='Query finished';
    pbCalc.Position:=pbCalc.Max;
    QueryTimer.enabled:=false;
    if length(FResult)>0 then
    begin
      edResult.Text:=FResult;
      meQueryLog.Lines.Insert(0, 'Query: "'+ReplaceCRLF(FSQLList[FLCount])+'" - result: '+FResult);
    end;
  end;
  true: with mainForm do
  begin
    if StopEx then FStop:=true;
    edCalcCount.Text:=inttostr(FYear);
    meCalcLog.Lines.Insert(0, timeToStr(now)+' - Query: "'+FSQLList[FLCount]+'" - result: '+FResult);
    meCalcLog.Lines.Insert(0, timeToStr(now)+' - Insert Query: "'+FSQL+'"');
    if FFinished then
    begin
      pbCalc.Position:=pbCalc.Max;
      QueryCalcTimer.enabled:=false;
      meCalcLog.Lines.Insert(0, timeToStr(now)+' Calculation completed for chosen year(s)');
    end;
  end;
  end;
end;

procedure TQueryThread.InitObjects;
begin
  MySQL:=TMySQLDatabase.Create(nil);
  with MySQL do
  begin
    username:=cData.username;
    userpassword:=cData.password;
    loginPrompt:=false;
    keepConnection:=false;
    host:='127.0.0.1';
    port:=strToIntDef(cData.dbport, 3306);
    databasename:='vaers';
  end;
  workQuery:=TmySQLQuery.Create(nil);
  with workQuery do
  begin
    database:=Mysql;
    requestLive:=false;
  end;
end;

procedure TQueryThread.FreeObjects;
begin
  workQuery.Free;
  mySQL.Free;
  FSQLList.Free;
end;

procedure TmainForm.btnSelectClick(Sender: TObject);
var tableName, vaxTableName, sympTableName:string;

function getAge:string;
begin
  result:=inttostr(cbAge.ItemIndex*5+5);
end;

function getSymp(s:string):string;
begin
  result:=copy(s, 1, pos(',',s)-1);
  result:=stringReplace(result, '"','',[rfReplaceAll]);
end;

begin
  meQuery.Lines.Clear;
  vaxTableName:='';

  case cbTable.ItemIndex of
    0: begin
      tableName:='data';
      vaxTableName:='vax';
      sympTableName:='symptoms';
    end;
    1: tableName:='symptoms';
    2: tableName:='vax';
    3: begin
      tableName:='nddata';
      vaxTableName:='ndvax';
      sympTableName:='ndsymptoms';
    end;
    4: tableName:='ndsymptoms';
    5: tableName:='ndvax';
  end;

  if cbDied.Checked then
  begin
    if sameText(tableName,'vax') or sameText(tableName,'ndvax') then exit;
    if sameText(tableName,'symptoms') or sameText(tableName,'ndsymptoms') then exit;

    if (not cbVaxed.Checked) then
    begin
      with meQuery.Lines do
      begin
        Add('SELECT count(*)');
        Add('FROM '+ tableName);
        Add('WHERE died=1');
        if cbAgeBelow.Checked then
          Add('AND age_yrs<'+getAge);
      end;
    end else
    begin
      with meQuery.Lines do
      begin
        Add('SELECT count(*)');
        case cbSymptom.checked of
          true: begin
            Add('FROM vaers.'+ tableName + ' d, vaers.'+vaxTableName+' v, vaers.'+sympTableName+' s');
            Add('WHERE d.vaers_id=v.vaers_id AND d.vaers_id=s.vaers_id');
            Add('AND v.vax_type=''COVID19'' AND d.died=1');
          end;
          false: begin
            Add('FROM vaers.'+ tableName + ' d, vaers.'+vaxTableName+' v');
            Add('WHERE d.vaers_id=v.vaers_id AND v.vax_type=''COVID19'' AND d.died=1');
          end;
        end;
        if cbAgeBelow.Checked then
          Add('AND d.age_yrs<'+getAge);
        if cbSymptom.Checked then
          Add('AND s.symptom='''+getSymp(cbSymptoms.Items[cbSymptoms.ItemIndex])+'''');
        if cbGroup.Checked then
          Add('GROUP BY d.vaers_id');
      end;
    end;
  end else
  //not died
  if cbVaxed.Checked then
  begin
    if sameText(tableName,'vax') or sameText(tableName,'ndvax') then
    with meQuery.Lines do
    begin
      Add('SELECT count(*)');
      Add('FROM '+ tableName);
      Add('WHERE vax_type=''COVID19''');
      if cbGroup.Checked then
        Add('GROUP BY vaers_id');
    end;

    if sameText(tableName,'data') or sameText(tableName,'nddata') then
    with meQuery.Lines do
      begin
        Add('SELECT count(*)');
        case cbSymptom.checked of
          true: begin
            Add('FROM vaers.'+ tableName + ' d, vaers.'+vaxTableName+' v, vaers.'+sympTableName+' s');
            Add('WHERE d.vaers_id=v.vaers_id AND d.vaers_id=s.vaers_id');
            Add('AND v.vax_type=''COVID19''');
          end;
          false: begin
            Add('FROM vaers.'+ tableName + ' d, vaers.'+vaxTableName+' v');
            Add('WHERE d.vaers_id=v.vaers_id AND v.vax_type=''COVID19''');
          end;
        end;
        if cbAgeBelow.Checked then
          Add('AND d.age_yrs<'+getAge);
        if cbSymptom.Checked then
          Add('AND s.symptom='''+getSymp(cbSymptoms.Items[cbSymptoms.ItemIndex])+'''');
        if cbGroup.Checked then
          Add('GROUP BY d.vaers_id');
      end;
  end else
  begin
    if sameText(tableName,'vax') or sameText(tableName,'ndvax') then
    with meQuery.Lines do
    begin
      Add('SELECT count(*)');
      Add('FROM '+ tableName);
      if cbGroup.Checked then
        Add('GROUP BY vaers_id');
    end;
  end;
end;

procedure TmainForm.btnQueryClick(Sender: TObject);
var tableName, resField:string;

begin
  if length(meQuery.Lines.Text)=0 then exit;

  lblAction.Caption:='Running query...';

  if pos('count(*)', meQuery.Lines.Text)<>0 then
  begin
    pbQuery.position:=0;
    queryTimer.Enabled:=true;
    meQuery.Lines.Text:=stringReplace(meQuery.Lines.Text, #13+#10,' ',[rfReplaceAll]);
    QueryThread:=TQueryThread.Create(true, meQuery.Lines.Text, false, cData);
    QueryThread.Resume;
    Exit;
  end;

  case cbTable.ItemIndex of
    0: tableName:='data';
    1: tableName:='symptoms';
    2: tableName:='vax';
    3: tableName:='nddata';
    4: tableName:='ndsymptoms';
    5: tableName:='ndvax';
  end;
  resField:='';
  with userQuery do
  begin
    if active then close;
    sql.Text:=meQuery.Lines.Text;
    open;
    if not (recordCount=0) then
    begin
      if (recordCount=1) then
      begin
        resField:=fields[0].AsString;
        edResult.Text:=resField;
      end else
      begin
        resField:=inttostr(recordCount);
        edResult.Text:=resField;
      end;
    end;
  end;
  lblAction.Caption:='Finished query';
  if length(resField)>0 then
    meQueryLog.Lines.Insert(0, 'Query: "'+ReplaceCRLF(userQuery.SQL.Text)+'" - result: '+resField);
end;

procedure TmainForm.ExtractSymp(tableName:string;Year:integer);
var fn:string;
   s, vid, symp2, symp3, symp4, symp5:string;
   i, IORes, endID, lineNo:integer;
   sTime:TDateTime;

procedure saveData(s:string);

function getField(maxD:integer):string;
var p:integer;
begin
  result:='';
  if copy(s,1,1)='"' then
  begin
    s:=copy(s, 2, length(s));
    p:=pos('",',s);
    if (p<>0) then
    begin
      result:=copy(s, 1, p-1);
      result:=stringReplace(result,'''','',[rfReplaceAll]);
      result:=stringReplace(result,'"','',[rfReplaceAll]);
      result:=strip(stringReplace(result,'""','',[rfReplaceAll]));
      result:=copy(result,1,maxD);
      s:=copy(s, p+2, length(s));
      exit;
    end else if (pos('"',s)=length(s))  then
    begin
      result:=copy(s, 1, length(s));
      result:=stringReplace(result,'''','',[rfReplaceAll]);
      result:=stringReplace(result,'"','',[rfReplaceAll]);
      result:=strip(stringReplace(result,'""','',[rfReplaceAll]));
      result:=copy(result,1,maxD);
      exit;
    end;
  end;

  p:=pos(',',s);
  if p<>0 then
  begin
    result:=copy(s, 1, p-1);
    result:=strip(stringReplace(result,'''','',[rfReplaceAll]));
    result:=copy(result,1,maxD);
    s:=copy(s, p+1, length(s));
  end;
end;

begin
  s:=stringReplace(s,'""','',[rfReplaceAll]);
  with MySQLBatch do
  begin
    vID:=getField(15);
    sql.Text:='insert into '+tableName+' values(0,'+vid+','+inttostr(year)+',"'+getField(100)+'","'+getField(10)+'");';

    symp2:=getField(100);
    if length(symp2)>0 then
    sql.Text:=sql.Text+'insert into '+tableName+' values(0,'+vid+','+inttostr(year)+',"'+symp2+'","'+getField(10)+'");';

    symp3:=getField(100);
    if length(symp3)>0 then
    sql.Text:=sql.Text+'insert into '+tableName+' values(0,'+vid+','+inttostr(year)+',"'+symp3+'","'+getField(10)+'");';

    symp4:=getField(100);
    if length(symp4)>0 then
    sql.Text:=sql.Text+'insert into '+tableName+' values(0,'+vid+','+inttostr(year)+',"'+symp4+'","'+getField(10)+'");';

    symp5:=getField(100);
    if length(symp5)>0 then
    sql.Text:=sql.Text+'insert into '+tableName+' values(0,'+vid+','+inttostr(year)+',"'+symp5+'","'+getField(10)+'");';
    ExecSQL;
  end;
end;

begin
  lineNo:=0;
  if not cbDelete.Checked then
  begin
    Log('Symptomsdata extraction, year: '+inttostr(Year)+', checking database...');
    application.ProcessMessages;
    endID:=yearExist(tableName, Year);
  end else endID:=0;

  if endID<>0 then Log('Found records in database, starting at: '+inttostr(endID+1));

  if year=0 then
  fn:='NonDomesticVAERSSYMPTOMS.csv' else
  fn:=inttostr(year)+'VAERSSYMPTOMS.csv';

  fn:=edPath.Text+'\'+fn;
  if not fileExists(fn) then
  begin
    Log('File: "'+fn+'" did not exist on disk, extraction aborted!');
    Exit;
  end;

  if cbDelete.Checked then
  with delQuery do
  begin
    Log('Symptomsdata extraction, year: '+inttostr(Year)+', deleting database...');
    application.ProcessMessages;
    sql.Text:='delete from '+tableName+' where vaers_id>0 and year='+inttostr(year)+';';
    ExecSQL;
  end;

  {$I-}
  assignFile(f, fn);
  reset(f);
  {$I+}
  IORes:=IOResult;
  if IORes<>0 then
  begin
    Log('Error opening file: "'+fn+'", extraction aborted!');
    Exit;
  end;

  Log('File: '+fn+', size: '+floattostrf(SizeOfFile(fn)/1048576, ffFixed, 8, 2)+' Mb');
  pgBar.Position:=0;
  pgBar.Max:=DoLineCount;

  //read out first line with field descriptions
  readln(f, s);
  if endID<>0 then
  if not skipToID(endID, lineNo) then
  begin
    showMessage('Did not find starting point in file, extraction aborted!');
    Exit;
  end else Log('Skipped to last saved row, vaers_id='+inttostr(endID));

  i:=lineNo;
  sTime:=now;
  stopEx:=false;

  while (not eof(f)) and (not stopEx) do
  begin
    inc(i);
    pgBar.Position:=i;
    readln(f, s);
    if i mod 100 = 0 then
    begin
      edNum.text:=inttostr(i);
      edNum.Refresh;
    end;
    application.ProcessMessages;
    saveData(s);
  end;

  closefile(f);
  edNum.text:=inttostr(i);
  edNum.Refresh;
  case stopEx of
    true: log('Symptomsdata extraction stopped, time: '+TimeToStr(now-sTime)+', lines processed: '+inttostr(i));
    false: log('Finished symptomsdata extraction, time: '+TimeToStr(now-sTime)+', lines processed: '+inttostr(i));
  end;
end;

procedure TmainForm.Button10Click(Sender: TObject);
begin
  stopEx:=true;
  meCalcLog.Lines.Insert(0, timeToStr(now)+' - Telling query thread to stop as soon as possible...');
  application.processmessages;
end;

procedure TmainForm.Button11Click(Sender: TObject);
begin
  meCheckLog.Lines.Clear;
  cbYearsChecked.CheckAll(cbUnchecked, false, false);
end;

procedure TmainForm.FormCreate(Sender: TObject);
begin
  qList:=TStringList.Create;
  fList:=TStringList.Create;

  dthSeries:=TFastLineSeries.Create(Self);
  c19dthSeries:=TFastLineSeries.Create(Self);
  indSeries:=TFastLineSeries.Create(Self);
  injSeries:=TFastLineSeries.Create(Self);
  sympSeries:=TFastLineSeries.Create(Self);
  hospSeries:=TFastLineSeries.Create(Self);
  erSeries:= TFastLineSeries.Create(Self);
  lifeSeries:= TFastLineSeries.Create(Self);
  dispSeries:= TFastLineSeries.Create(Self);
  extSeries:= TFastLineSeries.Create(Self);
  offSeries:= TFastLineSeries.Create(Self);
  recSeries:= TFastLineSeries.Create(Self);
  defSeries:= TFastLineSeries.Create(Self);
  fluSeries:=TFastLineSeries.Create(Self);
  C19Series:= TFastLineSeries.Create(Self);
  lotSeries:= TFastLineSeries.Create(Self);

  with dthSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clRed;
  end;
  with c19dthSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clGreen;
  end;
  with indSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clBlack;
  end;
  with injSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clBlue;
  end;
  with sympSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clBlue;
  end;
  with hospSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clBlue;
  end;
  with erSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clFuchsia;
  end;
  with lifeSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clBlue;
  end;
  with dispSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clBlue;
  end;
   with extSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clFuchsia;
  end;
  with offSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clBlue;
  end;
  with recSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clBlue;
  end;
  with defSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clBlue;
  end;
  with fluSeries do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clFuchsia;
    VertAxis :=  aRightAxis;
  end;
  with C19Series do
  begin
    ParentChart :=vaxChart;
    SeriesColor:=clBlue;
    VertAxis :=  aRightAxis;
  end;
  with LotSeries do
  begin
    ParentChart :=lotChart;
    SeriesColor:=clRed;
    VertAxis :=  aBothVertAxis;
  end;
 end;

procedure TmainForm.FormDestroy(Sender: TObject);
begin
  qList.Free;
  fList.Free;
  dthSeries.Free;
  c19dthSeries.Free;
  indSeries.Free;
  injSeries.Free;
  fluSeries.Free;
  sympSeries.Free;
  hospSeries.Free;
  erSeries.Free;
  lifeSeries.Free;
  dispSeries.Free;
  C19Series.Free;
  extSeries.Free;
  offSeries.Free;
  recSeries.Free;
  defSeries.Free;
end;

procedure TmainForm.btnUpdateClick(Sender: TObject);
var i, j, x0, x1, y:integer;
    qList:TStringList;
    num:single;
    cSeries:TChartSeries;
begin
  vaxChart.Axes.Right.SetMinMax(0, 200000000);
  vaxChart.Axes.Left.SetMinMax(0, 10000);

  for i:=1 to 14 do
  begin
    cSeries:=vaxChart.Series[i-1];
    cSeries.Clear;
    if (i=1) or (i=14) then
    cSeries.Visible:=true else cSeries.Visible:=false;
    with userQuery do
    begin
      sql.Text:='select sum, year from sums where sumtype_id='+inttostr(i)+' and year<2022 order by year asc';
      open;
      while not eof do
      begin
        num:=fieldByName('sum').AsInteger;
        if (i=3) or (i=4) or (i=5) then num:=round(num/100);
        if (i=13)  then num:=num*10;
        if (i=14) then num:=num*1000000;
        if (i in [6,7,11,12]) then num:=round(num/10);
        cSeries.Add(num, fieldByName('year').AsString, clRed);
        next;
      end;
      close;
    end;
  end;

  c19Series.Clear;
  c19Series.Visible:=false;
  for i:=1990 to pred(yearOf(now)) do
  begin
    case i of
      1990..2019: c19Series.Add(0, inttostr(i), clRed);
      2020: c19Series.Add(38809, inttostr(i), clRed);
      2021: c19Series.Add(206970000, inttostr(i), clRed);
      //2022: c19Series.Add(206970000, i, clRed);
    end;
  end;

  y:= vaxChart.LeftAxis.CalcPosValue(157);
  x0 := vaxChart.BottomAxis.CalcPosValue(0);
  x1 := vaxChart.BottomAxis.CalcPosValue(31);
  vaxChart.Canvas.Pen.Color := clRed;
  vaxChart.Canvas.Pen.Width:=2;
  vaxChart.Canvas.Pen.Style := psDash;
  vaxChart.Canvas.DoHorizLine(x0, x1, y);

  with system.sysutils.formatsettings do
  begin
    ThousandSeparator:='.';
    DecimalSeparator:=',';
  end;

  qList:=TStringList.Create;
  qList.Add('SELECT * FROM sums where year=2022 order by sumtype_id;');
  qList.Add('SELECT * FROM sums where year=2021 order by sumtype_id;');
  qList.Add('SELECT  avg(sum) as sum, sumtype_id from sums where year<2021 group by sumtype_id order by sumtype_id');

  with userQuery do
  for j:=0 to 2 do
  begin
    sql.Text:=qList[j];
    open;
    for i:=0 to 13 do
    begin
      num:=fieldByName('sum').AsFloat;
      if i=13 then
      begin
        num:=num*1000000;
        sgFlu.cells[i-13, j]:=floatToStrF(num, ffNumber, 10, 0);
      end else
        sgStat.cells[i, j]:=floatToStrF(num, ffNumber, 8, 0);
      next;
    end;
    close;
  end;

  sgFlu.cells[1, 0]:=floatToStrF(4590000, ffNumber, 10, 0);
  sgFlu.cells[1, 1]:=floatToStrF(206970000, ffNumber, 10, 0);
  sgFlu.cells[1, 2]:='2020:'+floatToStrF(38809, ffNumber, 10, 0);

  qList.Free;
end;

procedure TmainForm.Button12Click(Sender: TObject);
begin
  cbCalcYears.CheckAll(cbChecked, false, false);
end;

procedure TmainForm.Button13Click(Sender: TObject);
begin
  cbCalcYears.CheckAll(cbUnChecked, false, false);
end;

procedure TmainForm.Button14Click(Sender: TObject);
var fn, s:string;
    IORes, count:integer;
begin
  case cbVisDom.ItemIndex of
    0: fn:='VAERS Patientdata - deaths for year '+cbVisYear.Text+'.txt';
    1: fn:='VAERS Patientdata - non-domestic deaths.txt';
  end;

  if not fileExists(fn) then
  begin
    Log('Error opening patientdata inspections file: "'+fn+'", load aborted!');
    Exit;
  end;

  meVisual.Lines.LoadFromFile(fn);
  edVisCount.Text:=floattostrf(meVisual.Lines.count, ffNumber, 7, 0);
end;

procedure TmainForm.btnLotUpdateClick(Sender: TObject);
begin
  LoadLotData;
end;

procedure TmainForm.tbLimitChange(Sender: TObject);
begin
  if not lotLoading then
    btnLotUpdateClick(Self);
end;

procedure TmainForm.LoadLotData;
var i:integer;
    limit, count, c19count:integer;
begin
  limit:=strToIntDef(cbLimit.TExt,-1);
  if limit<0 then begin
    cbLimit.TExt:='';
    exit;
  end;
  cbLotType.Enabled:=false;
  lotLoading:=true;
  lotChart.Axes.Left.SetMinMax(0, 5000);
  lotChart.Axes.Right.SetMinMax(0, 5000);
  lotSeries.Clear;
  //lotSeries.BarPen.Color:=clRed;
  lotSeries.Marks.Visible := false;
  lotSeries.BeginUpdate;
  //lblLimit.Caption:='Event limit: '+cbLimit.Text;
  i:=0;
  count:=0;
  c19count:=0;
  edC19Share.Text:='100 %';
  with lotDQuery do
  begin
    if active then close;

    case cbLotTYpe.ItemIndex of
      0: sql.Text:='SELECT * FROM vaers.vaxdist where length(vax_lot)>0 and vax_lot<>"unknown" and injections>='+trim(cbLimit.TExt)+' order by injections asc';
      1: sql.Text:='SELECT * FROM vaers.vaxlot where injections>='+trim(cbLimit.TExt)+' order by injections asc';
    end;

    open;
    if not (recordCount=0) then
    while not eof do
    begin
      inc(i);
      count:=count+strToInt(fieldValueByFieldName('injections'));

      if cbLotType.ItemIndex=1 then
      if sameText(fieldValueByFieldName('vax_type'), 'COVID19') then
        inc(c19count);

      if i mod 10000 = 0 then
      case cbLotType.ItemIndex of
      0:  begin
        edCountLot.Text:=floattostrf(i, ffNumber, 8, 0)+'/'+floattostrf(vaxLotC19, ffNumber, 8, 0);
        edLotPercent.Text:=floatToStrF(i/vaxLotC19*100, ffFixed, 3, 2)+' %';
        edPercent.Text:=floatToStrF(count/vaxNumC19*100, ffFixed, 3, 2)+' %';
        edADVReports.Text:=floattostrf(count, ffNumber, 8, 0)+'/'+floattostrf(vaxNumC19, ffNumber, 8, 0);
        edC19Inj.Text:=floattostrf(i, ffNumber, 8, 0)+'/'+floattostrf(i, ffNumber, 8, 0);
        application.ProcessMessages;
      end;
      1:  begin
        if c19Count>0 then
          edC19Share.Text:=floatTOStrF(c19count/i*100, ffFixed, 3, 2)+' %';
        edCountLot.Text:=floattostrf(i, ffNumber, 8, 0)+'/'+floattostrf(vaxLotTotal, ffNumber, 8, 0);
        edLotPercent.Text:=floatToStrF(i/vaxLotTotal*100, ffFixed, 3, 2)+' %';
        edPercent.Text:=floatToStrF(count/vaxNumTotal*100, ffFixed, 3, 2)+' %';
        edADVReports.Text:=floattoStrf(count, ffNumber, 8, 0)+'/'+floattostrf(vaxNumTotal, ffNumber, 8, 0);
        edC19Inj.Text:=floattostrf(c19count, ffNumber, 8, 0)+'/'+floattostrf(i, ffNumber, 8, 0);
        application.ProcessMessages;
      end;
      end;
      lotSeries.Add(strToInt(fieldValueByFieldName('injections')), '', clRed);
      next;
    end;
    close;
  end;
  lotSeries.EndUpdate;
  lotChart.Refresh;

  case cbLotType.ItemIndex of
  0: begin
   edCountLot.Text:=floattostrf(i, ffNumber, 8, 0)+'/'+floattostrf(vaxLotC19, ffNumber, 8, 0);
   edLotPercent.Text:=floatToStrF(i/vaxLotC19*100, ffFixed, 3, 2)+' %';
   edPercent.Text:=floatToStrF(count/vaxNumC19*100, ffFixed, 3, 2)+' %';
   edADVReports.Text:=floattostrf(count, ffNumber, 8, 0)+'/'+floattostrf(vaxNumC19, ffNumber, 8, 0);
   edC19Inj.Text:=floattostrf(i, ffNumber, 8, 0)+'/'+floattostrf(i, ffNumber, 8, 0);
  end;
  1:  begin
   edCountLot.Text:=floattostrf(i, ffNumber, 8, 0)+'/'+floattostrf(vaxLotTotal, ffNumber, 8, 0);
   edLotPercent.Text:=floatToStrF(i/vaxLotTotal*100, ffFixed, 3, 2)+' %';
   edPercent.Text:=floatToStrF(count/vaxNumTotal*100, ffFixed, 3, 2)+' %';
   edADVReports.Text:=floattoStrf(count, ffNumber, 8, 0)+'/'+floattostrf(vaxNumTotal, ffNumber, 8, 0);
   if c19Count>0 then
     edC19Share.Text:=floatTOStrF(c19count/i*100, ffFixed, 3, 2)+' %';
   edC19Inj.Text:=floattostrf(c19count, ffNumber, 8, 0)+'/'+floattostrf(i, ffNumber, 8, 0);
  end;

  end;
  lotLoading:=false;
  cbLotType.Enabled:=true;
end;

procedure TmainForm.sgStatDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  S: string;
  SavedAlign: word;
begin
  if ARow=1 then
  begin
    if ACol=1 then (sender as TStringGrid).canvas.Brush.Color:=clYellow else
    (sender as TStringGrid).canvas.Brush.Color:=clMoneyGreen;
  end else
  (sender as TStringGrid).canvas.Brush.Color:=clWhite;
  (sender as TStringGrid).canvas.FillRect(Rect);
  S := (sender as TStringGrid).Cells[ACol, ARow];
  SavedAlign := SetTextAlign((sender as TStringGrid).Canvas.Handle, TA_RIGHT);
  (sender as TStringGrid).Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, S);
  SetTextAlign((sender as TStringGrid).Canvas.Handle, SavedAlign);
end;

procedure TmainForm.Button1Click(Sender: TObject);
begin
  cbYears.CheckAll(cbChecked, false, false);
end;

procedure TmainForm.Button2Click(Sender: TObject);
begin
  cbYears.CheckAll(cbUnChecked, false, false);
end;

procedure TmainForm.Button3Click(Sender: TObject);
begin
  meLog.Lines.Clear;
end;

procedure TmainForm.Button4Click(Sender: TObject);
begin
  cbCheckYears.CheckAll(cbChecked, false, false);
end;

procedure TmainForm.Button5Click(Sender: TObject);
begin
  cbCheckYears.CheckAll(cbUnChecked, false, false);
end;

procedure TmainForm.logClean(s:string);
begin
  meClean.Lines.Insert(0, timeToStr(now)+' - '+s);
end;

procedure TmainForm.Button6Click(Sender: TObject);
var i:integer;

procedure getNum;
begin
  with checkQuery do
  begin
    sql.Text:='select count(*) as num from vax where vax_type="COVID19";';
    open;
    if not (recordCount=0) then
    begin
      logClean('Number of covid19 injections : '+fieldByName('num').AsString);
    end;
    close;
  end;
  with checkQuery do
  begin
    sql.Text:='select count(*) as num from vax where vax_manu="UNKNOWN MANUFACTURER";';
    open;
    if not (recordCount=0) then
    begin
      logClean('Number of unknown covid10 lot manufacturers: '+fieldByName('num').AsString);
    end;
    close;
  end;
end;

begin
  //run a clean query for each of the lots in vaxlot tale
  logClean('Starting vax table cleaning for vax_type="covid19"...');
  getNum;

  i:=0;
  with lotQuery do
  begin
    sql.Text:='select * from vaxdist;';
    open;
    if not (recordCount=0) then
    while not eof do
    begin
      inc(i);
      edCleanCount.Text:=inttostr(i)+'/'+inttostr(recordcount);
      application.ProcessMessages;
      //first correct all lots in covid19 lot list where type is missing, made in 2021
      checkQuery.SQL.Text:='update vax set vax_type="COVID19" where vax_lot="'+fieldByName('vax_lot').AsString+'" and vax_type="UNK" and year=2021 and vax_id>0;';
      checkQuery.ExecSQL;

      checkQuery.SQL.Text:='update vax set vax_manu="'+fieldByName('vax_manu').AsString+'" where vax_lot="'+fieldByName('vax_lot').AsString+
        '" and (vax_manu="UNKNOWN MANUFACTURER" or vax_manu<>"'+fieldByName('vax_manu').AsString+'") and year=2021 and vax_id>0;';
      checkQuery.ExecSQL;
      if stopEx then
      begin
        application.ProcessMessages;
        logClean('Operation aborted by user');
        close;
        exit;
      end;
      getNum;
      next;
    end;
    close;
  end;

  logClean('Done running queries, now checking...');
  getNum;
  logClean('Finished vax table cleaning for vax_type="covid19"');
end;

procedure TmainForm.btnLoadStudiesClick(Sender: TObject);
begin
  loadStudies;
end;

procedure TmainForm.btnCreateTablesClick(Sender: TObject);
var sl:TStringList;
    s:string;
    IORes:integer;
begin
  //create db tables...
  if not FileExists('table definitions.sql') then
  begin
    showMessage('Missing table definitions file, table creation aborted!');
    Exit;
  end;

  with checkQuery do
  begin
    sql.Text:='SELECT * FROM information_schema.tables WHERE table_schema = "vaers"  AND table_name = "data" LIMIT 1;';
    open;
    if not (recordCount=0) then
    if MessageDlg('Tables already exist, do you want to proceed? Warning: all table data will be lost, and has to be loaded from text files.',
      mtWarning, mbYesNo, 0)=mrNo then  Exit;
    close;
  end;

  logSetup('Creating Database tables now...');
  {$I-}
  assignFile(f, 'table definitions.sql');
  reset(f);
  {$I+}
  IORes:=IOResult;
  if IORes<>0 then
  begin
    Log('Error opening table definitions file: "table definitions.sql", extraction aborted!');
    Exit;
  end;

  sl:=TStringList.Create;
  while not eof(f) do
  begin
    readLn(f, s);
    sl.Add(s);
  end;
  closeFile(f);

  with checkQuery do
  begin
    sql.Text:=sl.Text;
    ExecSQL;
  end;
  sl.Free;

  LogSetup('Success! Database tables created OK. You may now proceed to VAERS data extraction.');
end;

procedure TmainForm.btnLoadLotListClick(Sender: TObject);
var year, i:integer;
    s, fn:string;
    f:textfile;
begin
  logSetup('Deleting vaxlot table...');
  with checkQUery do
  begin
    sql.text:='delete from vaxlot where vaxlot_id>0;';
    ExecSQL;
  end;

  logSetup('Running table query...');
  with checkQUery do
  begin
    sql.text:='insert into vaxlot (vaxlot_id, vax_type, vax_manu, vax_lot, year, injections) select 0, vax_type, vax_manu, vax_lot, year, count(*) as injections '+
     'from vax group by vax_lot order by injections desc, vax_type, year;';
    ExecSQL;
  end;
  logSetup('Table query finished OK.');

  exit;

  fn:='vaxlot.sql';

  if (not fileExists(fn)) or (SizeOfFile(fn)=0) then
  begin
  i:=0;
    logSetup('Creating insert query...');
    assignFile(f,fn);
    rewrite(f);
    with checkQuery do
    begin
      sql.text:='select distinct vax_lot, vax_type, vax_manu, year, count(*) as injections from vax where length(vax_lot)>0 '+
      'group by vax_lot, vax_type, vax_manu, year order by injections desc, vax_type, year;';
      open;
      if not (recordCount=0) then
      while not eof do
      begin
        inc(i);
        s:='insert into vaxlot values(0, "'+fieldByName('vax_type').AsString+'","'+fieldByName('vax_manu').AsString+'","'+fieldByName('vax_lot').AsString+'",'+
        fieldByName('year').AsString+','+fieldByName('injections').AsString+');';
        writeln(f, s);
        edInsCount.Text:=inttostr(i);
        application.ProcessMessages;
        next;
      end;
      close;
      closeFile(f);
    end;
  end;

  if (not fileExists(fn)) or (SizeOfFile(fn)=0) then
  begin
    logSetup('Error creating insert query file!');
    Exit;
  end else logSetup(' Success! Insert query created.');

  exit;

  loadQuery(extractFilePath(application.ExeName)+fn);
  Logsetup(' Success! Finished inserting data to DB.');
end;

procedure TmainForm.btnConnectClick(Sender: TObject);
begin
  //check db
  with mySQL do
  begin
    close;
    username:=edUser.Text;
    userpassword:=edPass.Text;
    connect;
  end;
end;

procedure TmainForm.btnDownloadClick(Sender: TObject);
begin
  //download 2022 data from a server
  showMessage('Not yet implemented');
end;

procedure TmainForm.btnClearClick(Sender: TObject);
begin
  edFilter.Text:='';
  btnUpdateStudiesClick(Self);
end;

procedure TmainForm.btnUpdateStudiesClick(Sender: TObject);
begin
  openStudies;
end;

procedure TmainForm.btnCheckTextfileClick(Sender: TObject);
var fn:string;
    fCount, year, fSize, lines, fileType, eSize:integer;
    fExists, fMatch, Error:boolean;
begin
  Error:=false;
  fCount:=0;
  stopEx:=false;
  for fileType:=1 to 3 do
  for year:=yearOf(now) downto 1990 do
  begin
    inc(fCount);
    edCheckNum.Text:=inttostr(fCount);
    application.ProcessMessages;
    if stopEx then exit;

    case fileType of
      1: fn:=edPath.Text+'\'+inttostr(year)+'VAERSDATA.csv';
      2: fn:=edPath.Text+'\'+inttostr(year)+'VAERSSYMPTOMS.csv';
      3: fn:=edPath.Text+'\'+inttostr(year)+'VAERSVAX.csv';
    end;
    fExists:=fileExists(fn);
    fSize:=SizeOfFile(fn);
    if fExists then
    with checkQUery do
    begin
      sql.Text:='select size from filedata where year='+inttostr(year)+' and filetype='+inttostr(fileTYpe)+';';
      open;
      if not (recordCount=0) then
      begin
        eSize:=fieldByName('size').AsInteger;
        fMatch:=(fSize=eSize);
      end;
      close;
      if fMatch then
      begin
        sql.text:='update filedata set status=2 where filetype='+inttostr(filetype)+' and year='+inttostr(year)+';';
        execSQL;
        LogSetup('Filesize match OK, file: "'+extractfilename(fn)+'", expected size: '+inttostr(eSize)+', actual size: '+inttostr(fSize));
      end else Log2('ERROR - filesize mismatch, file: "'+extractfilename(fn)+'", expected size: '+inttostr(eSize)+', actual size: '+inttostr(fSize));
    end else
    with checkQUery do
    begin
      Error:=true;
      LogSetup('Error - file not found: "'+fn+'"');
      sql.text:='update filedata set status=0 where filetype='+inttostr(filetype)+' and year='+inttostr(year)+';';
      execSQL;
    end;
  end;

  case Error of
    true: edCheckResult.Text:='Error(s) found during file check!';
    false: edCheckResult.Text:='File check completed with success!';
  end;
end;

procedure TmainForm.btnLoadFluClick(Sender: TObject);
begin
  loadFluData;
end;

procedure TmainForm.btnOpenLinkClick(Sender: TObject);
begin
  //open link
  ShellExecute(Handle, 'open', PChar(studyQuery.FieldByName('url').AsString), '', '', SW_SHOW);
end;

procedure TmainForm.loadQuery(fn:string);
var progpath, param:string;
    //Zip:TZipFile;
    zipFilename, updateName, CmdLine:string;
    startTime:TDateTIme;
    fSize:int64;
    res, error:integer;
    server:string;
    sl:TStringList;

function ShellEx(FileName: string; Params: string): bool;
var
  exInfo: TShellExecuteInfo;
  Ph: DWORD;
begin
  FillChar(exInfo, SizeOf(exInfo), 0);
  with exInfo do
  begin
    cbSize := SizeOf(exInfo);
    fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
    Wnd := GetActiveWindow();
    exInfo.lpVerb := 'open';
    exInfo.lpParameters := PChar(Params);
    lpFile := PChar(FileName);
    nShow := SW_HIDE;
  end;
  if ShellExecuteEx(@exInfo) then
    Ph := exInfo.hProcess
  else
  begin
    ShowMessage(SysErrorMessage(GetLastError));
    Result := true;
    exit;
  end;
  while WaitForSingleObject(exInfo.hProcess, 50) <> WAIT_OBJECT_0 do sleep(100);
  CloseHandle(Ph);

  Result := true;
end;

begin
  param:=' -u '+cData.username+' -p ' +cData.password+ ' vaers < "' +fn+'"';
  startTime:=now;
  server:=StringReplace(serverPath, 'mysqld.exe','mysql.exe',[rfReplaceAll]);
  sl:=TStringList.create;
  sl.Add('cmd.exe /c "'+server+'" -u '+cData.username+' -p'+cData.password+' vaers < "'+fn+'"');
  sl.SaveToFile(extractFilePath(fn)+'insert.bat');
  sl.Free;
  //res:=ShellExecute(0, 'open', 'd:\insert.bat',  nil, '', SW_SHOW);
  //if res>=32 then
  logSetup('Loading Query Data...');
   if ShellEx(extractFilePath(fn)+'insert.bat','') then
  begin
     logSetup('Query Data loaded OK!');
  end else logSetup('Error');
end;

procedure TmainForm.btnLoadC19LotListClick(Sender: TObject);
begin
  logSetup('Deleting vaxdist table...');
  with checkQUery do
  begin
    sql.text:='delete from vaxdist where vaxdist_id>0;';
    ExecSQL;
  end;

  logSetup('Running table query...');
  with checkQUery do
  begin
    sql.text:='insert into vaxdist (vaxdist_id, vax_lot, vax_manu, injections) select 0, vax_lot, vax_manu, count(*) as injections '+
      'from vaers.vax where vax_type="COVID19" and length(vax_lot)>0 and vax_lot<>"unknown" and vax_lot<>"unk" '+
      'group by vax_lot, vax_manu order by injections desc;';
    ExecSQL;
  end;
  logSetup('Table query finished OK.');
end;

procedure TmainForm.Button16Click(Sender: TObject);
var tableName:string;
begin
  case cbTableDatatype.ItemIndex of
  0: case cbTableType.ItemIndex of
    0: TableName:='data';
    1: TableName:='symptoms';
    2: TableName:='vax';
  end;
  1: case cbTableType.ItemIndex of
    0: TableName:='nddata';
    1: TableName:='ndsymptoms';
    2: TableName:='ndvax';
  end;
  end;

  with tableQUery do
  begin
    if active then close;
    sql.Text:='select vaers_id, year, recvdate, state, age_yrs, sex, rpt_date, substring(cast(symptom_text as char),1,500) as symptom_text, '+
    'died, datedied, l_threat, er_visit, hospital, hospdays, x_stay, disable, recovd, vax_date, onset_date, numdays, '+
    ' substring(cast(lab_data as char),1,100) as lab_data, v_adminby, v_fundby, other_meds, cur_ill, '+
    ' substring(cast(history as char),1,100) as history, prior_vax, splttype, form_vers, todays_date, birth_defect, ofc_visit, er_ed_visit, '+
    ' substring(allergies, 1, 100) as allergies from '+tableName+' where year=2021;';
    open;
    edTableRecs.Text:=inttostr(recordCount);
  end;
end;

procedure TmainForm.Button17Click(Sender: TObject);
var i:integer;
    sl:TStringList;
begin

  sl:=TStringList.Create;

  with tableQuery do
  for i:=46715 to 1500000 do
  begin
     sl.Add('insert into test values(0, '+inttostr(i)+');');
     if i mod 100 = 0 then
     begin
       sqlBatch.SQL.Text:=sl.Text;
       sqlBatch.ExecSQL;
       sqlBatch.SQL.Text:='';
       sl.Clear;
       edTableRecs.Text:=inttostr(i);
       application.ProcessMessages;
     end;
  end;

  sl.Free;

  exit;

  if tableQuery.Active then tableQUery.Close;
end;

procedure TmainForm.Button18Click(Sender: TObject);
begin
  if MessageDlg('Do you want to set global variable "local_infile" to true? SUPER privileges needed, e.g. root account.',mtWarning, mbYesNO,0)=mrNo then exit;
  mysql.execute('set global local_infile=true;');
  //reconnect to get infile/fastload status
  btnConnectClick(Self);
end;

procedure TmainForm.btnCalcClick(Sender: TObject);
var year, i:integer;
    s:string;

function UnChecked:boolean;
var i:integer;
begin
  result:=true;
  for i:=0 to cbCalcYears.Items.Count-1 do
    if cbCalcYears.Checked[i] then
    result:=false;
end;

begin
  if UnChecked then
  begin
    ShowMessage('Please select year(s) first');
    exit;
  end;

  meCalcLog.Lines.Clear;
  qList.Clear;

  for i:=0 to cbCalcYears.Items.Count-1 do
  if cbCalcYears.Checked[i] then
  begin
    year:=yearOf(now)-i;
    qList.Add('select count(distinct s.vaers_id) from data d, symptoms s where (d.died=1 or s.symptom="Death") and d.vaers_id=s.vaers_id and d.year='+inttostr(year)+';');
    qList.Add('select count(distinct s.vaers_id) from data d, symptoms s, vax v where (d.died=1 or s.symptom="Death") and d.vaers_id=s.vaers_id and d.year='+
      inttostr(year)+' and d.vaers_id=v.vaers_id and v.vax_type="COVID19";');
    qList.Add('SELECT count(distinct vaers_id) FROM vaers.data where year='+inttostr(year)+';');
    qList.Add('SELECT count(*) FROM vaers.vax where year='+inttostr(year)+';');
    qList.Add('SELECT count(*) FROM vaers.symptoms where year='+inttostr(year)+';');
    qList.Add('SELECT count(*) FROM vaers.data where hospital=1 and year='+inttostr(year)+';');
    qList.Add('SELECT count(*) FROM vaers.data where ((er_visit=1) or (er_ed_visit=1)) and year='+inttostr(year)+';');
    qList.Add('SELECT count(*) FROM vaers.data where l_threat=1 and year='+inttostr(year)+';');
    qList.Add('SELECT count(*) FROM vaers.data where disable=1 and year='+inttostr(year)+';');
    qList.Add('SELECT count(*) FROM vaers.data where x_stay=1 and year='+inttostr(year)+';');
    qList.Add('SELECT count(*) FROM vaers.data where ofc_visit=1 and year='+inttostr(year)+';');
    qList.Add('SELECT count(*) FROM vaers.data where recovd=1 and year='+inttostr(year)+';');
    qList.Add('SELECT count(*) FROM vaers.data where birth_defect=1 and year='+inttostr(year)+';');
  end;

  lblAction.Caption:='Running query...';
  meCalcLog.Lines.Insert(0, timeToStr(now)+' Calculation starting...this may take some time.');

  pbCalc.position:=0;
  queryCalcTimer.Enabled:=true;
  QueryThread:=TQueryThread.Create(true, qList.text, true, cData);
  querythread.Resume;
end;

procedure TmainForm.loadFluData;
var s, yearStr, num:string;
    year, i, IORes:integer;
begin
  if not FileExists('fluvaxus2.csv') then
  begin
    showMessage('Missing flu vax history file, data extraction aborted!');
    Exit;
  end;

  with checkQuery do
  begin
    if active then close;
    sql.Text:='delete from vaers.sums where sumtype_id=14 and sum_id>0';
    ExecSQL;
  end;

  assignFile(f, 'fluvaxus2.csv');
  {$I-}
  reset(f);
  {$I+}
  IORes:=IOResult;
  if IORes<>0 then
  begin
    showMessage('Flu vax file not found, extraction aborted!');
    Exit;
  end;

  while not eof(f) do
  begin
    readln(f, s);
    yearStr:=copy(s, 1, pos('-',s)-1);
    num:=copy(s, pos(',',s)+1, length(s));
    year:=succ(strToIntDef(yearStr, 0));
    if (year>1989) then
    with checkQuery do
    begin
      sql.Text:='insert into sums values(0, 14, '+inttostr(year)+','+num+');';
      execSQL;
    end;
  end;

  if succ(year)<=yearOf(Now) then
  for i:=succ(year) to yearOf(now) do
  with checkQuery do
  begin
    sql.Text:='insert into sums values(0, 14, '+inttostr(i)+', 0);';
    execSQL;
  end;

  closeFile(f);
  meCalcLog.Lines.Insert(0, timeToStr(now)+' FLU Data loaded OK!');
end;

procedure TmainForm.btnCheckDataClick(Sender: TObject);
begin
  checkData('DATA');
end;

procedure TmainForm.btnCheckVaxClick(Sender: TObject);
begin
  checkData('VAX');
end;

procedure TmainForm.btnCheckSympClick(Sender: TObject);
begin
  checkData('SYMPTOMS');
end;

procedure TmainForm.checkData(tableName:string);
var i, j, IORes, year, count, numRecords, numSymp:integer;
    fn, s, filename:string;
    Error:boolean;

function cut(s:string;var c:integer):string;
begin
  if s[1]='"' then
  begin
    s:=copy(s, 2, length(s));
    result:=copy(s, pos('"',s)+2, length(s));
  end else
    result:=copy(s, pos(',',s)+1, length(s));
  if charInSet(result[1], [#65..#90,#97..#122,#32,'"']) then
    c:=succ(c) else
    if not charInSet(result[1], [#48..#57,',']) then Log2(result);
end;

function getNumSymp(s:string):integer;
var i:integer;
begin
  result:=0;
  for i:=1 to 9 do
    s:=cut(s, result);
end;

function UnChecked:boolean;
var i:integer;
begin
  result:=true;
  for i:=0 to cbCheckYears.Items.Count-1 do
    if cbCheckYears.Checked[i] then
    result:=false;
end;

begin
  if UnChecked then
  begin
    ShowMessage('Please select year(s) first');
    exit;
  end;

  Error:=false;
  stopEx:=false;
  fileName:='VAERS'+tableName+'.CSV';
  meCheckLog.Lines.Clear;
  cbYearsChecked.CheckAll(cbUnChecked, false, false);
  edCheckResult.Text:='Checking...';

  for year:=yearOf(now) downto 1990 do
  if cbCheckYears.Checked[yearOf(now)-year] then
  begin
    fn:=edPath.Text+'\'+inttostr(year)+fileName;
    log2('Checking file: '+fn+' for year '+inttostr(year)+' against table: '+tableName);
    {$I-}
    assignFile(f, fn);
    reset(f);
    {$I+}
    IORes:=IOResult;
    if IORes<>0 then
    begin
      Log2('Error opening file: "'+fn+'", extraction aborted!');
      Exit;
    end;

    count:=0;
    numSymp:=0;
    numRecords:=0;
    while not eof(f) do
    begin
      inc(count);
      readln(f, s);
      if sameText(tableName,'symptoms') then
      if count>1 then
        numSymp:=numSymp+getNumSymp(s);
      if count mod 5000 = 0 then
      begin
        edCheckNum.text:=inttostr(count);
        edCheckNum.Refresh;
      end;
      application.ProcessMessages;
      if stopEx then exit;
    end;
    count:=pred(count);

    with checkQuery do
    begin
      sql.Text:='select count(*) as num from '+tableName+' where year='+inttostr(year);
      open;
      if (recordCount<>0) then
      begin
        if length(fieldByName('num').AsString)>0 then
          numRecords:=fieldByName('num').AsInteger;
      end;
      close;
    end;

    if sameText(tableName,'symptoms') then
      count:=numSymp;

    case (count=numRecords) of
      false: begin
        Error:=true;
        Log2('Error - number of records in table ('+inttostr(numRecords)+') did NOT match lines in file ('+inttostr(count)+') !');
      end;
      true: begin
        Log2('Success - number of records in table ('+inttostr(numRecords)+') did match lines in file ('+inttostr(count)+') !');
        cbYearsChecked.Checked[abs(year-yearOf(now))]:=true;
      end;
    end;

    if stopEx then
    begin
      Log2('Data check aborted by user!');
      exit;
    end;
  end;

  case Error of
    false: edCheckResult.Text:='Data checking for table "'+tableName+'" completed with success!';
    true: edCheckResult.Text:='Data checking for table "'+tableName+'" found errors - check years list!';
  end;
end;

procedure TmainForm.ExtractVax(tableName:string;year:integer);
var fn:string;
   s, q:string;
   i, IORes, endID, lineNo:integer;
   sTime:TDateTime;

procedure saveData(s:string);

function getField(maxD:integer):string;
var p:integer;
begin
  result:='';
  if copy(s,1,1)='"' then
  begin
    s:=copy(s, 2, length(s));
    p:=pos('",',s);
    if (p<>0) then
    begin
      result:=copy(s, 1, p-1);
      result:=stringReplace(result,'''','',[rfReplaceAll]);
      result:=stringReplace(result,'"','',[rfReplaceAll]);
      result:=strip(stringReplace(result,'""','',[rfReplaceAll]));
      result:=copy(result,1,maxD);
      s:=copy(s, p+2, length(s));
      exit;
    end else if (pos('"',s)=length(s))  then
    begin
      result:=copy(s, 1, length(s));
      result:=stringReplace(result,'''','',[rfReplaceAll]);
      result:=stringReplace(result,'"','',[rfReplaceAll]);
      result:=strip(stringReplace(result,'""','',[rfReplaceAll]));
      result:=copy(result,1,maxD);
      exit;
    end;
  end;

  p:=pos(',',s);
  if p<>0 then
  begin
    result:=copy(s, 1, p-1);
    result:=strip(stringReplace(result,'''','',[rfReplaceAll]));
    result:=copy(result,1,maxD);
    s:=copy(s, p+1, length(s));
  end;
end;

begin
  s:=stringReplace(s,'""','',[rfReplaceAll]);
  with saveDataQuery do
  begin
    q:='insert into '+tableName+' (VAERS_ID, YEAR, VAX_TYPE, VAX_MANU, VAX_LOT, VAX_DOSE_SERIES, VAX_ROUTE, VAX_SITE, VAX_NAME) values('+
    getField(15)+','+      //VAERS_ID        max length
    inttostr(year)+',"'+   //add year field
    getField(15)+'","'+    //VAX_TYPE        15
    getField(40)+'","'+    //VAX_MANU        40
    getField(15)+'","'+    //VAX_LOT         15
    getField(3)+'","'+     //VAX_DOSE_SERIES  3
    getField(6)+'","'+     //VAX_ROUTE        6
    getField(6)+'","'+     //VAX_SITE         6
    getField(100)+'")';    //VAX_NAME        100
    //dataEdit.Text:=sql.Text;
    sql.Text:=q;
    //ExecSQL;
    mysql.Execute(q);
    //mySQLZ.ExecuteDirect(q);
  end;
   //VAERS_ID,VAX_TYPE,VAX_MANU,VAX_LOT,VAX_DOSE_SERIES,VAX_ROUTE,VAX_SITE,VAX_NAME
end;

begin
  lineNo:=0;
  if not cbDelete.Checked then
  begin
    Log('Vaxdata extraction, year: '+inttostr(Year)+', checking database...');
    application.ProcessMessages;
    endID:=yearExist(tableName, Year);
  end else endID:=0;

  if endID<>0 then Log('Found records in database, ending at: '+inttostr(endID));

  if year=0 then
  fn:='NonDomesticVAERSVAX.csv' else
  fn:=inttostr(year)+'VAERSVAX.csv';

  fn:=edPath.Text+'\'+fn;
  if not fileExists(fn) then
  begin
    Log('File: "'+fn+'" did not exist on disk, extraction aborted!');
    Exit;
  end;

  if cbDelete.Checked then
  with delQuery do
  begin
    Log('Vaxdata extraction, year: '+inttostr(Year)+', deleting database...');
    application.ProcessMessages;
    sql.Text:='delete from '+tableName+' where vaers_id>0 and year='+inttostr(year)+';';
    ExecSQL;
  end;

  {$I-}
  assignFile(f, fn);
  reset(f);
  {$I+}
  IORes:=IOResult;
  if IORes<>0 then
  begin
    Log('Error opening file: "'+fn+'", extraction aborted!');
    Exit;
  end;

  Log('File: '+fn+', size: '+floattostrf(SizeOfFile(fn)/1048576, ffFixed, 8, 2)+' Mb');
  pgBar.Position:=0;
  pgBar.Max:=DoLineCount;

  //read out first line with field descriptions
  readln(f, s);
  if endID<>0 then
  if not skipToID(endID, lineNo) then
  begin
    Log('Did not find starting point in file, extraction aborted!');
    Exit;
  end else Log('Skipped to last saved row, vaers_id='+inttostr(endID));

  i:=lineNo;
  sTime:=now;
  stopEx:=false;

  while (not eof(f)) and (not stopEx) do
  begin
    inc(i);
    pgBar.Position:=i;
    readln(f, s);
    if i mod 100 = 0 then
    begin
      edNum.text:=inttostr(i);
      edNum.Refresh;
    end;
    application.ProcessMessages;
    saveData(s);
  end;

  closeFile(f);
  edNum.text:=inttostr(i);
  case stopEx of
    true: log('Vaxdata extraction stopped, time: '+TimeToStr(now-sTime)+', lines processed: '+inttostr(i));
    false: log('Finished vaxdata extraction, time: '+TimeToStr(now-sTime)+', lines processed: '+inttostr(i));
  end;

  checkNumRecords(tableName, year, i);
end;

function TmainForm.skipToID(endID:integer;var lineNo:integer):boolean;
var found:boolean;
    s:string;
    i:integer;
begin
  found:=false;
  i:=0;
  while (not found) and (not eof(f)) do
  begin
    readln(f, s);
    inc(i);
    s:=copy(s, 1, pos(',',s)-1);
    found:=(strToIntDef(s, 0)=endID);
  end;
  result:=found;
  if result then lineNo:=i;
end;

function TmainForm.DoLineCount:integer;
var i:integer;
    s:string;
begin
  i:=0;
  log('Counting lines...');
  while not eof(f) do
  begin
    inc(i);
    readln(f, s);
    if i mod 100000 = 0 then
    begin
      edNum.text:=inttostr(i);
      edNum.Refresh;
    end;
    application.ProcessMessages;
    if stopEx then exit;
  end;
  meLog.Lines[0]:=timeToStr(now)+' - Counting lines: '+inttostr(i-1)+', starting data extraction...';
  reset(f);
  result:=i;
end;

procedure TmainForm.checkNumRecords(tableName:string; year, count:integer);
var num:integer;
begin
  num:=0;
  with checkQuery do
  begin
    sql.text:='select count(*) as maxid from '+tableName+' where year='+inttostr(year)+';';
    open;
    if (recordCount<>0) then
    begin
      if length(fieldByName('maxid').AsString)>0 then
        num:=fieldByName('maxid').AsInteger;
    end;
    close;
  end;
  case (num=count) of
    false: Log('Error - number of records in table ('+inttostr(num)+') did NOT match lines in file ('+inttostr(count)+') !');
    true: Log('Success - number of records in table ('+inttostr(num)+') did match lines in file ('+inttostr(count)+') !');
  end;
end;

function TmainForm.yearExist(tableName:string;year:integer):integer;
begin
  result:=0;
  with checkQuery do
  begin
    sql.text:='select max(vaers_id) as maxid from '+tableName+' where year='+inttostr(year)+';';
    open;
    if (recordCount<>0) then
    begin
      if length(fieldByName('maxid').AsString)>0 then
        result:=fieldByName('maxid').AsInteger;
    end;
    close;
  end;
end;

procedure TmainForm.loadSetup;
var s:string;
    IORes:integer;
begin
  FPath:='';
  edPath.Text:=FPath;
  if not fileExists('setup.txt') then Exit;
  assignFile(f, 'setup.txt');
  {$I-}
  reset(f);
  readLn(f, s);
  if length(s)>0 then
  begin
    FPath:=copy(s, pos('=',s)+1, length(s));
    edPath.text:=FPath;
  end;
  readLn(f, s);
  if length(s)>0 then
    cData.username:=copy(s, pos('=',s)+1, length(s));
  readLn(f, s);
  if length(s)>0 then
    cData.password:=copy(s, pos('=',s)+1, length(s));
  readLn(f, s);
  if length(s)>0 then
    cData.dbport:=copy(s, pos('=',s)+1, length(s));
  closeFile(f);
  {$I-}
  IORes:=IOResult;
  if IORes<>0 then
  begin
    LogSetup('Error reading setup file');
    pcMain.ActivePage:=tsSetup;
  end;

  edUser.Text:=cData.username;
  edPass.Text:=cData.password;
  edPort.Text:=cData.dbport;
end;

procedure TmainForm.saveSetup;
begin
  if directoryExists(edPath.Text) then
    FPath:=edPath.Text else
  begin
    showMessage('Path for VAERS data files does not exist and was not saved');
    Exit;
  end;
  assignFile(f, 'setup.txt');
  rewrite(f);
  writeLn(f, 'Path='+FPath);
  writeLn(f, 'User='+trim(edUser.Text));
  writeLn(f, 'Pass='+trim(edPass.Text));
  writeLn(f, 'Port='+trim(edPort.Text));
  closeFile(f);
end;

procedure TmainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  saveSetup;
  mySQL.Close;
end;

procedure TmainForm.mysqlAfterConnect(Sender: TObject);
begin
  logSetup('MySQL Database connected OK');
  if mySQL.Connected then fastLoad:=localInFile;

  case fastLoad of
    true: begin
      LogSetup('DB Fastload activated!');
      sbMain.Panels[1].Text:='Fastload Activated';
    end;
    false: begin
      LogSetup('DB Fastload NOT activated! Upgrade DB user privileges or set "local_infile=1" in DB initialization file "my.ini"');
      sbMain.Panels[1].Text:='Fastload not Activated';
    end;
  end;

  sbMain.Panels[0].Text:='DB: Connected';
end;

function TmainForm.LocalInfile:boolean;
begin
  result:=false;
  with checkQuery do
  begin
    sql.Text:='show global variables like "local_infile";';
    open;
    if not (recordCount=0) then
      result:=sameText(fields[1].AsString, 'ON');
    close;
  end;
end;

procedure TmainForm.FormShow(Sender: TObject);
var i:integer;

function GetServiceStatus(sService: String) : TServiceStatus;
var
  schm,
  schs: SC_Handle;
  ss: TServiceStatus;
  dwChkP: DWord;
  sMachine:string;
begin
  sMachine:='\\'+GetEnvironmentVariable('COMPUTERNAME');
  schm := OpenSCManager(PChar(sMachine), nil, SC_MANAGER_ENUMERATE_SERVICE);
  if (schm>0) then
  begin
    schs := OpenService(schm, PChar(sService), SERVICE_QUERY_STATUS);
    if (schs>0) then
    begin
        if not (QueryServiceStatus(schs, result)) then  RaiseLastOSError;
      CloseServiceHandle(schs);
    end else  RaiseLastOSError;
    CloseServiceHandle(schm);
  end;
end;

function GetRegInfo(s:string):string;
var
  i: integer;
  appid: string;
begin
  result:='';
  with TRegistry.Create do try
    RootKey := HKEY_LOCAL_MACHINE;
    access  := KEY_READ;
    if not OpenKey('SYSTEM\CurrentControlSet\Services\'+s+'\', False ) then
    begin
      logSetup('MySQL Service record not found!');
      exit;
    end;
    if valueExists('ImagePath') then result:=readString('ImagePath');
  finally
    free;
  end
end;

function getUploadPath:string;
var s:TStringList;
    i:integer;
begin
  //secure-file-priv="C:/ProgramData/MySQL/MySQL Server 8.0/Uploads"
  //local_infile = 1
  result:='N/A';
  s:=TStringList.Create;
  s.LoadFromFile(iniFile);
  for i:=0 to s.Count-1 do
  if pos('secure-file-priv', s[i])<>0 then
    result:=copy(s[i], pos('="',s[i])+2, length(s[i])-17);
  s.Free;
end;

procedure getMySQLInfo;
var res:integer;
    s:string;
begin
  serviceName:='';
  if not fileExists('scList.txt') then
    res:=ShellExecute(Handle, nil, 'cmd.exe', '/c sc query type=service > scListX.txt', '', SW_HIDE);
  if fileExists('scList.txt') then
  begin
    assignFile(f, 'scList.txt');
    reset(f);
    while (not eof(f)) and (length(serviceName)=0) do
    begin
      readln(f,s);
      if pos('MySQL',s)<>0 then
      //SERVICE_NAME: MySQL80
      begin
        serviceName:=copy(s, pos(': ',s)+2, length(s));
        imagePath:=getRegInfo(serviceName);
        if length(imagePath)>0 then
        begin
          logSetup('MySQL DB running, service name="'+serviceName+'"');
          iniFile:=copy(imagePath, pos('file=',imagePath)+6, length(imagePath));
          iniFile:=copy(iniFile, 1, pos('"',iniFile)-1);
          logSetup('MySQL Inifile="'+inifile+'"');
          serverPath:=copy(imagePath, 2, pos('exe"',imagePath)+1);
          logSetup('MySQL ServerPath="'+serverPath+'"');
          uploadPath:=getUploadPath;
          logSetup('MySQL Uploadpath="'+uploadPath+'"');
        end else logSetup('MySQL Registry ImagePath not found!');
      end;
    end;
    closeFile(f);
  end;
  //imagePath="C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqld.exe" --defaults-file="C:\ProgramData\MySQL\MySQL Server 8.0\my.ini" MySQL80
end;


begin
  vaxLotC19:=0;
  vaxLotTotal:=0;
  getMySQLInfo;
  pcMain.ActivePage:=tsSetup;

  loadSetup;
  if length(cData.username)>0 then
  with mySQL do
  begin
    UserName:=cData.username;
    UserPassword:=cData.password;
    DatabaseName:='vaers';
    Port:=strToIntDef(cData.dbport, 3306);
    Connect;
  end else
  begin
    pcMain.ActivePage:=tsSetup;
    LogSetup('No login data, Database not connected.');
  end;

  cbSymptoms.Items.clear;

  for i:=0 to (yearOf(now)-1990) do
  begin
    cbYears.Items.Add(inttostr(yearOf(now)-i));
    cbCheckYears.Items.Add(inttostr(yearOf(now)-i));
    cbCalcYears.Items.Add(inttostr(yearOf(now)-i));
    cbYearsChecked.Items.Add(inttostr(yearOf(now)-i));
    cbVisYear.Items.Add(inttostr(yearOf(now)-i));
  end;

  cbVisYear.ItemIndex:=0;

  vaxChart.Title.Text.Text:='';
  lotChart.Title.Text.Text:='';

  width:=1420;
  height:=810;
end;


procedure TmainForm.getVaxData;
begin
  //vaxLotC19, vaxLotTotal
  //all vax lots sorted by lot, number of injections
  with checkQuery do
  begin
    sql.Text:='select count(*) as num from vaxlot;';
    open;
    if not (recordCOunt=0) then
      vaxLotTotal:=fieldByName('num').AsInteger;
    close;
  end;
  //covid19 injection lots sorted by lot, manufacturer, number of injections
  with checkQuery do
  begin
    sql.Text:='select count(*) as num from vaxdist;';
    open;
    if not (recordCOunt=0) then
      vaxLotC19:=fieldByName('num').AsInteger;
    close;
  end;

  //SELECT count(distinct vax_id) FROM vax
  //number of vax events
   with checkQuery do
  begin
    sql.Text:='SELECT count(*) as num FROM vax;';
    open;
    if not (recordCOunt=0) then
      vaxNumTotal:=fieldByName('num').AsInteger;
    close;
  end;

  //number of C19 events
   with checkQuery do
  begin
    sql.Text:='SELECT count(*) as num FROM vax where vax_type="covid19";';
    open;
    if not (recordCOunt=0) then
      vaxNumC19:=fieldByName('num').AsInteger;
    close;
  end;

end;

procedure TmainForm.openStudies;
begin
 with studyQuery do
 begin
   if active then close;
   case (length(edFilter.Text)=0) of
    true: begin
      sql.text:='select title, url from studies order by title;';
      open;
      FStudyCOunt:=recordCount;
    end;
    false: begin
      sql.text:='select title, url from studies where title like "%'+trim(edFilter.Text)+'%" order by title;';
      open;
    end;
  end;
  edCount.Text:=inttostr(recordCount)+'/'+inttostr(FStudyCOunt);
  end;
end;

procedure TmainForm.loadStudies;
var fn, s:string;
    IORes:integer;
    lv:TListItem;
begin
  if not FileExists('studies.txt') then
  begin
    showMessage('Missing studies file, data extraction aborted!');
    Exit;
  end;

  Log('Loading studies file: "'+fn+'" into database...');

  {$I-}
  assignFile(f, 'studies.txt');
  reset(f);
  {$I+}
  IORes:=IOResult;
  if IORes<>0 then
  begin
    Log('Error opening studies file: "'+fn+'", extraction aborted!');
    Exit;
  end;

  checkQuery.SQL.Text:='delete from studies where study_id>0;';
  checkQuery.ExecSQL;
  while not eof(f) do
  begin
    readln(f, s);
    checkQuery.SQL.Text:='insert into studies values(0, "'+copy(s, 1, pos(':', s)-1)+'","'+copy(s, pos('https:', s), length(s))+'");';
    checkQuery.ExecSQL;
  end;
  closeFile(f);
  Log('Success! Studies data from file: "'+fn+'" loaded into database!');
end;

procedure TmainForm.loadTimerTimer(Sender: TObject);
begin
  loadTImer.Enabled:=false;
  if MySQL.Connected then
  begin
    logSetup('Loading LOT tables row counts...');
    getVaxData;
    logSetup('LOT tables row counts loaded OK');
    btnUpdateClick(Self);
    btnLotUpdateClick(Self);
    openStudies;
  end;
end;

procedure TmainForm.btnReadAllClick(Sender: TObject);
begin
  btnDataClick(Self);
  btnSymptomsClick(Self);
  btnVaxClick(Self);
end;

procedure TmainForm.btnStopClick(Sender: TObject);
begin
  stopEx:=true;
end;

procedure TmainForm.cbC19VaxClick(Sender: TObject);
begin
  C19Series.Visible:=cbC19Vax.Checked;
end;

procedure TmainForm.cbCovidDeathsClick(Sender: TObject);
begin
  c19dthSeries.Visible:=cbCovidDeaths.Checked;
end;

procedure TmainForm.cbDeathsClick(Sender: TObject);
begin
  dthSeries.Visible:=cbDeaths.Checked;
end;

procedure TmainForm.cbEmergencyClick(Sender: TObject);
begin
  erSeries.Visible:=cbEmergency.Checked;
end;

procedure TmainForm.cbFluVaxedClick(Sender: TObject);
begin
  fluSeries.Visible:=cbFluVaxed.Checked;
end;

procedure TmainForm.cbHospClick(Sender: TObject);
begin
  hospSeries.Visible:=cbHosp.Checked;
end;

procedure TmainForm.cbInjectedClick(Sender: TObject);
begin
  indSeries.Visible:=cbInjected.Checked;
end;

procedure TmainForm.cbInjectionsClick(Sender: TObject);
begin
  injSeries.Visible:=cbInjections.Checked;
end;

procedure TmainForm.cbLifeThreatClick(Sender: TObject);
begin
  lifeSeries.Visible:=cbLifethreat.Checked;
end;

procedure TmainForm.cbSymptomClick(Sender: TObject);
begin
  if cbSymptoms.Items.COunt=0 then
    cbSymptoms.Items.loadFromFile('symp freq.csv');
end;

procedure TmainForm.cbSymptoms2Click(Sender: TObject);
begin
  sympSeries.Visible:=cbSymptoms2.Checked;
end;

procedure TmainForm.cbDefClick(Sender: TObject);
begin
  defSeries.Visible:=cbDef.Checked;
end;

procedure TmainForm.cbRecClick(Sender: TObject);
begin
  recSeries.Visible:=cbRec.Checked;
end;

procedure TmainForm.cbOffClick(Sender: TObject);
begin
  offSeries.Visible:=cbOff.Checked;
end;

procedure TmainForm.cbExtStayClick(Sender: TObject);
begin
  extSeries.Visible:=cbExtStay.Checked;
end;

procedure TmainForm.cbDispClick(Sender: TObject);
begin
  dispSeries.Visible:=cbDisp.Checked;
end;

procedure TmainForm.log(s:string);
begin
  meLog.Lines.Insert(0, TimeToStr(now)+' - '+s);
end;

procedure TmainForm.logSetup(s:string);
begin
  meSetupLog.Lines.Insert(0, TimeToStr(now)+' - '+s);
end;


procedure TmainForm.mysqlAfterDisconnect(Sender: TObject);
begin
  logSetup('MySQL Database DISconnected OK');
  sbMain.Panels[0].Text:='DB: not Connected';
end;

procedure TmainForm.mysqlConnectionFailure(Connection: TMySQLDatabase;
  Error: string);
begin
  logSetup('MySQL Database connection error: '+error);
end;

procedure TmainForm.log2(s:string);
begin
  meCheckLog.Lines.Insert(0, TimeToStr(now)+' - '+s);
end;

procedure TmainForm.QueryCalcTimerTimer(Sender: TObject);
begin
  pbCalc.Position:=pbCalc.Position+1;
end;

procedure TmainForm.QueryTimerTimer(Sender: TObject);
begin
  pbQuery.Position:=pbQuery.Position+1;
end;

procedure TmainForm.btnSymptomsClick(Sender: TObject);
var tableName:string;
    year, i:integer;
begin
  startTime:=now;
  case cbDataType.ItemIndex of
    //Domestic, USA
  0: begin
       tableName:='SYMPTOMS';
       for i:=yearOf(now) downto 1990 do
       if cbYears.Checked[abs(i-yearOf(now))] then
       begin
         case fastLoad of
           true: loadData(tableName, i);
           false: extractData(tableName, i);
         end;
         if stopEx then
         begin
           Log('Data extraction aborted by user!');
           exit;
         end;
       end;
     end;
    //Non-Domestic
  1: begin
       tableName:='NDSYMPTOMS';
       case fastLoad of
         true: loadData(tableName, 0);
         false: extractSymp(tableName, 0);
       end;
     end;
  end;
  Log('Data extraction finished, time: '+inttostr(secondsBetween(now, startTime))+' secs.');
  cleanTimer.Enabled:=true;
end;

procedure TmainForm.btnVaxClick(Sender: TObject);
var tableName:string;
    year, i:integer;
begin
  startTime:=now;
  case cbDataType.ItemIndex of
    //Domestic, USA
  0: begin
       tableName:='VAX';
       for i:=yearOf(now) downto 1990 do
       if cbYears.Checked[abs(i-yearOf(now))] then
       begin
         case fastLoad of
           true: loadData(tableName, i);
           false: extractData(tableName, i);
         end;
         if stopEx then
         begin
           Log('Data extraction aborted by user!');
           exit;
         end;
       end;
     end;
    //Non-Domestic
  1: begin
       tableName:='NDVAX';
       case fastLoad of
         true: loadData(tableName, 0);
         false: extractVax(tableName, 0);
       end;
     end;
  end;
  Log('Data extraction finished, time: '+inttostr(secondsBetween(now, startTime))+' secs.');
  cleanTimer.Enabled:=true;
end;

procedure TmainForm.btnDataClick(Sender: TObject);
var tableName:string;
    year, i:integer;
begin
  startTime:=now;
  case cbDataType.ItemIndex of
    //Domestic, USA
  0: begin
       tableName:='DATA';
       for i:=yearOf(now) downto 1990 do
       if cbYears.Checked[abs(i-yearOf(now))] then
       begin
         {case fastLoad of
           true: loadData(tableName, i);
           false: extractData(tableName, i);
         end;}
         extractData(tableName, i);
         if stopEx then
         begin
           Log('Data extraction aborted by user!');
           exit;
         end;
       end;
     end;
    //Non-Domestic
  1: begin
       tableName:='NDDATA';
       case fastLoad of
         true: loadData(tableName, 0);
         false: extractData(tableName, 0);
       end;;
     end;
  end;
  Log('Data extraction finished, time: '+inttostr(secondsBetween(now, startTime))+' secs.');
  cleanTimer.Enabled:=true;
end;

procedure TmainForm.loadData(tableName:string;year:integer);
var fn2, fn3, fn,s:string;
    i, lineNo, IORes, passNo:integer;
    f, f2, f3:textfile;
    sl:TStringList;

function commaReplace(s:string):string;
var i:integer;
    inString:boolean;
    s2:string;
begin
  //replace each comma within double quotes with semicolon, and then remove double quotes
  //so we can use MySQL LOAD DATA function to load the .csv directly
  //first remove dual double quotes
  s:=stringReplace(s,'""','',[rfReplaceAll]);
  inString:=false;
  for i:=1 to length(s) do
  begin
    if s[i]='"' then
      inString:=not inString
      else
      if inString and (s[i]=',') then
        s[i]:=';';
  end;
  s2:=stringReplace(s,'"','',[rfReplaceAll]);
  //convert boolean Y to 1 in the right places
  result:=stringReplace(s2,',Y,',',1,',[rfReplaceAll]);
end;

procedure convertSympFile;
var s, vid, symp, sympver:string;
    i:integer;
begin
  //convert file to single symptom structure, before adding unique index and year, and loading into DB
  fn3:=uploadPath+'/'+inttostr(Year)+'VAERS'+tableName+'CNV2.csv';
  reset(f2);
  assignFile(f3, fn3);
  rewrite(f3);
  while not eof(f2) do
  begin
    readln(f2, s);
    sl.DelimitedText:=s;
    vID:=sl[0];
    for i:=1 to round(pred(sl.Count)/2) do
    begin
      symp:=trim(sl[i*2-1]);
      sympVer:=trim(sl[i*2]);
      if (length(symp)>0) and (not sameText(vID,'VAERS_ID')) then
        writeln(f3, vID+','+symp+','+sympVer);
    end;
  end;
  closeFile(f2);
  closeFile(f3);
end;

procedure loadDBData;
begin
  if sameText(tableName,'vax') then
  with checkQUery do
    begin
      sql.Text:='LOAD DATA LOCAL INFILE "'+fn2+'"'+
        ' INTO TABLE vaers.'+tableName+
        ' CHARACTER SET latin1 FIELDS TERMINATED BY "," IGNORE '+inttostr(passNo)+' LINES '+
        ' (@vaers_id, @vax_type, @vax_manu, @vax_lot, @vax_dose_series, @vax_route, @vax_site, @vax_name) '+
        'set vax_id=0, vaers_id=@vaers_id, year='+inttostr(year)+', vax_type=@vax_type, vax_manu=@vax_manu, vax_lot=@vax_lot, '+
        'vax_dose_series=@vax_dose_series, vax_route=@vax_route, vax_site=substring(@vax_site,1,6), vax_name=substring(@vax_name,1,100);';
      execSQL;
    end;
  if sameText(tableName,'data') then
  with checkQUery do
    begin
      sql.Text:='LOAD DATA LOCAL INFILE "'+fn2+'" '+
        'INTO TABLE vaers.'+tableName+
        ' CHARACTER SET latin1 FIELDS TERMINATED BY "," IGNORE '+inttostr(passNo)+' LINES '+
        '(@vaers_id, @recvdate, @state, @age_yrs, @cage_yr, @cage_mo, @sex, @rpt_date, @symptom_text, @died, '+
        '@datedied, @l_threat, @er_visit, @hospital, @hospdays, @x_stay, @disable, @recovd, @vax_date, @onset_date, '+
        '@numdays, @lab_data, @v_adminby, @v_fundby, @other_meds, @cur_ill, @history, @prior_vax, @splttype, @form_vers, '+
        '@todays_date, @birth_defect, @ofc_visit, @er_ed_visit, @allergies) '+
        'set vaers_id=@vaers_id, year='+inttostr(year)+', recvdate=@recvdate, state=@state, age_yrs=@age_yrs, '+
        'cage_yr=@cage_yr, cage_mo=@cage_mo, sex=@sex, rpt_date=@rpt_date, symptom_text=@symptom_text, died=@died, '+
        'datedied=@datedied, l_threat=@l_threat, er_visit=@er_visit, hospital=@hospital, hospdays=@hospdays, '+
        'x_stay=@x_stay, disable=@disable, recovd=@recovd, vax_date=@vax_date, onset_date=@onset_date, numdays=@numdays, '+
        'lab_data= @lab_data, v_adminby= @v_adminby, v_fundby=@v_fundby, other_meds=@other_meds, cur_ill=@cur_ill, '+
        'history=@history, prior_vax=@prior_vax, splttype=@splttype, form_vers=@form_vers, todays_date=@todays_date, '+
        'birth_defect=@birth_defect, ofc_visit=@ofc_visit, er_ed_visit=@er_ed_visit, allergies=@allergies;';
      execSQL;
    end;
  if sameText(tableName,'symptoms') then
  with checkQUery do
    begin
      sql.Text:='LOAD DATA LOCAL INFILE "'+fn3+'"'+
        ' INTO TABLE vaers.'+tableName+' CHARACTER SET latin1 FIELDS TERMINATED BY "," '+
        '(@vaers_id, @symptom, @sympver) set symptom_id=0, vaers_id=@vaers_id, year='+inttostr(year)+
        ',symptom=substring(@symptom,1,100), symptomversion=@sympver;';
      execSQL;
    end;
end;

begin
  if sameText(tableName,'data') then
    Log('Patientdata extraction, year: '+inttostr(Year)+'...');

  uploadPath:='C:/ProgramData/MySQL/MySQL Server 8.0/Uploads';
  sl:=TStringList.Create;
  sl.Delimiter:=',';
  sl.StrictDelimiter:=true;

  case (year=0) of
    true: begin
      fn:='NonDomesticVAERSDATA.csv';
      fn2:='NonDomesticVAERSDATACNV.csv';
    end;
    false: begin
      fn:=inttostr(Year)+'VAERS'+tableName+'.csv';
      fn2:=inttostr(Year)+'VAERS'+tableName+'CNV.csv';
    end;
  end;

  uploadPath:=stringReplace(uploadPath, '\','/',[rfReplaceAll]);
  fn2:=uploadPath+'/'+fn2;

  assignFile(f2, fn2);
  {$I-}
  rewrite(f2);
  {$I+}
  IORes:=IOResult;
  if IORes<>0 then
  begin
    Log('Error creating copy file: "'+fn2+'", extraction aborted!');
    Exit;
  end;

  lineNo:=0;

  fn:=edPath.Text+'\'+fn;
  if not fileExists(fn) then
  begin
    Log('VAERS Data File: "'+fn+'" did not exist on disk, extraction aborted!');
    Exit;
  end;

  {$I-}
  assignFile(f, fn);
  reset(f);
  {$I+}
  IORes:=IOResult;
  if IORes<>0 then
  begin
    Log('Error opening VAERS Data File: "'+fn+'", extraction aborted!');
    Exit;
  end;

  //if not sameText(tableName,'data') then
  //if cbDelete.Checked then
  with delQuery do
  begin
    Log('Filedata extraction, year: '+inttostr(Year)+', deleting '+tableName+' table...');
    application.ProcessMessages;
    sql.Text:='delete from vaers.'+tableName+' where vaers_id>0 and year='+inttostr(Year)+';';
    ExecSQL;
  end;

  Log('File: '+fn+', size: '+floattostrf(SizeOfFile(fn)/1048576, ffFixed, 8, 2)+' Mb');

  passNo:=1;
  //for i:=1 to 100 do

  while not eof(f) do
  begin
    readln(f, s);
    writeln(f2, commaReplace(s));
    inc(lineNo);
    if stopEx then exit;
    if lineNo mod 1000 = 0 then
    begin
      edNum.Text:=inttostr(lineNo);
      application.ProcessMessages;
    end;
    //if above 100.000 lines, we can do it in batches...
    if lineNo mod 100000 = 0 then
    begin
      closeFile(f2);
      if sameText(tableName,'symptoms') then
        convertSympFile;
      Log('File conversion of 100.000 lines done, now loading file into DB...');
      loadDBData;
      passNo:=0;
      rewrite(f2);
    end;
  end;

  closeFile(f);
  closeFile(f2);
  if sameText(tableName,'symptoms') then
    convertSympFile;
  Log('File conversion finished, now loading file into DB...');
  edNum.Text:=inttostr(pred(lineNo));
  application.ProcessMessages;
  loadDBData;
  Log('Success - file data loaded into DB: '+inttostr(pred(lineNo))+' lines.');
  sl.Free;
  if fileExists(fn2) then fList.Add(fn2);
  if fileExists(fn3) then fList.Add(fn3);

  if sameText(tableName,'data') then
  with checkQuery do
  begin
    sql.Text:='select count(*) as num from vaers.data where died=1 and year='+inttostr(year);
    open;
    if not (recordCount=0) then
    begin
      Log('Data table check - death count='+fieldByName('num').AsString+' for year='+inttostr(year));
    end;
    close;
  end;
end;

procedure TmainForm.cleanTimerTimer(Sender: TObject);
begin
  if fList.Count>0 then
  begin
    if fileExists(fList[0]) then
    begin
      deleteFile(fList[0]);
      fList.Delete(0);
    end;
  end else cleanTimer.Enabled:=false;
end;

procedure TmainForm.ExtractData(tableName:string;year:integer);
var fn, fnd:string;
   s:string;
   i, endID, lineNo, deaths:integer;
   sTime:TDateTime;
   IORes:integer;
   f2:textfile;
   doSave:boolean;
   fList:TStringList;

procedure saveData(s:string);
var startS, line:string;
    died:boolean;

function getField(maxD:integer;numField:boolean):string;
var p:integer;
begin
  case numField of
    true: result:='NULL';
    false: result:='';
  end;
  if copy(s,1,1)='"' then
  begin
    //starting quote
    s:=copy(s, 2, length(s));
    p:=pos('",',s);
    if (p<>0) then
    begin
      //ending quote, but not last field
      result:=copy(s, 1, p-1);
      result:=stringReplace(result,'''','',[rfReplaceAll]);
      result:=stringReplace(result,'"','',[rfReplaceAll]);
      result:=strip(stringReplace(result,'""','',[rfReplaceAll]));
      result:=copy(result,1,maxD);
      s:=copy(s, p+2, length(s));
      exit;
    end else if (pos('"',s)=length(s))  then
    begin
      //ending quote for last field, allergies
      result:=copy(s, 1, length(s));
      result:=stringReplace(result,'''','',[rfReplaceAll]);
      result:=stringReplace(result,'"','',[rfReplaceAll]);
      result:=strip(stringReplace(result,'""','',[rfReplaceAll]));
      result:=copy(result,1,maxD);
      exit;
    end;
  end;

  p:=pos(',',s);
  if p<>0 then
  begin
    result:=copy(s, 1, p-1);
    result:=strip(stringReplace(result,'''','',[rfReplaceAll]));
    result:=copy(result,1,maxD);
    if numField then
      if length(result)=0 then result:='NULL';
    s:=copy(s, p+1, length(s));
  end;
end;

function getFieldS(maxD:integer;numField:boolean):string;
var p, len, i:integer;
begin
  case numField of
    true: result:='NULL';
    false: result:='';
  end;
  if copy(s,1,1)='"' then
  begin
    //starting quote
    s:=copy(s, 2, length(s));
    p:=pos('",',s);
    if (p<>0) then
    begin
      //ending quote, but not last field
      result:=copy(s, 1, p-1);
      result:=stringReplace(result,'''','',[rfReplaceAll]);
      result:=stringReplace(result,'"','',[rfReplaceAll]);
      result:=strip(stringReplace(result,'""','',[rfReplaceAll]));
      result:=copy(result,1,maxD);
      len:=length(result);
      if (length(result)<MaxD) then for i:=succ(len) to maxD do result:=result+' ';
      s:=copy(s, p+2, length(s));
      exit;
    end else if (pos('"',s)=length(s))  then
    begin
      //ending quote for last field, allergies
      result:=copy(s, 1, length(s));
      result:=stringReplace(result,'''','',[rfReplaceAll]);
      result:=stringReplace(result,'"','',[rfReplaceAll]);
      result:=strip(stringReplace(result,'""','',[rfReplaceAll]));
      result:=copy(result,1,maxD);
      len:=length(result);
      if (length(result)<MaxD) then for i:=succ(len) to maxD do result:=result+' ';
      exit;
    end;
  end;

  p:=pos(',',s);
  if p<>0 then
  begin
    result:=copy(s, 1, p-1);
    result:=strip(stringReplace(result,'''','',[rfReplaceAll]));
    result:=copy(result,1,maxD);
    if numField then
      if length(result)=0 then result:='-';
    s:=copy(s, p+1, length(s));
    //if (length(result)<>MaxD) and (maxD=4) then Log('res');
  end;

  len:=length(result);
    if (length(result)<MaxD) then for i:=succ(len) to maxD do result:=result+' ';
end;

function convDate(s:string):string;
begin
  if length(s)=10 then
  result:='"'+copy(s, 7, 4)+'-'+copy(s, 1, 2)+'-'+copy(s, 4, 2)+'"'
  else result:='NULL';
end;

function convBool(s:string):string;
begin
  result:='NULL';
  s:=trim(s);
  if sameText(s, 'Y') then result:='1';
  if sameText(s, 'N') then result:='0';
end;

function convBoolS(s:string):string;
begin
  result:='-';
  s:=trim(s);
  if sameText(s, 'Y') then result:=s;
  if sameText(s, 'N') then result:='-';
end;

function cBoolV(s:string;var died:boolean):string;
begin
  result:='----';
  died:=sameText(s, 'Y');
  if died then result:='DIED';
end;

begin
  s:=stringReplace(s,'""','',[rfReplaceAll]);
  startS:=s;

  if doSave then
  with MySQLBatch do
  begin
    sql.Text:=sql.Text+'insert into '+tableName+' values('+
    //fList.Add('insert into '+tableName+' values('+
    getField(15, true)+','+              //VAERS_ID
    inttostr(Year)+','+                  //YEAR
    convDate(getField(10, true))+',"'+   //RECVDATE
    getField(2, false)+'",'+             //STATE
    getField(5, true)+','+               //AGE_YRS
    getField(5, true)+','+               //CAGE_YR
    getField(4, true)+',"'+              //CAGE_MO
    getField(1, false)+'",'+             //SEX
    convDate(getField(10, true))+',"'+   //RPT_DATE
    getField(32000, false)+'",'+         //SYMPTOM_TEXT
    convBool(getField(4, true))+','+     //DIED
    convDate(getField(10, true))+','+    //DATEDIED
    convBool(getField(1, true))+','+     //L_THREAT
    convBool(getField(1, true))+','+     //ER_VISIT
    convBool(getField(1, true))+','+     //HOSPITAL
    convBool(getField(1, true))+','+     //HOSPDAYS
    convBool(getField(1, true))+','+     //X_STAY
    convBool(getField(1, true))+','+     //DISABLE
    convBool(getField(1, true))+','+     //RECOVD
    convDate(getField(10, true))+','+    //VAX_DATE
    convDate(getField(10, true))+','+    //ONSET_DATE
    getField(10, true)+',"'+             //NUMDAYS
    getField(32000, false)+'","'+        //LAB_DATA
    getField(3, false)+'","'+            //V_ADMINBY
    getField(3, false)+'","'+            //V_FUNDBY
    getField(240, false)+'","'+          //OTHER_MEDS
    getField(32000, false)+'","'+        //CUR_ILL
    getField(32000, false)+'","'+        //HISTORY
    getField(128, false)+'","'+          //PRIOR_VAX
    getField(25, false)+'","'+           //SPLTTYPE
    getField(1, false)+'",'+             //FORM_VERS
    convDate(getField(10, true))+','+    //TODAYS_DATE
    convBool(getField(1, true))+','+     //BIRTH_DEFECT
    convBool(getField(1, true))+','+     //OFC_VISIT
    convBool(getField(1, true))+',"'+    //ER_ED_VISIT
    getField(32000, false)+'");';        //ALLERGIES
  end;

  s:=startS;
  line:=getField(15, true)+','+           //VAERS_ID
    inttostr(Year)+','+                   //YEAR
    convDate(getField(10, true))+',"'+    //RECVDATE
    getFieldS(2, false)+'",'+             //STATE
    getFieldS(2, false)+','+              //AGE_YRS
    getFieldS(2, false)+','+              //CAGE_YR
    getFieldS(1, true)+',"'+              //CAGE_MO
    getFieldS(1, false)+'",'+             //SEX
    getFieldS(0, false)+',"'+             //RPT_DATE
    getFieldS(150, false)+'",'+           //SYMPTOM_TEXT
    cBoolV(getField(4, true), died)+','+  //DIED
    getFieldS(10, true)+','+              //DATEDIED
    convBoolS(getField(1, true))+','+     //L_THREAT
    convBoolS(getField(1, true))+','+     //ER_VISIT
    convBoolS(getField(1, true))+','+     //HOSPITAL
    convBoolS(getField(1, true))+','+     //HOSPDAYS
    convBoolS(getField(1, true))+','+     //X_STAY
    convBoolS(getField(1, true))+','+     //DISABLE
    convBoolS(getField(1, true))+','+     //RECOVD
    getFieldS(10, true)+','+              //VAX_DATE
    getFieldS(10, true)+','+              //ONSET_DATE
    getFieldS(4, true)+',"'+              //NUMDAYS
    getFieldS(10, false)+'","'+           //LAB_DATA
    getFieldS(3, false)+'","'+            //V_ADMINBY
    getFieldS(3, false)+'","'+            //V_FUNDBY
    getFieldS(10, false)+'","'+           //OTHER_MEDS
    getFieldS(10, false)+'","'+           //CUR_ILL
    getFieldS(10, false)+'","'+           //HISTORY
    getFieldS(10, false)+'","'+           //PRIOR_VAX
    getFieldS(1, false)+'","'+            //SPLTTYPE
    getField(1, false)+'",'+              //FORM_VERS
    getFieldS(10, true)+','+              //TODAYS_DATE
    convBoolS(getField(1, true))+','+     //BIRTH_DEFECT
    convBoolS(getField(1, true))+','+     //OFC_VISIT
    convBoolS(getField(1, true))+',"'+    //ER_ED_VISIT
    getFieldS(10, false)+'");';           //ALLERGIES

  if died then
  begin
    writeln(f2, line);
    inc(deaths);
  end;
end;

begin
  fList:=TStringList.create;
  doSave:=not cbInspection.Checked;
  case (year=0) of
    true: begin
      fnd:='VAERS Patientdata - non-domestic deaths.txt';
      fn:='NonDomesticVAERSDATA.csv';
    end;
    false: begin
      fnd:='VAERS Patientdata - US deaths for year '+inttostr(year)+'.txt';
      fn:=inttostr(Year)+'VAERSDATA.csv';
    end;
  end;

  assignFile(f2, fnd);
  rewrite(f2);

  lineNo:=0;
  deaths:=0;
  if not cbDelete.Checked then
  begin
    Log('Patientdata extraction, year: '+inttostr(Year)+', checking database...');
    application.ProcessMessages;
    endID:=YearExist(tableName, Year);
  end else endID:=0;


  fn:=edPath.Text+'\'+fn;
  if not fileExists(fn) then
  begin
    Log('File: "'+fn+'" did not exist on disk, extraction aborted!');
    Exit;
  end;

  if cbDelete.Checked and doSave then
  with delQuery do
  begin
    Log('Patientdata extraction, year: '+inttostr(Year)+', deleting database...');
    application.ProcessMessages;
    sql.Text:='delete from '+tableName+' where vaers_id>0 and year='+inttostr(Year)+';';
    ExecSQL;
  end;

  {$I-}
  assignFile(f, fn);
  reset(f);
  {$I+}
  IORes:=IOResult;
  if IORes<>0 then
  begin
    Log('Error opening file: "'+fn+'", extraction aborted!');
    Exit;
  end;

  Log('File: '+fn+', size: '+floattostrf(SizeOfFile(fn)/1048576, ffFixed, 8, 2)+' Mb');
  pgBar.Position:=0;
  pgBar.Max:=DoLineCount;

  //read out first line with field descriptions
  readln(f, s);

  if (endID<>0) and doSave then
  if not skipToID(endID, lineNo) then
  begin
    showMessage('Did not find starting point in file, extraction aborted!');
    Exit;
  end else Log('Skipped to last saved row, vaers_id='+inttostr(endID));

  i:=lineNo;
  sTime:=now;
  stopEx:=false;

  while (not eof(f)) and (not stopEx) do
  begin
    inc(i);
    pgBar.Position:=i;
    readln(f, s);

    //run a batch of 100 queries in each
    if i mod 100 = 0 then
    begin
      if secondsBetween(now, sTime)>0 then
      edNum.text:=inttostr(i)+' '+inttostr(round(i/secondsBetween(now, sTime)))+'/s';
      edNum.Refresh;

      if doSave then
      begin
        MySQLBatch.SQL.Text:=copy(MySQLBatch.SQL.Text, 1, length(MySQLBatch.SQL.Text)-1);
        MySQLBatch.ExecSQL;
        MySQLBatch.SQL.Clear;
      end;
    end;

    {if i mod 100000 = 0 then
    begin
      fList.SaveToFile('datainsert.sql');
      loadQuery('datainsert.sql');
      fList.Clear;
    end; }

    application.ProcessMessages;
    saveData(s);
  end;

  //run last batch
  if doSave and (not stopEx) then
  if length(MySQLBatch.SQL.Text)>0 then
  begin
    MySQLBatch.SQL.Text:=copy(MySQLBatch.SQL.Text, 1, length(MySQLBatch.SQL.Text)-1);
    MySQLBatch.ExecSQL;
    MySQLBatch.SQL.Clear;
  end;

  closefile(f);
  closefile(f2);
  edNum.text:=inttostr(i);
  edNum.Refresh;

  {if fList.Count>0 then
  begin
    fList.SaveToFile('datainsert.sql');
    loadQuery('datainsert.sql');
    fList.Clear;
  end;
  fList.Free;  }

  if stopEx then
  begin
    log('Patientdata extraction stopped, time: '+TimeToStr(now-sTime)+', lines processed: '+inttostr(i));
    exit;
  end;

  if doSave then
  begin
    log('Finished patientdata extraction, time: '+TimeToStr(now-sTime)+', lines processed: '+inttostr(i));
    checkNumRecords(tableName, year, i);
  end;

  case (year=0) of
    true: log('Patientdata visual inspection file for US, year '+inttostr(year)+', counting '+inttostr(deaths)+' death events, saved as: "'+fnd+'"');
    false: log('Patientdata visual inspection file, non-domestic, counting '+inttostr(deaths)+' death events, saved as: "'+fnd+'"');
  end;
end;

procedure TmainForm.btnPathClick(Sender: TObject);
begin
  with TFileOpenDialog.Create(nil) do
  try
    Options := [fdoPickFolders];
    if Execute then
      FPath:=FileName;
      edPath.Text:=FPath;
  finally
    Free;
  end;
end;

end.

