/* define reference group as rarely/never */
/* v0 */
PROC IMPORT OUT= clinical_biomarker_v0
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v0;
  by PREG_NAP_fm011; 
run;

data clinical_biomarker_v0;
    set clinical_biomarker_v0; 
    if PREG_NAP_fm011 = 1 then PREG_NAP_fm011_tertile = 3;
	else if PREG_NAP_fm011 = 2 then PREG_NAP_fm011_tertile = 2;
    else if PREG_NAP_fm011 = 3 then PREG_NAP_fm011_tertile = 1;
run;

data clinical_biomarker_v0; 
    set clinical_biomarker_v0 (drop= PREG_NAP_fm011); 
run;
data clinical_biomarker_v0; 
    set clinical_biomarker_v0;
rename PREG_NAP_fm011_tertile= PREG_NAP_fm011; 
run;

PROC EXPORT DATA=clinical_biomarker_v0
OUTFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v0_new.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

/* v1 */
PROC IMPORT OUT= clinical_biomarker_v1
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v1;
  by PREG_NAP_fm013_V1; 
run;

data clinical_biomarker_v1;
    set clinical_biomarker_v1; 
    if PREG_NAP_fm013_V1 = 1 then PREG_NAP_fm013_V1_tertile = 3;
	else if PREG_NAP_fm013_V1 = 2 then PREG_NAP_fm013_V1_tertile = 2;
    else if PREG_NAP_fm013_V1 = 3 then PREG_NAP_fm013_V1_tertile = 1;
run;

data clinical_biomarker_v1; 
    set clinical_biomarker_v1 (drop= PREG_NAP_fm013_V1); 
run;
data clinical_biomarker_v1; 
    set clinical_biomarker_v1;
rename PREG_NAP_fm013_V1_tertile= PREG_NAP_fm013_V1; 
run;

PROC EXPORT DATA=clinical_biomarker_v1
OUTFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v1.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

/* v2 */
PROC IMPORT OUT= clinical_biomarker_v2
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v2;
  by PREG_NAP_fm013_V2; 
run;

data clinical_biomarker_v2;
    set clinical_biomarker_v2; 
    if PREG_NAP_fm013_V2 = 1 then PREG_NAP_fm013_V2_tertile = 3;
	else if PREG_NAP_fm013_V2 = 2 then PREG_NAP_fm013_V2_tertile = 2;
    else if PREG_NAP_fm013_V2 = 3 then PREG_NAP_fm013_V2_tertile = 1;
run;

data clinical_biomarker_v2; 
    set clinical_biomarker_v2 (drop= PREG_NAP_fm013_V2); 
run;
data clinical_biomarker_v2; 
    set clinical_biomarker_v2;
rename PREG_NAP_fm013_V2_tertile= PREG_NAP_fm013_V2; 
run;

PROC EXPORT DATA=clinical_biomarker_v2
OUTFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v2.xlsx"
      DBMS=XLSX REPLACE;
    RUN;


/* v4 */
PROC IMPORT OUT= clinical_biomarker_v4
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v4.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v4;
  by PREG_NAP_fm013_V4; 
run;

data clinical_biomarker_v4;
    set clinical_biomarker_v4; 
    if PREG_NAP_fm013_V4 = 1 then PREG_NAP_fm013_V4_tertile = 3;
   else if PREG_NAP_fm013_V4 = 2 then PREG_NAP_fm013_V4_tertile = 2;
    else if PREG_NAP_fm013_V4 = 3 then PREG_NAP_fm013_V4_tertile = 1;
run;

data clinical_biomarker_v4; 
    set clinical_biomarker_v4 (drop= PREG_NAP_fm013_V4); 
run;

data clinical_biomarker_v4; 
    set clinical_biomarker_v4;
rename PREG_NAP_fm013_V4_tertile= PREG_NAP_fm013_V4; 
run;

PROC EXPORT DATA=clinical_biomarker_v4
OUTFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v4.xlsx"
      DBMS=XLSX REPLACE;
    RUN;


/* V0 */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v0_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc freq data=clinical_biomarker_v0_imputed;
    tables PREG_NAP_fm011 / nocum nocol norow nopercent missing;
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
proc genmod DATA=v0_transformed;
ods output GEEEmpPEst=metabolite&obs;
class &x PREGSLEP_fm011 PairID momrace familyhis_dm prepregbmi education childsex/param=reference ref=first;
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





/* V1 */
PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v1_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc freq data=clinical_biomarker_v1_imputed;
    tables PREG_NAP_fm013_v1 / nocum nocol norow nopercent missing;
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
 array xvar[*] PREG_NAP_fm013_V1;
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


/* v2 */
PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\V2_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc freq data=clinical_biomarker_v2_imputed;
    tables PREG_NAP_fm013_v2 / nocum nocol norow nopercent missing;
run;

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
 array xvar[*] PREG_NAP_fm013_V2;
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
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\V4_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc freq data=clinical_biomarker_v4_imputed;
    tables PREG_NAP_fm013_v4 / nocum nocol norow nopercent missing;
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
 array xvar[*] PREG_NAP_fm013_V4;
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
class &x PREGSLEP_fm013_v4 PairID momrace familyhis_dm prepregbmi education childsex GDM_treatment/param=reference ref=first;
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
