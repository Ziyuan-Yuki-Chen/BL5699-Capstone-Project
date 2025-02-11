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
