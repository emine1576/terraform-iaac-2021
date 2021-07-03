resource "aws_iam_group" "sales" {
  name = "sales"
  
}


resource "aws_iam_group_membership" "team" {
  name = "sales-membership"

  users = [
    aws_iam_user.joseph.name,

  ]

  group = aws_iam_group.sales.name
}







