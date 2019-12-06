package com.rainbow.um.common;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class S3FileUpload {
	private AmazonS3 amazonS3;
	private String bucket_name;
	private String access_key;
	private String secret_key;
 
    public S3FileUpload() {
    }
    
    public void makeS3() {
    	AWSCredentials awsCredentials = new BasicAWSCredentials(access_key, secret_key);
    	amazonS3 = new AmazonS3Client(awsCredentials);
    }
    
    private void normalUpload(String path, File file) {
    	PutObjectRequest putObjectRequest =
                new PutObjectRequest(bucket_name + "/" + path, file.getName(), file);
        putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
        amazonS3.putObject(putObjectRequest);
    }
 
    public void uploadFile(String path, File file) {
    	makeS3();
        try {
        	normalUpload(path, file);
        } catch (AmazonServiceException ase) {
            ase.printStackTrace();
        } finally {
            amazonS3 = null;
        }
    }
    
    public void uploadThumbnail(String path, File file, String fileType) {
    	makeS3();
    	try {
        	normalUpload(path, file);
        	Image image = ImageIO.read(file);
			int w = 180;
			int h = 600;
			Image resize = image.getScaledInstance(w, h, Image.SCALE_SMOOTH);
			BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
            Graphics g = newImage.getGraphics();
            g.drawImage(resize, 0, 0, null);
            g.dispose();
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            ImageIO.write(newImage, fileType, os);
            byte[] buffer = os.toByteArray();
            InputStream is = new ByteArrayInputStream(buffer);
            ObjectMetadata meta = new ObjectMetadata();
            meta.setContentLength(buffer.length);
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucket_name + "/ThumbnailImg", file.getName(), is, meta);
            putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
            amazonS3.putObject(putObjectRequest);
        } catch (AmazonServiceException | IOException ase) {
            ase.printStackTrace();
        } finally {
            amazonS3 = null;
        }
    }

	public void setBucket_name(String bucket_name) {
		this.bucket_name = bucket_name;
	}

	public void setAccess_key(String access_key) {
		this.access_key = access_key;
	}

	public void setSecret_key(String secret_key) {
		this.secret_key = secret_key;
	}
    
    
}
