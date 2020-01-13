data "archive_file" "renameFile" {
  type        = "zip"
  source_dir  = "inputs/"
  output_path = "${var.lambda_zip_location}"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "${var.lambda_zip_location}"
  function_name = "renameFile"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "renameFile.handler"

  source_code_hash = "${filebase64sha256(var.lambda_zip_location)}"
  runtime          = "nodejs12.x"

  environment {
    variables = {
      bucket_name = "${var.bucket_name}"
    }
  }

}
