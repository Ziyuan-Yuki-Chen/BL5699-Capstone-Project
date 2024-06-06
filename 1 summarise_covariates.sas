/* weighted */
/* v0 */
PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\v0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table momagegroup momrace prepregbmi education childsex familyhis_dm; 
strata GDM;
weight wtpa12;
run;

/* */
proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREGSLEP_fm011 * momagegroup/chisq; 
strata GDM;
weight wtpa12;
run;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREGSLEP_fm011 * momrace/chisq; 
strata GDM;
weight wtpa12;
run;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREGSLEP_fm011 * education/chisq; 
strata GDM;
weight wtpa12;
run;

/* PA */
PROC IMPORT OUT= clinical_biomarker1
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\group1.xlsx"
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
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\group2.xlsx"
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
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\group3.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;
proc surveymeans data=clinical_biomarker3 mean median Q1 Q3;
weight wtpa12;
strata GDM;
var PA_Tot_V0;
run;

proc glm data=clinical_biomarker_v0_imputed;
  class PREGSLEP_fm011;
  model PA_Tot_v0 = PREGSLEP_fm011;
  weight wtpa12;
run;

proc surveymeans data=clinical_biomarker_v0_imputed;
  class PREGSLEP_fm011;
  var PA_Tot_v0;
  weight wtpa12;
strata GDM;
run;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREGSLEP_fm011 * childsex/ chisq; 
strata GDM;
weight wtpa12;
run;

proc surveyfreq data=clinical_biomarker_v0_imputed; 
table PREGSLEP_fm011 * familyhis_dm/ chisq; 
strata GDM;
weight wtpa12;
run;


/* v0 */

PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\v0.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v0_imputed;
  by PREGSLEP_fm011;
run;

/* age */
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 * momagegroup  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables PREGSLEP_fm011 * momagegroup / chisq;
run;

/* race */ 
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 *momrace / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 *momrace / chisq;
run;

/* education */
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 * education  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 * education  / chisq;
run;

/* prepregbmi */
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 * prepregbmi  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 * prepregbmi  / chisq;
run;

/* physcial activity */
proc means data=clinical_biomarker_v0_imputed;
  class PREGSLEP_fm011;
  var PA_Tot_v0;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v0_imputed;
  var PA_Tot_v0;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v0_imputed;
  class PREGSLEP_fm011;
  model PA_Tot_v0 = PREGSLEP_fm011;
run;

/* child sex */
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 * childsex  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 * childsex  /chisq ;
run;

/* familyhis_dm */
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 * familyhis_dm  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables  PREGSLEP_fm011 * familyhis_dm  /chisq ;
run;
/* mental health */
proc means data=clinical_biomarker_v0_imputed;
  class PREGSLEP_fm011;
  var SCORE_STRS;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v0_imputed;
  var SCORE_STRS;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v0_imputed;
  class PREGSLEP_fm011;
  model SCORE_STRS = PREGSLEP_fm011;
run;

proc means data=clinical_biomarker_v0_imputed;
  class PREGSLEP_fm011;
  var SCORE_SUPTF;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v0_imputed;
  var SCORE_SUPTF;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v0_imputed;
  class PREGSLEP_fm011;
  model SCORE_SUPTF = PREGSLEP_fm011;
run;
/* SCORE_depression */
proc means data=clinical_biomarker_v0_imputed;
  class PREGSLEP_fm011;
  var SCORE_depression;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v0_imputed;
  var SCORE_depression;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v0_imputed;
  class PREGSLEP_fm011;
  model SCORE_depression = PREGSLEP_fm011;
run;

/* v1 */
PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V1.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v1_imputed;
  by PREGSLEP_fm013_v1;
run;

/* age */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 * momagegroup  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables PREGSLEP_fm013_v1 * momagegroup / chisq;
run;

/* race */ 
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 *momrace / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 *momrace / chisq;
run;

/* education */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 * education  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 * education  / chisq;
run;

/* prepregbmi */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 * prepregbmi  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 * prepregbmi  / chisq;
run;

/* physcial activity */
proc means data=clinical_biomarker_v1_imputed;
  class PREGSLEP_fm013_v1;
  var PA_Tot_v1;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v1_imputed;
  var PA_Tot_v1;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v1_imputed;
  class PREGSLEP_fm013_v1;
  model PA_Tot_v1 = PREGSLEP_fm013_v1;
run;

/* child sex */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 * childsex  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 * childsex  /chisq ;
run;

/* familyhis_dm */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 * familyhis_dm  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 * familyhis_dm  /chisq ;
run;

/* nap */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREGSLEP_fm013_v1 * PREG_NAP_fm013_v1  /chisq ;
run;
/* mental health */
proc means data=clinical_biomarker_v1_imputed;
  class PREGSLEP_fm013_v1;
  var SCORE_STRS;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v1_imputed;
  var SCORE_STRS;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v1_imputed;
  class PREGSLEP_fm013_v1;
  model SCORE_STRS = PREGSLEP_fm013_v1;
run;

proc means data=clinical_biomarker_v1_imputed;
  class PREGSLEP_fm013_v1;
  var SCORE_SUPTF;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v1_imputed;
  var SCORE_SUPTF;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v1_imputed;
  class PREGSLEP_fm013_v1;
  model SCORE_SUPTF = PREGSLEP_fm013_v1;
run;
/* SCORE_depression */
proc means data=clinical_biomarker_v1_imputed;
  class PREGSLEP_fm013_v1;
  var SCORE_DEPR_fm014_V1;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v1_imputed;
  var SCORE_DEPR_fm014_V1;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v1_imputed;
  class PREGSLEP_fm013_v1;
  model SCORE_DEPR_fm014_V1 = PREGSLEP_fm013_v1;
run;


/* v2 */

PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V2.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v2_imputed;
  by PREGSLEP_fm013_v2;
run;

/* age */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 * momagegroup  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables PREGSLEP_fm013_v2 * momagegroup / chisq;
run;

/* race */ 
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 *momrace / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 *momrace / chisq;
run;

/* education */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 * education  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 * education  / chisq;
run;

/* prepregbmi */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 * prepregbmi  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 * prepregbmi  / chisq;
run;

/* physcial activity */
proc means data=clinical_biomarker_v2_imputed;
  class PREGSLEP_fm013_v2;
  var PA_Tot_v2;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v2_imputed;
  var PA_Tot_v2;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v2_imputed;
  class PREGSLEP_fm013_v2;
  model PA_Tot_v2 = PREGSLEP_fm013_v2;
run;

/* child sex */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 * childsex  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 * childsex  /chisq ;
run;

/* familyhis_dm */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 * familyhis_dm  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 * familyhis_dm  /chisq ;
run;

/* nap */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREGSLEP_fm013_v2 * PREG_NAP_fm013_v2  /chisq ;
run;

/* mental health */
proc means data=clinical_biomarker_v2_imputed;
  class PREGSLEP_fm013_v2;
  var SCORE_STRS;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v2_imputed;
  var SCORE_STRS;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v2_imputed;
  class PREGSLEP_fm013_v2;
  model SCORE_STRS = PREGSLEP_fm013_v2;
run;

proc means data=clinical_biomarker_v2_imputed;
  class PREGSLEP_fm013_v2;
  var SCORE_SUPTF;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v2_imputed;
  var SCORE_SUPTF;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v2_imputed;
  class PREGSLEP_fm013_v2;
  model SCORE_SUPTF = PREGSLEP_fm013_v2;
run;
/* SCORE_depression */
proc means data=clinical_biomarker_v2_imputed;
  class PREGSLEP_fm013_v2;
  var SCORE_DEPR_fm014_V2;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v2_imputed;
  var SCORE_DEPR_fm014_V2;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v2_imputed;
  class PREGSLEP_fm013_v2;
  model SCORE_DEPR_fm014_V2 = PREGSLEP_fm013_v2;
run;


/* V4 */

PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\tertile_new\V4.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v4_imputed;
  by PREGSLEP_fm013_v4;
run;

/* age */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 * momagegroup  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables PREGSLEP_fm013_v4 * momagegroup / chisq;
run;

/* race */ 
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 *momrace / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 *momrace / chisq;
run;

/* education */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 * education  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 * education  / chisq;
run;

/* prepregbmi */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 * prepregbmi  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 * prepregbmi  / chisq;
run;

/* physcial activity */
proc means data=clinical_biomarker_v4_imputed;
  class PREGSLEP_fm013_v4;
  var PA_Tot_v4;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v4_imputed;
  var PA_Tot_v4;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v4_imputed;
  class PREGSLEP_fm013_v4;
  model PA_Tot_v4 = PREGSLEP_fm013_v4;
run;

/* child sex */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 * childsex  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 * childsex  /chisq ;
run;

/* familyhis_dm */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 * familyhis_dm  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 * familyhis_dm  /chisq ;
run;

/* nap */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREGSLEP_fm013_v4 * PREG_NAP_fm013_v4  /chisq ;
run;
/* mental health */
proc means data=clinical_biomarker_v4_imputed;
  class PREGSLEP_fm013_v4;
  var SCORE_STRS;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v4_imputed;
  var SCORE_STRS;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v4_imputed;
  class PREGSLEP_fm013_v4;
  model SCORE_STRS = PREGSLEP_fm013_v4;
run;

proc means data=clinical_biomarker_v4_imputed;
  class PREGSLEP_fm013_v4;
  var SCORE_SUPTF;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v4_imputed;
  var SCORE_SUPTF;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v4_imputed;
  class PREGSLEP_fm013_v4;
  model SCORE_SUPTF = PREGSLEP_fm013_v4;
run;
/* SCORE_depression */
proc means data=clinical_biomarker_v4_imputed;
  class PREGSLEP_fm013_v4;
  var SCORE_DEPR_fm014_v4;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v4_imputed;
  var SCORE_DEPR_fm014_V4;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v4_imputed;
  class PREGSLEP_fm013_v4;
  model SCORE_DEPR_fm014_V4 = PREGSLEP_fm013_v4;
run;


