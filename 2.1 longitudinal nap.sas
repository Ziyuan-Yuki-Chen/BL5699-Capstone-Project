/* v0 sleep durations & v1 biomarkers */
PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\V1_nap.xlsx"
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

data allvar;
 set V1_transformed;
 array xvar[*] PREG_NAP_fm011;
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
proc genmod DATA=v1_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x PREGSLEP_fm013_v1 PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V1 momagegroup momrace familyhis_dm prepregbmi/covb INFLUENCE;
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

PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\V2_nap.xlsx"
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

data allvar;
 set V2_transformed;
 array xvar[*] PREG_NAP_fm011;
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
proc genmod DATA=v2_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x PREGSLEP_fm013_v2 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi/covb INFLUENCE;
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



/* v1 sleep durations & v2 biomarkers */
PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\V2_nap.xlsx"
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

data allvar;
 set V2_transformed;
 array xvar[*] PREG_NAP_fm013_v1;
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
proc genmod DATA=v2_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x PREGSLEP_fm013_V2 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi/covb INFLUENCE;
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

/* v1 sleep to v4 biomarkers */
PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\V4_nap.xlsx"
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

data allvar;
 set V4_transformed;
 array xvar[*] PREG_NAP_fm013_v1;
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
proc genmod DATA=v4_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi/covb INFLUENCE;
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

/* v2 sleep to v4 biomarkers */
PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\V4_nap.xlsx"
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

data allvar;
 set V4_transformed;
 array xvar[*] PREG_NAP_fm013_v2;
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
proc genmod DATA=v4_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x PREGSLEP_V4 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi /covb INFLUENCE;
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


/* results
1 vs 2:C-peptide; insulin
1 vs 4: glucose; insulin
