resource "aws_iam_user" "bob" {
  name = "bob"
  path = "/system/"
  
  tags = {
    Team = "DevOps"
  }
}

resource "aws_iam_group" "sysusers" {
  name = "sysusers" 
  path = "/users/"
  
  
}
resource "aws_iam_group_membership" "team" {
  name = "sysusers-membership"

  users = [
    aws_iam_user.bob.name,
    
  ]

  group = aws_iam_group.sysusers.name
}

resource "aws_iam_policy" "policy" {
  name        = "Admins"
  path        = "/"
  description = "Admins"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF

}
  
 resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  
  groups     = [aws_iam_group.sysusers.name]
  policy_arn = aws_iam_policy.policy.arn
}
  

