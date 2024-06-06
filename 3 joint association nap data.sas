/* joint association */
/* v0 */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v0_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data indata;
    set clinical_biomarker_v0_imputed;
if PREG_NAP_fm011 eq 1 AND PREGSLEP_fm011 eq 1 then group_nap=1;
else if PREG_NAP_fm011 eq 1 AND PREGSLEP_fm011 eq 2 then group_nap=2;
else if PREG_NAP_fm011 eq 1 AND PREGSLEP_fm011 eq 3 then group_nap= 3 ;
else if PREG_NAP_fm011 eq 2 AND PREGSLEP_fm011 eq 1 then group_nap= 4 ;
else if PREG_NAP_fm011 eq 2 AND PREGSLEP_fm011 eq 2 then group_nap= 5 ;
else if PREG_NAP_fm011 eq 2 AND PREGSLEP_fm011 eq 3 then group_nap= 6 ;
else if PREG_NAP_fm011 eq 3 AND PREGSLEP_fm011 eq 1 then group_nap= 4 ;
else if PREG_NAP_fm011 eq 3 AND PREGSLEP_fm011 eq 2 then group_nap= 5 ;
else if PREG_NAP_fm011 eq 3 AND PREGSLEP_fm011 eq 3 then group_nap= 6 ;
RUN;

PROC EXPORT DATA=indata
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint_nap\V0.xlsx"
      DBMS=XLSX REPLACE;
   RUN;

proc freq data=indata;
    tables group_nap / nocum nocol norow nopercent missing;
run;

/* v1 */
PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v1_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data indata;
    set clinical_biomarker_v1_imputed;
if PREG_NAP_fm013_V1 eq 1 AND PREGSLEP_fm013_v1 eq 1 then group_nap=1;
else if PREG_NAP_fm013_V1 eq 1 AND PREGSLEP_fm013_v1 eq 2 then group_nap=2;
else if PREG_NAP_fm013_V1 eq 1 AND PREGSLEP_fm013_v1 eq 3 then group_nap= 3 ;
else if PREG_NAP_fm013_V1 eq 2 AND PREGSLEP_fm013_v1 eq 1 then group_nap= 4 ;
else if PREG_NAP_fm013_V1 eq 2 AND PREGSLEP_fm013_v1 eq 2 then group_nap= 5 ;
else if PREG_NAP_fm013_V1 eq 2 AND PREGSLEP_fm013_v1 eq 3 then group_nap= 6 ;
else if PREG_NAP_fm013_V1 eq 3 AND PREGSLEP_fm013_v1 eq 1 then group_nap= 4 ;
else if PREG_NAP_fm013_V1 eq 3 AND PREGSLEP_fm013_v1 eq 2 then group_nap= 5 ;
else if PREG_NAP_fm013_V1 eq 3 AND PREGSLEP_fm013_v1 eq 3 then group_nap= 6 ;
RUN;

PROC EXPORT DATA=indata
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint_nap\V1.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

proc freq data=indata;
    tables group_nap / nocum nocol norow nopercent missing;
run;

/* v2 */
PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v2_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data indata;
    set clinical_biomarker_v2_imputed;
if PREG_NAP_fm013_V2 eq 1 AND PREGSLEP_fm013_v2 eq 1 then group_nap=1;
else if PREG_NAP_fm013_V2 eq 1 AND PREGSLEP_fm013_v2 eq 2 then group_nap=2;
else if PREG_NAP_fm013_V2 eq 1 AND PREGSLEP_fm013_v2 eq 3 then group_nap= 3 ;
else if PREG_NAP_fm013_V2 eq 2 AND PREGSLEP_fm013_v2 eq 1 then group_nap= 4 ;
else if PREG_NAP_fm013_V2 eq 2 AND PREGSLEP_fm013_v2 eq 2 then group_nap= 5 ;
else if PREG_NAP_fm013_V2 eq 2 AND PREGSLEP_fm013_v2 eq 3 then group_nap= 6 ;
else if PREG_NAP_fm013_V2 eq 3 AND PREGSLEP_fm013_v2 eq 1 then group_nap= 4 ;
else if PREG_NAP_fm013_V2 eq 3 AND PREGSLEP_fm013_v2 eq 2 then group_nap= 5 ;
else if PREG_NAP_fm013_V2 eq 3 AND PREGSLEP_fm013_v2 eq 3 then group_nap= 6 ;
RUN;

PROC EXPORT DATA=indata
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint_nap\V2.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

proc freq data=indata;
    tables group_nap / nocum nocol norow nopercent missing;
run;


/* v4 */
PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v4_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data indata;
    set clinical_biomarker_v4_imputed;
if PREG_NAP_fm013_V4 eq 1 AND PREGSLEP_fm013_v4 eq 1 then group_nap=1;
else if PREG_NAP_fm013_V4 eq 1 AND PREGSLEP_fm013_v4 eq 2 then group_nap=2;
else if PREG_NAP_fm013_V4 eq 1 AND PREGSLEP_fm013_v4 eq 3 then group_nap= 3 ;
else if PREG_NAP_fm013_V4 eq 2 AND PREGSLEP_fm013_v4 eq 1 then group_nap= 4 ;
else if PREG_NAP_fm013_V4 eq 2 AND PREGSLEP_fm013_v4 eq 2 then group_nap= 5 ;
else if PREG_NAP_fm013_V4 eq 2 AND PREGSLEP_fm013_v4 eq 3 then group_nap= 6 ;
else if PREG_NAP_fm013_V4 eq 3 AND PREGSLEP_fm013_v4 eq 1 then group_nap= 4 ;
else if PREG_NAP_fm013_V4 eq 3 AND PREGSLEP_fm013_v4 eq 2 then group_nap= 5 ;
else if PREG_NAP_fm013_V4 eq 3 AND PREGSLEP_fm013_v4 eq 3 then group_nap= 6 ;
RUN;

PROC EXPORT DATA=indata
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint_nap\V4.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

proc freq data=indata;
    tables group_nap / nocum nocol norow nopercent missing;
run;

/* calculate the number of participants remain in the same group in visit 0 and visit 1 */
PROC IMPORT OUT= nap_v0
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint_nap\v0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

PROC IMPORT OUT= nap_v1
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint_nap\v1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data nap_v1;
set nap_v1;
keep ID group_nap_v1;
run;

DATA napping;
MERGE nap_v0 (IN=nap_v0) nap_v1 (IN=nap_v1);
BY ID;
IF nap_v0;
RUN;

data filtered_napping;
    set napping;
    where group_nap = group_nap_v1;
run;

proc freq data=filtered_napping;
    tables group_nap / nocum nocol norow nopercent missing;
run;


/* cross-taublation table */
proc freq data=napping;
    tables group_nap * group_nap_v1 / out=cross_tabulation; /* Generate cross-tabulation table */
run;

