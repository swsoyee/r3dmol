pdb_6zsl <- readLines("data-raw/6zsl.pdb")

usethis::use_data(pdb_6zsl, overwrite = TRUE)

pdb_1j72 <- readLines("data-raw/1j72.pdb")

usethis::use_data(pdb_1j72, overwrite = TRUE)

bohr_cube <- readLines("data-raw/bohr.cube")

usethis::use_data(bohr_cube, overwrite = TRUE)

sdf_multiple <- readLines("data-raw/multiple.sdf")

usethis::use_data(sdf_multiple, overwrite = TRUE)
