test_that("get_levels() provides the right levels", {
  levels <- c(
    "regioner",
    "kommuner",
    "sogne",
    "retskredse",
    "afstemningsomraader",
    "politikredse",
    "landsdele",
    "storkredse",
    "postnumre",
    "opstillingskredse",
    "menighedsraadsafstemningsomraader"
  )

  expect_equal(get_levels(),
               levels)
})
