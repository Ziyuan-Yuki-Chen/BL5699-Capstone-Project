/* add nap to v1 */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data PREG_NAP_fm011;
set clinical_biomarker_v0_imputed;
keep ID PREG_NAP_fm011;
run; 

PROC IMPORT OUT= v1_diet
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\diet\V1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

DATA V1_new;
MERGE v1_diet (IN=a) PREG_NAP_fm011 (IN=b);
BY ID;
IF a;
RUN;

PROC EXPORT DATA=V1_new
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\v1_nap.xlsx"
      DBMS=XLSX REPLACE;
    RUN;

/* add nap to v2 */
PROC IMPORT OUT= v2_diet
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\diet\V2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\V1_nap.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data PREG_NAP_fm013_v1;
set clinical_biomarker_v1_imputed;
keep ID PREG_NAP_fm011 PREG_NAP_fm013_v1;
run; 

DATA V2_new;
MERGE v2_diet (IN=a)PREG_NAP_fm013_v1 (IN=b);
BY ID;
IF a;
RUN;

PROC EXPORT DATA=V2_new
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\v2_nap.xlsx"
      DBMS=XLSX REPLACE;
    RUN;


/* add sleep durations to v4 */
PROC IMPORT OUT= v4_diet
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\diet\V4.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

data PREGNAP_fm013_v2;
set v2_new;
keep ID PREG_NAP_fm013_v2 PREG_NAP_fm013_v1 PREG_NAP_fm011;
run; 

DATA V4_new;
MERGE v4_diet (IN=a)  PREGNAP_fm013_v2 (IN=b);
BY ID;
IF a;
RUN;

PROC EXPORT DATA=V4_new
      OUTFILE="\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\longitudinal\v4_nap.xlsx"
      DBMS=XLSX REPLACE;
    RUN;




