package com.rainbow.um.common;

import java.io.File;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class S3FileUpload {
	private static String BUCKET_NAME;
    private AmazonS3 amazonS3;
 
    public S3FileUpload() {
    }
    
    public S3FileUpload(String access_key, String secret_key, String bucket_name) {
    	this.BUCKET_NAME = bucket_name;
    	AWSCredentials awsCredentials = new BasicAWSCredentials(access_key, secret_key);
    	amazonS3 = new AmazonS3Client(awsCredentials);
    }
 
    public void uploadFile(String path, File file) {
        if (amazonS3 != null) {
            try {
                PutObjectRequest putObjectRequest =
                        new PutObjectRequest(BUCKET_NAME + "/" + path, file.getName(), file);
                putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
                amazonS3.putObject(putObjectRequest); // upload file
 
            } catch (AmazonServiceException ase) {
                ase.printStackTrace();
            } finally {
                amazonS3 = null;
            }
        }
    }
}
