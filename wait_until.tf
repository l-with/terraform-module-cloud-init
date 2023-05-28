locals {
  wait_until = {
    runcmd = !local.parts_active.wait_until ? [] : [{
      template = "${path.module}/templates/wait_until/${local.yml_runcmd}_install.tpl",
      vars     = {}
    }]
  }
}
