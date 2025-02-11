/* weighted */
/* v0 */

PROC IMPORT OUT= clinical_biomarker_v0_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v0_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v0_imputed;
  by PREG_NAP_fm011;
run;

/* age */
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 * momagegroup  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables PREG_NAP_fm011 * momagegroup / chisq;
run;

/* race */ 
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 *momrace / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 *momrace / chisq;
run;

/* education */
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 * education  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 * education  / chisq;
run;

/* prepregbmi */
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 * prepregbmi  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 * prepregbmi  / chisq;
run;

/* physcial activity */
proc means data=clinical_biomarker_v0_imputed;
  class PREG_NAP_fm011;
  var PA_Tot_v0;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v0_imputed;
  var PA_Tot_v0;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v0_imputed;
  class PREG_NAP_fm011;
  model PA_Tot_v0 = PREG_NAP_fm011;
run;

/* child sex */
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 * childsex  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 * childsex  /chisq ;
run;

/* familyhis_dm */
proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 * familyhis_dm  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v0_imputed;
  tables  PREG_NAP_fm011 * familyhis_dm  /chisq ;
run;


/* v1 */
PROC IMPORT OUT= clinical_biomarker_v1_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v1_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v1_imputed;
  by PREG_NAP_fm013_v1;
run;

/* age */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 * momagegroup  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables PREG_NAP_fm013_v1 * momagegroup / chisq;
run;

/* race */ 
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 *momrace / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 *momrace / chisq;
run;

/* education */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 * education  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 * education  / chisq;
run;

/* prepregbmi */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 * prepregbmi  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 * prepregbmi  / chisq;
run;

/* physcial activity */
proc means data=clinical_biomarker_v1_imputed;
  class PREG_NAP_fm013_v1;
  var PA_Tot_v1;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v1_imputed;
  var PA_Tot_v1;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v1_imputed;
  class PREG_NAP_fm013_v1;
  model PA_Tot_v1 = PREG_NAP_fm013_v1;
run;

/* child sex */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 * childsex  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 * childsex  /chisq ;
run;

/* familyhis_dm */
proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 * familyhis_dm  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v1_imputed;
  tables  PREG_NAP_fm013_v1 * familyhis_dm  /chisq ;
run;


/* v2 */

PROC IMPORT OUT= clinical_biomarker_v2_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v2_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v2_imputed;
  by PREG_NAP_fm013_v2;
run;

/* age */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 * momagegroup  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables PREG_NAP_fm013_v2 * momagegroup / chisq;
run;

/* race */ 
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 *momrace / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 *momrace / chisq;
run;

/* education */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 * education  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 * education  / chisq;
run;

/* prepregbmi */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 * prepregbmi  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 * prepregbmi  / chisq;
run;

/* physcial activity */
proc means data=clinical_biomarker_v2_imputed;
  class PREG_NAP_fm013_v2;
  var PA_Tot_v2;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v2_imputed;
  var PA_Tot_v2;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v2_imputed;
  class PREG_NAP_fm013_v2;
  model PA_Tot_v2 = PREG_NAP_fm013_v2;
run;

/* child sex */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 * childsex  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 * childsex  /chisq ;
run;

/* familyhis_dm */
proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 * familyhis_dm  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v2_imputed;
  tables  PREG_NAP_fm013_v2 * familyhis_dm  /chisq ;
run;


/* V4 */

PROC IMPORT OUT= clinical_biomarker_v4_imputed
DATAFILE= "\\Mac\Home\Desktop\Capstone Project\data\clinical biomarkers\napping_new\v4_new.xlsx"
DBMS=xlsx REPLACE;
GETNAMES=YES;
options nodate;
RUN;

proc sort data=clinical_biomarker_v4_imputed;
  by PREG_NAP_fm013_v4;
run;

/* age */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 * momagegroup  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables PREG_NAP_fm013_v4 * momagegroup / chisq;
run;

/* race */ 
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 *momrace / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 *momrace / chisq;
run;

/* education */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 * education  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 * education  / chisq;
run;

/* prepregbmi */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 * prepregbmi  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 * prepregbmi  / chisq;
run;

/* physcial activity */
proc means data=clinical_biomarker_v4_imputed;
  class PREG_NAP_fm013_v4;
  var PA_Tot_v4;
  output out=summary_table;
run;

proc means data=clinical_biomarker_v4_imputed;
  var PA_Tot_v4;
  output out=summary_table;
run;

proc glm data=clinical_biomarker_v4_imputed;
  class PREG_NAP_fm013_v4;
  model PA_Tot_v4 = PREG_NAP_fm013_v4;
run;

/* child sex */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 * childsex  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 * childsex  /chisq ;
run;

/* familyhis_dm */
proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 * familyhis_dm  / norow nocol out=result_table;
run;

proc freq data=clinical_biomarker_v4_imputed;
  tables  PREG_NAP_fm013_v4 * familyhis_dm  /chisq ;
run;
