.get_indicators <- function() {

  httr::GET(
    url = "https://www.myhospitals.gov.au/api/indicators",
    httr::user_agent("hosperf 0.1 https://github.com/hrbrmstr/hosperf")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as="text", encoding="UTF-8")
  out <- jsonlite::fromJSON(out)

  # TODO
  #
  # annualPeriods and quarterlyPeriods are "dead" elements
  # meaning they have a list of empty lists. Not sure what you'd want
  # done with that.

  ## 'data.frame': 723 obs. of  6 variables:
  ##  $ annualPeriods   :List of 723
  ##  $ code            : chr  "1" "2" "3" "4" ...
  ##  $ indicatorName   : chr  "Median waiting time for surgery for malignant cancer" "Median waiting time for surgery for malignant cancer" "Median waiting time for surgery for malignant cancer" "Number of surgeries for malignant cancer" ...
  ##  $ name            : chr  "Breast cancer" "Bowel cancer" "Lung cancer" "Breast cancer" ...
  ##  $ quarterlyPeriods:List of 723
  ##  $ unitOfMeasure   :'data.frame': 723 obs. of  2 variables:

  cbind.data.frame(
    out[, c("code", "indicatorName", "name")],
    out$unitOfMeasure
  ) -> out

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}

#' Returns a data frame of all indicators measured within the MyHospitals website.
#'
#' Given the unlikely possibility of this data changing in-session, the
#' result is memoised. To save the API bandwidth/CPU.
#'
#' @note Not all hospitals will have a data stored for an indicator.
#' @references <https://www.myhospitals.gov.au/about-the-data/download-data>
#' @return data frame (tibble)
#' @export
get_indicators <- memoise::memoise(.get_indicators)

