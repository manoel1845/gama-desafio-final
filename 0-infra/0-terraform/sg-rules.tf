resource "aws_security_group_rule" "acessos_workers_rule_to_ssh" {
  type              = "ingress"
  description       = "Libera acessos"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.acessos_workers.id
}
resource "aws_security_group_rule" "acessos_workers_to_masters" {
  type                     = "ingress"
  description              = "Libera acessos"
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = aws_security_group.acessos_workers.id
  security_group_id        = aws_security_group.acessos_masters.id
}

resource "aws_security_group_rule" "acessos_master_rule_tcp" {
  type              = "ingress"
  description       = "Libera acessos"
  from_port         = 30000
  to_port           = 32900
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.acessos_masters.id
}
resource "aws_security_group_rule" "acessos_master_rule_to_ssh" {
  type              = "ingress"
  description       = "Libera acessos"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.acessos_masters.id
}
resource "aws_security_group_rule" "acessos_master_to_hproxy" {
  type                     = "ingress"
  description              = "Libera acessos"
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = aws_security_group.acessos_masters.id
  security_group_id        = aws_security_group.acessos_haproxy.id
}
resource "aws_security_group_rule" "acessos_master_to_master" {
  type                     = "ingress"
  description              = "Libera acessos"
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = aws_security_group.acessos_masters.id
  security_group_id        = aws_security_group.acessos_masters.id
}
resource "aws_security_group_rule" "acessos_master_to_worker" {
  type                     = "ingress"
  description              = "Libera acessos"
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = aws_security_group.acessos_masters.id
  security_group_id        = aws_security_group.acessos_workers.id
}

resource "aws_security_group_rule" "acessos_haproxy_to_master" {
  type                     = "ingress"
  description              = "Libera acessos"
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = aws_security_group.acessos_haproxy.id
  security_group_id        = aws_security_group.acessos_masters.id
}
resource "aws_security_group_rule" "acessos_haproxy_to_worker" {
  type                     = "ingress"
  description              = "Libera acessos"
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = aws_security_group.acessos_workers.id
  security_group_id        = aws_security_group.acessos_haproxy.id
}
resource "aws_security_group_rule" "acessos_workers_to_haproxy" {
  type                     = "ingress"
  description              = "Libera acessos"
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = aws_security_group.acessos_haproxy.id
  security_group_id        = aws_security_group.acessos_workers.id
}
resource "aws_security_group_rule" "acessos_haproxy_to_ssh" {
  type              = "ingress"
  description       = "Libera acessos"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.acessos_haproxy.id
}