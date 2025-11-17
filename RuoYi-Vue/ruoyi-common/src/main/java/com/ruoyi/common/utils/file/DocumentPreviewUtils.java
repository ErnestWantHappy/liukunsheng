package com.ruoyi.common.utils.file;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.utils.StringUtils;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import fr.opensagres.poi.xwpf.converter.pdf.PdfConverter;
import fr.opensagres.poi.xwpf.converter.pdf.PdfOptions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * 文档预览工具，负责将可转换的文件转为 PDF
 */
public class DocumentPreviewUtils {

    private static final Logger log = LoggerFactory.getLogger(DocumentPreviewUtils.class);

    private static final String PROFILE_PREFIX = "/profile";

    private DocumentPreviewUtils() {
    }

    /**
     * 判断是否支持转换
     */
    public static boolean supportConvert(String extension) {
        if (StringUtils.isBlank(extension)) {
            return false;
        }
        String ext = extension.toLowerCase();
        return "docx".equals(ext);
    }

    /**
     * 将指定相对路径的文档转换成 PDF，返回新的相对路径（带 /profile 前缀）
     */
    public static String convertToPdf(String relativePath) {
        if (StringUtils.isBlank(relativePath)) {
            return null;
        }
        try {
            File inputFile = resolvePhysicalFile(relativePath);
            if (inputFile == null || !inputFile.exists()) {
                return null;
            }
            String pdfRelative = buildPreviewRelativePath(relativePath);
            File outputFile = resolvePhysicalFile(pdfRelative);
            if (outputFile == null) {
                return null;
            }
            File parent = outputFile.getParentFile();
            if (parent != null && !parent.exists()) {
                parent.mkdirs();
            }
            try (InputStream inputStream = new FileInputStream(inputFile);
                 OutputStream outputStream = new FileOutputStream(outputFile)) {
                XWPFDocument document = new XWPFDocument(inputStream);
                PdfOptions options = PdfOptions.create();
                PdfConverter.getInstance().convert(document, outputStream, options);
            }
            return pdfRelative;
        } catch (Exception e) {
            log.error("文档转PDF失败，path={}", relativePath, e);
            return null;
        }
    }

    private static File resolvePhysicalFile(String relativePath) {
        String cleanPath = relativePath.replace("\\", "/");
        String profile = RuoYiConfig.getProfile();
        if (cleanPath.startsWith(PROFILE_PREFIX)) {
            cleanPath = cleanPath.substring(PROFILE_PREFIX.length());
        }
        if (cleanPath.startsWith("/")) {
            cleanPath = cleanPath.substring(1);
        }
        return new File(profile, cleanPath);
    }

    private static String buildPreviewRelativePath(String relativePath) {
        String cleanPath = relativePath.replace("\\", "/");
        int dotIndex = cleanPath.lastIndexOf('.');
        String prefix = dotIndex > 0 ? cleanPath.substring(0, dotIndex) : cleanPath;
        return prefix + "_preview.pdf";
    }
}
