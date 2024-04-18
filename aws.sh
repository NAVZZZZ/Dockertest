  aws ec2 run-instances \
  --image-id ami-051f8a213df8bc089 \
  --instance-type t2.micro \
  --key-name jenkinskey \
  --security-group-ids sg-0ac68354ff4a67ec4 \
  --count 1
