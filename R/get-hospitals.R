.get_hospitals <- function() {

  httr::GET(
    url = "https://www.myhospitals.gov.au/api/hospitals",
    httr::user_agent("hosperf 0.1 https://github.com/hrbrmstr/hosperf")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as="text", encoding="UTF-8")
  out <- jsonlite::fromJSON(out)

  cmt <- do.call(rbind.data.frame, out$communities)
  out$communities <- NULL
  out <- suppressWarnings(cbind.data.frame(out, cmt))

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}

#' Returns a data frame of all (public) hospitals with data in the MyHospitals website.
#'
#' Given the unlikely possibility of this data changing in-session, the
#' result is memoised. To save the API bandwidth/CPU.
#'
#' @references <https://www.myhospitals.gov.au/about-the-data/download-data>
#' @return data frame (tibble)
#' @export
get_hospitals <- memoise::memoise(.get_hospitals)

