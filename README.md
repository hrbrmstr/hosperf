
# hosperf

Tools to Query Data from the Australian Institute of Health and
Welfare’MyHospitals’ Portal

## Description

More than 1,000 public and private hospitals across Australia have
performance data available on ‘MyHospitals’
(\<www.myhospitals.gov.au/\>). Methods are provides to query indicators
for available hospitals over time.

## What’s Inside The Tin

The following functions are implemented:

  - `get_datasets`: Returns a custom dataset of a requested set of
    indicators for all available hospitals over a given time frame.
  - `get_hospitals`: Returns a data frame of all (public) hospitals with
    data in the MyHospitals website.
  - `get_indicators`: Returns a data frame of all indicators measured
    within the MyHospitals website.

NOTE: The endpoints are memoised to save the API bandwidth/CPU and due
to the low likelihood of the data changing in-analysis session.

## Installation

``` r
devtools::install_github("hrbrmstr/hosperf")
```

## Usage

``` r
library(hosperf)
library(tidyverse) # lazy since it's just for better printing

# current verison
packageVersion("hosperf")
```

    ## [1] '0.1.0'

``` r
get_hospitals()
```

    ## # A tibble: 1,418 x 14
    ##    code  description   establishmentId    id isPublic isClosed latitude  longitude name   peerGroupId state code  name 
    ##    <chr> <chr>         <chr>           <int> <lgl>    <lgl>    <chr>     <chr>     <chr>        <int> <chr> <chr> <chr>
    ##  1 12    Specialist p… 540100135          12 TRUE     FALSE    -31.9609… 115.7884… State…           0 WA    ML501 Pert…
    ##  2 13    Specialist p… 1117C1010          13 TRUE     FALSE    -33.9690… 151.2432… Justi…           0 NSW   PHN5… Pert…
    ##  3 14    Specialist c… 1116A2070          14 TRUE     FALSE    -33.8015… 150.9917… The C…           0 NSW   ML101 East…
    ##  4 15    Specialist c… 1151C2380          15 TRUE     FALSE    -33.9171… 151.2383… Sydne…           0 NSW   PHN1… Cent…
    ##  5 16    Metropolitan… 1151A2090          16 TRUE     FALSE    -33.8805… 151.2192… Sacre…           0 NSW   ML105 West…
    ##  6 17    Major hospit… 1151A2120          17 TRUE     FALSE    -33.8796… 151.2211… St Vi…           0 NSW   PHN1… West…
    ##  7 18    Metropolitan… 1152D2130          18 TRUE     FALSE    -33.8486… 151.0283… St Jo…           0 NSW   ML101 East…
    ##  8 19    Metropolitan… 1150A2010          19 TRUE     FALSE    -33.8594… 151.1814… Balma…           0 NSW   PHN1… Cent…
    ##  9 20    Medium metro… 1150A2020          20 TRUE     FALSE    -33.9195… 151.0982… Cante…           0 NSW   ML101 East…
    ## 10 21    Major hospit… 1150A2080          21 TRUE     FALSE    -33.8892… 151.1829… Royal…           0 NSW   PHN1… Cent…
    ## # ... with 1,408 more rows, and 1 more variable: communityType <chr>

``` r
get_indicators()
```

    ## # A tibble: 723 x 5
    ##    code  indicatorName                                                                 name     pluralName singularName
    ##  * <chr> <chr>                                                                         <chr>    <chr>      <chr>       
    ##  1 1     Median waiting time for surgery for malignant cancer                          Breast … days       day         
    ##  2 2     Median waiting time for surgery for malignant cancer                          Bowel c… days       day         
    ##  3 3     Median waiting time for surgery for malignant cancer                          Lung ca… days       day         
    ##  4 4     Number of surgeries for malignant cancer                                      Breast … surgeries  surgery     
    ##  5 5     Number of surgeries for malignant cancer                                      Bowel c… surgeries  surgery     
    ##  6 6     Number of surgeries for malignant cancer                                      Lung ca… surgeries  surgery     
    ##  7 7     Percentage of people who received surgery for malignant cancer within 30 days Breast … %          %           
    ##  8 8     Percentage of people who received surgery for malignant cancer within 30 days Bowel c… %          %           
    ##  9 9     Percentage of people who received surgery for malignant cancer within 30 days Lung ca… %          %           
    ## 10 10    Percentage of people who received surgery for malignant cancer within 45 days Breast … %          %           
    ## # ... with 713 more rows

``` r
glimpse(get_datasets(111, "2013-06"))
```

    ## List of 4
    ##  $ dataset   :'data.frame':  259 obs. of  2 variables:
    ##   ..$ data    :List of 259
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. ..$ :'data.frame':  4 obs. of  2 variables:
    ##   .. .. [list output truncated]
    ##   ..$ hospital: chr [1:259] "14" "15" "17" "20" ...
    ##  $ hospitals :'data.frame':  259 obs. of  6 variables:
    ##   ..$ code       : chr [1:259] "14" "15" "17" "20" ...
    ##   ..$ description: chr [1:259] "Specialist children's hospital with an emergency department" "Specialist children's hospital with an emergency department" "Major hospital with an emergency department" "Medium metropolitan hospital with an emergency department" ...
    ##   ..$ isPublic   : logi [1:259] TRUE TRUE TRUE TRUE TRUE TRUE ...
    ##   ..$ name       : chr [1:259] "The Children's Hospital at Westmead" "Sydney Children's Hospital" "St Vincents Hospital" "Canterbury Hospital" ...
    ##   ..$ peer       : logi [1:259] NA NA NA NA NA NA ...
    ##   ..$ state      : chr [1:259] "NSW" "NSW" "NSW" "NSW" ...
    ##  $ indicators:'data.frame':  4 obs. of  7 variables:
    ##   ..$ code         : chr [1:4] "111" "111" "111" "111"
    ##   ..$ enddate      : chr [1:4] "2017-06-30T00:00:00" "2016-06-30T00:00:00" "2015-06-30T00:00:00" "2014-06-30T00:00:00"
    ##   ..$ indicatorCode: chr [1:4] "7" "7" "7" "7"
    ##   ..$ indicatorName: chr [1:4] "Percentage of patients who waited longer than 365 days for elective surgery" "Percentage of patients who waited longer than 365 days for elective surgery" "Percentage of patients who waited longer than 365 days for elective surgery" "Percentage of patients who waited longer than 365 days for elective surgery"
    ##   ..$ name         : chr [1:4] "General surgery" "General surgery" "General surgery" "General surgery"
    ##   ..$ startdate    : chr [1:4] "2016-07-01T00:00:00" "2015-07-01T00:00:00" "2014-07-01T00:00:00" "2013-07-01T00:00:00"
    ##   ..$ unitOfMeasure:'data.frame':    4 obs. of  2 variables:
    ##   .. ..$ pluralName  : chr [1:4] "%" "%" "%" "%"
    ##   .. ..$ singularName: chr [1:4] "%" "%" "%" "%"
    ##  $ peers     : list()
