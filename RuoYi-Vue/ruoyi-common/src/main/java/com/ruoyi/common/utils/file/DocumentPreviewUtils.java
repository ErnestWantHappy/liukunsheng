package com.ruoyi.common.utils.file;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.jodconverter.core.DocumentConverter;

import java.io.File;

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
        return "doc".equals(ext) || "docx".equals(ext);
    }

    /**
     * 将指定相对路径的文档转换成 PDF，返回新的相对路径（带 /profile 前缀）
     */
    public static String convertToPdf(String relativePath) {
        if (StringUtils.isBlank(relativePath)) {
            return null;
        }
        DocumentConverter converter = getConverter();
        if (converter == null) {
            log.warn("未获取到DocumentConverter实例，跳过预览转换");
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
            converter.convert(inputFile).to(outputFile).execute();
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

    private static DocumentConverter getConverter() {
        try {
            return SpringUtils.getBean(DocumentConverter.class);
        } catch (Exception ex) {
            log.error("获取DocumentConverter失败，无法进行文档预览转换", ex);
            return null;
        }
    }
}
