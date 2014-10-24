###############################################################

#### ROSE PLOTS FOR BENCHMARK
####
####
#### Written by: A. Werner-Allen
#### Arcadia Solutions 10/24/2014

################################################################

#### This current script looks at data from:
#### BENCHMARK_DEV (database) on qdwsqldev06 (server)

################################################################

#### Packages needed:

# Connect remotely to correct ODBC (create a new one if necessary)
# install.packages("RODBC")
library(RODBC)
myconn <- odbcConnect("Benchmark_Warehouse_Dev")

# Use ggplot2 for creating nice-looking plots
# install.packages("ggplot2")
library(ggplot2)
library(vcd)
library(plyr)
library(RColorBrewer)

###################################################################
#### VITALS 

heights = sqlQuery(myconn, "select vitals_prov_id as provider, context_id as context, avg(vitals_height) as ave_height, stdev(vitals_height) as std_height, sum(case when vitals_height is NULL then 1 else 0 end) as height_null, sum(case when (cast(vitals_height as int) % 12) = 0 and vitals_height != 0 then 1 else 0 end) as mod_0, sum(case when (cast(vitals_height as int) % 12) = 1 then 1 else 0 end) as mod_1, sum(case when (cast(vitals_height as int) % 12) = 2 then 1 else 0 end) as mod_2, sum(case when (cast(vitals_height as int) % 12) = 3 then 1 else 0 end) as mod_3, sum(case when (cast(vitals_height as int) % 12) = 4 then 1 else 0 end) as mod_4, sum(case when (cast(vitals_height as int) % 12) = 5 then 1 else 0 end) as mod_5, sum(case when (cast(vitals_height as int) % 12) = 6 then 1 else 0 end) as mod_6, sum(case when (cast(vitals_height as int) % 12) = 7 then 1 else 0 end) as mod_7, sum(case when (cast(vitals_height as int) % 12) = 8 then 1 else 0 end) as mod_8, sum(case when (cast(vitals_height as int) % 12) = 9 then 1 else 0 end) as mod_9, sum(case when (cast(vitals_height as int) % 12) = 10 then 1 else 0 end) as mod_10, sum(case when (cast(vitals_height as int) % 12) = 11 then 1 else 0 end) as mod_11, count(*) as total_count from t_vitals group by vitals_prov_id, context_id")

setwd("~/Statistics/QC_Benchmark/Data")
wata = read.table("vitals_weight.txt", header=TRUE)
p = ggplot(wata, aes(x = modular, y=proportion, fill=type))+ geom_bar(breaks = seq(0,9), width = 1, colour="white", stat = "identity") +coord_polar() + scale_x_continuous(breaks=seq(0,9)) + theme_minimal()
p+facet_grid(~type)+ theme(axis.title.y = element_blank(), axis.text.y =  element_blank()) + guides(fill=FALSE) 

hata = read.table("vitals_height.txt", header=TRUE)
p = ggplot(hata, aes(x = modular, y=proportion, fill=type))+ geom_bar(breaks = seq(0,11), width = 1, colour="white", stat = "identity") +coord_polar() + scale_x_continuous(breaks=seq(0,11)) + theme_minimal()
p+facet_grid(~type)+ theme(axis.title.y = element_blank(), axis.text.y =  element_blank()) + guides(fill=FALSE) 


