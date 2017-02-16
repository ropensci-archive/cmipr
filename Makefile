all: move rmd2md

move:
		cp inst/vign/cmipr_vignette.md vignettes;\
		cp -r inst/vign/img/ vignettes/img/

rmd2md:
		cd vignettes;\
		mv cmipr_vignette.md cmipr_vignette.Rmd
