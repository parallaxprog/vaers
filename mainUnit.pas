unit mainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, mySQLDbTables, Vcl.StdCtrls,
  Vcl.DBGrids, mySQLDirectQuery, MySQLBatch, dateUtils, IdIOHandler, Vcl.Grids,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.CheckLst, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, shellAPI, Vcl.Buttons;

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
    MySQL: TMySQLDatabase;
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
    btnBackup: TButton;
    cbBackupTable: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    edRows: TEdit;
    Label8: TLabel;
    cbType: TComboBox;
    Label9: TLabel;
    edFile: TEdit;
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
    lvStudies: TListView;
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
    Button7: TButton;
    Label19: TLabel;
    edUser: TEdit;
    edPass: TEdit;
    Label20: TLabel;
    lblFilepath: TLabel;
    edPath: TEdit;
    btnPath: TButton;
    meSetupLog: TMemo;
    btnCheckTextfile: TButton;
    Button8: TButton;
    btnLoadFlu: TButton;
    Button6: TButton;
    Button9: TButton;
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
    StatusBar1: TStatusBar;
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
    Button15: TButton;
    Label25: TLabel;
    edADVReports: TEdit;
    cbLotType: TComboBox;
    Label26: TLabel;
    Label27: TLabel;
    edC19Share: TEdit;
    edC19Inj: TEdit;
    Label28: TLabel;
    lotDQuery: TMySQLDirectQuery;
    procedure btnDataClick(Sender: TObject);
    procedure btnSymptomsClick(Sender: TObject);
    procedure btnVaxClick(Sender: TObject);
    procedure btnReadAllClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure QueryTimerTimer(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
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
    procedure Button6Click(Sender: TObject);
    procedure btnUpdateStudiesClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure MySQLAfterConnect(Sender: TObject);
    procedure MySQLAfterDisconnect(Sender: TObject);
    procedure MySQLConnectionFailure(Connection: TMySQLDatabase; Error: string);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure btnLotUpdateClick(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure tbLimitChange(Sender: TObject);
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
    f:textfile;
    stopEx:boolean;
    qList:TStringList;
    FPath:string;
    FStudyCOunt:integer;
    QueryThread:TQueryThread;
    cData:TConnectData;
    lotLoading:boolean;
    procedure log(s:string);
    procedure log2(s:string);
    procedure logSetup(s:string);
    function DoLineCount:integer;
    procedure openStudies;
    procedure saveSetup;
    procedure loadSetup;
    procedure loadStudies;
    procedure LoadLotData;
    function yearExist(tableName:string;year:integer):integer;
    procedure ExtractData(tableName:string;year:integer);
    procedure ExtractVax(tableName:string;year:integer);
    procedure ExtractSymp(tableName:string;Year:integer);
    function skipToID(endID:integer;var lineNo:integer):boolean;
    procedure checkNumRecords(tableName:string; year, count:integer);
    procedure checkData(tableName:string);
    procedure loadFluData;
  end;

var
  mainForm: TmainForm;

implementation

{$R *.dfm}

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
      meQueryLog.Lines.Insert(0, 'Query: "'+ReplaceCRLF(FSQL)+'" - result: '+FResult);
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
    databasename:=cData.dbname;
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
        Add('WHERE died=''Y''');
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
            Add('AND v.vax_type=''COVID19'' AND d.died=''Y''');
          end;
          false: begin
            Add('FROM vaers.'+ tableName + ' d, vaers.'+vaxTableName+' v');
            Add('WHERE d.vaers_id=v.vaers_id AND v.vax_type=''COVID19'' AND d.died=''Y''');
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

procedure TmainForm.btnSymptomsClick(Sender: TObject);
var tableName:string;
    year, i:integer;
begin
  case cbDataType.ItemIndex of
    //Domestic, USA
  0: begin
       tableName:='symptoms';
       for i:=yearOf(now) downto 1990 do
       if cbYears.Checked[abs(i-yearOf(now))] then
         extractSymp(tableName, i);
     end;
    //Non-Domestic
  1: begin
       tableName:='ndsymptoms';
       extractSymp(tableName, 0);
     end;
  end;
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
    sql.Text:='insert into '+tableName+' values(0,'+vid+','+inttostr(year)+',"'+getField(200)+'","'+getField(10)+'");';

    symp2:=getField(200);
    if length(symp2)>0 then
    sql.Text:=sql.Text+'insert into '+tableName+' values(0,'+vid+','+inttostr(year)+',"'+symp2+'","'+getField(10)+'");';

    symp3:=getField(200);
    if length(symp3)>0 then
    sql.Text:=sql.Text+'insert into '+tableName+' values(0,'+vid+','+inttostr(year)+',"'+symp3+'","'+getField(10)+'");';

    symp4:=getField(200);
    if length(symp4)>0 then
    sql.Text:=sql.Text+'insert into '+tableName+' values(0,'+vid+','+inttostr(year)+',"'+symp4+'","'+getField(10)+'");';

    symp5:=getField(200);
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

procedure TmainForm.btnVaxClick(Sender: TObject);
var tableName:string;
    year, i:integer;
begin
  case cbDataType.ItemIndex of
    //Domestic, USA
  0: begin
       tableName:='vax';
       for i:=yearOf(now) downto 1990 do
       if cbYears.Checked[abs(i-yearOf(now))] then
         extractVax(tableName, i);
     end;
    //Non-Domestic
  1: begin
       tableName:='ndvax';
       extractVax(tableName, 0);
     end;
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
        edCountLot.Text:=floattostrf(i, ffNumber, 8, 0)+'/25.622';
        edLotPercent.Text:=floatToStrF(i/25622*100, ffFixed, 3, 2)+' %';
        edPercent.Text:=floatToStrF(count/503520*100, ffFixed, 3, 2)+' %';
        edADVReports.Text:=floattostrf(count, ffNumber, 8, 0)+'/503.520';
        edC19Inj.Text:=floattostrf(i, ffNumber, 8, 0)+'/'+floattostrf(i, ffNumber, 8, 0);
        application.ProcessMessages;
      end;
      1:  begin
        if c19Count>0 then
          edC19Share.Text:=floatTOStrF(c19count/i*100, ffFixed, 3, 2)+' %';
        edCountLot.Text:=floattostrf(i, ffNumber, 8, 0)+'/154.196';
        edLotPercent.Text:=floatToStrF(i/154196*100, ffFixed, 3, 2)+' %';
        edPercent.Text:=floatToStrF(count/1394458*100, ffFixed, 3, 2)+' %';
        edADVReports.Text:=floattoStrf(count, ffNumber, 8, 0)+'/1.394.458';
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
   edCountLot.Text:=floattostrf(i, ffNumber, 8, 0)+'/25.622';
   edLotPercent.Text:=floatToStrF(i/25622*100, ffFixed, 3, 2)+' %';
   edPercent.Text:=floatToStrF(count/503520*100, ffFixed, 3, 2)+' %';
   edADVReports.Text:=floattostrf(count, ffNumber, 8, 0)+'/503.520';
   edC19Inj.Text:=floattostrf(i, ffNumber, 8, 0)+'/'+floattostrf(i, ffNumber, 8, 0);
  end;
  1:  begin
   edCountLot.Text:=floattostrf(i, ffNumber, 8, 0)+'/154.196';
   edLotPercent.Text:=floatToStrF(i/154196*100, ffFixed, 3, 2)+' %';
   edPercent.Text:=floatToStrF(count/1394458*100, ffFixed, 3, 2)+' %';
   edADVReports.Text:=floattoStrf(count, ffNumber, 8, 0)+'/1.394.458';
   if c19Count>0 then
     edC19Share.Text:=floatTOStrF(c19count/i*100, ffFixed, 3, 2)+' %';
   edC19Inj.Text:=floattostrf(c19count, ffNumber, 8, 0)+'/'+floattostrf(i, ffNumber, 8, 0);
  end;

  end;
  lotLoading:=false;
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

procedure TmainForm.Button6Click(Sender: TObject);
begin
  loadStudies;
end;

procedure TmainForm.Button7Click(Sender: TObject);
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

procedure TmainForm.Button8Click(Sender: TObject);
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

procedure TmainForm.Button9Click(Sender: TObject);
begin
  //download 2022 data from a server
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


procedure TmainForm.Button15Click(Sender: TObject);
var year, i:integer;
    s:string;

begin
  i:=0;
  if not fileExists('vaxlot.sql') then
  begin
    meCalcLog.Lines.Insert(0, timeToStr(now)+' Creating insert query...');
    assignFile(f,'vaxlot.sql');
    rewrite(f);
    with checkQUery do
    begin
      sql.text:='select vax_type, vax_lot, vax_manu, year, count(*) as injections from vax group by vax_lot order by injections desc, vax_type, year;';
      open;
      if not (recordCount=0) then
      while not eof do
      begin
        inc(i);
        s:='insert into vaxlot values(0, "'+fieldByName('vax_type').AsString+'","'+fieldByName('vax_manu').AsString+'","'+fieldByName('vax_lot').AsString+'",'+
        fieldByName('year').AsString+','+fieldByName('injections').AsString+');';
        writeln(f, s);
        edCalcCount.Text:=inttostr(i);
        application.ProcessMessages;
        next;
      end;
      close;
      closeFile(f);
    end;
    meCalcLog.Lines.Insert(0, timeToStr(now)+' Success! Insert query created.');
  end;

  meCalcLog.Lines.Insert(0, timeToStr(now)+' Now inserting data to DB...');
  i:=0;
  assignFile(f,'vaxlot.sql');
  reset(f);
  while not eof(f) do
  with checkQUery do
  begin
    readln(f, s);
    sql.text:=s;
    ExecSQL;
    inc(i);
    edCalcCount.Text:=inttostr(i);
    application.ProcessMessages;
  end;
  closeFile(f);
  meCalcLog.Lines.Insert(0, timeToStr(now)+' Success! Finished inserting data to DB.');
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
    getField(100)+'","'+   //VAX_TYPE        10
    getField(100)+'","'+   //VAX_MANU        33
    getField(100)+'","'+   //VAX_LOT         15
    getField(10)+'","'+    //VAX_DOSE_SERIES  3
    getField(10)+'","'+    //VAX_ROUTE        3
    getField(10)+'","'+    //VAX_SITE         2
    getField(100)+'")';    //VAX_NAME        49
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
  meLog.Lines[0]:=timeToStr(now)+' - Counting lines: '+inttostr(i-1)+', preparing to extract data...';
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
    showMessage('Specified path for VAERS data files does not exist and was not saved');
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

procedure TmainForm.FormShow(Sender: TObject);
var i:integer;
begin
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
  end;

  if MySQL.Connected then
  begin
    btnUpdateClick(Self);
    btnLotUpdateClick(Self);
  end;

  vaxChart.Title.Text.Text:='';
  lotChart.Title.Text.Text:='';
  openStudies;
  width:=1420;
  height:=810;
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

procedure TmainForm.MySQLAfterConnect(Sender: TObject);
begin
  logSetup('Database connected OK');
end;

procedure TmainForm.MySQLAfterDisconnect(Sender: TObject);
begin
  logSetup('Database DISconnected OK');
end;

procedure TmainForm.MySQLConnectionFailure(Connection: TMySQLDatabase;
  Error: string);
begin
  logSetup('Database connection error: '+error);
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

procedure TmainForm.btnBackupClick(Sender: TObject);
var fn, s, tableName:string;
    i:integer;
begin
  with userQUery do
  begin
    case cbBackupTable.ItemIndex of
      0: tableName:='data';
      1: tableName:='symptoms';
      2: tableName:='vax';
      3: tableName:='nddata';
      4: tableName:='ndsymptoms';
      5: tableName:='ndvax';
    end;
    sql.Text:='select * from '+tableName+' limit 1000';
    fn:=tableName+'-backup'+copy(cbType.Items[cbType.ItemIndex],1,4);
    edFile.Text:=fn;
    assignFile(f, fn);
    rewrite(f);
    i:=0;
    open;
    //while not eof do
    while i<1000 do
    begin
    case cbBackupTable.ItemIndex of
    //data tables
    0, 3: case cbType.ItemIndex of
        0: s:='insert into '+tableName+' values('+fieldByName('vaers_id').AsString+',"'+fieldByName('RECVDATE').AsString+'","'
        +fieldByName('STATE').AsString+'",'+fieldByName('AGE_YRS').AsString+','+fieldByName('CAGE_YR').AsString+','
        +fieldByName('CAGE_MO').AsString+',"'+fieldByName('SEX').AsString+'","'+fieldByName('RPT_DATE').AsString+'","'
        +fieldByName('SYMPTOM_TEXT').AsString+'","'+fieldByName('DIED').AsString+'","'+fieldByName('DATEDIED').AsString+'","'
        +fieldByName('L_THREAT').AsString+'","'+fieldByName('ER_VISIT').AsString+'","'+fieldByName('HOSPITAL').AsString+'",'
        +fieldByName('HOSPDAYS').AsString+',"'+fieldByName('X_STAY').AsString+'","'+fieldByName('DISABLE').AsString+'","'
        +fieldByName('RECOVD').AsString+'","'+fieldByName('VAX_DATE').AsString+'","'+fieldByName('ONSET_DATE').AsString+'",'
        +fieldByName('NUMDAYS').AsString+',"'+fieldByName('LAB_DATA').AsString+'","'+fieldByName('V_ADMINBY').AsString+'","'
        +fieldByName('V_FUNDBY').AsString+'","'+fieldByName('OTHER_MEDS').AsString+'","'+fieldByName('CUR_ILL').AsString+'","'
        +fieldByName('HISTORY').AsString+'","'+fieldByName('PRIOR_VAX').AsString+'","'+fieldByName('SPLTTYPE').AsString+'",'
        +fieldByName('FORM_VERS').AsString+',"'+fieldByName('TODAYS_DATE').AsString+'","'+fieldByName('BIRTH_DEFECT').AsString+'","'
        +fieldByName('OFC_VISIT').AsString+'","'+fieldByName('ER_ED_VISIT').AsString+'","'+fieldByName('ALLERGIES').AsString+'");';
        1: s:='insert into '+tableName;
        2: s:='insert into '+tableName;
      end;
    //symptom tables
    1, 4: case cbType.ItemIndex of
        0:  s:='insert into '+tableName+' values('+fieldByName('vaers_id').AsString+',"'+fieldByName('symptom').AsString+'","'
        +fieldByName('symptom_version').AsString+'");';
        1: s:=fieldByName('vaers_id').AsString+',"'+fieldByName('symptom').AsString+'","'+fieldByName('symptom_version').AsString+'"';
        2: s:=fieldByName('vaers_id').AsString+chr(9)+'"'+fieldByName('symptom').AsString+'"'+chr(9)+'"'+fieldByName('symptom_version').AsString+'"';
      end;
    //vax tables
    2, 5: case cbType.ItemIndex of
        0: s:='insert into '+tableName+' values('+fieldByName('vaers_id').AsString+',"'+fieldByName('vax_type').AsString+'","'
        +fieldByName('vax_manu').AsString+'","'+fieldByName('vax_lot').AsString+'","'+fieldByName('vax_dose_series').AsString+'","'
        +fieldByName('vax_route').AsString+'","'+fieldByName('vax_site').AsString+'","'+fieldByName('vax_name').AsString+'");';
        1: s:=fieldByName('vaers_id').AsString+',"'+fieldByName('vax_type').AsString+'","'
        +fieldByName('vax_manu').AsString+'","'+fieldByName('vax_lot').AsString+'","'+fieldByName('vax_dose_series').AsString+'","'
        +fieldByName('vax_route').AsString+'","'+fieldByName('vax_site').AsString+'","'+fieldByName('vax_name').AsString+'"';
        2: s:=fieldByName('vaers_id').AsString+chr(9)+'"'+fieldByName('vax_type').AsString+'"'+chr(9)+'"'
        +fieldByName('vax_manu').AsString+'"'+chr(9)+'"'+fieldByName('vax_lot').AsString+'"'+chr(9)+'"'+fieldByName('vax_dose_series').AsString+'"'+chr(9)+'"'
        +fieldByName('vax_route').AsString+'"'+chr(9)+'"'+fieldByName('vax_site').AsString+'"'+chr(9)+'"'+fieldByName('vax_name').AsString+'"';
      end;
    end;
      inc(i);
      edRows.Text:=inttostr(i);
      application.ProcessMessages;
      writeln(f, s);
      next;
    end;
    close;
  end;
  closeFile(f);
  showMessage('Backup of table: '+tableName+' finished, file: '+fn);
end;

procedure TmainForm.btnDataClick(Sender: TObject);
var tableName:string;
    year, i:integer;
begin
  case cbDataType.ItemIndex of
    //Domestic, USA
  0: begin
       tableName:='data';
       for i:=yearOf(now) downto 1990 do
       if cbYears.Checked[abs(i-yearOf(now))] then
         extractData(tableName, i);
     end;
    //Non-Domestic
  1: begin
       tableName:='nddata';
       extractData(tableName, 0);
     end;
  end;
end;

procedure TmainForm.ExtractData(tableName:string;year:integer);
var fn:string;
   s:string;
   i, endID, lineNo:integer;
   sTime:TDateTime;
   IORes:integer;

procedure saveData(s:string);

function getField(maxD:integer;numField:boolean):string;
var p:integer;
begin
  case numField of
    true: result:='NULL';
    false: result:='';
  end;
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
    if numField then
      if length(result)=0 then result:='NULL';
    s:=copy(s, p+1, length(s));
  end;
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

begin
  s:=stringReplace(s,'""','',[rfReplaceAll]);

  with MySQLBatch do
  begin
    sql.Text:=sql.Text+'insert into '+tableName+' values('+
    getField(15, true)+','+              //VAERS_ID
    inttostr(Year)+','+                 //YEAR
    convDate(getField(10, true))+',"'+   //RECVDATE
    getField(5, false)+'",'+             //STATE
    getField(5, true)+','+               //AGE_YRS
    getField(5, true)+','+               //CAGE_YR
    getField(5, true)+',"'+              //CAGE_MO
    getField(5, false)+'",'+             //SEX
    convDate(getField(10, true))+',"'+   //RPT_DATE
    getField(65000, false)+'",'+         //SYMPTOM_TEXT
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
    getField(65000, false)+'","'+        //LAB_DATA
    getField(10, false)+'","'+           //V_ADMINBY
    getField(10, false)+'","'+           //V_FUNDBY
    getField(300, false)+'","'+          //OTHER_MEDS
    getField(1000, false)+'","'+         //CUR_ILL
    getField(65000, false)+'","'+        //HISTORY
    getField(300, false)+'","'+          //PRIOR_VAX
    getField(300, false)+'","'+          //SPLTTYPE
    getField(10, false)+'",'+            //FORM_VERS
    convDate(getField(10, true))+','+    //TODAYS_DATE
    convBool(getField(1, true))+','+     //BIRTH_DEFECT
    convBool(getField(1, true))+','+     //OFC_VISIT
    convBool(getField(1, true))+',"'+    //ER_ED_VISIT
    getField(3000, false)+'");';         //ALLERGIES
  end;
end;

begin
  lineNo:=0;
  if not cbDelete.Checked then
  begin
    Log('Patientdata extraction, year: '+inttostr(Year)+', checking database...');
    application.ProcessMessages;
    endID:=YearExist(tableName, Year);
  end else endID:=0;

  if year=0 then
  fn:='NonDomesticVAERSDATA.csv' else
  fn:=inttostr(Year)+'VAERSDATA.csv';

  fn:=edPath.Text+'\'+fn;
  if not fileExists(fn) then
  begin
    Log('File: "'+fn+'" did not exist on disk, extraction aborted!');
    Exit;
  end;

  if cbDelete.Checked then
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

    //run a batch of 100 queries in each
    if i mod 100 = 0 then
    begin
      if secondsBetween(now, sTime)>0 then
      edNum.text:=inttostr(i)+' '+inttostr(round(i/secondsBetween(now, sTime)))+' num/sec.';
      edNum.Refresh;

      MySQLBatch.SQL.Text:=copy(MySQLBatch.SQL.Text, 1, length(MySQLBatch.SQL.Text)-1);
      MySQLBatch.ExecSQL;
      MySQLBatch.SQL.Clear;

    end;
    application.ProcessMessages;
    saveData(s);
  end;

  //run last batch
  if length(MySQLBatch.SQL.Text)>0 then
  begin
    MySQLBatch.SQL.Text:=copy(MySQLBatch.SQL.Text, 1, length(MySQLBatch.SQL.Text)-1);
    MySQLBatch.ExecSQL;
    MySQLBatch.SQL.Clear;
  end;

  closefile(f);
  edNum.text:=inttostr(i);
  edNum.Refresh;
  case stopEx of
    true: log('Patientdata extraction stopped, time: '+TimeToStr(now-sTime)+', lines processed: '+inttostr(i));
    false: log('Finished patientdata extraction, time: '+TimeToStr(now-sTime)+', lines processed: '+inttostr(i));
  end;

  checkNumRecords(tableName, year, i);
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


