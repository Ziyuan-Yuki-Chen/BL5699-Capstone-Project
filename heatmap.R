install.packages("pheatmap")
install.packages("vegan")
install.packages("openxlsx")
install.packages("gplots")

getwd()
library(pheatmap)
library(vegan)
library(openxlsx)
library(gplots)
library(ggplot2)

# font 
install.packages("extrafont")
library(extrafont)
pdfFonts("Times New Roman")

### cross sectional #### 
dp_sleep<- read.xlsx("summary.xlsx", sheet ="cross_sectional_sleep")
dp_sleep=dp_sleep[c(1,2,4,6,8,10,12,14,16)]
rownames(dp_sleep) <-dp_sleep[,1]
dp_sleep<-dp_sleep[,-1]
dp_sleep<- as.matrix(dp_sleep)


heatmap_dp_sleep<-pheatmap(dp_sleep, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                           display_numbers = TRUE,        
                           number_color = "grey20",        
                           fontsize=10,  angle = 315,               
                           number_format = "%.3f"
)  
pdf("heatmap_dp_sleep.pdf", width = 5, height = 3, family = "Times New Roman")
print(heatmap_dp_sleep)
dev.off()


# p value < 0.05 
dp_sleep_p<- read.xlsx("summary.xlsx", sheet ="cross_sectional_sleep")
dp_sleep_p=dp_sleep_p[c(1,3,5,7,9,11,13,15,17)]
rownames(dp_sleep_p) <-dp_sleep_p[,1]
dp_sleep_p<-dp_sleep_p[,-1]
dp_sleep_p<- as.matrix(dp_sleep_p)

is.numeric(dp_sleep_p)
# convert to numeric
clean_numeric <- function(x) {
  # Remove leading and trailing spaces
  x <- trimws(x)
  # Replace non-numeric characters
  x <- gsub("[^0-9.-]", "", x)
  # Convert to numeric
  as.numeric(x)
}
dp_sleep_p <- apply(dp_sleep_p, 2, clean_numeric)
rownames(dp_sleep_p) <- row_names

is.numeric(dp_sleep_p)

display_symbols <- matrix(
  ifelse(dp_sleep_p < 0.05, "*",NA),
  nrow = nrow(dp_sleep_p),
  ncol = ncol(dp_sleep_p)
)

dp_sleep_p<-pheatmap(dp_sleep_p, cluster_row = FALSE,cluster_cols = FALSE,border_color = "black", 
                             display_numbers = display_symbols,         
                             number_color = "black",        
                             fontsize=10,  angle = 315,                   
                             number_format = "%.3f")             
pdf("dp_sleep_p.pdf", width = 4, height = 14)
print(dp_sleep_p)
dev.off()

## add * ##
# Create a dataframe
p_values <- c(0.0272, 0.9175, 0.1582, 0.1261, 0.1257, 0.6276,
              0.0876, 0.7110, 0.2987, 0.1471, 0.2930, 0.2130,
              0.9826, 0.3782, 0.1896, 0.1871, 0.1510, 0.3498,
              0.0760, 0.0580, 0.0226, 0.1107, 0.0244, 0.0755,
              0.8290, 0.0181, 0.1406, 0.1093, 0.2487, 0.3773,
              0.0272, 0.8398, 0.9732, 0.2986, 0.9600, 0.4241,
              0.3414, 0.5450, 0.1818, 0.7707, 0.1494, 0.8496,
              0.0882, 0.1154, 0.2478, 0.2955, 0.2973, 0.6230)

dp_sleep_p <- data.frame(p_value = p_values)


### cumulative #### 
dp_cumul<- read.xlsx("summary.xlsx", sheet ="cumulative")
dp_cumul=dp_cumul[c(1,2,4,6,8,10,12)]
rownames(dp_cumul) <-dp_cumul[,1]
dp_cumul<-dp_cumul[,-1]
dp_cumul<- as.matrix(dp_cumul)

heatmap_dp_cumul<-pheatmap(dp_cumul, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                           display_numbers = TRUE,        
                           number_color = "grey20",        
                           fontsize=10,  angle = 315,               
                           number_format = "%.3f")  
pdf("heatmap_dp_cumul.pdf", width = 8, height = 4, family = "Times New Roman")
print(heatmap_dp_cumul)
dev.off()

### napping #### 
napping<- read.xlsx("summary.xlsx", sheet ="napping")
napping=napping[c(1,2,4,6,8,10,12,14,16)]
rownames(napping) <-napping[,1]
napping<-napping[,-1]
napping<- as.matrix(napping)

heatmap_napping<-pheatmap(napping, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                           display_numbers = TRUE,        
                           number_color = "grey20",        
                           fontsize=10,  angle = 315,               
                           number_format = "%.3f")  
pdf("heatmap_napping.pdf", width = 8, height = 4, family = "Times New Roman")
print(heatmap_napping)
dev.off()

### joint association #### 
# v0
dp_joint_v0<- read.xlsx("summary.xlsx", sheet ="joint nap+sleep_v0")
dp_joint_v0=dp_joint_v0[c(1,2,3,4,5,6)]
rownames(dp_joint_v0) <-dp_joint_v0[,1]
dp_joint_v0<-dp_joint_v0[,-1]
dp_joint_v0<- as.matrix(dp_joint_v0)

heatmap_dp_joint_v0<-pheatmap(dp_joint_v0, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                           display_numbers = TRUE,        
                           number_color = "grey20",        
                           fontsize=10,  angle = 315,               
                           number_format = "%.3f")  
pdf("heatmap_dp_joint_v0.pdf", width = 8, height = 4, family = "Times New Roman")
print(heatmap_dp_joint_v0)
dev.off()

# v1
dp_joint_v1<- read.xlsx("summary.xlsx", sheet ="joint nap+sleep_v1")
dp_joint_v1=dp_joint_v1[c(1,2,3,4,5,6)]
rownames(dp_joint_v1) <-dp_joint_v1[,1]
dp_joint_v1<-dp_joint_v1[,-1]
dp_joint_v1<- as.matrix(dp_joint_v1)

heatmap_dp_joint_v1<-pheatmap(dp_joint_v1, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                              display_numbers = TRUE,        
                              number_color = "grey20",        
                              fontsize=10,  angle = 315,               
                              number_format = "%.3f")  
pdf("heatmap_dp_joint_v1.pdf", width = 8, height = 4, family = "Times New Roman")
print(heatmap_dp_joint_v1)
dev.off()

# v2
dp_joint_v2<- read.xlsx("summary.xlsx", sheet ="joint nap+sleep_v2")
dp_joint_v2=dp_joint_v2[c(1,2,3,4,5,6)]
rownames(dp_joint_v2) <-dp_joint_v2[,1]
dp_joint_v2<-dp_joint_v2[,-1]
dp_joint_v2<- as.matrix(dp_joint_v2)

heatmap_dp_joint_v2<-pheatmap(dp_joint_v2, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                              display_numbers = TRUE,        
                              number_color = "grey20",        
                              fontsize=10,  angle = 315,               
                              number_format = "%.3f")  
pdf("heatmap_dp_joint_v2.pdf", width = 8, height = 4, family = "Times New Roman")
print(heatmap_dp_joint_v2)
dev.off()

# v4
dp_joint_v4<- read.xlsx("summary.xlsx", sheet ="joint nap+sleep_v4")
dp_joint_v4=dp_joint_v4[c(1,2,3,4,5,6)]
rownames(dp_joint_v4) <-dp_joint_v4[,1]
dp_joint_v4<-dp_joint_v4[,-1]
dp_joint_v4<- as.matrix(dp_joint_v4)

heatmap_dp_joint_v4<-pheatmap(dp_joint_v4, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                              display_numbers = TRUE,        
                              number_color = "grey20",        
                              fontsize=10,  angle = 315,               
                              number_format = "%.3f")  
pdf("heatmap_dp_joint_v4.pdf", width = 8, height = 4, family = "Times New Roman")
print(heatmap_dp_joint_v4)
dev.off()

### depression ###
dp_depres<- read.xlsx("summary.xlsx", sheet ="depression")
dp_depres=dp_depres[c(1,2,3,4,5)]
rownames(dp_depres) <-dp_depres[,1]
dp_depres<-dp_depres[,-1]
dp_depres<- as.matrix(dp_depres)

heatmap_dp_depres<-pheatmap(dp_depres, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                            display_numbers = TRUE,        
                            number_color = "grey20",        
                            fontsize=10,  angle = 315,               
                            number_format = "%.3f")  
pdf("heatmap_dp_depres.pdf", width = 8, height = 4, family = "Times New Roman")
print(heatmap_dp_depres)
dev.off()

### stress ###
dp_stress<- read.xlsx("summary.xlsx", sheet ="stress")
dp_stress=dp_stress[c(1,2,3,4,5)]
rownames(dp_stress) <-dp_stress[,1]
dp_stress<-dp_stress[,-1]
dp_stress<- as.matrix(dp_stress)

heatmap_dp_stress<-pheatmap(dp_stress, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                            display_numbers = TRUE,        
                            number_color = "grey20",        
                            fontsize=10,  angle = 315,               
                            number_format = "%.3f")  
pdf("heatmap_dp_stress.pdf", width = 8, height = 4, family = "Times New Roman")
print(heatmap_dp_stress)
dev.off()

### diet ###
dp_diet<- read.xlsx("summary.xlsx", sheet ="diet")
dp_diet=dp_diet[c(1,2,4,6,8,10,12,14,16)]
rownames(dp_diet) <-dp_diet[,1]
dp_diet<-dp_diet[,-1]
dp_diet<- as.matrix(dp_diet)


heatmap_dp_diet<-pheatmap(dp_diet, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                          display_numbers = TRUE,        
                          number_color = "grey20",        
                          fontsize=10,  angle = 315,               
                          number_format = "%.3f")  
pdf("heatmap_dp_diet.pdf", width = 8, height = 4, family = "Times New Roman")
print(heatmap_dp_diet)
dev.off()


### BMI0 ###
dp_BMI0<- read.xlsx("summary.xlsx", sheet ="BMI0")
dp_BMI0=dp_BMI0[c(1,2,3,4,5)]
rownames(dp_BMI0) <-dp_BMI0[,1]
dp_BMI0<-dp_BMI0[,-1]
dp_BMI0<- as.matrix(dp_BMI0)
row_names <- rownames(dp_BMI0)


# convert to numeric
clean_numeric <- function(x) {
  # Remove leading and trailing spaces
  x <- trimws(x)
  # Replace non-numeric characters
  x <- gsub("[^0-9.-]", "", x)
  # Convert to numeric
  as.numeric(x)
}
dp_BMI0 <- apply(dp_BMI0, 2, clean_numeric)
rownames(dp_BMI0) <- row_names

is.numeric(dp_BMI0)

heatmap_dp_BMI0<-pheatmap(dp_BMI0, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                          display_numbers = TRUE,        
                          number_color = "grey20",        
                          fontsize=10,  angle = 315,               
                          number_format = "%.3f")  
pdf("heatmap_dp_BMI0.pdf", width = 6, height = 4, family = "Times New Roman")
print(heatmap_dp_BMI0)
dev.off()

### BMI1 ###
dp_BMI1<- read.xlsx("summary.xlsx", sheet ="BMI1")
dp_BMI1=dp_BMI1[c(1,2,3,4,5)]
rownames(dp_BMI1) <-dp_BMI1[,1]
dp_BMI1<-dp_BMI1[,-1]
dp_BMI1<- as.matrix(dp_BMI1)
is.numeric(dp_BMI1)

heatmap_dp_BMI1<-pheatmap(dp_BMI1, cluster_row = FALSE,cluster_cols = FALSE,border_color = "grey", 
                          display_numbers = TRUE,        
                          number_color = "grey20",        
                          fontsize=10,  angle = 315,               
                          number_format = "%.3f")  
pdf("heatmap_dp_BMI1.pdf", width = 6, height = 4, family = "Times New Roman")
print(heatmap_dp_BMI1)
dev.off()
