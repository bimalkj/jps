unit myfuncU;

interface
uses
  SysUtils,inifiles,dialogs,Controls;

  type
        TMyDate=class
        public
        sdate, edate :Tdate;
        constructor Create;overload;
        constructor Create(cDate:Tdate);overload;
   end;


  Function taxcal(storig:string;amt:real):real;
  Function repchar(ch:char;n:integer):String;
  Function padl(st:string;l:integer;pchar:char=' '):string;
  Function padc(st:string;l:integer;pchar:char=' '):string;
  Function iniread(fname,section,key:string;errcode:string='Error'):string;
  Function encryptpass(pass:string=''):string;
  Procedure iniwrite(fname,section,key,value:string);
  Function fmtstr(st:Variant;Fstring:string='%s'):string;
  Function numtoword(num1:real=0;oflg:boolean=True):string;
  Function stofloat(st:String):real;
  function cltoword(st:string):string;
  Function datetoword(num1:real=0;oflg:boolean=True):string;

  implementation

constructor TmyDate.Create;
var
curdate,tempdate,nextdate:tdatetime;
yr,mon,dy:word;
begin
curdate:=date;
decodedate(curdate,yr,mon,dy);dy:=1;
tempdate:=encodedate(yr,mon,1);
nextdate:=tempdate-1;
edate:=nextdate;
decodedate(nextdate,yr,mon,dy);dy:=1;
sdate:=encodedate(yr,mon,dy);
end;

constructor TmyDate.Create(cDate:Tdate);
var
curdate,tempdate,nextdate:tdatetime;
yr,mon,dy:word;
begin
curdate:=cDate;
decodedate(curdate,yr,mon,dy);dy:=1;
tempdate:=encodedate(yr,mon,1);
nextdate:=tempdate-1;
edate:=nextdate;
decodedate(nextdate,yr,mon,dy);dy:=1;
sdate:=encodedate(yr,mon,dy);
end;

Function fmtstr(st:Variant;Fstring:string='%s'):string;
begin
result:=Format(Fstring,[st]);
end;

Function iniread(fname,section,key:string;errcode:string='Error'):string;
var
 delphiini:TIniFile;
begin
delphiini:=tinifile.create(fname);
iniread:=delphiini.readstring(section,key,errcode);
end;

Procedure iniwrite(fname,section,key,value:string);
var
 delphiini:TIniFile;
begin
delphiini:=tinifile.create(fname);
delphiini.writestring(section,key,value);
end;

{Function taxcal(storig:string;amt:real):real;
var st:array[1..5] of real;
strtemp:string;i,j:integer;
valchr:set of char;
//Declaration of sub procedure
Procedure pcal(var n:real;p:real);
begin
n:=n+n*p/100;
end;
//end of procedure declaration
begin
storig:=storig+'|';j:=1;strtemp:='';
valchr:=['0'..'9','.'];
for i:=1 to length(storig) do
        begin
        if (storig[i] in valchr) then strtemp:=strtemp+storig[i]
        else
        if (storig[i-1] in valchr) then
                begin
                st[j]:=strtofloat(strtemp);strtemp:='';inc(j);
                end;
        end;
for i:=1 to j-1 do pcal(amt,st[i]);
result:=amt;
end;}

Function repchar(ch:char;n:integer):String;
var i:integer;
begin
repchar:='';n:=abs(n);
for i:=1 to n do result:=result+ch;
end;

Function padc(st:string;l:integer;pchar:char=' '):string;
var ln:integer;
begin
ln:=(l-length(st)) div 2;
result:=repchar(pchar,ln)+st;
end;

Function padl(st:string;l:integer;pchar:char=' '):string;
var ln:integer;
begin
ln:=length(st);
if ln<abs(l) then
        if (l>-1) then result:=st+repchar(pchar,abs(l)-ln)
                  else result:=repchar(pchar,abs(l)-ln)+st+' '
             else result:=st;
if l=0 then result:='';
end;

Function encryptpass(pass:string=''):string;
var
len:integer;
begin
len:=length(pass);
while len > 0 do
	begin
	    pass[len]:=chr(ord(pass[len])-30);
	    len:=len-1;
	end;
result:=pass;
end;

Function taxcal(storig:string;amt:real):real;
var st:array[1..5] of real;
strtemp:string;i,j:integer;
valchr:set of char;
actamt:real;
negpos:integer;
//Declaration of sub procedure
Procedure pcal(var n:real;p:real;fg:integer;act_amt:real=0);
begin
if fg=0 then
  n:=n+n*p/100
else
begin
  if act_amt>0 then
    n:=n-act_amt*p/100
  else
    n:=n-n*p/100;
end;
end;
//end of procedure declaration
begin
negpos:=0;
actamt:=amt;
storig:=storig+'|';j:=1;strtemp:='';
valchr:=['0'..'9','.'];
for i:=1 to length(storig) do
        begin
        if (storig[i] in valchr) then
        begin
           if storig[i-1]='-' then
              negpos:=j;
           strtemp:=strtemp+storig[i];
        end
        else
        if (storig[i-1] in valchr) then
                begin
                st[j]:=strtofloat(strtemp);strtemp:='';inc(j);
                end;
        end;
for i:=1 to j-1 do
begin
  if i=negpos then
  begin
       pcal(amt,st[i],1,actamt);
  end
  else
     pcal(amt,st[i],0);
end;
result:=amt;
end;

Function numtoword(num1:real=0;oflg:boolean=True):string;
const ostr:array[1..20] of string=('One ','Two ','Three ','Four ','Five ','Six '
,'Seven ','Eight ','Nine ','Ten ','Eleven ','Twelve ','Thirteen ','Fourteen ','Fifteen '
,'Sixteen ','Seventeen ','Eighteen ','Nineteen ','Twenty ');
tstr:array[1..9] of string=('Ten ','Twenty ','Thirty ','Forty ','Fifty ','Sixty '
,'Seventy ','Eighty ','Ninety ');
hstr:array[1..4] of string=('Hundred ','Thousand ','Lacs ','Crore ');
var
{Variable declaration of main}
num,i:longint;lflag:boolean;
j:real;
nstr:string;
Function ostr1(i:integer):string;
begin
ostr1:='';if i>0 then ostr1:=ostr[i];
end;
Function hstr1(i:integer):string;
begin
hstr1:='';if i>0 then hstr1:=hstr[i];
end;
Function tconv(n:longint):string;
var t2,temp,tmpstr:string;
i:longint;
begin
t2:='';temp:='';tmpstr:='';
    if n>99 then
  begin
   if n div 100<>0 then tmpstr:=ostr1(n div 100)+'Hundred ';
   n:=n mod 100;
  end;
  if n>20 then
  begin
   i:=n div 10;if i<>0 then temp:=tstr[i] else temp:='';
   i:=n mod 10;if i<>0 then t2:=ostr1(i) else t2:='';
   tmpstr:=tmpstr+temp+t2;
  end
  else tmpstr:=tmpstr+ostr1(n);
tconv:=tmpstr;
end;

begin
if num1>0 then
begin
  lflag:=True;num:=trunc(num1);nstr:='';
  j:=(num1-num)*100;if j>0 then nstr:='and '+tconv(trunc(j))
  +'Paise ';
  if num<1000 then nstr:=tconv(num)+nstr
  else
  begin
       nstr:=tconv(num mod 1000)+nstr;
       num:=num div 1000;lflag:=False;
  end;i:=2;
if not lflag then begin
     while num>=100 do begin
       if num mod 100 <>0 then
       nstr:=tconv(num mod 100)+hstr[i]+nstr;
       num:=num div 100;i:=i+1;
      end;
nstr:=tconv(num)+hstr1(i)+nstr;end;
numtoword:=nstr;
if not (nstr[1]=' ') and oflg then
numtoword:=nstr+'Only';
end
 else numtoword:='';
end;

Function stofloat(st:String):real;
begin
result:=0.00;
try
result:=strtofloat(st);
except
end;
end;

function  Cal_seg_area(radius,seg_height:real):Real;
const pi = 3.141592;
const radian = 114.591582;
var
      apo,chord,area,height:real;
      flag:boolean;
begin
      flag := false;
      if seg_height > radius then
            flag := true;
      if flag  then
           height := (radius*2) - seg_height
      else
           height := seg_height;
      apo := radius - height;
      chord := 2 * sqrt( radius * radius - apo * apo);
      area := ((pi*radius*radius)* (radian * arctan((chord / 2) / apo)) / 360) - (apo * chord / 2);
      if flag then
           area := (pi * radius * radius) - area;
      result := area;
end;

function Volume(dia,seg_height,length:real):real;
begin
      result := Cal_seg_area(dia/2,seg_height) * length;
end;

function cltoword(st:string):string;
var tmp:string;
begin
st:=trim(st);
if (st='NUR') then tmp:='Nursery'
else if (st='LKG') then tmp:='LKG'
else if (st='UKG') then tmp:='UKG'
else if (st='STD. I') then tmp:='One'
else if (st='STD.II') then tmp:='Two'
else if (st='STD.III') then tmp:='Three'
else if (st='STD.IV') then tmp:='Four'
else if (st='STD.V') then tmp:='Five'
else if (st='STD. VI') then tmp:='Six'
else if (st='STD. VII') then tmp:='Seven'
else if (st='STD. VIII') then tmp:='Eight'
else if (st='STD.IX(Sc)') then tmp:='Nine'
else if (st='STD-X') then tmp:='Ten'
else if (st='STD.XI(SC)') then tmp:='Eleven'
else if (st='STD.XI ART') then tmp:='Eleven'
else if (st='STD.XII SC') then tmp:='Twelve'
else if (st='STD.XII AR') then tmp:='Twelve'
else if (st='STD. XI CO') then tmp:='Eleven'
else if (st='STD XII CO') then tmp:='Twelve'
else if (st='Std-IX COM') then tmp:='Nine'
else if (st='STD IX') then tmp:='Nine'
else if (st='STD -X(Sc)') then tmp:='Ten'
else if (st='VIII') then tmp:='Eight';
result:=tmp;
end;


Function datetoword(num1:real=0;oflg:boolean=True):string;
const ostr:array[1..20] of string=('First ','Second ','Third ','Fourth ','Fifth ','Sixth '
,'Seventh ','Eighth ','Ninth ','Tenth ','Eleventh ','Twelfth ','Thirteenth ','Fourteenth ','Fifteenth '
,'Sixteenth ','Seventeenth ','Eighteenth ','Nineteenth ','Twentieth ');
tstr:array[1..9] of string=('Tenth ','Twenty ','Thirty ','Forty ','Fifty ','Sixty '
,'Seventy ','Eighty ','Ninety ');
hstr:array[1..4] of string=('Hundred ','Thousand ','Lacs ','Crore ');
var
{Variable declaration of main}
num,i:longint;lflag:boolean;
j:real;
nstr:string;
Function ostr1(i:integer):string;
begin
ostr1:='';if i>0 then ostr1:=ostr[i];
end;
Function hstr1(i:integer):string;
begin
hstr1:='';if i>0 then hstr1:=hstr[i];
end;
Function tconv(n:longint):string;
var t2,temp,tmpstr:string;
i:longint;
begin
t2:='';temp:='';tmpstr:='';
    if n>99 then
  begin
   if n div 100<>0 then tmpstr:=ostr1(n div 100)+'Hundred ';
   n:=n mod 100;
  end;
  if n>20 then
  begin
   i:=n div 10;if i<>0 then temp:=tstr[i] else temp:='';
   i:=n mod 10;if i<>0 then t2:=ostr1(i) else t2:='';
   tmpstr:=tmpstr+temp+t2;
  end
  else tmpstr:=tmpstr+ostr1(n);
tconv:=tmpstr;
end;

begin
if num1>0 then
begin
  lflag:=True;num:=trunc(num1);nstr:='';
  j:=(num1-num)*100;if j>0 then nstr:='and '+tconv(trunc(j))
  +'Paise ';
  if num<1000 then nstr:=tconv(num)+nstr
  else
  begin
       nstr:=tconv(num mod 1000)+nstr;
       num:=num div 1000;lflag:=False;
  end;i:=2;
if not lflag then begin
     while num>=100 do begin
       if num mod 100 <>0 then
       nstr:=tconv(num mod 100)+hstr[i]+nstr;
       num:=num div 100;i:=i+1;
      end;
nstr:=tconv(num)+hstr1(i)+nstr;end;
if (num1=30) then nstr:='Thirtieth ';
result:=nstr;
if not (nstr[1]=' ') and oflg then
result:=nstr+'Only ';
end
 else result:='Zero ';
end;




end.
