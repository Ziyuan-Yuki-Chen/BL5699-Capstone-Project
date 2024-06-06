
/* v0 tertile */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc freq data=clinical_biomarker_v0_imputed;
    tables PREGSLEP_fm011 / nocum nocol norow nopercent missing;
run;

data v0_transformed;
set clinical_biomarker_v0_imputed;
log_Glucose=log(Glucose);
log_Insulin=log(Insulin);
log_HbA1c_PCT=log(HbA1c_PCT);
log_C_peptide=log(C_peptide);
log_HOMA_IR=log(HOMA_IR);
log_hsCRP=log(hsCRP);
run;

data allvar;
 set V0_transformed;
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
proc genmod DATA=v0_transformed;
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

proc freq data=clinical_biomarker_v1_imputed;
    tables PREGSLEP_fm013_v1 / nocum nocol norow nopercent missing;
run;

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
proc genmod DATA=v1_transformed;
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

proc freq data=clinical_biomarker_v2_imputed;
    tables PREGSLEP_fm013_v2 / nocum nocol norow nopercent missing;
run;

data v2_transformed;
set clinical_biomarker_v2_imputed;
log_Glucose=log(Glucose);
log_Insulin=log(Insulin);
log_HbA1c_PCT=log(HbA1c_PCT);
log_C_peptide=log(C_peptide);
log_HOMA_IR=log(HOMA_IR);
log_HOMA_beta=log(HOMA_beta);
log_hsCRP=log(hsCRP);
run;

data allvar;
 set V2_transformed;
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
proc genmod DATA=v2_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V2 SCORE_STRS SCORE_SUPTF GDM_treatment/covb INFLUENCE;
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

proc freq data=clinical_biomarker_v4_imputed;
    tables PREGSLEP_fm013_v4 / nocum nocol norow nopercent missing;
run;

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
proc genmod DATA=v4_transformed;
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



/* controls */

PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\control\V2_controls.xlsx"
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
log_HOMA_beta=log(HOMA_beta);
log_hsCRP=log(hsCRP);
run;

data allvar;
 set V2_transformed;
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
proc genmod DATA=v2_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V2 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
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

/* v4 */

PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\control\V4_controls.xlsx"
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
log_HOMA_beta=log(HOMA_beta);
log_C_Chol=log(Chol);
log_HDLD=log(HDLD);
log_LDLD=log(LDLD);
log_Trigl=log(Trigl);
log_hsCRP=log(hsCRP);
run;

data allvar;
 set V4_transformed;
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
proc genmod DATA=v4_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V4 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
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



/* obese_cases_v2 */
PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\obese_cases_v2.xlsx"
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
log_HOMA_beta=log(HOMA_beta);
log_hsCRP=log(hsCRP);
run;

data allvar;
 set V2_transformed;
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
proc genmod DATA=v2_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm SCORE_DEPR_fm014_V2 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
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

/* obese_cases_v4 */
PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\obese_cases_v4.xlsx"
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
proc genmod DATA=v4_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x PairID momrace familyhis_dm education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm SCORE_DEPR_fm014_V4 SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
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
