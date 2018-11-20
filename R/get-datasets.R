.get_datasets <- function(indicator_id, start_date=NULL, end_date=NULL) {

  indicator_id <- unique(indicator_id)

  params <- set_names(as.list(indicator_id), rep("indicatorId", length(indicator_id)))

  if (!is.null(start_date)) {
    if (inherits(start_date, "Date")) start_date <- as.character(start_date)
    params$startDate <- start_date
  }

  if (!is.null(end_date)) {
    if (inherits(end_date, "Date")) end_date <- as.character(end_date)
    params$endDate <- end_date
  }

  httr::GET(
    url = "https://www.myhospitals.gov.au/api/datasets",
    httr::user_agent("hosperf 0.1 https://github.com/hrbrmstr/hosperf"),
    query = params
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as="text", encoding="UTF-8")
  out <- jsonlite::fromJSON(out)

  out

}

#' Returns a custom dataset of a requested set of indicators for all available
#' hospitals over a given time frame.
#'
#' Given the unlikely possibility of this data changing in-session, the
#' result is memoised. To save the API bandwidth/CPU.
#'
#' @param indicator_id The ID of an indicator to show data for. The ID for a given
#'        indicator can be obtained from the indicators endpoint. More than one
#'        indicator ID can be specified
#' @param start_date,end_date (character or `Date` object) Specifies that only
#'        data _after_ (for start) and/or _before_ (for end) a certain point should
#'        be returned. The value can be a date of the form `YYYY`, `YYYY-MM` or
#'        `YYYY-MM-DD` (`Date` objects will be converted to the long ISO form)
#'        Where only a year is specified, the search period starts at the beginning
#'        of the year, where a year and month are specified, the search period
#'        starts at the beginning of the month. Both default to `NULL` as they
#'        are optional.
#' @references <https://www.myhospitals.gov.au/about-the-data/download-data>
#' @return list with dataset metadata and associated indicator measures
#' @export
get_datasets <- memoise::memoise(.get_datasets)

