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
echo ""
echo "copy from S3 Bucket: $BUCKET ..."
echo ""
cp -v -r /s3bucket/* $TARGET
echo ""
echo "copy from S3 Bucket: $BUCKET finished"
fi

if [ ! -z "$SOURCE" ]
then
echo ""
echo "copy to S3 Bucket: $BUCKET ..."
echo ""
cp -v -r $SOURCE /s3bucket/
echo ""
echo "copy tp S3 Bucket: $BUCKET finished"
fi

if [ -z "$TARGET" ] && [ -z "$SOURCE" ]
then
sleep infinity
fi
