#!/bin/bash
AWS_KEY=${AWS_KEY}
AWS_SECRET=${AWS_SECRET}
BUCKET=${BUCKET}
S3FS_OPTS=${S3FS_OPS}

TARGET=${TARGET}
SOURCE=${SOURCE}

echo "${AWS_KEY}:${AWS_SECRET}" > /etc/passwd-s3fs
chmod 0600 /etc/passwd-s3fs

s3fs ${BUCKET} /s3bucket ${S3FS_OPTS}


if [ ! -z "$TARGET" ]
then
cp -r /s3bucket/* $TARGET
fi

if [ ! -z "$SOURCE" ]
then
cp -r $SOURCE /s3bucket/
fi

if [ -z "$TARGET" ] && [ -z "$SOURCE" ]
then
sleep infinity
fi
