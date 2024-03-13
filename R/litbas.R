
# necessary for python module control
bsklenv <- basilisk::BasiliskEnvironment(envname="bsklenv",
    pkgname="littlebas", packages="python=3.9", pip="owlready2==0.45")

#' demo
#' @param owlfile path to owl file
#' @export
get_classes = function(owlfile) {
 proc = basilisk::basiliskStart(bsklenv)
 basilisk::basiliskRun(proc, function(owlfile) {
 o2 = reticulate::import("owlready2") # 'cached' by reticulate?
 o2$get_ontology(owlfile)$load()$classes()
 }, owlfile)
}

