Simplifying complex filtering using macro arrays with do_over macro

  Two solutions

        1. Macro array solution
        2, Custom bulit macro solution (see Patrick profile below)

github
https://tinyurl.com/ssl38kz
https://github.com/rogerjdeangelis/utl-simplifying-complex-filtering-using-macro-arrays-do-over


SAS Forum:
https://communities.sas.com/t5/SAS-Programming/Array-question/m-p/627709


Patrick
https://communities.sas.com/t5/user/viewprofilepage/user-id/12447

Macro arraydelete has been updated see end of this post also
in my many macros repository,

macros
https://tinyurl.com/y9nfugth
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories


*    _                 _ _  __
 ___(_)_ __ ___  _ __ | (_)/ _|_   _
/ __| | '_ ` _ \| '_ \| | | |_| | | |
\__ \ | | | | | | |_) | | |  _| |_| |
|___/_|_| |_| |_| .__/|_|_|_|  \__, |
                |_|            |___/
;

data want;

set have;

   if (code1 in (11,17,18) and code2 =7) or (code1 in (11,17,18) and code3 =7)
   or (code1 in (11,17,18) and code3 =7)
   or (code1 in (11,17,18) and code4 =7)
   or (code1 in (11,17,18) and code5 =7)
   or (code1 in (11,17,18) and code6 =7)
   or (code1 in (11,17,18) and code7 =7) then cars='1'; else cars='0';

   if (code1 in (11,17,18) and code2 =13) or (code1 in (11,17,18) and code3 =13)
   or (code1 in (11,17,18) and code3 =13)
   or (code1 in (11,17,18) and code4 =13)
   or (code1 in (11,17,18) and code5 =13)
   or (code1 in (11,17,18) and code6 =13)
   or (code1 in (11,17,18) and code7 =13) then trucks='1'; else trucks='0';

   if (code1 = (749) and code2 in (984,751)) or (code1 = (749) and code3 in (984,751))
   or (code1 = (749) and code3 in (984,751))
   or (code1 = (749) and code4 in (984,751))
   or (code1 = (749) and code5 in (984,751))
   or (code1 = (749) and code6 in (984,751))
   or (code1 = (749) and code7 in (984,751)) then pickup='1'; else pickup='0';

run;

*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;

data have;
 input ID $ code1 code2-code7;
cards4;
1 11 7 13 986 0 13 986 0
2 17 309 13 0 0 13 0 0
3 11 922 357 999 999 357 999 999
4 18 300 0 0 999 0 0 999
5 20 7 0 0 0 0
6 749 984 0 0 0 0 0 0
7 750 751 0 0 999 0 0 999
8 34 15 4 0 0 4 0 0
9 999 1 0 0 1 0 0
10 13 0 0 0 0 0 0 0
11 11 0 0 13 999 0 13 999
12 18 0 1 0 0 1 0 0
13 17 0 0 0 0 0 0 0
14 16 1 0 0 0 0 0 0
15 300 0 0 1 0 0 1 0
16 749 0 0 751 0 0 751 0
;;;;
run;quit;

Up to 40 obs WORK.HAVE total obs=15

Obs    ID    CODE1    CODE2    CODE3    CODE4    CODE5    CODE6    CODE7

  1    1       11        7       13      986        0       13      986
  2    2       17      309       13        0        0       13        0
  3    3       11      922      357      999      999      357      999
  4    4       18      300        0        0      999        0        0
  5    5       20        7        0        0        0        0        6
  6    7      750      751        0        0      999        0        0
  7    8       34       15        4        0        0        4        0
  8    9      999        1        0        0        1        0        0
  9    10      13        0        0        0        0        0        0
 10    11      11        0        0       13      999        0       13
 11    12      18        0        1        0        0        1        0
 12    13      17        0        0        0        0        0        0
 13    14      16        1        0        0        0        0        0
 14    15     300        0        0        1        0        0        1
 15    16     749        0        0      751        0        0      751

*            _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| '_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
;

o 40 obs WORK.WANT total obs=15

   ID    CODE1    CODE2    CODE3    CODE4    CODE5    CODE6    CODE7    CARS    TRUCKS    PICKUP

   1       11        7       13      986        0       13      986      1        1         0
   2       17      309       13        0        0       13        0      0        1         0
   3       11      922      357      999      999      357      999      0        0         0
   4       18      300        0        0      999        0        0      0        0         0
   5       20        7        0        0        0        0        6      0        0         0
   7      750      751        0        0      999        0        0      0        0         0
   8       34       15        4        0        0        4        0      0        0         0
   9      999        1        0        0        1        0        0      0        0         0
   10      13        0        0        0        0        0        0      0        0         0
   11      11        0        0       13      999        0       13      0        1         0
   12      18        0        1        0        0        1        0      0        0         0
   13      17        0        0        0        0        0        0      0        0         0
   14      16        1        0        0        0        0        0      0        0         0
   15     300        0        0        1        0        0        1      0        0         0
   16     749        0        0      751        0        0      751      0        0         1

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __  ___
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|
\__ \ (_) | | |_| | |_| | (_) | | | \__ \
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/
  __ _ _ __ _ __ __ _ _   _
 / _` | '__| '__/ _` | | | |
| (_| | |  | | | (_| | |_| |
 \__,_|_|  |_|  \__,_|\__, |
                      |___/
;

%arraydelete(cds); * just in case the macro array exists;
%put &=cdsn;

* create macro array;
%array(cds,values=2-7);

data want;

   set have;

         if %do_over(cds,phrase=%str((
            code1 in (11,17,18) and code? = 7)),between=or) then cars='1';
         else cars='0';

         if %do_over(cds,phrase=%str((
            code1 in (11,17,18) and code? = 13)),between=or) then trucks='1';
         else trucks='0';

         if %do_over(cds,phrase=%str((
            code1 = (749) and code? in (984,751))),between=or) then pickup='1';
         else pickup='0';

run;quit;


* if you want the filter code, cut and paste from log and fo simple cleanup;;
data _null_;
  * this is a straight paste;
  put  "%do_over(cds,phrase=%str((code1 = (749) and code? in (984,751))),between=or)";
  put  "%do_over(cds,phrase=%str((code1 in (11,17,18) and code? = 13)),between=or)";
  put  "%do_over(cds,phrase=%str((code1 = (749) and code? in (984,751))),between=or)";
run;quit;


   (code1 = (749) and code2 in (984,751))
or (code1 = (749) and code3 in (984,751))
or (code1 = (749) and code4 in (984,751))
or (code1 = (749) and code5 in (984,751))
or (code1 = (749) and code6 in (984,751))
or (code1 = (749) and code7 in (984,751))

   (code1 in (11,17,18) and code2 = 13)
or (code1 in (11,17,18) and code3 = 13)
or (code1 in (11,17,18) and code4 = 13)
or (code1 in (11,17,18) and code5 = 13)
or (code1 in (11,17,18) and code6 = 13)
or (code1 in (11,17,18) and code7 = 13)
or (code1 in (11,17,18) and code7 = 13)

(code1 = (749) and code2 in (984,751))
or (code1 = (749) and code2 in (984,751))
or (code1 = (749) and code3 in (984,751))
or (code1 = (749) and code4 in (984,751))
or (code1 = (749) and code5 in (984,751))
or (code1 = (749) and code6 in (984,751))
or (code1 = (749) and code7 in (984,751))

*____       _        _      _
|  _ \ __ _| |_ _ __(_) ___| | __
| |_) / _` | __| '__| |/ __| |/ /
|  __/ (_| | |_| |  | | (__|   <
|_|   \__,_|\__|_|  |_|\___|_|\_\

;

%macro codecheck(outvar, code1Val, code2to7Val);
  &outvar='0';
  if code1 in (&code1Val) then
    do _i=1 to dim(codes2to7);
      if codes2to7[_i] in (&code2to7Val) then
        do;
          &outvar='1';
          leave;
        end;
    end;
  drop _i;
%mend;

data want;

  set have;

  array codes2to7 {*} code2 - code7;

  %codecheck(cars, 11 17 18, 7)
  %codecheck(trucks, 11 17 18, 13)
  %codecheck(pickup, 749, 984 751)

run;

*                _       _
 _   _ _ __   __| | __ _| |_ ___   _ __ ___   __ _  ___ _ __ ___
| | | | '_ \ / _` |/ _` | __/ _ \ | '_ ` _ \ / _` |/ __| '__/ _ \
| |_| | |_) | (_| | (_| | ||  __/ | | | | | | (_| | (__| | | (_) |
 \__,_| .__/ \__,_|\__,_|\__\___| |_| |_| |_|\__,_|\___|_|  \___/
      |_|
;

%macro arraydelete(pfx)/des="Delete array macrovariables create by array macro";
  %if %symexist(&&pfx.n) %then %do;
     %do i= 1 %to &&&pfx.n;
         %symdel &pfx&i / nowarn;
     %end;
     %symdel  &&pfx.n / nowarn;
  %end;
%men d arraydelete;



