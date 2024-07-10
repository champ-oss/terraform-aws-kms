moved {
  from = data.aws_caller_identity.current
  to   = data.aws_caller_identity.current[0]
}

moved {
  from = aws_kms_key.this
  to   = aws_kms_key.this[0]
}

moved {
  from = aws_kms_alias.this
  to   = aws_kms_alias.this[0]
}