#' Helper function to load data into memory
#'
#' @param path character: Path to .parquet file
#' @param filetype character: filetype to be read
#'
#' @return data.frame
#' @export
#'
get_data <- function(path,
                     filetype = c("rds", "fst", "qs", "parquet")) {

  filetype <- match.arg(filetype)
  if (filetype == "parquet") {
  out <- arrow::read_parquet(path)
  } else if (filetype == "qs") {
    out <- qs::qread(path)
  } else if (filetype == "fst") {
    out <- fst::read_fst(path)
  } else {
    out <- readRDS(path)
  }

  return(out)
}
