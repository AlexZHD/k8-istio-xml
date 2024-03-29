locals = {
  cluster_name                 = "staging.zdevops.xyz"
  master_autoscaling_group_ids = ["${aws_autoscaling_group.master-us-west-2a-masters-staging-zdevops-xyz.id}", "${aws_autoscaling_group.master-us-west-2b-masters-staging-zdevops-xyz.id}", "${aws_autoscaling_group.master-us-west-2c-masters-staging-zdevops-xyz.id}"]
  master_security_group_ids    = ["${aws_security_group.masters-staging-zdevops-xyz.id}"]
  masters_role_arn             = "${aws_iam_role.masters-staging-zdevops-xyz.arn}"
  masters_role_name            = "${aws_iam_role.masters-staging-zdevops-xyz.name}"
  node_autoscaling_group_ids   = ["${aws_autoscaling_group.nodes-staging-zdevops-xyz.id}"]
  node_security_group_ids      = ["${aws_security_group.nodes-staging-zdevops-xyz.id}"]
  node_subnet_ids              = ["subnet-02a8542054e44e439", "subnet-08407fd429cfd4812", "subnet-0fc1c64408b447fe9"]
  nodes_role_arn               = "${aws_iam_role.nodes-staging-zdevops-xyz.arn}"
  nodes_role_name              = "${aws_iam_role.nodes-staging-zdevops-xyz.name}"
  region                       = "us-west-2"
  subnet_ids                   = ["subnet-0127fb2a128f7bc46", "subnet-02a8542054e44e439", "subnet-08407fd429cfd4812", "subnet-09dd316a1ed98ce53", "subnet-0a97cd2c1288b4e16", "subnet-0fc1c64408b447fe9"]
  subnet_us-west-2a_id         = "subnet-08407fd429cfd4812"
  subnet_us-west-2b_id         = "subnet-02a8542054e44e439"
  subnet_us-west-2c_id         = "subnet-0fc1c64408b447fe9"
  subnet_utility-us-west-2a_id = "subnet-0127fb2a128f7bc46"
  subnet_utility-us-west-2b_id = "subnet-0a97cd2c1288b4e16"
  subnet_utility-us-west-2c_id = "subnet-09dd316a1ed98ce53"
  vpc_id                       = "vpc-0b5f525f280a4747c"
}

# output "cluster_name" {
#   value = "staging.zdevops.xyz"
# }

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-us-west-2a-masters-staging-zdevops-xyz.id}", "${aws_autoscaling_group.master-us-west-2b-masters-staging-zdevops-xyz.id}", "${aws_autoscaling_group.master-us-west-2c-masters-staging-zdevops-xyz.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-staging-zdevops-xyz.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-staging-zdevops-xyz.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-staging-zdevops-xyz.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-staging-zdevops-xyz.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-staging-zdevops-xyz.id}"]
}

output "node_subnet_ids" {
  value = ["subnet-02a8542054e44e439", "subnet-08407fd429cfd4812", "subnet-0fc1c64408b447fe9"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-staging-zdevops-xyz.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-staging-zdevops-xyz.name}"
}

output "region" {
  value = "us-west-2"
}

output "subnet_ids" {
  value = ["subnet-0127fb2a128f7bc46", "subnet-02a8542054e44e439", "subnet-08407fd429cfd4812", "subnet-09dd316a1ed98ce53", "subnet-0a97cd2c1288b4e16", "subnet-0fc1c64408b447fe9"]
}

output "subnet_us-west-2a_id" {
  value = "subnet-08407fd429cfd4812"
}

output "subnet_us-west-2b_id" {
  value = "subnet-02a8542054e44e439"
}

output "subnet_us-west-2c_id" {
  value = "subnet-0fc1c64408b447fe9"
}

output "subnet_utility-us-west-2a_id" {
  value = "subnet-0127fb2a128f7bc46"
}

output "subnet_utility-us-west-2b_id" {
  value = "subnet-0a97cd2c1288b4e16"
}

output "subnet_utility-us-west-2c_id" {
  value = "subnet-09dd316a1ed98ce53"
}

# output "vpc_id" {
#   value = "vpc-0b5f525f280a4747c"
# }

provider "aws" {
  region = "us-west-2"
}

resource "aws_autoscaling_attachment" "master-us-west-2a-masters-staging-zdevops-xyz" {
  elb                    = "${aws_elb.api-staging-zdevops-xyz.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2a-masters-staging-zdevops-xyz.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2b-masters-staging-zdevops-xyz" {
  elb                    = "${aws_elb.api-staging-zdevops-xyz.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2b-masters-staging-zdevops-xyz.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2c-masters-staging-zdevops-xyz" {
  elb                    = "${aws_elb.api-staging-zdevops-xyz.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2c-masters-staging-zdevops-xyz.id}"
}

resource "aws_autoscaling_group" "master-us-west-2a-masters-staging-zdevops-xyz" {
  name                 = "master-us-west-2a.masters.staging.zdevops.xyz"
  launch_configuration = "${aws_launch_configuration.master-us-west-2a-masters-staging-zdevops-xyz.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-08407fd429cfd4812"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "staging.zdevops.xyz"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2a.masters.staging.zdevops.xyz"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2a"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2b-masters-staging-zdevops-xyz" {
  name                 = "master-us-west-2b.masters.staging.zdevops.xyz"
  launch_configuration = "${aws_launch_configuration.master-us-west-2b-masters-staging-zdevops-xyz.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-02a8542054e44e439"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "staging.zdevops.xyz"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2b.masters.staging.zdevops.xyz"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2c-masters-staging-zdevops-xyz" {
  name                 = "master-us-west-2c.masters.staging.zdevops.xyz"
  launch_configuration = "${aws_launch_configuration.master-us-west-2c-masters-staging-zdevops-xyz.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["subnet-0fc1c64408b447fe9"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "staging.zdevops.xyz"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2c.masters.staging.zdevops.xyz"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2c"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "nodes-staging-zdevops-xyz" {
  name                 = "nodes.staging.zdevops.xyz"
  launch_configuration = "${aws_launch_configuration.nodes-staging-zdevops-xyz.id}"
  max_size             = 2
  min_size             = 2
  vpc_zone_identifier  = ["subnet-08407fd429cfd4812", "subnet-02a8542054e44e439", "subnet-0fc1c64408b447fe9"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "staging.zdevops.xyz"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.staging.zdevops.xyz"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_ebs_volume" "a-etcd-events-staging-zdevops-xyz" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "staging.zdevops.xyz"
    Name                                        = "a.etcd-events.staging.zdevops.xyz"
    "k8s.io/etcd/events"                        = "a/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/staging.zdevops.xyz" = "owned"
  }
}

resource "aws_ebs_volume" "a-etcd-main-staging-zdevops-xyz" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "staging.zdevops.xyz"
    Name                                        = "a.etcd-main.staging.zdevops.xyz"
    "k8s.io/etcd/main"                          = "a/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/staging.zdevops.xyz" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-events-staging-zdevops-xyz" {
  availability_zone = "us-west-2b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "staging.zdevops.xyz"
    Name                                        = "b.etcd-events.staging.zdevops.xyz"
    "k8s.io/etcd/events"                        = "b/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/staging.zdevops.xyz" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-staging-zdevops-xyz" {
  availability_zone = "us-west-2b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "staging.zdevops.xyz"
    Name                                        = "b.etcd-main.staging.zdevops.xyz"
    "k8s.io/etcd/main"                          = "b/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/staging.zdevops.xyz" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-events-staging-zdevops-xyz" {
  availability_zone = "us-west-2c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "staging.zdevops.xyz"
    Name                                        = "c.etcd-events.staging.zdevops.xyz"
    "k8s.io/etcd/events"                        = "c/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/staging.zdevops.xyz" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-main-staging-zdevops-xyz" {
  availability_zone = "us-west-2c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "staging.zdevops.xyz"
    Name                                        = "c.etcd-main.staging.zdevops.xyz"
    "k8s.io/etcd/main"                          = "c/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/staging.zdevops.xyz" = "owned"
  }
}

resource "aws_elb" "api-staging-zdevops-xyz" {
  name = "api-staging-zdevops-xyz-4297ql"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-staging-zdevops-xyz.id}"]
  subnets         = ["subnet-0127fb2a128f7bc46", "subnet-09dd316a1ed98ce53", "subnet-0a97cd2c1288b4e16"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "staging.zdevops.xyz"
    Name              = "api.staging.zdevops.xyz"
  }
}

resource "aws_iam_instance_profile" "masters-staging-zdevops-xyz" {
  name = "masters.staging.zdevops.xyz"
  role = "${aws_iam_role.masters-staging-zdevops-xyz.name}"
}

resource "aws_iam_instance_profile" "nodes-staging-zdevops-xyz" {
  name = "nodes.staging.zdevops.xyz"
  role = "${aws_iam_role.nodes-staging-zdevops-xyz.name}"
}

resource "aws_iam_role" "masters-staging-zdevops-xyz" {
  name               = "masters.staging.zdevops.xyz"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.staging.zdevops.xyz_policy")}"
}

resource "aws_iam_role" "nodes-staging-zdevops-xyz" {
  name               = "nodes.staging.zdevops.xyz"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.staging.zdevops.xyz_policy")}"
}

resource "aws_iam_role_policy" "masters-staging-zdevops-xyz" {
  name   = "masters.staging.zdevops.xyz"
  role   = "${aws_iam_role.masters-staging-zdevops-xyz.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.staging.zdevops.xyz_policy")}"
}

resource "aws_iam_role_policy" "nodes-staging-zdevops-xyz" {
  name   = "nodes.staging.zdevops.xyz"
  role   = "${aws_iam_role.nodes-staging-zdevops-xyz.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.staging.zdevops.xyz_policy")}"
}

resource "aws_key_pair" "kubernetes-staging-zdevops-xyz-738cb82db14d2546c16f573a8d2bd70e" {
  key_name   = "kubernetes.staging.zdevops.xyz-73:8c:b8:2d:b1:4d:25:46:c1:6f:57:3a:8d:2b:d7:0e"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.staging.zdevops.xyz-738cb82db14d2546c16f573a8d2bd70e_public_key")}"
}

resource "aws_launch_configuration" "master-us-west-2a-masters-staging-zdevops-xyz" {
  name_prefix                 = "master-us-west-2a.masters.staging.zdevops.xyz-"
  image_id                    = "ami-0008325f0ded04d04"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-staging-zdevops-xyz-738cb82db14d2546c16f573a8d2bd70e.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-staging-zdevops-xyz.id}"
  security_groups             = ["${aws_security_group.masters-staging-zdevops-xyz.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2a.masters.staging.zdevops.xyz_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2b-masters-staging-zdevops-xyz" {
  name_prefix                 = "master-us-west-2b.masters.staging.zdevops.xyz-"
  image_id                    = "ami-0008325f0ded04d04"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-staging-zdevops-xyz-738cb82db14d2546c16f573a8d2bd70e.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-staging-zdevops-xyz.id}"
  security_groups             = ["${aws_security_group.masters-staging-zdevops-xyz.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2b.masters.staging.zdevops.xyz_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2c-masters-staging-zdevops-xyz" {
  name_prefix                 = "master-us-west-2c.masters.staging.zdevops.xyz-"
  image_id                    = "ami-0008325f0ded04d04"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-staging-zdevops-xyz-738cb82db14d2546c16f573a8d2bd70e.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-staging-zdevops-xyz.id}"
  security_groups             = ["${aws_security_group.masters-staging-zdevops-xyz.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2c.masters.staging.zdevops.xyz_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-staging-zdevops-xyz" {
  name_prefix                 = "nodes.staging.zdevops.xyz-"
  image_id                    = "ami-0008325f0ded04d04"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-staging-zdevops-xyz-738cb82db14d2546c16f573a8d2bd70e.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-staging-zdevops-xyz.id}"
  security_groups             = ["${aws_security_group.nodes-staging-zdevops-xyz.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.staging.zdevops.xyz_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_route53_record" "api-staging-zdevops-xyz" {
  name = "api.staging.zdevops.xyz"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-staging-zdevops-xyz.dns_name}"
    zone_id                = "${aws_elb.api-staging-zdevops-xyz.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z1JZYP536QD3PI"
}

resource "aws_security_group" "api-elb-staging-zdevops-xyz" {
  name        = "api-elb.staging.zdevops.xyz"
  vpc_id      = "vpc-0b5f525f280a4747c"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                           = "staging.zdevops.xyz"
    Name                                        = "api-elb.staging.zdevops.xyz"
    "kubernetes.io/cluster/staging.zdevops.xyz" = "owned"
  }
}

resource "aws_security_group" "masters-staging-zdevops-xyz" {
  name        = "masters.staging.zdevops.xyz"
  vpc_id      = "vpc-0b5f525f280a4747c"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                           = "staging.zdevops.xyz"
    Name                                        = "masters.staging.zdevops.xyz"
    "kubernetes.io/cluster/staging.zdevops.xyz" = "owned"
  }
}

resource "aws_security_group" "nodes-staging-zdevops-xyz" {
  name        = "nodes.staging.zdevops.xyz"
  vpc_id      = "vpc-0b5f525f280a4747c"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                           = "staging.zdevops.xyz"
    Name                                        = "nodes.staging.zdevops.xyz"
    "kubernetes.io/cluster/staging.zdevops.xyz" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  source_security_group_id = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-staging-zdevops-xyz.id}"
  source_security_group_id = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-staging-zdevops-xyz.id}"
  source_security_group_id = "${aws_security_group.nodes-staging-zdevops-xyz.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-staging-zdevops-xyz.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-staging-zdevops-xyz.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  source_security_group_id = "${aws_security_group.api-elb-staging-zdevops-xyz.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-staging-zdevops-xyz.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-protocol-ipip" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  source_security_group_id = "${aws_security_group.nodes-staging-zdevops-xyz.id}"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "4"
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  source_security_group_id = "${aws_security_group.nodes-staging-zdevops-xyz.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4001" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  source_security_group_id = "${aws_security_group.nodes-staging-zdevops-xyz.id}"
  from_port                = 2382
  to_port                  = 4001
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  source_security_group_id = "${aws_security_group.nodes-staging-zdevops-xyz.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  source_security_group_id = "${aws_security_group.nodes-staging-zdevops-xyz.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-staging-zdevops-xyz.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.nodes-staging-zdevops-xyz.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

terraform = {
  required_version = ">= 0.9.3"
}
