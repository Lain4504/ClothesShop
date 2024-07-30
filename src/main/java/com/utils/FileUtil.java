package com.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.UUID;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;

public class FileUtil {

    public static String saveFile(Part file, String saveDir) throws IOException {
        // Get origin filename from request.
        String originFileName = file.getSubmittedFileName();
        // Get extension from filename (e.g., .jpeg or .png).
        String extension = FilenameUtils.getExtension(originFileName);
        // Generate a new filename with UUID.
        String outputFileName = UUID.randomUUID().toString() + "." + extension;
        // Build path for saving file.
        File saveDirectory = new File(saveDir);
        if (!saveDirectory.exists()) {
            saveDirectory.mkdirs();
        }
        String outputFile = saveDir + File.separator + outputFileName;
        // Save the file.
        try (InputStream input = file.getInputStream()) {
            Files.copy(input, Path.of(outputFile), StandardCopyOption.REPLACE_EXISTING);
        }
        return outputFileName;
    }
}
