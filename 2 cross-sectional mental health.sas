/* depression */

/* V0 depression */
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

data allvar;
 set V0_transformed;
 array xvar[*] SCORE_depression;
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
class PREGSLEP_fm011 PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GAv0 PA_Tot_V0 momagegroup momrace familyhis_dm prepregbmi SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
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


/* V1 */
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

data allvar;
 set V1_transformed;
 array xvar[*] SCORE_DEPR_fm014_V1;
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
class PREGSLEP_fm013_v1 PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V1 momagegroup momrace familyhis_dm prepregbmi SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
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



/* V2 */
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
data allvar;
 set V2_transformed;
 array xvar[*] SCORE_DEPR_fm014_V2;
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
class PREGSLEP_fm013_v2 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
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





/* V4 */
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

data allvar;
 set V4_transformed;
 array xvar[*] SCORE_DEPR_fm014_V4;
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
class PREGSLEP_fm013_v4 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
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
/* V2 */
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
log_hsCRP=log(hsCRP);
run;
data allvar;
 set V2_transformed;
 array xvar[*] SCORE_DEPR_fm014_V2;
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
class PREGSLEP_fm013_v2 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
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





/* V4 */
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
log_hsCRP=log(hsCRP);
run;

data allvar;
 set V4_transformed;
 array xvar[*] SCORE_DEPR_fm014_V4;
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
class PREGSLEP_fm013_v4 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi SCORE_STRS SCORE_SUPTF/covb INFLUENCE;
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






/* Stress */

/* V0 stress */
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
log_HOMA_beta=log(HOMA_beta);
log_C_Chol=log(Chol);
log_HDLD=log(HDLD);
log_LDLD=log(LDLD);
log_Trigl=log(Trigl);
log_hsCRP=log(hsCRP);
log_Estradiol=log(Estradiol);
log_Progesterone=log(Progesterone);
log_SHBG=log(SHBG);
log_Prolactin=log(Prolactin);
log_Free_Beta_hCG=log(Free_Beta_hCG);
run;

data allvar;
 set V0_transformed;
 array xvar[*] SCORE_STRS;
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
class PREGSLEP_fm011 PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GAv0 PA_Tot_V0 momagegroup momrace familyhis_dm prepregbmi SCORE_depression SCORE_SUPTF/covb INFLUENCE;
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


/* V1 */
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

data allvar;
 set V1_transformed;
 array xvar[*] SCORE_STRS;
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
class PREGSLEP_fm013_v1 PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V1 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V1 SCORE_SUPTF/covb INFLUENCE;
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



/* V2 */
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
log_HOMA_beta=log(HOMA_beta);
log_C_Chol=log(Chol);
log_HDLD=log(HDLD);
log_LDLD=log(LDLD);
log_Trigl=log(Trigl);
log_hsCRP=log(hsCRP);
run;

data allvar;
 set V2_transformed;
 array xvar[*] SCORE_STRS;
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
class PREGSLEP_fm013_v2 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V2 SCORE_SUPTF/covb INFLUENCE;
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



/* V4 */
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
log_HOMA_beta=log(HOMA_beta);
log_C_Chol=log(Chol);
log_HDLD=log(HDLD);
log_LDLD=log(LDLD);
log_Trigl=log(Trigl);
log_hsCRP=log(hsCRP);
run;

data allvar;
 set V4_transformed;
 array xvar[*] SCORE_STRS;
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
class PREGSLEP_fm013_v4 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V4 SCORE_SUPTF/covb INFLUENCE;
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
/* V2 */
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
log_C_Chol=log(Chol);
log_HDLD=log(HDLD);
log_LDLD=log(LDLD);
log_Trigl=log(Trigl);
log_hsCRP=log(hsCRP);
run;

data allvar;
 set V2_transformed;
 array xvar[*] SCORE_STRS;
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
class PREGSLEP_fm013_v2 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V2 SCORE_SUPTF/covb INFLUENCE;
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



/* V4 */
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
 array xvar[*] SCORE_STRS;
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
class PREGSLEP_fm013_v4 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V4 SCORE_SUPTF/covb INFLUENCE;
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


/* Support */

/* V0 support */
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
log_HOMA_beta=log(HOMA_beta);
log_C_Chol=log(Chol);
log_HDLD=log(HDLD);
log_LDLD=log(LDLD);
log_Trigl=log(Trigl);
log_hsCRP=log(hsCRP);
run;

data allvar;
 set V0_transformed;
 array xvar[*] SCORE_SUPTF;
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
class PREGSLEP_fm011 PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GAv0 PA_Tot_V0 momagegroup momrace familyhis_dm prepregbmi SCORE_depression SCORE_STRS/covb INFLUENCE;
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


/* V1 */
PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile\V1.xlsx"
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
log_HOMA_beta=log(HOMA_beta);
log_C_Chol=log(Chol);
log_HDLD=log(HDLD);
log_LDLD=log(LDLD);
log_Trigl=log(Trigl);
log_hsCRP=log(hsCRP);
log_Estradiol=log(Estradiol);
log_Progesterone=log(Progesterone);
log_SHBG=log(SHBG);
log_Prolactin=log(Prolactin);
log_Free_Beta_hCG=log(Free_Beta_hCG);
run;

data allvar;
 set V1_transformed;
 array xvar[*] SCORE_SUPTF;
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
class PREGSLEP_fm013_v1 PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V1 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V1 SCORE_STRS/covb INFLUENCE;
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



/* V2 */
PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile\V2.xlsx"
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
log_C_Chol=log(Chol);
log_HDLD=log(HDLD);
log_LDLD=log(LDLD);
log_Trigl=log(Trigl);
log_hsCRP=log(hsCRP);
log_Estradiol=log(Estradiol);
log_Progesterone=log(Progesterone);
log_SHBG=log(SHBG);
log_Prolactin=log(Prolactin);
log_Free_Beta_hCG=log(Free_Beta_hCG);
run;

data allvar;
 set V2_transformed;
 array xvar[*] SCORE_SUPTF;
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
class PREGSLEP_fm013_v2 PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V2 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V2 SCORE_STRS/covb INFLUENCE;
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





/* V4 */
PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile\V4.xlsx"
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
log_Estradiol=log(Estradiol);
log_Progesterone=log(Progesterone);
log_SHBG=log(SHBG);
log_Prolactin=log(Prolactin);
log_Free_Beta_hCG=log(Free_Beta_hCG);
run;

data allvar;
 set V4_transformed;
 array xvar[*] SCORE_SUPTF;
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
class PREGSLEP_fm013_v4 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
model &y=&x GA_wk PA_Tot_V4 momagegroup momrace familyhis_dm prepregbmi SCORE_DEPR_fm014_V4 SCORE_STRS/covb INFLUENCE;
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

