provider "google" {
	project = "${var.var_project}"
}

module "appengine" {
	source = "../modules/serviceengine"
	env = "${var.var_env}"
	company = "${var.var_company}"
	var_ucl_public_subnet = "${var.uc1_public_subnet}"
	var_ucl_private_subnet = "${var.uc1_private_subnet}"
	var_ue1_public_subnet = "${var.ue1_public_subnet}"
	var_ue2_private_subnet = "${var.ue1_private_subnet}"
}

module "uc1" {
  source = "../modules/uc1"
  network_self_link = "${module.appengine.out_appengine_self_link}"
  subnetwork1 = "${module.uc1.uc1.out_public_subnet_name}"
  env = "${var.var_env}"
  company = "${var.var_company}"
  var_ucl_public_subnet = "${var.uc1_public_subnet}"
  var_ucl_private_subnet = "${var.uc1_private_subnet}"
}

module "ue1" {
  
}