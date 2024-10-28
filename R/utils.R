title_collapse <- function(input, comma = TRUE) {
  if (length(input) == 1) {
    return(input)
  } else {
    paste(
      paste(input[-length(input)], collapse = ", "),
      input[length(input)],
      sep = " & "
    )
  }
}
