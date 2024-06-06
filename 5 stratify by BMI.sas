/* Normal & Overweight/ Obese */

/* v0 tertile */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data v0_transformed;
set clinical_biomarker_v0_imputed;
log_Glucose=log(Glucose);
log_Insulin=log(Insulin);
log_HbA1c_PCT=log(HbA1c_PCT);
log_C_peptide=log(C_peptide);
log_HOMA_IR=log(HOMA_IR);
log_hsCRP=log(hsCRP);
run;

data v0_0;
  set v0_transformed;
  where prepregbmi = 0;
run;

PROC EXPORT DATA=v0_0
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v0_0.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

data v0_1;
  set v0_transformed;
  where prepregbmi = 1;
run;

PROC EXPORT DATA=v0_1
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v0_1.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

data v0_2;
  set v0_transformed;
  where prepregbmi = 2;
run;

PROC EXPORT DATA=v0_2
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v0_2.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

PROC IMPORT OUT= V0_0
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v0_0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V0_0;
 array xvar[*] PREGSLEP_fm011;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V0_0;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V0 momagegroup momrace familyhis_dm prepregbmi SCORE_Depression SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA12;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;


/* v0_1 */
PROC IMPORT OUT= V0_1
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v0_1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V0_1;
 array xvar[*] PREGSLEP_fm011;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V0_1;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V0 momagegroup momrace familyhis_dm prepregbmi SCORE_Depression SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA12;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;


/* v0_2 */
PROC IMPORT OUT= V0_2
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v0_2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V0_2;
 array xvar[*] PREGSLEP_fm011;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V0_2;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V0 momagegroup momrace familyhis_dm prepregbmi SCORE_Depression SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA12;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;





/* v1 tertile */
PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data v1_transformed;
set clinical_biomarker_v1_imputed;
log_Glucose=log(Glucose);
log_Insulin=log(Insulin);
log_HbA1c_PCT=log(HbA1c_PCT);
log_C_peptide=log(C_peptide);
log_HOMA_IR=log(HOMA_IR);
log_hsCRP=log(hsCRP);
run;

data v1_0;
  set v1_transformed;
  where prepregbmi = 0;
run;

PROC EXPORT DATA=v1_0
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v1_0.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

data v1_1;
  set v1_transformed;
  where prepregbmi = 1;
run;

PROC EXPORT DATA=v1_1
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v1_1.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

data v1_2;
  set v1_transformed;
  where prepregbmi = 2;
run;

PROC EXPORT DATA=v1_2
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v1_2.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

PROC IMPORT OUT= V1_0
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v1_0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V1_0;
 array xvar[*] PREGSLEP_fm013_v1;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V1_0;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V1 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V1 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA12;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;


/* v1_1 */
PROC IMPORT OUT= V1_1
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v1_1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V1_1;
 array xvar[*] PREGSLEP_fm013_v1;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V1_1;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V1 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V1 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA12;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;


/* v1_2 */
PROC IMPORT OUT= V1_2
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v1_2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V1_2;
 array xvar[*] PREGSLEP_fm013_v1;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V1_2;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V1 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V1 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA12;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;




/* v2 tertile */
PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data v2_transformed;
set clinical_biomarker_v2_imputed;
log_Glucose=log(Glucose);
log_Insulin=log(Insulin);
log_HbA1c_PCT=log(HbA1c_PCT);
log_C_peptide=log(C_peptide);
log_HOMA_IR=log(HOMA_IR);
log_hsCRP=log(hsCRP);
run;

data v2_0;
  set v2_transformed;
  where prepregbmi = 0;
run;

PROC EXPORT DATA=v2_0
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v2_0.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

data v2_1;
  set v2_transformed;
  where prepregbmi = 1;
run;

PROC EXPORT DATA=v2_1
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v2_1.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

data v2_2;
  set v2_transformed;
  where prepregbmi = 2;
run;

PROC EXPORT DATA=v2_2
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v2_2.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

PROC IMPORT OUT= V2_0
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v2_0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V2_0;
 array xvar[*] PREGSLEP_fm013_v2;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V2_0;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V2 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA34;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;


/* v2_1 */
PROC IMPORT OUT= V2_1
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v2_1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V2_1;
 array xvar[*] PREGSLEP_fm013_v2;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V2_1;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V2 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA34;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;


/* v2_2 */
PROC IMPORT OUT= V2_2
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v2_2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V2_2;
 array xvar[*] PREGSLEP_fm013_v2;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V2_2;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V2 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA34;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;


/* v4 tertile */
PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V4.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data v4_transformed;
set clinical_biomarker_v4_imputed;
log_Glucose=log(Glucose);
log_Insulin=log(Insulin);
log_HbA1c_PCT=log(HbA1c_PCT);
log_C_peptide=log(C_peptide);
log_HOMA_IR=log(HOMA_IR);
log_hsCRP=log(hsCRP);
run;

data v4_0;
  set v4_transformed;
  where prepregbmi = 0;
run;

PROC EXPORT DATA=v4_0
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v4_0.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

data v4_1;
  set v4_transformed;
  where prepregbmi = 1;
run;

PROC EXPORT DATA=v4_1
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v4_1.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

data v4_2;
  set v4_transformed;
  where prepregbmi = 2;
run;

PROC EXPORT DATA=v4_2
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v4_2.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

PROC IMPORT OUT= V4_0
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v4_0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V4_0;
 array xvar[*] PREGSLEP_fm013_v4;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V4_0;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V4 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA34;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;


/* v4_1 */
PROC IMPORT OUT= V4_1
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v4_1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V4_1;
 array xvar[*] PREGSLEP_fm013_v4;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V4_1;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V4 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
weight wtPA34;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;


/* v4_2 */
PROC IMPORT OUT= V4_2
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\stratify\v4_2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data allvar;
 set V4_2;
 array xvar[*] PREGSLEP_fm013_v4;
 array yvar[*] log_: ;
 do i=1 to dim(xvar);
  do j=1 to dim(yvar);
  xv=vname(xvar[i]);
  yv=vname(yvar[j]);
  output;
 end;
 end;
 keep xv yv;
run;

proc sort data=allvar nodupkey;
 by xv yv;
run;

proc sql;
 create table varlist as
 select distinct *, monotonic() as obs
 from allvar;
quit;

%macro RunMixed(obs,y,x);
ods output close;
proc genmod DATA=V4_2;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V4 SCORE_STRS SCORE_SUPTF GDM_treatment/covb INFLUENCE;
weight wtPA34;
repeated subject = PairID/ type = unstr;
quit;
data metabolite&obs;
 set metabolite&obs;
 length x y $200;
 x="&x";
 y="&y";
run;
%mend;

data _null_;
 set varlist;
 call execute('%nrstr(%RunMixed('||strip(obs)||','||strip(yv)||','||strip(xv)||'))');
run;

data final;
 set metabolite:;
run;
