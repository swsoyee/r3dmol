callJS <- function() {
  # get the parameters from the function that have a value
  message <- Filter(function(x) !is.symbol(x), as.list(parent.frame(1)))
  session <- shiny::getDefaultReactiveDomain()

  # If a {r3dmol} widget was passed in, this is during a chain pipeline in the
  # initialization of the widget, so keep track of the desired function call
  # by adding it to a list of functions that should be performed when the widget
  # is ready
  if (methods::is(message$id, "r3dmol")) {
    widget <- message$id
    message$id <- NULL
    widget$x$api <- c(widget$x$api, list(message))
    return(widget)
  }
  # If an ID was passed, the widget already exists and we can simply call the
  # appropriate JS function
  else if (is.character(message$id)) {
    message$id <- session$ns(message$id)
    method <- paste0("r3dmol:", message$method)
    session$sendCustomMessage(method, message)
    return(message$id)
  } else {
    stop("The `id` argument must be either a r3dmol htmlwidget or an ID
         of a r3dmol htmlwidget.", call. = FALSE)
  }
}

#' (Internal Use) Cleanup Nulls
#'
#' For the given list, if any of the defined items are NULL, removes it from
#' the list so it is not passed on to the callJS() function.
#' @param list A list() object to be cleaned.
#'
#' @export
cleanup_nulls <- function(list){
  for (i in names(list)){
    if(is.null(list[[i]])) {
      list[[i]] <- NULL
    }
  }
  list
}

#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`
