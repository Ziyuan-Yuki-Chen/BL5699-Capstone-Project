/* table */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREG_NAP_fm011 * momagegroup/chisq; 
strata GDM;
weight wtpa12;
run;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREG_NAP_fm011 * momrace/chisq; 
strata GDM;
weight wtpa12;
run;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREG_NAP_fm011 * education/chisq; 
strata GDM;
weight wtpa12;
run;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREG_NAP_fm011 * prepregbmi/chisq; 
strata GDM;
weight wtpa12;
run;

/* PA */
PROC IMPORT OUT= clinical_biomarker1
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\group1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;
proc surveymeans data=clinical_biomarker1 mean median Q1 Q3;
weight wtpa12;
strata GDM;
var PA_Tot_V0;
run;

PROC IMPORT OUT= clinical_biomarker2
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\group2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;
proc surveymeans data=clinical_biomarker2 mean median Q1 Q3;
weight wtpa12;
strata GDM;
var PA_Tot_V0;
run;

PROC IMPORT OUT= clinical_biomarker3
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\group3.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;
proc surveymeans data=clinical_biomarker3 mean median Q1 Q3;
weight wtpa12;
strata GDM;
var PA_Tot_V0;
run;

proc surveymeans data=clinical_biomarker_v0_imputed;
  class PREG_NAP_fm011;
  var PA_Tot_v0;
  weight wtpa12;
strata GDM;
run;

proc glm data=clinical_biomarker_v0_imputed;
  class PREG_NAP_fm011;
  model PA_Tot_v0 = PREG_NAP_fm011;
  weight wtpa12;
run;


proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREG_NAP_fm011 * childsex/ chisq; 
strata GDM;
weight wtpa12;
run;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREG_NAP_fm011 * familyhis_dm/ chisq; 
strata GDM;
weight wtpa12;
run;






/* v0 */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v0_imputed;
  by PREGSLEP_fm011;
run;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREGSLEP_fm011 * PREG_NAP_fm011/chisq; 
strata GDM;
weight wtpa12;
run;


/* v1 */
PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v1_imputed;
  by PREGSLEP_fm013_v1;
run;

proc surveyfreq data=clinical_biomarker_v1_imputed; 
table PREGSLEP_fm013_v1 * PREG_NAP_fm013_V1/chisq; 
strata GDM;
weight wtpa12;
run;



/* v2 */
PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v2_imputed;
  by PREGSLEP_fm013_v2;
run;

proc surveyfreq data=clinical_biomarker_v2_imputed; 
table PREGSLEP_fm013_v2 * PREG_NAP_fm013_V2/chisq; 
strata GDM;
weight wtpa34;
run;


/* v4 */
PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v4.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v4_imputed;
  by PREGSLEP_fm013_v4;
run;

proc surveyfreq data=clinical_biomarker_v4_imputed; 
table PREGSLEP_fm013_v4 * PREG_NAP_fm013_V4/chisq; 
strata GDM;
weight wtpa34;
run;



/* napping frequency */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREG_NAP_fm011/chisq; 
strata GDM;
weight wtpa12;
run;

PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc surveyfreq data=clinical_biomarker_v1_imputed; 
table PREG_NAP_fm013_v1/chisq; 
strata GDM;
weight wtpa12;
run;


PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc surveyfreq data=clinical_biomarker_v2_imputed; 
table PREG_NAP_fm013_v2/chisq; 
strata GDM;
weight wtpa34;
run;

PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping\v4.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc surveyfreq data=clinical_biomarker_v4_imputed; 
table PREG_NAP_fm013_v4/chisq; 
strata GDM;
weight wtpa34;
run;
