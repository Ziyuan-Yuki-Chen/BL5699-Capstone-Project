/* add sleep durations to v1 */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data PREGSLEP_fm011;
set clinical_biomarker_v0_imputed;
keep ID PREGSLEP_fm011;
run; 

PROC IMPORT OUT= v1_diet
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\diet\V1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

DATA V1_new;
MERGE v1_diet (IN=a) PREGSLEP_fm011 (IN=b);
BY ID;
IF a;
RUN;

PROC EXPORT DATA=V1_new
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\v1.xlsx"
      DBMS=XLSX REPLACE;
    RUN;



/* add sleep durations to v2 */
PROC IMPORT OUT= v2_diet
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\diet\V2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data PREGSLEP_fm013_v1;
set clinical_biomarker_v1_imputed;
keep ID PREGSLEP_fm013_v1;
run; 

DATA V2_new;
MERGE v2_diet (IN=a) PREGSLEP_fm011 (IN=b)PREGSLEP_fm013_v1 (IN=c);
BY ID;
IF a;
RUN;

PROC EXPORT DATA=V2_new
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\v2.xlsx"
      DBMS=XLSX REPLACE;
    RUN;


/* add sleep durations to v4 */
PROC IMPORT OUT= v4_diet
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\diet\V4.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data PREGSLEP_fm013_v2;
set v2_diet;
keep ID PREGSLEP_fm013_v2;
run; 

DATA V4_new;
MERGE v4_diet (IN=a) PREGSLEP_fm011 (IN=b)PREGSLEP_fm013_v1 (IN=c) PREGSLEP_fm013_v2 (IN=d);
BY ID;
IF a;
RUN;

PROC EXPORT DATA=V4_new
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\v4.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

