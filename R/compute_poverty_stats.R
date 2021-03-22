#' Compute poverty stats for all country - year available
#'
#' @param path character: Path to data folder containing all survey data
#' (in .fst) format
#' @param max_svy numeric: The maximum number of surveys to be processed
#' @return list
#' @export
#'
compute_poverty_stats <- function(path, max_svy = NULL) {

  svy_list <- fs::dir_ls(path, regexp = "\\.fst$")
  if (!is.null(max_svy)) {
    svy_list <- svy_list[1:max_svy]
  }
  out <- lapply(svy_list, function(x) {
    df <- fst::read_fst(x)
    resp <- wbpip:::md_compute_poverty_stats(
      welfare = df[["welfare"]],
      weight  = df[["weight"]],
      povline_lcu = 20
    )
    return(resp)
  })

  return(out)
}

#' Compute poverty stats for all country - year available
#' (In parallel)
#'
#' @param path character: Path to data folder containing all survey data
#' (in .fst) format
#' @param max_svy numeric: The maximum number of surveys to be processed
#' @return list
#' @export
#'
pcompute_poverty_stats <- function(path, max_svy = NULL) {

  svy_list <- fs::dir_ls(path, regexp = "\\.fst$")
  if (!is.null(max_svy)) {
    svy_list <- svy_list[1:max_svy]
  }
  out <- furrr::future_map(svy_list, function(x) {
    df <- fst::read_fst(x)
    resp <- wbpip:::md_compute_poverty_stats(
      welfare = df[["welfare"]],
      weight  = df[["weight"]],
      povline_lcu = 20
    )
    return(resp)
  })

  return(out)
}
