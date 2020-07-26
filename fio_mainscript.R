################################################################
### FIO Data  from
# https://data.boston.gov/dataset/boston-police-department-fio
# Script created by AJH 7/24/2020
################################################################
library(tidyverse)
library(lubridate)
library(sf)
library(janitor)
# set wd 
setwd("/Users/alyssahuberts/Dropbox/1_City/Research/Policing/fio_data")

  # read in data 
  #2015 "Records between June, 2015 and December, 2016 from the new record management system."
    # field contact 
    fc_15 <- read_csv("fieldcontactforpublic2015.csv",
    col_types = cols(
      fc_num = col_character(),
      contact_date = col_character(),
      contact_officer = col_character(),
      contact_officer_name = col_character(),
      supervisor = col_character(),
      supervisor_name = col_character(),
      streetaddr = col_character(),
      city = col_character(),
      state = col_character(),
      zip = col_character(),
      frisked = col_character(),
      searchperson = col_character(),
      searchvehicle = col_character(),
      summonsissued = col_character(),
      stop_duration = col_character(),
      circumstance = col_character(),
      basis = col_character(),
      vehicle_year = col_character(),
      vehicle_state = col_character(),
      vehicle_make = col_character(),
      vehicle_model = col_character(),
      vehicle_color = col_character(),
      vehicle_style = col_character(),
      vehicle_type = col_character(),
      contact_reason = col_character()
    )) %>% 
      mutate(year = 2015)
    
    # 2016
    "Records between January and December, 2016"
    fc_16 <- read_csv("fieldcontactforpublic2016.csv", col_types = cols(
        fc_num = col_character(),
        contact_date = col_character(),
        contact_officer = col_character(),
        contact_officer_name = col_character(),
        supervisor = col_character(),
        supervisor_name = col_character(),
        streetaddr = col_character(),
        city = col_character(),
        state = col_character(),
        zip = col_character(),
        frisked = col_character(),
        searchperson = col_character(),
        searchvehicle = col_character(),
        summonsissued = col_character(),
        stop_duration = col_character(),
        circumstance = col_character(),
        basis = col_character(),
        vehicle_year = col_character(),
        vehicle_state = col_character(),
        vehicle_make = col_character(),
        vehicle_model = col_character(),
        vehicle_color = col_character(),
        vehicle_style = col_character(),
        vehicle_type = col_character(),
        contact_reason = col_character()
                      ))%>% 
      mutate(year = 2016)
    
    # 2017
    #"Records between January and December, 2017"
    # note the source change here- but it looks like datasets are compatible
    fc_17 <- read_csv("rms_fieldcontacts_for_public_2017_202003111424.csv", col_types = 
           cols(
               fc_num = col_character(),
               contact_date = col_character(),
               contact_officer = col_character(),
               contact_officer_name = col_character(),
               supervisor = col_character(),
               supervisor_name = col_character(),
               street = col_character(),
               city = col_character(),
               state = col_character(),
               zip = col_character(),
               frisked = col_character(),
               searchperson = col_character(),
               searchvehicle = col_character(),
              summonsissued = col_character(),
              stop_duration = col_character(),
              circumstance = col_character(),
              basis = col_character(),
              vehicle_year = col_character(),
              vehicle_state = col_character(),
              vehicle_make = col_character(),
               vehicle_model = col_character(),
              vehicle_color = col_character(),
              vehicle_style = col_character(),
              vehicle_type = col_character(),
              contact_reason = col_character()
                        ))%>% 
      mutate(year = 2017)
    
    #fc 18 
    "Records between January and December, 2018"
    fc_18 <- read_csv("rms_fieldcontacts_for_public_2018_202003111433.csv", col_types= 
      cols(
        fc_num = col_character(),
        contact_date = col_character(),
        contact_officer = col_character(),
        contact_officer_name = col_character(),
        supervisor = col_character(),
        supervisor_name = col_character(),
        street = col_character(),
        city = col_character(),
        state = col_character(),
        zip = col_character(),
        frisked = col_character(),
        searchperson = col_character(),
        searchvehicle = col_character(),
        summonsissued = col_character(),
        stop_duration = col_character(),
        circumstance = col_character(),
        basis = col_character(),
        vehicle_year = col_character(),
        vehicle_state = col_character(),
        vehicle_make = col_character(),
        vehicle_model = col_character(),
        vehicle_color = col_character(),
        vehicle_style = col_character(),
        vehicle_type = col_character(),
        contact_reason = col_character()
      ))%>% 
      mutate(year = 2018)
     
    #2019
    #"Records between January and September 29, 2019"
    fc_19 <- read_csv("rms_fieldcontacts_for_public_2019.csv",col_types = cols(
      fc_num = col_character(),
      contact_date = col_character(),
      contact_officer = col_character(),
      contact_officer_name = col_character(),
      supervisor = col_character(),
      supervisor_name = col_character(),
      street = col_character(),
      city = col_character(),
      state = col_character(),
      zip = col_character(),
      frisked = col_character(),
      searchperson = col_character(),
      searchvehicle = col_character(),
      summonsissued = col_character(),
      stop_duration = col_character(),
      circumstance = col_character(),
      basis = col_character(),
      vehicle_year = col_character(),
      vehicle_state = col_character(),
      vehicle_make = col_character(),
      vehicle_model = col_character(),
      vehicle_color = col_character(),
      vehicle_style = col_character(),
      vehicle_type = col_character(),
      contact_reason = col_character()
    ))%>% 
      mutate(year = 2019)
      
    # mark is additional records to be merged in. it includes narrative and
    # weather but otherwise is the same
    #"Records between September, 29 and December, 2019 from the new Mark43 RMS"
    fc_19_mark <- read_csv("mark43_fieldcontacts_for_public_20192.csv", col_types =
                 cols(
                 fc_num = col_character(),
                 contact_date = col_character(),
                 contact_officer = col_character(),
                 contact_officer_name = col_character(),
                 supervisor = col_character(),
                supervisor_name = col_character(),
                 street = col_character(),
                city = col_character(),
                state = col_character(),
                 zip = col_character(),
                  stop_duration = col_character(),
                  circumstance = col_character(),
                 basis = col_character(),
                 vehicle_year = col_character(),
                 vehicle_state = col_character(),
                   vehicle_model = col_character(),
                  vehicle_color = col_character(),
                  vehicle_style = col_character(),
                  vehicle_type = col_character(),
                   key_situations = col_character(),
                   narrative = col_character(),
                   weather = col_character()
                             ))%>% 
      mutate(year = 2019)
 
    # leaving out 2015 because the data is messy/incomplete since they switched systems that year
    fc <- bind_rows( fc_16, fc_17, fc_18, fc_19, fc_19_mark)
    fc$date <- as.Date(str_split_fixed(fc$contact_date, " ", n =2)[,1])
    fc$time <- str_split_fixed(fc$contact_date, " ", n =2)[,2]

    rm(fc_15,fc_16,fc_17, fc_18, fc_19, fc_19_mark)
    
    # clean up zipcode 
    fc$zip[fc$zip == "02115-0000"] <-"02115"
    fc$zip[fc$zip == "01810-0000"] <-"01810"
    fc$zip[fc$zip == "02111-0000"] <-"02111"
    fc$zip[fc$zip == "02115-0000"] <-"02115"
    fc$zip[fc$zip == "02116-0000"] <-"02116"
    fc$zip[fc$zip == "02118-0000"] <-"02118"
    fc$zip[fc$zip == "02119-0000"] <-"02119"
    fc$zip[fc$zip == "02120-0000"] <-"02120"
    fc$zip[fc$zip == "02121-0000"] <-"02121"
    fc$zip[fc$zip == "02122-0000"] <-"02122"
    fc$zip[fc$zip == "02123-0000"] <-"02123"
    fc$zip[fc$zip == "02124-0000"] <-"02124"
    fc$zip[fc$zip == "02125-0000"] <-"02125"
    fc$zip[fc$zip == "02126-0000"] <-"02126"
    fc$zip[fc$zip == "02127-0000"] <-"02127"
    fc$zip[fc$zip == "02128-0000"] <-"02128"
    fc$zip[fc$zip == "02130-0000"] <-"02130"
    fc$zip[fc$zip == "02135-0000"] <-"02135"
    fc$zip[fc$zip == "02136-0000"] <-"02136"
    fc$zip[fc$zip == "02186-0000"] <-"02186"
    fc$zip[fc$zip == "02168-0000"] <-"02168"
    
    # clean up city 
    fc$city[(fc$city == "BSNT"|fc$city == "BST"| fc$city == "BSTN"| fc$city == "BSNTA"|fc$city == "BSTON"|fc$city == "BTSN"|fc$city == "BOSTOB")] <- "BOSTON"
    fc$city[(fc$city == "CHAARLESTOWN"|fc$city == "CHALRESTOWN"| fc$city == "CHARLESTOWN"| fc$city == "CHARLESTWON")] <- "CHARLESTOWN"
    fc$city[(fc$city == "DOR"|fc$city == "DOR."|fc$city == "DORCCHESTER"|fc$city == "DORCHEST"|fc$city == "DDORCHESTER"|fc$city == "DORCHESTERR"|fc$city == "DORCHSTER")] <- "DORCHESTER"
    fc$city[(fc$city == "E BOSTON"|fc$city == "E. BOSTON"|fc$city == "E.BOSTON"|fc$city == " EAST BOS"|fc$city == "EAST BOSTN"|fc$city == "EAST BOSTON")] <- "EAST BOSTON"
    fc$city[(fc$city == "HP")] <- "HYDE PARK"
    fc$city[(fc$city == "JAMACIA PLAIN"|fc$city == "JAMAIACA PLAIN"|fc$city == "JAMAICA"|fc$city == " JAMAICA PLAIN"|fc$city == "JAMAICIA"|fc$city == "JAMAICIA PLAIN"|fc$city == "JAMAIICA PLAIN"| fc$city == "JP")] <- "JAMAICA PLAIN"
    fc$city[(fc$city == "MATTPAN")] <- "MATTAPAN"
    fc$city[(fc$city == "ROSLINDLAE")] <- "ROSLINDALE"
    fc$city[(fc$city == "ROBURY"|fc$city == "ROX"|fc$city == "Roxbury"|fc$city == "ROXBURY MA")] <- "ROXBURY"
    fc$city[(fc$city == "S BOSTON"|fc$city == "S BSTN"|fc$city == "S. BOSTON"|fc$city == "S.BOSTON"| fc$city == "SBOS"| fc$city == "SO BOSTON"| fc$city == "SOUTH  BOSTON"| fc$city == "SO. BOSTON")] <- "SOUTH BOSTON"
    
    
    ####################
    # field contact name 
    ####################
    fcn_15 <- read_csv("fieldcontactnameforpublic2015.csv", col_types = cols(
      recnum = col_double(),
      fc_num = col_character(),
      contact_date = col_datetime(format = ""),
      sex = col_character(),
      race = col_character(),
      age = col_double(),
      build = col_character(),
      hair_style = col_character(),
      complexion = col_character(),
      ethnicity = col_character(),
      otherclothing = col_character()
    ))
    fcn_16 <- read_csv("fieldcontactnameforpublic2016.csv", 
                       col_types =
                         cols(
                           recnum = col_double(),
                           fc_num = col_character(),
                           contact_date = col_datetime(format = ""),
                           sex = col_character(),
                           race = col_character(),
                           age = col_double(),
                           build = col_character(),
                           hair_style = col_character(),
                           complexion = col_character(),
                           ethnicity = col_character(),
                           otherclothing = col_character()
                         )
                       )
    # note the source change here- but it looks like datasets are compatible
    fcn_17 <- read_csv("rms_fieldcontacts_name_for_public_2017_202003111442.csv", 
                       col_types= 
                         cols(
                           recnum = col_double(),
                           fc_num = col_character(),
                           contact_date = col_datetime(format = ""),
                           sex = col_character(),
                           race = col_character(),
                           age = col_double(),
                           build = col_character(),
                           hair_style = col_character(),
                           complexion = col_character(),
                           ethnicity = col_character(),
                           otherclothing = col_character()
                         )
                       )
    fcn_18 <- read_csv("rms_fieldcontacts_name_for_public_2018_202003111443.csv",
                       col_types = cols(
                         recnum = col_double(),
                         fc_num = col_character(),
                         contact_date = col_datetime(format = ""),
                         sex = col_character(),
                         race = col_character(),
                         age = col_double(),
                         build = col_character(),
                         hair_style = col_character(),
                         complexion = col_character(),
                         ethnicity = col_character(),
                         otherclothing = col_character()
                       ))
    fcn_19 <- read_csv("rms_fieldcontacts_name_for_public_2019.csv",
                       col_types = 
                         cols(
                           recnum = col_double(),
                           fc_num = col_character(),
                           contact_date = col_datetime(format = ""),
                           sex = col_character(),
                           race = col_character(),
                           age = col_double(),
                           build = col_character(),
                           hair_style = col_character(),
                           complexion = col_character(),
                           ethnicity = col_character(),
                           otherclothing = col_character()
                         ) )
    
    fcn_19_mark <- read_csv("mark43_fieldcontacts_name_for_public_2019.csv", col_types = 
                              cols(
                                fc_num = col_character(),
                                contact_date = col_datetime(format = ""),
                                sex = col_character(),
                                race = col_character(),
                                age = col_double(),
                                build = col_character(),
                                hair_style = col_character(),
                                skin_tone = col_character(),
                                ethnicity = col_character(),
                                otherclothing = col_character(),
                                deceased = col_double(),
                                license_state = col_character(),
                                license_type = col_character(),
                                `frisk/search` = col_character()
                              ))
    # leaving out 2015 since data is incomplete/messy since BPD switched systems that year
    fcn <- bind_rows( fcn_16, fcn_17, fcn_18, fcn_19, fcn_19_mark)
    rm(fcn_15, fcn_16, fcn_17, fcn_18, fcn_19,fcn_19_mark)
    
    # clean date
    fcn$date <- as.Date(str_split_fixed(fcn$contact_date, " ", n =2)[,1])
    fcn$time <- str_split_fixed(fcn$contact_date, " ", n =2)[,2]
    
    # What are the other files?
    # old rms 
   old_rms <- read_csv("boston-police-department-fio.csv")
   old_rms$date <- str_split_fixed(bpd$FIO_DATE," ", 2 )[,1]
   # these three contain field names 
   descr <- readxl::read_excel("fiofielddescriptions.xlsx")
   mark <- readxl::read_excel("fiokeymark43-1-1.xlsx")
   new_rms <- readxl::read_excel("fiokeynewrms.xlsx")
   
   
####################################
   # Basic summary stats
####################################
  min(fc$date, na.rm = TRUE)
  max(fc$date, na.rm= TRUE)
  
  min(fcn$date, na.rm = TRUE)
  max(fcn$date, na.rm= TRUE)
  
  
   
    # read in MA zip codes 
   zipcodes <- st_read("zipcodes_nt/ZIPCODES_NT_POLY.shp") %>% clean_names()
   zipcodes <- zipcodes %>% mutate(zip = as.character(postcode))
   zipcodes <- zipcodes %>% filter(zip %in% fc$zip)
   
   totals_19 <- fc %>% group_by(year, zip) %>% tally() %>% 
     filter(year== 2019)
   
   zipcodes_19 <- left_join(zipcodes, totals_19, by = "zip")
   zipcodes_19$n <- ifelse(is.na(zipcodes_19$n), 0, zipcodes_19$n)

     ggplot(zipcodes_19)+ geom_sf(aes(fill =n))
   
   fc %>% group_by(year, zip) %>% 
     tally() %>% 
     ggplot()+ 
     geom_point(aes(x = year, y = n, group = zip, color = zip)) +theme_classic()
   
   
   