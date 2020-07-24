################################################################
### FIO Data  from
# https://data.boston.gov/dataset/boston-police-department-fio
# Script created by AJH 7/24/2020
################################################################
library(tidyverse)
# set wd 
setwd("/Users/alyssahuberts/Dropbox/1_City/Research/Policing/fio_data")

  # read in data 
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
 
    fc <- bind_rows(fc_15, fc_16, fc_17, fc_18, fc_19, fc_19_mark)
    fc$date <- str_split_fixed(fc$contact_date, " ", n =2)[1]
    fc$time <- str_split_fixed(fc$contact_date, " ", n =2)[2]
    
    
    rm(fc_15,fc_16,fc_17, fc_18, fc_19, fc_19_mark)

    # field contact name 
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
    
    fcn <- bind_rows(fcn_15, fcn_16, fcn_17, fcn_18, fcn_19)
    rm(fcn_15, fcn_16, fcn_17, fcn_18, fcn_19)
    
    # What are the other files?
   bpd <- read_csv("boston-police-department-fio.csv")
   descr <- readxl::read_excel("fiofielddescriptions.xlsx")
   mark <- readxl::read_excel("fiokeymark43-1-1.xlsx")
   new_rms <- readxl::read_excel("fiokeynewrms.xlsx")
   
   