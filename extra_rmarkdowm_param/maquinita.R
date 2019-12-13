# Maquinita de hacer reportes

library(tidyverse)

reportes <- tibble(
  paises = c("United Kingdom", "Rwanda", "Cuba", "Norway", "Canada"),
  archivo = stringr::str_c("GDP_per_capita-", paises, ".html"),
  params = purrr::map(paises, ~ list(pais = .))
)


reportes %>% 
  select(output_file = archivo, params) %>% 
  purrr::pwalk(rmarkdown::render, input = "extra_rmarkdowm_param/GDP_per_capita_con_param.Rmd")
