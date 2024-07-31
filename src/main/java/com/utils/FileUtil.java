package com.utils;

import java.io.File;
import java.util.ResourceBundle;
import java.util.UUID;

import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

public class FileUtil {

    public static File getFolderUpload(String categoryFolder) {
        // Set resource name want to get value (application.properties).
        ResourceBundle rb = ResourceBundle.getBundle("application");
        // Get value of key [uploadDir] from file properties.
        String uploadDir = rb.getString("uploadDir") + File.separator + categoryFolder;
        File folderUpload = new File(uploadDir);
        // Check folder is exists.
        if (!folderUpload.exists()) {
            // If not exists will create new folder.
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    public static String saveFile(Part file, int categoryID) {
        try {
            // Get origin filename from request.
            String originFileName = file.getSubmittedFileName();
            // Get ext from filename -> .jpeg or png ...
            String extension = FilenameUtils.getExtension(originFileName);
            // Random a new filename with UUID.
            String outputFileName = UUID.randomUUID().toString() + "." + extension;
            // Build path saving file to local machine including category folder.
            String categoryFolder = getCategoryFolder(categoryID);
            String outputFile = FileUtil.getFolderUpload(categoryFolder).getAbsolutePath() + File.separator + outputFileName;
            // Write file.
            file.write(outputFile);
            return outputFileName;
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public static Boolean removeFile(String filename, int categoryID) {
        if (filename == null || filename.trim().length() == 0) {
            return false;
        }
        String categoryFolder = getCategoryFolder(categoryID);
        String outputFile = FileUtil.getFolderUpload(categoryFolder).getAbsolutePath() + File.separator + filename;
        File file = new File(outputFile);
        return file.delete();
    }
    
    private static String getCategoryFolder(int categoryID) {
        switch (categoryID) {
            case 1: return "jackets";
            case 2: return "polo-shirts";
            case 3: return "dress-shirts";
            case 4: return "sweaters";
            case 5: return "t-shirts";
            case 6: return "long-pants";
            case 7: return "jeans";
            case 8: return "short-pants";
            case 9: return "accessories";
            default: return "others";
        }
    }
}
