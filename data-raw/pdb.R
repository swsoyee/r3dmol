pdb_6zsl <- readLines("data-raw/6zsl.pdb")
usethis::use_data(pdb_6zsl, overwrite = TRUE)

pdb_1j72 <- readLines("data-raw/1j72.pdb")
usethis::use_data(pdb_1j72, overwrite = TRUE)

sdf_multiple <- readLines("data-raw/multiple.sdf")
usethis::use_data(sdf_multiple, overwrite = TRUE)

cif_254385 <- readLines("data-raw/254385.cif")
usethis::use_data(cif_254385, overwrite = TRUE)

xyz_multiple <- readLines("data-raw/multiple2.xyz")
usethis::use_data(xyz_multiple, overwrite = TRUE)

cube_benzene_homo <- readLines("data-raw/benzene-homo.cube")
usethis::use_data(cube_benzene_homo, overwrite = TRUE)
