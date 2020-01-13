data "template_file" "lambda-policy-template" {
  template = "${file("iam/lambda-policy.json")}"
  vars = {
    bucket_name = "${var.bucket_name}"
  }
}

# Use policy = template file rather than file to ensure variables from json are rendered properly
# in the cloud
resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = "${aws_iam_role.lambda_role.id}"

  policy = "${data.template_file.lambda-policy-template.rendered}"                    //
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = "${file("iam/lambda-assume-policy.json")}"
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for  from a lambda function"

  policy = "${file("iam/logging-policy.json")}"
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = "${aws_iam_role.lambda_role.id}"
  policy_arn = "${aws_iam_policy.lambda_logging.arn}"
}