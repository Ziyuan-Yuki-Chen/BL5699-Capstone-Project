/* joint association */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

PROC means MEAN STD Q1 median Q3 QRANGE MIN MAX DATA=clinical_biomarker_v0_imputed;
VAR SCORE_depression SCORE_STRS PREGSLEP_fm011;
run;

/* stress */
proc sql;
select count(*) as count_above_11
from clinical_biomarker_v0_imputed
where SCORE_STRS > 11;
quit;

data indata;
    set clinical_biomarker_v0_imputed;

    /* Assign 0 if SCORE_depression is below median, 1 otherwise */
    if SCORE_depression = . then g_SCORE_depression = .;
    else if SCORE_depression < 5 then g_SCORE_depression = 0;
	else if SCORE_depression = 5 then g_SCORE_depression = 0;
    else if SCORE_depression > 5 then g_SCORE_depression = 1;

    /* Assign 0 if SCORE_STRS is below median, 1 otherwise */
    if SCORE_STRS = . then g_SCORE_STRS = .;
    else if SCORE_STRS < 11 then g_SCORE_STRS = 0;
	else if SCORE_STRS = 11 then g_SCORE_STRS = 0;
    else if SCORE_STRS > 11 then g_SCORE_STRS = 1;
run;

data indata;
    set indata;
if g_SCORE_STRS eq 0 AND PREGSLEP_fm011 eq 1 then group_stres=1;
else if g_SCORE_STRS eq 0 AND PREGSLEP_fm011 eq 2 then group_stres=2;
else if g_SCORE_STRS eq 0 AND PREGSLEP_fm011 eq 3 then group_stres= 3 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm011 eq 1 then group_stres= 4 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm011 eq 2 then group_stres= 5 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm011 eq 3 then group_stres= 6 ;
RUN;

data indata;
    set indata;
if g_SCORE_depression = 0 AND PREGSLEP_fm011 = 1 then group_depres=1;
else if g_SCORE_depression = 0 AND PREGSLEP_fm011 = 2 then group_depres=2;
else if g_SCORE_depression = 0 AND PREGSLEP_fm011 = 3 then group_depres= 3 ;
else if g_SCORE_depression = 1 AND PREGSLEP_fm011 = 1 then group_depres= 4 ;
else if g_SCORE_depression = 1 AND PREGSLEP_fm011 = 2 then group_depres= 5 ;
else if g_SCORE_depression = 1 AND PREGSLEP_fm011 = 3 then group_depres= 6 ;
RUN;

PROC EXPORT DATA=indata
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint\V0.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

proc freq data=indata;
  tables group_depres / nocum nocol norow nopercent;
run;

proc freq data=indata;
  tables group_stres / nocum nocol norow nopercent;
run;

/* V1 */
PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

PROC means MEAN STD Q1 median Q3 QRANGE MIN MAX DATA=clinical_biomarker_v1_imputed;
VAR SCORE_DEPR_fm014_V1 SCORE_STRS PREGSLEP_fm013_v1;
run;

data indata_v1;
    set clinical_biomarker_v1_imputed;

    /* Assign 0 if SCORE_DEPR_fm014_V1 is below median, 1 otherwise */
    if SCORE_DEPR_fm014_V1 = . then g_SCORE_DEPR_fm014_V1 = .;
    else if SCORE_DEPR_fm014_V1 < 4 then g_SCORE_DEPR_fm014_V1 = 0;
	else if SCORE_DEPR_fm014_V1 = 4 then g_SCORE_DEPR_fm014_V1 = 0;
    else if SCORE_DEPR_fm014_V1 > 4 then g_SCORE_DEPR_fm014_V1 = 1;

    /* Assign 0 if SCORE_STRS is below median, 1 otherwise */
    if SCORE_STRS = . then g_SCORE_STRS = .;
    else if SCORE_STRS < 11 then g_SCORE_STRS = 0;
	else if SCORE_STRS = 11 then g_SCORE_STRS = 0;
    else if SCORE_STRS > 11 then g_SCORE_STRS = 1;
run;

data indata_v1;
    set indata_v1;
if g_SCORE_STRS eq 0 AND PREGSLEP_fm013_v1 eq 1 then group_stres=1;
else if g_SCORE_STRS eq 0 AND PREGSLEP_fm013_v1 eq 2 then group_stres=2;
else if g_SCORE_STRS eq 0 AND PREGSLEP_fm013_v1 eq 3 then group_stres= 3 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm013_v1 eq 1 then group_stres= 4 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm013_v1 eq 2 then group_stres= 5 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm013_v1 eq 3 then group_stres= 6 ;
RUN;

data indata_v1;
    set indata_v1;
if g_SCORE_DEPR_fm014_V1 = 0 AND PREGSLEP_fm013_v1 = 1 then group_depres=1;
else if g_SCORE_DEPR_fm014_V1 = 0 AND PREGSLEP_fm013_v1 = 2 then group_depres=2;
else if g_SCORE_DEPR_fm014_V1 = 0 AND PREGSLEP_fm013_v1 = 3 then group_depres= 3 ;
else if g_SCORE_DEPR_fm014_V1 = 1 AND PREGSLEP_fm013_v1 = 1 then group_depres= 4 ;
else if g_SCORE_DEPR_fm014_V1 = 1 AND PREGSLEP_fm013_v1 = 2 then group_depres= 5 ;
else if g_SCORE_DEPR_fm014_V1 = 1 AND PREGSLEP_fm013_v1 = 3 then group_depres= 6 ;
RUN;

PROC EXPORT DATA=indata_v1
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint\V1.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

	proc freq data=indata_v1;
  tables group_depres / nocum nocol norow nopercent;
run;

proc freq data=indata_v1;
  tables group_stres / nocum nocol norow nopercent;
run;

/* V2 */
PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

PROC means MEAN STD Q1 median Q3 QRANGE MIN MAX DATA=clinical_biomarker_v2_imputed;
VAR SCORE_DEPR_fm014_V2 SCORE_STRS PREGSLEP_fm013_v2;
run;

data indata_v2;
    set clinical_biomarker_v2_imputed;

    /* Assign 0 if SCORE_DEPR_fm014_V2 is below median, 1 otherwise */
    if SCORE_DEPR_fm014_V2 = . then g_SCORE_DEPR_fm014_V2 = .;
    else if SCORE_DEPR_fm014_V2 < 4 then g_SCORE_DEPR_fm014_V2 = 0;
	else if SCORE_DEPR_fm014_V2 = 4 then g_SCORE_DEPR_fm014_V2 = 0;
    else if SCORE_DEPR_fm014_V2 > 4 then g_SCORE_DEPR_fm014_V2 = 1;

    /* Assign 0 if SCORE_STRS is below median, 1 otherwise */
    if SCORE_STRS = . then g_SCORE_STRS = .;
    else if SCORE_STRS < 11 then g_SCORE_STRS = 0;
	else if SCORE_STRS = 11 then g_SCORE_STRS = 0;
    else if SCORE_STRS > 11 then g_SCORE_STRS = 1;
run;

data indata_v2;
    set indata_v2;
if g_SCORE_STRS eq 0 AND PREGSLEP_fm013_v2 eq 1 then group_stres=1;
else if g_SCORE_STRS eq 0 AND PREGSLEP_fm013_v2 eq 2 then group_stres=2;
else if g_SCORE_STRS eq 0 AND PREGSLEP_fm013_v2 eq 3 then group_stres= 3 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm013_v2 eq 1 then group_stres= 4 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm013_v2 eq 2 then group_stres= 5 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm013_v2 eq 3 then group_stres= 6 ;
RUN;

data indata_v2;
    set indata_v2;
if g_SCORE_DEPR_fm014_V2 = 0 AND PREGSLEP_fm013_v2 = 1 then group_depres=1;
else if g_SCORE_DEPR_fm014_V2 = 0 AND PREGSLEP_fm013_v2 = 2 then group_depres=2;
else if g_SCORE_DEPR_fm014_V2 = 0 AND PREGSLEP_fm013_v2 = 3 then group_depres= 3 ;
else if g_SCORE_DEPR_fm014_V2 = 1 AND PREGSLEP_fm013_v2 = 1 then group_depres= 4 ;
else if g_SCORE_DEPR_fm014_V2 = 1 AND PREGSLEP_fm013_v2 = 2 then group_depres= 5 ;
else if g_SCORE_DEPR_fm014_V2 = 1 AND PREGSLEP_fm013_v2 = 3 then group_depres= 6 ;
RUN;

PROC EXPORT DATA=indata_v2
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint\V2.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

	proc freq data=indata_v2;
  tables group_depres / nocum nocol norow nopercent;
run;

proc freq data=indata_v2;
  tables group_stres / nocum nocol norow nopercent;
run;

/* V4 */
PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V4.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

PROC means MEAN STD Q1 median Q3 QRANGE MIN MAX DATA=clinical_biomarker_v4_imputed;
VAR SCORE_DEPR_fm014_V4 SCORE_STRS PREGSLEP_fm013_v4;
run;

data indata_v4;
    set clinical_biomarker_v4_imputed;

    /* Assign 0 if SCORE_DEPR_fm014_V4 is below median, 1 otherwise */
    if SCORE_DEPR_fm014_V4 = . then g_SCORE_DEPR_fm014_V4 = .;
    else if SCORE_DEPR_fm014_V4 < 4 then g_SCORE_DEPR_fm014_V4 = 0;
	else if SCORE_DEPR_fm014_V4 = 4 then g_SCORE_DEPR_fm014_V4 = 0;
    else if SCORE_DEPR_fm014_V4 > 4 then g_SCORE_DEPR_fm014_V4 = 1;

    /* Assign 0 if SCORE_STRS is below median, 1 otherwise */
    if SCORE_STRS = . then g_SCORE_STRS = .;
    else if SCORE_STRS < 11 then g_SCORE_STRS = 0;
	else if SCORE_STRS = 11 then g_SCORE_STRS = 0;
    else if SCORE_STRS > 11 then g_SCORE_STRS = 1;
run;

data indata_v4;
    set indata_v4;
if g_SCORE_STRS eq 0 AND PREGSLEP_fm013_v4 eq 1 then group_stres=1;
else if g_SCORE_STRS eq 0 AND PREGSLEP_fm013_v4 eq 2 then group_stres=2;
else if g_SCORE_STRS eq 0 AND PREGSLEP_fm013_v4 eq 3 then group_stres= 3 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm013_v4 eq 1 then group_stres= 4 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm013_v4 eq 2 then group_stres= 5 ;
else if g_SCORE_STRS eq 1 AND PREGSLEP_fm013_v4 eq 3 then group_stres= 6 ;
RUN;

data indata_v4;
    set indata_v4;
if g_SCORE_DEPR_fm014_V4 = 0 AND PREGSLEP_fm013_v4 = 1 then group_depres=1;
else if g_SCORE_DEPR_fm014_V4 = 0 AND PREGSLEP_fm013_v4 = 2 then group_depres=2;
else if g_SCORE_DEPR_fm014_V4 = 0 AND PREGSLEP_fm013_v4 = 3 then group_depres= 3 ;
else if g_SCORE_DEPR_fm014_V4 = 1 AND PREGSLEP_fm013_v4 = 1 then group_depres= 4 ;
else if g_SCORE_DEPR_fm014_V4 = 1 AND PREGSLEP_fm013_v4 = 2 then group_depres= 5 ;
else if g_SCORE_DEPR_fm014_V4 = 1 AND PREGSLEP_fm013_v4 = 3 then group_depres= 6 ;
RUN;

PROC EXPORT DATA=indata_v4
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint\V4.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

	proc freq data=indata_v4;
  tables group_depres / nocum nocol norow nopercent;
run;

proc freq data=indata_v4;
  tables group_stres / nocum nocol norow nopercent;
run;


/* calculate the number in the same group at v0,1 */
PROC import OUT=indata_v0
     DATAFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint\V0.xlsx"
     DBMS=XLSX REPLACE;
    RUN;

PROC import OUT=indata_v1
     DATAFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\joint\V1.xlsx"
     DBMS=XLSX REPLACE;
    RUN;

data indata_v1;
set indata_v1;
keep ID group_depres_v1 group_stres_v1;
run;

DATA combine;
MERGE indata_v0 (IN=indata_v0) indata_v1 (IN=indata_v1);
BY ID;
IF indata_v0;
RUN;

data filtered_stress;
    set combine;
    where group_stres = group_stres_v1;
run;

proc freq data=filtered_stress;
    tables group_stres / nocum nocol norow nopercent missing;
run;

/* cross-taublation */
proc freq data=combine;
    tables group_stres * group_stres_v1 / out=cross_tabulation; 
run;


/* depress */
data filtered_depress;
    set combine;
    where group_depres = group_depres_v1;
run;

proc freq data=filtered_depress;
    tables group_depres / nocum nocol norow nopercent missing;
run;

proc freq data=combine;
    tables group_depres * group_depres_v1 / out=cross_tabulation; 
run;

