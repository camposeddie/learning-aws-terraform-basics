provider "aws" {
  version = "~> 2.43"
  region  = "${var.region_name}"
}

resource "aws_s3_bucket" "Eddie_Tutorial" {
  bucket = "${var.bucket_name}"
  acl    = "private"

  tags = {
    Name        = "Eddie Tutorial S3 Bucket"
    Environment = "DevE"
  }
}

# Use policy = template file rather than file to ensure variables from json are rendered properly
# in the cloud
data "template_file" "bucket-policy-s3" {
  template = "${file("bucket_policy.json")}"
  vars = {
    lamda_role_arn = "${var.lamda_role_arn}"
    bucket_name = "${var.bucket_name}"
  }
}

resource "aws_s3_bucket_policy" "eddie-tutorial-bucket-policy" {
  bucket = "${aws_s3_bucket.Eddie_Tutorial.id}"
  policy = "${data.template_file.bucket-policy-s3.rendered}"
}