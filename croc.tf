locals {
  croc = !var.croc ? {} : {
    runcmd = [{
      template = "${path.module}/templates/croc/${local.yml_runcmd}.tpl",
      vars     = {}
    }]
  }
}
