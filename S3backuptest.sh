#!/bin/bash
#compress file
tar -czvf test.tar.gz test.txt
#upload to s3
aws s3 cp test.tar.gz s3://awsclilab 
