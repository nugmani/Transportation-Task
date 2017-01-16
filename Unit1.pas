unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ScrollBox1: TScrollBox;
    UpDown2: TUpDown;
    UpDown1: TUpDown;
    StringGrid3: TStringGrid;
    Label2: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    ScrollBox2: TScrollBox;
    StringGrid2: TStringGrid;
    StringGrid1: TStringGrid;
    Label5: TLabel;
    ScrollBox3: TScrollBox;
    StringGrid4: TStringGrid;
    Label3: TLabel;
    ScrollBox4: TScrollBox;
    StringGrid5: TStringGrid;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1; f:Boolean;

implementation

{$R *.dfm}

function raz(kol,nr:integer):integer;
const r1:array[1..2] of integer=(70,26);
      r:array[1..2] of integer=(400,160);
var   k:integer;
begin
k:=r1[nr]*(kol+1);
if k>r[nr] then raz:=r[nr] else raz:=k;
end;

procedure razmer;
var i:integer;
begin
with form1 do
 begin
 StringGrid1.RowCount:=StrToInt(Edit1.Text)+1;
 StringGrid1.ColCount:=StrToInt(Edit2.Text)+1;
 StringGrid2.RowCount:=StrToInt(Edit1.Text)+1;
 StringGrid3.ColCount:=StrToInt(Edit2.Text)+1;

 StringGrid1.Width:=65*(StrToInt(Edit2.Text)+1)+1;
 StringGrid3.Width:=65*(StrToInt(Edit2.Text)+1)+1;
 StringGrid1.Height:=25*(StrToInt(Edit1.Text)+1)+1;
 StringGrid2.Height:=25*(StrToInt(Edit1.Text)+1)+1;

 for i:=1 to StringGrid1.RowCount-1 do
 StringGrid1.Cells[0,i]:='A'+intTostr(i);
 for i:=1 to StringGrid1.ColCount-1 do
 StringGrid1.Cells[i,0]:='B'+intTostr(i);
 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
begin
 razmer;
 for i:=1 to StringGrid1.RowCount-1 do
  for j:=1 to StringGrid1.ColCount-1 do
   StringGrid1.Cells[j,i]:='';
 for i:=1 to StringGrid4.RowCount-1 do
  for j:=1 to StringGrid4.ColCount-1 do
   StringGrid4.Cells[j,i]:='';
StringGrid2.Enabled:=true;
StringGrid3.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
StringGrid2.Cells[0,0]:='������';
StringGrid3.Cells[0,0]:='������-��';
f:=false;
randomize;
end;

procedure TForm1.Button2Click(Sender: TObject);
var s,i,j:integer;
    a,b: array[1..100] of integer;
begin
f:=true;
StringGrid2.Enabled:=false;
StringGrid3.Enabled:=false;
{�������� �������}
s:=0;
for i:=1 to StrToInt(Edit1.Text) do
  if StringGrid2.Cells[0,i]='' then f:=false
  else s:=s+strToint(StringGrid2.Cells[0,i]);
for i:=1 to  StrToInt(Edit2.Text) do
  if StringGrid3.Cells[i,0]='' then f:=false
  else s:=s-strToint(StringGrid3.Cells[i,0]);
If f then
begin
 if (s>0) and (MessageDlg('�������� ���������� �����������?',mtWarning,mbOKCancel,0)=mrOk) then
 begin
    Edit2.Text:=inttostr(strToint(Edit2.Text)+1); razmer;
    StringGrid3.Cells[strToint(Edit2.Text),0]:=intTostr(s);
    s:=0;
 end;
 if (s<0) and (MessageDlg('�������� ���������� ��c�������?',mtWarning,mbOKCancel,0)=mrOk) then
 begin
    Edit1.Text:=inttostr(strToint(Edit1.Text)+1); razmer;
    StringGrid2.Cells[0,strToint(Edit1.Text)]:=intTostr(-s);
    s:=0;
 end;
 {��������� ����}
 if s=0 then
 begin
 {������������ ������� ������� � ������������}
  for i:=1 to 100 do begin a[i]:=0;b[i]:=0; end;
  for i:=1 to StringGrid2.RowCount-1 do
  a[i]:=strtoint(StringGrid2.Cells[0,i]);
  for i:=1 to StringGrid3.ColCount-1 do
  b[i]:=strtoint(StringGrid3.Cells[i,0]);
  StringGrid1.Enabled:=true;
  i:=1; j:=1;
  while i*j<=(StringGrid1.ColCount-1)*(StringGrid1.RowCount-1) do begin
   if a[i]<b[j] then
   begin
     StringGrid1.Cells[j,i]:=inttostr(a[i]);
     b[j]:=b[j]-a[i]; a[i]:=0;i:=i+1;
   end  else
   begin
     StringGrid1.Cells[j,i]:=inttostr(b[j]);
     a[i]:=a[i]-b[j]; b[j]:=0;j:=j+1;
   end;
  end;
 end;
 {��������� ��������� ��� ���������}
 StringGrid5.RowCount:=StrToInt(Edit1.Text)+1;
 StringGrid5.ColCount:=StrToInt(Edit2.Text)+1;
 StringGrid5.Width:=65*(StrToInt(Edit2.Text)+1)+1;
 StringGrid5.Height:=25*(StrToInt(Edit1.Text)+1)+1;

 for i:=1 to StringGrid1.RowCount-1 do
 StringGrid5.Cells[0,i]:='A'+intTostr(i);
 for i:=1 to StringGrid1.ColCount-1 do
 StringGrid5.Cells[i,0]:='B'+intTostr(i);
 for i:=1 to StringGrid5.RowCount-1 do
 for j:=1 to StringGrid5.ColCount-1 do
  StringGrid5.Cells[j,i]:=intTostr(random(6)+1);
end
else
Showmessage('������������ �������� ������');
end;

procedure TForm1.Button3Click(Sender: TObject);
var price: array[1..50, 1..50] of integer;
    base: array[1..50, 1..50] of integer;
    price1: array[1..50, 1..50] of integer;
    u,v:array[1..50]of integer;
    i,j,n,m,max,maxi,maxj,min,imin,jmin,L:integer;
    t:boolean;
    fi,fj:array[1..50] of boolean;
    a,koord:array[1..50,1..2]of integer;
    num:integer;
// �������� ��� �� ����������� ��������
function check():boolean;
var x:integer;
y:integer;
tf:boolean;
begin
  tf:=true;
  for x:=1 to n do if fi[x]=false then tf:=false;
  for y:=1 to m do if fj[y]=false then tf:=false;
  check:=tf;
end;

function in_a (x,y:integer):boolean;
var i:integer;
    hodili:boolean;
begin
hodili:=false;
for i:=2 to n do
    hodili:=hodili or (a[i,1]=x) and (a[i,2]=y);
in_a:=hodili;
end;
 //���������� �����
procedure cykl(x,y,x1,y1,count:integer);
var i,j:integer;
begin
  if (x1=x)and(y1=y)and (count>1)
  then
  begin
    for i:=1 to count do
     begin
      koord[i,1]:=a[i,1];
      koord[i,2]:=a[i,2];
     end;
      num:=count;
  end
  else
  begin
    if Odd(count) then
     for i:=1 to n do
     begin
       if (i<>x1)and not(in_a(i,y1))and ((base[i,y1]>-1)or(i=x)and(y1=y)) then
       begin
        a[count+1,1]:=i;
        a[count+1,2]:=y1;
        cykl(x,y,i,y1,count+1);
        a[count+1,1]:=0;
        a[count+1,2]:=0;
       end;
       end
       else
        for j:=1 to m do
       if (j<>y1)and not (in_a(x1,j))and((base[x1,j]>-1)or(x1=x)and(j=y)) then
       begin
        a[count+1,1]:=x1;
        a[count+1,2]:=j;
        cykl(x,y,x1,j,count+1);
        a[count+1,1]:=0;
        a[count+1,2]:=0;
       end;
  end;
end;

begin
if f then
begin
 StringGrid4.RowCount:=StrToInt(Edit1.Text)+1;
 StringGrid4.ColCount:=StrToInt(Edit2.Text)+1;
 StringGrid4.Width:=65*(StrToInt(Edit2.Text)+1)+1;
 StringGrid4.Height:=25*(StrToInt(Edit1.Text)+1)+1;

 for i:=1 to StringGrid1.RowCount-1 do
 StringGrid4.Cells[0,i]:='A'+intTostr(i);
 for i:=1 to StringGrid1.ColCount-1 do
 StringGrid4.Cells[i,0]:='B'+intTostr(i);

    t:=true;
    n:=StringGrid1.RowCount-1;
    m:=StringGrid1.ColCount-1;
{������� ������������� �����������}
for i:=1 to n do fi[i]:=false;
for j:=1 to m do fj[j]:=false;
{������� ��� � �������  price � �������� �������� � base}
  for i:=1 to StringGrid1.RowCount-1 do
    for j:=1 to StringGrid1.ColCount-1 do
    begin
      price[i,j]:=strtoint(StringGrid5.Cells[j,i]);
      if StringGrid1.Cells[j,i]='' then  base[i,j]:=-1
      else base[i,j]:=strtoint(StringGrid1.Cells[j,i]);
    end;
   {���������� �����������}
  u[1]:=0; {�������� ������� ����������}
  fi[1]:=true;
  while not(check()) do
  begin

  for i:=1 to n do
    begin
      if fi[i]=true then
      begin
        for j:=1 to m do
        if (base[i,j]<>-1)and (fj[j]=false) then
        begin
          v[j]:=price[i,j]+u[i];
          fj[j]:=true;
        end;
      end;
     end;

     for j:=1 to m do
    begin
      if fj[j]=true then
      begin
        for i:=1 to n do
        if (base[i,j]<>-1)and (fi[i]=false) then
        begin
          u[i]:=v[j]-price[i,j];
          fi[i]:=true;
        end;
      end;
     end;
  end;

  // ���������� �������� ����������� ��� ��������� ������
  // � ����� ������ ��� ����� � �����
  max:=0;
  for i:=1 to n do
    for j:=1 to m do
      if base[i,j]=-1 then
      begin
        price1[i,j]:=v[j]-u[i];
        if price1[i,j]-price[i,j]>max then
        begin
          max:=price1[i,j]-price[i,j];
          maxi:=i;
          maxj:=j;
        end;
      end;
  //��������� ����� ����
  while max>0 do
  begin
  a[1,1]:=maxi;
  a[1,2]:=maxj;
  cykl(maxi,maxj,maxi,maxj,1);
  //���������� �� �����
  min:=base[koord[2,1],koord[2,2]] ;
  imin:=koord[2,1];
  jmin:=koord[2,2];
  for i:=4 to num do
  begin
    if not(odd(i)) then
    if base[koord[i,1],koord[i,2]]<min then
    begin
      min:=base[koord[i,1],koord[i,2]];
      imin:=koord[i,1];
      jmin:=koord[i,2];
    end;
  end;
  base[koord[1,1],koord[1,2]]:=0;
  For i:=1 to num-1 do
  begin
     if odd(i) then base[koord[i,1],koord[i,2]]:=base[koord[i,1],koord[i,2]]+min
     else base[koord[i,1],koord[i,2]]:=base[koord[i,1],koord[i,2]]-min;
  end;
  base[imin,jmin]:=-1;
  for i:=1 to n do
  begin
    u[i]:=0;
    fi[i]:=false;
  end;
  for i:=1 to m do
  begin
    v[i]:=0;
    fj[i]:=false;
  end;
  u[1]:=0;
  fi[1]:=true;
  while not(check()) do
  begin

  for i:=1 to n do
    begin
      if fi[i]=true then
      begin
        for j:=1 to m do
        if (base[i,j]<>-1)and (fj[j]=false) then
        begin
          v[j]:=price[i,j]+u[i];
          fj[j]:=true;
        end;
      end;
     end;

     for j:=1 to m do
    begin
      if fj[j]=true then
      begin
        for i:=1 to n do
        if (base[i,j]<>-1)and (fi[i]=false) then
        begin
          u[i]:=v[j]-price[i,j];
          fi[i]:=true;
        end;
      end;
     end;
  end;

  // ���������� �������� ����������� ��� ��������� ������
  max:=0;
  for i:=1 to n do
    for j:=1 to m do
      if base[i,j]=-1 then
      begin
        price1[i,j]:=v[j]-u[i];
        if price1[i,j]-price[i,j]>max then
        begin
          max:=price1[i,j]-price[i,j];
          maxi:=i;
          maxj:=j;
        end;
      end;
  end;
  //����� ����������
  for i:=1 to n do
  for j:=1 to m do
  begin
    if base[i,j]=-1 then form1.StringGrid4.Cells[j,i]:=''
    else form1.StringGrid4.Cells[j,i]:=inttostr(base[i,j]);
  end;
  L:=0;
  for i:=1 to n do
  for j:=1 to m do
  if base[i,j]<>-1 then L:=L+base[i,j]*price[i,j];
  form1.Label6.Caption:='����� ��������� = '+inttostr(L);
end
else
 Showmessage('������������ �������� ������');
end;

procedure TForm1.Button4Click(Sender: TObject);

begin
StringGrid5.Enabled:=true;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then key:=#0;
end;

end.
