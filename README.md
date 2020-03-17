<!-- badges: start -->
  [![Travis build status](https://travis-ci.org/aubreyanxy/stat302package.svg?branch=master)](https://travis-ci.com/aubreyanxy/stat302package)
  [![Codecov test coverage](https://codecov.io/gh/aubreyanxy/stat302package/branch/master/graph/badge.svg)](https://codecov.io/gh/aubreyanxy/stat302package?branch=master)
  <!-- badges: end -->

## Installation

To download the stat302package package, use the code below.

``` r
# install.packages("devtools")
devtools::install_github("aubreyanxy/stat302package")
library(stat302package)
```

## Use

The vignette demonstrates example usage of all main functions. Please [file an issue](https://github.com/aubreyanxy/stat302package/issues) if you have a request for a tutorial that is not currently included. You can see the vignette by using the following code (note that this requires a TeX installation to view properly):


``` r
# install.packages("devtools")
devtools::install_github("aubreyanxy/stat302package", build_vignette = TRUE, build_opts = c())
library(stat302package)
# Use this to view the vignette in the corncob HTML help
help(package = "stat302package", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "stat302package")
```

Note that R does not allow variable names to start with numbers. Sometimes, when going directly from QIIME2 to phyloseq objects, taxa names will be a large string starting with numbers. To clean these taxa names for use with corncob, use  `clean_taxa_names(my_phyloseq_object)`, see `?clean_taxa_names` for details.

## Status

The preprint describing the corncob methodology is available [here](https://arxiv.org/abs/1902.02776). The manuscript has been accepted to appear in *Annals of Applied Statistics*.

## Bug Reports / Change Requests

If you encounter a bug or would like make a change request, please file it as an issue [here](https://github.com/aubreyanxy/stat302package/issues).
